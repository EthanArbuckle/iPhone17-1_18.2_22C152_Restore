@interface GCXboxGamepad
+ (BOOL)supportsSecureCoding;
- (GCControllerButtonInput)paddleButton1;
- (GCControllerButtonInput)paddleButton2;
- (GCControllerButtonInput)paddleButton3;
- (GCControllerButtonInput)paddleButton4;
- (GCXboxGamepad)initWithCoder:(id)a3;
- (GCXboxGamepad)initWithController:(id)a3;
- (GCXboxGamepad)initWithIdentifier:(id)a3;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)initializeExtraControllerElements;
- (void)setType:(int64_t)a3;
@end

@implementation GCXboxGamepad

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCXboxGamepad)initWithController:(id)a3
{
  id v4 = a3;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  memset(v22, 0, sizeof(v22));
  GCExtendedGamepadInitInfoMake(v22);
  for (uint64_t i = 9; i != 1161; i += 72)
    *((unsigned char *)v22 + i) = 1;
  BYTE1(v23) = 0;
  BYTE9(v27) = 0;
  char v32 = 0;
  char v33 = 0;
  v21.receiver = self;
  v21.super_class = (Class)GCXboxGamepad;
  v6 = [(GCExtendedGamepad *)&v21 initWithController:v4 initInfo:v22];
  v7 = v6;
  if (v6)
  {
    v8 = [(GCPhysicalInputProfile *)v6 controller];
    v9 = [v8 hidServices];
    v10 = [v9 firstObject];
    v11 = [v10 numberPropertyForKey:@"ProductID"];
    int v12 = [v11 unsignedIntValue];

    if (v12 > 2848)
    {
      switch(v12)
      {
        case 2849:
          goto LABEL_16;
        case 2850:
        case 2852:
          goto LABEL_11;
        case 2851:
          goto LABEL_14;
        default:
          goto LABEL_18;
      }
    }
    if (v12 > 2833)
    {
      if ((v12 - 2834) < 2)
      {
LABEL_14:
        if (gc_isInternalBuild())
        {
          v17 = getGCLogger();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v20 = 0;
            _os_log_impl(&dword_220998000, v17, OS_LOG_TYPE_DEFAULT, "recognized series X controller", v20, 2u);
          }
        }
        char v34 = 1;
        uint64_t v13 = 3;
        goto LABEL_20;
      }
    }
    else
    {
      if (v12 == 2818 || v12 == 2821)
      {
LABEL_11:
        if (gc_isInternalBuild())
        {
          v16 = getGCLogger();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v20 = 0;
            _os_log_impl(&dword_220998000, v16, OS_LOG_TYPE_DEFAULT, "recognized elite controller", v20, 2u);
          }
        }
        uint64_t v13 = 1;
        goto LABEL_20;
      }
      if (v12 == 2828)
      {
LABEL_16:
        if (gc_isInternalBuild())
        {
          v18 = getGCLogger();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v20 = 0;
            _os_log_impl(&dword_220998000, v18, OS_LOG_TYPE_DEFAULT, "recognized adaptive controller", v20, 2u);
          }
        }
        uint64_t v13 = 2;
        goto LABEL_20;
      }
    }
LABEL_18:
    if (gc_isInternalBuild())
    {
      v19 = getGCLogger();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_220998000, v19, OS_LOG_TYPE_DEFAULT, "recognized standard controller", v20, 2u);
      }
    }
    uint64_t v13 = 0;
LABEL_20:
    v7->_type = v13;
    [(GCXboxGamepad *)v7 initializeExtraControllerElements];
  }
  for (uint64_t j = 0; j != 1584; j += 72)
    __destructor_8_s0_s48_s56_s64((uint64_t)v22 + j);

  return v7;
}

