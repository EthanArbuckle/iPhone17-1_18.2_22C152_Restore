@interface FigAssetVariantQualifierObjC
+ (BOOL)supportsSecureCoding;
- (FigAssetVariantQualifierObjC)initWithCoder:(id)a3;
@end

@implementation FigAssetVariantQualifierObjC

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FigAssetVariantQualifierObjC)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FigAssetVariantQualifierObjC;
  return [(FigAssetVariantQualifierObjC *)&v4 init];
}

@end