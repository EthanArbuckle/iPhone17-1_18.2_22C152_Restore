@interface GCMicroGamepad
+ (BOOL)supportsSecureCoding;
+ (id)_current;
- (BOOL)allowsRotation;
- (BOOL)reportsAbsoluteDpadValues;
- (BOOL)supportsDpadTaps;
- (GCControllerButtonInput)buttonA;
- (GCControllerButtonInput)buttonMenu;
- (GCControllerButtonInput)buttonX;
- (GCControllerDirectionPad)dpad;
- (GCMicroGamepad)initWithCoder:(id)a3;
- (GCMicroGamepad)initWithIdentifier:(id)a3;
- (GCMicroGamepadSnapshot)saveSnapshot;
- (GCMicroGamepadValueChangedHandler)valueChangedHandler;
- (id)name;
- (id)productCategory;
- (void)_legacy_handleEvent:(__IOHIDEvent *)a3;
- (void)_triggerValueChangedHandlerForElement:(id)a3 queue:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)microControllerWithDigitizerX:(float)a3 digitizerY:(float)a4 timestamp:(unint64_t)a5 touchDown:(BOOL)a6;
- (void)setAllowsRotation:(BOOL)allowsRotation;
- (void)setLastEventTimestamp:(double)a3;
- (void)setReportsAbsoluteDpadValues:(BOOL)reportsAbsoluteDpadValues;
- (void)setStateFromMicroGamepad:(GCMicroGamepad *)microGamepad;
- (void)setValueChangedHandler:(GCMicroGamepadValueChangedHandler)valueChangedHandler;
@end

@implementation GCMicroGamepad

- (BOOL)supportsDpadTaps
{
  v2 = [(GCPhysicalInputProfile *)self controller];
  char v3 = [v2 isForwarded];

  return v3;
}

- (id)productCategory
{
  if (!GCCurrentProcessLinkedOnAfter(0x7E50901FFFFFFFFuLL)
    || ![(GCMicroGamepad *)self conformsToProtocol:&unk_26D294150])
  {
    v5 = @"Siri Remote";
    goto LABEL_6;
  }
  uint64_t v3 = [(GCMicroGamepad *)self deviceType];
  if ((unint64_t)(v3 - 1) < 2)
  {
    v4 = (id *)&GCProductCategorySiriRemote1stGen;
LABEL_11:
    v5 = (__CFString *)*v4;
    goto LABEL_6;
  }
  if (v3 == 4)
  {
    v4 = (id *)&GCProductCategoryControlCenterRemote;
    goto LABEL_11;
  }
  v5 = @"Generic Remote";
LABEL_6:

  return v5;
}

- (void)microControllerWithDigitizerX:(float)a3 digitizerY:(float)a4 timestamp:(unint64_t)a5 touchDown:(BOOL)a6
{
  BOOL v6 = a6;
  v11 = [(GCPhysicalInputProfile *)self controller];
  v12 = [v11 profile];

  v13 = [(GCPhysicalInputProfile *)self controller];
  v14 = [v13 profile];
  v15 = [v12 dpad];
  if (v6) {
    [v12 digitizerTouchEvent:v15 x:a5 y:0 timestamp:a3 forceSkipDpadRotation:a4];
  }
  else {
    [v12 digitizerTouchUp:v15 timestamp:a5 forceSkipDpadRotation:0];
  }

  v16 = [(GCPhysicalInputProfile *)self controller];
  v17 = [v16 handlerQueue];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = __87__GCMicroGamepad_Legacy__microControllerWithDigitizerX_digitizerY_timestamp_touchDown___block_invoke;
  v21[3] = &unk_26D22C640;
  id v22 = v13;
  id v23 = v12;
  id v24 = v14;
  v25 = self;
  id v18 = v14;
  id v19 = v12;
  id v20 = v13;
  dispatch_async(v17, v21);
}

