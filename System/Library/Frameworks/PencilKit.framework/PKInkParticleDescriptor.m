@interface PKInkParticleDescriptor
+ (PKInkParticleDescriptor)particleDescriptorWithName:(id)a3 particleSpacing:(double)a4 particleCount:(int64_t)a5 particleSize:(CGSize)a6 particleRotation:(unint64_t)a7;
+ (PKInkParticleDescriptor)particleDescriptorWithName:(id)a3 texture:(CGImage *)a4 particleSpacing:(double)a5 particleCount:(int64_t)a6 particleSize:(CGSize)a7 particleRotation:(unint64_t)a8;
+ (id)arrayFromVector:()vector<double;
- (BOOL)adjustEndCapParticleAlpha;
- (BOOL)initialRandomRotation;
- (BOOL)maskInitialRandomOffset;
- (CGImage)maskTextureImage;
- (CGImage)textureImage;
- (CGSize)particleSize;
- (NSString)maskTextureName;
- (NSString)textureName;
- (PKInkParticleDescriptor)initWithTextureName:(id)a3 textureImage:(CGImage *)a4 maskTextureName:(id)a5 maskTextureImage:(CGImage *)a6 particleSpacing:(double)a7 particleCount:(int64_t)a8 particleSize:(CGSize)a9 particleRotation:(unint64_t)a10 maskScale:(double)a11 maskScaleConstant:(double)a12 maskMovement:(double)a13 maskDepth:(double)a14 initialRandomRotation:(BOOL)a15 maskInitialRandomOffset:(BOOL)a16 adjustEndCapParticleAlpha:(BOOL)a17 particleBlendMode:(unint64_t)a18;
- (double)dynamicStep;
- (double)maskDepth;
- (double)maskMovement;
- (double)maskScale;
- (double)maskScaleConstant;
- (double)particleSpacing;
- (double)particleSpacingForRadius:(double)a3;
- (id).cxx_construct;
- (id)mutableCopy;
- (id)particleSpacingInkFunction;
- (int64_t)particleCount;
- (unint64_t)particleBlendMode;
- (unint64_t)particleRotation;
- (void)particleSpacingFunction;
- (void)setAdjustEndCapParticleAlpha:(BOOL)a3;
- (void)setDynamicStep:(double)a3;
- (void)setInitialRandomRotation:(BOOL)a3;
- (void)setMaskDepth:(double)a3;
- (void)setMaskInitialRandomOffset:(BOOL)a3;
- (void)setMaskMovement:(double)a3;
- (void)setMaskScale:(double)a3;
- (void)setMaskScaleConstant:(double)a3;
- (void)setMaskTextureImage:(CGImage *)a3;
- (void)setMaskTextureName:(id)a3;
- (void)setParticleBlendMode:(unint64_t)a3;
- (void)setParticleCount:(int64_t)a3;
- (void)setParticleRotation:(unint64_t)a3;
- (void)setParticleSize:(CGSize)a3;
- (void)setParticleSpacing:(double)a3;
- (void)setParticleSpacingFunction:()unique_ptr<PKFunction;
- (void)setParticleSpacingInkFunction:(id)a3;
- (void)setTextureImage:(CGImage *)a3;
- (void)setTextureName:(id)a3;
@end

@implementation PKInkParticleDescriptor

- (PKInkParticleDescriptor)initWithTextureName:(id)a3 textureImage:(CGImage *)a4 maskTextureName:(id)a5 maskTextureImage:(CGImage *)a6 particleSpacing:(double)a7 particleCount:(int64_t)a8 particleSize:(CGSize)a9 particleRotation:(unint64_t)a10 maskScale:(double)a11 maskScaleConstant:(double)a12 maskMovement:(double)a13 maskDepth:(double)a14 initialRandomRotation:(BOOL)a15 maskInitialRandomOffset:(BOOL)a16 adjustEndCapParticleAlpha:(BOOL)a17 particleBlendMode:(unint64_t)a18
{
  CGFloat height = a9.height;
  CGFloat width = a9.width;
  id v32 = a3;
  id v33 = a5;
  v37.receiver = self;
  v37.super_class = (Class)PKInkParticleDescriptor;
  v34 = [(PKInkParticleDescriptor *)&v37 init];
  v35 = v34;
  if (v34)
  {
    objc_storeStrong((id *)&v34->_textureName, a3);
    v35->_textureImage = a4;
    objc_storeStrong((id *)&v35->_maskTextureName, a5);
    v35->_maskTextureImage = a6;
    v35->_particleSpacing = a7;
    v35->_particleSize.CGFloat width = width;
    v35->_particleSize.CGFloat height = height;
    v35->_particleCount = a8;
    v35->_particleRotation = a10;
    v35->_maskScale = a11;
    v35->_maskScaleConstant = a12;
    v35->_maskMovement = a13;
    v35->_maskDepth = a14;
    v35->_initialRandomRotation = a15;
    v35->_maskInitialRandomOffset = a16;
    v35->_adjustEndCapParticleAlpha = a17;
    v35->_particleBlendMode = a18;
  }

  return v35;
}

