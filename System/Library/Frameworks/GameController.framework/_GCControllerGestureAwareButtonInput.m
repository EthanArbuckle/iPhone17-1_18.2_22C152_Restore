@interface _GCControllerGestureAwareButtonInput
- (BOOL)_commitPendingValueOnQueue:(id)a3;
- (BOOL)_setValue:(float)a3 queue:(id)a4;
- (BOOL)inputDisabledBySystem;
- (BOOL)isDoublePressGestureRecognizerEnabled;
- (BOOL)isDoublePressMuted;
- (BOOL)isEnabled;
- (BOOL)isLongPressGestureRecognizerEnabled;
- (BOOL)isLongPressMuted;
- (BOOL)isSinglePressGestureRecognizerEnabled;
- (BOOL)isSinglePressMuted;
- (_GCControllerGestureAwareButtonInput)initWithDescriptionName:(id)a3;
- (float)doublePressInterval;
- (float)longPressInterval;
- (float)singlePressInterval;
- (id)doublePressHandler;
- (id)longPressHandler;
- (id)singlePressHandler;
- (int64_t)actualSystemGestureState;
- (int64_t)preferredSystemGestureState;
- (void)__onqueue_executeDoublePressRecognizerForEvent:(id)a3 queue:(id)a4;
- (void)__onqueue_executeLongPressRecognizerForEvent:(id)a3 queue:(id)a4;
- (void)__onqueue_executeSinglePressRecognizerForEvent:(id)a3 queue:(id)a4;
- (void)__onqueue_forwardEvent:(id)a3 queue:(id)a4;
- (void)registerSetValueEvent:(float)a3 queue:(id)a4;
- (void)setActualSystemGestureState:(int64_t)a3;
- (void)setDoublePressHandler:(id)a3;
- (void)setDoublePressInterval:(float)a3;
- (void)setDoublePressMuted:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setInputDisabledBySystem:(BOOL)a3;
- (void)setLongPressHandler:(id)a3;
- (void)setLongPressInterval:(float)a3;
- (void)setLongPressMuted:(BOOL)a3;
- (void)setPreferredSystemGestureState:(int64_t)a3;
- (void)setSinglePressHandler:(id)a3;
- (void)setSinglePressInterval:(float)a3;
- (void)setSinglePressMuted:(BOOL)a3;
- (void)setValue:(float)a3;
@end

@implementation _GCControllerGestureAwareButtonInput

- (_GCControllerGestureAwareButtonInput)initWithDescriptionName:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_GCControllerGestureAwareButtonInput;
  v3 = [(GCControllerButtonInput *)&v7 initWithDescriptionName:a3];
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    doublePressEventQueue = v3->_doublePressEventQueue;
    v3->_doublePressEventQueue = (NSMutableArray *)v4;

    v3->_longPressInterval = 0.5;
    v3->_singlePressInterval = 0.5;
    v3->_doublePressInterval = 0.5;
    v3->_longPressMuted = 0;
    v3->_doublePressMuted = 0;
    v3->_singlePressMuted = 0;
    v3->_enabled = 1;
    v3->_requiredDoublePressCount = 2;
  }
  return v3;
}

- (void)setActualSystemGestureState:(int64_t)a3
{
  self->_actualSystemGestureState = a3;
  self->_useActualSystemGestureState = 1;
}

- (BOOL)isSinglePressGestureRecognizerEnabled
{
  return !self->_singlePressMuted && self->_singlePressHandler != 0;
}

- (BOOL)isDoublePressGestureRecognizerEnabled
{
  return !self->_doublePressMuted && self->_doublePressHandler != 0;
}

- (BOOL)isLongPressGestureRecognizerEnabled
{
  return !self->_longPressMuted && self->_longPressHandler != 0;
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3) {
    self->_enabled = a3;
  }
}

- (void)setInputDisabledBySystem:(BOOL)a3
{
  if (self->_inputDisabledBySystem != a3)
  {
    BOOL v3 = a3;
    self->_inputDisabledBySystem = a3;
    if (gc_isInternalBuild())
    {
      v5 = getGCLogger();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        uint64_t v6 = [(GCControllerElement *)self localizedName];
        objc_super v7 = (void *)v6;
        v8 = @"enabled";
        if (v3) {
          v8 = @"disabled";
        }
        int v9 = 138412546;
        uint64_t v10 = v6;
        __int16 v11 = 2112;
        v12 = v8;
        _os_log_impl(&dword_220998000, v5, OS_LOG_TYPE_INFO, "Gesture aware %@ %@ by the system", (uint8_t *)&v9, 0x16u);
      }
    }
  }
}

