@interface AXPIFingerModel
+ (id)fingerModelForLocation:(CGPoint)a3;
- (AXPIFingerModelDelegate)delegate;
- (BOOL)isPressed;
- (BOOL)isSelected;
- (CGPoint)location;
- (NSValue)location3D;
- (double)force;
- (id)description;
- (unint64_t)shape;
- (void)setDelegate:(id)a3;
- (void)setForce:(double)a3;
- (void)setLocation3D:(id)a3;
- (void)setLocation:(CGPoint)a3;
- (void)setPressed:(BOOL)a3;
- (void)setPressed:(BOOL)a3 sendDelegateCallback:(BOOL)a4;
- (void)setSelected:(BOOL)a3;
- (void)setShape:(unint64_t)a3;
- (void)updateWithPropertiesFromFingerModel:(id)a3;
@end

@implementation AXPIFingerModel

+ (id)fingerModelForLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "setLocation:", x, y);
  [v5 setShape:0];
  return v5;
}

- (void)setPressed:(BOOL)a3 sendDelegateCallback:(BOOL)a4
{
  if (self->_pressed != a3)
  {
    self->_pressed = a3;
    if (a4)
    {
      id v5 = [(AXPIFingerModel *)self delegate];
      [v5 didUpdatePressStateForFingerModel:self];
    }
  }
}

- (void)setPressed:(BOOL)a3
{
}

- (void)setSelected:(BOOL)a3
{
  if (self->_selected != a3)
  {
    self->_selected = a3;
    id v4 = [(AXPIFingerModel *)self delegate];
    [v4 didUpdateSelectedStateForFingerModel:self];
  }
}

- (void)setLocation:(CGPoint)a3
{
  if (self->_location.x != a3.x || self->_location.y != a3.y)
  {
    self->_location = a3;
    id v5 = [(AXPIFingerModel *)self delegate];
    [v5 didUpdateLocationForFingerModel:self];
  }
}

- (void)setLocation3D:(id)a3
{
}

- (void)setForce:(double)a3
{
  if (self->_force != a3)
  {
    self->_force = a3;
    id v4 = [(AXPIFingerModel *)self delegate];
    [v4 didUpdateForceForFingerModel:self];
  }
}

- (void)setShape:(unint64_t)a3
{
  if (self->_shape != a3)
  {
    self->_shape = a3;
    id v4 = [(AXPIFingerModel *)self delegate];
    [v4 didUpdateShapeForFingerModel:self];
  }
}

- (void)updateWithPropertiesFromFingerModel:(id)a3
{
  id v4 = a3;
  [v4 location];
  -[AXPIFingerModel setLocation:](self, "setLocation:");
  [v4 force];
  -[AXPIFingerModel setForce:](self, "setForce:");
  -[AXPIFingerModel setPressed:](self, "setPressed:", [v4 isPressed]);
  -[AXPIFingerModel setSelected:](self, "setSelected:", [v4 isSelected]);
  uint64_t v5 = [v4 shape];

  [(AXPIFingerModel *)self setShape:v5];
}

- (id)description
{
  v13.receiver = self;
  v13.super_class = (Class)AXPIFingerModel;
  v3 = [(AXPIFingerModel *)&v13 description];
  [(AXPIFingerModel *)self location];
  uint64_t v5 = v4;
  [(AXPIFingerModel *)self location];
  uint64_t v7 = v6;
  BOOL v8 = [(AXPIFingerModel *)self isPressed];
  BOOL v9 = [(AXPIFingerModel *)self isSelected];
  [(AXPIFingerModel *)self force];
  v11 = [v3 stringByAppendingFormat:@" - location: {%f, %f}, pressed: %i, selected: %i, force: %f, shape: %i", v5, v7, v8, v9, v10, -[AXPIFingerModel shape](self, "shape")];

  return v11;
}

- (CGPoint)location
{
  double x = self->_location.x;
  double y = self->_location.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (NSValue)location3D
{
  return self->_location3D;
}

- (double)force
{
  return self->_force;
}

- (unint64_t)shape
{
  return self->_shape;
}

- (BOOL)isPressed
{
  return self->_pressed;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (AXPIFingerModelDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_location3D, 0);
}

@end