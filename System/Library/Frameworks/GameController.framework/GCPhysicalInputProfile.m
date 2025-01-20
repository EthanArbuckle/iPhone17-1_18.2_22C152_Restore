@interface GCPhysicalInputProfile
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (BOOL)hasRemappedElements;
- (BOOL)settingsProfile:(id)a3 differsFrom:(id)a4;
- (GCController)controller;
- (GCControllerElement)objectForKeyedSubscript:(NSString *)key;
- (GCMotion)_motion;
- (GCPhysicalInputProfile)capture;
- (GCPhysicalInputProfile)init;
- (GCPhysicalInputProfile)initWithController:(id)a3;
- (GCPhysicalInputProfile)initWithIdentifier:(id)a3;
- (GCPhysicalInputProfile)initWithIdentifier:(id)a3 andPool:(id)a4;
- (GCPhysicalInputProfile)retain;
- (GCSProfile)settingsProfile;
- (NSDictionary)axes;
- (NSDictionary)buttons;
- (NSDictionary)dpads;
- (NSDictionary)elements;
- (NSDictionary)touchpads;
- (NSMutableSet)_topLevelButtons;
- (NSMutableSet)_topLevelDirectionPads;
- (NSMutableSet)_topLevelElements;
- (NSMutableSet)_topLevelTouchpads;
- (NSObject)identifier;
- (NSSet)allAxes;
- (NSSet)allButtons;
- (NSSet)allDpads;
- (NSSet)allElements;
- (NSSet)allTouchpads;
- (NSSet)mappedPhysicalInputNamesForElementAlias:(NSString *)elementAlias;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)mappedElementAliasForPhysicalInputName:(NSString *)inputName;
- (NSString)name;
- (NSTimeInterval)lastEventTimestamp;
- (OS_dispatch_queue)handlerQueue;
- (OS_dispatch_queue)syntheticDeviceHandlerQueue;
- (id)_buttonWithDescription:(id)a3;
- (id)_buttonWithInfo:(id *)a3;
- (id)_cursorWithInfo:(id *)a3;
- (id)_directionPadWithDescription:(id)a3;
- (id)_directionPadWithInfo:(id *)a3;
- (id)_keyboardButtonWithInfo:(id *)a3;
- (id)_touchpadWithInfo:(id *)a3;
- (id)device;
- (id)productCategory;
- (id)remappedElementForIndex:(int64_t)a3;
- (id)syntheticDeviceElementValueChangedHandler;
- (id)thumbstickUserIntentHandler;
- (id)valueChangedHandler;
- (unint64_t)glyphFlags;
- (unint64_t)retainCount;
- (unsigned)sampleRate;
- (void)_receivedEvent;
- (void)_receivedEventWithTimestamp:(unint64_t)a3;
- (void)_registerAxis:(id)a3;
- (void)_registerButton:(id)a3;
- (void)_registerDirectionPad:(id)a3;
- (void)_registerTopLevelButton:(id)a3;
- (void)_registerTopLevelDirectionPad:(id)a3;
- (void)_registerTopLevelTouchpad:(id)a3;
- (void)_registerTouchpad:(id)a3;
- (void)_triggerValueChangedHandlerForElement:(id)a3 queue:(id)a4;
- (void)_triggerValueChangedHandlerForElements:(id)a3 queue:(id)a4;
- (void)applyGestureSettingsToButton:(id)a3 withSettings:(id)a4;
- (void)applySettingsProfile:(id)a3;
- (void)applySystemGestureComponent:(id)a3;
- (void)capture;
- (void)registerPhysicalInputName:(id)a3 toElementAlias:(id)a4 withPhysicalToElementMapping:(id)a5 withElementToPhysicalMapping:(id)a6;
- (void)release;
- (void)setButton:(id)a3 pressed:(BOOL)a4;
- (void)setButton:(id)a3 value:(double)a4;
- (void)setDevice:(id)a3;
- (void)setDpad:(id)a3 x:(double)a4 y:(double)a5;
- (void)setGamepadEventSource:(id)a3;
- (void)setGlyphFlags:(unint64_t)a3;
- (void)setHasRemappedElements:(BOOL)a3;
- (void)setLastEventTimestamp:(double)a3;
- (void)setSettingsProfile:(id)a3;
- (void)setStateFromPhysicalInput:(GCPhysicalInputProfile *)physicalInput;
- (void)setSyntheticDeviceElementValueChangedHandler:(id)a3;
- (void)setSyntheticDeviceHandlerQueue:(id)a3;
- (void)setValueDidChangeHandler:(void *)valueDidChangeHandler;
- (void)set_motion:(id)a3;
- (void)updateElementDeviceReferences;
- (void)updateSystemGesturesState:(id)a3;
- (void)valueDidChangeHandler;
@end

@implementation GCPhysicalInputProfile

- (GCPhysicalInputProfile)initWithController:(id)a3
{
  id v4 = a3;
  v5 = [(GCPhysicalInputProfile *)self init];
  v6 = v5;
  if (v5) {
    [(GCPhysicalInputProfile *)v5 setController:v4];
  }

  return v6;
}

- (GCMotion)_motion
{
  return (GCMotion *)objc_getProperty(self, a2, 56, 1);
}

- (void)set_motion:(id)a3
{
}

- (id)productCategory
{
  return @"MFi";
}

- (id)valueChangedHandler
{
  return 0;
}

- (unsigned)sampleRate
{
  return 0;
}

- (void)setDpad:(id)a3 x:(double)a4 y:(double)a5
{
  id v8 = a3;
  v9 = [(GCPhysicalInputProfile *)self handlerQueue];
  v10 = [v8 xAxis];
  *(float *)&double v11 = a4;
  char v12 = [v10 _setValue:v9 queue:v11];

  v13 = [v8 yAxis];
  *(float *)&double v14 = a5;
  int v15 = [v13 _setValue:v9 queue:v14];

  if ((v12 & 1) != 0 || v15)
  {
    if (v9)
    {
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = __46__GCPhysicalInputProfile_Legacy__setDpad_x_y___block_invoke;
      v18[3] = &unk_26D22A8E8;
      v18[4] = self;
      id v19 = v8;
      dispatch_async(v9, v18);
    }
    else
    {
      v16 = [(GCPhysicalInputProfile *)self valueChangedHandler];

      if (v16)
      {
        v17 = [(GCPhysicalInputProfile *)self valueChangedHandler];
        ((void (**)(void, GCPhysicalInputProfile *, id))v17)[2](v17, self, v8);
      }
    }
  }
}

void __46__GCPhysicalInputProfile_Legacy__setDpad_x_y___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) valueChangedHandler];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) valueChangedHandler];
    (*((void (**)(id, void, void))v3 + 2))(v3, *(void *)(a1 + 32), *(void *)(a1 + 40));
  }
}

- (void)setButton:(id)a3 value:(double)a4
{
  id v6 = a3;
  v7 = [(GCPhysicalInputProfile *)self handlerQueue];
  *(float *)&double v8 = a4;
  if ([v6 _setValue:v7 queue:v8])
  {
    if (v7)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = __50__GCPhysicalInputProfile_Legacy__setButton_value___block_invoke;
      v11[3] = &unk_26D22A8E8;
      v11[4] = self;
      id v12 = v6;
      dispatch_async(v7, v11);
    }
    else
    {
      v9 = [(GCPhysicalInputProfile *)self valueChangedHandler];

      if (v9)
      {
        v10 = [(GCPhysicalInputProfile *)self valueChangedHandler];
        ((void (**)(void, GCPhysicalInputProfile *, id))v10)[2](v10, self, v6);
      }
    }
  }
}

void __50__GCPhysicalInputProfile_Legacy__setButton_value___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) valueChangedHandler];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) valueChangedHandler];
    (*((void (**)(id, void, void))v3 + 2))(v3, *(void *)(a1 + 32), *(void *)(a1 + 40));
  }
}

- (void)setButton:(id)a3 pressed:(BOOL)a4
{
  double v4 = 0.0;
  if (a4) {
    double v4 = 1.0;
  }
  [(GCPhysicalInputProfile *)self setButton:a3 value:v4];
}

- (GCPhysicalInputProfile)retain
{
  if ((uint64_t)atomic_fetch_add(&self->_inlineRefcount, 2uLL) <= -3) {
    __break(1u);
  }
  return self;
}

- (void)release
{
  uint64_t add = atomic_fetch_add(&self->_inlineRefcount, 0xFFFFFFFFFFFFFFFELL);
  if (add <= 0)
  {
    if (add < 0) {
      goto LABEL_7;
    }
    objc_removeAssociatedObjects(self);
    uint64_t v4 = objc_clear_deallocating();
    v5 = (void *)MEMORY[0x223C6E130](v4);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = __refcountZeroed_block_invoke;
    v8[3] = &unk_26D22CDE0;
    v8[4] = self;
    char v6 = [objc_loadWeak((id *)&self->weakPool) addObjectWith:v8];
    if (v6) {
      return;
    }
    uint64_t v7 = -2;
    atomic_compare_exchange_strong(&self->_inlineRefcount, (unint64_t *)&v7, 1uLL);
    if (v7 != -2)
    {
LABEL_7:
      __break(1u);
      return;
    }
    [(GCPhysicalInputProfile *)self dealloc];
  }
}

- (unint64_t)retainCount
{
  return (unint64_t)(self->_inlineRefcount + 2) >> 1;
}

- (BOOL)_tryRetain
{
  while (1)
  {
    int64_t inlineRefcount = self->_inlineRefcount;
    BOOL v3 = (inlineRefcount & 1) != 0 || inlineRefcount == -2;
    char v4 = !v3;
    if (v3)
    {
LABEL_10:
      LOBYTE(self) = v4;
      return (char)self;
    }
    if (inlineRefcount <= -3) {
      break;
    }
    int64_t v5 = self->_inlineRefcount;
    atomic_compare_exchange_strong(&self->_inlineRefcount, (unint64_t *)&v5, inlineRefcount + 2);
    if (v5 == inlineRefcount) {
      goto LABEL_10;
    }
  }
  __break(1u);
  return (char)self;
}

- (BOOL)_isDeallocating
{
  int64_t inlineRefcount = self->_inlineRefcount;
  if (inlineRefcount == -2)
  {
    LOBYTE(self) = 1;
  }
  else if (inlineRefcount <= -3)
  {
    __break(1u);
  }
  else
  {
    LOBYTE(self) = inlineRefcount & 1;
  }
  return (char)self;
}

- (GCPhysicalInputProfile)init
{
  BOOL v3 = +[NSUUID UUID];
  char v4 = [(GCPhysicalInputProfile *)self initWithIdentifier:v3];

  return v4;
}

- (GCPhysicalInputProfile)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)GCPhysicalInputProfile;
  int64_t v5 = [(GCPhysicalInputProfile *)&v43 init];
  if (v5)
  {
    uint64_t v6 = [v4 copyWithZone:0];
    identifier = v5->_identifier;
    v5->_identifier = v6;

    uint64_t v8 = +[NSMutableDictionary dictionary];
    elements = v5->_elements;
    v5->_elements = (NSMutableDictionary *)v8;

    uint64_t v10 = +[NSMutableDictionary dictionary];
    buttons = v5->_buttons;
    v5->_buttons = (NSMutableDictionary *)v10;

    uint64_t v12 = +[NSMutableDictionary dictionary];
    axes = v5->_axes;
    v5->_axes = (NSMutableDictionary *)v12;

    uint64_t v14 = +[NSMutableDictionary dictionary];
    dpads = v5->_dpads;
    v5->_dpads = (NSMutableDictionary *)v14;

    uint64_t v16 = +[NSMutableDictionary dictionary];
    touchpads = v5->_touchpads;
    v5->_touchpads = (NSMutableDictionary *)v16;

    uint64_t v18 = +[NSMutableSet set];
    allElements = v5->_allElements;
    v5->_allElements = (NSMutableSet *)v18;

    uint64_t v20 = +[NSMutableSet set];
    allButtons = v5->_allButtons;
    v5->_allButtons = (NSMutableSet *)v20;

    uint64_t v22 = +[NSMutableSet set];
    allAxes = v5->_allAxes;
    v5->_allAxes = (NSMutableSet *)v22;

    uint64_t v24 = +[NSMutableSet set];
    allDpads = v5->_allDpads;
    v5->_allDpads = (NSMutableSet *)v24;

    uint64_t v26 = +[NSMutableSet set];
    allTouchpads = v5->_allTouchpads;
    v5->_allTouchpads = (NSMutableSet *)v26;

    uint64_t v28 = +[NSMutableSet set];
    allGestureAwareButtons = v5->_allGestureAwareButtons;
    v5->_allGestureAwareButtons = (NSMutableSet *)v28;

    uint64_t v30 = +[NSMutableSet set];
    topLevelElements = v5->__topLevelElements;
    v5->__topLevelElements = (NSMutableSet *)v30;

    uint64_t v32 = +[NSMutableSet set];
    topLevelButtons = v5->__topLevelButtons;
    v5->__topLevelButtons = (NSMutableSet *)v32;

    uint64_t v34 = +[NSMutableSet set];
    topLevelDirectionPads = v5->__topLevelDirectionPads;
    v5->__topLevelDirectionPads = (NSMutableSet *)v34;

    uint64_t v36 = +[NSMutableSet set];
    topLevelTouchpads = v5->__topLevelTouchpads;
    v5->__topLevelTouchpads = (NSMutableSet *)v36;

    physicalInputNameToElementAlias = v5->_physicalInputNameToElementAlias;
    v5->_physicalInputNameToElementAlias = 0;

    elementAliasToPhysicalInputNames = v5->_elementAliasToPhysicalInputNames;
    v5->_elementAliasToPhysicalInputNames = 0;

    if (!v5->pooled)
    {
      v40 = objc_alloc_init(GCObjectPool);
      pool = v5->pool;
      v5->pool = v40;
    }
  }

  return v5;
}

