@interface GCKeyboardAndMouseEmulatedController
- (float)findDeltaFor:(float)a3;
- (id)elementForInput:(int64_t)a3;
- (id)initEmulatedControllerWithMapping:(int)a3 windowManager:(id)a4;
- (id)nameForEventInput:(int64_t)a3;
- (id)readButtonsInfoFromLocalFiles;
- (id)readConfigFromLocalFiles;
- (id)readLeftThumbstickSensitivityFromLocalFiles;
- (id)tryReadPropertiesFromLocalFiles;
- (int)emulatedControllerMapping;
- (int64_t)eventInputForName:(id)a3;
- (unint64_t)mouseSensitivity;
- (void)addDevice:(id)a3;
- (void)remapControlsWith:(id)a3;
- (void)removeDevice:(id)a3;
- (void)renameButtonForInput:(int64_t)a3 withKey:(id)a4;
- (void)setEmulatedControllerMapping:(int)a3;
- (void)setMouseSensitivity:(unint64_t)a3;
- (void)setupButtons;
- (void)setupConfig;
- (void)setupLeftThumbstickSensitivity;
- (void)startKeyboardEventsListening;
- (void)startLeftThumbstickTimer;
- (void)startMouseIdleTimer;
- (void)updateWithKeyKey:(int64_t)a3 down:(BOOL)a4;
@end

@implementation GCKeyboardAndMouseEmulatedController

- (void)setEmulatedControllerMapping:(int)a3
{
  self->_emulatedControllerMapping = a3;
  defaultMapping(a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(GCKeyboardAndMouseEmulatedController *)self remapControlsWith:v4];
}

- (int64_t)eventInputForName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqual:@"DpadUp"])
  {
    int64_t v4 = 0;
  }
  else if ([v3 isEqual:@"DpadDown"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqual:@"DpadLeft"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqual:@"DpadRight"])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqual:@"ButtonA"])
  {
    int64_t v4 = 4;
  }
  else if ([v3 isEqual:@"ButtonB"])
  {
    int64_t v4 = 5;
  }
  else if ([v3 isEqual:@"ButtonX"])
  {
    int64_t v4 = 6;
  }
  else if ([v3 isEqual:@"ButtonY"])
  {
    int64_t v4 = 7;
  }
  else if ([v3 isEqual:@"LeftShoulder"])
  {
    int64_t v4 = 8;
  }
  else if ([v3 isEqual:@"RightShoulder"])
  {
    int64_t v4 = 9;
  }
  else if ([v3 isEqual:@"LeftThumbstickUp"])
  {
    int64_t v4 = 10;
  }
  else if ([v3 isEqual:@"LeftThumbstickDown"])
  {
    int64_t v4 = 11;
  }
  else if ([v3 isEqual:@"LeftThumbstickLeft"])
  {
    int64_t v4 = 12;
  }
  else if ([v3 isEqual:@"LeftThumbstickRight"])
  {
    int64_t v4 = 13;
  }
  else if ([v3 isEqual:@"RightThumbstickUp"])
  {
    int64_t v4 = 14;
  }
  else if ([v3 isEqual:@"RightThumbstickDown"])
  {
    int64_t v4 = 15;
  }
  else if ([v3 isEqual:@"RightThumbstickLeft"])
  {
    int64_t v4 = 16;
  }
  else if ([v3 isEqual:@"RightThumbstickRight"])
  {
    int64_t v4 = 17;
  }
  else if ([v3 isEqual:@"LeftTrigger"])
  {
    int64_t v4 = 18;
  }
  else if ([v3 isEqual:@"RightTrigger"])
  {
    int64_t v4 = 19;
  }
  else if ([v3 isEqual:@"LeftThumbstickButton"])
  {
    int64_t v4 = 20;
  }
  else if ([v3 isEqual:@"RightThumbstickButton"])
  {
    int64_t v4 = 21;
  }
  else if ([v3 isEqual:@"ButtonHome"])
  {
    int64_t v4 = 22;
  }
  else if ([v3 isEqual:@"ButtonMenu"])
  {
    int64_t v4 = 23;
  }
  else if ([v3 isEqual:@"ButtonOptions"])
  {
    int64_t v4 = 24;
  }
  else
  {
    int64_t v4 = 47;
  }

  return v4;
}