- (id)mutableCopy
{
  v3 = [PKInkParticleDescriptor alloc];
  *(_WORD *)((char *)&v5 + 1) = *(_WORD *)&self->_maskInitialRandomOffset;
  LOBYTE(v5) = self->_initialRandomRotation;
  return -[PKInkParticleDescriptor initWithTextureName:textureImage:maskTextureName:maskTextureImage:particleSpacing:particleCount:particleSize:particleRotation:maskScale:maskScaleConstant:maskMovement:maskDepth:initialRandomRotation:maskInitialRandomOffset:adjustEndCapParticleAlpha:particleBlendMode:](v3, "initWithTextureName:textureImage:maskTextureName:maskTextureImage:particleSpacing:particleCount:particleSize:particleRotation:maskScale:maskScaleConstant:maskMovement:maskDepth:initialRandomRotation:maskInitialRandomOffset:adjustEndCapParticleAlpha:particleBlendMode:", self->_textureName, self->_textureImage, self->_maskTextureName, self->_maskTextureImage, self->_particleCount, self->_particleRotation, self->_particleSpacing, self->_particleSize.width, self->_particleSize.height, self->_maskScale, self->_maskScaleConstant, self->_maskMovement, self->_maskDepth, v5, self->_particleBlendMode);
}

+ (PKInkParticleDescriptor)particleDescriptorWithName:(id)a3 particleSpacing:(double)a4 particleCount:(int64_t)a5 particleSize:(CGSize)a6 particleRotation:(unint64_t)a7
{
  double height = a6.height;
  double width = a6.width;
  id v12 = a3;
  v13 = objc_alloc_init(PKInkParticleDescriptor);
  [(PKInkParticleDescriptor *)v13 setTextureName:v12];
  [(PKInkParticleDescriptor *)v13 setParticleSpacing:a4];
  [(PKInkParticleDescriptor *)v13 setParticleCount:a5];
  -[PKInkParticleDescriptor setParticleSize:](v13, "setParticleSize:", width, height);
  [(PKInkParticleDescriptor *)v13 setParticleRotation:a7];

  return v13;
}

+ (PKInkParticleDescriptor)particleDescriptorWithName:(id)a3 texture:(CGImage *)a4 particleSpacing:(double)a5 particleCount:(int64_t)a6 particleSize:(CGSize)a7 particleRotation:(unint64_t)a8
{
  double height = a7.height;
  double width = a7.width;
  id v14 = a3;
  v15 = objc_alloc_init(PKInkParticleDescriptor);
  [(PKInkParticleDescriptor *)v15 setTextureImage:a4];
  [(PKInkParticleDescriptor *)v15 setTextureName:v14];
  [(PKInkParticleDescriptor *)v15 setParticleSpacing:a5];
  [(PKInkParticleDescriptor *)v15 setParticleCount:a6];
  -[PKInkParticleDescriptor setParticleSize:](v15, "setParticleSize:", width, height);
  [(PKInkParticleDescriptor *)v15 setParticleRotation:a8];

  return v15;
}

- (double)particleSpacingForRadius:(double)a3
{
  [(PKInkParticleDescriptor *)self particleSpacing];
  double v6 = v5;
  if (*(void *)[(PKInkParticleDescriptor *)self particleSpacingFunction])
  {
    v7 = [(PKInkParticleDescriptor *)self particleSpacingFunction];
    double v8 = (**(double (***)(void, double, double))*v7)(*v7, a3, 0.0);
    [(PKInkParticleDescriptor *)self particleSpacing];
    return v8 * v9;
  }
  return v6;
}

- (void)setParticleSpacingFunction:()unique_ptr<PKFunction
{
  v4 = *(PKFunction **)a3.__ptr_.__value_;
  *(void *)a3.__ptr_.__value_ = 0;
  value = self->_particleSpacingFunction.__ptr_.__value_;
  self->_particleSpacingFunction.__ptr_.__value_ = v4;
  if (value) {
    (*(void (**)(void))(*(void *)value + 40))();
  }
}

- (void)particleSpacingFunction
{
  return &self->_particleSpacingFunction;
}