- (GCPhysicalInputProfile)initWithIdentifier:(id)a3 andPool:(id)a4
{
  self->pooled = 1;
  id v6 = a4;
  uint64_t v7 = [(GCPhysicalInputProfile *)self initWithIdentifier:a3];
  objc_storeWeak((id *)&v7->weakPool, v6);

  return v7;
}

- (NSString)name
{
  return (NSString *)@"GCNamedProfile";
}

- (id)device
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);

  return WeakRetained;
}

- (void)setDevice:(id)a3
{
  p_device = &self->_device;
  objc_storeWeak((id *)&self->_device, a3);
  [(GCPhysicalInputProfile *)self updateElementDeviceReferences];
  id WeakRetained = objc_loadWeakRetained((id *)p_device);
  objc_opt_class();
  objc_opt_isKindOfClass();
}

- (GCController)controller
{
  p_device = &self->_device;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = objc_loadWeakRetained((id *)p_device);
  }
  else {
    id v4 = 0;
  }

  return (GCController *)v4;
}

- (OS_dispatch_queue)handlerQueue
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  BOOL v3 = [WeakRetained handlerQueue];

  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    id v4 = &_dispatch_main_q;
    id v6 = &_dispatch_main_q;
  }

  return (OS_dispatch_queue *)v4;
}

- (BOOL)settingsProfile:(id)a3 differsFrom:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (v5 == v6)
  {
    BOOL v8 = 0;
  }
  else
  {
    BOOL v8 = 1;
    if (v5 && v6)
    {
      v9 = [v5 uuid];
      uint64_t v10 = [v7 uuid];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_25;
      }
      uint64_t v12 = [v5 name];
      v13 = [v7 name];
      int v14 = [v12 isEqual:v13];

      if (!v14) {
        goto LABEL_25;
      }
      int v15 = [v5 elementMappings];
      uint64_t v16 = [v15 count];
      v17 = [v7 elementMappings];
      uint64_t v18 = [v17 count];

      if (v16 == v18)
      {
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v19 = [v5 elementMappings];
        uint64_t v20 = [v19 keyEnumerator];

        id obj = v20;
        uint64_t v21 = [v20 countByEnumeratingWithState:&v42 objects:v46 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v43;
          while (2)
          {
            for (uint64_t i = 0; i != v22; ++i)
            {
              if (*(void *)v43 != v23) {
                objc_enumerationMutation(obj);
              }
              uint64_t v25 = *(void *)(*((void *)&v42 + 1) + 8 * i);
              uint64_t v26 = [v5 elementMappings];
              v27 = [v26 objectForKeyedSubscript:v25];

              uint64_t v28 = [v7 elementMappings];
              v29 = [v28 objectForKeyedSubscript:v25];

              if (!v29) {
                goto LABEL_34;
              }
              int v30 = [v27 remappingOrder];
              if (v30 != [v29 remappingOrder]
                || ([v27 mappingKey],
                    v31 = objc_claimAutoreleasedReturnValue(),
                    [v29 mappingKey],
                    uint64_t v32 = objc_claimAutoreleasedReturnValue(),
                    char v33 = [v31 isEqual:v32],
                    v32,
                    v31,
                    (v33 & 1) == 0))
              {
                if (gc_isInternalBuild())
                {
                  uint64_t v34 = getGCLogger();
                  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
                    -[GCPhysicalInputProfile settingsProfile:differsFrom:](v27, v29, v34);
                  }
LABEL_33:
                }
LABEL_34:

                BOOL v8 = 1;
                goto LABEL_35;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  uint64_t v34 = v27;
                  id v35 = v29;
                  int v36 = [v34 invertHorizontally];
                  if (v36 != [v35 invertHorizontally]
                    || (int v37 = [v34 invertVertically],
                        v37 != [v35 invertVertically])
                    || (int v38 = -[NSObject swapAxes](v34, "swapAxes"), v38 != [v35 swapAxes]))
                  {
                    if (gc_isInternalBuild())
                    {
                      v40 = getGCLogger();
                      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
                        -[GCPhysicalInputProfile settingsProfile:differsFrom:](v34);
                      }
                    }
                    goto LABEL_33;
                  }
                }
              }
            }
            uint64_t v22 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
            BOOL v8 = 0;
            if (v22) {
              continue;
            }
            break;
          }
        }
        else
        {
          BOOL v8 = 0;
        }
LABEL_35:
      }
      else
      {
LABEL_25:
        BOOL v8 = 1;
      }
    }
  }

  return v8;
}

- (void)setSettingsProfile:(id)a3
{
  id v5 = a3;
  id v6 = self->_settingsProfile;
  objc_storeStrong((id *)&self->_settingsProfile, a3);
  [(GCPhysicalInputProfile *)self applySettingsProfile:self->_settingsProfile];
  uint64_t v7 = [(GCPhysicalInputProfile *)self handlerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __45__GCPhysicalInputProfile_setSettingsProfile___block_invoke;
  block[3] = &unk_26D22B618;
  block[4] = self;
  int v11 = v6;
  id v12 = v5;
  id v8 = v5;
  v9 = v6;
  dispatch_async(v7, block);
}

void __45__GCPhysicalInputProfile_setSettingsProfile___block_invoke(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) controller];
  if ([v7 isPublished])
  {
    int v2 = [*(id *)(a1 + 32) settingsProfile:*(void *)(a1 + 40) differsFrom:*(void *)(a1 + 48)];

    if (v2)
    {
      if (gc_isInternalBuild())
      {
        id v5 = getGCLogger();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          id v6 = [*(id *)(a1 + 32) controller];
          *(_DWORD *)buf = 138412290;
          v9 = v6;
          _os_log_impl(&dword_220998000, v5, OS_LOG_TYPE_INFO, "Posting GCControllerUserCustomizationsDidChangeNotification: %@", buf, 0xCu);
        }
      }
      BOOL v3 = +[NSNotificationCenter defaultCenter];
      id v4 = [*(id *)(a1 + 32) controller];
      [v3 postNotificationName:@"GCControllerUserCustomizationsDidChangeNotification" object:v4 userInfo:0];
    }
  }
  else
  {
  }
}