- (id)nameForEventInput:(int64_t)a3
{
  if ((unint64_t)a3 > 0x18) {
    return &stru_26D27BBB8;
  }
  else {
    return off_26D22CEE8[a3];
  }
}

- (id)elementForInput:(int64_t)a3
{
  int64_t v4 = [(GCController *)self extendedGamepad];
  v5 = [v4 remappedElementForIndex:a3];

  return v5;
}

- (void)renameButtonForInput:(int64_t)a3 withKey:(id)a4
{
  id v8 = a4;
  v6 = [(GCKeyboardAndMouseEmulatedController *)self elementForInput:a3];
  v7 = v6;
  if (v6) {
    [v6 setUnmappedLocalizedName:v8];
  }
}

- (float)findDeltaFor:(float)a3
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  int64_t v4 = self->_leftThumbstickSensitivity;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    float v8 = 0.0;
    float v9 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (v8 <= a3)
        {
          objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "value", (void)v16);
          if (v12 >= a3)
          {
            [v11 delta];
            float v9 = v13;
          }
        }
        objc_msgSend(v11, "value", (void)v16);
        float v8 = v14;
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
  else
  {
    float v9 = 0.0;
  }

  return v9;
}

- (void)startLeftThumbstickTimer
{
  leftThumbstickTimer = self->_leftThumbstickTimer;
  if (leftThumbstickTimer)
  {
    int64_t v4 = leftThumbstickTimer;
    timerQueue = self->_timerQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __64__GCKeyboardAndMouseEmulatedController_startLeftThumbstickTimer__block_invoke;
    block[3] = &unk_26D22A8C0;
    float v12 = v4;
    uint64_t v6 = v4;
    dispatch_async(timerQueue, block);
  }
  uint64_t v7 = self->_timerQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __64__GCKeyboardAndMouseEmulatedController_startLeftThumbstickTimer__block_invoke_2;
  v10[3] = &unk_26D22A8C0;
  v10[4] = self;
  createDispatchTimer(0x1FCA058uLL, 0x32DCD5uLL, v7, v10);
  float v8 = (OS_dispatch_source *)objc_claimAutoreleasedReturnValue();
  float v9 = self->_leftThumbstickTimer;
  self->_leftThumbstickTimer = v8;
}

void __64__GCKeyboardAndMouseEmulatedController_startLeftThumbstickTimer__block_invoke(uint64_t a1)
{
}

