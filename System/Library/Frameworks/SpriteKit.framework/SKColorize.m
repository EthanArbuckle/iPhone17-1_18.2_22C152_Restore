@interface SKColorize
+ (BOOL)supportsSecureCoding;
+ (id)colorizeWithColor:(id)a3 colorBlendFactor:(double)a4 duration:(double)a5;
+ (id)colorizeWithColorBlendFactor:(double)a3 duration:(double)a4;
- (SKColorize)init;
- (SKColorize)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)reversedAction;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SKColorize

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKColorize)init
{
  v3.receiver = self;
  v3.super_class = (Class)SKColorize;
  if ([(SKAction *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (SKColorize)initWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SKColorize;
  if ([(SKAction *)&v6 initWithCoder:v4]) {
    operator new();
  }

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SKColorize;
  [(SKAction *)&v11 encodeWithCoder:v4];
  v5 = [NSNumber numberWithDouble:self->_mycaction->var20];
  [v4 encodeObject:v5 forKey:@"_colorMix"];

  objc_super v6 = [NSNumber numberWithDouble:self->_mycaction->var19.var0];
  [v4 encodeObject:v6 forKey:@"_colorBlendR"];

  v7 = [NSNumber numberWithDouble:self->_mycaction->var19.var1];
  [v4 encodeObject:v7 forKey:@"_colorBlendG"];

  v8 = [NSNumber numberWithDouble:self->_mycaction->var19.var2];
  [v4 encodeObject:v8 forKey:@"_colorBlendB"];

  v9 = [NSNumber numberWithDouble:self->_mycaction->var19.var3];
  [v4 encodeObject:v9 forKey:@"_colorBlendA"];

  v10 = [NSNumber numberWithBool:BYTE4(self->_mycaction[1].var3)];
  [v4 encodeObject:v10 forKey:@"_isMixOnly"];
}

+ (id)colorizeWithColor:(id)a3 colorBlendFactor:(double)a4 duration:(double)a5
{
  id v7 = a3;
  v8 = objc_alloc_init(SKColorize);
  [v7 componentRGBA];
  mycaction = v8->_mycaction;
  mycaction->var19.var0 = v10;
  mycaction->var19.var1 = v11;
  mycaction->var19.var2 = v12;
  mycaction->var19.var3 = v13;
  float v14 = a4;
  mycaction->var20 = v14;
  [(SKAction *)v8 setDuration:a5];
  BYTE4(v8->_mycaction[1].var3) = 0;

  return v8;
}

+ (id)colorizeWithColorBlendFactor:(double)a3 duration:(double)a4
{
  objc_super v6 = objc_alloc_init(SKColorize);
  float v7 = a3;
  v6->_mycaction->var20 = v7;
  [(SKAction *)v6 setDuration:a4];
  BYTE4(v6->_mycaction[1].var3) = 1;

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SKColorize;
  id result = [(SKAction *)&v7 copyWithZone:a3];
  *($C28CD4A45FD07A4F97CC9D5F91F25271 *)(*((void *)result + 2) + 112) = self->_mycaction->var19;
  mycaction = self->_mycaction;
  uint64_t v6 = *((void *)result + 2);
  *(float *)(v6 + 128) = mycaction->var20;
  *(unsigned char *)(v6 + 196) = BYTE4(mycaction[1].var3);
  return result;
}

- (id)reversedAction
{
  uint64_t v3 = MEMORY[0x21052E6F0](self, a2);
  v13.receiver = self;
  v13.super_class = (Class)SKColorize;
  id v4 = [(SKAction *)&v13 copyWithZone:v3];
  mycaction = self->_mycaction;
  char v6 = BYTE4(mycaction[1].var3);
  if (v6)
  {
    float v7 = 0.0;
    float v8 = 1.0;
    float v9 = 1.0;
    float v10 = 1.0;
  }
  else
  {
    float v8 = 1.0 - mycaction->var19.var0;
    float v9 = 1.0 - mycaction->var19.var1;
    float v10 = 1.0 - mycaction->var19.var2;
    float v7 = 1.0 - mycaction->var19.var3;
  }
  uint64_t v11 = v4[2];
  *(float *)(v11 + 112) = v8;
  *(float *)(v11 + 116) = v9;
  *(float *)(v11 + 120) = v10;
  *(float *)(v11 + 124) = v7;
  *(float *)(v11 + 128) = 1.0 - mycaction->var20;
  *(unsigned char *)(v11 + 196) = v6;

  return v4;
}

@end