void __87__GCMicroGamepad_Legacy__microControllerWithDigitizerX_digitizerY_timestamp_touchDown___block_invoke(uint64_t a1)
{
  if (gc_isInternalBuild())
  {
    v8 = getGCLogger();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [*(id *)(a1 + 32) debugName];
      v10 = [*(id *)(a1 + 40) dpad];
      int v11 = 138412546;
      v12 = v9;
      __int16 v13 = 2112;
      v14 = v10;
      _os_log_impl(&dword_220998000, v8, OS_LOG_TYPE_DEFAULT, "%@ changed: %@", (uint8_t *)&v11, 0x16u);
    }
  }
  v2 = [*(id *)(a1 + 48) valueDidChangeHandler];
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 56);
    v4 = [*(id *)(a1 + 40) dpad];
    ((void (**)(void, uint64_t, void *))v2)[2](v2, v3, v4);
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 656);
  if (v5)
  {
    uint64_t v6 = *(void *)(a1 + 56);
    v7 = [*(id *)(a1 + 40) dpad];
    (*(void (**)(uint64_t, uint64_t, void *))(v5 + 16))(v5, v6, v7);
  }
}

- (void)_legacy_handleEvent:(__IOHIDEvent *)a3
{
  v4 = +[NSDate date];
  [v4 timeIntervalSince1970];
  -[GCMicroGamepad setLastEventTimestamp:](self, "setLastEventTimestamp:");

  int Type = IOHIDEventGetType();
  if (Type != 11)
  {
    if (Type != 3) {
      return;
    }
    uint64_t v6 = self;
    uint64_t IntegerValue = IOHIDEventGetIntegerValue();
    uint64_t v8 = IOHIDEventGetIntegerValue();
    uint64_t v9 = v8;
    BOOL v10 = IntegerValue == 12 && v8 == 547 || IntegerValue == 1 && v8 == 134;
    uint64_t v22 = IOHIDEventGetIntegerValue();
    id v23 = [(GCPhysicalInputProfile *)v6 controller];
    id v24 = [v23 handlerQueue];
    v25 = v24;
    if (v24)
    {
      v26 = v24;
    }
    else
    {
      v26 = &_dispatch_main_q;
      id v27 = &_dispatch_main_q;
    }

    if (v22 == 1 && v10)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = __46__GCMicroGamepad_Legacy___legacy_handleEvent___block_invoke;
      block[3] = &unk_26D22A8C0;
      id v54 = v23;
      dispatch_async(v26, block);
    }
    if ([(GCMicroGamepad *)v6 conformsToProtocol:&unk_26D29C950]) {
      v29 = v6;
    }
    else {
      v29 = 0;
    }
    if (IntegerValue == 12)
    {
      if (v9 <= 127)
      {
        switch(v9)
        {
          case 'A':
            goto LABEL_42;
          case 'B':
            id v30 = [(GCMicroGamepad *)v6 dpad];
            if (v29)
            {
              BOOL v31 = v22 != 0;
              v32 = v29;
              id v33 = v30;
              uint64_t v34 = 1;
              goto LABEL_50;
            }
            float v41 = (float)v22;
            goto LABEL_59;
          case 'C':
            id v30 = [(GCMicroGamepad *)v6 dpad];
            if (v29)
            {
              BOOL v31 = v22 != 0;
              v32 = v29;
              id v33 = v30;
              uint64_t v34 = 8;
              goto LABEL_50;
            }
            float v41 = (float)-v22;
LABEL_59:
            v42 = [(GCPhysicalInputProfile *)v6 controller];
            v43 = [v42 handlerQueue];
            id v30 = v30;
            v44 = [v30 yAxis];
            goto LABEL_63;
          case 'D':
            id v30 = [(GCMicroGamepad *)v6 dpad];
            if (v29)
            {
              BOOL v31 = v22 != 0;
              v32 = v29;
              id v33 = v30;
              uint64_t v34 = 4;
              goto LABEL_50;
            }
            float v41 = (float)-v22;
            goto LABEL_62;
          case 'E':
            id v30 = [(GCMicroGamepad *)v6 dpad];
            if (v29)
            {
              BOOL v31 = v22 != 0;
              v32 = v29;
              id v33 = v30;
              uint64_t v34 = 2;
LABEL_50:
              uint64_t v36 = [(GCMicroGamepad *)v32 dpadDirectionEvent:v33 direction:v34 pressed:v31];
              goto LABEL_51;
            }
            float v41 = (float)v22;
LABEL_62:
            v42 = [(GCPhysicalInputProfile *)v6 controller];
            v43 = [v42 handlerQueue];
            id v30 = v30;
            v44 = [v30 xAxis];
LABEL_63:
            v46 = v44;
            *(float *)&double v45 = v41;
            char v47 = [v44 _setValue:v43 queue:v45];

            if (v47)
            {
              [0 addObject:v30];

              v39 = [(GCMicroGamepad *)v6 dpad];
            }
            else
            {

              v39 = 0;
            }

            break;
          default:
            goto LABEL_69;
        }
        goto LABEL_67;
      }
      if (v9 != 547)
      {
        if (v9 == 205)
        {
          id v30 = [(GCMicroGamepad *)v6 buttonX];
          *(float *)&double v40 = (float)v22;
          if ([v30 _setValue:v26 queue:v40])
          {
            uint64_t v36 = [(GCMicroGamepad *)v6 buttonX];
            goto LABEL_51;
          }
        }
        else
        {
          if (v9 != 128)
          {
LABEL_69:

            return;
          }
LABEL_42:
          v37 = [(GCMicroGamepad *)v6 buttonA];
          id v30 = v37;
          if (v29)
          {
            uint64_t v36 = [(GCMicroGamepad *)v29 centerButtonEvent:v37 pressed:v22 != 0];
            goto LABEL_51;
          }
          *(float *)&double v38 = (float)v22;
          if ([v37 _setValue:v26 queue:v38])
          {
            uint64_t v36 = [(GCMicroGamepad *)v6 buttonA];
            goto LABEL_51;
          }
        }
        goto LABEL_56;
      }
    }
    else if (IntegerValue != 1 || v9 != 134)
    {
      goto LABEL_69;
    }
    id v30 = [(GCMicroGamepad *)v6 buttonMenu];
    *(float *)&double v35 = (float)v22;
    if ([v30 _setValue:v26 queue:v35])
    {
      uint64_t v36 = [(GCMicroGamepad *)v6 buttonMenu];
LABEL_51:
      v39 = (void *)v36;
      goto LABEL_67;
    }
LABEL_56:
    v39 = 0;
LABEL_67:

    if (v39)
    {
      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472;
      v49[2] = __46__GCMicroGamepad_Legacy___legacy_handleEvent___block_invoke_164;
      v49[3] = &unk_26D22B618;
      v50 = v6;
      id v51 = v39;
      v52 = v50;
      id v48 = v39;
      dispatch_async(v26, v49);
    }
    goto LABEL_69;
  }
  IOHIDEventGetFloatValue();
  double v12 = v11;
  IOHIDEventGetFloatValue();
  double v14 = v13;
  uint64_t TimeStamp = IOHIDEventGetTimeStamp();
  if (IOHIDEventGetIntegerValue() && IOHIDEventGetIntegerValue() == 1)
  {
    double v16 = v12 * 2.0 + -1.0;
    *(float *)&double v16 = v16;
    double v17 = v14 * 2.0 + -1.0;
    *(float *)&double v17 = v17;
    *(float *)&double v17 = -*(float *)&v17;
    id v18 = self;
    uint64_t v19 = TimeStamp;
    uint64_t v20 = 1;
  }
  else
  {
    double v16 = 0.0;
    double v17 = 0.0;
    id v18 = self;
    uint64_t v19 = TimeStamp;
    uint64_t v20 = 0;
  }

  [(GCMicroGamepad *)v18 microControllerWithDigitizerX:v19 digitizerY:v20 timestamp:v16 touchDown:v17];
}