- (void)applySettingsProfile:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    self->_hasRemappedElements = 0;
    long long v244 = 0u;
    long long v245 = 0u;
    long long v246 = 0u;
    long long v247 = 0u;
    v228 = self;
    id v5 = [(GCPhysicalInputProfile *)self allButtons];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v244 objects:v251 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v245;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v245 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v244 + 1) + 8 * i);
          if (([v10 remappingKey] & 0x80000000) == 0) {
            objc_storeStrong((id *)&v228->_remappedElements[(int)[v10 remappingKey]], v10);
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v244 objects:v251 count:16];
      }
      while (v7);
    }

    int v11 = v228;
    physicalInputNameToElementAlias = v228->_physicalInputNameToElementAlias;
    v228->_physicalInputNameToElementAlias = 0;

    elementAliasToPhysicalInputNames = v228->_elementAliasToPhysicalInputNames;
    v228->_elementAliasToPhysicalInputNames = 0;

    v225 = (NSDictionary *)objc_opt_new();
    v224 = (NSDictionary *)objc_opt_new();
    int v14 = objc_opt_new();
    v229 = objc_opt_new();
    int v15 = [(NSMutableDictionary *)v228->_elements objectForKeyedSubscript:@"Button Share"];

    uint64_t v16 = @"Button Options";
    if (v15) {
      uint64_t v16 = @"Button Share";
    }
    v17 = v16;
    uint64_t v18 = objc_alloc_init(GCReplayKitGestureSettings);
    v210 = v17;
    [(GCReplayKitGestureSettings *)v18 setControllerElementMappingKey:v17];
    [(GCReplayKitGestureSettings *)v18 setSinglePressGesture:-1];
    -[GCReplayKitGestureSettings setDoublePressGesture:](v18, "setDoublePressGesture:", [v4 doublePressShareGesture] - 1);
    -[GCReplayKitGestureSettings setLongPressGesture:](v18, "setLongPressGesture:", [v4 longPressShareGesture] - 1);
    long long v242 = 0u;
    long long v243 = 0u;
    long long v240 = 0u;
    long long v241 = 0u;
    id obj = [(GCPhysicalInputProfile *)v228 _topLevelButtons];
    uint64_t v19 = [obj countByEnumeratingWithState:&v240 objects:v250 count:16];
    id v221 = v4;
    id v230 = v14;
    v213 = v18;
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v241;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v241 != v21) {
            objc_enumerationMutation(obj);
          }
          uint64_t v23 = *(void **)(*((void *)&v240 + 1) + 8 * j);
          if ([v23 remappable])
          {
            uint64_t v24 = [v4 elementMappingForPhysicalPress:v23];

            if (v24)
            {
              id v25 = [v4 logicalButtonForPhysicalPressOf:v23 onPhysicalInputProfile:v11];
            }
            else
            {
              id v25 = v23;
            }
            uint64_t v26 = v25;
            if (v25)
            {
              objc_storeStrong((id *)&v228->_remappedElements[(int)[v23 remappingKey]], v25);
              v27 = [v23 primaryAlias];
              uint64_t v28 = [v26 primaryAlias];
              [(GCPhysicalInputProfile *)v228 registerPhysicalInputName:v27 toElementAlias:v28 withPhysicalToElementMapping:v225 withElementToPhysicalMapping:v224];

              uint64_t v29 = [v26 unmappedSfSymbolsName];
              if (!v29) {
                goto LABEL_25;
              }
              int v30 = (void *)v29;
              v31 = [v26 primaryAlias];
              uint64_t v32 = [v230 objectForKeyedSubscript:v31];
              char v33 = [v26 unmappedSfSymbolsName];
              char v34 = [v32 isEqualToString:v33];

              if ((v34 & 1) == 0)
              {
LABEL_25:
                id v35 = [v23 unmappedSfSymbolsName];
                int v36 = [v26 primaryAlias];
                [v230 setObject:v35 forKeyedSubscript:v36];
              }
              uint64_t v37 = [v26 unmappedNameLocalizationKey];
              if (!v37) {
                goto LABEL_28;
              }
              int v38 = (void *)v37;
              v39 = [v26 primaryAlias];
              v40 = [v229 objectForKeyedSubscript:v39];
              v41 = [v26 unmappedNameLocalizationKey];
              char v42 = [v40 isEqualToString:v41];

              if ((v42 & 1) == 0)
              {
LABEL_28:
                long long v43 = [v23 unmappedNameLocalizationKey];
                long long v44 = [v26 primaryAlias];
                [v229 setObject:v43 forKeyedSubscript:v44];
              }
            }

            id v4 = v221;
            int v11 = v228;
            int v14 = v230;
            uint64_t v18 = v213;
          }
          [(GCPhysicalInputProfile *)v11 applyGestureSettingsToButton:v23 withSettings:v18];
        }
        uint64_t v20 = [obj countByEnumeratingWithState:&v240 objects:v250 count:16];
      }
      while (v20);
    }

    long long v238 = 0u;
    long long v239 = 0u;
    long long v236 = 0u;
    long long v237 = 0u;
    v214 = v11->__topLevelDirectionPads;
    uint64_t v45 = [(NSMutableSet *)v214 countByEnumeratingWithState:&v236 objects:v249 count:16];
    if (v45)
    {
      uint64_t v46 = v45;
      uint64_t v47 = *(void *)v237;
      obja = v11->_remappedElements;
      uint64_t v211 = *(void *)v237;
      do
      {
        uint64_t v48 = 0;
        uint64_t v212 = v46;
        do
        {
          if (*(void *)v237 != v47) {
            objc_enumerationMutation(v214);
          }
          v49 = *(void **)(*((void *)&v236 + 1) + 8 * v48);
          if ([v49 remappable])
          {
            v50 = [v4 directionPadMappingForPhysicalPress:v49];
            if (v50)
            {
              id v51 = [v4 logicalDirectionPadForPhysicalPressOf:v49 onPhysicalInputProfile:v11];
            }
            else
            {
              id v51 = v49;
            }
            v52 = v51;
            if (v51)
            {
              v53 = [v49 primaryAlias];
              v54 = [v52 primaryAlias];
              [(GCPhysicalInputProfile *)v11 registerPhysicalInputName:v53 toElementAlias:v54 withPhysicalToElementMapping:v225 withElementToPhysicalMapping:v224];

              LODWORD(v53) = [v50 swapAxes];
              int v55 = [v50 invertHorizontally];
              int v56 = [v50 invertVertically];
              v218 = v50;
              if (v53)
              {
                v220 = [v52 yAxis];
                v219 = [v52 xAxis];
                v223 = [v49 yAxis];
                uint64_t v57 = [v49 xAxis];
                if (v55)
                {
                  uint64_t v58 = [v52 left];
                  v59 = [v49 up];
                  int v60 = [v59 remappingKey];
                  v61 = obja[v60];
                  obja[v60] = (GCControllerElement *)v58;

                  v222 = [v49 left];
                  uint64_t v62 = [v52 right];
                  v63 = [v49 down];
                  int v64 = [v63 remappingKey];
                  v65 = obja[v64];
                  obja[v64] = (GCControllerElement *)v62;

                  [v49 right];
                }
                else
                {
                  uint64_t v75 = [v52 right];
                  v76 = [v49 up];
                  int v77 = [v76 remappingKey];
                  v78 = obja[v77];
                  obja[v77] = (GCControllerElement *)v75;

                  v222 = [v49 right];
                  uint64_t v79 = [v52 left];
                  v80 = [v49 down];
                  int v81 = [v80 remappingKey];
                  v82 = obja[v81];
                  obja[v81] = (GCControllerElement *)v79;

                  [v49 left];
                v217 = };
                v83 = (void *)v57;
                if (v56)
                {
                  uint64_t v84 = [v52 up];
                  v85 = [v49 left];
                  int v86 = [v85 remappingKey];
                  v87 = obja[v86];
                  obja[v86] = (GCControllerElement *)v84;

                  v216 = [v49 up];
                  uint64_t v88 = [v52 down];
                  v89 = [v49 right];
                  int v90 = [v89 remappingKey];
                  v91 = obja[v90];
                  obja[v90] = (GCControllerElement *)v88;

                  [v49 down];
                }
                else
                {
                  uint64_t v109 = [v52 down];
                  v110 = [v49 left];
                  int v111 = [v110 remappingKey];
                  v112 = obja[v111];
                  obja[v111] = (GCControllerElement *)v109;

                  v216 = [v49 down];
                  uint64_t v113 = [v52 up];
                  v114 = [v49 right];
                  int v115 = [v114 remappingKey];
                  v116 = obja[v115];
                  obja[v115] = (GCControllerElement *)v113;

                  [v49 up];
                }
              }
              else
              {
                v220 = [v52 xAxis];
                v219 = [v52 yAxis];
                v223 = [v49 xAxis];
                uint64_t v66 = [v49 yAxis];
                if (v56)
                {
                  uint64_t v67 = [v52 down];
                  v68 = [v49 up];
                  int v69 = [v68 remappingKey];
                  v70 = obja[v69];
                  obja[v69] = (GCControllerElement *)v67;

                  v222 = [v49 down];
                  uint64_t v71 = [v52 up];
                  v72 = [v49 down];
                  int v73 = [v72 remappingKey];
                  v74 = obja[v73];
                  obja[v73] = (GCControllerElement *)v71;

                  [v49 up];
                }
                else
                {
                  uint64_t v93 = [v52 up];
                  v94 = [v49 up];
                  int v95 = [v94 remappingKey];
                  v96 = obja[v95];
                  obja[v95] = (GCControllerElement *)v93;

                  v222 = [v49 up];
                  uint64_t v97 = [v52 down];
                  v98 = [v49 down];
                  int v99 = [v98 remappingKey];
                  v100 = obja[v99];
                  obja[v99] = (GCControllerElement *)v97;

                  [v49 down];
                v217 = };
                v83 = (void *)v66;
                if (v55)
                {
                  uint64_t v101 = [v52 right];
                  v102 = [v49 left];
                  int v103 = [v102 remappingKey];
                  v104 = obja[v103];
                  obja[v103] = (GCControllerElement *)v101;

                  v216 = [v49 right];
                  uint64_t v105 = [v52 left];
                  v106 = [v49 right];
                  int v107 = [v106 remappingKey];
                  v108 = obja[v107];
                  obja[v107] = (GCControllerElement *)v105;

                  [v49 left];
                }
                else
                {
                  uint64_t v117 = [v52 left];
                  v118 = [v49 left];
                  int v119 = [v118 remappingKey];
                  v120 = obja[v119];
                  obja[v119] = (GCControllerElement *)v117;

                  v216 = [v49 left];
                  uint64_t v121 = [v52 right];
                  v122 = [v49 right];
                  int v123 = [v122 remappingKey];
                  v124 = obja[v123];
                  obja[v123] = (GCControllerElement *)v121;

                  [v49 right];
                }
              uint64_t v92 = };
              v215 = (void *)v92;
              uint64_t v125 = [v52 unmappedSfSymbolsName];
              if (!v125) {
                goto LABEL_58;
              }
              v126 = (void *)v125;
              v127 = [v52 primaryAlias];
              v128 = [v230 objectForKeyedSubscript:v127];
              v129 = [v52 unmappedSfSymbolsName];
              char v130 = [v128 isEqualToString:v129];

              if ((v130 & 1) == 0)
              {
LABEL_58:
                v131 = [v49 unmappedSfSymbolsName];
                v132 = [v52 primaryAlias];
                [v230 setObject:v131 forKeyedSubscript:v132];

                v133 = [v49 up];
                v134 = [v133 unmappedSfSymbolsName];
                v135 = [v49 up];
                v136 = -[GCControllerElement primaryAlias](obja[(int)[v135 remappingKey]], "primaryAlias");
                [v230 setObject:v134 forKeyedSubscript:v136];

                v137 = [v49 down];
                v138 = [v137 unmappedSfSymbolsName];
                v139 = [v49 down];
                v140 = -[GCControllerElement primaryAlias](obja[(int)[v139 remappingKey]], "primaryAlias");
                [v230 setObject:v138 forKeyedSubscript:v140];

                v141 = [v49 left];
                v142 = [v141 unmappedSfSymbolsName];
                v143 = [v49 left];
                v144 = -[GCControllerElement primaryAlias](obja[(int)[v143 remappingKey]], "primaryAlias");
                [v230 setObject:v142 forKeyedSubscript:v144];

                v145 = [v49 right];
                v146 = [v145 unmappedSfSymbolsName];
                v147 = [v49 right];
                v148 = -[GCControllerElement primaryAlias](obja[(int)[v147 remappingKey]], "primaryAlias");
                [v230 setObject:v146 forKeyedSubscript:v148];
              }
              uint64_t v149 = [v52 unmappedNameLocalizationKey];
              if (!v149) {
                goto LABEL_61;
              }
              v150 = (void *)v149;
              v151 = [v52 primaryAlias];
              v152 = [v229 objectForKeyedSubscript:v151];
              v153 = [v52 unmappedNameLocalizationKey];
              char v154 = [v152 isEqualToString:v153];

              if ((v154 & 1) == 0)
              {
LABEL_61:
                v155 = [v49 unmappedNameLocalizationKey];
                v156 = [v52 primaryAlias];
                [v229 setObject:v155 forKeyedSubscript:v156];

                v157 = [v52 primaryAlias];
                v158 = [v229 objectForKeyedSubscript:v157];

                if (v158)
                {
                  v159 = [v49 up];
                  v160 = -[GCControllerElement primaryAlias](obja[(int)[v159 remappingKey]], "primaryAlias");
                  [v229 setObject:@"DIRECTION_PAD_UP" forKeyedSubscript:v160];

                  v161 = [v49 down];
                  v162 = -[GCControllerElement primaryAlias](obja[(int)[v161 remappingKey]], "primaryAlias");
                  [v229 setObject:@"DIRECTION_PAD_DOWN" forKeyedSubscript:v162];

                  v163 = [v49 left];
                  v164 = -[GCControllerElement primaryAlias](obja[(int)[v163 remappingKey]], "primaryAlias");
                  [v229 setObject:@"DIRECTION_PAD_LEFT" forKeyedSubscript:v164];

                  v165 = [v49 right];
                  v166 = -[GCControllerElement primaryAlias](obja[(int)[v165 remappingKey]], "primaryAlias");
                  [v229 setObject:@"DIRECTION_PAD_RIGHT" forKeyedSubscript:v166];

                  v167 = _GCFConvertStringToLocalizedString();
                  v168 = +[NSString stringWithFormat:](&off_26D2B6E68, "stringWithFormat:", v167, v158);
                  v169 = [v220 primaryAlias];
                  [v229 setObject:v168 forKeyedSubscript:v169];

                  v170 = _GCFConvertStringToLocalizedString();
                  v171 = +[NSString stringWithFormat:](&off_26D2B6E68, "stringWithFormat:", v170, v158);
                  v172 = [v219 primaryAlias];
                  [v229 setObject:v171 forKeyedSubscript:v172];
                }
              }
              v173 = [v223 primaryAlias];
              v174 = [v52 xAxis];
              v175 = [v174 primaryAlias];
              int v11 = v228;
              [(GCPhysicalInputProfile *)v228 registerPhysicalInputName:v173 toElementAlias:v175 withPhysicalToElementMapping:v225 withElementToPhysicalMapping:v224];

              v176 = [v83 primaryAlias];
              v177 = [v52 yAxis];
              v178 = [v177 primaryAlias];
              [(GCPhysicalInputProfile *)v228 registerPhysicalInputName:v176 toElementAlias:v178 withPhysicalToElementMapping:v225 withElementToPhysicalMapping:v224];

              v179 = [v222 primaryAlias];
              v180 = [v52 up];
              v181 = [v180 primaryAlias];
              [(GCPhysicalInputProfile *)v228 registerPhysicalInputName:v179 toElementAlias:v181 withPhysicalToElementMapping:v225 withElementToPhysicalMapping:v224];

              v182 = [v217 primaryAlias];
              v183 = [v52 down];
              v184 = [v183 primaryAlias];
              [(GCPhysicalInputProfile *)v228 registerPhysicalInputName:v182 toElementAlias:v184 withPhysicalToElementMapping:v225 withElementToPhysicalMapping:v224];

              v185 = [v216 primaryAlias];
              v186 = [v52 left];
              v187 = [v186 primaryAlias];
              [(GCPhysicalInputProfile *)v228 registerPhysicalInputName:v185 toElementAlias:v187 withPhysicalToElementMapping:v225 withElementToPhysicalMapping:v224];

              v188 = [v215 primaryAlias];
              v189 = [v52 right];
              v190 = [v189 primaryAlias];
              [(GCPhysicalInputProfile *)v228 registerPhysicalInputName:v188 toElementAlias:v190 withPhysicalToElementMapping:v225 withElementToPhysicalMapping:v224];

              id v4 = v221;
              uint64_t v47 = v211;
              uint64_t v46 = v212;
              v50 = v218;
            }

            int v14 = v230;
          }
          ++v48;
        }
        while (v46 != v48);
        uint64_t v46 = [(NSMutableSet *)v214 countByEnumeratingWithState:&v236 objects:v249 count:16];
      }
      while (v46);
    }

    long long v234 = 0u;
    long long v235 = 0u;
    long long v232 = 0u;
    long long v233 = 0u;
    id v231 = [(GCPhysicalInputProfile *)v11 allElements];
    uint64_t v191 = [v231 countByEnumeratingWithState:&v232 objects:v248 count:16];
    if (v191)
    {
      uint64_t v192 = v191;
      uint64_t v193 = *(void *)v233;
      do
      {
        for (uint64_t k = 0; k != v192; ++k)
        {
          if (*(void *)v233 != v193) {
            objc_enumerationMutation(v231);
          }
          v195 = *(void **)(*((void *)&v232 + 1) + 8 * k);
          if (([v195 remappable] & 1) == 0)
          {
            v196 = [v195 collection];
            int v197 = [v196 remappable];

            if (!v197) {
              continue;
            }
          }
          v198 = [v195 primaryAlias];
          v199 = [v229 objectForKeyedSubscript:v198];

          if (v199)
          {
            v200 = [v195 primaryAlias];
            v201 = [v229 objectForKeyedSubscript:v200];
            [v195 setNameLocalizationKey:v201];
          }
          else
          {
            [v195 setNameLocalizationKey:0];
          }
          v202 = [v195 primaryAlias];
          v203 = [v14 objectForKeyedSubscript:v202];

          if (v203)
          {
            v204 = [v195 primaryAlias];
            v205 = [v14 objectForKeyedSubscript:v204];
            [v195 setSfSymbolsName:v205];
          }
          else
          {
            [v195 setSfSymbolsName:0];
          }
        }
        uint64_t v192 = [v231 countByEnumeratingWithState:&v232 objects:v248 count:16];
      }
      while (v192);
    }

    v206 = v11->_elementAliasToPhysicalInputNames;
    v11->_elementAliasToPhysicalInputNames = v224;
    v207 = v224;

    v208 = v11->_physicalInputNameToElementAlias;
    v11->_physicalInputNameToElementAlias = v225;
    v209 = v225;
  }
}

