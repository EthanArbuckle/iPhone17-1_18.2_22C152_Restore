@interface AXEventGameControllerInfoRepresentation
+ (BOOL)supportsSecureCoding;
- (AXEventGameControllerInfoRepresentation)initWithCoder:(id)a3;
- (BOOL)isDirectionPadPressed;
- (BOOL)isFaceButtonPressed;
- (BOOL)isJoystickPressed;
- (BOOL)isKeyboardTypeButtonPressed;
- (BOOL)isShoulderButtonPressed;
- (BOOL)leftJoystickActive;
- (BOOL)rightJoystickActive;
- (double)directionPadDown;
- (double)directionPadLeft;
- (double)directionPadRight;
- (double)directionPadUp;
- (double)faceButtonA;
- (double)faceButtonB;
- (double)faceButtonX;
- (double)faceButtonY;
- (double)homeButton;
- (double)leftJoystickButton;
- (double)leftJoystickX;
- (double)leftJoystickY;
- (double)menuButton;
- (double)rightJoystickButton;
- (double)rightJoystickX;
- (double)rightJoystickY;
- (double)shoulderButtonL1;
- (double)shoulderButtonL2;
- (double)shoulderButtonR1;
- (double)shoulderButtonR2;
- (double)viewButton;
- (id)accessibilityEventRepresentationTabularDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDirectionPadDown:(double)a3;
- (void)setDirectionPadLeft:(double)a3;
- (void)setDirectionPadRight:(double)a3;
- (void)setDirectionPadUp:(double)a3;
- (void)setFaceButtonA:(double)a3;
- (void)setFaceButtonB:(double)a3;
- (void)setFaceButtonX:(double)a3;
- (void)setFaceButtonY:(double)a3;
- (void)setHomeButton:(double)a3;
- (void)setLeftJoystickButton:(double)a3;
- (void)setLeftJoystickX:(double)a3;
- (void)setLeftJoystickY:(double)a3;
- (void)setMenuButton:(double)a3;
- (void)setRightJoystickButton:(double)a3;
- (void)setRightJoystickX:(double)a3;
- (void)setRightJoystickY:(double)a3;
- (void)setShoulderButtonL1:(double)a3;
- (void)setShoulderButtonL2:(double)a3;
- (void)setShoulderButtonR1:(double)a3;
- (void)setShoulderButtonR2:(double)a3;
- (void)setViewButton:(double)a3;
@end

