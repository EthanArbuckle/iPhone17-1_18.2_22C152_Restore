@interface GCExtendedGamepad
+ (BOOL)supportsSecureCoding;
+ (id)_current;
- (BOOL)allowsRotation;
- (BOOL)recordUsagePresent;
- (BOOL)reportsAbsoluteDpadValues;
- (BOOL)snapshotUsagePresent;
- (GCControllerButtonInput)_buttonShare;
- (GCControllerButtonInput)buttonA;
- (GCControllerButtonInput)buttonB;
- (GCControllerButtonInput)buttonHome;
- (GCControllerButtonInput)buttonMenu;
- (GCControllerButtonInput)buttonOptions;
- (GCControllerButtonInput)buttonX;
- (GCControllerButtonInput)buttonY;
- (GCControllerButtonInput)leftShoulder;
- (GCControllerButtonInput)leftThumbstickButton;
- (GCControllerButtonInput)leftTrigger;
- (GCControllerButtonInput)rightShoulder;
- (GCControllerButtonInput)rightThumbstickButton;
- (GCControllerButtonInput)rightTrigger;
- (GCControllerDirectionPad)dpad;
- (GCControllerDirectionPad)leftThumbstick;
- (GCControllerDirectionPad)rightThumbstick;
- (GCExtendedGamepad)initWithCoder:(id)a3;
- (GCExtendedGamepad)initWithController:(id)a3;
- (GCExtendedGamepad)initWithController:(id)a3 initInfo:(id *)a4;
- (GCExtendedGamepad)initWithIdentifier:(id)a3;
- (GCExtendedGamepad)initWithIdentifier:(id)a3 info:(id *)a4;
- (GCExtendedGamepad)initWithInfo:(id *)a3;
- (GCExtendedGamepadSnapshot)saveSnapshot;
- (GCExtendedGamepadValueChangedHandler)valueChangedHandler;
- (id)name;
- (id)productCategory;
- (id)setElementValuesFromExtendedGamepad:(id)a3;
- (id)thumbstickUserIntentHandler;
- (void)_handleGamepadEvent:(uint64_t)a1;
- (void)_legacy_handleEvent:(__IOHIDEvent *)a3;
- (void)_triggerValueChangedHandlerForElement:(id)a3 queue:(id)a4;
- (void)applyGlyphFlags;
- (void)encodeWithCoder:(id)a3;
- (void)handleGamepadEvent:(id)a3;
- (void)initAuxiliaryButtonsWithInitInfo:(id *)a3;
- (void)initShareFunctionalityWithInitInfo:(id *)a3;
- (void)setGamepadEventSource:(id)a3;
- (void)setStateFromExtendedGamepad:(GCExtendedGamepad *)extendedGamepad;
- (void)setThumbstickUserIntentHandler:(id)a3;
- (void)setThumbstickUserIntentHandler:(id)a3 slidingWindowTotalDuration:(double)a4 slidingWindowSegmentDuration:(double)a5 deadzone:(double)a6 sensitivity:(int)a7;
- (void)setValueChangedHandler:(GCExtendedGamepadValueChangedHandler)valueChangedHandler;
@end

@implementation GCExtendedGamepad

- (GCExtendedGamepad)initWithController:(id)a3 initInfo:(id *)a4
{
  id v6 = a3;
  v7 = [(GCExtendedGamepad *)self initWithInfo:a4];
  v8 = v7;
  if (v7) {
    [(GCPhysicalInputProfile *)v7 setController:v6];
  }

  return v8;
}

- (GCExtendedGamepad)initWithController:(id)a3
{
  id v4 = a3;
  memset(v8, 0, 512);
  GCExtendedGamepadInitInfoMake(v8);
  v5 = [(GCExtendedGamepad *)self initWithController:v4 initInfo:v8];
  for (uint64_t i = 0; i != 1584; i += 72)
    __destructor_8_s0_s48_s56_s64((uint64_t)v8 + i);

  return v5;
}

- (id)productCategory
{
  return @"MFi";
}

