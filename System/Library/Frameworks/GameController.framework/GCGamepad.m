@interface GCGamepad
+ (BOOL)supportsSecureCoding;
- (BOOL)allowsRotation;
- (BOOL)reportsAbsoluteDpadValues;
- (GCControllerButtonInput)buttonA;
- (GCControllerButtonInput)buttonB;
- (GCControllerButtonInput)buttonMenu;
- (GCControllerButtonInput)buttonX;
- (GCControllerButtonInput)buttonY;
- (GCControllerButtonInput)leftShoulder;
- (GCControllerButtonInput)rightShoulder;
- (GCControllerDirectionPad)dpad;
- (GCGamepad)initWithCoder:(id)a3;
- (GCGamepad)initWithIdentifier:(id)a3;
- (GCGamepadSnapshot)saveSnapshot;
- (GCGamepadValueChangedHandler)valueChangedHandler;
- (id)name;
- (id)productCategory;
- (void)_initWithIdentifier:(int)a3 createDefaultElements:;
- (void)_legacy_handleEvent:(__IOHIDEvent *)a3;
- (void)_triggerValueChangedHandlerForElement:(id)a3 queue:(id)a4;
- (void)_triggerValueChangedHandlerForElements:(id)a3 queue:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setValueChangedHandler:(GCGamepadValueChangedHandler)valueChangedHandler;
@end

@implementation GCGamepad

- (id)productCategory
{
  return @"MFi";
}

- (void)_legacy_handleEvent:(__IOHIDEvent *)a3
{
  v4 = +[NSDate date];
  [v4 timeIntervalSince1970];
  -[GCPhysicalInputProfile setLastEventTimestamp:](self, "setLastEventTimestamp:");

  int Type = IOHIDEventGetType();
  if (Type == 35)
  {
    v11 = +[NSMutableArray array];
    v12 = [(GCPhysicalInputProfile *)self controller];
    v13 = [v12 handlerQueue];

    IOHIDEventGetFloatValue();
    float v15 = v14;
    IOHIDEventGetFloatValue();
    float v17 = v16;
    IOHIDEventGetFloatValue();
    float v19 = v18;
    IOHIDEventGetFloatValue();
    float v21 = v20;
    IOHIDEventGetFloatValue();
    float v23 = v22;
    IOHIDEventGetFloatValue();
    double v25 = v24;
    IOHIDEventGetFloatValue();
    double v27 = v26;
    IOHIDEventGetFloatValue();
    double v29 = v28;
    IOHIDEventGetFloatValue();
    double v70 = v30;
    IOHIDEventGetFloatValue();
    double v71 = v31;
    v32 = self->_dpad;
    v33 = v13;
    id v34 = v11;
    v35 = [(GCControllerDirectionPad *)v32 xAxis];
    *(float *)&double v36 = v21 - v19;
    char v37 = [v35 _setValue:v33 queue:v36];

    v38 = [(GCControllerDirectionPad *)v32 yAxis];
    *(float *)&double v39 = v15 - v17;
    int v40 = [v38 _setValue:v33 queue:v39];

    if ((v37 & 1) != 0 || v40) {
      objc_msgSend(v34, "addObject:", v32, *(void *)&v70);
    }
    float v41 = v25;

    v42 = self->_button0;
    id v43 = v34;
    *(float *)&double v44 = v23;
    if ([(GCControllerButtonInput *)v42 _setValue:v33 queue:v44]) {
      [v43 addObject:v42];
    }

    v46 = self->_button1;
    id v47 = v43;
    *(float *)&double v48 = v41;
    if ([(GCControllerButtonInput *)v46 _setValue:v33 queue:v48]) {
      [v47 addObject:v46];
    }
    float v49 = v29;

    v50 = self->_button2;
    id v51 = v47;
    float v45 = v27;
    *(float *)&double v52 = v45;
    if ([(GCControllerButtonInput *)v50 _setValue:v33 queue:v52]) {
      [v51 addObject:v50];
    }

    v54 = self->_button3;
    id v55 = v51;
    *(float *)&double v56 = v49;
    if ([(GCControllerButtonInput *)v54 _setValue:v33 queue:v56]) {
      [v55 addObject:v54];
    }

    v58 = self->_leftShoulder;
    id v59 = v55;
    float v53 = v70;
    *(float *)&double v60 = v53;
    if ([(GCControllerButtonInput *)v58 _setValue:v33 queue:v60]) {
      [v59 addObject:v58];
    }

    v61 = self->_rightShoulder;
    id v62 = v59;
    float v57 = v71;
    *(float *)&double v63 = v57;
    if ([(GCControllerButtonInput *)v61 _setValue:v33 queue:v63]) {
      [v62 addObject:v61];
    }

    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    id v64 = v62;
    uint64_t v65 = [v64 countByEnumeratingWithState:&v73 objects:v78 count:16];
    if (v65)
    {
      uint64_t v66 = v65;
      uint64_t v67 = *(void *)v74;
      do
      {
        for (uint64_t i = 0; i != v66; ++i)
        {
          if (*(void *)v74 != v67) {
            objc_enumerationMutation(v64);
          }
          uint64_t v69 = *(void *)(*((void *)&v73 + 1) + 8 * i);
          v72[0] = _NSConcreteStackBlock;
          v72[1] = 3221225472;
          v72[2] = __41__GCGamepad_Legacy___legacy_handleEvent___block_invoke_96;
          v72[3] = &unk_26D22A8E8;
          v72[4] = self;
          v72[5] = v69;
          dispatch_async(v33, v72);
        }
        uint64_t v66 = [v64 countByEnumeratingWithState:&v73 objects:v78 count:16];
      }
      while (v66);
    }
  }
  else if (Type == 3)
  {
    uint64_t IntegerValue = IOHIDEventGetIntegerValue();
    uint64_t v7 = IOHIDEventGetIntegerValue();
    uint64_t v8 = IOHIDEventGetIntegerValue();
    if (IntegerValue == 12 && v7 == 547 && v8 == 1)
    {
      v9 = [(GCPhysicalInputProfile *)self controller];
      v10 = [v9 handlerQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = __41__GCGamepad_Legacy___legacy_handleEvent___block_invoke;
      block[3] = &unk_26D22A8C0;
      block[4] = self;
      dispatch_async(v10, block);
    }
  }
}

void __41__GCGamepad_Legacy___legacy_handleEvent___block_invoke(uint64_t a1)
{
  if (gc_isInternalBuild())
  {
    uint64_t v7 = getGCLogger();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [*(id *)(a1 + 32) controller];
      v9 = [v8 debugName];
      int v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_220998000, v7, OS_LOG_TYPE_DEFAULT, "%@ pause event", (uint8_t *)&v10, 0xCu);
    }
  }
  v2 = [*(id *)(a1 + 32) controller];
  v3 = objc_msgSend(v2, "__deprecated_controllerPausedHandler");

  if (v3)
  {
    v4 = [*(id *)(a1 + 32) controller];
    objc_msgSend(v4, "__deprecated_controllerPausedHandler");
    v5 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    v6 = [*(id *)(a1 + 32) controller];
    ((void (**)(void, void *))v5)[2](v5, v6);
  }
}