- (BOOL)inputDisabledBySystem
{
  return self->_inputDisabledBySystem;
}

- (int64_t)actualSystemGestureState
{
  if ([(_GCControllerGestureAwareButtonInput *)self isDoublePressGestureRecognizerEnabled]|| [(_GCControllerGestureAwareButtonInput *)self isSinglePressGestureRecognizerEnabled])
  {
    int v3 = 0;
  }
  else
  {
    int v3 = ![(_GCControllerGestureAwareButtonInput *)self isLongPressGestureRecognizerEnabled];
  }
  uint64_t v4 = [(GCControllerElement *)self device];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  objc_super v7 = v6;
  if (v6
    && (([v6 isSnapshot] | v3) & 1) == 0
    && self->_enabled
    && ![(_GCControllerGestureAwareButtonInput *)self inputDisabledBySystem])
  {
    if (self->_useActualSystemGestureState) {
      int64_t actualSystemGestureState = self->_actualSystemGestureState;
    }
    else {
      int64_t actualSystemGestureState = [(_GCControllerGestureAwareButtonInput *)self preferredSystemGestureState];
    }
  }
  else
  {
    int64_t actualSystemGestureState = 2;
  }

  return actualSystemGestureState;
}

- (void)setPreferredSystemGestureState:(int64_t)a3
{
  if (self->_preferredSystemGestureState != a3)
  {
    self->_int64_t preferredSystemGestureState = a3;
    id v10 = [(GCControllerElement *)self device];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v4 = v10;
    }
    else {
      uint64_t v4 = 0;
    }
    id v5 = v4;
    id v6 = [v5 systemGestureComponent];

    if (v6)
    {
      int64_t preferredSystemGestureState = self->_preferredSystemGestureState;
      v8 = [v5 systemGestureComponent];
      int v9 = [(GCControllerElement *)self primaryAlias];
      if (preferredSystemGestureState == 2) {
        [v8 disableSystemGestureForInput:v9];
      }
      else {
        [v8 enableSystemGestureForInput:v9];
      }
    }
  }
}

- (int64_t)preferredSystemGestureState
{
  return self->_preferredSystemGestureState;
}

- (BOOL)_setValue:(float)a3 queue:(id)a4
{
  id v6 = a4;
  float v7 = clamp(a3, 0.0, 1.0);
  self->_realValue = v7;
  int64_t v8 = [(_GCControllerGestureAwareButtonInput *)self actualSystemGestureState];
  if (v8 != 2)
  {
    if (v8 != 1)
    {
      if (!v8)
      {
        *(float *)&double v9 = a3;
        [(_GCControllerGestureAwareButtonInput *)self registerSetValueEvent:v6 queue:v9];
      }
      goto LABEL_7;
    }
    *(float *)&double v9 = a3;
    [(_GCControllerGestureAwareButtonInput *)self registerSetValueEvent:v6 queue:v9];
    v16 = self;
    v17 = _GCControllerGestureAwareButtonInput;
    __int16 v11 = &v16;
LABEL_9:
    *(float *)&double v10 = a3;
    unsigned __int8 v12 = objc_msgSendSuper2((objc_super *)v11, sel__setValue_queue_, v6, v10, v14, v15, v16, v17);
    goto LABEL_10;
  }
  if (![(_GCControllerGestureAwareButtonInput *)self inputDisabledBySystem])
  {
    v14 = self;
    v15 = _GCControllerGestureAwareButtonInput;
    __int16 v11 = &v14;
    goto LABEL_9;
  }
LABEL_7:
  unsigned __int8 v12 = 0;
LABEL_10:

  return v12;
}