void __64__GCKeyboardAndMouseEmulatedController_startLeftThumbstickTimer__block_invoke_2(uint64_t a1)
{
  v2 = *(double **)(a1 + 32);
  double v3 = v2[40];
  float v4 = v3;
  float v5 = v2[41];
  *(float *)&double v3 = fabsf(v4);
  [v2 findDeltaFor:v3];
  float v7 = v6;
  *(float *)&double v8 = fabsf(v5);
  [*(id *)(a1 + 32) findDeltaFor:v8];
  float v10 = v9;
  [*(id *)(*(void *)(a1 + 32) + 304) left];
  v11 = *(void **)(*(void *)(a1 + 32) + 304);
  if (v12 <= 0.0)
  {
    [v11 right];
    if (v15 <= 0.0)
    {
      float v17 = *(float *)(*(void *)(a1 + 32) + 276);
      float v18 = fmaxf(v4 - v17, 0.0);
      float v19 = v17 + v4;
      if (v19 > 0.0) {
        float v19 = 0.0;
      }
      if (v4 < 0.0) {
        float v14 = v19;
      }
      else {
        float v14 = v18;
      }
    }
    else
    {
      [*(id *)(*(void *)(a1 + 32) + 304) right];
      float v14 = v4 + (float)(v7 * v16);
    }
  }
  else
  {
    [v11 left];
    float v14 = v4 - (float)(v7 * v13);
  }
  [*(id *)(*(void *)(a1 + 32) + 304) up];
  v20 = *(void **)(*(void *)(a1 + 32) + 304);
  if (v21 <= 0.0)
  {
    [v20 down];
    if (v24 <= 0.0)
    {
      float v26 = *(float *)(*(void *)(a1 + 32) + 276);
      float v27 = fmaxf(v5 - v26, 0.0);
      float v23 = v26 + v5;
      if (v23 > 0.0) {
        float v23 = 0.0;
      }
      if (v5 >= 0.0) {
        float v23 = v27;
      }
    }
    else
    {
      [*(id *)(*(void *)(a1 + 32) + 304) down];
      float v23 = v5 - (float)(v10 * v25);
    }
  }
  else
  {
    [v20 up];
    float v23 = v5 + (float)(v10 * v22);
  }
  double v28 = v14;
  double v29 = v23;
  float v30 = sqrt(v29 * v29 + v28 * v28);
  if (v30 > 1.0)
  {
    double v31 = v30;
    double v28 = v28 / v31;
    double v29 = v29 / v31;
  }
  v32 = (double *)(*(void *)(a1 + 32) + 320);
  if (*v32 != v28 || *(double *)(*(void *)(a1 + 32) + 328) != v29)
  {
    double *v32 = v28;
    v32[1] = v29;
    BOOL v34 = v28 < 0.0;
    if (v28 < 0.0) {
      double v35 = 0.0;
    }
    else {
      double v35 = v28;
    }
    *(float *)&double v35 = v35;
    double v36 = -v28;
    if (v34) {
      double v37 = v36;
    }
    else {
      double v37 = 0.0;
    }
    [*(id *)(*(void *)(a1 + 32) + 368) setLeftThumbstickRight:v35];
    *(float *)&double v38 = v37;
    [*(id *)(*(void *)(a1 + 32) + 368) setLeftThumbstickLeft:v38];
    if (v29 < 0.0) {
      double v39 = 0.0;
    }
    else {
      double v39 = v29;
    }
    *(float *)&double v39 = v39;
    if (v29 >= 0.0) {
      double v40 = 0.0;
    }
    else {
      double v40 = -v29;
    }
    [*(id *)(*(void *)(a1 + 32) + 368) setLeftThumbstickUp:v39];
    *(float *)&double v41 = v40;
    [*(id *)(*(void *)(a1 + 32) + 368) setLeftThumbstickDown:v41];
    id v42 = [*(id *)(a1 + 32) extendedGamepad];
    [v42 handleGamepadEvent:*(void *)(*(void *)(a1 + 32) + 368)];
  }
}

- (void)startMouseIdleTimer
{
  mouseIdleTimer = self->_mouseIdleTimer;
  if (mouseIdleTimer)
  {
    float v4 = mouseIdleTimer;
    timerQueue = self->_timerQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __59__GCKeyboardAndMouseEmulatedController_startMouseIdleTimer__block_invoke;
    block[3] = &unk_26D22A8C0;
    float v13 = v4;
    float v6 = v4;
    dispatch_async(timerQueue, block);
  }
  atomic_store(0, (unsigned __int8 *)&self->_dirtyPointer);
  float mouseReleaseTime = self->_mouseReleaseTime;
  double v8 = self->_timerQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __59__GCKeyboardAndMouseEmulatedController_startMouseIdleTimer__block_invoke_2;
  v11[3] = &unk_26D22A8C0;
  v11[4] = self;
  createDispatchTimer((unint64_t)(float)(mouseReleaseTime * 1000000000.0), (unint64_t)(float)((float)(mouseReleaseTime / 60.0) * 1000000000.0), v8, v11);
  float v9 = (OS_dispatch_source *)objc_claimAutoreleasedReturnValue();
  float v10 = self->_mouseIdleTimer;
  self->_mouseIdleTimer = v9;
}

void __59__GCKeyboardAndMouseEmulatedController_startMouseIdleTimer__block_invoke(uint64_t a1)
{
}