- (void)_legacy_handleEvent:(__IOHIDEvent *)a3
{
  id v4 = +[NSDate date];
  [v4 timeIntervalSince1970];
  -[GCPhysicalInputProfile setLastEventTimestamp:](self, "setLastEventTimestamp:");

  int Type = IOHIDEventGetType();
  if (Type != 35)
  {
    if (Type != 3) {
      return;
    }
    id v6 = self;
    if (IOHIDEventGetIntegerValue() != 12) {
      goto LABEL_97;
    }
    uint64_t IntegerValue = IOHIDEventGetIntegerValue();
    uint64_t v8 = IOHIDEventGetIntegerValue();
    if (IntegerValue == v6->_buttonMenuUsage)
    {
      v9 = [(GCExtendedGamepad *)v6 buttonMenu];
      id v10 = v9;
      if (v8 == 1 && ([v9 isPressed] & 1) == 0)
      {
        v11 = [(GCPhysicalInputProfile *)v6 controller];
        v12 = [v11 handlerQueue];
        *(void *)&blocuint64_t k = _NSConcreteStackBlock;
        *((void *)&block + 1) = 3221225472;
        *(void *)&long long v186 = __handleAncillaryButtonEvent_block_invoke;
        *((void *)&v186 + 1) = &unk_26D22A8C0;
        *(void *)&long long v187 = v6;
        dispatch_async(v12, &block);
      }
    }
    else
    {
      if (IntegerValue == v6->_buttonHomeUsage)
      {
        uint64_t v148 = [(GCExtendedGamepad *)v6 buttonHome];
      }
      else
      {
        if (IntegerValue != v6->_buttonOptionsUsage)
        {
          id v10 = 0;
LABEL_96:

LABEL_97:
          return;
        }
        uint64_t v148 = [(GCExtendedGamepad *)v6 buttonOptions];
      }
      id v10 = (id)v148;
    }
    if (v10)
    {
      float v149 = (float)v8;
      v150 = [(GCPhysicalInputProfile *)v6 controller];
      v151 = [v150 handlerQueue];
      *(float *)&double v152 = v149;
      int v153 = [v10 _setValue:v151 queue:v152];

      if (v153)
      {
        v154 = [(GCPhysicalInputProfile *)v6 controller];
        v155 = [v154 handlerQueue];
        v189[0] = _NSConcreteStackBlock;
        v189[1] = 3221225472;
        v189[2] = __handleAncillaryButtonEvent_block_invoke_101;
        v189[3] = &unk_26D22A8E8;
        v190 = v6;
        id v10 = v10;
        id v191 = v10;
        dispatch_async(v155, v189);
      }
    }
    goto LABEL_96;
  }
  IOHIDEventGetChildren();
  long long v169 = 0u;
  long long v170 = 0u;
  long long v171 = 0u;
  long long v172 = 0u;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = [v13 countByEnumeratingWithState:&v169 objects:v184 count:16];
  v168 = v13;
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v170;
LABEL_10:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v170 != v16) {
        objc_enumerationMutation(v13);
      }
      uint64_t v18 = *(void *)(*((void *)&v169 + 1) + 8 * v17);
      uint64_t v19 = IOHIDEventGetIntegerValue();
      uint64_t v20 = IOHIDEventGetIntegerValue();
      if (v19 == 65280 && v20 == 67) {
        break;
      }
      if (v15 == ++v17)
      {
        uint64_t v15 = [v13 countByEnumeratingWithState:&v169 objects:v184 count:16];
        if (v15) {
          goto LABEL_10;
        }
        goto LABEL_17;
      }
    }

    if (!v18) {
      goto LABEL_42;
    }
    v21 = self;
    DataValue = (void *)IOHIDEventGetDataValue();
    v23 = +[NSMutableSet set];
    v24 = [(GCPhysicalInputProfile *)v21 controller];
    v25 = [v24 handlerQueue];

    for (uint64_t i = 0; i != 47; ++i)
    {
      if ((*DataValue >> i))
      {
        v27 = [(GCPhysicalInputProfile *)v21 remappedElementForIndex:i];
        v29 = v27;
        if (v27)
        {
          LODWORD(v28) = *((_DWORD *)DataValue + i + 2);
          [v27 _setPendingValue:v28];
          v30 = [v29 collection];

          if (v30)
          {
            v31 = [v29 collection];
            [v23 addObject:v31];
          }
          else
          {
            [v23 addObject:v29];
          }
        }
      }
    }
    long long v182 = 0u;
    long long v183 = 0u;
    long long v180 = 0u;
    long long v181 = 0u;
    id v32 = v23;
    uint64_t v33 = [v32 countByEnumeratingWithState:&v180 objects:v189 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v181;
      do
      {
        for (uint64_t j = 0; j != v34; ++j)
        {
          if (*(void *)v181 != v35) {
            objc_enumerationMutation(v32);
          }
          [*(id *)(*((void *)&v180 + 1) + 8 * j) _commitPendingValueOnQueue:v25];
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v180 objects:v189 count:16];
      }
      while (v34);
    }

    long long v178 = 0u;
    long long v179 = 0u;
    long long v176 = 0u;
    long long v177 = 0u;
    id v37 = v32;
    uint64_t v38 = [v37 countByEnumeratingWithState:&v176 objects:&block count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v177;
      do
      {
        for (uint64_t k = 0; k != v39; ++k)
        {
          if (*(void *)v177 != v40) {
            objc_enumerationMutation(v37);
          }
          uint64_t v42 = *(void *)(*((void *)&v176 + 1) + 8 * k);
          v173[0] = _NSConcreteStackBlock;
          v173[1] = 3221225472;
          v173[2] = __handleGameControllerExtendedEvent_block_invoke;
          v173[3] = &unk_26D22A8E8;
          v174 = v21;
          uint64_t v175 = v42;
          dispatch_async(v25, v173);
        }
        uint64_t v39 = [v37 countByEnumeratingWithState:&v176 objects:&block count:16];
      }
      while (v39);
    }
  }
  else
  {
LABEL_17:

LABEL_42:
    v21 = self;
    v43 = +[NSMutableArray array];
    v44 = [(GCPhysicalInputProfile *)v21 controller];
    v45 = [v44 handlerQueue];

    IOHIDEventGetFloatValue();
    double v47 = v46;
    IOHIDEventGetFloatValue();
    double v49 = v48;
    IOHIDEventGetFloatValue();
    double v51 = v50;
    IOHIDEventGetFloatValue();
    double v53 = v52;
    IOHIDEventGetFloatValue();
    double v55 = v54;
    IOHIDEventGetFloatValue();
    double v57 = v56;
    IOHIDEventGetFloatValue();
    double v158 = v58;
    IOHIDEventGetFloatValue();
    double v157 = v59;
    IOHIDEventGetFloatValue();
    double v159 = v60;
    IOHIDEventGetFloatValue();
    double v160 = v61;
    IOHIDEventGetFloatValue();
    double v161 = v62;
    IOHIDEventGetFloatValue();
    double v162 = v63;
    IOHIDEventGetFloatValue();
    double v163 = v64;
    IOHIDEventGetFloatValue();
    double v164 = v65;
    IOHIDEventGetFloatValue();
    double v165 = v66;
    IOHIDEventGetFloatValue();
    double v166 = v67;
    float v68 = 0.0;
    float v167 = 0.0;
    if (v21->_leftThumbstickButton) {
      float v68 = (float)IOHIDEventGetIntegerValue();
    }
    float v156 = v68;
    float v70 = v49;
    float v72 = v53;
    if (v21->_rightThumbstickButton) {
      float v167 = (float)IOHIDEventGetIntegerValue();
    }
    v75 = v21->_dpad;
    id v76 = v45;
    id v77 = v43;
    v78 = [(GCControllerDirectionPad *)v75 xAxis];
    float v71 = v51;
    *(float *)&double v79 = v72 - v71;
    char v80 = [v78 _setValue:v76 queue:v79];

    v81 = [(GCControllerDirectionPad *)v75 yAxis];
    float v69 = v47;
    *(float *)&double v82 = v69 - v70;
    int v83 = [v81 _setValue:v76 queue:v82];

    if ((v80 & 1) != 0 || v83) {
      [v77 addObject:v75];
    }

    v86 = v21->_leftThumbstick;
    id v87 = v76;
    id v88 = v77;
    v89 = [(GCControllerDirectionPad *)v86 xAxis];
    float v73 = v55;
    *(float *)&double v90 = v73;
    char v91 = [v89 _setValue:v87 queue:v90];

    v92 = [(GCControllerDirectionPad *)v86 yAxis];
    float v74 = v57;
    *(float *)&double v93 = v74;
    int v94 = [v92 _setValue:v87 queue:v93];

    if ((v91 & 1) != 0 || v94) {
      [v88 addObject:v86];
    }

    v96 = v21->_rightThumbstick;
    v25 = v87;
    id v97 = v88;
    v98 = [(GCControllerDirectionPad *)v96 xAxis];
    float v84 = v158;
    *(float *)&double v99 = v84;
    char v100 = [v98 _setValue:v25 queue:v99];

    v101 = [(GCControllerDirectionPad *)v96 yAxis];
    float v85 = v157;
    *(float *)&double v102 = v85;
    int v103 = [v101 _setValue:v25 queue:v102];

    if ((v100 & 1) != 0 || v103) {
      [v97 addObject:v96];
    }

    v105 = v21->_button0;
    id v106 = v97;
    float v95 = v159;
    *(float *)&double v107 = v95;
    if ([(GCControllerButtonInput *)v105 _setValue:v25 queue:v107]) {
      [v106 addObject:v105];
    }

    v109 = v21->_button1;
    id v110 = v106;
    float v104 = v160;
    *(float *)&double v111 = v104;
    if ([(GCControllerButtonInput *)v109 _setValue:v25 queue:v111]) {
      [v110 addObject:v109];
    }

    v113 = v21->_button2;
    id v114 = v110;
    float v108 = v161;
    *(float *)&double v115 = v108;
    if ([(GCControllerButtonInput *)v113 _setValue:v25 queue:v115]) {
      [v114 addObject:v113];
    }

    v117 = v21->_button3;
    id v118 = v114;
    float v112 = v162;
    *(float *)&double v119 = v112;
    if ([(GCControllerButtonInput *)v117 _setValue:v25 queue:v119]) {
      [v118 addObject:v117];
    }

    v121 = v21->_leftShoulder;
    id v122 = v118;
    float v116 = v163;
    *(float *)&double v123 = v116;
    if ([(GCControllerButtonInput *)v121 _setValue:v25 queue:v123]) {
      [v122 addObject:v121];
    }

    v125 = v21->_rightShoulder;
    id v126 = v122;
    float v120 = v164;
    *(float *)&double v127 = v120;
    if ([(GCControllerButtonInput *)v125 _setValue:v25 queue:v127]) {
      [v126 addObject:v125];
    }

    v129 = v21->_leftTrigger;
    id v130 = v126;
    float v124 = v165;
    *(float *)&double v131 = v124;
    if ([(GCControllerButtonInput *)v129 _setValue:v25 queue:v131]) {
      [v130 addObject:v129];
    }

    v132 = v21->_rightTrigger;
    id v133 = v130;
    float v128 = v166;
    *(float *)&double v134 = v128;
    if ([(GCControllerButtonInput *)v132 _setValue:v25 queue:v134]) {
      [v133 addObject:v132];
    }

    leftThumbstickButton = v21->_leftThumbstickButton;
    if (leftThumbstickButton)
    {
      v136 = leftThumbstickButton;
      id v137 = v133;
      *(float *)&double v138 = v156;
      if ([(GCControllerButtonInput *)v136 _setValue:v25 queue:v138]) {
        [v137 addObject:v136];
      }
    }
    rightThumbstickButton = v21->_rightThumbstickButton;
    if (rightThumbstickButton)
    {
      v140 = rightThumbstickButton;
      id v141 = v133;
      *(float *)&double v142 = v167;
      if ([(GCControllerButtonInput *)v140 _setValue:v25 queue:v142]) {
        [v141 addObject:v140];
      }
    }
    long long v187 = 0u;
    long long v188 = 0u;
    blocuint64_t k = 0u;
    long long v186 = 0u;
    id v37 = v133;
    uint64_t v143 = [v37 countByEnumeratingWithState:&block objects:v189 count:16];
    if (v143)
    {
      uint64_t v144 = v143;
      uint64_t v145 = *(void *)v186;
      do
      {
        for (uint64_t m = 0; m != v144; ++m)
        {
          if (*(void *)v186 != v145) {
            objc_enumerationMutation(v37);
          }
          uint64_t v147 = *(void *)(*((void *)&block + 1) + 8 * m);
          *(void *)&long long v180 = _NSConcreteStackBlock;
          *((void *)&v180 + 1) = 3221225472;
          *(void *)&long long v181 = __handleGameControllerEvent_block_invoke;
          *((void *)&v181 + 1) = &unk_26D22A8E8;
          *(void *)&long long v182 = v21;
          *((void *)&v182 + 1) = v147;
          dispatch_async(v25, &v180);
        }
        uint64_t v144 = [v37 countByEnumeratingWithState:&block objects:v189 count:16];
      }
      while (v144);
    }
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCExtendedGamepad)initWithIdentifier:(id)a3
{
  id v4 = a3;
  memset(v9, 0, 512);
  GCExtendedGamepadInitInfoMake(v9);
  for (uint64_t i = 8; i != 1592; i += 72)
    *((unsigned char *)v9 + i) = 1;
  id v6 = [(GCExtendedGamepad *)self initWithIdentifier:v4 info:v9];
  for (uint64_t j = 0; j != 1584; j += 72)
    __destructor_8_s0_s48_s56_s64((uint64_t)v9 + j);

  return v6;
}

- (GCExtendedGamepad)initWithInfo:(id *)a3
{
  v5 = +[NSUUID UUID];
  id v6 = [(GCExtendedGamepad *)self initWithIdentifier:v5 info:a3];

  return v6;
}

