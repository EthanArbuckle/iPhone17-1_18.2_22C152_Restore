@interface AXEventPointerInfoRepresentation
+ (BOOL)supportsSecureCoding;
- (AXEventPointerInfoRepresentation)initWithCoder:(id)a3;
- (AXEventRepresentation)scrollEvent;
- (AXEventRepresentation)trackpadHandEvent;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPointerMove;
- (BOOL)pointerIsAbsolute;
- (NSString)description;
- (NSString)deviceTypeHint;
- (double)pointerAccelX;
- (double)pointerAccelY;
- (double)pointerAccelZ;
- (double)pointerButtonClickCount;
- (double)pointerButtonMask;
- (double)pointerButtonNumber;
- (double)pointerButtonPressure;
- (double)pointerX;
- (double)pointerY;
- (double)pointerZ;
- (id)accessibilityEventRepresentationTabularDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDeviceTypeHint:(id)a3;
- (void)setIsPointerMove:(BOOL)a3;
- (void)setPointerAccelX:(double)a3;
- (void)setPointerAccelY:(double)a3;
- (void)setPointerAccelZ:(double)a3;
- (void)setPointerButtonClickCount:(double)a3;
- (void)setPointerButtonMask:(double)a3;
- (void)setPointerButtonNumber:(double)a3;
- (void)setPointerButtonPressure:(double)a3;
- (void)setPointerIsAbsolute:(BOOL)a3;
- (void)setPointerX:(double)a3;
- (void)setPointerY:(double)a3;
- (void)setPointerZ:(double)a3;
- (void)setScrollEvent:(id)a3;
- (void)setTrackpadHandEvent:(id)a3;
@end