void __59__GCKeyboardAndMouseEmulatedController_startMouseIdleTimer__block_invoke_2(uint64_t a1)
{
  unsigned __int8 v1 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 32) + 344));
  uint64_t v2 = *(void *)(a1 + 32);
  if (v1)
  {
    atomic_store(0, (unsigned __int8 *)(v2 + 344));
  }
  else
  {
    double v3 = (CGPoint *)(v2 + 352);
    double y = v3->y;
    if (v3->x != CGPointZero.x || y != CGPointZero.y)
    {
      *double v3 = CGPointZero;
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 368), "setRightThumbstickUp:", 0.0, y);
      [*(id *)(*(void *)(a1 + 32) + 368) setRightThumbstickDown:0.0];
      [*(id *)(*(void *)(a1 + 32) + 368) setRightThumbstickLeft:0.0];
      [*(id *)(*(void *)(a1 + 32) + 368) setRightThumbstickRight:0.0];
      id v7 = [*(id *)(a1 + 32) extendedGamepad];
      [v7 handleGamepadEvent:*(void *)(*(void *)(a1 + 32) + 368)];
    }
  }
}

- (void)setupButtons
{
  double v3 = [(NSDictionary *)self->_mapping objectForKeyedSubscript:@"Buttons"];
  buttons = self->_buttons;
  self->_buttons = v3;

  objc_opt_class();

  objc_opt_isKindOfClass();
}

- (void)setupConfig
{
  id v14 = [(NSDictionary *)self->_mapping objectForKeyedSubscript:@"Config"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v3 = [v14 objectForKeyedSubscript:@"mouseThumbstick"];
    self->_mouseThumbstick = [v3 BOOLValue];

    float v4 = [v14 objectForKeyedSubscript:@"mouseReleaseTime"];
    [v4 floatValue];
    self->_float mouseReleaseTime = v5;

    float v6 = [v14 objectForKeyedSubscript:@"mouseSensitivityLow"];
    [v6 floatValue];
    self->_mouseSensitivityLow = v7;

    double v8 = [v14 objectForKeyedSubscript:@"mouseSensitivityHigh"];
    [v8 floatValue];
    self->_mouseSensitivityHigh = v9;

    float v10 = [v14 objectForKeyedSubscript:@"keyboardFalloffTime"];
    [v10 floatValue];
    float v12 = v11;

    self->_keyboardFalloffValue = 0.033333 / v12;
    float v13 = [v14 objectForKeyedSubscript:@"immediateLeftThumbstickMode"];
    self->_immediateLeftThumbstickMode = [v13 BOOLValue];

    [(GCKeyboardControllerWindowManager *)self->_windowManager setEnablePointerCapture:self->_mouseThumbstick];
  }
}

- (void)setupLeftThumbstickSensitivity
{
  double v3 = [(NSDictionary *)self->_mapping objectForKeyedSubscript:@"LeftThumbstickSensitivity"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    float v6 = +[NSMutableArray array];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v7 = v3;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v31;
      float v11 = 0.0;
      float v12 = 0.0;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v31 != v10) {
            objc_enumerationMutation(v7);
          }
          id v14 = *(void **)(*((void *)&v30 + 1) + 8 * v13);
          if (v14)
          {
            float v15 = objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * v13), "objectAtIndexedSubscript:", 0, (void)v30);
            [v15 floatValue];
            float v17 = v16;

            float v18 = [v14 objectAtIndexedSubscript:1];
            [v18 floatValue];
            float v20 = v19;

            *(float *)&double v21 = (float)((float)(v17 - v12) / (float)(v20 - v11)) * 0.033333;
            *(float *)&double v22 = v17;
            float v23 = +[LinearPiece pieceWithValue:v22 delta:v21];
            [(NSArray *)v6 addObject:v23];

            float v11 = v20;
            float v12 = v17;
          }
          ++v13;
        }
        while (v9 != v13);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v9);
    }

    leftThumbstickSensitivitdouble y = self->_leftThumbstickSensitivity;
    self->_leftThumbstickSensitivitdouble y = v6;
  }
  else
  {
    LODWORD(v4) = 1045220557;
    LODWORD(v5) = 1045220557;
    leftThumbstickSensitivitdouble y = +[LinearPiece pieceWithValue:v4 delta:v5];
    LODWORD(v25) = 1050253722;
    LODWORD(v26) = 1.0;
    float v27 = +[LinearPiece pieceWithValue:v26 delta:v25];
    v35[0] = leftThumbstickSensitivity;
    v35[1] = v27;
    double v28 = +[NSArray arrayWithObjects:v35 count:2];
    double v29 = self->_leftThumbstickSensitivity;
    self->_leftThumbstickSensitivitdouble y = v28;
  }
}