- (GCExtendedGamepad)initWithIdentifier:(id)a3 info:(id *)a4
{
  v58.receiver = self;
  v58.super_class = (Class)GCExtendedGamepad;
  v5 = [(GCPhysicalInputProfile *)&v58 initWithIdentifier:a3];
  if (v5)
  {
    __copy_constructor_8_8_s0_t8w39_s48_s56_s64((uint64_t)v57, (uint64_t)a4);
    uint64_t v6 = [(GCPhysicalInputProfile *)v5 _directionPadWithInfo:v57];
    dpad = v5->_dpad;
    v5->_dpad = (GCControllerDirectionPad *)v6;

    __copy_constructor_8_8_s0_t8w39_s48_s56_s64((uint64_t)v56, (uint64_t)&a4->var0[5]);
    uint64_t v8 = [(GCPhysicalInputProfile *)v5 _directionPadWithInfo:v56];
    leftThumbsticuint64_t k = v5->_leftThumbstick;
    v5->_leftThumbsticuint64_t k = (GCControllerDirectionPad *)v8;

    __copy_constructor_8_8_s0_t8w39_s48_s56_s64((uint64_t)v55, (uint64_t)&a4->var0[6]);
    uint64_t v10 = [(GCPhysicalInputProfile *)v5 _directionPadWithInfo:v55];
    rightThumbsticuint64_t k = v5->_rightThumbstick;
    v5->_rightThumbsticuint64_t k = (GCControllerDirectionPad *)v10;

    __copy_constructor_8_8_s0_t8w39_s48_s56_s64((uint64_t)v54, (uint64_t)&a4->var0[1]);
    uint64_t v12 = [(GCPhysicalInputProfile *)v5 _buttonWithInfo:v54];
    button0 = v5->_button0;
    v5->_button0 = (GCControllerButtonInput *)v12;

    __copy_constructor_8_8_s0_t8w39_s48_s56_s64((uint64_t)v53, (uint64_t)&a4->var0[2]);
    uint64_t v14 = [(GCPhysicalInputProfile *)v5 _buttonWithInfo:v53];
    button1 = v5->_button1;
    v5->_button1 = (GCControllerButtonInput *)v14;

    __copy_constructor_8_8_s0_t8w39_s48_s56_s64((uint64_t)v52, (uint64_t)&a4->var0[3]);
    uint64_t v16 = [(GCPhysicalInputProfile *)v5 _buttonWithInfo:v52];
    button2 = v5->_button2;
    v5->_button2 = (GCControllerButtonInput *)v16;

    __copy_constructor_8_8_s0_t8w39_s48_s56_s64((uint64_t)v51, (uint64_t)&a4->var0[4]);
    uint64_t v18 = [(GCPhysicalInputProfile *)v5 _buttonWithInfo:v51];
    button3 = v5->_button3;
    v5->_button3 = (GCControllerButtonInput *)v18;

    __copy_constructor_8_8_s0_t8w39_s48_s56_s64((uint64_t)v50, (uint64_t)&a4->var0[7]);
    uint64_t v20 = [(GCPhysicalInputProfile *)v5 _buttonWithInfo:v50];
    leftShoulder = v5->_leftShoulder;
    v5->_leftShoulder = (GCControllerButtonInput *)v20;

    __copy_constructor_8_8_s0_t8w39_s48_s56_s64((uint64_t)v49, (uint64_t)&a4->var0[8]);
    uint64_t v22 = [(GCPhysicalInputProfile *)v5 _buttonWithInfo:v49];
    rightShoulder = v5->_rightShoulder;
    v5->_rightShoulder = (GCControllerButtonInput *)v22;

    __copy_constructor_8_8_s0_t8w39_s48_s56_s64((uint64_t)v48, (uint64_t)&a4->var0[9]);
    uint64_t v24 = [(GCPhysicalInputProfile *)v5 _buttonWithInfo:v48];
    leftTrigger = v5->_leftTrigger;
    v5->_leftTrigger = (GCControllerButtonInput *)v24;

    __copy_constructor_8_8_s0_t8w39_s48_s56_s64((uint64_t)v47, (uint64_t)&a4->var0[10]);
    uint64_t v26 = [(GCPhysicalInputProfile *)v5 _buttonWithInfo:v47];
    rightTrigger = v5->_rightTrigger;
    v5->_rightTrigger = (GCControllerButtonInput *)v26;

    __copy_constructor_8_8_s0_t8w39_s48_s56_s64((uint64_t)v46, (uint64_t)&a4->var0[11]);
    uint64_t v28 = [(GCPhysicalInputProfile *)v5 _buttonWithInfo:v46];
    leftThumbstickButton = v5->_leftThumbstickButton;
    v5->_leftThumbstickButton = (GCControllerButtonInput *)v28;

    __copy_constructor_8_8_s0_t8w39_s48_s56_s64((uint64_t)v45, (uint64_t)&a4->var0[12]);
    uint64_t v30 = [(GCPhysicalInputProfile *)v5 _buttonWithInfo:v45];
    rightThumbstickButton = v5->_rightThumbstickButton;
    v5->_rightThumbstickButton = (GCControllerButtonInput *)v30;

    __copy_constructor_8_8_s0_t8w39_s48_s56_s64((uint64_t)v44, (uint64_t)&a4->var0[16]);
    id v32 = [(GCPhysicalInputProfile *)v5 _buttonWithInfo:v44];
    __copy_constructor_8_8_s0_t8w39_s48_s56_s64((uint64_t)v43, (uint64_t)&a4->var0[17]);
    id v33 = [(GCPhysicalInputProfile *)v5 _buttonWithInfo:v43];
    __copy_constructor_8_8_s0_t8w39_s48_s56_s64((uint64_t)v42, (uint64_t)&a4->var0[18]);
    id v34 = [(GCPhysicalInputProfile *)v5 _buttonWithInfo:v42];
    __copy_constructor_8_8_s0_t8w39_s48_s56_s64((uint64_t)v41, (uint64_t)&a4->var0[19]);
    id v35 = [(GCPhysicalInputProfile *)v5 _buttonWithInfo:v41];
    __copy_constructor_8_8_s0_t8w39_s48_s56_s64((uint64_t)v40, (uint64_t)&a4->var0[20]);
    id v36 = [(GCPhysicalInputProfile *)v5 _buttonWithInfo:v40];
    __copy_constructor_8_8_s0_t8w39_s48_s56_s64((uint64_t)v39, (uint64_t)&a4->var0[21]);
    id v37 = [(GCPhysicalInputProfile *)v5 _buttonWithInfo:v39];
    [(GCExtendedGamepad *)v5 initAuxiliaryButtonsWithInitInfo:a4];
    [(GCExtendedGamepad *)v5 initShareFunctionalityWithInitInfo:a4];
  }
  return v5;
}

- (GCExtendedGamepad)initWithCoder:(id)a3
{
  id v5 = a3;
  uint64_t v6 = GCIPCObjectIdentifier_Classes();
  v7 = [v5 decodeObjectOfClasses:v6 forKey:@"identifier"];

  uint64_t v19 = 0;
  id v8 = v5;
  v9 = (void *)[v8 decodeBytesForKey:@"initInfo" returnedLength:&v19];
  if (v19 != 1592)
  {
    uint64_t v18 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    [v18 handleFailureInMethod:a2 object:self file:@"GCExtendedGamepad.m" lineNumber:314 description:@"Serialization bug."];
  }
  for (uint64_t i = 0; i != 198; i += 9)
  {
    v11 = &v9[i];
    void *v11 = 0;
    v11[6] = 0;
    v11[7] = 0;
  }
  GCExtendedGamepadInitInfoPopulateNames((uint64_t)v9);
  uint64_t v12 = [(GCExtendedGamepad *)self initWithIdentifier:v7 info:v9];
  id v13 = (void *)v9[170];
  v9[170] = 0;

  uint64_t v14 = (void *)v9[179];
  v9[179] = 0;

  uint64_t v15 = (void *)v9[188];
  v9[188] = 0;

  uint64_t v16 = (void *)v9[197];
  v9[197] = 0;

  -[GCPhysicalInputProfile setGlyphFlags:](v12, "setGlyphFlags:", [v8 decodeInt64ForKey:@"glyphFlags"]);
  [(GCExtendedGamepad *)v12 applyGlyphFlags];

  return v12;
}