@implementation AXEventGameControllerInfoRepresentation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXEventGameControllerInfoRepresentation)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)AXEventGameControllerInfoRepresentation;
  v5 = [(AXEventGameControllerInfoRepresentation *)&v7 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"directionPadUp"];
    -[AXEventGameControllerInfoRepresentation setDirectionPadUp:](v5, "setDirectionPadUp:");
    [v4 decodeDoubleForKey:@"directionPadDown"];
    -[AXEventGameControllerInfoRepresentation setDirectionPadDown:](v5, "setDirectionPadDown:");
    [v4 decodeDoubleForKey:@"directionPadLeft"];
    -[AXEventGameControllerInfoRepresentation setDirectionPadLeft:](v5, "setDirectionPadLeft:");
    [v4 decodeDoubleForKey:@"directionPadRight"];
    -[AXEventGameControllerInfoRepresentation setDirectionPadRight:](v5, "setDirectionPadRight:");
    [v4 decodeDoubleForKey:@"faceButtonA"];
    -[AXEventGameControllerInfoRepresentation setFaceButtonA:](v5, "setFaceButtonA:");
    [v4 decodeDoubleForKey:@"faceButtonB"];
    -[AXEventGameControllerInfoRepresentation setFaceButtonB:](v5, "setFaceButtonB:");
    [v4 decodeDoubleForKey:@"faceButtonX"];
    -[AXEventGameControllerInfoRepresentation setFaceButtonX:](v5, "setFaceButtonX:");
    [v4 decodeDoubleForKey:@"faceButtonY"];
    -[AXEventGameControllerInfoRepresentation setFaceButtonY:](v5, "setFaceButtonY:");
    [v4 decodeDoubleForKey:@"shoulderButtonL1"];
    -[AXEventGameControllerInfoRepresentation setShoulderButtonL1:](v5, "setShoulderButtonL1:");
    [v4 decodeDoubleForKey:@"shoulderButtonL2"];
    -[AXEventGameControllerInfoRepresentation setShoulderButtonL2:](v5, "setShoulderButtonL2:");
    [v4 decodeDoubleForKey:@"shoulderButtonR1"];
    -[AXEventGameControllerInfoRepresentation setShoulderButtonR1:](v5, "setShoulderButtonR1:");
    [v4 decodeDoubleForKey:@"shoulderButtonR2"];
    -[AXEventGameControllerInfoRepresentation setShoulderButtonR2:](v5, "setShoulderButtonR2:");
    [v4 decodeDoubleForKey:@"leftJoystickX"];
    -[AXEventGameControllerInfoRepresentation setLeftJoystickX:](v5, "setLeftJoystickX:");
    [v4 decodeDoubleForKey:@"leftJoystickY"];
    -[AXEventGameControllerInfoRepresentation setLeftJoystickY:](v5, "setLeftJoystickY:");
    [v4 decodeDoubleForKey:@"leftJoystickButton"];
    -[AXEventGameControllerInfoRepresentation setLeftJoystickButton:](v5, "setLeftJoystickButton:");
    [v4 decodeDoubleForKey:@"rightJoystickX"];
    -[AXEventGameControllerInfoRepresentation setRightJoystickX:](v5, "setRightJoystickX:");
    [v4 decodeDoubleForKey:@"rightJoystickY"];
    -[AXEventGameControllerInfoRepresentation setRightJoystickY:](v5, "setRightJoystickY:");
    [v4 decodeDoubleForKey:@"rightJoystickButton"];
    -[AXEventGameControllerInfoRepresentation setRightJoystickButton:](v5, "setRightJoystickButton:");
    [v4 decodeDoubleForKey:@"menuButton"];
    -[AXEventGameControllerInfoRepresentation setMenuButton:](v5, "setMenuButton:");
    [v4 decodeDoubleForKey:@"viewButton"];
    -[AXEventGameControllerInfoRepresentation setViewButton:](v5, "setViewButton:");
    [v4 decodeDoubleForKey:@"homeButton"];
    -[AXEventGameControllerInfoRepresentation setHomeButton:](v5, "setHomeButton:");
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(AXEventGameControllerInfoRepresentation);
  [(AXEventGameControllerInfoRepresentation *)self directionPadUp];
  -[AXEventGameControllerInfoRepresentation setDirectionPadUp:](v4, "setDirectionPadUp:");
  [(AXEventGameControllerInfoRepresentation *)self directionPadDown];
  -[AXEventGameControllerInfoRepresentation setDirectionPadDown:](v4, "setDirectionPadDown:");
  [(AXEventGameControllerInfoRepresentation *)self directionPadLeft];
  -[AXEventGameControllerInfoRepresentation setDirectionPadLeft:](v4, "setDirectionPadLeft:");
  [(AXEventGameControllerInfoRepresentation *)self directionPadRight];
  -[AXEventGameControllerInfoRepresentation setDirectionPadRight:](v4, "setDirectionPadRight:");
  [(AXEventGameControllerInfoRepresentation *)self faceButtonA];
  -[AXEventGameControllerInfoRepresentation setFaceButtonA:](v4, "setFaceButtonA:");
  [(AXEventGameControllerInfoRepresentation *)self faceButtonB];
  -[AXEventGameControllerInfoRepresentation setFaceButtonB:](v4, "setFaceButtonB:");
  [(AXEventGameControllerInfoRepresentation *)self faceButtonX];
  -[AXEventGameControllerInfoRepresentation setFaceButtonX:](v4, "setFaceButtonX:");
  [(AXEventGameControllerInfoRepresentation *)self faceButtonY];
  -[AXEventGameControllerInfoRepresentation setFaceButtonY:](v4, "setFaceButtonY:");
  [(AXEventGameControllerInfoRepresentation *)self shoulderButtonL1];
  -[AXEventGameControllerInfoRepresentation setShoulderButtonL1:](v4, "setShoulderButtonL1:");
  [(AXEventGameControllerInfoRepresentation *)self shoulderButtonL2];
  -[AXEventGameControllerInfoRepresentation setShoulderButtonL2:](v4, "setShoulderButtonL2:");
  [(AXEventGameControllerInfoRepresentation *)self shoulderButtonR1];
  -[AXEventGameControllerInfoRepresentation setShoulderButtonR1:](v4, "setShoulderButtonR1:");
  [(AXEventGameControllerInfoRepresentation *)self shoulderButtonR2];
  -[AXEventGameControllerInfoRepresentation setShoulderButtonR2:](v4, "setShoulderButtonR2:");
  [(AXEventGameControllerInfoRepresentation *)self leftJoystickX];
  -[AXEventGameControllerInfoRepresentation setLeftJoystickX:](v4, "setLeftJoystickX:");
  [(AXEventGameControllerInfoRepresentation *)self leftJoystickY];
  -[AXEventGameControllerInfoRepresentation setLeftJoystickY:](v4, "setLeftJoystickY:");
  [(AXEventGameControllerInfoRepresentation *)self leftJoystickButton];
  -[AXEventGameControllerInfoRepresentation setLeftJoystickButton:](v4, "setLeftJoystickButton:");
  [(AXEventGameControllerInfoRepresentation *)self rightJoystickX];
  -[AXEventGameControllerInfoRepresentation setRightJoystickX:](v4, "setRightJoystickX:");
  [(AXEventGameControllerInfoRepresentation *)self rightJoystickY];
  -[AXEventGameControllerInfoRepresentation setRightJoystickY:](v4, "setRightJoystickY:");
  [(AXEventGameControllerInfoRepresentation *)self rightJoystickButton];
  -[AXEventGameControllerInfoRepresentation setRightJoystickButton:](v4, "setRightJoystickButton:");
  [(AXEventGameControllerInfoRepresentation *)self menuButton];
  -[AXEventGameControllerInfoRepresentation setMenuButton:](v4, "setMenuButton:");
  [(AXEventGameControllerInfoRepresentation *)self viewButton];
  -[AXEventGameControllerInfoRepresentation setViewButton:](v4, "setViewButton:");
  [(AXEventGameControllerInfoRepresentation *)self homeButton];
  -[AXEventGameControllerInfoRepresentation setHomeButton:](v4, "setHomeButton:");
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(AXEventGameControllerInfoRepresentation *)self directionPadUp];
  objc_msgSend(v4, "encodeDouble:forKey:", @"directionPadUp");
  [(AXEventGameControllerInfoRepresentation *)self directionPadDown];
  objc_msgSend(v4, "encodeDouble:forKey:", @"directionPadDown");
  [(AXEventGameControllerInfoRepresentation *)self directionPadLeft];
  objc_msgSend(v4, "encodeDouble:forKey:", @"directionPadLeft");
  [(AXEventGameControllerInfoRepresentation *)self directionPadRight];
  objc_msgSend(v4, "encodeDouble:forKey:", @"directionPadRight");
  [(AXEventGameControllerInfoRepresentation *)self faceButtonA];
  objc_msgSend(v4, "encodeDouble:forKey:", @"faceButtonA");
  [(AXEventGameControllerInfoRepresentation *)self faceButtonB];
  objc_msgSend(v4, "encodeDouble:forKey:", @"faceButtonB");
  [(AXEventGameControllerInfoRepresentation *)self faceButtonX];
  objc_msgSend(v4, "encodeDouble:forKey:", @"faceButtonX");
  [(AXEventGameControllerInfoRepresentation *)self faceButtonY];
  objc_msgSend(v4, "encodeDouble:forKey:", @"faceButtonY");
  [(AXEventGameControllerInfoRepresentation *)self shoulderButtonL1];
  objc_msgSend(v4, "encodeDouble:forKey:", @"shoulderButtonL1");
  [(AXEventGameControllerInfoRepresentation *)self shoulderButtonL2];
  objc_msgSend(v4, "encodeDouble:forKey:", @"shoulderButtonL2");
  [(AXEventGameControllerInfoRepresentation *)self shoulderButtonR1];
  objc_msgSend(v4, "encodeDouble:forKey:", @"shoulderButtonR1");
  [(AXEventGameControllerInfoRepresentation *)self shoulderButtonR2];
  objc_msgSend(v4, "encodeDouble:forKey:", @"shoulderButtonR2");
  [(AXEventGameControllerInfoRepresentation *)self leftJoystickX];
  objc_msgSend(v4, "encodeDouble:forKey:", @"leftJoystickX");
  [(AXEventGameControllerInfoRepresentation *)self leftJoystickY];
  objc_msgSend(v4, "encodeDouble:forKey:", @"leftJoystickY");
  [(AXEventGameControllerInfoRepresentation *)self leftJoystickButton];
  objc_msgSend(v4, "encodeDouble:forKey:", @"leftJoystickButton");
  [(AXEventGameControllerInfoRepresentation *)self rightJoystickX];
  objc_msgSend(v4, "encodeDouble:forKey:", @"rightJoystickX");
  [(AXEventGameControllerInfoRepresentation *)self rightJoystickY];
  objc_msgSend(v4, "encodeDouble:forKey:", @"rightJoystickY");
  [(AXEventGameControllerInfoRepresentation *)self rightJoystickButton];
  objc_msgSend(v4, "encodeDouble:forKey:", @"rightJoystickButton");
  [(AXEventGameControllerInfoRepresentation *)self rightJoystickButton];
  objc_msgSend(v4, "encodeDouble:forKey:", @"menuButton");
  [(AXEventGameControllerInfoRepresentation *)self rightJoystickButton];
  objc_msgSend(v4, "encodeDouble:forKey:", @"viewButton");
  [(AXEventGameControllerInfoRepresentation *)self rightJoystickButton];
  objc_msgSend(v4, "encodeDouble:forKey:", @"homeButton");
}

