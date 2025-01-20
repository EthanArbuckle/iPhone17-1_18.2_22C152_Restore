@interface SKRadialGravityFieldNode
+ (BOOL)supportsSecureCoding;
- (SKRadialGravityFieldNode)init;
- (SKRadialGravityFieldNode)initWithCoder:(id)a3;
- (id)_descriptionClassName;
- (void)_initialize;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SKRadialGravityFieldNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_descriptionClassName
{
  return @"SKRadialGravityFieldNode";
}

- (void)_initialize
{
  if (!self->super._field)
  {
    v3 = [MEMORY[0x263F5E530] field];
    field = self->super._field;
    self->super._field = v3;

    v5 = self->super._field;
    [(SKFieldNode *)self setPhysicsField:v5];
  }
}

- (SKRadialGravityFieldNode)init
{
  v5.receiver = self;
  v5.super_class = (Class)SKRadialGravityFieldNode;
  v2 = [(SKFieldNode *)&v5 init];
  v3 = v2;
  if (v2) {
    [(SKRadialGravityFieldNode *)v2 _initialize];
  }
  return v3;
}

- (SKRadialGravityFieldNode)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = [MEMORY[0x263F5E530] field];
  v8.receiver = self;
  v8.super_class = (Class)SKRadialGravityFieldNode;
  v6 = [(SKFieldNode *)&v8 initWithCoder:v4 field:v5];

  if (v6) {
    [(SKRadialGravityFieldNode *)v6 _initialize];
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SKRadialGravityFieldNode;
  [(SKFieldNode *)&v3 encodeWithCoder:a3];
}

@end