@implementation AXEventPointerInfoRepresentation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXEventPointerInfoRepresentation)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXEventPointerInfoRepresentation;
  v5 = [(AXEventPointerInfoRepresentation *)&v9 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"pointerX"];
    -[AXEventPointerInfoRepresentation setPointerX:](v5, "setPointerX:");
    [v4 decodeDoubleForKey:@"pointerY"];
    -[AXEventPointerInfoRepresentation setPointerY:](v5, "setPointerY:");
    [v4 decodeDoubleForKey:@"pointerZ"];
    -[AXEventPointerInfoRepresentation setPointerZ:](v5, "setPointerZ:");
    [v4 decodeDoubleForKey:@"pointerAccelX"];
    -[AXEventPointerInfoRepresentation setPointerAccelX:](v5, "setPointerAccelX:");
    [v4 decodeDoubleForKey:@"pointerAccelY"];
    -[AXEventPointerInfoRepresentation setPointerAccelY:](v5, "setPointerAccelY:");
    [v4 decodeDoubleForKey:@"pointerAccelZ"];
    -[AXEventPointerInfoRepresentation setPointerAccelZ:](v5, "setPointerAccelZ:");
    -[AXEventPointerInfoRepresentation setIsPointerMove:](v5, "setIsPointerMove:", [v4 decodeBoolForKey:@"isPointerMove"]);
    [v4 decodeDoubleForKey:@"pointerButtonMask"];
    -[AXEventPointerInfoRepresentation setPointerButtonMask:](v5, "setPointerButtonMask:");
    [v4 decodeDoubleForKey:@"pointerButtonNumber"];
    -[AXEventPointerInfoRepresentation setPointerButtonNumber:](v5, "setPointerButtonNumber:");
    [v4 decodeDoubleForKey:@"pointerButtonClickCount"];
    -[AXEventPointerInfoRepresentation setPointerButtonClickCount:](v5, "setPointerButtonClickCount:");
    [v4 decodeDoubleForKey:@"pointerButtonPressure"];
    -[AXEventPointerInfoRepresentation setPointerButtonPressure:](v5, "setPointerButtonPressure:");
    -[AXEventPointerInfoRepresentation setPointerIsAbsolute:](v5, "setPointerIsAbsolute:", [v4 decodeBoolForKey:@"pointerIsAbsolute"]);
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceTypeHint"];
    [(AXEventPointerInfoRepresentation *)v5 setDeviceTypeHint:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"scrollEvent"];
    [(AXEventPointerInfoRepresentation *)v5 setScrollEvent:v7];
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_alloc_init(AXEventPointerInfoRepresentation);
  [(AXEventPointerInfoRepresentation *)self pointerX];
  -[AXEventPointerInfoRepresentation setPointerX:](v5, "setPointerX:");
  [(AXEventPointerInfoRepresentation *)self pointerY];
  -[AXEventPointerInfoRepresentation setPointerY:](v5, "setPointerY:");
  [(AXEventPointerInfoRepresentation *)self pointerZ];
  -[AXEventPointerInfoRepresentation setPointerZ:](v5, "setPointerZ:");
  [(AXEventPointerInfoRepresentation *)self pointerAccelX];
  -[AXEventPointerInfoRepresentation setPointerAccelX:](v5, "setPointerAccelX:");
  [(AXEventPointerInfoRepresentation *)self pointerAccelY];
  -[AXEventPointerInfoRepresentation setPointerAccelY:](v5, "setPointerAccelY:");
  [(AXEventPointerInfoRepresentation *)self pointerAccelZ];
  -[AXEventPointerInfoRepresentation setPointerAccelZ:](v5, "setPointerAccelZ:");
  [(AXEventPointerInfoRepresentation *)v5 setIsPointerMove:[(AXEventPointerInfoRepresentation *)self isPointerMove]];
  [(AXEventPointerInfoRepresentation *)self pointerButtonMask];
  -[AXEventPointerInfoRepresentation setPointerButtonMask:](v5, "setPointerButtonMask:");
  [(AXEventPointerInfoRepresentation *)self pointerButtonNumber];
  -[AXEventPointerInfoRepresentation setPointerButtonNumber:](v5, "setPointerButtonNumber:");
  [(AXEventPointerInfoRepresentation *)self pointerButtonClickCount];
  -[AXEventPointerInfoRepresentation setPointerButtonClickCount:](v5, "setPointerButtonClickCount:");
  [(AXEventPointerInfoRepresentation *)self pointerButtonPressure];
  -[AXEventPointerInfoRepresentation setPointerButtonPressure:](v5, "setPointerButtonPressure:");
  [(AXEventPointerInfoRepresentation *)v5 setPointerIsAbsolute:[(AXEventPointerInfoRepresentation *)self pointerIsAbsolute]];
  v6 = [(AXEventPointerInfoRepresentation *)self deviceTypeHint];
  v7 = (void *)[v6 copy];
  [(AXEventPointerInfoRepresentation *)v5 setDeviceTypeHint:v7];

  v8 = [(AXEventPointerInfoRepresentation *)self scrollEvent];
  objc_super v9 = (void *)[v8 copyWithZone:a3];
  [(AXEventPointerInfoRepresentation *)v5 setScrollEvent:v9];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(AXEventPointerInfoRepresentation *)self pointerX];
  objc_msgSend(v4, "encodeDouble:forKey:", @"pointerX");
  [(AXEventPointerInfoRepresentation *)self pointerY];
  objc_msgSend(v4, "encodeDouble:forKey:", @"pointerY");
  [(AXEventPointerInfoRepresentation *)self pointerZ];
  objc_msgSend(v4, "encodeDouble:forKey:", @"pointerZ");
  [(AXEventPointerInfoRepresentation *)self pointerAccelX];
  objc_msgSend(v4, "encodeDouble:forKey:", @"pointerAccelX");
  [(AXEventPointerInfoRepresentation *)self pointerAccelY];
  objc_msgSend(v4, "encodeDouble:forKey:", @"pointerAccelY");
  [(AXEventPointerInfoRepresentation *)self pointerAccelZ];
  objc_msgSend(v4, "encodeDouble:forKey:", @"pointerAccelZ");
  objc_msgSend(v4, "encodeBool:forKey:", -[AXEventPointerInfoRepresentation isPointerMove](self, "isPointerMove"), @"isPointerMove");
  [(AXEventPointerInfoRepresentation *)self pointerButtonMask];
  objc_msgSend(v4, "encodeDouble:forKey:", @"pointerButtonMask");
  [(AXEventPointerInfoRepresentation *)self pointerButtonNumber];
  objc_msgSend(v4, "encodeDouble:forKey:", @"pointerButtonNumber");
  [(AXEventPointerInfoRepresentation *)self pointerButtonClickCount];
  objc_msgSend(v4, "encodeDouble:forKey:", @"pointerButtonClickCount");
  [(AXEventPointerInfoRepresentation *)self pointerButtonPressure];
  objc_msgSend(v4, "encodeDouble:forKey:", @"pointerButtonPressure");
  objc_msgSend(v4, "encodeBool:forKey:", -[AXEventPointerInfoRepresentation pointerIsAbsolute](self, "pointerIsAbsolute"), @"pointerIsAbsolute");
  v5 = [(AXEventPointerInfoRepresentation *)self deviceTypeHint];
  [v4 encodeObject:v5 forKey:@"deviceTypeHint"];

  id v6 = [(AXEventPointerInfoRepresentation *)self scrollEvent];
  [v4 encodeObject:v6 forKey:@"scrollEvent"];
}