- (void)setValue:(float)a3
{
  id v5 = [(GCControllerElement *)self device];
  if (!v5)
  {
    id v6 = &_dispatch_main_q;
    id v8 = &_dispatch_main_q;
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([v5 isSnapshot])
  {
    id v6 = [v5 handlerQueue];
LABEL_6:
    v9.receiver = self;
    v9.super_class = (Class)_GCControllerGestureAwareButtonInput;
    *(float *)&double v7 = a3;
    [(GCControllerButtonInput *)&v9 _setValue:v6 queue:v7];
  }
}

- (BOOL)_commitPendingValueOnQueue:(id)a3
{
  id v4 = a3;
  if ([(GCControllerElement *)self updatePending])
  {
    [(GCControllerElement *)self pendingValue];
    if (v5 == self->_realValue)
    {
      BOOL v6 = 0;
    }
    else
    {
      [(GCControllerElement *)self pendingValue];
      BOOL v6 = -[_GCControllerGestureAwareButtonInput _setValue:queue:](self, "_setValue:queue:", v4);
    }
    [(GCControllerElement *)self _resetPendingValue];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)registerSetValueEvent:(float)a3 queue:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  if (gc_isInternalBuild())
  {
    id v8 = getGCLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      double v15 = a3;
      _os_log_impl(&dword_220998000, v8, OS_LOG_TYPE_INFO, "[GESTURE] registerSetValueEvent: %f", buf, 0xCu);
    }
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __68___GCControllerGestureAwareButtonInput_registerSetValueEvent_queue___block_invoke;
  block[3] = &unk_26D22C200;
  objc_copyWeak(&v11, &location);
  float v12 = a3;
  block[4] = self;
  id v10 = v6;
  double v7 = v6;
  dispatch_async(v7, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)__onqueue_forwardEvent:(id)a3 queue:(id)a4
{
  id v6 = (unsigned __int8 *)a3;
  id v7 = a4;
  if (![(_GCControllerGestureAwareButtonInput *)self actualSystemGestureState]
    && !v6[17]
    && v6[20]
    && v6[19]
    && v6[21])
  {
    v6[17] = 1;
    if (gc_isInternalBuild())
    {
      id v11 = getGCLogger();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v12 = v6[16];
        *(_DWORD *)buf = 67109120;
        int v15 = v12;
        _os_log_impl(&dword_220998000, v11, OS_LOG_TYPE_INFO, "[GESTURE] Forward event with value: %d", buf, 8u);
      }
    }
    double v8 = 0.0;
    if (v6[16]) {
      *(float *)&double v8 = 1.0;
    }
    v13.receiver = self;
    v13.super_class = (Class)_GCControllerGestureAwareButtonInput;
    if ([(GCControllerButtonInput *)&v13 _setValue:v7 queue:v8])
    {
      objc_super v9 = [(GCControllerElement *)self device];
      id v10 = [v9 physicalInputProfile];
      [v10 _triggerValueChangedHandlerForElement:self queue:v7];
    }
  }
}

- (void)__onqueue_executeDoublePressRecognizerForEvent:(id)a3 queue:(id)a4
{
  id v6 = (unsigned __int8 *)a3;
  os_log_t v7 = (os_log_t)a4;
  uint64_t v8 = [(NSMutableArray *)self->_doublePressEventQueue lastObject];
  objc_super v9 = (void *)v8;
  if (!v8 || *(unsigned __int8 *)(v8 + 16) != v6[16])
  {
    [(NSMutableArray *)self->_doublePressEventQueue addObject:v6];
    [(_GCControllerGestureAwareButtonInput *)self doublePressInterval];
    dispatch_time_t v11 = dispatch_time(0, (uint64_t)(float)(v10 * 1000000000.0));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __93___GCControllerGestureAwareButtonInput___onqueue_executeDoublePressRecognizerForEvent_queue___block_invoke;
    block[3] = &unk_26D22B618;
    v55 = v6;
    v56 = self;
    v57 = v7;
    dispatch_after(v11, v57, block);

    int v12 = +[NSDate date];
    [v12 timeIntervalSince1970];
    double v14 = v13;

    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    int v15 = self->_doublePressEventQueue;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v50 objects:v63 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      v43 = v9;
      os_log_t log = v7;
      v42 = v6;
      int v18 = 0;
      uint64_t v19 = *(void *)v51;
      while (2)
      {
        uint64_t v20 = 0;
        int v21 = v18 + v17;
        do
        {
          if (*(void *)v51 != v19) {
            objc_enumerationMutation(v15);
          }
          uint64_t v22 = *(void *)(*((void *)&v50 + 1) + 8 * v20);
          double v23 = v14 - *(double *)(v22 + 8);
          [(_GCControllerGestureAwareButtonInput *)self doublePressInterval];
          if (v23 < v24)
          {
            int v21 = v18 + v20;
            goto LABEL_13;
          }
          *(unsigned char *)(v22 + 20) = 1;
          ++v20;
        }
        while (v17 != v20);
        uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v50 objects:v63 count:16];
        int v18 = v21;
        if (v17) {
          continue;
        }
        break;
      }
LABEL_13:

      os_log_t v7 = log;
      id v6 = v42;
      objc_super v9 = v43;
      if (v21 >= 1) {
        -[NSMutableArray removeObjectsInRange:](self->_doublePressEventQueue, "removeObjectsInRange:", 0, v21);
      }
    }
    else
    {
    }
    if ([(NSMutableArray *)self->_doublePressEventQueue count])
    {
      v25 = [(NSMutableArray *)self->_doublePressEventQueue firstObject];
      int v26 = v25[16];

      if ([(NSMutableArray *)self->_doublePressEventQueue count])
      {
        unint64_t v27 = 0;
        int v28 = 0;
        while (1)
        {
          v29 = [(NSMutableArray *)self->_doublePressEventQueue objectAtIndexedSubscript:v27];
          if (v26 && !v29[16]) {
            ++v28;
          }
          if (v28 == self->_requiredDoublePressCount) {
            break;
          }
          int v26 = v29[16];

          if ([(NSMutableArray *)self->_doublePressEventQueue count] <= ++v27) {
            goto LABEL_45;
          }
        }
        v44 = v9;

        if ([(NSMutableArray *)self->_doublePressEventQueue count] > (unint64_t)v27)
        {
          unint64_t v30 = v27;
          do
          {
            v31 = [(NSMutableArray *)self->_doublePressEventQueue objectAtIndexedSubscript:v27];
            v31[18] = 0;
            if (gc_isInternalBuild())
            {
              loga = getGCLogger();
              if (os_log_type_enabled(loga, OS_LOG_TYPE_INFO))
              {
                int v32 = v31[18];
                *(_DWORD *)buf = 138412546;
                v60 = v31;
                __int16 v61 = 1024;
                int v62 = v32;
                _os_log_impl(&dword_220998000, loga, OS_LOG_TYPE_INFO, "[CLEAR] %@ tentativeSinglePress resetting to %d", buf, 0x12u);
              }
            }
            ++v30;
          }
          while ([(NSMutableArray *)self->_doublePressEventQueue count] > v30);
        }
        v33 = v7;
        if (gc_isInternalBuild())
        {
          v39 = getGCLogger();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_220998000, v39, OS_LOG_TYPE_INFO, "[GESTURE] Multi press recognized, draining event queue", buf, 2u);
          }
        }
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        v34 = self->_doublePressEventQueue;
        uint64_t v35 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v46 objects:v58 count:16];
        if (v35)
        {
          uint64_t v36 = v35;
          uint64_t v37 = *(void *)v47;
          do
          {
            for (uint64_t i = 0; i != v36; ++i)
            {
              if (*(void *)v47 != v37) {
                objc_enumerationMutation(v34);
              }
              if (self->_doublePressHandler) {
                *(unsigned char *)(*(void *)(*((void *)&v46 + 1) + 8 * i) + 17) = 1;
              }
            }
            uint64_t v36 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v46 objects:v58 count:16];
          }
          while (v36);
        }

        [(NSMutableArray *)self->_doublePressEventQueue removeAllObjects];
        os_log_t v7 = v33;
        objc_super v9 = v44;
        if (self->_doublePressHandler)
        {
          v45[0] = _NSConcreteStackBlock;
          v45[1] = 3221225472;
          v45[2] = __93___GCControllerGestureAwareButtonInput___onqueue_executeDoublePressRecognizerForEvent_queue___block_invoke_116;
          v45[3] = &unk_26D22A8C0;
          v45[4] = self;
          dispatch_async((dispatch_queue_t)&_dispatch_main_q, v45);
        }
      }
    }
  }
