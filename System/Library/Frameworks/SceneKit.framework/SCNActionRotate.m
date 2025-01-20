@interface SCNActionRotate
+ (BOOL)supportsSecureCoding;
+ (id)rotateByAngle:(double)a3 aroundAxis:(SCNVector3)a4 duration:(double)a5;
+ (id)rotateByX:(double)a3 y:(double)a4 z:(double)a5 duration:(double)a6;
+ (id)rotateToAxisAngle:(SCNVector4)a3 duration:(double)a4;
+ (id)rotateToX:(double)a3 y:(double)a4 z:(double)a5 duration:(double)a6;
+ (id)rotateToX:(double)a3 y:(double)a4 z:(double)a5 duration:(double)a6 shortestUnitArc:(BOOL)a7;
- (BOOL)isRelative;
- (SCNActionRotate)init;
- (SCNActionRotate)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)parameters;
- (id)reversedAction;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SCNActionRotate

- (SCNActionRotate)init
{
  v3.receiver = self;
  v3.super_class = (Class)SCNActionRotate;
  if ([(SCNAction *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (SCNActionRotate)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SCNActionRotate;
  if (-[SCNAction initWithCoder:](&v4, sel_initWithCoder_)) {
    operator new();
  }
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SCNActionRotate;
  -[SCNAction encodeWithCoder:](&v6, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", self->_mycaction->var19), @"_rotX");
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", *(float *)&self->_mycaction->var20), @"_rotY");
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", *(float *)&self->_mycaction->var24), @"_rotZ");
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", *(float *)&self->_mycaction[1].var2), @"_lastRotX");
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", *((float *)&self->_mycaction[1].var2 + 1)), @"_lastRotY");
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", *(float *)&self->_mycaction[1].var3), @"_lastRotZ");
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", BYTE1(self->_mycaction[1].var15)), @"_isReversed");
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", BYTE2(self->_mycaction[1].var15)), @"_isRelative");
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", LOBYTE(self->_mycaction[1].var15)), @"_isAxisAngle");
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", BYTE3(self->_mycaction[1].var15)), @"_isUnitArc");
  SCNEncodeVector4(a3, @"_axisRot", *(float *)&self->_mycaction[1].var4, *((float *)&self->_mycaction[1].var4 + 1), *(float *)&self->_mycaction[1].var5, *((float *)&self->_mycaction[1].var5 + 1));
  mycaction = self->_mycaction;
  if (BYTE3(mycaction[1].var15)) {
    SCNEncodeVector4(a3, @"_qRot", *(float *)&mycaction[1].var10, *(float *)(&mycaction[1].var11 + 3), *(float *)&mycaction[1].var12, *((float *)&mycaction[1].var12 + 1));
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)rotateByX:(double)a3 y:(double)a4 z:(double)a5 duration:(double)a6
{
  v10 = objc_alloc_init(SCNActionRotate);
  mycaction = v10->_mycaction;
  BYTE2(mycaction[1].var15) = 1;
  float v12 = a3;
  mycaction->var19 = v12;
  float v13 = a4;
  *(float *)&v10->_mycaction->var20 = v13;
  float v14 = a5;
  *(float *)&v10->_mycaction->var24 = v14;
  [(SCNAction *)v10 setDuration:a6];
  return v10;
}

+ (id)rotateToX:(double)a3 y:(double)a4 z:(double)a5 duration:(double)a6
{
  return +[SCNActionRotate rotateToX:0 y:a3 z:a4 duration:a5 shortestUnitArc:a6];
}

+ (id)rotateByAngle:(double)a3 aroundAxis:(SCNVector3)a4 duration:(double)a5
{
  float z = a4.z;
  float y = a4.y;
  float x = a4.x;
  v10 = objc_alloc_init(SCNActionRotate);
  mycaction = v10->_mycaction;
  *(float *)&mycaction[1].var4 = x;
  float v12 = v10->_mycaction;
  BYTE2(mycaction[1].var15) = 1;
  *((float *)&v12[1].var4 + 1) = y;
  *(float *)&v10->_mycaction[1].var5 = z;
  float v13 = a3;
  *((float *)&v10->_mycaction[1].var5 + 1) = v13;
  LOBYTE(v10->_mycaction[1].var15) = 1;
  [(SCNAction *)v10 setDuration:a5];
  return v10;
}

+ (id)rotateToAxisAngle:(SCNVector4)a3 duration:(double)a4
{
  float w = a3.w;
  float z = a3.z;
  float y = a3.y;
  float x = a3.x;
  v5 = objc_alloc_init(SCNActionRotate);
  mycaction = v5->_mycaction;
  *(void *)&long long v7 = __PAIR64__(LODWORD(y), LODWORD(x));
  *((void *)&v7 + 1) = __PAIR64__(LODWORD(w), LODWORD(z));
  BYTE2(mycaction[1].var15) = 0;
  *(_OWORD *)&mycaction[1].var4 = v7;
  LOBYTE(v5->_mycaction[1].var15) = 1;
  [(SCNAction *)v5 setDuration:a4];
  return v5;
}

+ (id)rotateToX:(double)a3 y:(double)a4 z:(double)a5 duration:(double)a6 shortestUnitArc:(BOOL)a7
{
  float v12 = objc_alloc_init(SCNActionRotate);
  mycaction = v12->_mycaction;
  BYTE2(mycaction[1].var15) = 0;
  float v14 = a3;
  float v15 = a4;
  float v16 = a5;
  if (a7)
  {
    C3DQuaternionMakeEuler(&mycaction[1].var10, v14, v15, v16);
    mycaction = v12->_mycaction;
  }
  mycaction->var19 = v14;
  *(float *)&v12->_mycaction->var20 = v15;
  *(float *)&v12->_mycaction->var24 = v16;
  [(SCNAction *)v12 setDuration:a6];
  BYTE3(v12->_mycaction[1].var15) = a7;
  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SCNActionRotate;
  id result = [(SCNAction *)&v9 copyWithZone:a3];
  mycaction = self->_mycaction;
  uint64_t v6 = *((void *)result + 2);
  *(_DWORD *)(v6 + 272) = LODWORD(mycaction[1].var15);
  *(_OWORD *)(v6 + 144) = *(_OWORD *)&mycaction->var19;
  *(_OWORD *)(*((void *)result + 2) + 192) = *(_OWORD *)&self->_mycaction[1].var4;
  *(_OWORD *)(*((void *)result + 2) + 240) = *(_OWORD *)&self->_mycaction[1].var10;
  long long v7 = self->_mycaction;
  uint64_t v8 = *((void *)result + 2);
  *(_OWORD *)(v8 + 56) = *(_OWORD *)&v7->var7;
  *(void *)(v8 + 104) = v7->var14;
  *(_OWORD *)(v8 + 120) = *(_OWORD *)&v7->var16;
  return result;
}

- (id)reversedAction
{
  uint64_t v3 = MEMORY[0x210534CB0](self, a2);
  v14.receiver = self;
  v14.super_class = (Class)SCNActionRotate;
  objc_super v4 = [(SCNAction *)&v14 copyWithZone:v3];
  long long v7 = v4;
  mycaction = self->_mycaction;
  uint64_t v9 = v4[2];
  *(_WORD *)(v9 + 274) = WORD1(mycaction[1].var15);
  *(unsigned char *)(v9 + 273) = BYTE1(mycaction[1].var15) ^ 1;
  var15_lofloat w = LOBYTE(mycaction[1].var15);
  *(unsigned char *)(v9 + 272) = var15_low;
  if (var15_low)
  {
    long long v11 = *(_OWORD *)&mycaction[1].var4;
    *(_OWORD *)(v9 + 192) = v11;
    float v12 = self->_mycaction;
    if (BYTE2(v12[1].var15))
    {
      *(float *)&long long v11 = -*((float *)&v12[1].var5 + 1);
      *(_DWORD *)(v4[2] + 204) = v11;
    }
  }
  else
  {
    v5.i32[0] = 0;
    v6.i8[0] = BYTE2(mycaction[1].var15);
    *(int8x16_t *)(v9 + 144) = vbslq_s8(vdupq_lane_s8((int8x8_t)*(_OWORD *)&vceqq_s8(v6, v5), 0), *(int8x16_t *)&mycaction->var19, (int8x16_t)vnegq_f32(*(float32x4_t *)&mycaction->var19));
    long long v11 = *(_OWORD *)&self->_mycaction[1].var10;
    *(_OWORD *)(v4[2] + 240) = v11;
    if (BYTE2(self->_mycaction[1].var15)) {
      *(void *)&long long v11 = C3DQuaternionConjugate((float32x4_t *)(v4[2] + 240)).n128_u64[0];
    }
  }
  [(SCNAction *)self duration];
  objc_msgSend(v7, "setDuration:");
  return v7;
}

- (BOOL)isRelative
{
  return BYTE2(self->_mycaction[1].var15);
}

- (id)parameters
{
  v15[5] = *MEMORY[0x263EF8340];
  mycaction = self->_mycaction;
  if (LOBYTE(mycaction[1].var15))
  {
    LODWORD(v2) = *(_DWORD *)&mycaction[1].var4;
    v15[0] = [NSNumber numberWithFloat:v2];
    LODWORD(v5) = *((_DWORD *)&self->_mycaction[1].var4 + 1);
    v15[1] = [NSNumber numberWithFloat:v5];
    LODWORD(v6) = LODWORD(self->_mycaction[1].var5);
    v15[2] = [NSNumber numberWithFloat:v6];
    LODWORD(v7) = HIDWORD(self->_mycaction[1].var5);
    v15[3] = [NSNumber numberWithFloat:v7];
    v15[4] = [NSNumber numberWithInt:BYTE3(self->_mycaction[1].var15)];
    uint64_t v8 = (void *)MEMORY[0x263EFF8C0];
    uint64_t v9 = v15;
    uint64_t v10 = 5;
  }
  else
  {
    *(float *)&double v2 = mycaction->var19;
    v14[0] = [NSNumber numberWithFloat:v2];
    LODWORD(v11) = *(_DWORD *)&self->_mycaction->var20;
    v14[1] = objc_msgSend(NSNumber, "numberWithFloat:", v11, v14[0]);
    LODWORD(v12) = *(_DWORD *)&self->_mycaction->var24;
    v14[2] = [NSNumber numberWithFloat:v12];
    v14[3] = [NSNumber numberWithInt:BYTE3(self->_mycaction[1].var15)];
    uint64_t v8 = (void *)MEMORY[0x263EFF8C0];
    uint64_t v9 = v14;
    uint64_t v10 = 4;
  }
  return (id)[v8 arrayWithObjects:v9 count:v10];
}

@end