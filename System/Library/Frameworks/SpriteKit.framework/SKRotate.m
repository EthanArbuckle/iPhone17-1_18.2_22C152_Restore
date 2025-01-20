@interface SKRotate
+ (BOOL)supportsSecureCoding;
+ (id)rotateByAngle:(double)a3 duration:(double)a4;
+ (id)rotateByX:(double)a3 duration:(double)a4;
+ (id)rotateByX:(double)a3 y:(double)a4 z:(double)a5 duration:(double)a6;
+ (id)rotateByY:(double)a3 duration:(double)a4;
+ (id)rotateToAngle:(double)a3 duration:(double)a4;
+ (id)rotateToAngle:(double)a3 duration:(double)a4 shortestUnitArc:(BOOL)a5;
+ (id)rotateToX:(double)a3 duration:(double)a4;
+ (id)rotateToX:(double)a3 y:(double)a4 z:(double)a5 duration:(double)a6;
+ (id)rotateToY:(double)a3 duration:(double)a4;
- (SKRotate)init;
- (SKRotate)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)reversedAction;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SKRotate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKRotate)init
{
  v3.receiver = self;
  v3.super_class = (Class)SKRotate;
  if ([(SKAction *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (SKRotate)initWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SKRotate;
  if ([(SKAction *)&v6 initWithCoder:v4]) {
    operator new();
  }

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SKRotate;
  [(SKAction *)&v18 encodeWithCoder:v4];
  v5 = [NSNumber numberWithDouble:self->_mycaction->var19];
  [v4 encodeObject:v5 forKey:@"_rotX"];

  objc_super v6 = [NSNumber numberWithDouble:self->_mycaction->var20];
  [v4 encodeObject:v6 forKey:@"_rotY"];

  v7 = [NSNumber numberWithDouble:self->_mycaction->var21];
  [v4 encodeObject:v7 forKey:@"_rotZ"];

  v8 = [NSNumber numberWithDouble:self->_mycaction->var25];
  [v4 encodeObject:v8 forKey:@"_lastRotX"];

  v9 = [NSNumber numberWithDouble:self->_mycaction->var26];
  [v4 encodeObject:v9 forKey:@"_lastRotY"];

  v10 = [NSNumber numberWithDouble:self->_mycaction->var27];
  [v4 encodeObject:v10 forKey:@"_lastRotZ"];

  v11 = [NSNumber numberWithDouble:self->_mycaction->var28];
  [v4 encodeObject:v11 forKey:@"_lastRatio"];

  v12 = [NSNumber numberWithBool:self->_mycaction->var29];
  [v4 encodeObject:v12 forKey:@"_isReversed"];

  v13 = [NSNumber numberWithBool:self->_mycaction->var30];
  [v4 encodeObject:v13 forKey:@"_isRelative"];

  v14 = [NSNumber numberWithBool:self->_mycaction->var31];
  [v4 encodeObject:v14 forKey:@"_isUnitArc"];

  v15 = [NSNumber numberWithBool:self->_mycaction->var32];
  [v4 encodeObject:v15 forKey:@"_useX"];

  v16 = [NSNumber numberWithBool:self->_mycaction->var33];
  [v4 encodeObject:v16 forKey:@"_useY"];

  v17 = [NSNumber numberWithBool:self->_mycaction->var34];
  [v4 encodeObject:v17 forKey:@"_useZ"];
}

+ (id)rotateByAngle:(double)a3 duration:(double)a4
{
  objc_super v6 = objc_alloc_init(SKRotate);
  mycaction = v6->_mycaction;
  mycaction->var30 = 1;
  float v8 = a3;
  mycaction->var21 = v8;
  *(_WORD *)&mycaction->var32 = 0;
  [(SKAction *)v6 setDuration:a4];

  return v6;
}

+ (id)rotateToAngle:(double)a3 duration:(double)a4
{
  objc_super v6 = objc_alloc_init(SKRotate);
  mycaction = v6->_mycaction;
  float v8 = a3;
  mycaction->var21 = v8;
  *(_DWORD *)&mycaction->var30 = 0;
  [(SKAction *)v6 setDuration:a4];

  return v6;
}

+ (id)rotateToAngle:(double)a3 duration:(double)a4 shortestUnitArc:(BOOL)a5
{
  float v8 = objc_alloc_init(SKRotate);
  mycaction = v8->_mycaction;
  mycaction->var30 = 0;
  mycaction->var31 = a5;
  float v10 = a3;
  mycaction->var21 = v10;
  *(_WORD *)&mycaction->var32 = 0;
  [(SKAction *)v8 setDuration:a4];

  return v8;
}

+ (id)rotateByX:(double)a3 duration:(double)a4
{
  objc_super v6 = objc_alloc_init(SKRotate);
  mycaction = v6->_mycaction;
  mycaction->var30 = 1;
  float v8 = a3;
  mycaction->var19 = v8;
  *(_WORD *)&mycaction->var33 = 0;
  [(SKAction *)v6 setDuration:a4];

  return v6;
}

+ (id)rotateToX:(double)a3 duration:(double)a4
{
  objc_super v6 = objc_alloc_init(SKRotate);
  mycaction = v6->_mycaction;
  mycaction->var30 = 0;
  float v8 = a3;
  mycaction->var19 = v8;
  *(_WORD *)&mycaction->var33 = 0;
  [(SKAction *)v6 setDuration:a4];

  return v6;
}

+ (id)rotateByY:(double)a3 duration:(double)a4
{
  objc_super v6 = objc_alloc_init(SKRotate);
  mycaction = v6->_mycaction;
  mycaction->var30 = 1;
  float v8 = a3;
  mycaction->var20 = v8;
  mycaction->var32 = 0;
  mycaction->var34 = 0;
  [(SKAction *)v6 setDuration:a4];

  return v6;
}

+ (id)rotateToY:(double)a3 duration:(double)a4
{
  objc_super v6 = objc_alloc_init(SKRotate);
  mycaction = v6->_mycaction;
  mycaction->var30 = 0;
  float v8 = a3;
  mycaction->var20 = v8;
  mycaction->var32 = 0;
  mycaction->var34 = 0;
  [(SKAction *)v6 setDuration:a4];

  return v6;
}

+ (id)rotateByX:(double)a3 y:(double)a4 z:(double)a5 duration:(double)a6
{
  float v10 = objc_alloc_init(SKRotate);
  mycaction = v10->_mycaction;
  mycaction->var30 = 1;
  float v12 = a3;
  float v13 = a4;
  mycaction->var19 = v12;
  mycaction->var20 = v13;
  float v14 = a5;
  mycaction->var21 = v14;
  [(SKAction *)v10 setDuration:a6];

  return v10;
}

+ (id)rotateToX:(double)a3 y:(double)a4 z:(double)a5 duration:(double)a6
{
  float v10 = objc_alloc_init(SKRotate);
  mycaction = v10->_mycaction;
  mycaction->var30 = 0;
  float v12 = a3;
  float v13 = a4;
  mycaction->var19 = v12;
  mycaction->var20 = v13;
  float v14 = a5;
  mycaction->var21 = v14;
  [(SKAction *)v10 setDuration:a6];

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SKRotate;
  id result = [(SKAction *)&v7 copyWithZone:a3];
  mycaction = self->_mycaction;
  uint64_t v6 = *((void *)result + 2);
  *(void *)(v6 + 112) = *(void *)&mycaction->var19;
  *(float *)(v6 + 120) = mycaction->var21;
  *(_DWORD *)(v6 + 152) = *(_DWORD *)&mycaction->var29;
  *(_WORD *)(v6 + 156) = *(_WORD *)&mycaction->var33;
  *(void *)(v6 + 56) = *(void *)&mycaction->var8;
  *(void *)(v6 + 88) = mycaction->var14;
  *(void *)(v6 + 100) = *(void *)&mycaction->var16;
  *(float *)(v6 + 148) = mycaction->var28;
  return result;
}

- (id)reversedAction
{
  uint64_t v3 = MEMORY[0x21052E6F0](self, a2);
  v10.receiver = self;
  v10.super_class = (Class)SKRotate;
  id v4 = [(SKAction *)&v10 copyWithZone:v3];
  mycaction = self->_mycaction;
  uint64_t v6 = v4[2];
  *(_WORD *)(v6 + 153) = *(_WORD *)&mycaction->var30;
  *(unsigned char *)(v6 + 152) = !mycaction->var29;
  float var19 = mycaction->var19;
  if (mycaction->var30)
  {
    float var19 = -var19;
    float32x2_t v8 = vneg_f32(*(float32x2_t *)&mycaction->var20);
  }
  else
  {
    float32x2_t v8 = *(float32x2_t *)&mycaction->var20;
  }
  *(float *)(v6 + 112) = var19;
  *(float32x2_t *)(v6 + 116) = v8;
  *(_WORD *)(v6 + 155) = *(_WORD *)&mycaction->var32;
  *(unsigned char *)(v6 + 157) = mycaction->var34;
  [(SKAction *)self duration];
  objc_msgSend(v4, "setDuration:");

  return v4;
}

@end