- (id)accessibilityEventRepresentationTabularDescription
{
  v3 = NSString;
  [(AXEventGameControllerInfoRepresentation *)self directionPadUp];
  uint64_t v45 = v4;
  [(AXEventGameControllerInfoRepresentation *)self directionPadDown];
  uint64_t v44 = v5;
  [(AXEventGameControllerInfoRepresentation *)self directionPadLeft];
  uint64_t v43 = v6;
  [(AXEventGameControllerInfoRepresentation *)self directionPadRight];
  uint64_t v42 = v7;
  [(AXEventGameControllerInfoRepresentation *)self leftJoystickX];
  uint64_t v41 = v8;
  [(AXEventGameControllerInfoRepresentation *)self leftJoystickY];
  uint64_t v40 = v9;
  [(AXEventGameControllerInfoRepresentation *)self rightJoystickX];
  uint64_t v39 = v10;
  [(AXEventGameControllerInfoRepresentation *)self rightJoystickY];
  uint64_t v38 = v11;
  [(AXEventGameControllerInfoRepresentation *)self faceButtonA];
  uint64_t v37 = v12;
  [(AXEventGameControllerInfoRepresentation *)self faceButtonB];
  uint64_t v36 = v13;
  [(AXEventGameControllerInfoRepresentation *)self faceButtonX];
  uint64_t v35 = v14;
  [(AXEventGameControllerInfoRepresentation *)self faceButtonY];
  uint64_t v34 = v15;
  [(AXEventGameControllerInfoRepresentation *)self shoulderButtonL1];
  uint64_t v17 = v16;
  [(AXEventGameControllerInfoRepresentation *)self shoulderButtonL2];
  uint64_t v19 = v18;
  [(AXEventGameControllerInfoRepresentation *)self shoulderButtonR1];
  uint64_t v21 = v20;
  [(AXEventGameControllerInfoRepresentation *)self shoulderButtonR2];
  uint64_t v23 = v22;
  [(AXEventGameControllerInfoRepresentation *)self leftJoystickButton];
  uint64_t v25 = v24;
  [(AXEventGameControllerInfoRepresentation *)self rightJoystickButton];
  uint64_t v27 = v26;
  [(AXEventGameControllerInfoRepresentation *)self menuButton];
  uint64_t v29 = v28;
  [(AXEventGameControllerInfoRepresentation *)self viewButton];
  uint64_t v31 = v30;
  [(AXEventGameControllerInfoRepresentation *)self homeButton];
  return (id)objc_msgSend(v3, "stringWithFormat:", @" Game Info:\n   D-pad Up: %.2f\n   D-pad Down: %.2f\n   D-pad Left: %.2f\n   D-pad Right: %.2f\n   Left Stick X: %.2f\n   Left Stick Y: %.2f\n   Right Stick X: %.2f\n   Right Stick Y: %.2f\n   A: %.2f\n   B: %.2f\n   X: %.2f\n   Y: %.2f\n   L1: %.2f\n   L2: %.2f\n   R1: %.2f\n   R2: %.2f\n   Left Stick Button: %.2f\n   Right Stick Button: %.2f\n   Menu Button: %.2f\n   View Button: %.2f\n   Home Button: %.2f\n", v45, v44, v43, v42, v41, v40, v39, v38, v37, v36, v35, v34, v17, v19, v21, v23,
               v25,
               v27,
               v29,
               v31,
               v32);
}

