@interface SCNActionHide
+ (BOOL)supportsSecureCoding;
+ (id)hide;
+ (id)unhide;
- (SCNActionHide)init;
- (SCNActionHide)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)parameters;
- (id)reversedAction;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SCNActionHide

- (SCNActionHide)init
{
  v3.receiver = self;
  v3.super_class = (Class)SCNActionHide;
  if ([(SCNAction *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (SCNActionHide)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SCNActionHide;
  if (-[SCNAction initWithCoder:](&v4, sel_initWithCoder_)) {
    operator new();
  }
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SCNActionHide;
  -[SCNAction encodeWithCoder:](&v5, sel_encodeWithCoder_);
  [a3 encodeBool:self->_mycaction->var19 forKey:@"_hide"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)hide
{
  v2 = objc_alloc_init(SCNActionHide);
  v2->_mycaction->var19 = 1;
  [(SCNAction *)v2 setDuration:0.0];

  return v2;
}

+ (id)unhide
{
  v2 = objc_alloc_init(SCNActionHide);
  v2->_mycaction->var19 = 0;
  [(SCNAction *)v2 setDuration:0.0];

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SCNActionHide;
  objc_super v4 = [(SCNAction *)&v6 copyWithZone:a3];
  [(SCNAction *)self duration];
  objc_msgSend(v4, "setDuration:");
  *(unsigned char *)(v4[2] + 144) = self->_mycaction->var19;
  return v4;
}

- (id)reversedAction
{
  id result = objc_alloc_init(SCNActionHide);
  mycaction = self->_mycaction;
  uint64_t v5 = *((void *)result + 2);
  *(unsigned char *)(v5 + 144) = !mycaction->var19;
  *(double *)(v5 + 64) = mycaction->var8;
  return result;
}

- (id)parameters
{
  v3[1] = *MEMORY[0x263EF8340];
  v3[0] = [NSNumber numberWithInt:self->_mycaction->var19];
  return (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v3 count:1];
}

@end