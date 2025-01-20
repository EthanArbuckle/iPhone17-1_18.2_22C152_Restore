@interface SKResize
+ (BOOL)supportsSecureCoding;
+ (id)resizeByWidth:(double)a3 height:(double)a4 duration:(double)a5;
+ (id)resizeToHeight:(double)a3 duration:(double)a4;
+ (id)resizeToWidth:(double)a3 duration:(double)a4;
+ (id)resizeToWidth:(double)a3 height:(double)a4 duration:(double)a5;
- (SKResize)init;
- (SKResize)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)reversedAction;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SKResize

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKResize)init
{
  v3.receiver = self;
  v3.super_class = (Class)SKResize;
  if ([(SKAction *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (SKResize)initWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SKResize;
  if ([(SKAction *)&v6 initWithCoder:v4]) {
    operator new();
  }

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SKResize;
  [(SKAction *)&v16 encodeWithCoder:v4];
  v5 = [NSNumber numberWithDouble:self->_mycaction->var19];
  [v4 encodeObject:v5 forKey:@"_lastRatio"];

  objc_super v6 = [NSNumber numberWithDouble:self->_mycaction->var20.var0];
  [v4 encodeObject:v6 forKey:@"_sizeTarget.width"];

  v7 = [NSNumber numberWithDouble:self->_mycaction->var20.var1];
  [v4 encodeObject:v7 forKey:@"_sizeTarget.height"];

  v8 = [NSNumber numberWithDouble:self->_mycaction->var21.var0];
  [v4 encodeObject:v8 forKey:@"_sizeTargetReversed.width"];

  v9 = [NSNumber numberWithDouble:self->_mycaction->var21.var1];
  [v4 encodeObject:v9 forKey:@"_sizeTargetReversed.height"];

  v10 = [NSNumber numberWithDouble:self->_mycaction->var22.var0];
  [v4 encodeObject:v10 forKey:@"_sizeResidual.width"];

  v11 = [NSNumber numberWithDouble:self->_mycaction->var22.var1];
  [v4 encodeObject:v11 forKey:@"_sizeResidual.height"];

  v12 = [NSNumber numberWithBool:self->_mycaction->var23];
  [v4 encodeObject:v12 forKey:@"_isReversed"];

  v13 = [NSNumber numberWithBool:self->_mycaction->var24];
  [v4 encodeObject:v13 forKey:@"_isRelative"];

  v14 = [NSNumber numberWithBool:self->_mycaction->var25];
  [v4 encodeObject:v14 forKey:@"_useW"];

  v15 = [NSNumber numberWithBool:self->_mycaction->var26];
  [v4 encodeObject:v15 forKey:@"_useH"];
}

+ (id)resizeToWidth:(double)a3 duration:(double)a4
{
  objc_super v6 = objc_alloc_init(SKResize);
  mycaction = v6->_mycaction;
  float v8 = a3;
  mycaction->var20.var0 = v8;
  mycaction->var20.var1 = 0.0;
  mycaction->var21.var0 = v8;
  mycaction->var21.var1 = 0.0;
  *(_WORD *)&mycaction->var24 = 256;
  mycaction->var26 = 0;
  [(SKAction *)v6 setDuration:a4];

  return v6;
}

+ (id)resizeToWidth:(double)a3 height:(double)a4 duration:(double)a5
{
  float v8 = objc_alloc_init(SKResize);
  float v9 = a3;
  mycaction = v8->_mycaction;
  float v11 = a4;
  mycaction->var20.var0 = v9;
  mycaction->var20.var1 = v11;
  mycaction->var21.var0 = v9;
  mycaction->var21.var1 = v11;
  *(_WORD *)&mycaction->var24 = 256;
  mycaction->var26 = 1;
  [(SKAction *)v8 setDuration:a5];

  return v8;
}

+ (id)resizeToHeight:(double)a3 duration:(double)a4
{
  objc_super v6 = objc_alloc_init(SKResize);
  mycaction = v6->_mycaction;
  mycaction->var20.var0 = 0.0;
  float v8 = a3;
  mycaction->var20.var1 = v8;
  mycaction->var21.var0 = 0.0;
  mycaction->var21.var1 = v8;
  *(_WORD *)&mycaction->var24 = 0;
  mycaction->var26 = 1;
  [(SKAction *)v6 setDuration:a4];

  return v6;
}

+ (id)resizeByWidth:(double)a3 height:(double)a4 duration:(double)a5
{
  float v8 = objc_alloc_init(SKResize);
  mycaction = v8->_mycaction;
  float v10 = a3;
  float v11 = a4;
  mycaction->var20.var0 = v10;
  mycaction->var20.var1 = v11;
  mycaction->var21.var0 = -v10;
  mycaction->var21.var1 = -v11;
  *(_WORD *)&mycaction->var24 = 257;
  mycaction->var26 = 1;
  [(SKAction *)v8 setDuration:a5];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SKResize;
  id result = [(SKAction *)&v7 copyWithZone:a3];
  mycaction = self->_mycaction;
  uint64_t v6 = *((void *)result + 2);
  *(float *)(v6 + 112) = mycaction->var19;
  *($94F468A8D4C62B317260615823C2B210 *)(v6 + 116) = mycaction->var20;
  *($94F468A8D4C62B317260615823C2B210 *)(*((void *)result + 2) + 124) = self->_mycaction->var21;
  *($94F468A8D4C62B317260615823C2B210 *)(*((void *)result + 2) + 132) = self->_mycaction->var22;
  *(_DWORD *)(*((void *)result + 2) + 140) = *(_DWORD *)&self->_mycaction->var23;
  return result;
}

- (id)reversedAction
{
  uint64_t v3 = MEMORY[0x21052E6F0](self, a2);
  v10.receiver = self;
  v10.super_class = (Class)SKResize;
  id v4 = [(SKAction *)&v10 copyWithZone:v3];
  mycaction = self->_mycaction;
  uint64_t v6 = v4[2];
  *(float *)(v6 + 112) = mycaction->var19;
  *($94F468A8D4C62B317260615823C2B210 *)(v6 + 116) = mycaction->var21;
  *($94F468A8D4C62B317260615823C2B210 *)(v4[2] + 124) = self->_mycaction->var20;
  *($94F468A8D4C62B317260615823C2B210 *)(v4[2] + 132) = self->_mycaction->var22;
  objc_super v7 = self->_mycaction;
  uint64_t v8 = v4[2];
  *(unsigned char *)(v8 + 140) = !v7->var23;
  *(unsigned char *)(v8 + 141) = v7->var24;
  *(_WORD *)(v8 + 142) = *(_WORD *)&v7->var25;

  return v4;
}

@end