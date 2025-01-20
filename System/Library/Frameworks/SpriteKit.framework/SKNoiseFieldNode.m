@interface SKNoiseFieldNode
+ (BOOL)supportsSecureCoding;
- (SKNoiseFieldNode)init;
- (SKNoiseFieldNode)initWithCoder:(id)a3;
- (float)animationSpeed;
- (float)smoothness;
- (id)_descriptionClassName;
- (void)_initialize;
- (void)encodeWithCoder:(id)a3;
- (void)setAnimationSpeed:(float)a3;
- (void)setSmoothness:(float)a3;
@end

@implementation SKNoiseFieldNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_descriptionClassName
{
  return @"SKNoiseFieldNode";
}

- (void)_initialize
{
  if (!self->super._field)
  {
    v3 = [MEMORY[0x263F5E528] field];
    field = self->super._field;
    self->super._field = v3;

    v5 = self->super._field;
    [(SKFieldNode *)self setPhysicsField:v5];
  }
}

- (SKNoiseFieldNode)init
{
  v5.receiver = self;
  v5.super_class = (Class)SKNoiseFieldNode;
  v2 = [(SKFieldNode *)&v5 init];
  v3 = v2;
  if (v2) {
    [(SKNoiseFieldNode *)v2 _initialize];
  }
  return v3;
}

- (float)smoothness
{
  [(PKPhysicsField *)self->super._field smoothness];
  return result;
}

- (void)setSmoothness:(float)a3
{
}

- (float)animationSpeed
{
  [(PKPhysicsField *)self->super._field animationSpeed];
  return result;
}

- (void)setAnimationSpeed:(float)a3
{
}

- (SKNoiseFieldNode)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = [MEMORY[0x263F5E528] field];
  v8.receiver = self;
  v8.super_class = (Class)SKNoiseFieldNode;
  v6 = [(SKFieldNode *)&v8 initWithCoder:v4 field:v5];

  if (v6) {
    [(SKNoiseFieldNode *)v6 _initialize];
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SKNoiseFieldNode;
  [(SKFieldNode *)&v3 encodeWithCoder:a3];
}

@end