void __46__GCMicroGamepad_Legacy___legacy_handleEvent___block_invoke(uint64_t a1)
{
  if (gc_isInternalBuild())
  {
    v4 = getGCLogger();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = [*(id *)(a1 + 32) debugName];
      int v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_220998000, v4, OS_LOG_TYPE_DEFAULT, "%@ pause event", (uint8_t *)&v6, 0xCu);
    }
  }
  v2 = objc_msgSend(*(id *)(a1 + 32), "__deprecated_controllerPausedHandler");

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "__deprecated_controllerPausedHandler");
    uint64_t v3 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    v3[2](v3, *(void *)(a1 + 32));
  }
}

void __46__GCMicroGamepad_Legacy___legacy_handleEvent___block_invoke_164(uint64_t a1)
{
  if (gc_isInternalBuild())
  {
    uint64_t v5 = getGCLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = [*(id *)(a1 + 32) controller];
      v7 = [v6 debugName];
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 138412546;
      BOOL v10 = v7;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      _os_log_impl(&dword_220998000, v5, OS_LOG_TYPE_DEFAULT, "%@ changed: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  uint64_t v2 = [*(id *)(a1 + 32) valueDidChangeHandler];
  uint64_t v3 = (void *)v2;
  if (v2) {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, *(void *)(a1 + 48), *(void *)(a1 + 40));
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 656);
  if (v4) {
    (*(void (**)(uint64_t, void, void))(v4 + 16))(v4, *(void *)(a1 + 48), *(void *)(a1 + 40));
  }
}

- (void)setLastEventTimestamp:(double)a3
{
  v3.receiver = self;
  v3.super_class = (Class)GCMicroGamepad;
  [(GCPhysicalInputProfile *)&v3 setLastEventTimestamp:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCMicroGamepad)initWithIdentifier:(id)a3
{
  v33.receiver = self;
  v33.super_class = (Class)GCMicroGamepad;
  objc_super v3 = [(GCPhysicalInputProfile *)&v33 initWithIdentifier:a3];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v30 = 0;
    memset(v29, 0, sizeof(v29));
    v29[8] = 1;
    BOOL v31 = @"SIRI_REMOTE_DIRECTION_PAD";
    uint64_t v32 = 0;
    uint64_t v5 = [(GCPhysicalInputProfile *)v3 _directionPadWithInfo:v29];
    dpad = v4->_dpad;
    v4->_dpad = (GCControllerDirectionPad *)v5;

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v24 = @"Button A";
    LOWORD(v25) = 257;
    *(void *)&long long v28 = @"SIRI_REMOTE_BUTTON_A";
    uint64_t v7 = [(GCPhysicalInputProfile *)v4 _buttonWithInfo:&v24];
    button0 = v4->_button0;
    v4->_button0 = (GCControllerButtonInput *)v7;

    long long v23 = 0u;
    long long v22 = 0u;
    long long v21 = 0u;
    long long v20 = 0u;
    uint64_t v19 = @"Button X";
    LOWORD(v20) = 257;
    *(void *)&long long v23 = @"SIRI_REMOTE_BUTTON_X";
    uint64_t v9 = [(GCPhysicalInputProfile *)v4 _buttonWithInfo:&v19];
    button1 = v4->_button1;
    v4->_button1 = (GCControllerButtonInput *)v9;

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    double v14 = @"Button Menu";
    LOWORD(v15) = 257;
    *(void *)&long long v18 = @"SIRI_REMOTE_BUTTON_MENU";
    uint64_t v11 = [(GCPhysicalInputProfile *)v4 _buttonWithInfo:&v14];
    buttonMenu = v4->_buttonMenu;
    v4->_buttonMenu = (GCControllerButtonInput *)v11;
  }
  return v4;
}

- (GCMicroGamepad)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = GCIPCObjectIdentifier_Classes();
  int v6 = [v4 decodeObjectOfClasses:v5 forKey:@"identifier"];

  uint64_t v7 = [(GCMicroGamepad *)self initWithIdentifier:v6];
  if (v7) {
    -[GCControllerDirectionPad setNonAnalog:](v7->_dpad, "setNonAnalog:", [v4 decodeBoolForKey:@"digital"]);
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(GCPhysicalInputProfile *)self identifier];
  [v5 encodeObject:v4 forKey:@"identifier"];

  [v5 encodeBool:0 forKey:@"digital"];
}

