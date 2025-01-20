@interface SKLinearGravityFieldNode
+ (BOOL)supportsSecureCoding;
- (SKLinearGravityFieldNode)init;
- (SKLinearGravityFieldNode)initWithCoder:(id)a3;
- (id)_descriptionClassName;
- (void)_initialize;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SKLinearGravityFieldNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_descriptionClassName
{
  return @"SKLinearGravityFieldNode";
}

- (void)_initialize
{
  if (!self->super._field)
  {
    v3 = [MEMORY[0x263F5E518] field];
    field = self->super._field;
    self->super._field = v3;

    v5 = self->super._field;
    [(SKFieldNode *)self setPhysicsField:v5];
  }
}

- (SKLinearGravityFieldNode)init
{
  v5.receiver = self;
  v5.super_class = (Class)SKLinearGravityFieldNode;
  v2 = [(SKFieldNode *)&v5 init];
  v3 = v2;
  if (v2) {
    [(SKLinearGravityFieldNode *)v2 _initialize];
  }
  return v3;
}

- (SKLinearGravityFieldNode)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = [MEMORY[0x263F5E518] field];
  v8.receiver = self;
  v8.super_class = (Class)SKLinearGravityFieldNode;
  v6 = [(SKFieldNode *)&v8 initWithCoder:v4 field:v5];

  if (v6) {
    [(SKLinearGravityFieldNode *)v6 _initialize];
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SKLinearGravityFieldNode;
  [(SKFieldNode *)&v3 encodeWithCoder:a3];
}

@end