LABEL_45:
}

- (void)__onqueue_executeLongPressRecognizerForEvent:(id)a3 queue:(id)a4
{
  os_log_t v7 = (double *)a3;
  uint64_t v8 = a4;
  p_longPressDownEvent = &self->_longPressDownEvent;
  longPressDownEvent = self->_longPressDownEvent;
  if (longPressDownEvent)
  {
    if (!*((unsigned char *)v7 + 16))
    {
      double v11 = v7[1] - longPressDownEvent->timestamp;
      [(_GCControllerGestureAwareButtonInput *)self longPressInterval];
      double v13 = *p_longPressDownEvent;
      if (v11 <= v12)
      {
        v13->ignoredByLongPressRecognizer = 1;
        *((unsigned char *)v7 + 19) = 1;
        if (*((unsigned char *)v7 + 17) || !*((unsigned char *)v7 + 18) || !*((unsigned char *)v7 + 20))
        {
          if (gc_isInternalBuild())
          {
            int v21 = getGCLogger();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              BOOL pressed = (*p_longPressDownEvent)->pressed;
              *(_DWORD *)buf = 67109120;
              BOOL v35 = pressed;
              _os_log_impl(&dword_220998000, v21, OS_LOG_TYPE_INFO, "[GESTURE] Attempt forward event with value: %d (rejected long press)", buf, 8u);
            }
          }
          [(_GCControllerGestureAwareButtonInput *)self __onqueue_forwardEvent:*p_longPressDownEvent queue:v8];
          dispatch_time_t v19 = dispatch_time(0, (uint64_t)(v11 * 1000000000.0));
          v25[0] = _NSConcreteStackBlock;
          v25[1] = 3221225472;
          v25[2] = __91___GCControllerGestureAwareButtonInput___onqueue_executeLongPressRecognizerForEvent_queue___block_invoke_120;
          v25[3] = &unk_26D22B618;
          int v26 = v7;
          unint64_t v27 = self;
          int v28 = v8;
          dispatch_after(v19, v28, v25);

          goto LABEL_20;
        }
        *((unsigned char *)v7 + 17) = 1;
        (*p_longPressDownEvent)->BOOL consumed = 1;
        if (!self->_singlePressHandler)
        {
LABEL_20:
          int v18 = *p_longPressDownEvent;
          *p_longPressDownEvent = 0;
          goto LABEL_21;
        }
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = __91___GCControllerGestureAwareButtonInput___onqueue_executeLongPressRecognizerForEvent_queue___block_invoke_119;
        v29[3] = &unk_26D22A8C0;
        v29[4] = self;
        uint64_t v20 = v29;
      }
      else
      {
        BOOL consumed = v13->consumed;
        int isInternalBuild = gc_isInternalBuild();
        if (consumed)
        {
          if (isInternalBuild)
          {
            double v23 = getGCLogger();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_220998000, v23, OS_LOG_TYPE_INFO, "[GESTURE] Long press recognized (already triggered due to time elapsed)", buf, 2u);
            }
          }
          *((unsigned char *)v7 + 17) = 1;
          goto LABEL_20;
        }
        if (isInternalBuild)
        {
          float v24 = getGCLogger();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_220998000, v24, OS_LOG_TYPE_INFO, "[GESTURE] Long press recognized", buf, 2u);
          }
        }
        (*p_longPressDownEvent)->BOOL consumed = 1;
        *((unsigned char *)v7 + 17) = 1;
        if (!self->_longPressHandler) {
          goto LABEL_20;
        }
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = __91___GCControllerGestureAwareButtonInput___onqueue_executeLongPressRecognizerForEvent_queue___block_invoke_118;
        v30[3] = &unk_26D22A8C0;
        v30[4] = self;
        uint64_t v20 = v30;
      }
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v20);
      goto LABEL_20;
    }
  }
  else if (*((unsigned char *)v7 + 16))
  {
    objc_storeStrong((id *)&self->_longPressDownEvent, a3);
    [(_GCControllerGestureAwareButtonInput *)self longPressInterval];
    dispatch_time_t v17 = dispatch_time(0, (uint64_t)(float)(v16 * 1000000000.0));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __91___GCControllerGestureAwareButtonInput___onqueue_executeLongPressRecognizerForEvent_queue___block_invoke;
    block[3] = &unk_26D22A8E8;
    int v32 = v7;
    v33 = self;
    dispatch_after(v17, v8, block);
    int v18 = (_GCSetValueEvent *)v32;
LABEL_21:
  }
}