- (void)applyGlyphFlags
{
  if ([(GCPhysicalInputProfile *)self glyphFlags])
  {
    v21 = [(GCPhysicalInputProfile *)self buttons];
    uint64_t v22 = [v21 objectForKeyedSubscript:@"Button A"];
    [v22 setUnmappedNameLocalizationKey:@"DS4_BUTTON_A"];

    v23 = [(GCPhysicalInputProfile *)self buttons];
    uint64_t v24 = [v23 objectForKeyedSubscript:@"Button B"];
    [v24 setUnmappedNameLocalizationKey:@"DS4_BUTTON_B"];

    v25 = [(GCPhysicalInputProfile *)self buttons];
    uint64_t v26 = [v25 objectForKeyedSubscript:@"Button X"];
    [v26 setUnmappedNameLocalizationKey:@"DS4_BUTTON_X"];

    v27 = [(GCPhysicalInputProfile *)self buttons];
    uint64_t v28 = [v27 objectForKeyedSubscript:@"Button Y"];
    [v28 setUnmappedNameLocalizationKey:@"DS4_BUTTON_Y"];

    v29 = [(GCPhysicalInputProfile *)self buttons];
    uint64_t v30 = [v29 objectForKeyedSubscript:@"Button A"];
    [v30 setUnmappedSfSymbolsName:@"xmark.circle"];

    v31 = [(GCPhysicalInputProfile *)self buttons];
    id v32 = [v31 objectForKeyedSubscript:@"Button B"];
    [v32 setUnmappedSfSymbolsName:@"circle.circle"];

    id v33 = [(GCPhysicalInputProfile *)self buttons];
    id v34 = [v33 objectForKeyedSubscript:@"Button X"];
    [v34 setUnmappedSfSymbolsName:@"square.circle"];

    uint64_t v17 = [(GCPhysicalInputProfile *)self buttons];
    uint64_t v18 = [v17 objectForKeyedSubscript:@"Button Y"];
    uint64_t v19 = v18;
    uint64_t v20 = @"triangle.circle";
  }
  else
  {
    if (([(GCPhysicalInputProfile *)self glyphFlags] & 4) == 0) {
      goto LABEL_6;
    }
    v3 = [(GCPhysicalInputProfile *)self buttons];
    id v4 = [v3 objectForKeyedSubscript:@"Left Trigger"];
    [v4 setUnmappedNameLocalizationKey:@"XBOX_LEFT_TRIGGER"];

    id v5 = [(GCPhysicalInputProfile *)self buttons];
    uint64_t v6 = [v5 objectForKeyedSubscript:@"Right Trigger"];
    [v6 setUnmappedNameLocalizationKey:@"XBOX_RIGHT_TRIGGER"];

    v7 = [(GCPhysicalInputProfile *)self buttons];
    id v8 = [v7 objectForKeyedSubscript:@"Left Shoulder"];
    [v8 setUnmappedNameLocalizationKey:@"XBOX_LEFT_SHOULDER"];

    v9 = [(GCPhysicalInputProfile *)self buttons];
    uint64_t v10 = [v9 objectForKeyedSubscript:@"Right Shoulder"];
    [v10 setUnmappedNameLocalizationKey:@"XBOX_RIGHT_SHOULDER"];

    v11 = [(GCPhysicalInputProfile *)self buttons];
    uint64_t v12 = [v11 objectForKeyedSubscript:@"Left Trigger"];
    [v12 setUnmappedSfSymbolsName:@"lt.rectangle.roundedtop"];

    id v13 = [(GCPhysicalInputProfile *)self buttons];
    uint64_t v14 = [v13 objectForKeyedSubscript:@"Right Trigger"];
    [v14 setUnmappedSfSymbolsName:@"rt.rectangle.roundedtop"];

    uint64_t v15 = [(GCPhysicalInputProfile *)self buttons];
    uint64_t v16 = [v15 objectForKeyedSubscript:@"Left Shoulder"];
    [v16 setUnmappedSfSymbolsName:@"lb.rectangle.roundedbottom"];

    uint64_t v17 = [(GCPhysicalInputProfile *)self buttons];
    uint64_t v18 = [v17 objectForKeyedSubscript:@"Right Shoulder"];
    uint64_t v19 = v18;
    uint64_t v20 = @"rb.rectangle.roundedbottom";
  }
  [v18 setUnmappedSfSymbolsName:v20];

LABEL_6:
  if (([(GCPhysicalInputProfile *)self glyphFlags] & 2) != 0)
  {
    id v35 = [(GCPhysicalInputProfile *)self buttons];
    id v36 = [v35 objectForKeyedSubscript:@"Button Home"];
    [v36 setUnmappedNameLocalizationKey:@"DS4_BUTTON_HOME"];

    id v42 = [(GCPhysicalInputProfile *)self buttons];
    id v37 = [v42 objectForKeyedSubscript:@"Button Home"];
    uint64_t v38 = v37;
    uint64_t v39 = @"logo.playstation";
  }
  else
  {
    if (([(GCPhysicalInputProfile *)self glyphFlags] & 8) == 0) {
      return;
    }
    uint64_t v40 = [(GCPhysicalInputProfile *)self buttons];
    v41 = [v40 objectForKeyedSubscript:@"Button Home"];
    [v41 setUnmappedNameLocalizationKey:@"XBOX_BUTTON_HOME"];

    id v42 = [(GCPhysicalInputProfile *)self buttons];
    id v37 = [v42 objectForKeyedSubscript:@"Button Home"];
    uint64_t v38 = v37;
    uint64_t v39 = @"logo.xbox";
  }
  [v37 setUnmappedSfSymbolsName:v39];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  bzero(v33, 0x638uLL);
  uint64_t v32 = +[GCExtendedGamepad version];
  for (uint64_t i = 8; i != 1592; i += 72)
    v33[i] = 1;
  v33[800] = self->_leftThumbstickButton != 0;
  v33[872] = self->_rightThumbstickButton != 0;
  uint64_t v6 = [(GCPhysicalInputProfile *)self elements];
  v7 = [v6 objectForKeyedSubscript:@"Left Bumper"];
  v33[1160] = v7 != 0;

  id v8 = [(GCPhysicalInputProfile *)self elements];
  v9 = [v8 objectForKeyedSubscript:@"Right Bumper"];
  v33[1232] = v9 != 0;

  uint64_t v10 = [(GCPhysicalInputProfile *)self elements];
  v11 = [v10 objectForKeyedSubscript:@"Back Left Button 0"];
  v33[1304] = v11 != 0;

  uint64_t v12 = [(GCPhysicalInputProfile *)self elements];
  id v13 = [v12 objectForKeyedSubscript:@"Back Left Button 1"];
  v33[1376] = v13 != 0;

  uint64_t v14 = [(GCPhysicalInputProfile *)self elements];
  uint64_t v15 = [v14 objectForKeyedSubscript:@"Back Right Button 0"];
  v33[1448] = v15 != 0;

  uint64_t v16 = [(GCPhysicalInputProfile *)self elements];
  uint64_t v17 = [v16 objectForKeyedSubscript:@"Back Right Button 1"];
  v33[1520] = v17 != 0;

  v33[944] = self->_buttonHome != 0;
  v33[1088] = self->_buttonOptions != 0;
  v33[9] = [(GCControllerDirectionPad *)self->_dpad nonAnalog];
  v33[369] = [(GCControllerDirectionPad *)self->_leftThumbstick nonAnalog];
  v33[441] = [(GCControllerDirectionPad *)self->_rightThumbstick nonAnalog];
  v33[81] = [(GCControllerButtonInput *)self->_button0 nonAnalog];
  v33[153] = [(GCControllerButtonInput *)self->_button1 nonAnalog];
  v33[225] = [(GCControllerButtonInput *)self->_button2 nonAnalog];
  v33[297] = [(GCControllerButtonInput *)self->_button3 nonAnalog];
  uint64_t v18 = [(GCPhysicalInputProfile *)self buttons];
  uint64_t v19 = [v18 objectForKeyedSubscript:@"Left Bumper"];
  v33[1161] = [v19 nonAnalog];

  uint64_t v20 = [(GCPhysicalInputProfile *)self buttons];
  v21 = [v20 objectForKeyedSubscript:@"Right Bumper"];
  v33[1233] = [v21 nonAnalog];

  uint64_t v22 = [(GCPhysicalInputProfile *)self buttons];
  v23 = [v22 objectForKeyedSubscript:@"Back Left Button 0"];
  v33[1305] = [v23 nonAnalog];

  uint64_t v24 = [(GCPhysicalInputProfile *)self buttons];
  v25 = [v24 objectForKeyedSubscript:@"Back Left Button 1"];
  v33[1377] = [v25 nonAnalog];

  uint64_t v26 = [(GCPhysicalInputProfile *)self buttons];
  v27 = [v26 objectForKeyedSubscript:@"Back Right Button 0"];
  v33[1449] = [v27 nonAnalog];

  uint64_t v28 = [(GCPhysicalInputProfile *)self buttons];
  v29 = [v28 objectForKeyedSubscript:@"Back Right Button 1"];
  v33[1521] = [v29 nonAnalog];

  v33[513] = [(GCControllerButtonInput *)self->_leftShoulder nonAnalog];
  v33[585] = [(GCControllerButtonInput *)self->_rightShoulder nonAnalog];
  v33[657] = [(GCControllerButtonInput *)self->_leftTrigger nonAnalog];
  v33[729] = [(GCControllerButtonInput *)self->_rightTrigger nonAnalog];
  v33[801] = [(GCControllerButtonInput *)self->_leftThumbstickButton nonAnalog];
  v33[873] = [(GCControllerButtonInput *)self->_rightThumbstickButton nonAnalog];
  v33[1017] = [(GCControllerButtonInput *)self->_buttonMenu nonAnalog];
  v33[945] = [(GCControllerButtonInput *)self->_buttonHome nonAnalog];
  v33[1089] = [(GCControllerButtonInput *)self->_buttonOptions nonAnalog];
  v33[1585] = self->_snapshotUsagePresent;
  v33[1584] = self->_recordUsagePresent;
  [(GCExtendedGamepad *)self populateEncodedInitInfo:v33];
  [v4 encodeBytes:v33 length:1592 forKey:@"initInfo"];
  uint64_t v30 = [(GCPhysicalInputProfile *)self identifier];
  [v4 encodeObject:v30 forKey:@"identifier"];

  [v4 encodeInteger:v32 forKey:@"version"];
  objc_msgSend(v4, "encodeInt64:forKey:", -[GCPhysicalInputProfile glyphFlags](self, "glyphFlags"), @"glyphFlags");
  for (uint64_t j = 0; j != 1584; j += 72)
    __destructor_8_s0_s48_s56_s64((uint64_t)&v33[j]);
}

