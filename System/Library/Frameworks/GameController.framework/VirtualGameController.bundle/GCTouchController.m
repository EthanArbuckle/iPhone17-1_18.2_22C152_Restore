@interface GCTouchController
- (GCTouchController)initWithConfiguration:(id)a3;
- (void)setPosition:(CGPoint)a3 forDirectionPadElement:(id)a4;
- (void)setValue:(double)a3 forButtonElement:(id)a4;
@end

@implementation GCTouchController

- (GCTouchController)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  [v5 setProductCategory:@"Touch Controller"];
  unsigned int v6 = [v4 isHidden];
  int v7 = GCCurrentProcessLinkedOnAfter();
  CFStringRef v8 = @"Apple Touch Controller";
  if (v6) {
    CFStringRef v8 = @"Touch Controller";
  }
  if (v7) {
    CFStringRef v9 = v8;
  }
  else {
    CFStringRef v9 = @"Apple";
  }
  [v5 setVendorName:v9];
  if (GCCurrentProcessLinkedOnAfter())
  {
    +[NSSet setWithObjects:](NSSet, "setWithObjects:", GCInputButtonA, GCInputButtonB, GCInputButtonX, GCInputButtonY, GCInputLeftShoulder, GCInputRightShoulder, GCInputLeftBumper, GCInputRightBumper, GCInputLeftTrigger, GCInputRightTrigger, GCInputLeftThumbstickButton, GCInputRightThumbstickButton, GCInputBackLeftPrimaryButton, GCInputBackLeftSecondaryButton, GCInputBackRightPrimaryButton, GCInputBackRightSecondaryButton, GCInputXboxPaddleOne,
      GCInputXboxPaddleTwo,
      GCInputXboxPaddleThree,
      GCInputXboxPaddleFour,
      GCInputButtonMenu,
      GCInputButtonOptions,
      GCInputButtonShare,
      GCInputDirectionPad,
      GCInputLeftThumbstick,
      GCInputRightThumbstick,
      0,
      GCInputButtonX,
      GCInputButtonB,
      GCInputButtonA,
    v10 = NSSet);
    v11 = [v4 elements];
    v95[0] = _NSConcreteStackBlock;
    v95[1] = 3221225472;
    v95[2] = __43__GCTouchController_initWithConfiguration___block_invoke;
    v95[3] = &unk_10418;
    id v12 = v10;
    id v96 = v12;
    v13 = [v11 objectsPassingTest:v95];

    if ([v13 count])
    {
      uint64_t v37 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"*** The configuration contains %zu elements that are not supported on a touch controller.", [v13 count]);
      CFStringRef v98 = @"UnsupportedElements";
      v99 = v13;
      v38 = +[NSDictionary dictionaryWithObjects:&v99 forKeys:&v98 count:1];
      id v39 = +[NSException exceptionWithName:NSInvalidArgumentException reason:v37 userInfo:v38];

      objc_exception_throw(v39);
    }
  }
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v42 = 0u;
  memset(v41, 0, sizeof(v41));
  GCExtendedGamepadInitInfoMake();
  for (uint64_t i = 8; i != 1592; i += 72)
    *((unsigned char *)v41 + i) = 0;
  LOBYTE(v42) = 1;
  char v15 = v6 ^ 1;
  BYTE1(v42) = v6 ^ 1;
  BYTE8(v46) = 1;
  BYTE9(v46) = v6 ^ 1;
  LOBYTE(v51) = 1;
  BYTE1(v51) = v6 ^ 1;
  BYTE8(v55) = 1;
  BYTE9(v55) = v6 ^ 1;
  char v73 = 1;
  char v74 = v6 ^ 1;
  char v75 = 1;
  char v76 = v6 ^ 1;
  char v69 = 1;
  char v70 = v6 ^ 1;
  char v71 = 1;
  char v72 = v6 ^ 1;
  v16 = [v4 elements];
  unsigned __int8 v81 = [v16 containsObject:GCInputLeftBumper];

  char v82 = v15;
  v17 = [v4 elements];
  unsigned __int8 v83 = [v17 containsObject:GCInputRightBumper];

  char v84 = v15;
  char v77 = 1;
  char v78 = v15;
  v18 = [v4 elements];
  unsigned __int8 v79 = [v18 containsObject:GCInputButtonOptions];

  char v80 = v15;
  v19 = [v4 elements];
  unsigned __int8 v93 = [v19 containsObject:GCInputButtonShare];

  unsigned __int8 v94 = v93;
  BYTE8(v41[0]) = 1;
  BYTE9(v41[0]) = v15;
  LOWORD(v60) = 1;
  WORD4(v64) = 1;
  v20 = [v4 elements];
  if ([v20 containsObject:GCInputBackLeftPrimaryButton])
  {
    unsigned __int8 v85 = 1;
  }
  else
  {
    v21 = [v4 elements];
    unsigned __int8 v85 = [v21 containsObject:GCInputXboxPaddleThree];
  }
  char v86 = v15;
  v22 = [v4 elements];
  if ([v22 containsObject:GCInputBackLeftSecondaryButton])
  {
    unsigned __int8 v87 = 1;
  }
  else
  {
    v23 = [v4 elements];
    unsigned __int8 v87 = [v23 containsObject:GCInputXboxPaddleFour];
  }
  char v88 = v15;
  v24 = [v4 elements];
  if ([v24 containsObject:GCInputBackRightPrimaryButton])
  {
    unsigned __int8 v89 = 1;
  }
  else
  {
    v25 = [v4 elements];
    unsigned __int8 v89 = [v25 containsObject:GCInputXboxPaddleOne];
  }
  char v90 = v15;
  v26 = [v4 elements];
  if ([v26 containsObject:GCInputBackRightSecondaryButton])
  {
    unsigned __int8 v91 = 1;
  }
  else
  {
    v27 = [v4 elements];
    unsigned __int8 v91 = [v27 containsObject:GCInputXboxPaddleTwo];
  }
  char v92 = v15;
  v28 = (GCExtendedGamepad *)[objc_alloc((Class)GCExtendedGamepad) initWithController:0 initInfo:v41];
  for (uint64_t j = 0; j != 1584; j += 72)
    __destructor_8_s0_s48_s56_s64((uint64_t)v41 + j);
  v97[0] = v5;
  v97[1] = v28;
  v30 = +[NSArray arrayWithObjects:v97 count:2];
  v40.receiver = self;
  v40.super_class = (Class)GCTouchController;
  v31 = [(GCTouchController *)&v40 initWithComponents:v30];

  extendedGamepad = v31->_extendedGamepad;
  v31->_extendedGamepad = v28;
  v33 = v28;

  uint64_t v34 = objc_opt_new();
  event = v31->_event;
  v31->_event = (_GCGamepadEventImpl *)v34;

  return v31;
}

