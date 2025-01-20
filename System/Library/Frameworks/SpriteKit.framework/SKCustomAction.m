@interface SKCustomAction
+ (BOOL)supportsSecureCoding;
+ (id)customActionWithDuration:(double)a3 actionBlock:(id)a4;
- (SKCustomAction)init;
- (SKCustomAction)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)reversedAction;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SKCustomAction

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKCustomAction)init
{
  v3.receiver = self;
  v3.super_class = (Class)SKCustomAction;
  if ([(SKAction *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SKCustomAction;
  [(SKAction *)&v5 encodeWithCoder:v4];
  NSLog(&cfstr_SkactionCustom.isa);
}

- (SKCustomAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SKCustomAction;
  if ([(SKAction *)&v6 initWithCoder:v4]) {
    operator new();
  }
  NSLog(&cfstr_SkactionCustom_0.isa);

  return 0;
}

+ (id)customActionWithDuration:(double)a3 actionBlock:(id)a4
{
  id v5 = a4;
  objc_super v6 = objc_alloc_init(SKCustomAction);
  uint64_t v7 = MEMORY[0x21052F3F0](v5);
  mycaction = v6->_mycaction;
  id var19 = mycaction->var19;
  mycaction->id var19 = (id)v7;

  [(SKAction *)v6 setDuration:a3];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SKCustomAction;
  id v4 = [(SKAction *)&v9 copyWithZone:a3];
  uint64_t v5 = MEMORY[0x21052F3F0](self->_mycaction->var19);
  uint64_t v6 = v4[2];
  uint64_t v7 = *(void **)(v6 + 112);
  *(void *)(v6 + 112) = v5;

  [(SKAction *)self duration];
  objc_msgSend(v4, "setDuration:");
  return v4;
}

- (id)reversedAction
{
  id v2 = [(SKAction *)self copy];

  return v2;
}

@end