- (void)initAuxiliaryButtonsWithInitInfo:(id *)a3
{
  BOOL var1 = a3->var0[13].var1;
  BOOL v5 = a3->var0[15].var1;
  BOOL v14 = a3->var0[14].var1;
  BOOL var2 = a3->var0[13].var2;
  BOOL v6 = a3->var0[14].var2;
  BOOL v7 = a3->var0[15].var2;
  self->_buttonHomeUsage = -1;
  self->_buttonMenuUsage = -1;
  self->_buttonOptionsUsage = -1;
  uint64_t v27 = 1;
  uint64_t v26 = @"Button Menu";
  BYTE1(v27) = v6;
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  uint64_t v28 = 23;
  uint64_t v31 = 0x1000000000001;
  uint64_t v32 = @"line.horizontal.3.circle";
  uint64_t v33 = _GCFConvertStringToLocalizedString();
  uint64_t v34 = 0;
  self->_buttonMenuUsage = 516;
  if (v5)
  {
    *(void *)&long long v20 = 1;
    uint64_t v19 = @"Button Options";
    BYTE1(v20) = v7;
    long long v21 = 0uLL;
    *((void *)&v20 + 1) = 24;
    uint64_t v22 = 0x1010000000001;
    v23 = @"ellipsis.circle";
    uint64_t v24 = _GCFConvertStringToLocalizedString();
    uint64_t v25 = 0;
    __copy_constructor_8_8_s0_t8w39_s48_s56_s64((uint64_t)v18, (uint64_t)&v19);
    id v8 = [(GCPhysicalInputProfile *)self _buttonWithInfo:v18];
    buttonOptions = self->_buttonOptions;
    self->_buttonOptions = v8;

    self->_buttonOptionsUsage = 521;
    __destructor_8_s0_s48_s56_s64((uint64_t)&v19);
  }
  if (var1)
  {
    if (v14)
    {
      uint64_t v22 = 0;
      long long v21 = 0u;
      long long v20 = 0u;
      uint64_t v19 = @"Button Home";
      LOBYTE(v20) = 1;
      BYTE1(v20) = var2;
      long long v21 = 0uLL;
      *((void *)&v20 + 1) = 22;
      LODWORD(v22) = 1;
      WORD2(v22) = 256;
      BYTE6(v22) = 1;
      v23 = @"house.circle";
      uint64_t v24 = _GCFConvertStringToLocalizedString();
      uint64_t v25 = 0;
      __copy_constructor_8_8_s0_t8w39_s48_s56_s64((uint64_t)v17, (uint64_t)&v19);
      uint64_t v10 = [(GCPhysicalInputProfile *)self _buttonWithInfo:v17];
      buttonHome = self->_buttonHome;
      self->_buttonHome = v10;

      self->_buttonHomeUsage = 547;
      __destructor_8_s0_s48_s56_s64((uint64_t)&v19);
    }
    else
    {
      [(GCControllerButtonInput *)self->_buttonMenu setNonAnalog:var2];
      self->_buttonMenuUsage = 547;
    }
  }
  __copy_constructor_8_8_s0_t8w39_s48_s56_s64((uint64_t)v16, (uint64_t)&v26);
  uint64_t v12 = [(GCPhysicalInputProfile *)self _buttonWithInfo:v16];
  buttonMenu = self->_buttonMenu;
  self->_buttonMenu = v12;

  __destructor_8_s0_s48_s56_s64((uint64_t)&v26);
}

- (void)initShareFunctionalityWithInitInfo:(id *)a3
{
  self->_snapshotUsagePresent = a3->var2;
  BOOL var1 = a3->var1;
  self->_recordUsagePresent = var1;
  if (var1)
  {
    BOOL v7 = @"Button Share";
    __int16 v8 = 257;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    uint64_t v9 = 40;
    int v12 = 1;
    __int16 v13 = 256;
    char v14 = 1;
    uint64_t v15 = @"square.and.arrow.up";
    uint64_t v16 = _GCFConvertStringToLocalizedString();
    uint64_t v17 = 0;
    BOOL v5 = [(GCPhysicalInputProfile *)self _buttonWithInfo:&v7];
    buttonShare = self->__buttonShare;
    self->__buttonShare = v5;
  }
}

- (GCExtendedGamepadSnapshot)saveSnapshot
{
  v47.supportsClickableThumbsticks = 0;
  v47.version = 257;
  v47.size = 63;
  v3 = [(GCExtendedGamepad *)self dpad];
  id v4 = [v3 xAxis];
  [v4 value];
  v47.dpadX = v5;

  BOOL v6 = [(GCExtendedGamepad *)self dpad];
  BOOL v7 = [v6 yAxis];
  [v7 value];
  v47.dpadY = v8;

  uint64_t v9 = [(GCExtendedGamepad *)self buttonA];
  [v9 value];
  v47.buttonA = v10;

  uint64_t v11 = [(GCExtendedGamepad *)self buttonB];
  [v11 value];
  v47.buttonB = v12;

  __int16 v13 = [(GCExtendedGamepad *)self buttonX];
  [v13 value];
  v47.buttonX = v14;

  uint64_t v15 = [(GCExtendedGamepad *)self buttonY];
  [v15 value];
  v47.buttonY = v16;

  uint64_t v17 = [(GCExtendedGamepad *)self leftThumbstick];
  uint64_t v18 = [v17 xAxis];
  [v18 value];
  v47.leftThumbstickX = v19;

  long long v20 = [(GCExtendedGamepad *)self leftThumbstick];
  long long v21 = [v20 yAxis];
  [v21 value];
  v47.leftThumbstickY = v22;

  v23 = [(GCExtendedGamepad *)self rightThumbstick];
  uint64_t v24 = [v23 xAxis];
  [v24 value];
  v47.rightThumbstickX = v25;

  uint64_t v26 = [(GCExtendedGamepad *)self rightThumbstick];
  uint64_t v27 = [v26 yAxis];
  [v27 value];
  v47.rightThumbstickY = v28;

  uint64_t v29 = [(GCExtendedGamepad *)self leftShoulder];
  [v29 value];
  v47.leftShoulder = v30;

  uint64_t v31 = [(GCExtendedGamepad *)self rightShoulder];
  [v31 value];
  v47.rightShoulder = v32;

  uint64_t v33 = [(GCExtendedGamepad *)self leftTrigger];
  [v33 value];
  v47.leftTrigger = v34;

  id v35 = [(GCExtendedGamepad *)self rightTrigger];
  [v35 value];
  v47.rightTrigger = v36;

  id v37 = [(GCExtendedGamepad *)self rightThumbstickButton];
  v47.rightThumbstickButton = [v37 isPressed];

  uint64_t v38 = [(GCExtendedGamepad *)self leftThumbstickButton];
  v47.leftThumbstickButton = [v38 isPressed];

  uint64_t v39 = [(GCExtendedGamepad *)self rightThumbstickButton];
  if (v39)
  {
    uint64_t v40 = [(GCExtendedGamepad *)self leftThumbstickButton];
    BOOL v41 = v40 != 0;
  }
  else
  {
    BOOL v41 = 0;
  }
  v47.supportsClickableThumbsticks = v41;

  id v42 = NSDataFromGCExtendedGamepadSnapshotData(&v47);
  v43 = [GCExtendedGamepadSnapshot alloc];
  v44 = [(GCPhysicalInputProfile *)self controller];
  v45 = [(GCExtendedGamepadSnapshot *)v43 initWithController:v44 snapshotData:v42];

  return v45;
}

- (id)name
{
  return @"ExtendedGamepad";
}