- (void)registerPhysicalInputName:(id)a3 toElementAlias:(id)a4 withPhysicalToElementMapping:(id)a5 withElementToPhysicalMapping:(id)a6
{
  id v16 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = a5;
  if (([v16 isEqualToString:v10] & 1) == 0) {
    self->_hasRemappedElements = 1;
  }
  [v12 setObject:v10 forKeyedSubscript:v16];

  v13 = [v11 objectForKeyedSubscript:v10];

  if (!v13)
  {
    int v14 = objc_opt_new();
    [v11 setObject:v14 forKeyedSubscript:v10];
  }
  int v15 = [v11 objectForKeyedSubscript:v10];
  [v15 addObject:v16];
}

- (void)applyGestureSettingsToButton:(id)a3 withSettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v6;
    v9 = getGCSettingsLogger();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v54 = v8;
      _os_log_impl(&dword_220998000, v9, OS_LOG_TYPE_INFO, "applyGestureSettingsToButton: %@", buf, 0xCu);
    }

    id v10 = getGCSettingsLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v54 = v7;
      _os_log_impl(&dword_220998000, v10, OS_LOG_TYPE_INFO, "replayKitSettings: %@", buf, 0xCu);
    }

    [v8 setLongPressHandler:0];
    [v8 setDoublePressHandler:0];
    id v11 = [v8 primaryAlias];
    int v12 = [v11 isEqualToString:@"Button Home"];

    if (v12)
    {
      objc_initWeak((id *)buf, self);
      v13 = +[UIDevice currentDevice];
      BOOL v14 = [v13 userInterfaceIdiom] == 1;

      if (v14)
      {
        v51[0] = _NSConcreteStackBlock;
        v51[1] = 3221225472;
        v51[2] = __68__GCPhysicalInputProfile_applyGestureSettingsToButton_withSettings___block_invoke;
        v51[3] = &unk_26D22D448;
        objc_copyWeak(&v52, (id *)buf);
        [v8 setLongPressHandler:v51];
        objc_destroyWeak(&v52);
      }
      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472;
      v49[2] = __68__GCPhysicalInputProfile_applyGestureSettingsToButton_withSettings___block_invoke_2;
      v49[3] = &unk_26D22D448;
      objc_copyWeak(&v50, (id *)buf);
      [v8 setSinglePressHandler:v49];
      objc_destroyWeak(&v50);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      [v8 setSinglePressHandler:0];
    }
    int v15 = [v7 controllerElementMappingKey];
    id v16 = [v8 primaryAlias];
    int v17 = [v16 isEqualToString:v15];

    if (v17)
    {
      uint64_t v18 = [v7 gestureTypeForGestureMode:0];
      uint64_t v19 = [v7 gestureTypeForGestureMode:1];
      uint64_t v20 = [v7 gestureTypeForGestureMode:2];
      if (v18 != -1)
      {
        uint64_t v21 = getGCSettingsLogger();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v54 = v8;
          _os_log_impl(&dword_220998000, v21, OS_LOG_TYPE_INFO, "Configuring screenshot button: %@", buf, 0xCu);
        }

        objc_initWeak((id *)buf, self);
        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472;
        v47[2] = __68__GCPhysicalInputProfile_applyGestureSettingsToButton_withSettings___block_invoke_130;
        v47[3] = &unk_26D22D448;
        objc_copyWeak(&v48, (id *)buf);
        uint64_t v22 = (void *)MEMORY[0x223C6E420](v47);
        switch(v18)
        {
          case 2:
            uint64_t v24 = getGCSettingsLogger();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)uint64_t v46 = 0;
              _os_log_impl(&dword_220998000, v24, OS_LOG_TYPE_INFO, "Double press for screenshot", v46, 2u);
            }

            [v8 setDoublePressHandler:v22];
            break;
          case 1:
            id v25 = getGCSettingsLogger();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)uint64_t v46 = 0;
              _os_log_impl(&dword_220998000, v25, OS_LOG_TYPE_INFO, "Long press for screenshot", v46, 2u);
            }

            [v8 setLongPressHandler:v22];
            break;
          case 0:
            uint64_t v23 = getGCSettingsLogger();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)uint64_t v46 = 0;
              _os_log_impl(&dword_220998000, v23, OS_LOG_TYPE_INFO, "Single press for screenshot", v46, 2u);
            }

            [v8 setSinglePressHandler:v22];
            break;
        }

        objc_destroyWeak(&v48);
        objc_destroyWeak((id *)buf);
      }
      if (v19 != -1)
      {
        uint64_t v26 = getGCSettingsLogger();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v54 = v8;
          _os_log_impl(&dword_220998000, v26, OS_LOG_TYPE_INFO, "Configuring video recording button: %@", buf, 0xCu);
        }

        objc_initWeak((id *)buf, self);
        v44[0] = _NSConcreteStackBlock;
        v44[1] = 3221225472;
        v44[2] = __68__GCPhysicalInputProfile_applyGestureSettingsToButton_withSettings___block_invoke_132;
        v44[3] = &unk_26D22D448;
        objc_copyWeak(&v45, (id *)buf);
        v27 = (void *)MEMORY[0x223C6E420](v44);
        switch(v19)
        {
          case 2:
            uint64_t v29 = getGCSettingsLogger();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)uint64_t v46 = 0;
              _os_log_impl(&dword_220998000, v29, OS_LOG_TYPE_INFO, "Double press for video", v46, 2u);
            }

            [v8 setDoublePressHandler:v27];
            break;
          case 1:
            int v30 = getGCSettingsLogger();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)uint64_t v46 = 0;
              _os_log_impl(&dword_220998000, v30, OS_LOG_TYPE_INFO, "Long press for video", v46, 2u);
            }

            [v8 setLongPressHandler:v27];
            break;
          case 0:
            uint64_t v28 = getGCSettingsLogger();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)uint64_t v46 = 0;
              _os_log_impl(&dword_220998000, v28, OS_LOG_TYPE_INFO, "Single press for video", v46, 2u);
            }

            [v8 setSinglePressHandler:v27];
            break;
        }

        objc_destroyWeak(&v45);
        objc_destroyWeak((id *)buf);
      }
      if (v20 != -1)
      {
        v31 = getGCSettingsLogger();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v54 = v8;
          _os_log_impl(&dword_220998000, v31, OS_LOG_TYPE_INFO, "Configuring replay capture button: %@", buf, 0xCu);
        }

        uint64_t v32 = currentProcessBundleIdentifier();
        char v33 = [v32 isEqualToString:@"com.apple.Preferences"];

        if ((v33 & 1) == 0)
        {
          char v34 = +[_GCControllerManager sharedInstance];
          [v34 startVideoRecordingBuffering];
        }
        objc_initWeak((id *)buf, self);
        v39 = _NSConcreteStackBlock;
        uint64_t v40 = 3221225472;
        v41 = __68__GCPhysicalInputProfile_applyGestureSettingsToButton_withSettings___block_invoke_136;
        char v42 = &unk_26D22D448;
        objc_copyWeak(&v43, (id *)buf);
        id v35 = (void *)MEMORY[0x223C6E420](&v39);
        switch(v20)
        {
          case 2:
            uint64_t v37 = getGCSettingsLogger();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)uint64_t v46 = 0;
              _os_log_impl(&dword_220998000, v37, OS_LOG_TYPE_INFO, "Double press for replay capture", v46, 2u);
            }

            objc_msgSend(v8, "setDoublePressHandler:", v35, v39, v40, v41, v42);
            break;
          case 1:
            int v38 = getGCSettingsLogger();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)uint64_t v46 = 0;
              _os_log_impl(&dword_220998000, v38, OS_LOG_TYPE_INFO, "Long press for replay capture", v46, 2u);
            }

            objc_msgSend(v8, "setLongPressHandler:", v35, v39, v40, v41, v42);
            break;
          case 0:
            int v36 = getGCSettingsLogger();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)uint64_t v46 = 0;
              _os_log_impl(&dword_220998000, v36, OS_LOG_TYPE_INFO, "Single press for replay capture", v46, 2u);
            }

            objc_msgSend(v8, "setSinglePressHandler:", v35, v39, v40, v41, v42);
            break;
        }

        objc_destroyWeak(&v43);
        objc_destroyWeak((id *)buf);
      }
    }
  }
}

void __68__GCPhysicalInputProfile_applyGestureSettingsToButton_withSettings___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained controller];
  [v1 _triggerGameIntentLongPress];
}

void __68__GCPhysicalInputProfile_applyGestureSettingsToButton_withSettings___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained controller];
  [v1 _triggerGameIntentShortPress];
}

void __68__GCPhysicalInputProfile_applyGestureSettingsToButton_withSettings___block_invoke_130(uint64_t a1)
{
  id v4 = +[_GCControllerManager sharedInstance];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v3 = [WeakRetained controller];
  [v4 onScreenshotTriggeredWithController:v3];
}

void __68__GCPhysicalInputProfile_applyGestureSettingsToButton_withSettings___block_invoke_132(uint64_t a1)
{
  id v4 = +[_GCControllerManager sharedInstance];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v3 = [WeakRetained controller];
  [v4 onVideoRecordingToggledWithController:v3 mode:0];
}

void __68__GCPhysicalInputProfile_applyGestureSettingsToButton_withSettings___block_invoke_136(uint64_t a1)
{
  id v4 = +[_GCControllerManager sharedInstance];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v3 = [WeakRetained controller];
  [v4 onVideoRecordingToggledWithController:v3 mode:1];
}