- (void)__onqueue_executeSinglePressRecognizerForEvent:(id)a3 queue:(id)a4
{
  os_log_t v7 = (double *)a3;
  id v8 = a4;
  p_singlePressDownEvent = &self->_singlePressDownEvent;
  singlePressDownEvent = self->_singlePressDownEvent;
  if (singlePressDownEvent)
  {
    if (!*((unsigned char *)v7 + 16))
    {
      if (!*((unsigned char *)v7 + 17))
      {
        double v11 = v7[1] - singlePressDownEvent->timestamp;
        [(_GCControllerGestureAwareButtonInput *)self singlePressInterval];
        if (v11 >= v12)
        {
          (*p_singlePressDownEvent)->ignoredBySinglePressRecognizer = 1;
          *((unsigned char *)v7 + 21) = 1;
          if (gc_isInternalBuild())
          {
            float v16 = getGCLogger();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              BOOL pressed = (*p_singlePressDownEvent)->pressed;
              *(_DWORD *)buf = 67109120;
              BOOL v24 = pressed;
              _os_log_impl(&dword_220998000, v16, OS_LOG_TYPE_INFO, "[GESTURE] Attempt forward event with value: %d (rejected single press)", buf, 8u);
            }
          }
          [(_GCControllerGestureAwareButtonInput *)self __onqueue_forwardEvent:*p_singlePressDownEvent queue:v8];
          dispatch_time_t v13 = dispatch_time(0, (uint64_t)(v11 * 1000000000.0));
          v18[0] = _NSConcreteStackBlock;
          v18[1] = 3221225472;
          v18[2] = __93___GCControllerGestureAwareButtonInput___onqueue_executeSinglePressRecognizerForEvent_queue___block_invoke_121;
          v18[3] = &unk_26D22B618;
          dispatch_time_t v19 = v7;
          uint64_t v20 = self;
          int v21 = v8;
          dispatch_after(v13, v21, v18);
        }
        else
        {
          if (gc_isInternalBuild())
          {
            int v15 = getGCLogger();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_220998000, v15, OS_LOG_TYPE_INFO, "[GESTURE] Single press recognized", buf, 2u);
            }
          }
          if (*((unsigned char *)v7 + 20) && *((unsigned char *)v7 + 19))
          {
            (*p_singlePressDownEvent)->BOOL consumed = 1;
            *((unsigned char *)v7 + 17) = 1;
            if (self->_singlePressHandler)
            {
              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472;
              block[2] = __93___GCControllerGestureAwareButtonInput___onqueue_executeSinglePressRecognizerForEvent_queue___block_invoke;
              block[3] = &unk_26D22A8C0;
              void block[4] = self;
              dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
            }
          }
          else
          {
            *((unsigned char *)v7 + 18) = 1;
          }
        }
      }
      double v14 = *p_singlePressDownEvent;
      *p_singlePressDownEvent = 0;
    }
  }
  else if (*((unsigned char *)v7 + 16))
  {
    objc_storeStrong((id *)&self->_singlePressDownEvent, a3);
  }
}

