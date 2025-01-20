@interface SCNActionMove
+ (BOOL)supportsSecureCoding;
+ (id)moveBy:(SCNVector3)a3 duration:(double)a4;
+ (id)moveByX:(double)a3 y:(double)a4 z:(double)a5 duration:(double)a6;
+ (id)moveTo:(SCNVector3)a3 duration:(double)a4;
+ (id)moveToX:(double)a3 y:(double)a4 z:(double)a5 duration:(double)a6;
- (BOOL)isRelative;
- (SCNActionMove)init;
- (SCNActionMove)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)parameters;
- (id)reversedAction;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SCNActionMove

- (SCNActionMove)init
{
  v3.receiver = self;
  v3.super_class = (Class)SCNActionMove;
  if ([(SCNAction *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (SCNActionMove)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SCNActionMove;
  if (-[SCNAction initWithCoder:](&v4, sel_initWithCoder_)) {
    operator new();
  }
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SCNActionMove;
  -[SCNAction encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", self->_mycaction->var19), @"_lastRatio");
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", *(float *)&self->_mycaction[1].var2), @"_posTarget.x");
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", *((float *)&self->_mycaction[1].var2 + 1)), @"_posTarget.y");
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", *(float *)&self->_mycaction[1].var3), @"_posTarget.z");
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", *(float *)&self->_mycaction[1].var4), @"_posTargetReversed.x");
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", *((float *)&self->_mycaction[1].var4 + 1)), @"_posTargetReversed.y");
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", *(float *)&self->_mycaction[1].var5), @"_posTargetReversed.z");
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", *(float *)&self->_mycaction[1].var0), @"_posStart.x");
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", *((float *)&self->_mycaction[1].var0 + 1)), @"_posStart.y");
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", *(float *)&self->_mycaction[1].var1), @"_posStart.z");
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", LOBYTE(self->_mycaction[1].var6)), @"_isReversed");
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", BYTE1(self->_mycaction[1].var6)), @"_isRelative");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)moveBy:(SCNVector3)a3 duration:(double)a4
{
  return +[SCNActionMove moveByX:a3.x y:a3.y z:a3.z duration:a4];
}

+ (id)moveByX:(double)a3 y:(double)a4 z:(double)a5 duration:(double)a6
{
  v10 = objc_alloc_init(SCNActionMove);
  float v11 = a3;
  *(float *)&v10->_mycaction[1].var2 = v11;
  float v12 = a4;
  *((float *)&v10->_mycaction[1].var2 + 1) = v12;
  float v13 = a5;
  *(float *)&v10->_mycaction[1].var3 = v13;
  *(float *)&v10->_mycaction[1].var4 = -v11;
  *((float *)&v10->_mycaction[1].var4 + 1) = -v12;
  *(float *)&v10->_mycaction[1].var5 = -v13;
  LOWORD(v10->_mycaction[1].var6) = 256;
  [(SCNAction *)v10 setDuration:a6];
  return v10;
}

+ (id)moveTo:(SCNVector3)a3 duration:(double)a4
{
  return +[SCNActionMove moveToX:a3.x y:a3.y z:a3.z duration:a4];
}

+ (id)moveToX:(double)a3 y:(double)a4 z:(double)a5 duration:(double)a6
{
  v10 = objc_alloc_init(SCNActionMove);
  float v11 = a3;
  *(float *)&v10->_mycaction[1].var2 = v11;
  float v12 = a4;
  *((float *)&v10->_mycaction[1].var2 + 1) = v12;
  float v13 = a5;
  *(float *)&v10->_mycaction[1].var3 = v13;
  *(float *)&v10->_mycaction[1].var4 = v11;
  *((float *)&v10->_mycaction[1].var4 + 1) = v12;
  *(float *)&v10->_mycaction[1].var5 = v13;
  BYTE1(v10->_mycaction[1].var6) = 0;
  [(SCNAction *)v10 setDuration:a6];
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SCNActionMove;
  id result = [(SCNAction *)&v7 copyWithZone:a3];
  mycaction = self->_mycaction;
  uint64_t v6 = *((void *)result + 2);
  *(double *)(v6 + 144) = mycaction->var19;
  *(_OWORD *)(v6 + 176) = *(_OWORD *)&mycaction[1].var2;
  *(_OWORD *)(*((void *)result + 2) + 192) = *(_OWORD *)&self->_mycaction[1].var4;
  *(_OWORD *)(*((void *)result + 2) + 160) = *(_OWORD *)&self->_mycaction[1].var0;
  *(_WORD *)(*((void *)result + 2) + 208) = LOWORD(self->_mycaction[1].var6);
  return result;
}

- (id)reversedAction
{
  uint64_t v3 = MEMORY[0x210534CB0](self, a2);
  v10.receiver = self;
  v10.super_class = (Class)SCNActionMove;
  objc_super v4 = [(SCNAction *)&v10 copyWithZone:v3];
  mycaction = self->_mycaction;
  uint64_t v6 = v4[2];
  *(double *)(v6 + 144) = mycaction->var19;
  *(_OWORD *)(v6 + 176) = *(_OWORD *)&mycaction[1].var4;
  *(_OWORD *)(v4[2] + 192) = *(_OWORD *)&self->_mycaction[1].var2;
  *(_OWORD *)(v4[2] + 160) = *(_OWORD *)&self->_mycaction[1].var0;
  objc_super v7 = self->_mycaction;
  uint64_t v8 = v4[2];
  *(unsigned char *)(v8 + 209) = BYTE1(v7[1].var6);
  *(unsigned char *)(v8 + 208) = LOBYTE(v7[1].var6) ^ 1;
  return v4;
}

- (BOOL)isRelative
{
  return BYTE1(self->_mycaction[1].var6);
}

- (id)parameters
{
  v7[3] = *MEMORY[0x263EF8340];
  LODWORD(v2) = self->_mycaction[1].var2;
  v7[0] = [NSNumber numberWithFloat:v2];
  LODWORD(v4) = HIDWORD(self->_mycaction[1].var2);
  v7[1] = objc_msgSend(NSNumber, "numberWithFloat:", v4, v7[0]);
  LODWORD(v5) = self->_mycaction[1].var3;
  v7[2] = [NSNumber numberWithFloat:v5];
  return (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:3];
}

@end