- (id)setElementValuesFromExtendedGamepad:(id)a3
{
  id v4 = a3;
  float v5 = +[NSMutableArray array];
  BOOL v6 = [(GCPhysicalInputProfile *)self controller];
  BOOL v7 = [v6 handlerQueue];

  v233 = self;
  dpad = self->_dpad;
  uint64_t v9 = [v4 dpad];
  float v10 = [v9 xAxis];
  [v10 value];
  int v12 = v11;
  v232 = v4;
  __int16 v13 = [v4 dpad];
  float v14 = [v13 yAxis];
  [v14 value];
  int v16 = v15;
  uint64_t v17 = dpad;
  id v18 = v7;
  id v19 = v5;
  long long v20 = [(GCControllerDirectionPad *)v17 xAxis];
  LODWORD(v21) = v12;
  LOBYTE(dpad) = [v20 _setValue:v18 queue:v21];

  float v22 = [(GCControllerDirectionPad *)v17 yAxis];
  LODWORD(v23) = v16;
  int v24 = [v22 _setValue:v18 queue:v23];

  if ((dpad & 1) != 0 || v24) {
    [v19 addObject:v17];
  }

  leftThumbsticuint64_t k = v233->_leftThumbstick;
  uint64_t v26 = [v232 leftThumbstick];
  uint64_t v27 = [v26 xAxis];
  [v27 value];
  int v29 = v28;
  float v30 = [v232 leftThumbstick];
  uint64_t v31 = [v30 yAxis];
  [v31 value];
  int v33 = v32;
  float v34 = leftThumbstick;
  id v35 = v18;
  id v36 = v19;
  id v37 = [(GCControllerDirectionPad *)v34 xAxis];
  LODWORD(v38) = v29;
  char v39 = [v37 _setValue:v35 queue:v38];

  uint64_t v40 = [(GCControllerDirectionPad *)v34 yAxis];
  LODWORD(v41) = v33;
  int v42 = [v40 _setValue:v35 queue:v41];

  if ((v39 & 1) != 0 || v42) {
    [v36 addObject:v34];
  }

  rightThumbsticuint64_t k = v233->_rightThumbstick;
  v44 = [v232 rightThumbstick];
  v45 = [v44 xAxis];
  [v45 value];
  int v47 = v46;
  double v48 = [v232 rightThumbstick];
  double v49 = [v48 yAxis];
  [v49 value];
  int v51 = v50;
  double v52 = rightThumbstick;
  id v53 = v35;
  id v54 = v36;
  double v55 = [(GCControllerDirectionPad *)v52 xAxis];
  LODWORD(v56) = v47;
  char v57 = [v55 _setValue:v53 queue:v56];

  objc_super v58 = [(GCControllerDirectionPad *)v52 yAxis];
  LODWORD(v59) = v51;
  int v60 = [v58 _setValue:v53 queue:v59];

  if ((v57 & 1) != 0 || v60) {
    [v54 addObject:v52];
  }

  double v61 = v233;
  buttonMenu = v233->_buttonMenu;
  double v63 = [v232 buttonMenu];
  [v63 value];
  int v65 = v64;
  double v66 = buttonMenu;
  id v67 = v54;
  LODWORD(v68) = v65;
  if ([(GCControllerButtonInput *)v66 _setValue:v53 queue:v68]) {
    [v67 addObject:v66];
  }

  buttonHome = v233->_buttonHome;
  float v70 = [v232 buttonHome];
  [v70 value];
  int v72 = v71;
  float v73 = buttonHome;
  id v74 = v67;
  LODWORD(v75) = v72;
  if ([(GCControllerButtonInput *)v73 _setValue:v53 queue:v75]) {
    [v74 addObject:v73];
  }

  button0 = v233->_button0;
  id v77 = [v232 buttonA];
  [v77 value];
  int v79 = v78;
  char v80 = button0;
  id v81 = v74;
  LODWORD(v82) = v79;
  if ([(GCControllerButtonInput *)v80 _setValue:v53 queue:v82]) {
    [v81 addObject:v80];
  }

  button1 = v233->_button1;
  float v84 = [v232 buttonB];
  [v84 value];
  int v86 = v85;
  id v87 = button1;
  id v88 = v81;
  LODWORD(v89) = v86;
  if ([(GCControllerButtonInput *)v87 _setValue:v53 queue:v89]) {
    [v88 addObject:v87];
  }

  button2 = v233->_button2;
  char v91 = [v232 buttonX];
  [v91 value];
  int v93 = v92;
  int v94 = button2;
  id v95 = v88;
  LODWORD(v96) = v93;
  if ([(GCControllerButtonInput *)v94 _setValue:v53 queue:v96]) {
    [v95 addObject:v94];
  }

  button3 = v233->_button3;
  v98 = [v232 buttonY];
  [v98 value];
  int v100 = v99;
  v101 = button3;
  id v102 = v95;
  LODWORD(v103) = v100;
  if ([(GCControllerButtonInput *)v101 _setValue:v53 queue:v103]) {
    [v102 addObject:v101];
  }

  leftShoulder = v233->_leftShoulder;
  v105 = [v232 leftShoulder];
  [v105 value];
  int v107 = v106;
  float v108 = leftShoulder;
  id v109 = v102;
  LODWORD(v110) = v107;
  if ([(GCControllerButtonInput *)v108 _setValue:v53 queue:v110]) {
    [v109 addObject:v108];
  }

  rightShoulder = v233->_rightShoulder;
  float v112 = [v232 rightShoulder];
  [v112 value];
  int v114 = v113;
  double v115 = rightShoulder;
  id v116 = v109;
  LODWORD(v117) = v114;
  if ([(GCControllerButtonInput *)v115 _setValue:v53 queue:v117]) {
    [v116 addObject:v115];
  }

  leftTrigger = v233->_leftTrigger;
  double v119 = [v232 leftTrigger];
  [v119 value];
  int v121 = v120;
  id v122 = leftTrigger;
  id v123 = v116;
  LODWORD(v124) = v121;
  if ([(GCControllerButtonInput *)v122 _setValue:v53 queue:v124]) {
    [v123 addObject:v122];
  }

  rightTrigger = v233->_rightTrigger;
  id v126 = [v232 rightTrigger];
  [v126 value];
  int v128 = v127;
  v129 = rightTrigger;
  id v130 = v123;
  LODWORD(v131) = v128;
  if ([(GCControllerButtonInput *)v129 _setValue:v53 queue:v131]) {
    [v130 addObject:v129];
  }

  if (v233->_leftThumbstickButton)
  {
    v132 = [v232 leftThumbstickButton];

    if (v132)
    {
      leftThumbstickButton = v233->_leftThumbstickButton;
      double v134 = [v232 leftThumbstickButton];
      [v134 value];
      int v136 = v135;
      id v137 = leftThumbstickButton;
      id v138 = v130;
      LODWORD(v139) = v136;
      if ([(GCControllerButtonInput *)v137 _setValue:v53 queue:v139]) {
        [v138 addObject:v137];
      }
    }
  }
  if (v233->_rightThumbstickButton)
  {
    v140 = [v232 rightThumbstickButton];

    if (v140)
    {
      rightThumbstickButton = v233->_rightThumbstickButton;
      double v142 = [v232 rightThumbstickButton];
      [v142 value];
      int v144 = v143;
      uint64_t v145 = rightThumbstickButton;
      id v146 = v130;
      LODWORD(v147) = v144;
      if ([(GCControllerButtonInput *)v145 _setValue:v53 queue:v147]) {
        [v146 addObject:v145];
      }
    }
  }
  uint64_t v148 = [(GCPhysicalInputProfile *)v233 buttons];
  uint64_t v149 = [v148 objectForKeyedSubscript:@"Left Bumper"];
  if (v149)
  {
    v150 = (void *)v149;
    v151 = [v232 objectForKeyedSubscript:@"Left Bumper"];

    if (!v151) {
      goto LABEL_46;
    }
    uint64_t v148 = [(GCPhysicalInputProfile *)v233 buttons];
    double v152 = [v148 objectForKeyedSubscript:@"Left Bumper"];
    int v153 = [v232 buttons];
    v154 = [v153 objectForKeyedSubscript:@"Left Bumper"];
    [v154 value];
    int v156 = v155;
    id v157 = v152;
    id v158 = v130;
    LODWORD(v159) = v156;
    if ([v157 _setValue:v53 queue:v159]) {
      [v158 addObject:v157];
    }

    double v61 = v233;
  }

LABEL_46:
  double v160 = [(GCPhysicalInputProfile *)v61 buttons];
  uint64_t v161 = [v160 objectForKeyedSubscript:@"Right Bumper"];
  if (v161)
  {
    double v162 = (void *)v161;
    double v163 = [v232 buttons];
    double v164 = [v163 objectForKeyedSubscript:@"Right Bumper"];

    if (!v164) {
      goto LABEL_52;
    }
    double v160 = [(GCPhysicalInputProfile *)v61 buttons];
    double v165 = [v160 objectForKeyedSubscript:@"Right Bumper"];
    double v166 = [v232 buttons];
    float v167 = [v166 objectForKeyedSubscript:@"Right Bumper"];
    [v167 value];
    int v169 = v168;
    id v170 = v165;
    id v171 = v130;
    LODWORD(v172) = v169;
    if ([v170 _setValue:v53 queue:v172]) {
      [v171 addObject:v170];
    }

    double v61 = v233;
  }

LABEL_52:
  v173 = [(GCPhysicalInputProfile *)v61 buttons];
  uint64_t v174 = [v173 objectForKeyedSubscript:@"Back Left Button 0"];
  if (v174)
  {
    uint64_t v175 = (void *)v174;
    long long v176 = [v232 objectForKeyedSubscript:@"Back Left Button 0"];

    if (!v176) {
      goto LABEL_58;
    }
    v173 = [(GCPhysicalInputProfile *)v61 buttons];
    long long v177 = [v173 objectForKeyedSubscript:@"Back Left Button 0"];
    long long v178 = [v232 buttons];
    long long v179 = [v178 objectForKeyedSubscript:@"Back Left Button 0"];
    [v179 value];
    int v181 = v180;
    id v182 = v177;
    id v183 = v130;
    LODWORD(v184) = v181;
    if ([v182 _setValue:v53 queue:v184]) {
      [v183 addObject:v182];
    }

    double v61 = v233;
  }

LABEL_58:
  v185 = [(GCPhysicalInputProfile *)v61 buttons];
  uint64_t v186 = [v185 objectForKeyedSubscript:@"Back Left Button 1"];
  if (v186)
  {
    long long v187 = (void *)v186;
    long long v188 = [v232 buttons];
    v189 = [v188 objectForKeyedSubscript:@"Back Left Button 1"];

    if (!v189) {
      goto LABEL_64;
    }
    v185 = [(GCPhysicalInputProfile *)v61 buttons];
    v190 = [v185 objectForKeyedSubscript:@"Back Left Button 1"];
    id v191 = [v232 buttons];
    v192 = [v191 objectForKeyedSubscript:@"Back Left Button 1"];
    [v192 value];
    int v194 = v193;
    id v195 = v190;
    id v196 = v130;
    LODWORD(v197) = v194;
    if ([v195 _setValue:v53 queue:v197]) {
      [v196 addObject:v195];
    }

    double v61 = v233;
  }

LABEL_64:
  v198 = [(GCPhysicalInputProfile *)v61 buttons];
  uint64_t v199 = [v198 objectForKeyedSubscript:@"Back Right Button 0"];
  if (v199)
  {
    v200 = (void *)v199;
    v201 = [v232 buttons];
    v202 = [v201 objectForKeyedSubscript:@"Back Right Button 0"];

    if (!v202) {
      goto LABEL_70;
    }
    v198 = [(GCPhysicalInputProfile *)v61 buttons];
    v203 = [v198 objectForKeyedSubscript:@"Back Right Button 0"];
    v204 = [v232 buttons];
    v205 = [v204 objectForKeyedSubscript:@"Back Right Button 0"];
    [v205 value];
    int v207 = v206;
    id v208 = v203;
    id v209 = v130;
    LODWORD(v210) = v207;
    if ([v208 _setValue:v53 queue:v210]) {
      [v209 addObject:v208];
    }

    double v61 = v233;
  }

LABEL_70:
  v211 = [(GCPhysicalInputProfile *)v61 buttons];
  uint64_t v212 = [v211 objectForKeyedSubscript:@"Back Right Button 1"];
  if (!v212)
  {
LABEL_75:

    goto LABEL_76;
  }
  v213 = (void *)v212;
  v214 = [v232 objectForKeyedSubscript:@"Back Right Button 1"];

  if (v214)
  {
    v211 = [(GCPhysicalInputProfile *)v61 buttons];
    v215 = [v211 objectForKeyedSubscript:@"Back Right Button 1"];
    v216 = [v232 buttons];
    v217 = [v216 objectForKeyedSubscript:@"Back Right Button 1"];
    [v217 value];
    int v219 = v218;
    id v220 = v215;
    id v221 = v130;
    LODWORD(v222) = v219;
    if ([v220 _setValue:v53 queue:v222]) {
      [v221 addObject:v220];
    }

    double v61 = v233;
    goto LABEL_75;
  }
LABEL_76:
  if (v61->_buttonOptions)
  {
    v223 = [v232 buttonOptions];

    if (v223)
    {
      buttonOptions = v61->_buttonOptions;
      v225 = [v232 buttonOptions];
      [v225 value];
      int v227 = v226;
      v228 = buttonOptions;
      id v229 = v130;
      LODWORD(v230) = v227;
      if ([(GCControllerButtonInput *)v228 _setValue:v53 queue:v230]) {
        [v229 addObject:v228];
      }
    }
  }

  return v130;
}

