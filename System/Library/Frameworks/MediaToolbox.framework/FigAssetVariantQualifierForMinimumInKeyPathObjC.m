@interface FigAssetVariantQualifierForMinimumInKeyPathObjC
+ (BOOL)supportsSecureCoding;
- (FigAssetVariantQualifierForMinimumInKeyPathObjC)initWithCoder:(id)a3;
- (FigAssetVariantQualifierForMinimumInKeyPathObjC)initWithKeyPath:(id)a3;
- (NSString)_keyPath;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FigAssetVariantQualifierForMinimumInKeyPathObjC

- (FigAssetVariantQualifierForMinimumInKeyPathObjC)initWithKeyPath:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FigAssetVariantQualifierForMinimumInKeyPathObjC;
  v4 = [(FigAssetVariantQualifierForMinimumInKeyPathObjC *)&v6 init];
  if (v4) {
    v4->_keyPath = (NSString *)a3;
  }
  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p, keyPath:%@>", NSStringFromClass(v4), self, self->_keyPath];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigAssetVariantQualifierForMinimumInKeyPathObjC;
  [(FigAssetVariantQualifierForMinimumInKeyPathObjC *)&v3 dealloc];
}

- (NSString)_keyPath
{
  return self->_keyPath;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FigAssetVariantQualifierForMinimumInKeyPathObjC;
  -[FigAssetVariantQualifierObjC encodeWithCoder:](&v5, sel_encodeWithCoder_);
  [a3 encodeObject:self->_keyPath forKey:@"keyPath"];
}

- (FigAssetVariantQualifierForMinimumInKeyPathObjC)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FigAssetVariantQualifierForMinimumInKeyPathObjC;
  v4 = -[FigAssetVariantQualifierObjC initWithCoder:](&v6, sel_initWithCoder_);
  if (v4) {
    v4->_keyPath = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"keyPath"];
  }
  return v4;
}

@end