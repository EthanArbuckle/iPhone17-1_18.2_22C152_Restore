@interface FigAssetVariantQualifierForMaximumInKeyPathObjC
+ (BOOL)supportsSecureCoding;
- (FigAssetVariantQualifierForMaximumInKeyPathObjC)initWithCoder:(id)a3;
- (FigAssetVariantQualifierForMaximumInKeyPathObjC)initWithKeyPath:(id)a3;
- (NSString)_keyPath;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FigAssetVariantQualifierForMaximumInKeyPathObjC

- (FigAssetVariantQualifierForMaximumInKeyPathObjC)initWithKeyPath:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FigAssetVariantQualifierForMaximumInKeyPathObjC;
  v4 = [(FigAssetVariantQualifierForMaximumInKeyPathObjC *)&v6 init];
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
  v3.super_class = (Class)FigAssetVariantQualifierForMaximumInKeyPathObjC;
  [(FigAssetVariantQualifierForMaximumInKeyPathObjC *)&v3 dealloc];
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
  v5.super_class = (Class)FigAssetVariantQualifierForMaximumInKeyPathObjC;
  -[FigAssetVariantQualifierObjC encodeWithCoder:](&v5, sel_encodeWithCoder_);
  [a3 encodeObject:self->_keyPath forKey:@"keyPath"];
}

- (FigAssetVariantQualifierForMaximumInKeyPathObjC)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FigAssetVariantQualifierForMaximumInKeyPathObjC;
  v4 = -[FigAssetVariantQualifierObjC initWithCoder:](&v6, sel_initWithCoder_);
  if (v4) {
    v4->_keyPath = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"keyPath"];
  }
  return v4;
}

@end