uint64_t __43__GCTouchController_initWithConfiguration___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

- (void)setValue:(double)a3 forButtonElement:(id)a4
{
  id v26 = a4;
  if ([v26 isEqualToString:GCInputButtonA])
  {
    *(float *)&double v6 = a3;
    [(_GCGamepadEventImpl *)self->_event setButtonAValue:v6];
  }
  else if ([v26 isEqualToString:GCInputButtonB])
  {
    *(float *)&double v7 = a3;
    [(_GCGamepadEventImpl *)self->_event setButtonBValue:v7];
  }
  else if ([v26 isEqualToString:GCInputButtonX])
  {
    *(float *)&double v8 = a3;
    [(_GCGamepadEventImpl *)self->_event setButtonXValue:v8];
  }
  else if ([v26 isEqualToString:GCInputButtonY])
  {
    *(float *)&double v9 = a3;
    [(_GCGamepadEventImpl *)self->_event setButtonYValue:v9];
  }
  else if ([v26 isEqualToString:GCInputLeftShoulder])
  {
    *(float *)&double v10 = a3;
    [(_GCGamepadEventImpl *)self->_event setButtonLeftShoulder:v10];
  }
  else if ([v26 isEqualToString:GCInputRightShoulder])
  {
    *(float *)&double v11 = a3;
    [(_GCGamepadEventImpl *)self->_event setButtonRightShoulder:v11];
  }
  else if ([v26 isEqualToString:GCInputLeftBumper])
  {
    *(float *)&double v12 = a3;
    [(_GCGamepadEventImpl *)self->_event setButtonLeftBumper:v12];
  }
  else if ([v26 isEqualToString:GCInputRightBumper])
  {
    *(float *)&double v13 = a3;
    [(_GCGamepadEventImpl *)self->_event setButtonRightBumper:v13];
  }
  else if ([v26 isEqualToString:GCInputLeftTrigger])
  {
    *(float *)&double v14 = a3;
    [(_GCGamepadEventImpl *)self->_event setLeftTrigger:v14];
  }
  else if ([v26 isEqualToString:GCInputRightTrigger])
  {
    *(float *)&double v15 = a3;
    [(_GCGamepadEventImpl *)self->_event setRightTrigger:v15];
  }
  else if ([v26 isEqualToString:GCInputLeftThumbstickButton])
  {
    *(float *)&double v16 = a3;
    [(_GCGamepadEventImpl *)self->_event setLeftThumbstickButton:v16];
  }
  else if ([v26 isEqualToString:GCInputRightThumbstickButton])
  {
    *(float *)&double v17 = a3;
    [(_GCGamepadEventImpl *)self->_event setRightThumbstickButton:v17];
  }
  else if ([v26 isEqualToString:GCInputButtonMenu])
  {
    *(float *)&double v18 = a3;
    [(_GCGamepadEventImpl *)self->_event setButtonMenu:v18];
  }
  else if ([v26 isEqualToString:GCInputButtonOptions])
  {
    *(float *)&double v19 = a3;
    [(_GCGamepadEventImpl *)self->_event setButtonOptions:v19];
  }
  else if ([v26 isEqualToString:GCInputButtonShare])
  {
    *(float *)&double v20 = a3;
    [(_GCGamepadEventImpl *)self->_event setButtonSpecial15:v20];
  }
  else if (([v26 isEqualToString:GCInputBackLeftPrimaryButton] & 1) != 0 {
         || [v26 isEqualToString:GCInputXboxPaddleThree])
  }
  {
    *(float *)&double v21 = a3;
    [(_GCGamepadEventImpl *)self->_event setButtonBackLeftPrimary:v21];
  }
  else if (([v26 isEqualToString:GCInputBackLeftSecondaryButton] & 1) != 0 {
         || [v26 isEqualToString:GCInputXboxPaddleFour])
  }
  {
    *(float *)&double v22 = a3;
    [(_GCGamepadEventImpl *)self->_event setButtonBackLeftSecondary:v22];
  }
  else if (([v26 isEqualToString:GCInputBackRightPrimaryButton] & 1) != 0 {
         || [v26 isEqualToString:GCInputXboxPaddleOne])
  }
  {
    *(float *)&double v23 = a3;
    [(_GCGamepadEventImpl *)self->_event setButtonBackRightPrimary:v23];
  }
  else
  {
    if (([v26 isEqualToString:GCInputBackRightSecondaryButton] & 1) == 0
      && ![v26 isEqualToString:GCInputXboxPaddleTwo])
    {
      +[NSString stringWithFormat:@"*** Unknown button element '%@'.", v26];
      id v25 = +[NSException exceptionWithName:NSInvalidArgumentException reason:objc_claimAutoreleasedReturnValue() userInfo:0];
      objc_exception_throw(v25);
    }
    *(float *)&double v24 = a3;
    [(_GCGamepadEventImpl *)self->_event setButtonBackRightSecondary:v24];
  }
  [(GCExtendedGamepad *)self->_extendedGamepad handleGamepadEvent:self->_event];
}