void __41__GCGamepad_Legacy___legacy_handleEvent___block_invoke_96(uint64_t a1)
{
  if (gc_isInternalBuild())
  {
    v5 = getGCLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [*(id *)(a1 + 32) controller];
      uint64_t v7 = [v6 debugName];
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 138412546;
      int v10 = v7;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      _os_log_impl(&dword_220998000, v5, OS_LOG_TYPE_DEFAULT, "%@ changed: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  uint64_t v2 = [*(id *)(a1 + 32) valueDidChangeHandler];
  v3 = (void *)v2;
  if (v2) {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, *(void *)(a1 + 32), *(void *)(a1 + 40));
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 656);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_initWithIdentifier:(int)a3 createDefaultElements:
{
  if (!a1) {
    return 0;
  }
  v61.receiver = a1;
  v61.super_class = (Class)GCGamepad;
  uint64_t v4 = objc_msgSendSuper2(&v61, sel_initWithIdentifier_, a2);
  v5 = v4;
  if (v4) {
    BOOL v6 = a3 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    memset(v59, 0, sizeof(v59));
    uint64_t v60 = 0;
    v59[8] = 1;
    uint64_t v7 = [v4 _directionPadWithInfo:v59];
    uint64_t v8 = (void *)v5[83];
    v5[83] = v7;

    long long v58 = 0u;
    long long v57 = 0u;
    long long v56 = 0u;
    long long v55 = 0u;
    v54 = @"Button A";
    LOBYTE(v55) = 1;
    DWORD2(v55) = 4;
    uint64_t v9 = [v5 _buttonWithInfo:&v54];
    int v10 = (void *)v5[84];
    v5[84] = v9;

    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    float v49 = @"Button B";
    LOBYTE(v50) = 1;
    DWORD2(v50) = 5;
    uint64_t v11 = [v5 _buttonWithInfo:&v49];
    uint64_t v12 = (void *)v5[85];
    v5[85] = v11;

    long long v48 = 0u;
    long long v47 = 0u;
    long long v46 = 0u;
    long long v45 = 0u;
    double v44 = @"Button X";
    LOBYTE(v45) = 1;
    DWORD2(v45) = 6;
    uint64_t v13 = [v5 _buttonWithInfo:&v44];
    double v14 = (void *)v5[86];
    v5[86] = v13;

    long long v43 = 0u;
    long long v42 = 0u;
    long long v41 = 0u;
    long long v40 = 0u;
    double v39 = @"Button Y";
    LOBYTE(v40) = 1;
    DWORD2(v40) = 7;
    uint64_t v15 = [v5 _buttonWithInfo:&v39];
    double v16 = (void *)v5[87];
    v5[87] = v15;

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v34 = @"Left Shoulder";
    LOBYTE(v35) = 1;
    DWORD2(v35) = 8;
    uint64_t v17 = [v5 _buttonWithInfo:&v34];
    double v18 = (void *)v5[88];
    v5[88] = v17;

    long long v33 = 0u;
    long long v32 = 0u;
    long long v31 = 0u;
    long long v30 = 0u;
    double v29 = @"Right Shoulder";
    LOBYTE(v30) = 1;
    DWORD2(v30) = 9;
    uint64_t v19 = [v5 _buttonWithInfo:&v29];
    double v20 = (void *)v5[89];
    v5[89] = v19;

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    double v24 = @"Button Menu";
    LOBYTE(v25) = 1;
    DWORD2(v25) = 23;
    uint64_t v21 = [v5 _buttonWithInfo:&v24];
    double v22 = (void *)v5[90];
    v5[90] = v21;
  }
  return v5;
}

- (GCGamepad)initWithIdentifier:(id)a3
{
  return (GCGamepad *)-[GCGamepad _initWithIdentifier:createDefaultElements:](self, (uint64_t)a3, 1);
}

- (GCGamepad)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = GCIPCObjectIdentifier_Classes();
  BOOL v6 = [v4 decodeObjectOfClasses:v5 forKey:@"identifier"];

  uint64_t v7 = [(GCGamepad *)self initWithIdentifier:v6];
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

- (GCControllerDirectionPad)dpad
{
  dpad = self->_dpad;
  if (dpad)
  {
    v3 = dpad;
  }
  else
  {
    id v4 = [(GCPhysicalInputProfile *)self dpads];
    v3 = [v4 objectForKeyedSubscript:@"Direction Pad"];
  }

  return v3;
}

- (GCControllerButtonInput)buttonA
{
  button0 = self->_button0;
  if (button0)
  {
    v3 = button0;
  }
  else
  {
    id v4 = [(GCPhysicalInputProfile *)self buttons];
    v3 = [v4 objectForKeyedSubscript:@"Button A"];
  }

  return v3;
}

- (GCControllerButtonInput)buttonB
{
  button1 = self->_button1;
  if (button1)
  {
    v3 = button1;
  }
  else
  {
    id v4 = [(GCPhysicalInputProfile *)self buttons];
    v3 = [v4 objectForKeyedSubscript:@"Button A"];
  }

  return v3;
}

- (GCControllerButtonInput)buttonX
{
  button2 = self->_button2;
  if (button2)
  {
    v3 = button2;
  }
  else
  {
    id v4 = [(GCPhysicalInputProfile *)self buttons];
    v3 = [v4 objectForKeyedSubscript:@"Button A"];
  }

  return v3;
}

- (GCControllerButtonInput)buttonY
{
  button3 = self->_button3;
  if (button3)
  {
    v3 = button3;
  }
  else
  {
    id v4 = [(GCPhysicalInputProfile *)self buttons];
    v3 = [v4 objectForKeyedSubscript:@"Button A"];
  }

  return v3;
}

- (GCControllerButtonInput)leftShoulder
{
  leftShoulder = self->_leftShoulder;
  if (leftShoulder)
  {
    v3 = leftShoulder;
  }
  else
  {
    id v4 = [(GCPhysicalInputProfile *)self buttons];
    v3 = [v4 objectForKeyedSubscript:@"Left Shoulder"];
  }

  return v3;
}

- (GCControllerButtonInput)rightShoulder
{
  rightShoulder = self->_rightShoulder;
  if (rightShoulder)
  {
    v3 = rightShoulder;
  }
  else
  {
    id v4 = [(GCPhysicalInputProfile *)self buttons];
    v3 = [v4 objectForKeyedSubscript:@"Right Shoulder"];
  }

  return v3;
}

- (GCControllerButtonInput)buttonMenu
{
  buttonMenu = self->_buttonMenu;
  if (buttonMenu)
  {
    v3 = buttonMenu;
  }
  else
  {
    id v4 = [(GCPhysicalInputProfile *)self buttons];
    v3 = [v4 objectForKeyedSubscript:@"Button Menu"];
  }

  return v3;
}

- (id)name
{
  return @"Gamepad";
}

- (GCGamepadSnapshot)saveSnapshot
{
  *(_DWORD *)&snapshotData.version = 2359552;
  v3 = [(GCGamepad *)self dpad];
  id v4 = [v3 xAxis];
  [v4 value];
  snapshotData.dpadX = v5;

  BOOL v6 = [(GCGamepad *)self dpad];
  uint64_t v7 = [v6 yAxis];
  [v7 value];
  snapshotData.dpadY = v8;

  uint64_t v9 = [(GCGamepad *)self buttonA];
  [v9 value];
  snapshotData.buttonA = v10;

  uint64_t v11 = [(GCGamepad *)self buttonB];
  [v11 value];
  snapshotData.buttonB = v12;

  uint64_t v13 = [(GCGamepad *)self buttonX];
  [v13 value];
  snapshotData.buttonX = v14;

  uint64_t v15 = [(GCGamepad *)self buttonY];
  [v15 value];
  snapshotData.buttonY = v16;

  uint64_t v17 = [(GCGamepad *)self leftShoulder];
  [v17 value];
  snapshotData.leftShoulder = v18;

  uint64_t v19 = [(GCGamepad *)self rightShoulder];
  [v19 value];
  snapshotData.rightShoulder = v20;

  uint64_t v21 = NSDataFromGCGamepadSnapShotDataV100(&snapshotData);
  double v22 = [GCGamepadSnapshot alloc];
  float v23 = [(GCPhysicalInputProfile *)self controller];
  double v24 = [(GCGamepadSnapshot *)v22 initWithController:v23 snapshotData:v21];

  return v24;
}

- (BOOL)reportsAbsoluteDpadValues
{
  return 1;
}

- (BOOL)allowsRotation
{
  return 0;
}

- (void)_triggerValueChangedHandlerForElement:(id)a3 queue:(id)a4
{
  id v6 = a3;
  uint64_t v7 = a4;
  if (gc_isInternalBuild())
  {
    uint64_t v9 = getGCLogger();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      float v10 = [(GCPhysicalInputProfile *)self controller];
      uint64_t v11 = [v10 debugName];
      *(_DWORD *)buf = 138412546;
      float v16 = v11;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_220998000, v9, OS_LOG_TYPE_INFO, "%@ changed: %@", buf, 0x16u);
    }
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __57__GCGamepad__triggerValueChangedHandlerForElement_queue___block_invoke;
  block[3] = &unk_26D22D3F8;
  id v13 = v6;
  float v14 = self;
  block[4] = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

uint64_t __57__GCGamepad__triggerValueChangedHandlerForElement_queue___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) valueDidChangeHandler];
  uint64_t v3 = v2;
  uint64_t v6 = v2;
  if (v2)
  {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, *(void *)(a1 + 48), *(void *)(a1 + 40));
    uint64_t v3 = v6;
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 656);
  if (v4) {
    (*(void (**)(uint64_t, void, void, uint64_t))(v4 + 16))(v4, *(void *)(a1 + 48), *(void *)(a1 + 40), v3);
  }

  return MEMORY[0x270F9A828]();
}