- (void)setStateFromExtendedGamepad:(GCExtendedGamepad *)extendedGamepad
{
  id v4 = extendedGamepad;
  uint64_t v5 = [(GCPhysicalInputProfile *)self controller];
  if (!v5
    || (BOOL v6 = (void *)v5,
        [(GCPhysicalInputProfile *)self controller],
        BOOL v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 isSnapshot],
        v7,
        v6,
        v8))
  {
    [(GCExtendedGamepad *)self setElementValuesFromExtendedGamepad:v4];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v21;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * v12);
          float v14 = [(GCPhysicalInputProfile *)self controller];
          int v15 = [v14 handlerQueue];
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = __49__GCExtendedGamepad_setStateFromExtendedGamepad___block_invoke;
          block[3] = &unk_26D22B618;
          block[4] = self;
          id v18 = v4;
          uint64_t v19 = v13;
          dispatch_async(v15, block);

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v10);
    }
  }
}

void __49__GCExtendedGamepad_setStateFromExtendedGamepad___block_invoke(uint64_t a1)
{
  if (gc_isInternalBuild())
  {
    uint64_t v5 = getGCLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v6 = [*(id *)(a1 + 32) controller];
      BOOL v7 = [v6 debugName];
      int v8 = [*(id *)(a1 + 40) controller];
      uint64_t v9 = [v8 debugName];
      uint64_t v10 = *(void *)(a1 + 48);
      int v11 = 138412802;
      uint64_t v12 = v7;
      __int16 v13 = 2112;
      float v14 = v9;
      __int16 v15 = 2112;
      uint64_t v16 = v10;
      _os_log_impl(&dword_220998000, v5, OS_LOG_TYPE_DEFAULT, "set %@ StateFromExtendedGamepad %@: %@", (uint8_t *)&v11, 0x20u);
    }
  }
  uint64_t v2 = [*(id *)(a1 + 32) valueDidChangeHandler];
  v3 = (void *)v2;
  if (v2) {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, *(void *)(a1 + 32), *(void *)(a1 + 48));
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 680);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
}

- (void)_triggerValueChangedHandlerForElement:(id)a3 queue:(id)a4
{
  id v6 = a3;
  BOOL v7 = a4;
  if (gc_isInternalBuild())
  {
    uint64_t v9 = getGCLogger();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = [(GCPhysicalInputProfile *)self controller];
      int v11 = [v10 debugName];
      *(_DWORD *)buf = 138412546;
      __int16 v15 = v11;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl(&dword_220998000, v9, OS_LOG_TYPE_INFO, "%@ changed: %@", buf, 0x16u);
    }
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __65__GCExtendedGamepad__triggerValueChangedHandlerForElement_queue___block_invoke;
  v12[3] = &unk_26D22A8E8;
  v12[4] = self;
  id v13 = v6;
  id v8 = v6;
  dispatch_async(v7, v12);
}

uint64_t __65__GCExtendedGamepad__triggerValueChangedHandlerForElement_queue___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) valueDidChangeHandler];
  if (v2) {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, *(void *)(a1 + 32), *(void *)(a1 + 40));
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 680);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }

  return MEMORY[0x270F9A828]();
}

- (BOOL)reportsAbsoluteDpadValues
{
  return 1;
}

- (BOOL)allowsRotation
{
  return 0;
}

+ (id)_current
{
  uint64_t v2 = +[_GCControllerManager sharedInstance];
  uint64_t v3 = [v2 currentExtendedGamepad];

  return v3;
}

- (GCControllerButtonInput)buttonA
{
  return self->_button0;
}

- (GCControllerButtonInput)buttonB
{
  return self->_button1;
}

- (GCControllerButtonInput)buttonX
{
  return self->_button2;
}

- (GCControllerButtonInput)buttonY
{
  return self->_button3;
}

- (GCControllerButtonInput)_buttonShare
{
  return self->__buttonShare;
}

- (BOOL)snapshotUsagePresent
{
  return self->_snapshotUsagePresent;
}

- (BOOL)recordUsagePresent
{
  return self->_recordUsagePresent;
}

- (GCExtendedGamepadValueChangedHandler)valueChangedHandler
{
  return self->_valueChangedHandler;
}

- (void)setValueChangedHandler:(GCExtendedGamepadValueChangedHandler)valueChangedHandler
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

- (GCControllerButtonInput)buttonOptions
{
  return self->_buttonOptions;
}

- (GCControllerButtonInput)buttonHome
{
  return self->_buttonHome;
}

- (GCControllerDirectionPad)leftThumbstick
{
  return self->_leftThumbstick;
}

- (GCControllerDirectionPad)rightThumbstick
{
  return self->_rightThumbstick;
}

- (GCControllerButtonInput)leftShoulder
{
  return self->_leftShoulder;
}

- (GCControllerButtonInput)rightShoulder
{
  return self->_rightShoulder;
}

- (GCControllerButtonInput)leftTrigger
{
  return self->_leftTrigger;
}

- (GCControllerButtonInput)rightTrigger
{
  return self->_rightTrigger;
}

- (GCControllerButtonInput)leftThumbstickButton
{
  return self->_leftThumbstickButton;
}

- (GCControllerButtonInput)rightThumbstickButton
{
  return self->_rightThumbstickButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonHome, 0);
  objc_storeStrong((id *)&self->_buttonOptions, 0);
  objc_storeStrong((id *)&self->_buttonMenu, 0);
  objc_storeStrong((id *)&self->__buttonShare, 0);
  objc_storeStrong((id *)&self->_webKitUserIntentRecognizer, 0);
  objc_storeStrong(&self->_gamepadEventObservation, 0);
  objc_storeStrong((id *)&self->_rightThumbstickButton, 0);
  objc_storeStrong((id *)&self->_leftThumbstickButton, 0);
  objc_storeStrong((id *)&self->_rightTrigger, 0);
  objc_storeStrong((id *)&self->_leftTrigger, 0);
  objc_storeStrong((id *)&self->_rightShoulder, 0);
  objc_storeStrong((id *)&self->_leftShoulder, 0);
  objc_storeStrong((id *)&self->_rightThumbstick, 0);
  objc_storeStrong((id *)&self->_leftThumbstick, 0);
  objc_storeStrong((id *)&self->_button3, 0);
  objc_storeStrong((id *)&self->_button2, 0);
  objc_storeStrong((id *)&self->_button1, 0);
  objc_storeStrong((id *)&self->_button0, 0);
  objc_storeStrong((id *)&self->_dpad, 0);

  objc_storeStrong(&self->_valueChangedHandler, 0);
}