- (void)setPosition:(CGPoint)a3 forDirectionPadElement:(id)a4
{
  float x = a3.x;
  float y = a3.y;
  id v20 = a4;
  if ([v20 isEqualToString:GCInputLeftThumbstick])
  {
    *(float *)&double v7 = fmaxf(y, 0.0);
    [(_GCGamepadEventImpl *)self->_event setLeftThumbstickUp:v7];
    *(float *)&double v8 = fmaxf(x, 0.0);
    [(_GCGamepadEventImpl *)self->_event setLeftThumbstickRight:v8];
    *(float *)&double v9 = -y;
    if (y > 0.0) {
      *(float *)&double v9 = -0.0;
    }
    [(_GCGamepadEventImpl *)self->_event setLeftThumbstickDown:v9];
    *(float *)&double v10 = -x;
    if (x > 0.0) {
      *(float *)&double v10 = -0.0;
    }
    [(_GCGamepadEventImpl *)self->_event setLeftThumbstickLeft:v10];
  }
  else if ([v20 isEqualToString:GCInputDirectionPad])
  {
    *(float *)&double v11 = fmaxf(y, 0.0);
    [(_GCGamepadEventImpl *)self->_event setDpadUpValue:v11];
    *(float *)&double v12 = fmaxf(x, 0.0);
    [(_GCGamepadEventImpl *)self->_event setDpadRightValue:v12];
    *(float *)&double v13 = -y;
    if (y > 0.0) {
      *(float *)&double v13 = -0.0;
    }
    [(_GCGamepadEventImpl *)self->_event setDpadDownValue:v13];
    *(float *)&double v14 = -x;
    if (x > 0.0) {
      *(float *)&double v14 = -0.0;
    }
    [(_GCGamepadEventImpl *)self->_event setDpadLeftValue:v14];
  }
  else
  {
    if (![v20 isEqualToString:GCInputRightThumbstick])
    {
      +[NSString stringWithFormat:@"*** Unknown direction pad element '%@'.", v20];
      id v19 = +[NSException exceptionWithName:NSInvalidArgumentException reason:objc_claimAutoreleasedReturnValue() userInfo:0];
      objc_exception_throw(v19);
    }
    *(float *)&double v15 = fmaxf(y, 0.0);
    [(_GCGamepadEventImpl *)self->_event setRightThumbstickUp:v15];
    *(float *)&double v16 = fmaxf(x, 0.0);
    [(_GCGamepadEventImpl *)self->_event setRightThumbstickRight:v16];
    *(float *)&double v17 = -y;
    if (y > 0.0) {
      *(float *)&double v17 = -0.0;
    }
    [(_GCGamepadEventImpl *)self->_event setRightThumbstickDown:v17];
    *(float *)&double v18 = -x;
    if (x > 0.0) {
      *(float *)&double v18 = -0.0;
    }
    [(_GCGamepadEventImpl *)self->_event setRightThumbstickLeft:v18];
  }
  [(GCExtendedGamepad *)self->_extendedGamepad handleGamepadEvent:self->_event];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);

  objc_storeStrong((id *)&self->_extendedGamepad, 0);
}

@end