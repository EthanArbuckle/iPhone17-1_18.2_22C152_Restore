@interface SKReferencedAction
+ (BOOL)supportsSecureCoding;
+ (id)referenceActionWithName:(id)a3 duration:(double)a4;
- (SKReferencedAction)init;
- (SKReferencedAction)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)reversedAction;
- (id)subactions;
- (void)_ensureReferencedAction;
- (void)encodeWithCoder:(id)a3;
- (void)setDuration:(double)a3;
- (void)setTimingFunction:(id)a3;
- (void)setTimingMode:(int64_t)a3;
@end

@implementation SKReferencedAction

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKReferencedAction)init
{
  v3.receiver = self;
  v3.super_class = (Class)SKReferencedAction;
  if ([(SKAction *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (SKReferencedAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SKReferencedAction;
  if ([(SKAction *)&v7 initWithCoder:v4]) {
    operator new();
  }
  v5 = (SKReferencedAction *)0;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SKReferencedAction;
  [(SKAction *)&v5 encodeWithCoder:v4];
  [v4 encodeObject:self->_referencedActionName forKey:@"_referencedActionName"];
}

+ (id)referenceActionWithName:(id)a3 duration:(double)a4
{
  id v5 = a3;
  if (v5)
  {
    v6 = objc_alloc_init(SKReferencedAction);
    uint64_t v7 = [v5 copy];
    referencedActionName = v6->_referencedActionName;
    v6->_referencedActionName = (NSString *)v7;

    float v9 = a4;
    v6->_mycaction->var8 = v9;
  }
  else
  {
    [MEMORY[0x263EFF940] raise:@"Nil Action" format:@"Action name to be referenced must be non-nil"];
    v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SKReferencedAction;
  id v5 = -[SKAction copyWithZone:](&v12, sel_copyWithZone_);
  uint64_t v6 = [(NSString *)self->_referencedActionName copyWithZone:a3];
  uint64_t v7 = (void *)*((void *)v5 + 4);
  *((void *)v5 + 4) = v6;

  referencedAction = self->_referencedAction;
  if (referencedAction)
  {
    uint64_t v9 = [(SKAction *)referencedAction copyWithZone:a3];
    v10 = (void *)*((void *)v5 + 3);
    *((void *)v5 + 3) = v9;

    SKCReferencedAction::setReferencedCAction(*((SKCReferencedAction **)v5 + 2), (SKCAction *)[*((id *)v5 + 3) caction]);
  }
  return v5;
}

- (id)subactions
{
  v5[1] = *MEMORY[0x263EF8340];
  [(SKReferencedAction *)self _ensureReferencedAction];
  v5[0] = self->_referencedAction;
  objc_super v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v3;
}

- (void)setTimingFunction:(id)a3
{
  id v7 = a3;
  [(SKReferencedAction *)self _ensureReferencedAction];
  uint64_t v4 = MEMORY[0x21052F3F0](v7);
  mycaction = self->_mycaction;
  id var3 = mycaction->var3;
  mycaction->id var3 = (id)v4;

  [(SKAction *)self->_referencedAction setTimingFunction:v7];
}

- (void)setDuration:(double)a3
{
  float v5 = a3;
  self->_mycaction->var8 = v5;
  [(SKReferencedAction *)self _ensureReferencedAction];
  referencedAction = self->_referencedAction;

  [(SKAction *)referencedAction setDuration:a3];
}

- (void)setTimingMode:(int64_t)a3
{
  [(SKReferencedAction *)self _ensureReferencedAction];
  self->_mycaction->var14 = a3;
  referencedAction = self->_referencedAction;

  [(SKAction *)referencedAction setTimingMode:a3];
}

- (id)reversedAction
{
  [(SKReferencedAction *)self _ensureReferencedAction];
  referencedAction = self->_referencedAction;

  return [(SKAction *)referencedAction reversedAction];
}

- (void)_ensureReferencedAction
{
  if (!self->_referencedAction)
  {
    objc_super v3 = +[SKAction actionNamed:self->_referencedActionName duration:self->_mycaction->var8];
    referencedAction = self->_referencedAction;
    self->_referencedAction = v3;

    float v5 = self->_referencedAction;
    if (!v5)
    {
      uint64_t v6 = [(id)objc_opt_class() description];
      NSLog(&cfstr_ErrorLoadingAc.isa, v6, self->_referencedActionName);

      id v7 = +[SKAction waitForDuration:self->_mycaction->var8];
      v8 = self->_referencedAction;
      self->_referencedAction = v7;

      float v5 = self->_referencedAction;
    }
    uint64_t v9 = [(SKAction *)v5 caction];
    mycaction = self->_mycaction;
    SKCReferencedAction::setReferencedCAction(mycaction, v9);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referencedActionName, 0);

  objc_storeStrong((id *)&self->_referencedAction, 0);
}

@end