- (id)remappedElementForIndex:(int64_t)a3
{
  if ((unint64_t)a3 <= 0x2E)
  {
    id v4 = self->_remappedElements[a3];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (BOOL)hasRemappedElements
{
  return self->_hasRemappedElements;
}

- (NSString)mappedElementAliasForPhysicalInputName:(NSString *)inputName
{
  id v4 = inputName;
  if ([(GCPhysicalInputProfile *)self hasRemappedElements])
  {
    id v5 = [(NSMutableDictionary *)self->_elements objectForKeyedSubscript:v4];
    if (([v5 remappable] & 1) != 0
      || ([v5 collection],
          id v6 = objc_claimAutoreleasedReturnValue(),
          int v7 = [v6 remappable],
          v6,
          v7))
    {
      id v8 = [(NSDictionary *)self->_physicalInputNameToElementAlias objectForKeyedSubscript:v4];
    }
    else
    {
      id v8 = v4;
    }
    v9 = v8;
  }
  else
  {
    v9 = v4;
  }

  return v9;
}

- (NSSet)mappedPhysicalInputNamesForElementAlias:(NSString *)elementAlias
{
  id v4 = elementAlias;
  if ([(GCPhysicalInputProfile *)self hasRemappedElements])
  {
    id v5 = [(NSMutableDictionary *)self->_elements objectForKeyedSubscript:v4];
    if (([v5 remappable] & 1) != 0
      || ([v5 collection],
          id v6 = objc_claimAutoreleasedReturnValue(),
          int v7 = [v6 remappable],
          v6,
          v7))
    {
      uint64_t v8 = [(NSDictionary *)self->_elementAliasToPhysicalInputNames objectForKeyedSubscript:v4];
    }
    else
    {
      uint64_t v8 = objc_msgSend(objc_alloc((Class)&off_26D2B4EF0), "initWithObjects:", v4, 0);
    }
    v9 = (void *)v8;
  }
  else
  {
    v9 = objc_msgSend(objc_alloc((Class)&off_26D2B4E80), "initWithObjects:", v4, 0);
  }

  return (NSSet *)v9;
}

- (GCControllerElement)objectForKeyedSubscript:(NSString *)key
{
  return (GCControllerElement *)[(NSMutableDictionary *)self->_elements objectForKeyedSubscript:key];
}

- (void)updateElementDeviceReferences
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = self->_allElements;
  uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    p_device = &self->_device;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
        id WeakRetained = objc_loadWeakRetained((id *)p_device);
        objc_msgSend(v9, "setDevice:", WeakRetained, (void)v11);

        ++v8;
      }
      while (v5 != v8);
      uint64_t v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (id)_directionPadWithInfo:(id *)a3
{
  if (!a3->var1)
  {
    uint64_t v5 = 0;
    goto LABEL_23;
  }
  uint64_t v5 = [[GCControllerDirectionPad alloc] initWithDigital:a3->var2 descriptionName:a3->var0];
  [(GCControllerElement *)v5 setRemappable:a3->var5];
  [(GCControllerElement *)v5 setMappableToSystemGestures:a3->var7];
  [(GCControllerElement *)v5 setBoundToSystemGesture:a3->var6];
  [(GCControllerDirectionPad *)v5 setUnmappedNameLocalizationKey:a3->var9];
  [(GCControllerElement *)v5 setUnmappedSfSymbolsName:a3->var8];
  [(GCControllerElement *)v5 setAliases:a3->var10];
  if ([(GCControllerElement *)v5 isBoundToSystemGesture])
  {
    BOOL var6 = a3->var6;
    int v7 = [(GCControllerDirectionPad *)v5 up];
    [v7 setBoundToSystemGesture:var6];

    BOOL v8 = a3->var6;
    v9 = [(GCControllerDirectionPad *)v5 down];
    [v9 setBoundToSystemGesture:v8];

    BOOL v10 = a3->var6;
    long long v11 = [(GCControllerDirectionPad *)v5 left];
    [v11 setBoundToSystemGesture:v10];

    BOOL v12 = a3->var6;
    long long v13 = [(GCControllerDirectionPad *)v5 right];
    [v13 setBoundToSystemGesture:v12];
  }
  if (a3->var4 <= 0)
  {
    uint64_t v62 = [(GCControllerDirectionPad *)v5 up];
    [v62 setRemappingKey:0xFFFFFFFFLL];

    v63 = [(GCControllerDirectionPad *)v5 down];
    [v63 setRemappingKey:0xFFFFFFFFLL];

    int v64 = [(GCControllerDirectionPad *)v5 left];
    [v64 setRemappingKey:0xFFFFFFFFLL];

    v65 = [(GCControllerDirectionPad *)v5 right];
    [v65 setRemappingKey:0xFFFFFFFFLL];

    [(GCControllerElement *)v5 setRemappingKey:0xFFFFFFFFLL];
    uint64_t v66 = [(GCControllerDirectionPad *)v5 xAxis];
    [v66 setRemappingKey:0xFFFFFFFFLL];

    int v60 = [(GCControllerDirectionPad *)v5 yAxis];
    [v60 setRemappingKey:0xFFFFFFFFLL];
  }
  else
  {
    uint64_t var0 = a3->var3.var0.var0;
    int v15 = [(GCControllerDirectionPad *)v5 up];
    [v15 setRemappingKey:var0];

    uint64_t var1 = a3->var3.var1.var1;
    int v17 = [(GCControllerDirectionPad *)v5 down];
    [v17 setRemappingKey:var1];

    uint64_t var2 = a3->var3.var1.var2;
    uint64_t v19 = [(GCControllerDirectionPad *)v5 left];
    [v19 setRemappingKey:var2];

    uint64_t var3 = a3->var3.var1.var3;
    uint64_t v21 = [(GCControllerDirectionPad *)v5 right];
    [v21 setRemappingKey:var3];

    uint64_t v22 = [(GCControllerDirectionPad *)v5 up];
    -[GCControllerElement setRemappingKey:](v5, "setRemappingKey:", [v22 remappingKey]);

    uint64_t v23 = [(GCControllerDirectionPad *)v5 up];
    uint64_t v24 = [v23 remappingKey];
    id v25 = [(GCControllerDirectionPad *)v5 xAxis];
    [v25 setRemappingKey:v24];

    uint64_t v26 = [(GCControllerDirectionPad *)v5 up];
    uint64_t v27 = [v26 remappingKey];
    uint64_t v28 = [(GCControllerDirectionPad *)v5 yAxis];
    [v28 setRemappingKey:v27];

    uint64_t v29 = [(GCControllerDirectionPad *)v5 up];
    LODWORD(v27) = [v29 remappingKey];

    if ((v27 & 0x80000000) == 0)
    {
      int v30 = [(GCControllerDirectionPad *)v5 up];
      v31 = [(GCControllerDirectionPad *)v5 up];
      int v32 = [v31 remappingKey];
      char v33 = self->_remappedElements[v32];
      self->_remappedElements[v32] = v30;
    }
    char v34 = [(GCControllerDirectionPad *)v5 down];
    int v35 = [v34 remappingKey];

    if ((v35 & 0x80000000) == 0)
    {
      int v36 = [(GCControllerDirectionPad *)v5 down];
      uint64_t v37 = [(GCControllerDirectionPad *)v5 down];
      int v38 = [v37 remappingKey];
      v39 = self->_remappedElements[v38];
      self->_remappedElements[v38] = v36;
    }
    uint64_t v40 = [(GCControllerDirectionPad *)v5 left];
    int v41 = [v40 remappingKey];

    if ((v41 & 0x80000000) == 0)
    {
      char v42 = [(GCControllerDirectionPad *)v5 left];
      id v43 = [(GCControllerDirectionPad *)v5 left];
      int v44 = [v43 remappingKey];
      id v45 = self->_remappedElements[v44];
      self->_remappedElements[v44] = v42;
    }
    uint64_t v46 = [(GCControllerDirectionPad *)v5 right];
    int v47 = [v46 remappingKey];

    if ((v47 & 0x80000000) == 0)
    {
      id v48 = [(GCControllerDirectionPad *)v5 right];
      v49 = [(GCControllerDirectionPad *)v5 right];
      int v50 = [v49 remappingKey];
      id v51 = self->_remappedElements[v50];
      self->_remappedElements[v50] = v48;
    }
    int v52 = [a3->var8 isEqualToString:@"dpad"];
    id var8 = a3->var8;
    if (v52)
    {
      id v54 = [var8 stringByAppendingString:@".up.fill"];
      int v55 = [(GCControllerDirectionPad *)v5 up];
      [v55 setUnmappedSfSymbolsName:v54];

      int v56 = [a3->var8 stringByAppendingString:@".down.fill"];
      uint64_t v57 = [(GCControllerDirectionPad *)v5 down];
      [v57 setUnmappedSfSymbolsName:v56];

      uint64_t v58 = [a3->var8 stringByAppendingString:@".left.fill"];
      v59 = [(GCControllerDirectionPad *)v5 left];
      [v59 setUnmappedSfSymbolsName:v58];

      int v60 = [a3->var8 stringByAppendingString:@".right.fill"];
      v61 = [(GCControllerDirectionPad *)v5 right];
      [v61 setUnmappedSfSymbolsName:v60];
    }
    else
    {
      if (([var8 isEqualToString:@"l.joystick"] & 1) == 0
        && ![a3->var8 isEqualToString:@"r.joystick"])
      {
        goto LABEL_22;
      }
      uint64_t v67 = [a3->var8 stringByAppendingString:@".tilt.up"];
      v68 = [(GCControllerDirectionPad *)v5 up];
      [v68 setUnmappedSfSymbolsName:v67];

      int v69 = [a3->var8 stringByAppendingString:@".tilt.down"];
      v70 = [(GCControllerDirectionPad *)v5 down];
      [v70 setUnmappedSfSymbolsName:v69];

      uint64_t v71 = [a3->var8 stringByAppendingString:@".tilt.left"];
      v72 = [(GCControllerDirectionPad *)v5 left];
      [v72 setUnmappedSfSymbolsName:v71];

      int v60 = [a3->var8 stringByAppendingString:@".tilt.right"];
      v61 = [(GCControllerDirectionPad *)v5 right];
      [v61 setUnmappedSfSymbolsName:v60];
    }
  }
LABEL_22:
  [(GCPhysicalInputProfile *)self _registerTopLevelDirectionPad:v5];
LABEL_23:
  __destructor_8_s0_s48_s56_s64((uint64_t)a3);

  return v5;
}

- (id)_directionPadWithDescription:(id)a3
{
  id v4 = a3;
  uint64_t v7 = [v4 name];

  char v8 = 1;
  char v9 = [v4 isDigital];
  int v10 = [v4 sourceUpExtendedEventFieldIndex];
  int v11 = [v4 sourceDownExtendedEventFieldIndex];
  int v12 = [v4 sourceLeftExtendedEventFieldIndex];
  int v13 = [v4 sourceRightExtendedEventFieldIndex];
  int v14 = 1;
  char v15 = [v4 isRemappable];
  char v16 = [v4 isBoundToSystemGesture];
  char v17 = [v4 isMappableToSystemGestures];
  uint64_t v18 = [v4 symbolName];

  uint64_t v19 = [v4 nameLocalizationKey];

  uint64_t v20 = [v4 additionalAliases];

  __copy_constructor_8_8_s0_t8w39_s48_s56_s64((uint64_t)v6, (uint64_t)&v7);
  if (self)
  {
    self = [(GCPhysicalInputProfile *)self _directionPadWithInfo:v6];
  }
  else
  {
    __destructor_8_s0_s48_s56_s64((uint64_t)v6);
  }
  __destructor_8_s0_s48_s56_s64((uint64_t)&v7);

  return self;
}

- (id)_cursorWithInfo:(id *)a3
{
  if (a3->var1)
  {
    uint64_t v5 = [[GCDeviceCursor alloc] initWithDigital:a3->var2 descriptionName:a3->var0];
    [(GCPhysicalInputProfile *)self _registerTopLevelDirectionPad:v5];
  }
  else
  {
    uint64_t v5 = 0;
  }
  __destructor_8_s0_s48_s56_s64((uint64_t)a3);

  return v5;
}

- (id)_buttonWithInfo:(id *)a3
{
  if (a3->var1)
  {
    if (a3->var7)
    {
      uint64_t v5 = [[_GCControllerGestureAwareButtonInput alloc] initWithDescriptionName:a3->var0];
      [(NSMutableSet *)self->_allGestureAwareButtons addObject:v5];
    }
    else
    {
      uint64_t v6 = &classRef_GCDualSenseAdaptiveTrigger;
      if (a3->var3.var0.var3 != 1) {
        uint64_t v6 = &classRef_GCControllerButtonInput;
      }
      uint64_t v5 = (_GCControllerGestureAwareButtonInput *)[objc_alloc(*v6) initWithDescriptionName:a3->var0];
    }
    [(GCControllerButtonInput *)v5 setNonAnalog:a3->var2];
    [(GCControllerButtonInput *)v5 setTouchedAndValueDistinct:a3->var3.var0.var1];
    LODWORD(v7) = a3->var3.var1.var2;
    [(GCControllerButtonInput *)v5 setDeadzone:v7];
    [(GCControllerElement *)v5 setRemappable:a3->var5];
    [(GCControllerElement *)v5 setUnmappedNameLocalizationKey:a3->var9];
    [(GCControllerElement *)v5 setUnmappedSfSymbolsName:a3->var8];
    [(GCControllerElement *)v5 setMappableToSystemGestures:a3->var7];
    [(GCControllerElement *)v5 setBoundToSystemGesture:a3->var6];
    [(GCControllerElement *)v5 setAliases:a3->var10];
    if (a3->var4 <= 0)
    {
      [(GCControllerElement *)v5 setRemappingKey:0xFFFFFFFFLL];
    }
    else
    {
      [(GCControllerElement *)v5 setRemappingKey:a3->var3.var0.var0];
      if (([(GCControllerElement *)v5 remappingKey] & 0x80000000) == 0) {
        objc_storeStrong((id *)&self->_remappedElements[[(GCControllerElement *)v5 remappingKey]], v5);
      }
    }
    [(GCPhysicalInputProfile *)self _registerTopLevelButton:v5];
  }
  else
  {
    uint64_t v5 = 0;
  }
  __destructor_8_s0_s48_s56_s64((uint64_t)a3);

  return v5;
}

- (id)_buttonWithDescription:(id)a3
{
  id v4 = a3;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  unint64_t v5 = [v4 sourceExtendedEventFieldIndex];
  uint64_t v16 = [v4 name];

  char v17 = 1;
  char v18 = [v4 isDigital];
  if (v5 > 0x7FFFFFFFFFFFFFFELL) {
    int v6 = -1;
  }
  else {
    int v6 = v5;
  }
  int v19 = v6;
  char v20 = [v4 supportsTouch];
  [v4 sourcePressedThreshold];
  int v21 = v7;
  uint64_t v22 = 0;
  int v23 = 1;
  char v24 = [v4 isRemappable];
  char v25 = [v4 isBoundToSystemGesture];
  char v26 = [v4 isMappableToSystemGestures];
  uint64_t v8 = [v4 symbolName];
  char v9 = v27;
  uint64_t v27 = (void *)v8;

  uint64_t v10 = [v4 nameLocalizationKey];
  int v11 = v28;
  uint64_t v28 = (void *)v10;

  uint64_t v12 = [v4 additionalAliases];
  int v13 = v29;
  uint64_t v29 = (void *)v12;

  __copy_constructor_8_8_s0_t8w39_s48_s56_s64((uint64_t)v15, (uint64_t)&v16);
  if (self)
  {
    self = [(GCPhysicalInputProfile *)self _buttonWithInfo:v15];
  }
  else
  {
    __destructor_8_s0_s48_s56_s64((uint64_t)v15);
  }
  __destructor_8_s0_s48_s56_s64((uint64_t)&v16);

  return self;
}

- (id)_keyboardButtonWithInfo:(id *)a3
{
  unint64_t v5 = [(GCControllerButtonInput *)[GCKeyboardButtonElement alloc] initWithDescriptionName:a3->var0];
  [(GCControllerButtonInput *)v5 setNonAnalog:a3->var2];
  [(GCControllerButtonInput *)v5 setTouchedAndValueDistinct:a3->var3.var0.var1];
  LODWORD(v6) = a3->var3.var1.var2;
  [(GCControllerButtonInput *)v5 setDeadzone:v6];
  [(GCControllerElement *)v5 setRemappable:a3->var5];
  [(GCControllerElement *)v5 setUnmappedNameLocalizationKey:a3->var9];
  [(GCControllerElement *)v5 setUnmappedSfSymbolsName:a3->var8];
  [(GCControllerElement *)v5 setMappableToSystemGestures:a3->var7];
  [(GCControllerElement *)v5 setBoundToSystemGesture:a3->var6];
  [(GCControllerElement *)v5 setAliases:a3->var10];
  if (a3->var4 <= 0)
  {
    [(GCControllerElement *)v5 setRemappingKey:0xFFFFFFFFLL];
  }
  else
  {
    [(GCControllerElement *)v5 setRemappingKey:a3->var3.var0.var0];
    if (([(GCControllerElement *)v5 remappingKey] & 0x80000000) == 0) {
      objc_storeStrong((id *)&self->_remappedElements[[(GCControllerElement *)v5 remappingKey]], v5);
    }
  }
  [(GCPhysicalInputProfile *)self _registerTopLevelButton:v5];
  __destructor_8_s0_s48_s56_s64((uint64_t)a3);

  return v5;
}

- (id)_touchpadWithInfo:(id *)a3
{
  if (a3->var1)
  {
    unint64_t v5 = [[GCControllerTouchpad alloc] initWithDescriptionName:a3->var0];
    [(GCControllerElement *)v5 setRemappable:a3->var5];
    [(GCControllerElement *)v5 setMappableToSystemGestures:a3->var7];
    [(GCControllerElement *)v5 setBoundToSystemGesture:a3->var6];
    [(GCControllerElement *)v5 setUnmappedNameLocalizationKey:a3->var9];
    [(GCControllerElement *)v5 setUnmappedSfSymbolsName:a3->var8];
    [(GCControllerElement *)v5 setAliases:a3->var10];
    [(GCPhysicalInputProfile *)self _registerTopLevelTouchpad:v5];
  }
  else
  {
    unint64_t v5 = 0;
  }
  __destructor_8_s0_s48_s56_s64((uint64_t)a3);

  return v5;
}

- (void)_registerTopLevelButton:(id)a3
{
  id v4 = a3;
  if ((-[NSMutableSet containsObject:](self->_allButtons, "containsObject:") & 1) == 0)
  {
    [(NSMutableSet *)self->__topLevelElements addObject:v4];
    [(NSMutableSet *)self->__topLevelButtons addObject:v4];
    [(GCPhysicalInputProfile *)self _registerButton:v4];
  }
}

- (void)_registerTopLevelDirectionPad:(id)a3
{
  id v4 = a3;
  if ((-[NSMutableSet containsObject:](self->_allDpads, "containsObject:") & 1) == 0)
  {
    [(NSMutableSet *)self->__topLevelElements addObject:v4];
    [(NSMutableSet *)self->__topLevelDirectionPads addObject:v4];
    [(GCPhysicalInputProfile *)self _registerDirectionPad:v4];
  }
}

- (void)_registerTopLevelTouchpad:(id)a3
{
  id v4 = a3;
  if ((-[NSMutableSet containsObject:](self->__topLevelElements, "containsObject:") & 1) == 0)
  {
    [(NSMutableSet *)self->__topLevelElements addObject:v4];
    [(NSMutableSet *)self->__topLevelTouchpads addObject:v4];
    [(GCPhysicalInputProfile *)self _registerTouchpad:v4];
  }
}

- (void)_registerDirectionPad:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unint64_t v5 = objc_msgSend(v4, "aliases", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        [(NSMutableDictionary *)self->_elements setObject:v4 forKeyedSubscript:v10];
        [(NSMutableDictionary *)self->_dpads setObject:v4 forKeyedSubscript:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  [(NSMutableSet *)self->_allElements addObject:v4];
  [(NSMutableSet *)self->_allDpads addObject:v4];
  int v11 = [v4 xAxis];
  [(GCPhysicalInputProfile *)self _registerAxis:v11];

  uint64_t v12 = [v4 yAxis];
  [(GCPhysicalInputProfile *)self _registerAxis:v12];
}

- (void)_registerAxis:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unint64_t v5 = objc_msgSend(v4, "aliases", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        [(NSMutableDictionary *)self->_elements setObject:v4 forKeyedSubscript:v10];
        [(NSMutableDictionary *)self->_axes setObject:v4 forKeyedSubscript:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  [(NSMutableSet *)self->_allElements addObject:v4];
  [(NSMutableSet *)self->_allAxes addObject:v4];
  int v11 = [v4 positive];
  [(GCPhysicalInputProfile *)self _registerButton:v11];

  uint64_t v12 = [v4 negative];
  [(GCPhysicalInputProfile *)self _registerButton:v12];
}

- (void)_registerButton:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unint64_t v5 = objc_msgSend(v4, "aliases", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        [(NSMutableDictionary *)self->_elements setObject:v4 forKeyedSubscript:v10];
        [(NSMutableDictionary *)self->_buttons setObject:v4 forKeyedSubscript:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  [(NSMutableSet *)self->_allElements addObject:v4];
  [(NSMutableSet *)self->_allButtons addObject:v4];
}

- (void)_registerTouchpad:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unint64_t v5 = objc_msgSend(v4, "aliases", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        [(NSMutableDictionary *)self->_elements setObject:v4 forKeyedSubscript:v10];
        [(NSMutableDictionary *)self->_touchpads setObject:v4 forKeyedSubscript:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  [(NSMutableSet *)self->_allElements addObject:v4];
  [(NSMutableSet *)self->_allTouchpads addObject:v4];
  long long v11 = [v4 button];
  [(GCPhysicalInputProfile *)self _registerButton:v11];

  long long v12 = [v4 touchSurface];
  [(GCPhysicalInputProfile *)self _registerDirectionPad:v12];
}

- (void)_triggerValueChangedHandlerForElement:(id)a3 queue:(id)a4
{
  id v6 = a3;
  uint64_t v7 = a4;
  uint64_t v8 = [(GCPhysicalInputProfile *)self valueDidChangeHandler];
  char v9 = v8;
  if (v8)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __70__GCPhysicalInputProfile__triggerValueChangedHandlerForElement_queue___block_invoke;
    block[3] = &unk_26D22D470;
    id v12 = v8;
    block[4] = self;
    id v11 = v6;
    dispatch_async(v7, block);
  }
}

uint64_t __70__GCPhysicalInputProfile__triggerValueChangedHandlerForElement_queue___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_triggerValueChangedHandlerForElements:(id)a3 queue:(id)a4
{
  id v6 = a3;
  uint64_t v7 = a4;
  uint64_t v8 = [(GCPhysicalInputProfile *)self valueDidChangeHandler];
  if (v8)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __71__GCPhysicalInputProfile__triggerValueChangedHandlerForElements_queue___block_invoke;
    block[3] = &unk_26D22C468;
    id v10 = v6;
    id v11 = self;
    id v12 = v8;
    dispatch_async(v7, block);
  }
}

void __71__GCPhysicalInputProfile__triggerValueChangedHandlerForElements_queue___block_invoke(uint64_t a1)
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48));
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_receivedEventWithTimestamp:(unint64_t)a3
{
  uint64_t v4 = +[NSDate date];
  [v4 timeIntervalSince1970];
  double v6 = v5;

  kdebug_trace();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_device);
    [v9 _becomeCurrent];
  }

  [(GCPhysicalInputProfile *)self setLastEventTimestamp:v6];
}

