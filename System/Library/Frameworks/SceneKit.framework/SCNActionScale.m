@interface SCNActionScale
+ (BOOL)supportsSecureCoding;
+ (id)scaleBy:(double)a3 duration:(double)a4;
+ (id)scaleTo:(double)a3 duration:(double)a4;
- (BOOL)isRelative;
- (SCNActionScale)init;
- (SCNActionScale)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)parameters;
- (id)reversedAction;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SCNActionScale

- (SCNActionScale)init
{
  v3.receiver = self;
  v3.super_class = (Class)SCNActionScale;
  if ([(SCNAction *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (SCNActionScale)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SCNActionScale;
  if (-[SCNAction initWithCoder:](&v4, sel_initWithCoder_)) {
    operator new();
  }
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SCNActionScale;
  -[SCNAction encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", self->_mycaction->var21), @"_lastRatio");
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", self->_mycaction->var19), @"_scaleTarget");
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", self->_mycaction->var20), @"_scaleTargetReversed");
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", self->_mycaction->var23), @"_deltaScale");
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_mycaction->var24), @"_isReversed");
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_mycaction->var25), @"_isRelative");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)scaleBy:(double)a3 duration:(double)a4
{
  v6 = objc_alloc_init(SCNActionScale);
  v7 = v6;
  float v8 = a3;
  mycaction = v6->_mycaction;
  mycaction->var19 = v8;
  if ((LODWORD(v8) & 0x60000000) != 0) {
    float v10 = 1.0 / a3;
  }
  else {
    float v10 = 0.0;
  }
  mycaction->var20 = v10;
  mycaction->var25 = 1;
  [(SCNAction *)v6 setDuration:a4];
  return v7;
}

+ (id)scaleTo:(double)a3 duration:(double)a4
{
  v6 = objc_alloc_init(SCNActionScale);
  mycaction = v6->_mycaction;
  float v8 = a3;
  mycaction->var19 = v8;
  mycaction->var20 = v8;
  mycaction->var25 = 0;
  [(SCNAction *)v6 setDuration:a4];
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SCNActionScale;
  id result = [(SCNAction *)&v7 copyWithZone:a3];
  mycaction = self->_mycaction;
  uint64_t v6 = *((void *)result + 2);
  *(float *)(v6 + 152) = mycaction->var21;
  *(void *)(v6 + 144) = *(void *)&mycaction->var19;
  *(float *)(v6 + 160) = mycaction->var23;
  *(_WORD *)(v6 + 164) = *(_WORD *)&mycaction->var24;
  return result;
}

- (id)reversedAction
{
  uint64_t v3 = MEMORY[0x210534CB0](self, a2);
  v9.receiver = self;
  v9.super_class = (Class)SCNActionScale;
  objc_super v4 = [(SCNAction *)&v9 copyWithZone:v3];
  mycaction = self->_mycaction;
  uint64_t v6 = v4[2];
  float var21 = mycaction->var21;
  *(float *)(v6 + 144) = mycaction->var20;
  *(float *)(v6 + 148) = mycaction->var19;
  *(float *)(v6 + 152) = var21;
  *(float *)(v6 + 160) = mycaction->var23;
  *(unsigned char *)(v6 + 164) = !mycaction->var24;
  *(unsigned char *)(v6 + 165) = mycaction->var25;
  return v4;
}

- (id)parameters
{
  v4[1] = *MEMORY[0x263EF8340];
  *(float *)&double v2 = self->_mycaction->var19;
  v4[0] = [NSNumber numberWithFloat:v2];
  return (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
}

- (BOOL)isRelative
{
  return self->_mycaction->var25;
}

@end