- (id)particleSpacingInkFunction
{
  value = self->_particleSpacingFunction.__ptr_.__value_;
  if (value)
  {
    v3 = objc_opt_class();
    v15 = 0;
    uint64_t v16 = 0;
    __p = 0;
    std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&__p, *((const void **)value + 7), *((void *)value + 8), (uint64_t)(*((void *)value + 8) - *((void *)value + 7)) >> 3);
    v4 = [v3 arrayFromVector:&__p];
    if (__p)
    {
      v15 = __p;
      operator delete(__p);
    }
    double v5 = objc_opt_class();
    v11 = 0;
    id v12 = 0;
    uint64_t v13 = 0;
    std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v11, *((const void **)value + 10), *((void *)value + 11), (uint64_t)(*((void *)value + 11) - *((void *)value + 10)) >> 3);
    double v6 = [v5 arrayFromVector:&v11];
    if (v11)
    {
      id v12 = v11;
      operator delete(v11);
    }
    v7 = [[PKInkFunction alloc] initWithInputPoints:v4 outputPoints:v6 functionType:1];
  }
  else
  {
    double v8 = [PKInkFunction alloc];
    v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:", &unk_1F200E490, &unk_1F200E4A8, 0);
    double v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:", &unk_1F200E490, &unk_1F200E490, 0);
    v7 = [(PKInkFunction *)v8 initWithInputPoints:v4 outputPoints:v9 functionType:1];
  }

  return v7;
}

+ (id)arrayFromVector:()vector<double
{
  v4 = [MEMORY[0x1E4F1CA48] array];
  begin = a3->__begin_;
  if (a3->__end_ != a3->__begin_)
  {
    unint64_t v6 = 0;
    do
    {
      v7 = [NSNumber numberWithDouble:begin[v6]];
      [v4 addObject:v7];

      ++v6;
      begin = a3->__begin_;
    }
    while (v6 < a3->__end_ - a3->__begin_);
  }

  return v4;
}

- (void)setParticleSpacingInkFunction:(id)a3
{
}

- (BOOL)adjustEndCapParticleAlpha
{
  return self->_adjustEndCapParticleAlpha;
}

- (void)setAdjustEndCapParticleAlpha:(BOOL)a3
{
  self->_adjustEndCapParticleAlpha = a3;
}

- (void)setDynamicStep:(double)a3
{
  self->_dynamicStep = a3;
}

- (double)dynamicStep
{
  return self->_dynamicStep;
}

- (NSString)textureName
{
  return self->_textureName;
}

- (void)setTextureName:(id)a3
{
}

- (CGImage)textureImage
{
  return self->_textureImage;
}

- (void)setTextureImage:(CGImage *)a3
{
}

- (NSString)maskTextureName
{
  return self->_maskTextureName;
}

- (void)setMaskTextureName:(id)a3
{
}

- (CGImage)maskTextureImage
{
  return self->_maskTextureImage;
}

- (void)setMaskTextureImage:(CGImage *)a3
{
}

- (double)particleSpacing
{
  return self->_particleSpacing;
}

- (void)setParticleSpacing:(double)a3
{
  self->_particleSpacing = a3;
}

- (int64_t)particleCount
{
  return self->_particleCount;
}

- (void)setParticleCount:(int64_t)a3
{
  self->_particleCount = a3;
}

- (CGSize)particleSize
{
  double width = self->_particleSize.width;
  double height = self->_particleSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setParticleSize:(CGSize)a3
{
  self->_particleSize = a3;
}

- (unint64_t)particleRotation
{
  return self->_particleRotation;
}

- (void)setParticleRotation:(unint64_t)a3
{
  self->_particleRotation = a3;
}

- (double)maskScale
{
  return self->_maskScale;
}

- (void)setMaskScale:(double)a3
{
  self->_maskScale = a3;
}

- (double)maskScaleConstant
{
  return self->_maskScaleConstant;
}

- (void)setMaskScaleConstant:(double)a3
{
  self->_maskScaleConstant = a3;
}

- (double)maskMovement
{
  return self->_maskMovement;
}

- (void)setMaskMovement:(double)a3
{
  self->_maskMovement = a3;
}

- (double)maskDepth
{
  return self->_maskDepth;
}

- (void)setMaskDepth:(double)a3
{
  self->_maskDepth = a3;
}

- (BOOL)initialRandomRotation
{
  return self->_initialRandomRotation;
}

- (void)setInitialRandomRotation:(BOOL)a3
{
  self->_initialRandomRotation = a3;
}

- (BOOL)maskInitialRandomOffset
{
  return self->_maskInitialRandomOffset;
}

- (void)setMaskInitialRandomOffset:(BOOL)a3
{
  self->_maskInitialRandomOffset = a3;
}

- (unint64_t)particleBlendMode
{
  return self->_particleBlendMode;
}

- (void)setParticleBlendMode:(unint64_t)a3
{
  self->_particleBlendMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskTextureName, 0);
  objc_storeStrong((id *)&self->_textureName, 0);
  value = self->_particleSpacingFunction.__ptr_.__value_;
  self->_particleSpacingFunction.__ptr_.__value_ = 0;
  if (value)
  {
    v4 = *(void (**)(void))(*(void *)value + 40);
    v4();
  }
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  return self;
}

@end