- (void)startKeyboardEventsListening
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __68__GCKeyboardAndMouseEmulatedController_startKeyboardEventsListening__block_invoke;
  v4[3] = &unk_26D22CE78;
  v4[4] = self;
  uint64_t v2 = +[GCKeyboard coalescedKeyboard];
  double v3 = [v2 keyboardInput];
  [v3 setKeyChangedHandlerPrivate:v4];
}

_DWORD *__68__GCKeyboardAndMouseEmulatedController_startKeyboardEventsListening__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  result = *(_DWORD **)(a1 + 32);
  if (result[94]) {
    return (_DWORD *)[result updateWithKeyKey:a4 down:a5];
  }
  return result;
}

- (void)remapControlsWith:(id)a3
{
  id v9 = a3;
  objc_storeStrong((id *)&self->_mapping, a3);
  [(GCKeyboardAndMouseEmulatedController *)self setupButtons];
  [(GCKeyboardAndMouseEmulatedController *)self setupConfig];
  [(GCKeyboardAndMouseEmulatedController *)self setupLeftThumbstickSensitivity];
  double v5 = (LeftThumbstickState *)objc_opt_new();
  leftThumbstickState = self->_leftThumbstickState;
  self->_leftThumbstickState = v5;

  id v7 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.gamecontroller.emulatedController.timerQueue", 0);
  timerQueue = self->_timerQueue;
  self->_timerQueue = v7;

  if (!self->_immediateLeftThumbstickMode) {
    [(GCKeyboardAndMouseEmulatedController *)self startLeftThumbstickTimer];
  }
  [(GCKeyboardAndMouseEmulatedController *)self startMouseIdleTimer];
}

- (id)readButtonsInfoFromLocalFiles
{
  uint64_t v2 = +[GCKeyboard coalescedKeyboard];
  double v3 = [v2 keyboardInput];

  double v4 = +[NSMutableDictionary dictionary];
  uint64_t v5 = GetProperty(@"Buttons");
  objc_opt_class();
  float v20 = (void *)v5;
  if (objc_opt_isKindOfClass())
  {
    float v24 = v4;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v21 = [&unk_26D287AD0 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v21)
    {
      uint64_t v18 = *(void *)v30;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v30 != v18) {
            objc_enumerationMutation(&unk_26D287AD0);
          }
          uint64_t v23 = v6;
          uint64_t v7 = (int)[*(id *)(*((void *)&v29 + 1) + 8 * v6) intValue];
          double v22 = [(GCKeyboardAndMouseEmulatedController *)self nameForEventInput:v7];
          uint64_t v8 = objc_msgSend(v20, "allKeysForObject:");
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v33 count:16];
          if (v9)
          {
            uint64_t v10 = v9;
            uint64_t v11 = *(void *)v26;
            do
            {
              for (uint64_t i = 0; i != v10; ++i)
              {
                if (*(void *)v26 != v11) {
                  objc_enumerationMutation(v8);
                }
                if (*(void *)(*((void *)&v25 + 1) + 8 * i))
                {
                  uint64_t v13 = objc_msgSend(v3, "objectForKeyedSubscript:");
                  if (v13)
                  {
                    id v14 = +[NSNumber numberWithInteger:v7];
                    float v15 = +[NSNumber numberWithLong:](&off_26D2B68C8, "numberWithLong:", [v13 keyCode]);
                    [v24 setObject:v14 forKey:v15];
                  }
                }
              }
              uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v33 count:16];
            }
            while (v10);
          }

          uint64_t v6 = v23 + 1;
        }
        while (v23 + 1 != v21);
        uint64_t v21 = [&unk_26D287AD0 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v21);
    }
    double v4 = v24;
    id v16 = v24;
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (id)readConfigFromLocalFiles
{
  uint64_t v2 = GetProperty(@"Config");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)readLeftThumbstickSensitivityFromLocalFiles
{
  uint64_t v2 = GetProperty(@"LeftThumbstickSensitivity");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)tryReadPropertiesFromLocalFiles
{
  id v3 = +[NSMutableDictionary dictionary];
  double v4 = [(GCKeyboardAndMouseEmulatedController *)self readButtonsInfoFromLocalFiles];
  if (v4) {
    [v3 setObject:v4 forKeyedSubscript:@"Buttons"];
  }
  uint64_t v5 = [(GCKeyboardAndMouseEmulatedController *)self readConfigFromLocalFiles];
  if (v5) {
    [v3 setObject:v5 forKeyedSubscript:@"Config"];
  }
  uint64_t v6 = [(GCKeyboardAndMouseEmulatedController *)self readLeftThumbstickSensitivityFromLocalFiles];
  if (v6) {
    [v3 setObject:v6 forKeyedSubscript:@"LeftThumbstickSensitivity"];
  }

  return v3;
}

