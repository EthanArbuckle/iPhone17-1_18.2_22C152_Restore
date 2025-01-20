@interface HUIntrinsicSizeDescriptor
+ (HUIntrinsicSizeDescriptor)descriptorWithAspectRatio:(double)a3;
+ (HUIntrinsicSizeDescriptor)descriptorWithIntrinsicSize:(CGSize)a3 flexType:(unint64_t)a4;
+ (NAIdentity)na_identity;
+ (id)noIntrinsicSizeDescriptor;
- (BOOL)isEqual:(id)a3;
- (CGSize)intrinsicSize;
- (HUIntrinsicSizeDescriptor)initWithIntrinsicSize:(CGSize)a3 flexType:(unint64_t)a4 aspectRatio:(id)a5;
- (NSNumber)aspectRatio;
- (unint64_t)flexType;
- (unint64_t)hash;
@end

@implementation HUIntrinsicSizeDescriptor

+ (id)noIntrinsicSizeDescriptor
{
  id v2 = objc_alloc((Class)a1);
  v3 = objc_msgSend(v2, "initWithIntrinsicSize:flexType:aspectRatio:", 0, 0, *MEMORY[0x1E4F43ED8], *MEMORY[0x1E4F43ED8]);

  return v3;
}

+ (HUIntrinsicSizeDescriptor)descriptorWithAspectRatio:(double)a3
{
  id v4 = objc_alloc((Class)a1);
  double v5 = *MEMORY[0x1E4F43ED8];
  v6 = [NSNumber numberWithDouble:a3];
  v7 = objc_msgSend(v4, "initWithIntrinsicSize:flexType:aspectRatio:", 4, v6, v5, v5);

  return (HUIntrinsicSizeDescriptor *)v7;
}

+ (HUIntrinsicSizeDescriptor)descriptorWithIntrinsicSize:(CGSize)a3 flexType:(unint64_t)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = objc_alloc((Class)a1);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__HUIntrinsicSizeDescriptor_descriptorWithIntrinsicSize_flexType___block_invoke;
  v11[3] = &__block_descriptor_48_e15___NSNumber_8__0l;
  *(double *)&v11[4] = width;
  *(double *)&v11[5] = height;
  v8 = __66__HUIntrinsicSizeDescriptor_descriptorWithIntrinsicSize_flexType___block_invoke((uint64_t)v11);
  v9 = objc_msgSend(v7, "initWithIntrinsicSize:flexType:aspectRatio:", a4, v8, width, height);

  return (HUIntrinsicSizeDescriptor *)v9;
}

id __66__HUIntrinsicSizeDescriptor_descriptorWithIntrinsicSize_flexType___block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 32);
  if (v1 == *MEMORY[0x1E4F43ED8])
  {
    v3 = 0;
  }
  else
  {
    v3 = 0;
    double v4 = *(double *)(a1 + 40);
    if (v4 != *MEMORY[0x1E4F43ED8] && v4 > 0.0)
    {
      v3 = [NSNumber numberWithDouble:v1 / v4];
    }
  }

  return v3;
}

- (HUIntrinsicSizeDescriptor)initWithIntrinsicSize:(CGSize)a3 flexType:(unint64_t)a4 aspectRatio:(id)a5
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HUIntrinsicSizeDescriptor;
  v11 = [(HUIntrinsicSizeDescriptor *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_intrinsicSize.CGFloat width = width;
    v11->_intrinsicSize.CGFloat height = height;
    v11->_flexType = a4;
    objc_storeStrong((id *)&v11->_aspectRatio, a5);
  }

  return v12;
}

+ (NAIdentity)na_identity
{
  if (_MergedGlobals_623 != -1) {
    dispatch_once(&_MergedGlobals_623, &__block_literal_global_4);
  }
  id v2 = (void *)qword_1EBA47860;

  return (NAIdentity *)v2;
}

void __40__HUIntrinsicSizeDescriptor_na_identity__block_invoke_2()
{
  v0 = [MEMORY[0x1E4F7A0E0] builder];
  id v1 = (id)[v0 appendCGRectCharacteristic:&__block_literal_global_11];
  id v2 = (id)[v0 appendCharacteristic:&__block_literal_global_14];
  id v3 = (id)[v0 appendCharacteristic:&__block_literal_global_16_0];
  uint64_t v4 = [v0 build];

  double v5 = (void *)qword_1EBA47860;
  qword_1EBA47860 = v4;
}

double __40__HUIntrinsicSizeDescriptor_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  [a2 intrinsicSize];
  return v2;
}

uint64_t __40__HUIntrinsicSizeDescriptor_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  double v2 = NSNumber;
  uint64_t v3 = [a2 flexType];

  return [v2 numberWithUnsignedInteger:v3];
}

uint64_t __40__HUIntrinsicSizeDescriptor_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 aspectRatio];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  double v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

- (unint64_t)hash
{
  uint64_t v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

- (CGSize)intrinsicSize
{
  double width = self->_intrinsicSize.width;
  double height = self->_intrinsicSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (unint64_t)flexType
{
  return self->_flexType;
}

- (NSNumber)aspectRatio
{
  return self->_aspectRatio;
}

- (void).cxx_destruct
{
}

@end