- (void)_receivedEvent
{
  uint64_t v3 = mach_absolute_time();

  [(GCPhysicalInputProfile *)self _receivedEventWithTimestamp:v3];
}

- (NSString)description
{
  uint64_t v3 = [(GCPhysicalInputProfile *)self allElements];
  uint64_t v4 = [v3 count];
  double v5 = [(GCPhysicalInputProfile *)self allButtons];
  uint64_t v6 = [v5 count];
  long long v7 = [(GCPhysicalInputProfile *)self allAxes];
  uint64_t v8 = [v7 count];
  id v9 = [(GCPhysicalInputProfile *)self allDpads];
  long long v10 = +[NSString stringWithFormat:](&off_26D2B6E68, "stringWithFormat:", @"%lu elements (%lu buttons, %lu axes, %lu dpads)", v4, v6, v8, [v9 count]);

  return (NSString *)v10;
}

- (NSString)debugDescription
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  double v5 = [(GCPhysicalInputProfile *)self description];
  uint64_t v6 = +[NSString stringWithFormat:@"<%@: %p %@>", v4, self, v5];

  return (NSString *)v6;
}

- (GCPhysicalInputProfile)capture
{
  if (self->pooled) {
    id WeakRetained = (GCObjectPool *)objc_loadWeakRetained((id *)&self->weakPool);
  }
  else {
    id WeakRetained = self->pool;
  }
  v102 = WeakRetained;
  if (WeakRetained)
  {
    v127[0] = _NSConcreteStackBlock;
    v127[1] = 3221225472;
    v127[2] = __33__GCPhysicalInputProfile_capture__block_invoke;
    v127[3] = &unk_26D22D498;
    v127[4] = self;
    v128 = WeakRetained;
    -[GCObjectPool takeObjectOrCreateWith:](v128, "takeObjectOrCreateWith:", v127, v102);
    id v114 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v114 = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIdentifier:", self->_identifier, 0);
  }
  uint64_t v113 = +[NSMutableArray array];
  v112 = [(GCPhysicalInputProfile *)self handlerQueue];
  long long v123 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  int v107 = self;
  uint64_t v4 = self->__topLevelButtons;
  uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v123 objects:v131 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v124;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v124 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v123 + 1) + 8 * i);
        long long v10 = [v114 buttons];
        id v11 = [v9 primaryAlias];
        id v12 = [v10 objectForKeyedSubscript:v11];

        long long v13 = [v9 sfSymbolsName];
        [v12 setSfSymbolsName:v13];

        long long v14 = [v9 localizedName];
        [v12 setLocalizedName:v14];

        [v9 value];
        float v16 = v15;
        [v9 value];
        if (v17 <= 0.0) {
          uint64_t v18 = [v9 isTouched];
        }
        else {
          uint64_t v18 = 1;
        }
        id v19 = v12;
        id v20 = v112;
        id v21 = v113;
        int v23 = v18 ^ 1;
        if (v16 <= 0.0) {
          int v23 = 1;
        }
        if (v16 != 0.0 && v23 != 0) {
          -[GCPhysicalInputProfile capture]();
        }
        char v25 = v21;
        *(float *)&double v22 = v16;
        char v26 = [v19 _setValue:v20 queue:v22];
        int v27 = [v19 _setTouched:v18 queue:v20];
        if ((v26 & 1) != 0 || v27) {
          [v25 addObject:v19];
        }
      }
      uint64_t v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v123 objects:v131 count:16];
    }
    while (v6);
  }

  long long v121 = 0u;
  long long v122 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  id obj = v107->__topLevelDirectionPads;
  uint64_t v28 = [(NSMutableSet *)obj countByEnumeratingWithState:&v119 objects:v130 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v110 = *(void *)v120;
    do
    {
      for (uint64_t j = 0; j != v29; ++j)
      {
        if (*(void *)v120 != v110) {
          objc_enumerationMutation(obj);
        }
        v31 = *(void **)(*((void *)&v119 + 1) + 8 * j);
        int v32 = [v114 dpads];
        char v33 = [v31 primaryAlias];
        char v34 = [v32 objectForKeyedSubscript:v33];

        int v35 = [v31 sfSymbolsName];
        [v34 setSfSymbolsName:v35];

        int v36 = [v31 localizedName];
        [v34 setLocalizedName:v36];

        uint64_t v37 = [v31 up];
        int v38 = [v37 sfSymbolsName];

        if (v38)
        {
          v39 = [v31 up];
          uint64_t v40 = [v39 sfSymbolsName];
          int v41 = [v34 up];
          [v41 setSfSymbolsName:v40];
        }
        char v42 = [v31 down];
        id v43 = [v42 sfSymbolsName];

        if (v43)
        {
          int v44 = [v31 down];
          id v45 = [v44 sfSymbolsName];
          uint64_t v46 = [v34 down];
          [v46 setSfSymbolsName:v45];
        }
        int v47 = [v31 left];
        id v48 = [v47 sfSymbolsName];

        if (v48)
        {
          v49 = [v31 left];
          int v50 = [v49 sfSymbolsName];
          id v51 = [v34 left];
          [v51 setSfSymbolsName:v50];
        }
        int v52 = [v31 right];
        v53 = [v52 sfSymbolsName];

        if (v53)
        {
          id v54 = [v31 right];
          int v55 = [v54 sfSymbolsName];
          int v56 = [v34 right];
          [v56 setSfSymbolsName:v55];
        }
        uint64_t v57 = [v31 xAxis];
        [v57 value];
        int v59 = v58;
        int v60 = [v31 yAxis];
        [v60 value];
        int v62 = v61;
        id v63 = v34;
        id v64 = v112;
        id v65 = v113;
        uint64_t v66 = [v63 xAxis];
        LODWORD(v67) = v59;
        char v68 = [v66 _setValue:v64 queue:v67];

        int v69 = [v63 yAxis];
        LODWORD(v70) = v62;
        int v71 = [v69 _setValue:v64 queue:v70];

        if ((v68 & 1) != 0 || v71) {
          [v65 addObject:v63];
        }
      }
      uint64_t v29 = [(NSMutableSet *)obj countByEnumeratingWithState:&v119 objects:v130 count:16];
    }
    while (v29);
  }

  long long v117 = 0u;
  long long v118 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  v104 = v107->__topLevelTouchpads;
  uint64_t v106 = [(NSMutableSet *)v104 countByEnumeratingWithState:&v115 objects:v129 count:16];
  if (v106)
  {
    uint64_t v105 = *(void *)v116;
    do
    {
      for (uint64_t k = 0; k != v106; ++k)
      {
        if (*(void *)v116 != v105) {
          objc_enumerationMutation(v104);
        }
        int v73 = *(void **)(*((void *)&v115 + 1) + 8 * k);
        v74 = [v114 touchpads];
        uint64_t v75 = [v73 primaryAlias];
        v76 = [v74 objectForKeyedSubscript:v75];

        int v77 = [v73 sfSymbolsName];
        [v76 setSfSymbolsName:v77];

        v78 = [v73 localizedName];
        [v76 setLocalizedName:v78];

        uint64_t v79 = [v73 touchSurface];
        v80 = [v79 xAxis];
        [v80 value];
        int v82 = v81;
        v83 = [v73 touchSurface];
        int v111 = [v83 yAxis];
        [v111 value];
        int v85 = v84;
        uint64_t v86 = [v73 touchState];
        v87 = [v73 button];
        [v87 value];
        float v89 = v88;
        id v90 = v76;
        id v91 = v112;
        id v92 = v113;
        id v93 = [v90 button];
        id v94 = v91;
        BOOL v96 = v89 <= 0.0;
        if (!v86) {
          BOOL v96 = 1;
        }
        if (v89 != 0.0 && v96) {
          -[GCPhysicalInputProfile capture]();
        }
        id obja = v80;
        *(float *)&double v95 = v89;
        char v97 = [v93 _setValue:v94 queue:v95];
        int v98 = [v93 _setTouched:v86 != 0 queue:v94];
        if ((v97 & 1) != 0 || v98) {
          [0 addObject:v93];
        }

        LODWORD(v99) = v82;
        LODWORD(v100) = v85;
        if ([v90 setDigitizerX:v86 != 0 digitizerY:v94 touchDown:v99 queue:v100]) {
          [v92 addObject:v90];
        }
      }
      uint64_t v106 = [(NSMutableSet *)v104 countByEnumeratingWithState:&v115 objects:v129 count:16];
    }
    while (v106);
  }

  return (GCPhysicalInputProfile *)v114;
}