- (GCXboxGamepad)initWithIdentifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GCXboxGamepad;
  v3 = [(GCExtendedGamepad *)&v6 initWithIdentifier:a3];
  id v4 = v3;
  if (v3) {
    [(GCXboxGamepad *)v3 initializeExtraControllerElements];
  }
  return v4;
}

- (GCXboxGamepad)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GCXboxGamepad;
  v5 = [(GCExtendedGamepad *)&v7 initWithCoder:v4];
  if (v5)
  {
    v5->_type = [v4 decodeIntegerForKey:@"GCXboxGamepadType"];
    [(GCXboxGamepad *)v5 initializeExtraControllerElements];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GCXboxGamepad;
  id v4 = a3;
  [(GCExtendedGamepad *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", +[GCXboxGamepad version](GCXboxGamepad, "version", v5.receiver, v5.super_class), @"version");
  [v4 encodeInteger:self->_type forKey:@"GCXboxGamepadType"];
}

- (void)initializeExtraControllerElements
{
  if (self->_type == 1)
  {
    v66 = @"Paddle 1";
    __int16 v67 = 257;
    uint64_t v69 = 0;
    uint64_t v70 = 0;
    uint64_t v68 = 25;
    int v71 = 1;
    __int16 v72 = 1;
    char v73 = 0;
    v74 = @"1.circle";
    v75 = @"XBOX_BUTTON_PADDLE_1";
    uint64_t v76 = 0;
    v3 = [(GCPhysicalInputProfile *)self _buttonWithInfo:&v66];
    paddleButton1 = self->_paddleButton1;
    self->_paddleButton1 = v3;

    v55 = @"Paddle 2";
    __int16 v56 = 257;
    uint64_t v58 = 0;
    uint64_t v59 = 0;
    uint64_t v57 = 26;
    int v60 = 1;
    __int16 v61 = 1;
    char v62 = 0;
    v63 = @"2.circle";
    v64 = @"XBOX_BUTTON_PADDLE_2";
    uint64_t v65 = 0;
    objc_super v5 = [(GCPhysicalInputProfile *)self _buttonWithInfo:&v55];
    paddleButton2 = self->_paddleButton2;
    self->_paddleButton2 = v5;

    v44 = @"Paddle 3";
    __int16 v45 = 257;
    uint64_t v47 = 0;
    uint64_t v48 = 0;
    uint64_t v46 = 27;
    int v49 = 1;
    __int16 v50 = 1;
    char v51 = 0;
    v52 = @"3.circle";
    v53 = @"XBOX_BUTTON_PADDLE_3";
    uint64_t v54 = 0;
    objc_super v7 = [(GCPhysicalInputProfile *)self _buttonWithInfo:&v44];
    paddleButton3 = self->_paddleButton3;
    self->_paddleButton3 = v7;

    char v33 = @"Paddle 4";
    __int16 v34 = 257;
    uint64_t v36 = 0;
    uint64_t v37 = 0;
    uint64_t v35 = 28;
    int v38 = 1;
    __int16 v39 = 1;
    char v40 = 0;
    v41 = @"4.circle";
    v42 = @"XBOX_BUTTON_PADDLE_4";
    uint64_t v43 = 0;
    v9 = [(GCPhysicalInputProfile *)self _buttonWithInfo:&v33];
    paddleButton4 = self->_paddleButton4;
    self->_paddleButton4 = v9;
  }
  v11 = [(GCExtendedGamepad *)self leftTrigger];
  [v11 setUnmappedSfSymbolsName:@"lt.rectangle.roundedtop"];

  int v12 = [(GCExtendedGamepad *)self rightTrigger];
  [v12 setUnmappedSfSymbolsName:@"rt.rectangle.roundedtop"];

  uint64_t v13 = [(GCExtendedGamepad *)self leftShoulder];
  [v13 setUnmappedSfSymbolsName:@"lb.rectangle.roundedbottom"];

  v14 = [(GCExtendedGamepad *)self rightShoulder];
  [v14 setUnmappedSfSymbolsName:@"rb.rectangle.roundedbottom"];

  v15 = [(GCExtendedGamepad *)self buttonHome];
  [v15 setUnmappedSfSymbolsName:@"logo.xbox"];

  v16 = [(GCExtendedGamepad *)self buttonOptions];
  [v16 setUnmappedSfSymbolsName:@"rectangle.fill.on.rectangle.fill.circle"];

  v17 = [(GCExtendedGamepad *)self buttonHome];
  [v17 setUnmappedNameLocalizationKey:@"XBOX_BUTTON_HOME"];

  v18 = [(GCExtendedGamepad *)self buttonOptions];
  [v18 setUnmappedNameLocalizationKey:@"XBOX_BUTTON_OPTIONS"];

  v19 = [(GCExtendedGamepad *)self buttonMenu];
  [v19 setUnmappedNameLocalizationKey:@"XBOX_BUTTON_MENU"];

  v20 = [(GCExtendedGamepad *)self dpad];
  [v20 setUnmappedNameLocalizationKey:@"XBOX_DIRECTION_PAD"];

  objc_super v21 = [(GCExtendedGamepad *)self buttonA];
  [v21 setUnmappedNameLocalizationKey:@"XBOX_BUTTON_A"];

  v22 = [(GCExtendedGamepad *)self buttonB];
  [v22 setUnmappedNameLocalizationKey:@"XBOX_BUTTON_B"];

  long long v23 = [(GCExtendedGamepad *)self buttonX];
  [v23 setUnmappedNameLocalizationKey:@"XBOX_BUTTON_X"];

  long long v24 = [(GCExtendedGamepad *)self buttonY];
  [v24 setUnmappedNameLocalizationKey:@"XBOX_BUTTON_Y"];

  long long v25 = [(GCExtendedGamepad *)self leftShoulder];
  [v25 setUnmappedNameLocalizationKey:@"XBOX_LEFT_SHOULDER"];

  long long v26 = [(GCExtendedGamepad *)self rightShoulder];
  [v26 setUnmappedNameLocalizationKey:@"XBOX_RIGHT_SHOULDER"];

  long long v27 = [(GCExtendedGamepad *)self leftTrigger];
  [v27 setUnmappedNameLocalizationKey:@"XBOX_LEFT_TRIGGER"];

  long long v28 = [(GCExtendedGamepad *)self rightTrigger];
  [v28 setUnmappedNameLocalizationKey:@"XBOX_RIGHT_TRIGGER"];

  long long v29 = [(GCExtendedGamepad *)self leftThumbstick];
  [v29 setUnmappedNameLocalizationKey:@"XBOX_LEFT_THUMBSTICK"];

  long long v30 = [(GCExtendedGamepad *)self rightThumbstick];
  [v30 setUnmappedNameLocalizationKey:@"XBOX_RIGHT_THUMBSTICK"];

  long long v31 = [(GCExtendedGamepad *)self leftThumbstickButton];
  [v31 setUnmappedNameLocalizationKey:@"XBOX_BUTTON_LEFT_THUMBSTICK"];

  char v32 = [(GCExtendedGamepad *)self rightThumbstickButton];
  [v32 setUnmappedNameLocalizationKey:@"XBOX_BUTTON_RIGHT_THUMBSTICK"];
}

- (GCControllerButtonInput)paddleButton1
{
  return self->_paddleButton1;
}

- (GCControllerButtonInput)paddleButton2
{
  return self->_paddleButton2;
}

- (GCControllerButtonInput)paddleButton3
{
  return self->_paddleButton3;
}

- (GCControllerButtonInput)paddleButton4
{
  return self->_paddleButton4;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paddleButton4, 0);
  objc_storeStrong((id *)&self->_paddleButton3, 0);
  objc_storeStrong((id *)&self->_paddleButton2, 0);

  objc_storeStrong((id *)&self->_paddleButton1, 0);
}

@end