- (GCMicroGamepadSnapshot)saveSnapshot
{
  snapshotData.version = 256;
  snapshotData.size = 20;
  objc_super v3 = [(GCMicroGamepad *)self dpad];
  id v4 = [v3 xAxis];
  [v4 value];
  snapshotData.dpadX = v5;

  int v6 = [(GCMicroGamepad *)self dpad];
  uint64_t v7 = [v6 yAxis];
  [v7 value];
  snapshotData.dpadY = v8;

  uint64_t v9 = [(GCMicroGamepad *)self buttonA];
  [v9 value];
  snapshotData.buttonA = v10;

  uint64_t v11 = [(GCMicroGamepad *)self buttonX];
  [v11 value];
  snapshotData.buttonX = v12;

  double v13 = NSDataFromGCMicroGamepadSnapshotData(&snapshotData);
  double v14 = [GCMicroGamepadSnapshot alloc];
  long long v15 = [(GCPhysicalInputProfile *)self controller];
  long long v16 = [(GCMicroGamepadSnapshot *)v14 initWithController:v15 snapshotData:v13];

  return v16;
}

- (id)name
{
  return @"MicroGamepad";
}

- (void)setStateFromMicroGamepad:(GCMicroGamepad *)microGamepad
{
  v56 = microGamepad;
  uint64_t v4 = [(GCPhysicalInputProfile *)self controller];
  if (!v4
    || (float v5 = (void *)v4,
        [(GCPhysicalInputProfile *)self controller],
        int v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 isSnapshot],
        v6,
        v5,
        v7))
  {
    float v8 = +[NSMutableArray array];
    uint64_t v9 = [(GCPhysicalInputProfile *)self controller];
    float v10 = [v9 handlerQueue];

    dpad = self->_dpad;
    v55 = [(GCMicroGamepad *)v56 dpad];
    id v54 = [v55 xAxis];
    [v54 value];
    int v13 = v12;
    double v14 = [(GCMicroGamepad *)v56 dpad];
    long long v15 = [v14 yAxis];
    [v15 value];
    int v17 = v16;
    long long v18 = dpad;
    uint64_t v19 = v10;
    id v20 = v8;
    long long v21 = [(GCControllerDirectionPad *)v18 xAxis];
    LODWORD(v22) = v13;
    char v23 = [v21 _setValue:v19 queue:v22];

    id v24 = [(GCControllerDirectionPad *)v18 yAxis];
    LODWORD(v25) = v17;
    int v26 = [v24 _setValue:v19 queue:v25];

    if ((v23 & 1) != 0 || v26) {
      [v20 addObject:v18];
    }

    buttonMenu = self->_buttonMenu;
    long long v28 = [(GCMicroGamepad *)v56 buttonMenu];
    [v28 value];
    int v30 = v29;
    BOOL v31 = buttonMenu;
    id v32 = v20;
    LODWORD(v33) = v30;
    if ([(GCControllerButtonInput *)v31 _setValue:v19 queue:v33]) {
      [v32 addObject:v31];
    }

    button0 = self->_button0;
    double v35 = [(GCMicroGamepad *)v56 buttonA];
    [v35 value];
    int v37 = v36;
    double v38 = button0;
    id v39 = v32;
    LODWORD(v40) = v37;
    if ([(GCControllerButtonInput *)v38 _setValue:v19 queue:v40]) {
      [v39 addObject:v38];
    }

    button1 = self->_button1;
    v42 = [(GCMicroGamepad *)v56 buttonX];
    [v42 value];
    int v44 = v43;
    double v45 = button1;
    id v46 = v39;
    LODWORD(v47) = v44;
    if ([(GCControllerButtonInput *)v45 _setValue:v19 queue:v47]) {
      [v46 addObject:v45];
    }

    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v48 = v46;
    uint64_t v49 = [v48 countByEnumeratingWithState:&v60 objects:v64 count:16];
    if (v49)
    {
      uint64_t v50 = v49;
      uint64_t v51 = *(void *)v61;
      do
      {
        uint64_t v52 = 0;
        do
        {
          if (*(void *)v61 != v51) {
            objc_enumerationMutation(v48);
          }
          uint64_t v53 = *(void *)(*((void *)&v60 + 1) + 8 * v52);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = __43__GCMicroGamepad_setStateFromMicroGamepad___block_invoke;
          block[3] = &unk_26D22B618;
          void block[4] = self;
          v58 = v56;
          uint64_t v59 = v53;
          dispatch_async(v19, block);

          ++v52;
        }
        while (v50 != v52);
        uint64_t v50 = [v48 countByEnumeratingWithState:&v60 objects:v64 count:16];
      }
      while (v50);
    }
  }
}