- (void)_handleGamepadEvent:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    uint64_t v5 = [v3 timestamp];
    id v6 = getGCSignpostLogger();
    os_signpost_id_t v7 = os_signpost_id_generate(v6);

    id v8 = getGCSignpostLogger();
    uint64_t v9 = v8;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v76 = v5;
      _os_signpost_emit_with_name_impl(&dword_220998000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "Handle Extended Gamepad Event", "timestamp=%llu", buf, 0xCu);
    }

    [(id)a1 _receivedEventWithTimestamp:v5];
    uint64_t v10 = [(id)a1 controller];
    if (!v10) {
      goto LABEL_64;
    }
    unint64_t v53 = v7 - 1;
    uint64_t v55 = v5;
    os_signpost_id_t spid = v7;
    int v11 = +[NSMutableSet set];
    uint64_t v12 = [v10 handlerQueue];
    for (uint64_t i = 0; i != 47; ++i)
    {
      if ((i & 0x7FFFFFFE) != 0x16 && [v4 hasValidValueForElement:i])
      {
        float v14 = [(id)a1 remappedElementForIndex:i];
        if (v14)
        {
          [v4 floatValueForElement:i];
          objc_msgSend(v14, "_setPendingValue:");
          __int16 v15 = [v14 collection];

          if (v15)
          {
            __int16 v16 = [v14 collection];
            [v11 addObject:v16];
          }
          else
          {
            [v11 addObject:v14];
          }
        }
      }
    }
    if (*(void *)(a1 + 664) == 547 && [v4 hasValidValueForElement:22])
    {
      [v4 floatValueForElement:22];
      float v18 = v17;
      uint64_t v19 = &OBJC_IVAR____GCDevicePhysicalInputClickableDirectionPadElement__pressedInputSlot;
    }
    else
    {
      if (*(void *)(a1 + 840) && [v4 hasValidValueForElement:22])
      {
        [v4 floatValueForElement:22];
        objc_msgSend(*(id *)(a1 + 840), "_setPendingValue:");
        [v11 addObject:*(void *)(a1 + 840)];
      }
      uint64_t v19 = &OBJC_IVAR____GCDevicePhysicalInputClickableDirectionPadElement__pressedInputSlot;
      if (!*(void *)(a1 + 824) || ![v4 hasValidValueForElement:23])
      {
        id v21 = 0;
LABEL_28:
        id v54 = v4;

        int v24 = +[NSMutableSet set];
        long long v69 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        id v25 = v11;
        uint64_t v26 = [v25 countByEnumeratingWithState:&v69 objects:v80 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = *(void *)v70;
          do
          {
            for (uint64_t j = 0; j != v27; ++j)
            {
              if (*(void *)v70 != v28) {
                objc_enumerationMutation(v25);
              }
              float v30 = *(void **)(*((void *)&v69 + 1) + 8 * j);
              if ([v30 _commitPendingValueOnQueue:v12]) {
                [v24 addObject:v30];
              }
            }
            uint64_t v27 = [v25 countByEnumeratingWithState:&v69 objects:v80 count:16];
          }
          while (v27);
        }

        if ([v24 count])
        {
          uint64_t v31 = (id)a1;
          int v32 = [v31 valueDidChangeHandler];
          if (v32)
          {
            v65[0] = _NSConcreteStackBlock;
            v65[1] = 3221225472;
            v65[2] = __49__GCExtendedGamepad_PubSub___handleGamepadEvent___block_invoke_358;
            v65[3] = &unk_26D22C468;
            id v66 = v24;
            id v67 = v31;
            id v68 = v32;
            dispatch_async(v12, v65);
          }
          int v33 = (void *)v31[100];
          if (v33) {
            [v33 processChangedElements:v24 atTimestamp:v55];
          }
        }
        double v52 = v25;
        long long v63 = 0u;
        long long v64 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        id v34 = v24;
        uint64_t v35 = [v34 countByEnumeratingWithState:&v61 objects:v79 count:16];
        if (v35)
        {
          uint64_t v36 = v35;
          uint64_t v37 = *(void *)v62;
          do
          {
            uint64_t v38 = 0;
            do
            {
              if (*(void *)v62 != v37) {
                objc_enumerationMutation(v34);
              }
              uint64_t v39 = *(void *)(*((void *)&v61 + 1) + 8 * v38);
              if (gc_isInternalBuild())
              {
                log = getGCLogger();
                if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
                {
                  double v49 = [v10 debugName];
                  *(_DWORD *)buf = 138412546;
                  uint64_t v76 = (uint64_t)v49;
                  __int16 v77 = 2112;
                  uint64_t v78 = v39;
                  _os_log_impl(&dword_220998000, log, OS_LOG_TYPE_INFO, "%@ changed: %@", buf, 0x16u);
                }
              }
              v60[0] = _NSConcreteStackBlock;
              v60[1] = 3221225472;
              v60[2] = __49__GCExtendedGamepad_PubSub___handleGamepadEvent___block_invoke_359;
              v60[3] = &unk_26D22B618;
              v60[4] = a1;
              v60[5] = a1;
              v60[6] = v39;
              id v40 = (id)a1;
              dispatch_async(v12, v60);

              ++v38;
            }
            while (v36 != v38);
            uint64_t v41 = [v34 countByEnumeratingWithState:&v61 objects:v79 count:16];
            uint64_t v36 = v41;
          }
          while (v41);
        }

        int v42 = [(id)a1 syntheticDeviceElementValueChangedHandler];
        uint64_t v4 = v54;
        if (v42)
        {
          v56[0] = _NSConcreteStackBlock;
          v56[1] = 3221225472;
          v56[2] = __49__GCExtendedGamepad_PubSub___handleGamepadEvent___block_invoke_2;
          v56[3] = &unk_26D22C7C8;
          id v57 = v34;
          id v58 = v42;
          uint64_t v59 = v55;
          v43 = (void (**)(void))MEMORY[0x223C6E420](v56);
          v44 = [(id)a1 syntheticDeviceHandlerQueue];
          v45 = v44;
          if (v44) {
            dispatch_async(v44, v43);
          }
          else {
            v43[2](v43);
          }
        }
        int v46 = getGCSignpostLogger();
        int v47 = v46;
        if (v53 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
        {
          [(id)a1 lastEventTimestamp];
          *(_DWORD *)buf = 134218240;
          uint64_t v76 = v55;
          __int16 v77 = 2048;
          uint64_t v78 = v48;
          _os_signpost_emit_with_name_impl(&dword_220998000, v47, OS_SIGNPOST_INTERVAL_END, spid, "Handle Extended Gamepad Event", "timestamp=%llu, receiveTimestamp=%f", buf, 0x16u);
        }

LABEL_64:
        goto LABEL_65;
      }
      [v4 floatValueForElement:23];
      float v18 = v20;
    }
    id v21 = *(id *)(a1 + v19[719]);
    *(float *)&double v22 = v18;
    [*(id *)(a1 + v19[719]) _setPendingValue:v22];
    [v11 addObject:*(void *)(a1 + v19[719])];
    if (v18 > 0.0 && ([v21 isPressed] & 1) == 0)
    {
      long long v23 = [v10 handlerQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = __49__GCExtendedGamepad_PubSub___handleGamepadEvent___block_invoke;
      block[3] = &unk_26D22A8C0;
      id v74 = v10;
      dispatch_async(v23, block);
    }
    goto LABEL_28;
  }
LABEL_65:
}

void __49__GCExtendedGamepad_PubSub___handleGamepadEvent___block_invoke(uint64_t a1)
{
  if (gc_isInternalBuild())
  {
    uint64_t v4 = getGCLogger();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = [*(id *)(a1 + 32) debugName];
      int v6 = 138412290;
      os_signpost_id_t v7 = v5;
      _os_log_impl(&dword_220998000, v4, OS_LOG_TYPE_INFO, "%@ pause event", (uint8_t *)&v6, 0xCu);
    }
  }
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "__deprecated_controllerPausedHandler");

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "__deprecated_controllerPausedHandler");
    id v3 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    v3[2](v3, *(void *)(a1 + 32));
  }
}

void __49__GCExtendedGamepad_PubSub___handleGamepadEvent___block_invoke_358(uint64_t a1)
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

void *__49__GCExtendedGamepad_PubSub___handleGamepadEvent___block_invoke_359(void *result)
{
  uint64_t v1 = *(void *)(result[4] + 680);
  if (v1) {
    return (void *)(*(uint64_t (**)(void, void, void))(v1 + 16))(*(void *)(result[4] + 680), result[5], result[6]);
  }
  return result;
}

void __49__GCExtendedGamepad_PubSub___handleGamepadEvent___block_invoke_2(uint64_t a1)
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

- (void)handleGamepadEvent:(id)a3
{
}

- (void)setGamepadEventSource:(id)a3
{
  id gamepadEventObservation = self->_gamepadEventObservation;
  self->_id gamepadEventObservation = 0;
  id v5 = a3;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __51__GCExtendedGamepad_PubSub__setGamepadEventSource___block_invoke;
  v8[3] = &__block_descriptor_40_e27_v16__0____GCGamepadEvent__8lu32l8;
  v8[4] = self;
  uint64_t v6 = [v5 observeGamepadEvents:v8];

  id v7 = self->_gamepadEventObservation;
  self->_id gamepadEventObservation = v6;
}

void __51__GCExtendedGamepad_PubSub__setGamepadEventSource___block_invoke(uint64_t a1, void *a2)
{
}

- (void)setThumbstickUserIntentHandler:(id)a3
{
  id v7 = a3;
  webKitUserIntentRecognizer = self->_webKitUserIntentRecognizer;
  self->_webKitUserIntentRecognizer = 0;

  if (v7)
  {
    id v5 = [[_GCWebKitUserIntentRecognizer alloc] initWithPhysicalInputProfile:self thumbstickUserIntentHandler:v7];
    uint64_t v6 = self->_webKitUserIntentRecognizer;
    self->_webKitUserIntentRecognizer = v5;
  }
}

- (id)thumbstickUserIntentHandler
{
  return [(_GCWebKitUserIntentRecognizer *)self->_webKitUserIntentRecognizer thumbstickUserIntentHandler];
}

- (void)setThumbstickUserIntentHandler:(id)a3 slidingWindowTotalDuration:(double)a4 slidingWindowSegmentDuration:(double)a5 deadzone:(double)a6 sensitivity:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  id v15 = a3;
  webKitUserIntentRecognizer = self->_webKitUserIntentRecognizer;
  self->_webKitUserIntentRecognizer = 0;

  if (v15)
  {
    id v13 = [[_GCWebKitUserIntentRecognizer alloc] initWithPhysicalInputProfile:self thumbstickUserIntentHandler:v15 slidingWindowTotalDuration:v7 slidingWindowSegmentDuration:a4 deadzone:a5 sensitivity:a6];
    float v14 = self->_webKitUserIntentRecognizer;
    self->_webKitUserIntentRecognizer = v13;
  }
}

@end