- (BOOL)rightJoystickActive
{
  return self->_rightJoystickX != 0.0 || self->_rightJoystickY != 0.0;
}

- (BOOL)leftJoystickActive
{
  return self->_leftJoystickX != 0.0 || self->_leftJoystickY != 0.0;
}

- (BOOL)isJoystickPressed
{
  return self->_leftJoystickButton != 0.0 || self->_rightJoystickButton != 0.0;
}

- (BOOL)isDirectionPadPressed
{
  return self->_directionPadUp != 0.0
      || self->_directionPadDown != 0.0
      || self->_directionPadLeft != 0.0
      || self->_directionPadRight != 0.0;
}

- (BOOL)isFaceButtonPressed
{
  return self->_faceButtonA != 0.0
      || self->_faceButtonB != 0.0
      || self->_faceButtonX != 0.0
      || self->_faceButtonY != 0.0;
}

- (BOOL)isShoulderButtonPressed
{
  return self->_shoulderButtonL1 != 0.0
      || self->_shoulderButtonL2 != 0.0
      || self->_shoulderButtonR1 != 0.0
      || self->_shoulderButtonR2 != 0.0;
}

- (BOOL)isKeyboardTypeButtonPressed
{
  return self->_menuButton != 0.0 || self->_viewButton != 0.0 || self->_homeButton != 0.0;
}

