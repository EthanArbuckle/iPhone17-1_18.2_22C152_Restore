@interface SCNActionFade
+ (BOOL)supportsSecureCoding;
+ (id)fadeInWithDuration:(double)a3;
+ (id)fadeOpacityBy:(double)a3 duration:(double)a4;
+ (id)fadeOpacityTo:(double)a3 duration:(double)a4;
+ (id)fadeOutWithDuration:(double)a3;
- (SCNActionFade)init;
- (SCNActionFade)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)parameters;
- (id)reversedAction;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SCNActionFade

- (SCNActionFade)init
{
  v3.receiver = self;
  v3.super_class = (Class)SCNActionFade;
  if ([(SCNAction *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (SCNActionFade)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SCNActionFade;
  if (-[SCNAction initWithCoder:](&v4, sel_initWithCoder_)) {
    operator new();
  }
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SCNActionFade;
  -[SCNAction encodeWithCoder:](&v6, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", self->_mycaction->var19), @"_opacityTarget");
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", self->_mycaction->var20), @"_opacityTargetReversed");
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", self->_mycaction->var21), @"_lastOpacity");
  double v5 = 0.0;
  if (self->_mycaction->var22) {
    double v5 = 1.0;
  }
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", v5), @"_isRelative");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)parameters
{
  v4[1] = *MEMORY[0x263EF8340];
  *(float *)&double v2 = self->_mycaction->var19;
  v4[0] = [NSNumber numberWithFloat:v2];
  return (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
}

+ (id)fadeOpacityBy:(double)a3 duration:(double)a4
{
  objc_super v6 = objc_alloc_init(SCNActionFade);
  v7 = v6;
  float v8 = a3;
  mycaction = v6->_mycaction;
  mycaction->var19 = v8;
  float v10 = -v8;
  BOOL v11 = (LODWORD(v8) & 0x60000000) == 0;
  float v12 = 0.0;
  if (!v11) {
    float v12 = v10;
  }
  mycaction->var20 = v12;
  mycaction->var22 = 1;
  [(SCNAction *)v6 setDuration:a4];
  return v7;
}

+ (id)fadeOpacityTo:(double)a3 duration:(double)a4
{
  objc_super v6 = objc_alloc_init(SCNActionFade);
  mycaction = v6->_mycaction;
  float v8 = a3;
  mycaction->var19 = v8;
  mycaction->var20 = v8;
  mycaction->var22 = 0;
  [(SCNAction *)v6 setDuration:a4];
  return v6;
}

+ (id)fadeInWithDuration:(double)a3
{
  objc_super v4 = objc_alloc_init(SCNActionFade);
  mycaction = v4->_mycaction;
  *(void *)&mycaction->var19 = 1065353216;
  mycaction->var22 = 0;
  [(SCNAction *)v4 setDuration:a3];
  return v4;
}

+ (id)fadeOutWithDuration:(double)a3
{
  objc_super v4 = objc_alloc_init(SCNActionFade);
  mycaction = v4->_mycaction;
  *(void *)&mycaction->var19 = 0x3F80000000000000;
  mycaction->var22 = 0;
  [(SCNAction *)v4 setDuration:a3];
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SCNActionFade;
  objc_super v4 = [(SCNAction *)&v8 copyWithZone:a3];
  [(SCNAction *)self duration];
  objc_msgSend(v4, "setDuration:");
  mycaction = self->_mycaction;
  uint64_t v6 = v4[2];
  *(void *)(v6 + 144) = *(void *)&mycaction->var19;
  *(unsigned char *)(v6 + 156) = mycaction->var22;
  return v4;
}

- (id)reversedAction
{
  id result = objc_alloc_init(SCNActionFade);
  mycaction = self->_mycaction;
  uint64_t v5 = *((void *)result + 2);
  *(unsigned char *)(v5 + 156) = mycaction->var22;
  *(float *)(v5 + 144) = mycaction->var20;
  *(float *)(v5 + 148) = mycaction->var19;
  *(double *)(v5 + 64) = mycaction->var8;
  return result;
}

@end