- (void)setMouseSensitivity:(unint64_t)a3
{
  if (a3)
  {
    unint64_t v3 = 17;
    if (a3 < 0x11) {
      unint64_t v3 = a3;
    }
    float v4 = (float)((float)v3 + -1.0) * 0.0625;
  }
  else
  {
    float v4 = 0.5;
  }
  p_mouseSensitivityHigh = &self->_mouseSensitivityHigh;
  self->_mouseSensitivityHigh = (float)(v4 * 0.003) + 0.001;
  if (gc_isInternalBuild())
  {
    uint64_t v6 = getGCLogger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[GCKeyboardAndMouseEmulatedController setMouseSensitivity:](p_mouseSensitivityHigh, v6);
    }
  }
}

- (id)initEmulatedControllerWithMapping:(int)a3 windowManager:(id)a4
{
  id v7 = a4;
  uint64_t v8 = objc_opt_new();
  [v8 setProductCategory:@"EmulatedController"];
  [v8 setVendorName:@"Apple"];
  memset(v23, 0, 512);
  GCExtendedGamepadInitInfoMake(v23);
  uint64_t v9 = [[GCExtendedGamepad alloc] initWithInfo:v23];
  v24[0] = v8;
  v24[1] = v9;
  uint64_t v10 = +[NSArray arrayWithObjects:v24 count:2];
  v22.receiver = self;
  v22.super_class = (Class)GCKeyboardAndMouseEmulatedController;
  uint64_t v11 = [(GCController *)&v22 initWithComponents:v10];

  if (v11)
  {
    objc_storeStrong((id *)&v11->_windowManager, a4);
    uint64_t v12 = objc_opt_new();
    event = v11->_event;
    v11->_event = (_GCGamepadEventImpl *)v12;

    id v14 = defaultMapping(1);
    float v15 = +[NSMutableDictionary dictionaryWithDictionary:v14];

    id v16 = [(GCKeyboardAndMouseEmulatedController *)v11 tryReadPropertiesFromLocalFiles];
    [v15 addEntriesFromDictionary:v16];
    v11->_emulatedControllerMapping = a3;
    float v17 = defaultMapping(a3);
    [(GCKeyboardAndMouseEmulatedController *)v11 remapControlsWith:v17];

    uint64_t v18 = +[NSUserDefaults standardUserDefaults];
    float v19 = [v18 valueForKey:@"GCDefaultMouseSensitivity"];
    -[GCKeyboardAndMouseEmulatedController setMouseSensitivity:](v11, "setMouseSensitivity:", (int)[v19 intValue]);

    [(GCKeyboardAndMouseEmulatedController *)v11 startKeyboardEventsListening];
  }

  for (uint64_t i = 0; i != 1584; i += 72)
    __destructor_8_s0_s48_s56_s64((uint64_t)v23 + i);

  return v11;
}