- (double)directionPadUp
{
  return self->_directionPadUp;
}

- (void)setDirectionPadUp:(double)a3
{
  self->_directionPadUp = a3;
}

- (double)directionPadDown
{
  return self->_directionPadDown;
}

- (void)setDirectionPadDown:(double)a3
{
  self->_directionPadDown = a3;
}

- (double)directionPadLeft
{
  return self->_directionPadLeft;
}

- (void)setDirectionPadLeft:(double)a3
{
  self->_directionPadLeft = a3;
}

- (double)directionPadRight
{
  return self->_directionPadRight;
}

- (void)setDirectionPadRight:(double)a3
{
  self->_directionPadRight = a3;
}

- (double)faceButtonA
{
  return self->_faceButtonA;
}

- (void)setFaceButtonA:(double)a3
{
  self->_faceButtonA = a3;
}

- (double)faceButtonB
{
  return self->_faceButtonB;
}

- (void)setFaceButtonB:(double)a3
{
  self->_faceButtonB = a3;
}

- (double)faceButtonX
{
  return self->_faceButtonX;
}

- (void)setFaceButtonX:(double)a3
{
  self->_faceButtonX = a3;
}

- (double)faceButtonY
{
  return self->_faceButtonY;
}

- (void)setFaceButtonY:(double)a3
{
  self->_faceButtonY = a3;
}

- (double)shoulderButtonR1
{
  return self->_shoulderButtonR1;
}

- (void)setShoulderButtonR1:(double)a3
{
  self->_shoulderButtonR1 = a3;
}

- (double)shoulderButtonR2
{
  return self->_shoulderButtonR2;
}

- (void)setShoulderButtonR2:(double)a3
{
  self->_shoulderButtonR2 = a3;
}

- (double)shoulderButtonL1
{
  return self->_shoulderButtonL1;
}

- (void)setShoulderButtonL1:(double)a3
{
  self->_shoulderButtonL1 = a3;
}

- (double)shoulderButtonL2
{
  return self->_shoulderButtonL2;
}

- (void)setShoulderButtonL2:(double)a3
{
  self->_shoulderButtonL2 = a3;
}

- (double)leftJoystickX
{
  return self->_leftJoystickX;
}

- (void)setLeftJoystickX:(double)a3
{
  self->_leftJoystickX = a3;
}

- (double)leftJoystickY
{
  return self->_leftJoystickY;
}

- (void)setLeftJoystickY:(double)a3
{
  self->_leftJoystickY = a3;
}

- (double)leftJoystickButton
{
  return self->_leftJoystickButton;
}

- (void)setLeftJoystickButton:(double)a3
{
  self->_leftJoystickButton = a3;
}

- (double)rightJoystickX
{
  return self->_rightJoystickX;
}

- (void)setRightJoystickX:(double)a3
{
  self->_rightJoystickX = a3;
}

- (double)rightJoystickY
{
  return self->_rightJoystickY;
}

- (void)setRightJoystickY:(double)a3
{
  self->_rightJoystickY = a3;
}

- (double)rightJoystickButton
{
  return self->_rightJoystickButton;
}

- (void)setRightJoystickButton:(double)a3
{
  self->_rightJoystickButton = a3;
}

- (double)menuButton
{
  return self->_menuButton;
}

- (void)setMenuButton:(double)a3
{
  self->_menuButton = a3;
}

- (double)viewButton
{
  return self->_viewButton;
}

- (void)setViewButton:(double)a3
{
  self->_viewButton = a3;
}

- (double)homeButton
{
  return self->_homeButton;
}

- (void)setHomeButton:(double)a3
{
  self->_homeButton = a3;
}

@end