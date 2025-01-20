@interface SKFade
+ (BOOL)supportsSecureCoding;
+ (id)fadeAlphaBy:(double)a3 duration:(double)a4;
+ (id)fadeAlphaTo:(double)a3 duration:(double)a4;
+ (id)fadeInWithDuration:(double)a3;
+ (id)fadeOutWithDuration:(double)a3;
- (SKFade)init;
- (SKFade)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)reversedAction;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SKFade

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKFade)init
{
  v3.receiver = self;
  v3.super_class = (Class)SKFade;
  if ([(SKAction *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (SKFade)initWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SKFade;
  if ([(SKAction *)&v6 initWithCoder:v4]) {
    operator new();
  }

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SKFade;
  [(SKAction *)&v10 encodeWithCoder:v4];
  v5 = [NSNumber numberWithDouble:self->_mycaction->var19];
  [v4 encodeObject:v5 forKey:@"_alphaTarget"];

  objc_super v6 = [NSNumber numberWithDouble:self->_mycaction->var20];
  [v4 encodeObject:v6 forKey:@"_alphaTargetReversed"];

  v7 = [NSNumber numberWithDouble:self->_mycaction->var21];
  [v4 encodeObject:v7 forKey:@"_lastAlpha"];

  double v8 = 0.0;
  if (self->_mycaction->var22) {
    double v8 = 1.0;
  }
  v9 = [NSNumber numberWithDouble:v8];
  [v4 encodeObject:v9 forKey:@"_isRelative"];
}

+ (id)fadeAlphaBy:(double)a3 duration:(double)a4
{
  objc_super v6 = objc_alloc_init(SKFade);
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
  [(SKAction *)v6 setDuration:a4];

  return v7;
}

+ (id)fadeAlphaTo:(double)a3 duration:(double)a4
{
  objc_super v6 = objc_alloc_init(SKFade);
  mycaction = v6->_mycaction;
  float v8 = a3;
  mycaction->var19 = v8;
  mycaction->var20 = v8;
  mycaction->var22 = 0;
  [(SKAction *)v6 setDuration:a4];

  return v6;
}

+ (id)fadeInWithDuration:(double)a3
{
  id v4 = objc_alloc_init(SKFade);
  mycaction = v4->_mycaction;
  *(void *)&mycaction->var19 = 1065353216;
  mycaction->var22 = 0;
  [(SKAction *)v4 setDuration:a3];

  return v4;
}

+ (id)fadeOutWithDuration:(double)a3
{
  id v4 = objc_alloc_init(SKFade);
  mycaction = v4->_mycaction;
  *(void *)&mycaction->var19 = 0x3F80000000000000;
  mycaction->var22 = 0;
  [(SKAction *)v4 setDuration:a3];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SKFade;
  id v4 = [(SKAction *)&v8 copyWithZone:a3];
  [(SKAction *)self duration];
  objc_msgSend(v4, "setDuration:");
  mycaction = self->_mycaction;
  uint64_t v6 = v4[2];
  *(void *)(v6 + 112) = *(void *)&mycaction->var19;
  *(unsigned char *)(v6 + 124) = mycaction->var22;
  return v4;
}

- (id)reversedAction
{
  objc_super v3 = objc_alloc_init(SKFade);
  mycaction = self->_mycaction;
  v5 = v3->_mycaction;
  v5->var22 = mycaction->var22;
  v5->var19 = mycaction->var20;
  v5->var20 = mycaction->var19;
  v5->var9 = mycaction->var9;

  return v3;
}

@end