@interface SKScale
+ (BOOL)supportsSecureCoding;
+ (id)scaleBy:(double)a3 duration:(double)a4;
+ (id)scaleTo:(double)a3 duration:(double)a4;
+ (id)scaleToSize:(CGSize)a3 duration:(double)a4;
+ (id)scaleXBy:(double)a3 duration:(double)a4;
+ (id)scaleXBy:(double)a3 y:(double)a4 duration:(double)a5;
+ (id)scaleXTo:(double)a3 duration:(double)a4;
+ (id)scaleXTo:(double)a3 y:(double)a4 duration:(double)a5;
+ (id)scaleYBy:(double)a3 duration:(double)a4;
+ (id)scaleYTo:(double)a3 duration:(double)a4;
- (SKScale)init;
- (SKScale)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)reversedAction;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SKScale

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKScale)init
{
  v3.receiver = self;
  v3.super_class = (Class)SKScale;
  if ([(SKAction *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (SKScale)initWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SKScale;
  if ([(SKAction *)&v6 initWithCoder:v4]) {
    operator new();
  }

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SKScale;
  [(SKAction *)&v17 encodeWithCoder:v4];
  v5 = [NSNumber numberWithDouble:self->_mycaction->var23];
  [v4 encodeObject:v5 forKey:@"_lastRatio"];

  objc_super v6 = [NSNumber numberWithDouble:self->_mycaction->var19];
  [v4 encodeObject:v6 forKey:@"_scaleTargetX"];

  v7 = [NSNumber numberWithDouble:self->_mycaction->var20];
  [v4 encodeObject:v7 forKey:@"_scaleTargetY"];

  v8 = [NSNumber numberWithDouble:self->_mycaction->var21];
  [v4 encodeObject:v8 forKey:@"_scaleTargetReversedX"];

  v9 = [NSNumber numberWithDouble:self->_mycaction->var22];
  [v4 encodeObject:v9 forKey:@"_scaleTargetReversedY"];

  v10 = [NSNumber numberWithDouble:self->_mycaction->var26];
  [v4 encodeObject:v10 forKey:@"_deltaScaleX"];

  v11 = [NSNumber numberWithDouble:self->_mycaction->var27];
  [v4 encodeObject:v11 forKey:@"_deltaScaleY"];

  v12 = [NSNumber numberWithBool:self->_mycaction->var28];
  [v4 encodeObject:v12 forKey:@"_isReversed"];

  v13 = [NSNumber numberWithBool:self->_mycaction->var29];
  [v4 encodeObject:v13 forKey:@"_isRelative"];

  v14 = [NSNumber numberWithBool:self->_mycaction->var30];
  [v4 encodeObject:v14 forKey:@"_useX"];

  v15 = [NSNumber numberWithBool:self->_mycaction->var31];
  [v4 encodeObject:v15 forKey:@"_useY"];

  v16 = [NSNumber numberWithBool:self->_mycaction->var32];
  [v4 encodeObject:v16 forKey:@"_isTargetSizeBased"];

  objc_msgSend(v4, "encodeCGSize:forKey:", @"_targetSize", self->_mycaction->var33.width, self->_mycaction->var33.height);
}

+ (id)scaleBy:(double)a3 duration:(double)a4
{
  return +[SKScale scaleXBy:a3 y:a3 duration:a4];
}

+ (id)scaleXBy:(double)a3 y:(double)a4 duration:(double)a5
{
  v8 = objc_alloc_init(SKScale);
  v9 = v8;
  float v10 = a3;
  mycaction = v8->_mycaction;
  float v12 = a4;
  mycaction->var19 = v10;
  mycaction->var20 = v12;
  float v13 = v10;
  float v14 = 0.0;
  float v15 = 0.0;
  if ((LODWORD(v13) & 0x60000000) != 0) {
    float v15 = 1.0 / a3;
  }
  mycaction->var21 = v15;
  if ((LODWORD(v12) & 0x60000000) != 0) {
    float v14 = 1.0 / a4;
  }
  mycaction->var22 = v14;
  *(_WORD *)&mycaction->var29 = 257;
  mycaction->var31 = 1;
  [(SKAction *)v8 setDuration:a5];

  return v9;
}

+ (id)scaleXBy:(double)a3 duration:(double)a4
{
  objc_super v6 = objc_alloc_init(SKScale);
  v7 = v6;
  mycaction = v6->_mycaction;
  float v9 = a3;
  mycaction->var19 = v9;
  mycaction->var20 = 1.0;
  if ((LODWORD(v9) & 0x60000000) != 0) {
    float v10 = 1.0 / a3;
  }
  else {
    float v10 = 0.0;
  }
  mycaction->var21 = v10;
  mycaction->var22 = 1.0;
  *(_WORD *)&mycaction->var29 = 257;
  mycaction->var31 = 0;
  [(SKAction *)v6 setDuration:a4];

  return v7;
}

+ (id)scaleYBy:(double)a3 duration:(double)a4
{
  objc_super v6 = objc_alloc_init(SKScale);
  v7 = v6;
  mycaction = v6->_mycaction;
  mycaction->var19 = 1.0;
  float v9 = a3;
  mycaction->var20 = v9;
  if ((LODWORD(v9) & 0x60000000) != 0) {
    float v10 = 1.0 / a3;
  }
  else {
    float v10 = 0.0;
  }
  mycaction->var22 = v10;
  mycaction->var21 = 1.0;
  *(_WORD *)&mycaction->var29 = 1;
  mycaction->var31 = 1;
  [(SKAction *)v6 setDuration:a4];

  return v7;
}

+ (id)scaleTo:(double)a3 duration:(double)a4
{
  return +[SKScale scaleXTo:a3 y:a3 duration:a4];
}

+ (id)scaleToSize:(CGSize)a3 duration:(double)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v7 = objc_alloc_init(SKScale);
  mycaction = v7->_mycaction;
  __asm { FMOV            V0.4S, #1.0 }
  *(_OWORD *)&mycaction->var19 = _Q0;
  *(_DWORD *)&mycaction->var29 = 16843008;
  mycaction->var33.CGFloat width = width;
  mycaction->var33.CGFloat height = height;
  [(SKAction *)v7 setDuration:a4];

  return v7;
}

+ (id)scaleXTo:(double)a3 y:(double)a4 duration:(double)a5
{
  v8 = objc_alloc_init(SKScale);
  float v9 = a3;
  mycaction = v8->_mycaction;
  float v11 = a4;
  mycaction->var19 = v9;
  mycaction->var20 = v11;
  mycaction->var21 = v9;
  mycaction->var22 = v11;
  *(_WORD *)&mycaction->var29 = 256;
  mycaction->var31 = 1;
  [(SKAction *)v8 setDuration:a5];

  return v8;
}

+ (id)scaleXTo:(double)a3 duration:(double)a4
{
  objc_super v6 = objc_alloc_init(SKScale);
  mycaction = v6->_mycaction;
  float v8 = a3;
  mycaction->var19 = v8;
  mycaction->var20 = 1.0;
  mycaction->var21 = v8;
  mycaction->var22 = 1.0;
  *(_WORD *)&mycaction->var29 = 256;
  mycaction->var31 = 0;
  [(SKAction *)v6 setDuration:a4];

  return v6;
}

+ (id)scaleYTo:(double)a3 duration:(double)a4
{
  objc_super v6 = objc_alloc_init(SKScale);
  mycaction = v6->_mycaction;
  mycaction->var19 = 1.0;
  float v8 = a3;
  mycaction->var20 = v8;
  mycaction->var21 = 1.0;
  mycaction->var22 = v8;
  *(_WORD *)&mycaction->var29 = 0;
  mycaction->var31 = 1;
  [(SKAction *)v6 setDuration:a4];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SKScale;
  id result = [(SKAction *)&v7 copyWithZone:a3];
  mycaction = self->_mycaction;
  uint64_t v6 = *((void *)result + 2);
  *(float *)(v6 + 128) = mycaction->var23;
  *(_OWORD *)(v6 + 112) = *(_OWORD *)&mycaction->var19;
  *(void *)(v6 + 140) = *(void *)&mycaction->var26;
  *(_DWORD *)(v6 + 148) = *(_DWORD *)&mycaction->var28;
  *(unsigned char *)(v6 + 152) = mycaction->var32;
  *(CGSize *)(v6 + 160) = mycaction->var33;
  return result;
}

- (id)reversedAction
{
  uint64_t v3 = MEMORY[0x21052E6F0](self, a2);
  v8.receiver = self;
  v8.super_class = (Class)SKScale;
  id v4 = [(SKAction *)&v8 copyWithZone:v3];
  mycaction = self->_mycaction;
  uint64_t v6 = v4[2];
  *(float *)(v6 + 128) = mycaction->var23;
  *(void *)(v6 + 112) = *(void *)&mycaction->var21;
  *(void *)(v6 + 120) = *(void *)&mycaction->var19;
  *(void *)(v6 + 140) = *(void *)&mycaction->var26;
  *(unsigned char *)(v6 + 148) = !mycaction->var28;
  *(_DWORD *)(v6 + 149) = *(_DWORD *)&mycaction->var29;
  *(CGSize *)(v6 + 160) = mycaction->var33;

  return v4;
}

@end