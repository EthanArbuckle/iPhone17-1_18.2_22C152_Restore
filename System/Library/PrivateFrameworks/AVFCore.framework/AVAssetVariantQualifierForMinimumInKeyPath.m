@interface AVAssetVariantQualifierForMinimumInKeyPath
+ (BOOL)supportsSecureCoding;
- (AVAssetVariantQualifierForMinimumInKeyPath)initWithCoder:(id)a3;
- (AVAssetVariantQualifierForMinimumInKeyPath)initWithFigAssetVariantQualifierForMinimumInKeyPath:(id)a3;
- (BOOL)_validateKeyPath:(id)a3;
- (id)_figAssetVariantQualifier;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AVAssetVariantQualifierForMinimumInKeyPath

- (BOOL)_validateKeyPath:(id)a3
{
  return [MEMORY[0x1E4F31AD0] validateKeyPathForMinMaxQualifiers:a3];
}

- (AVAssetVariantQualifierForMinimumInKeyPath)initWithFigAssetVariantQualifierForMinimumInKeyPath:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)AVAssetVariantQualifierForMinimumInKeyPath;
  v5 = [(AVAssetVariantQualifier *)&v17 initWithVariant:0];
  if (v5)
  {
    if (!-[AVAssetVariantQualifierForMinimumInKeyPath _validateKeyPath:](v5, "_validateKeyPath:", [a3 _keyPath]))
    {
      v7 = v5;
      v8 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v9 = *MEMORY[0x1E4F1C3C8];
      uint64_t v10 = [a3 _keyPath];
      v16 = (void *)[v8 exceptionWithName:v9, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v5, a2, @"invalid KeyPath entered: %@", v11, v12, v13, v14, v15, v10), 0 reason userInfo];
      objc_exception_throw(v16);
    }
    v5->_figAssetVariantQualifier = (FigAssetVariantQualifierForMinimumInKeyPathObjC *)a3;
  }
  return v5;
}

- (id)_figAssetVariantQualifier
{
  return self->_figAssetVariantQualifier;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [AVAssetVariantQualifierForMinimumInKeyPath alloc];
  figAssetVariantQualifier = self->_figAssetVariantQualifier;
  return [(AVAssetVariantQualifierForMinimumInKeyPath *)v4 initWithFigAssetVariantQualifierForMinimumInKeyPath:figAssetVariantQualifier];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVAssetVariantQualifierForMinimumInKeyPath;
  [(AVAssetVariantQualifier *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    uint64_t v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"supports only keyed archivers", v6, v7, v8, v9, v10, (uint64_t)v12.receiver), 0 reason userInfo];
    objc_exception_throw(v11);
  }
  v12.receiver = self;
  v12.super_class = (Class)AVAssetVariantQualifierForMinimumInKeyPath;
  [(AVAssetVariantQualifier *)&v12 encodeWithCoder:a3];
  [a3 encodeObject:self->_figAssetVariantQualifier forKey:@"keyPath"];
}

- (AVAssetVariantQualifierForMinimumInKeyPath)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    uint64_t v8 = self;
    uint64_t v14 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"supports only keyed archivers", v9, v10, v11, v12, v13, (uint64_t)v15.receiver), 0 reason userInfo];
    objc_exception_throw(v14);
  }
  v15.receiver = self;
  v15.super_class = (Class)AVAssetVariantQualifierForMinimumInKeyPath;
  uint64_t v6 = [(AVAssetVariantQualifier *)&v15 initWithCoder:a3];
  if (v6) {
    v6->_figAssetVariantQualifier = (FigAssetVariantQualifierForMinimumInKeyPathObjC *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"keyPath"];
  }
  return v6;
}

@end