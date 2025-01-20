@interface SKCustomFieldNode
+ (BOOL)supportsSecureCoding;
- (SKCustomFieldNode)init;
- (SKCustomFieldNode)initWithCoder:(id)a3;
- (id)_descriptionClassName;
- (id)batchBlock;
- (id)block;
- (void)_initialize;
- (void)encodeWithCoder:(id)a3;
- (void)setBatchBlock:(id)a3;
- (void)setBlock:(id)a3;
@end

@implementation SKCustomFieldNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_descriptionClassName
{
  return @"SKCustomFieldNode";
}

- (void)_initialize
{
  if (!self->super._field)
  {
    v3 = [MEMORY[0x263F5E500] fieldWithCustomBlock:0];
    field = self->super._field;
    self->super._field = v3;

    v5 = self->super._field;
    [(SKFieldNode *)self setPhysicsField:v5];
  }
}

- (SKCustomFieldNode)init
{
  v5.receiver = self;
  v5.super_class = (Class)SKCustomFieldNode;
  v2 = [(SKFieldNode *)&v5 init];
  v3 = v2;
  if (v2) {
    [(SKCustomFieldNode *)v2 _initialize];
  }
  return v3;
}

- (SKCustomFieldNode)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = [MEMORY[0x263F5E500] fieldWithCustomBlock:0];
  v8.receiver = self;
  v8.super_class = (Class)SKCustomFieldNode;
  v6 = [(SKFieldNode *)&v8 initWithCoder:v4 field:v5];

  if (v6) {
    [(SKCustomFieldNode *)v6 _initialize];
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SKCustomFieldNode;
  [(SKFieldNode *)&v3 encodeWithCoder:a3];
}

- (void)setBatchBlock:(id)a3
{
  id v6 = (id)MEMORY[0x21052F3F0](a3, a2);
  objc_msgSend(MEMORY[0x263F5E500], "fieldWithCustomBatchBlock:");
  id v4 = (PKPhysicsField *)objc_claimAutoreleasedReturnValue();
  field = self->super._field;
  self->super._field = v4;

  [(SKFieldNode *)self setPhysicsField:self->super._field];
}

- (id)batchBlock
{
  return 0;
}

- (void)setBlock:(id)a3
{
  id v6 = (id)MEMORY[0x21052F3F0](a3, a2);
  objc_msgSend(MEMORY[0x263F5E500], "fieldWithCustomBlock:");
  id v4 = (PKPhysicsField *)objc_claimAutoreleasedReturnValue();
  field = self->super._field;
  self->super._field = v4;

  [(SKFieldNode *)self setPhysicsField:self->super._field];
}

- (id)block
{
  return 0;
}

@end