id __33__GCPhysicalInputProfile_capture__block_invoke(uint64_t a1)
{
  v1 = (void *)[objc_alloc((Class)objc_opt_class()) initWithIdentifier:*(void *)(*(void *)(a1 + 32) + 616) andPool:*(void *)(a1 + 40)];

  return v1;
}

- (void)setStateFromPhysicalInput:(GCPhysicalInputProfile *)physicalInput
{
  double v70 = physicalInput;
  uint64_t v4 = [(GCPhysicalInputProfile *)self device];
  if (!v4
    || (uint64_t v5 = (void *)v4,
        [(GCPhysicalInputProfile *)self controller],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 isSnapshot],
        v6,
        v5,
        v7))
  {
    int v82 = +[NSMutableArray array];
    int v81 = [(GCPhysicalInputProfile *)self handlerQueue];
    long long v91 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    uint64_t v8 = v70->__topLevelButtons;
    uint64_t v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v91 objects:v97 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v92;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v92 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v13 = *(void **)(*((void *)&v91 + 1) + 8 * i);
          buttons = self->_buttons;
          float v15 = [v13 primaryAlias];
          float v16 = [(NSMutableDictionary *)buttons objectForKeyedSubscript:v15];

          if (v16)
          {
            [v13 value];
            int v18 = v17;
            id v19 = v16;
            id v20 = v82;
            LODWORD(v21) = v18;
            if ([v19 _setValue:v81 queue:v21]) {
              [v20 addObject:v19];
            }
          }
        }
        uint64_t v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v91 objects:v97 count:16];
      }
      while (v10);
    }

    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    id obj = v70->__topLevelDirectionPads;
    uint64_t v78 = [(NSMutableSet *)obj countByEnumeratingWithState:&v87 objects:v96 count:16];
    v80 = self;
    if (v78)
    {
      uint64_t v76 = *(void *)v88;
      do
      {
        for (uint64_t j = 0; j != v78; ++j)
        {
          if (*(void *)v88 != v76) {
            objc_enumerationMutation(obj);
          }
          int v23 = *(void **)(*((void *)&v87 + 1) + 8 * j);
          dpads = self->_dpads;
          char v25 = [v23 primaryAlias];
          char v26 = [(NSMutableDictionary *)dpads objectForKeyedSubscript:v25];

          if (v26)
          {
            int v27 = [v23 xAxis];
            [v27 value];
            int v29 = v28;
            int v30 = [v23 yAxis];
            [v30 value];
            int v32 = v31;
            id v33 = v26;
            id v34 = v81;
            id v35 = v82;
            int v36 = [v33 xAxis];
            LODWORD(v37) = v29;
            char v38 = [v36 _setValue:v34 queue:v37];

            v39 = [v33 yAxis];
            LODWORD(v40) = v32;
            int v41 = [v39 _setValue:v34 queue:v40];

            if ((v38 & 1) != 0 || v41) {
              [v35 addObject:v33];
            }

            self = v80;
          }
        }
        uint64_t v78 = [(NSMutableSet *)obj countByEnumeratingWithState:&v87 objects:v96 count:16];
      }
      while (v78);
    }

    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    int v71 = v70->__topLevelTouchpads;
    uint64_t v73 = [(NSMutableSet *)v71 countByEnumeratingWithState:&v83 objects:v95 count:16];
    if (v73)
    {
      uint64_t v72 = *(void *)v84;
      do
      {
        for (uint64_t k = 0; k != v73; ++k)
        {
          if (*(void *)v84 != v72) {
            objc_enumerationMutation(v71);
          }
          id v43 = *(void **)(*((void *)&v83 + 1) + 8 * k);
          touchpads = self->_touchpads;
          id v45 = [v43 primaryAlias];
          uint64_t v46 = [(NSMutableDictionary *)touchpads objectForKeyedSubscript:v45];

          if (v46)
          {
            int v47 = [v43 touchSurface];
            uint64_t v79 = [v47 xAxis];
            [v79 value];
            int v49 = v48;
            int v77 = [v43 touchSurface];
            int v50 = [v77 yAxis];
            [v50 value];
            int v52 = v51;
            uint64_t v53 = [v43 touchState];
            id v54 = [v43 button];
            [v54 value];
            float v56 = v55;
            id v57 = v46;
            id v58 = v81;
            id v59 = v82;
            id v60 = [v57 button];
            id v61 = v58;
            BOOL v63 = v56 <= 0.0;
            if (!v53) {
              BOOL v63 = 1;
            }
            if (v56 != 0.0 && v63) {
              -[GCPhysicalInputProfile setStateFromPhysicalInput:]();
            }
            id v65 = v61;
            id obja = v46;
            *(float *)&double v62 = v56;
            char v66 = [v60 _setValue:v61 queue:v62];
            int v67 = [v60 _setTouched:v53 != 0 queue:v65];
            if ((v66 & 1) != 0 || v67) {
              [0 addObject:v60];
            }

            LODWORD(v68) = v49;
            LODWORD(v69) = v52;
            self = v80;
            if ([v57 setDigitizerX:v53 != 0 digitizerY:v65 touchDown:v68 queue:v69]) {
              [v59 addObject:v57];
            }

            uint64_t v46 = obja;
          }
        }
        uint64_t v73 = [(NSMutableSet *)v71 countByEnumeratingWithState:&v83 objects:v95 count:16];
      }
      while (v73);
    }
  }
}

- (NSObject)identifier
{
  return objc_getProperty(self, a2, 616, 1);
}

- (unint64_t)glyphFlags
{
  return self->_glyphFlags;
}

- (void)setGlyphFlags:(unint64_t)a3
{
  self->_glyphFlags = a3;
}

