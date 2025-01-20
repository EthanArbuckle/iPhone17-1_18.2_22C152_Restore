@interface SKFollowPath
+ (BOOL)supportsSecureCoding;
+ (id)followPath:(CGPath *)a3 asOffset:(BOOL)a4 orientToPath:(BOOL)a5 duration:(double)a6;
+ (id)followPath:(CGPath *)a3 asOffset:(BOOL)a4 orientToPath:(BOOL)a5 speed:(double)a6;
+ (id)followPath:(CGPath *)a3 duration:(double)a4;
+ (id)followPath:(CGPath *)a3 speed:(double)a4;
- (SKFollowPath)init;
- (SKFollowPath)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)reversedAction;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SKFollowPath

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKFollowPath)init
{
  v3.receiver = self;
  v3.super_class = (Class)SKFollowPath;
  if ([(SKAction *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SKFollowPath;
  [(SKAction *)&v8 encodeWithCoder:v4];
  v5 = PKArrayFromCGPath();
  [v4 encodeObject:v5 forKey:@"_cgPath"];

  v6 = [NSNumber numberWithBool:self->_mycaction->var23];
  [v4 encodeObject:v6 forKey:@"_isOffset"];

  v7 = [NSNumber numberWithBool:self->_mycaction->var24];
  [v4 encodeObject:v7 forKey:@"_orient"];
}

- (SKFollowPath)initWithCoder:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SKFollowPath;
  if ([(SKAction *)&v6 initWithCoder:v4]) {
    operator new();
  }

  return 0;
}

+ (id)followPath:(CGPath *)a3 duration:(double)a4
{
  objc_super v6 = objc_alloc_init(SKFollowPath);
  v6->_cgPath = a3;
  CGPathRetain(a3);
  v6->_mycaction->var21 = (PKPath *)PKPathCreateFromCGPathWithOptions();
  *(_WORD *)&v6->_mycaction->var23 = 257;
  [(SKAction *)v6 setDuration:a4];

  return v6;
}

+ (id)followPath:(CGPath *)a3 asOffset:(BOOL)a4 orientToPath:(BOOL)a5 duration:(double)a6
{
  v10 = objc_alloc_init(SKFollowPath);
  v10->_cgPath = (CGPath *)MEMORY[0x21052E1E0](a3);
  v10->_mycaction->var21 = (PKPath *)PKPathCreateFromCGPathWithOptions();
  mycaction = v10->_mycaction;
  mycaction->var23 = a4;
  mycaction->var24 = a5;
  [(SKAction *)v10 setDuration:a6];

  return v10;
}

+ (id)followPath:(CGPath *)a3 speed:(double)a4
{
  objc_super v6 = objc_alloc_init(SKFollowPath);
  v6->_cgPath = a3;
  CGPathRetain(a3);
  uint64_t v7 = (float *)PKPathCreateFromCGPathWithOptions();
  v6->_mycaction->var21 = (PKPath *)v7;
  *(_WORD *)&v6->_mycaction->var23 = 257;
  float v8 = a4;
  float v9 = v8;
  double v10 = 3.40282347e38;
  if ((LODWORD(v9) & 0x80000000) == 0 && (LODWORD(v9) & 0x60000000) != 0) {
    double v10 = *v7 / a4;
  }
  [(SKAction *)v6 setDuration:v10];

  return v6;
}

+ (id)followPath:(CGPath *)a3 asOffset:(BOOL)a4 orientToPath:(BOOL)a5 speed:(double)a6
{
  double v10 = objc_alloc_init(SKFollowPath);
  v10->_cgPath = (CGPath *)MEMORY[0x21052E1E0](a3);
  v11 = (float *)PKPathCreateFromCGPathWithOptions();
  v10->_mycaction->var21 = (PKPath *)v11;
  mycaction = v10->_mycaction;
  mycaction->var23 = a4;
  mycaction->var24 = a5;
  float v13 = a6;
  float v14 = v13;
  double v15 = 3.40282347e38;
  if ((LODWORD(v14) & 0x80000000) == 0 && (LODWORD(v14) & 0x60000000) != 0) {
    double v15 = *v11 / a6;
  }
  [(SKAction *)v10 setDuration:v15];

  return v10;
}

- (void)dealloc
{
  cgPath = self->_cgPath;
  if (cgPath) {
    CGPathRelease(cgPath);
  }
  v4.receiver = self;
  v4.super_class = (Class)SKFollowPath;
  [(SKAction *)&v4 dealloc];
}

- (id)reversedAction
{
  objc_super v3 = [(SKAction *)self copy];
  if (*(void *)(v3[2] + 120))
  {
    if (self->_mycaction->var23) {
      operator new();
    }
    operator new();
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SKFollowPath;
  objc_super v4 = [(SKAction *)&v7 copyWithZone:a3];
  cgPath = self->_cgPath;
  v4[3] = cgPath;
  if (cgPath)
  {
    CGPathRetain(cgPath);
    operator new();
  }
  *(_WORD *)(v4[2] + 136) = *(_WORD *)&self->_mycaction->var23;
  return v4;
}

@end