- (void)addDevice:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472;
    uint64_t v11 = __50__GCKeyboardAndMouseEmulatedController_addDevice___block_invoke;
    uint64_t v12 = &unk_26D22CEA0;
    uint64_t v13 = self;
    id v5 = v4;
    uint64_t v6 = [v5 mouseInput];
    [v6 setMouseMovedHandlerPrivate:&v9];

    id v7 = objc_msgSend(v5, "mouseInput", _NSConcreteStackBlock, 3221225472, __50__GCKeyboardAndMouseEmulatedController_addDevice___block_invoke_2, &unk_26D22CEC8, self, v9, v10, v11, v12, v13);

    [v7 setMouseButtonPressedPrivate:&v8];
  }
}

void __50__GCKeyboardAndMouseEmulatedController_addDevice___block_invoke(uint64_t a1, void *a2, float a3, float a4)
{
  id v7 = a2;
  uint64_t v8 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v8 + 268))
  {
    id v29 = v7;
    char v9 = [*(id *)(v8 + 232) mouseMoved];
    id v7 = v29;
    if ((v9 & 1) == 0)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 348));
      float v10 = *(double *)(*(void *)(a1 + 32) + 352);
      float v11 = *(double *)(*(void *)(a1 + 32) + 360);
      float v12 = clamp(sqrtf((float)(v11 * v11) + (float)(v10 * v10)), 0.0, 1.0);
      uint64_t v13 = *(void *)(a1 + 32);
      float v14 = *(float *)(v13 + 260) + (float)((float)(*(float *)(v13 + 264) - *(float *)(v13 + 260)) * v12);
      double v15 = (float)(v10 + (float)(a3 * v14));
      double v16 = (float)(v11 + (float)(a4 * v14));
      float v17 = sqrt(v16 * v16 + v15 * v15);
      if (v17 > 1.0)
      {
        double v18 = v17;
        double v15 = v15 / v18;
        double v16 = v16 / v18;
      }
      if (v15 == *(double *)(v13 + 352) && v16 == *(double *)(v13 + 360))
      {
        os_unfair_lock_unlock((os_unfair_lock_t)(v13 + 348));
      }
      else
      {
        *(double *)(v13 + 352) = v15;
        *(double *)(v13 + 360) = v16;
        BOOL v20 = v15 < 0.0;
        if (v15 < 0.0) {
          double v21 = 0.0;
        }
        else {
          double v21 = v15;
        }
        *(float *)&double v21 = v21;
        double v22 = -v15;
        if (v20) {
          double v23 = v22;
        }
        else {
          double v23 = 0.0;
        }
        [*(id *)(*(void *)(a1 + 32) + 368) setRightThumbstickRight:v21];
        *(float *)&double v24 = v23;
        [*(id *)(*(void *)(a1 + 32) + 368) setRightThumbstickLeft:v24];
        if (v16 < 0.0) {
          double v25 = 0.0;
        }
        else {
          double v25 = v16;
        }
        *(float *)&double v25 = v25;
        if (v16 >= 0.0) {
          double v26 = 0.0;
        }
        else {
          double v26 = -v16;
        }
        [*(id *)(*(void *)(a1 + 32) + 368) setRightThumbstickUp:v25];
        *(float *)&double v27 = v26;
        [*(id *)(*(void *)(a1 + 32) + 368) setRightThumbstickDown:v27];
        os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 348));
        long long v28 = [*(id *)(a1 + 32) extendedGamepad];
        [v28 handleGamepadEvent:*(void *)(*(void *)(a1 + 32) + 368)];
      }
      id v7 = v29;
    }
  }
}