- (void)_triggerValueChangedHandlerForElements:(id)a3 queue:(id)a4
{
  id v6 = a3;
  uint64_t v7 = a4;
  uint64_t v8 = [(GCGamepad *)self valueChangedHandler];
  uint64_t v9 = MEMORY[0x223C6E420](self->_valueChangedHandler);
  if (v8 | v9)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = __58__GCGamepad__triggerValueChangedHandlerForElements_queue___block_invoke;
    v10[3] = &unk_26D22D420;
    id v13 = (id)v8;
    id v11 = v6;
    float v12 = self;
    id v14 = (id)v9;
    dispatch_async(v7, v10);
  }
}

void __58__GCGamepad__triggerValueChangedHandlerForElements_queue___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 48))
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v2 = *(id *)(a1 + 32);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v17;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v17 != v5) {
            objc_enumerationMutation(v2);
          }
          (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v4);
    }
  }
  if (*(void *)(a1 + 56))
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          (*(void (**)(void))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56));
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
      }
      while (v9);
    }
  }
}

- (GCGamepadValueChangedHandler)valueChangedHandler
{
  return self->_valueChangedHandler;
}

- (void)setValueChangedHandler:(GCGamepadValueChangedHandler)valueChangedHandler
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonMenu, 0);
  objc_storeStrong((id *)&self->_rightShoulder, 0);
  objc_storeStrong((id *)&self->_leftShoulder, 0);
  objc_storeStrong((id *)&self->_button3, 0);
  objc_storeStrong((id *)&self->_button2, 0);
  objc_storeStrong((id *)&self->_button1, 0);
  objc_storeStrong((id *)&self->_button0, 0);
  objc_storeStrong((id *)&self->_dpad, 0);

  objc_storeStrong(&self->_valueChangedHandler, 0);
}

@end