- (float)longPressInterval
{
  return self->_longPressInterval;
}

- (void)setLongPressInterval:(float)a3
{
  self->_longPressInterval = a3;
}

- (float)singlePressInterval
{
  return self->_singlePressInterval;
}

- (void)setSinglePressInterval:(float)a3
{
  self->_singlePressInterval = a3;
}

- (float)doublePressInterval
{
  return self->_doublePressInterval;
}

- (void)setDoublePressInterval:(float)a3
{
  self->_doublePressInterval = a3;
}

- (id)longPressHandler
{
  return self->_longPressHandler;
}

- (void)setLongPressHandler:(id)a3
{
}

- (id)doublePressHandler
{
  return self->_doublePressHandler;
}

- (void)setDoublePressHandler:(id)a3
{
}

- (id)singlePressHandler
{
  return self->_singlePressHandler;
}

- (void)setSinglePressHandler:(id)a3
{
}

- (BOOL)isLongPressMuted
{
  return self->_longPressMuted;
}

- (void)setLongPressMuted:(BOOL)a3
{
  self->_longPressMuted = a3;
}

- (BOOL)isDoublePressMuted
{
  return self->_doublePressMuted;
}

- (void)setDoublePressMuted:(BOOL)a3
{
  self->_doublePressMuted = a3;
}

- (BOOL)isSinglePressMuted
{
  return self->_singlePressMuted;
}

- (void)setSinglePressMuted:(BOOL)a3
{
  self->_singlePressMuted = a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_singlePressHandler, 0);
  objc_storeStrong(&self->_doublePressHandler, 0);
  objc_storeStrong(&self->_longPressHandler, 0);
  objc_storeStrong((id *)&self->_singlePressDownEvent, 0);
  objc_storeStrong((id *)&self->_longPressDownEvent, 0);

  objc_storeStrong((id *)&self->_doublePressEventQueue, 0);
}

@end