- (id)accessibilityEventRepresentationTabularDescription
{
  v3 = NSString;
  [(AXEventPointerInfoRepresentation *)self pointerX];
  uint64_t v27 = v4;
  [(AXEventPointerInfoRepresentation *)self pointerY];
  uint64_t v26 = v5;
  [(AXEventPointerInfoRepresentation *)self pointerZ];
  uint64_t v7 = v6;
  [(AXEventPointerInfoRepresentation *)self pointerAccelX];
  uint64_t v9 = v8;
  [(AXEventPointerInfoRepresentation *)self pointerAccelY];
  uint64_t v11 = v10;
  [(AXEventPointerInfoRepresentation *)self pointerAccelZ];
  uint64_t v13 = v12;
  [(AXEventPointerInfoRepresentation *)self isPointerMove];
  v14 = NSStringFromBOOL();
  [(AXEventPointerInfoRepresentation *)self pointerButtonMask];
  uint64_t v16 = v15;
  [(AXEventPointerInfoRepresentation *)self pointerButtonNumber];
  uint64_t v18 = v17;
  [(AXEventPointerInfoRepresentation *)self pointerButtonClickCount];
  uint64_t v20 = v19;
  [(AXEventPointerInfoRepresentation *)self pointerButtonPressure];
  uint64_t v22 = v21;
  [(AXEventPointerInfoRepresentation *)self pointerIsAbsolute];
  v23 = NSStringFromBOOL();
  v24 = [v3 stringWithFormat:@" Pointer Info:\n   X: %.2f\n   Y: %.2f\n   Z: %.2f\n   accelX: %.2f\n   accelY: %.2f\n   accelZ: %.2f\n   isMove: %@\n   Button Mask: %.2f\n   Button Number: %.2f\n   Click Count: %.2f\n   Pressure: %.2f\n   isAbsolute: %@\n", v27, v26, v7, v9, v11, v13, v14, v16, v18, v20, v22, v23];

  return v24;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    [(AXEventPointerInfoRepresentation *)self pointerX];
    double v7 = v6;
    [v5 pointerX];
    if (v7 != v8) {
      goto LABEL_14;
    }
    [(AXEventPointerInfoRepresentation *)self pointerY];
    double v10 = v9;
    [v5 pointerY];
    if (v10 != v11) {
      goto LABEL_14;
    }
    [(AXEventPointerInfoRepresentation *)self pointerZ];
    double v13 = v12;
    [v5 pointerZ];
    if (v13 != v14) {
      goto LABEL_14;
    }
    [(AXEventPointerInfoRepresentation *)self pointerAccelX];
    double v16 = v15;
    [v5 pointerAccelX];
    if (v16 != v17) {
      goto LABEL_14;
    }
    [(AXEventPointerInfoRepresentation *)self pointerAccelY];
    double v19 = v18;
    [v5 pointerAccelY];
    if (v19 != v20) {
      goto LABEL_14;
    }
    [(AXEventPointerInfoRepresentation *)self pointerAccelZ];
    double v22 = v21;
    [v5 pointerAccelZ];
    if (v22 != v23) {
      goto LABEL_14;
    }
    int v24 = [(AXEventPointerInfoRepresentation *)self isPointerMove];
    if (v24 != [v5 isPointerMove]) {
      goto LABEL_14;
    }
    [(AXEventPointerInfoRepresentation *)self pointerButtonMask];
    double v26 = v25;
    [v5 pointerButtonMask];
    if (v26 != v27) {
      goto LABEL_14;
    }
    [(AXEventPointerInfoRepresentation *)self pointerButtonNumber];
    double v29 = v28;
    [v5 pointerButtonNumber];
    if (v29 != v30) {
      goto LABEL_14;
    }
    [(AXEventPointerInfoRepresentation *)self pointerButtonClickCount];
    double v32 = v31;
    [v5 pointerButtonClickCount];
    if (v32 == v33
      && ([(AXEventPointerInfoRepresentation *)self pointerButtonPressure],
          double v35 = v34,
          [v5 pointerButtonPressure],
          v35 == v36)
      && (int v37 = [(AXEventPointerInfoRepresentation *)self pointerIsAbsolute],
          v37 == [v5 pointerIsAbsolute]))
    {
      v40 = [(AXEventPointerInfoRepresentation *)self scrollEvent];
      v41 = [v5 scrollEvent];
      BOOL v38 = v40 == v41;
    }
    else
    {
LABEL_14:
      BOOL v38 = 0;
    }
  }
  else
  {
    BOOL v38 = 0;
  }

  return v38;
}