- (NSTimeInterval)lastEventTimestamp
{
  return self->_lastEventTimestamp;
}

- (void)setLastEventTimestamp:(double)a3
{
  self->_lastEventTimestamp = a3;
}

- (void)setHasRemappedElements:(BOOL)a3
{
  self->_hasRemappedElements = a3;
}

- (void)valueDidChangeHandler
{
  return self->_valueDidChangeHandler;
}

- (void)setValueDidChangeHandler:(void *)valueDidChangeHandler
{
}

- (NSDictionary)elements
{
  return &self->_elements->super;
}

- (NSDictionary)buttons
{
  return &self->_buttons->super;
}

- (NSDictionary)axes
{
  return &self->_axes->super;
}

- (NSDictionary)dpads
{
  return &self->_dpads->super;
}

- (NSDictionary)touchpads
{
  return &self->_touchpads->super;
}

- (NSSet)allElements
{
  return &self->_allElements->super;
}

- (NSSet)allButtons
{
  return &self->_allButtons->super;
}

- (NSSet)allAxes
{
  return &self->_allAxes->super;
}

- (NSSet)allDpads
{
  return &self->_allDpads->super;
}

- (NSSet)allTouchpads
{
  return &self->_allTouchpads->super;
}

- (GCSProfile)settingsProfile
{
  return self->_settingsProfile;
}

- (NSMutableSet)_topLevelElements
{
  return self->__topLevelElements;
}

- (NSMutableSet)_topLevelButtons
{
  return self->__topLevelButtons;
}

- (NSMutableSet)_topLevelDirectionPads
{
  return self->__topLevelDirectionPads;
}

- (NSMutableSet)_topLevelTouchpads
{
  return self->__topLevelTouchpads;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsProfile, 0);
  objc_storeStrong(&self->_valueDidChangeHandler, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_syntheticDeviceElementValueChangedHandler, 0);
  objc_storeStrong((id *)&self->_syntheticDeviceHandlerQueue, 0);
  objc_storeStrong((id *)&self->_systemGestureComponent, 0);
  objc_storeStrong((id *)&self->_elementAliasToPhysicalInputNames, 0);
  objc_storeStrong((id *)&self->_physicalInputNameToElementAlias, 0);
  objc_storeStrong((id *)&self->_allGestureAwareButtons, 0);
  for (uint64_t i = 552; i != 176; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  objc_storeStrong(&self->_valueDidChangedHandler, 0);
  objc_storeStrong((id *)&self->_touchpads, 0);
  objc_storeStrong((id *)&self->_dpads, 0);
  objc_storeStrong((id *)&self->_axes, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_elements, 0);
  objc_storeStrong((id *)&self->__topLevelTouchpads, 0);
  objc_storeStrong((id *)&self->__topLevelDirectionPads, 0);
  objc_storeStrong((id *)&self->__topLevelButtons, 0);
  objc_storeStrong((id *)&self->__topLevelElements, 0);
  objc_storeStrong((id *)&self->_allTouchpads, 0);
  objc_storeStrong((id *)&self->_allDpads, 0);
  objc_storeStrong((id *)&self->_allAxes, 0);
  objc_storeStrong((id *)&self->_allButtons, 0);
  objc_storeStrong((id *)&self->_allElements, 0);
  objc_storeStrong((id *)&self->_motion, 0);
  objc_storeStrong(&self->_gamepadEventObservation, 0);
  objc_destroyWeak((id *)&self->_device);
  objc_destroyWeak((id *)&self->weakPool);

  objc_storeStrong((id *)&self->pool, 0);
}

- (OS_dispatch_queue)syntheticDeviceHandlerQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 592, 1);
}

- (void)setSyntheticDeviceHandlerQueue:(id)a3
{
}

- (id)syntheticDeviceElementValueChangedHandler
{
  return objc_getProperty(self, a2, 600, 1);
}

- (void)setSyntheticDeviceElementValueChangedHandler:(id)a3
{
  id v5 = (id)MEMORY[0x223C6E420](a3);
  objc_setProperty(self, a2, 600, v5, 1, 1);
}

- (void)applySystemGestureComponent:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
      if ([v6 isSystemGestureObserver])
      {
        if (gc_isInternalBuild())
        {
          int v7 = getGCLogger();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
          {
            int v8 = 138412290;
            id v9 = v6;
            _os_log_impl(&dword_220998000, v7, OS_LOG_TYPE_INFO, "applySystemGestureComponent: %@", (uint8_t *)&v8, 0xCu);
          }
        }
        [v6 addObserver:self forKeyPath:@"systemGesturesState" options:5 context:kGCSystemGestureContext];
        objc_storeStrong((id *)&self->_systemGestureComponent, a3);
      }
    }
  }
}

- (void)updateSystemGesturesState:(id)a3
{
  id v4 = a3;
  if (gc_isInternalBuild())
  {
    char v26 = getGCLogger();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v43 = v4;
      _os_log_impl(&dword_220998000, v26, OS_LOG_TYPE_INFO, "updateSystemGesturesState - %@", buf, 0xCu);
    }
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v5 = self->_allGestureAwareButtons;
  uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v36;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v36 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v35 + 1) + 8 * v9++) setInputDisabledBySystem:0];
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v7);
  }

  uint64_t v10 = [v4 disabledSystemGestureInputNames];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v32;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v32 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v31 + 1) + 8 * v14);
        float v16 = [(GCPhysicalInputProfile *)self elements];
        int v17 = [v16 objectForKeyedSubscript:v15];

        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v17 setInputDisabledBySystem:1];
        }

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v31 objects:v40 count:16];
    }
    while (v12);
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  int v18 = objc_msgSend(v4, "enabledSystemGestureInputNames", 0);
  uint64_t v19 = [v18 countByEnumeratingWithState:&v27 objects:v39 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v28;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v27 + 1) + 8 * v22);
        char v24 = [(GCPhysicalInputProfile *)self elements];
        char v25 = [v24 objectForKeyedSubscript:v23];

        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v25 setInputDisabledBySystem:0];
        }

        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [v18 countByEnumeratingWithState:&v27 objects:v39 count:16];
    }
    while (v20);
  }
}

- (void)setGamepadEventSource:(id)a3
{
  id gamepadEventObservation = self->_gamepadEventObservation;
  self->_id gamepadEventObservation = 0;
  id v5 = a3;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __56__GCPhysicalInputProfile_PubSub__setGamepadEventSource___block_invoke;
  v8[3] = &__block_descriptor_40_e27_v16__0____GCGamepadEvent__8lu32l8;
  v8[4] = self;
  uint64_t v6 = [v5 observeGamepadEvents:v8];

  id v7 = self->_gamepadEventObservation;
  self->_id gamepadEventObservation = v6;
}

void __56__GCPhysicalInputProfile_PubSub__setGamepadEventSource___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 timestamp];
  [*(id *)(a1 + 32) _receivedEventWithTimestamp:v4];
  id v5 = [*(id *)(a1 + 32) controller];
  if (v5)
  {
    uint64_t v31 = v4;
    uint64_t v6 = +[NSMutableSet set];
    id v7 = [v5 handlerQueue];
    for (uint64_t i = 0; i != 47; ++i)
    {
      if (i != 23 && [v3 hasValidValueForElement:i])
      {
        uint64_t v9 = [*(id *)(a1 + 32) remappedElementForIndex:i];
        if (v9)
        {
          [v3 floatValueForElement:i];
          objc_msgSend(v9, "_setPendingValue:");
          uint64_t v10 = [v9 collection];

          if (v10)
          {
            uint64_t v11 = [v9 collection];
            [v6 addObject:v11];
          }
          else
          {
            [v6 addObject:v9];
          }
        }
      }
    }
    uint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 144) objectForKeyedSubscript:@"Button Menu"];
    if (v12)
    {
      int v13 = [v3 hasValidValueForElement:23];

      if (v13)
      {
        [v3 floatValueForElement:23];
        float v15 = v14;
        uint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 144) objectForKeyedSubscript:@"Button Menu"];
        float v16 = [*(id *)(*(void *)(a1 + 32) + 144) objectForKeyedSubscript:@"Button Menu"];
        *(float *)&double v17 = v15;
        [v16 _setPendingValue:v17];

        int v18 = [*(id *)(*(void *)(a1 + 32) + 144) objectForKeyedSubscript:@"Button Menu"];
        [v6 addObject:v18];

        if (v15 > 0.0 && ([v12 isPressed] & 1) == 0)
        {
          uint64_t v19 = [v5 handlerQueue];
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = __56__GCPhysicalInputProfile_PubSub__setGamepadEventSource___block_invoke_2;
          block[3] = &unk_26D22A8C0;
          id v41 = v5;
          dispatch_async(v19, block);
        }
      }
      else
      {
        uint64_t v12 = 0;
      }
    }

    uint64_t v20 = +[NSMutableSet set];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v21 = v6;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v36 objects:v42 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v37;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v37 != v24) {
            objc_enumerationMutation(v21);
          }
          char v26 = *(void **)(*((void *)&v36 + 1) + 8 * j);
          if ([v26 _commitPendingValueOnQueue:v7]) {
            [v20 addObject:v26];
          }
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v36 objects:v42 count:16];
      }
      while (v23);
    }

    if ([v20 count]) {
      [*(id *)(a1 + 32) _triggerValueChangedHandlerForElements:v20 queue:v7];
    }
    long long v27 = [*(id *)(a1 + 32) syntheticDeviceElementValueChangedHandler];
    if (v27)
    {
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = __56__GCPhysicalInputProfile_PubSub__setGamepadEventSource___block_invoke_429;
      v32[3] = &unk_26D22C7C8;
      id v33 = v20;
      id v34 = v27;
      uint64_t v35 = v31;
      long long v28 = (void (**)(void))MEMORY[0x223C6E420](v32);
      long long v29 = [*(id *)(a1 + 32) syntheticDeviceHandlerQueue];
      long long v30 = v29;
      if (v29) {
        dispatch_async(v29, v28);
      }
      else {
        v28[2](v28);
      }
    }
  }
}

void __56__GCPhysicalInputProfile_PubSub__setGamepadEventSource___block_invoke_2(uint64_t a1)
{
  if (gc_isInternalBuild())
  {
    uint64_t v4 = getGCLogger();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __56__GCPhysicalInputProfile_PubSub__setGamepadEventSource___block_invoke_2_cold_1(a1);
    }
  }
  id v2 = objc_msgSend(*(id *)(a1 + 32), "__deprecated_controllerPausedHandler");

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "__deprecated_controllerPausedHandler");
    id v3 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    v3[2](v3, *(void *)(a1 + 32));
  }
}

void __56__GCPhysicalInputProfile_PubSub__setGamepadEventSource___block_invoke_429(uint64_t a1)
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)thumbstickUserIntentHandler
{
  return 0;
}

- (void)settingsProfile:(void *)a1 differsFrom:.cold.1(void *a1)
{
  v1 = [a1 elementKey];
  OUTLINED_FUNCTION_0_29(&dword_220998000, v2, v3, "%@ dpad axis mappings are different!", v4, v5, v6, v7, 2u);
}

- (void)settingsProfile:(NSObject *)a3 differsFrom:.cold.2(void *a1, void *a2, NSObject *a3)
{
  uint64_t v6 = [a1 elementKey];
  uint64_t v7 = [a1 mappingKey];
  long long v8 = [a2 mappingKey];
  int v9 = 138412802;
  long long v10 = v6;
  __int16 v11 = 2112;
  uint64_t v12 = v7;
  __int16 v13 = 2112;
  float v14 = v8;
  _os_log_debug_impl(&dword_220998000, a3, OS_LOG_TYPE_DEBUG, "%@ was mapped to %@, is now mapped to %@. They're different!", (uint8_t *)&v9, 0x20u);
}

- (void)capture
{
  __assert_rtn("setButtonValueAndTouched", "GCControllerButtonInput_Private.h", 38, "(value > 0 && touched) || value == 0");
}

- (void)setStateFromPhysicalInput:.cold.1()
{
  __assert_rtn("setButtonValueAndTouched", "GCControllerButtonInput_Private.h", 38, "(value > 0 && touched) || value == 0");
}

void __56__GCPhysicalInputProfile_PubSub__setGamepadEventSource___block_invoke_2_cold_1(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) debugName];
  OUTLINED_FUNCTION_0_29(&dword_220998000, v2, v3, "%@ pause event", v4, v5, v6, v7, 2u);
}

@end