@interface FigAssetVariantQualifierWithPredicateObjC
+ (BOOL)supportsSecureCoding;
- (FigAssetVariantQualifierWithPredicateObjC)initWithCoder:(id)a3;
- (FigAssetVariantQualifierWithPredicateObjC)initWithPredicate:(id)a3;
- (NSPredicate)_predicate;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FigAssetVariantQualifierWithPredicateObjC

- (FigAssetVariantQualifierWithPredicateObjC)initWithPredicate:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FigAssetVariantQualifierWithPredicateObjC;
  v4 = [(FigAssetVariantQualifierWithPredicateObjC *)&v6 init];
  if (v4) {
    v4->_predicate = (NSPredicate *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigAssetVariantQualifierWithPredicateObjC;
  [(FigAssetVariantQualifierWithPredicateObjC *)&v3 dealloc];
}

- (NSPredicate)_predicate
{
  return self->_predicate;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FigAssetVariantQualifierWithPredicateObjC;
  -[FigAssetVariantQualifierObjC encodeWithCoder:](&v5, sel_encodeWithCoder_);
  [a3 encodeObject:self->_predicate forKey:@"predicate"];
}

- (FigAssetVariantQualifierWithPredicateObjC)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FigAssetVariantQualifierWithPredicateObjC;
  v4 = -[FigAssetVariantQualifierObjC initWithCoder:](&v6, sel_initWithCoder_);
  FigLoadAVFDylib();
  if (v4) {
    v4->_predicate = (NSPredicate *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"predicate"];
  }
  return v4;
}

@end