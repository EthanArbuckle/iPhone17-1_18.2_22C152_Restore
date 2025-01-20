@interface SKSpeed
+ (BOOL)supportsSecureCoding;
+ (id)speedBy:(double)a3 duration:(double)a4;
+ (id)speedTo:(double)a3 duration:(double)a4;
- (SKSpeed)init;
- (SKSpeed)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)reversedAction;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SKSpeed

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKSpeed)init
{
  v3.receiver = self;
  v3.super_class = (Class)SKSpeed;
  if ([(SKAction *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (SKSpeed)initWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SKSpeed;
  if ([(SKAction *)&v6 initWithCoder:v4]) {
    operator new();
  }

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SKSpeed;
  [(SKAction *)&v13 encodeWithCoder:v4];
  v5 = [NSNumber numberWithDouble:self->_mycaction->var19];
  [v4 encodeObject:v5 forKey:@"_speedTarget"];

  objc_super v6 = [NSNumber numberWithDouble:self->_mycaction->var20];
  [v4 encodeObject:v6 forKey:@"_speedTargetReversed"];

  v7 = [NSNumber numberWithDouble:self->_mycaction->var23];
  [v4 encodeObject:v7 forKey:@"_deltaSpeed"];

  v8 = [NSNumber numberWithDouble:self->_mycaction->var21];
  [v4 encodeObject:v8 forKey:@"_lastRatio"];

  double v9 = 0.0;
  if (self->_mycaction->var24) {
    double v9 = 1.0;
  }
  v10 = [NSNumber numberWithDouble:v9];
  [v4 encodeObject:v10 forKey:@"_isReversed"];

  double v11 = 0.0;
  if (self->_mycaction->var25) {
    double v11 = 1.0;
  }
  v12 = [NSNumber numberWithDouble:v11];
  [v4 encodeObject:v12 forKey:@"_isRelative"];
}

+ (id)speedBy:(double)a3 duration:(double)a4
{
  objc_super v6 = objc_alloc_init(SKSpeed);
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
  [(SKAction *)v6 setDuration:a4];

  return v7;
}

+ (id)speedTo:(double)a3 duration:(double)a4
{
  objc_super v6 = objc_alloc_init(SKSpeed);
  mycaction = v6->_mycaction;
  float v8 = a3;
  mycaction->var19 = v8;
  mycaction->var20 = v8;
  mycaction->var25 = 0;
  [(SKAction *)v6 setDuration:a4];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SKSpeed;
  id result = [(SKAction *)&v7 copyWithZone:a3];
  mycaction = self->_mycaction;
  uint64_t v6 = *((void *)result + 2);
  *(float *)(v6 + 120) = mycaction->var21;
  *(float *)(v6 + 128) = mycaction->var23;
  *(void *)(v6 + 112) = *(void *)&mycaction->var19;
  *(_WORD *)(v6 + 132) = *(_WORD *)&mycaction->var24;
  return result;
}

- (id)reversedAction
{
  objc_super v3 = objc_alloc_init(SKSpeed);
  mycaction = self->_mycaction;
  v5 = v3->_mycaction;
  v5->var24 = !mycaction->var24;
  v5->var25 = mycaction->var25;
  float var21 = mycaction->var21;
  v5->var19 = mycaction->var20;
  v5->var20 = mycaction->var19;
  v5->float var21 = var21;
  v5->var9 = mycaction->var9;

  return v3;
}

@end