void __43__GCMicroGamepad_setStateFromMicroGamepad___block_invoke(uint64_t a1)
{
  if (gc_isInternalBuild())
  {
    float v5 = getGCLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = [*(id *)(a1 + 32) controller];
      int v7 = [v6 debugName];
      float v8 = [*(id *)(a1 + 40) controller];
      uint64_t v9 = [v8 debugName];
      uint64_t v10 = *(void *)(a1 + 48);
      int v11 = 138412802;
      int v12 = v7;
      __int16 v13 = 2112;
      double v14 = v9;
      __int16 v15 = 2112;
      uint64_t v16 = v10;
      _os_log_impl(&dword_220998000, v5, OS_LOG_TYPE_DEFAULT, "set %@ StateFromMicroGamepad %@: %@", (uint8_t *)&v11, 0x20u);
    }
  }
  uint64_t v2 = [*(id *)(a1 + 32) valueDidChangeHandler];
  objc_super v3 = (void *)v2;
  if (v2) {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, *(void *)(a1 + 32), *(void *)(a1 + 48));
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 656);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
}

+ (id)_current
{
  uint64_t v2 = +[_GCControllerManager sharedInstance];
  objc_super v3 = [v2 currentMicroGamepad];

  return v3;
}

- (void)_triggerValueChangedHandlerForElement:(id)a3 queue:(id)a4
{
  id v6 = a3;
  int v7 = a4;
  if (gc_isInternalBuild())
  {
    uint64_t v9 = getGCLogger();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = [(GCPhysicalInputProfile *)self controller];
      int v11 = [v10 debugName];
      *(_DWORD *)buf = 138412546;
      uint64_t v16 = v11;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_220998000, v9, OS_LOG_TYPE_INFO, "%@ changed: %@", buf, 0x16u);
    }
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __62__GCMicroGamepad__triggerValueChangedHandlerForElement_queue___block_invoke;
  block[3] = &unk_26D22A910;
  void block[4] = self;
  id v13 = v6;
  double v14 = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

