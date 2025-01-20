@interface AXSwitchGameControlButtonPress
+ (BOOL)supportsSecureCoding;
- (AXSwitchGameControlButtonPress)initWithCoder:(id)a3;
- (AXSwitchGameControlButtonPress)initWithDictionaryRepresentation:(id)a3;
- (BOOL)isJoystickPress;
- (BOOL)isToggle;
- (NSDictionary)dictionaryRepresentation;
- (float)xMagnitude;
- (float)yMagnitude;
- (unint64_t)button;
- (void)encodeWithCoder:(id)a3;
- (void)setButton:(unint64_t)a3;
- (void)setJoystickPress:(BOOL)a3;
- (void)setToggle:(BOOL)a3;
- (void)setXMagnitude:(float)a3;
- (void)setYMagnitude:(float)a3;
@end

@implementation AXSwitchGameControlButtonPress

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXSwitchGameControlButtonPress)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AXSwitchGameControlButtonPress;
  v5 = [(AXSwitchGameControlButtonPress *)&v10 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AXSwitchGameControlButtonPressButton"];
    v5->_button = [v6 unsignedIntegerValue];

    v5->_toggle = [v4 decodeBoolForKey:@"AXSwitchGameControlButtonPressToggle"];
    [v4 decodeFloatForKey:@"AXSwitchGameControlButtonPressXMagnitude"];
    v5->_xMagnitude = v7;
    [v4 decodeFloatForKey:@"AXSwitchGameControlButtonPressYMagnitude"];
    v5->_yMagnitude = v8;
    v5->_joystickPress = [v4 decodeBoolForKey:@"AXSwitchGameControlButtonPressJoystickPress"];
  }

  return v5;
}

- (AXSwitchGameControlButtonPress)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AXSwitchGameControlButtonPress;
  v5 = [(AXSwitchGameControlButtonPress *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"AXSwitchGameControlButtonPressButton"];
    v5->_button = [v6 unsignedIntegerValue];

    float v7 = [v4 objectForKeyedSubscript:@"AXSwitchGameControlButtonPressToggle"];
    v5->_toggle = [v7 BOOLValue];

    float v8 = [v4 objectForKeyedSubscript:@"AXSwitchGameControlButtonPressXMagnitude"];
    [v8 floatValue];
    v5->_xMagnitude = v9;

    objc_super v10 = [v4 objectForKeyedSubscript:@"AXSwitchGameControlButtonPressYMagnitude"];
    [v10 floatValue];
    v5->_yMagnitude = v11;

    v12 = [v4 objectForKeyedSubscript:@"AXSwitchGameControlButtonPressJoystickPress"];
    v5->_joystickPress = [v12 BOOLValue];
  }
  return v5;
}

- (NSDictionary)dictionaryRepresentation
{
  v13[5] = *MEMORY[0x1E4F143B8];
  v12[0] = @"AXSwitchGameControlButtonPressButton";
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[AXSwitchGameControlButtonPress button](self, "button"));
  v13[0] = v3;
  v12[1] = @"AXSwitchGameControlButtonPressToggle";
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[AXSwitchGameControlButtonPress isToggle](self, "isToggle"));
  v13[1] = v4;
  v12[2] = @"AXSwitchGameControlButtonPressXMagnitude";
  v5 = NSNumber;
  [(AXSwitchGameControlButtonPress *)self xMagnitude];
  v6 = objc_msgSend(v5, "numberWithFloat:");
  v13[2] = v6;
  v12[3] = @"AXSwitchGameControlButtonPressYMagnitude";
  float v7 = NSNumber;
  [(AXSwitchGameControlButtonPress *)self yMagnitude];
  float v8 = objc_msgSend(v7, "numberWithFloat:");
  v13[3] = v8;
  v12[4] = @"AXSwitchGameControlButtonPressJoystickPress";
  float v9 = objc_msgSend(NSNumber, "numberWithBool:", -[AXSwitchGameControlButtonPress isJoystickPress](self, "isJoystickPress"));
  v13[4] = v9;
  objc_super v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:5];

  return (NSDictionary *)v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  id v6 = a3;
  v5 = objc_msgSend(v4, "numberWithUnsignedInteger:", -[AXSwitchGameControlButtonPress button](self, "button"));
  [v6 encodeObject:v5 forKey:@"AXSwitchGameControlButtonPressButton"];

  objc_msgSend(v6, "encodeBool:forKey:", -[AXSwitchGameControlButtonPress isToggle](self, "isToggle"), @"AXSwitchGameControlButtonPressToggle");
  [(AXSwitchGameControlButtonPress *)self xMagnitude];
  objc_msgSend(v6, "encodeFloat:forKey:", @"AXSwitchGameControlButtonPressXMagnitude");
  [(AXSwitchGameControlButtonPress *)self yMagnitude];
  objc_msgSend(v6, "encodeFloat:forKey:", @"AXSwitchGameControlButtonPressYMagnitude");
  objc_msgSend(v6, "encodeBool:forKey:", -[AXSwitchGameControlButtonPress isJoystickPress](self, "isJoystickPress"), @"AXSwitchGameControlButtonPressJoystickPress");
}

- (unint64_t)button
{
  return self->_button;
}

- (void)setButton:(unint64_t)a3
{
  self->_button = a3;
}

- (BOOL)isToggle
{
  return self->_toggle;
}

- (void)setToggle:(BOOL)a3
{
  self->_toggle = a3;
}

- (float)xMagnitude
{
  return self->_xMagnitude;
}

- (void)setXMagnitude:(float)a3
{
  self->_xMagnitude = a3;
}

- (float)yMagnitude
{
  return self->_yMagnitude;
}

- (void)setYMagnitude:(float)a3
{
  self->_yMagnitude = a3;
}

- (BOOL)isJoystickPress
{
  return self->_joystickPress;
}

- (void)setJoystickPress:(BOOL)a3
{
  self->_joystickPress = a3;
}

@end