void __50__GCKeyboardAndMouseEmulatedController_addDevice___block_invoke_2(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v6 + 268))
  {
    id v11 = v5;
    char v7 = [*(id *)(v6 + 232) mouseDown:a3 & 1];
    id v5 = v11;
    if ((v7 & 1) == 0)
    {
      if (a3) {
        *(float *)&double v8 = 1.0;
      }
      else {
        *(float *)&double v8 = 0.0;
      }
      [*(id *)(*(void *)(a1 + 32) + 368) setRightTrigger:v8];
      if ((a3 & 2) != 0) {
        *(float *)&double v9 = 1.0;
      }
      else {
        *(float *)&double v9 = 0.0;
      }
      [*(id *)(*(void *)(a1 + 32) + 368) setLeftTrigger:v9];
      float v10 = [*(id *)(a1 + 32) extendedGamepad];
      [v10 handleGamepadEvent:*(void *)(*(void *)(a1 + 32) + 368)];

      id v5 = v11;
    }
  }
}

- (void)removeDevice:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v6;
    id v4 = [v3 mouseInput];
    [v4 setMouseMovedHandlerPrivate:0];

    id v5 = [v3 mouseInput];

    [v5 setMouseButtonPressedPrivate:0];
  }
}

- (void)updateWithKeyKey:(int64_t)a3 down:(BOOL)a4
{
  BOOL v4 = a4;
  if (a4) {
    float v7 = 1.0;
  }
  else {
    float v7 = 0.0;
  }
  if (([(GCKeyboardControllerWindowManager *)self->_windowManager keyDown:a4] & 1) == 0)
  {
    if (v4 && a3 == 41) {
      [(GCKeyboardControllerWindowManager *)self->_windowManager releasePointer];
    }
    buttons = self->_buttons;
    double v9 = +[NSNumber numberWithLong:a3];
    id v17 = [(NSDictionary *)buttons objectForKeyedSubscript:v9];

    float v10 = v17;
    if (v17)
    {
      int v11 = [v17 intValue];
      if (!self->_immediateLeftThumbstickMode && v11 == 10)
      {
        *(float *)&double v12 = v7;
        [(LeftThumbstickState *)self->_leftThumbstickState setUp:v12];
      }
      else if (!self->_immediateLeftThumbstickMode && v11 == 12)
      {
        *(float *)&double v12 = v7;
        [(LeftThumbstickState *)self->_leftThumbstickState setLeft:v12];
      }
      else if (!self->_immediateLeftThumbstickMode && v11 == 11)
      {
        *(float *)&double v12 = v7;
        [(LeftThumbstickState *)self->_leftThumbstickState setDown:v12];
      }
      else if (self->_immediateLeftThumbstickMode || v11 != 13)
      {
        *(float *)&double v12 = v7;
        -[_GCGamepadEventImpl setFloatValue:forElement:](self->_event, "setFloatValue:forElement:", v12);
        double v16 = [(GCController *)self extendedGamepad];
        [v16 handleGamepadEvent:self->_event];
      }
      else
      {
        *(float *)&double v12 = v7;
        [(LeftThumbstickState *)self->_leftThumbstickState setRight:v12];
      }
      float v10 = v17;
    }
  }
}

- (int)emulatedControllerMapping
{
  return self->_emulatedControllerMapping;
}

- (unint64_t)mouseSensitivity
{
  return self->_mouseSensitivity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_mouseIdleTimer, 0);
  objc_storeStrong((id *)&self->_leftThumbstickTimer, 0);
  objc_storeStrong((id *)&self->_leftThumbstickState, 0);
  objc_storeStrong((id *)&self->_leftThumbstickSensitivity, 0);
  objc_storeStrong((id *)&self->_timerQueue, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_mapping, 0);

  objc_storeStrong((id *)&self->_windowManager, 0);
}

- (double)setMouseSensitivity:(float *)a1 .cold.1(float *a1, NSObject *a2)
{
  double v2 = *a1;
  int v4 = 134217984;
  double v5 = v2;
  _os_log_debug_impl(&dword_220998000, a2, OS_LOG_TYPE_DEBUG, "mouseSensitivity: %02.5f", (uint8_t *)&v4, 0xCu);
  return result;
}

@end