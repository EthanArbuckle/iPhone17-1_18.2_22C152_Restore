@interface AXEventIOSMACPointerInfoRepresentation
+ (BOOL)supportsSecureCoding;
- (AXEventIOSMACPointerInfoRepresentation)initWithCoder:(id)a3;
- (BOOL)pressed;
- (CGPoint)location;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)buttonIndex;
- (void)encodeWithCoder:(id)a3;
- (void)setButtonIndex:(int64_t)a3;
- (void)setLocation:(CGPoint)a3;
- (void)setPressed:(BOOL)a3;
@end

@implementation AXEventIOSMACPointerInfoRepresentation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[AXEventIOSMACPointerInfoRepresentation pressed](self, "pressed"), @"pressed");
  objc_msgSend(v4, "encodeInteger:forKey:", -[AXEventIOSMACPointerInfoRepresentation buttonIndex](self, "buttonIndex"), @"buttonIndex");
  v5 = (void *)MEMORY[0x1E4F29238];
  [(AXEventIOSMACPointerInfoRepresentation *)self location];
  objc_msgSend(v5, "valueWithPoint:");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"location"];
}

- (AXEventIOSMACPointerInfoRepresentation)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AXEventIOSMACPointerInfoRepresentation;
  id v3 = a3;
  id v4 = [(AXEventIOSMACPointerInfoRepresentation *)&v7 init];
  -[AXEventIOSMACPointerInfoRepresentation setPressed:](v4, "setPressed:", objc_msgSend(v3, "decodeBoolForKey:", @"pressed", v7.receiver, v7.super_class));
  -[AXEventIOSMACPointerInfoRepresentation setButtonIndex:](v4, "setButtonIndex:", [v3 decodeIntegerForKey:@"buttonIndex"]);
  v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"location"];

  [v5 pointValue];
  -[AXEventIOSMACPointerInfoRepresentation setLocation:](v4, "setLocation:");

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[AXEventIOSMACPointerInfoRepresentation alloc] init];
  [(AXEventIOSMACPointerInfoRepresentation *)v4 setPressed:[(AXEventIOSMACPointerInfoRepresentation *)self pressed]];
  [(AXEventIOSMACPointerInfoRepresentation *)v4 setButtonIndex:[(AXEventIOSMACPointerInfoRepresentation *)self buttonIndex]];
  [(AXEventIOSMACPointerInfoRepresentation *)self location];
  -[AXEventIOSMACPointerInfoRepresentation setLocation:](v4, "setLocation:");
  return v4;
}

- (BOOL)pressed
{
  return self->_pressed;
}

- (void)setPressed:(BOOL)a3
{
  self->_pressed = a3;
}

- (int64_t)buttonIndex
{
  return self->_buttonIndex;
}

- (void)setButtonIndex:(int64_t)a3
{
  self->_buttonIndex = a3;
}

- (CGPoint)location
{
  double x = self->_location.x;
  double y = self->_location.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLocation:(CGPoint)a3
{
  self->_location = a3;
}

@end