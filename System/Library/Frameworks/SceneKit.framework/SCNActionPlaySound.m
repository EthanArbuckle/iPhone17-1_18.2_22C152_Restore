@interface SCNActionPlaySound
+ (BOOL)supportsSecureCoding;
+ (id)playAudioSource:(id)a3 waitForCompletion:(BOOL)a4;
- (SCNActionPlaySound)init;
- (SCNActionPlaySound)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)parameters;
- (id)reversedAction;
- (void)_setupDuration;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SCNActionPlaySound

- (SCNActionPlaySound)init
{
  v3.receiver = self;
  v3.super_class = (Class)SCNActionPlaySound;
  if ([(SCNAction *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (void)_setupDuration
{
  mycaction = self->_mycaction;
  if (mycaction->var20) {
    [mycaction->var21 duration];
  }
  else {
    double v4 = 0.0;
  }

  [(SCNAction *)self setDuration:v4];
}

- (SCNActionPlaySound)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SCNActionPlaySound;
  if (-[SCNAction initWithCoder:](&v4, sel_initWithCoder_)) {
    operator new();
  }
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SCNActionPlaySound;
  -[SCNAction encodeWithCoder:](&v5, sel_encodeWithCoder_);
  [a3 encodeObject:self->_mycaction->var21 forKey:@"_audioSource"];
  [a3 encodeBool:self->_mycaction->var20 forKey:@"_wait"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)playAudioSource:(id)a3 waitForCompletion:(BOOL)a4
{
  v6 = objc_alloc_init(SCNActionPlaySound);
  uint64_t v7 = [a3 copy];
  mycaction = v6->_mycaction;
  mycaction->var21 = (id)v7;
  mycaction->var20 = a4;
  [(SCNActionPlaySound *)v6 _setupDuration];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SCNActionPlaySound;
  objc_super v4 = [(SCNAction *)&v8 copyWithZone:a3];
  id v5 = self->_mycaction->var21;
  uint64_t v6 = v4[2];
  *(void *)(v6 + 152) = v5;
  *(unsigned char *)(v6 + 145) = self->_mycaction->var20;
  [v4 _setupDuration];
  return v4;
}

- (id)reversedAction
{
  id v2 = [(SCNAction *)self copy];

  return v2;
}

- (id)parameters
{
  v10[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = [self->_mycaction->var21 fileName];
  uint64_t v4 = [NSNumber numberWithBool:self->_mycaction->var20];
  if (v3)
  {
    v10[0] = v4;
    v10[1] = [self->_mycaction->var21 fileName];
    id v5 = (void *)MEMORY[0x263EFF8C0];
    uint64_t v6 = v10;
    uint64_t v7 = 2;
  }
  else
  {
    uint64_t v9 = v4;
    id v5 = (void *)MEMORY[0x263EFF8C0];
    uint64_t v6 = &v9;
    uint64_t v7 = 1;
  }
  return (id)objc_msgSend(v5, "arrayWithObjects:count:", v6, v7, v9);
}

@end