- (NSString)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AXEventPointerInfoRepresentation;
  id v4 = [(AXEventPointerInfoRepresentation *)&v8 description];
  id v5 = [(AXEventPointerInfoRepresentation *)self accessibilityEventRepresentationTabularDescription];
  double v6 = [v3 stringWithFormat:@"%@ - %@", v4, v5];

  return (NSString *)v6;
}

- (double)pointerX
{
  return self->_pointerX;
}

- (void)setPointerX:(double)a3
{
  self->_pointerX = a3;
}

- (double)pointerY
{
  return self->_pointerY;
}

- (void)setPointerY:(double)a3
{
  self->_pointerY = a3;
}

- (double)pointerZ
{
  return self->_pointerZ;
}

- (void)setPointerZ:(double)a3
{
  self->_pointerZ = a3;
}

- (double)pointerAccelX
{
  return self->_pointerAccelX;
}

- (void)setPointerAccelX:(double)a3
{
  self->_pointerAccelX = a3;
}

- (double)pointerAccelY
{
  return self->_pointerAccelY;
}

- (void)setPointerAccelY:(double)a3
{
  self->_pointerAccelY = a3;
}

- (double)pointerAccelZ
{
  return self->_pointerAccelZ;
}

- (void)setPointerAccelZ:(double)a3
{
  self->_pointerAccelZ = a3;
}

- (BOOL)isPointerMove
{
  return self->_isPointerMove;
}

- (void)setIsPointerMove:(BOOL)a3
{
  self->_isPointerMove = a3;
}

- (double)pointerButtonMask
{
  return self->_pointerButtonMask;
}

- (void)setPointerButtonMask:(double)a3
{
  self->_pointerButtonMask = a3;
}

- (double)pointerButtonNumber
{
  return self->_pointerButtonNumber;
}

- (void)setPointerButtonNumber:(double)a3
{
  self->_pointerButtonNumber = a3;
}

- (double)pointerButtonClickCount
{
  return self->_pointerButtonClickCount;
}

- (void)setPointerButtonClickCount:(double)a3
{
  self->_pointerButtonClickCount = a3;
}

- (double)pointerButtonPressure
{
  return self->_pointerButtonPressure;
}

- (void)setPointerButtonPressure:(double)a3
{
  self->_pointerButtonPressure = a3;
}

- (BOOL)pointerIsAbsolute
{
  return self->_pointerIsAbsolute;
}

- (void)setPointerIsAbsolute:(BOOL)a3
{
  self->_pointerIsAbsolute = a3;
}

- (NSString)deviceTypeHint
{
  return self->_deviceTypeHint;
}

- (void)setDeviceTypeHint:(id)a3
{
}

- (AXEventRepresentation)scrollEvent
{
  return self->_scrollEvent;
}

- (void)setScrollEvent:(id)a3
{
}

- (AXEventRepresentation)trackpadHandEvent
{
  return self->_trackpadHandEvent;
}

- (void)setTrackpadHandEvent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackpadHandEvent, 0);
  objc_storeStrong((id *)&self->_scrollEvent, 0);

  objc_storeStrong((id *)&self->_deviceTypeHint, 0);
}

@end