uint64_t __62__GCMicroGamepad__triggerValueChangedHandlerForElement_queue___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) valueDidChangeHandler];
  uint64_t v3 = v2;
  uint64_t v6 = v2;
  if (v2)
  {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, *(void *)(a1 + 32), *(void *)(a1 + 40));
    uint64_t v3 = v6;
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 656);
  if (v4) {
    (*(void (**)(uint64_t, void, void, uint64_t))(v4 + 16))(v4, *(void *)(a1 + 48), *(void *)(a1 + 40), v3);
  }

  return MEMORY[0x270F9A828]();
}

- (GCControllerButtonInput)buttonA
{
  return self->_button0;
}

- (GCControllerButtonInput)buttonX
{
  return self->_button1;
}

- (GCMicroGamepadValueChangedHandler)valueChangedHandler
{
  return self->_valueChangedHandler;
}

- (void)setValueChangedHandler:(GCMicroGamepadValueChangedHandler)valueChangedHandler
{
}

- (GCControllerDirectionPad)dpad
{
  return self->_dpad;
}

- (GCControllerButtonInput)buttonMenu
{
  return self->_buttonMenu;
}

- (BOOL)reportsAbsoluteDpadValues
{
  return self->_reportsAbsoluteDpadValues;
}

- (void)setReportsAbsoluteDpadValues:(BOOL)reportsAbsoluteDpadValues
{
  self->_reportsAbsoluteDpadValues = reportsAbsoluteDpadValues;
}

- (BOOL)allowsRotation
{
  return self->_allowsRotation;
}

- (void)setAllowsRotation:(BOOL)allowsRotation
{
  self->_allowsRotation = allowsRotation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonMenu, 0);
  objc_storeStrong((id *)&self->_dpad, 0);
  objc_storeStrong((id *)&self->_button1, 0);
  objc_storeStrong((id *)&self->_button0, 0);

  objc_storeStrong(&self->_valueChangedHandler, 0);
}

@end