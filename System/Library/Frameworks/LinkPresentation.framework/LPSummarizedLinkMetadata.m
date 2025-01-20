@interface LPSummarizedLinkMetadata
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3;
- (BOOL)isEqual:(id)a3;
- (LPSummarizedLinkMetadata)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)presentationPropertiesForTransformer:(id)a3;
- (unint64_t)hash;
@end

@implementation LPSummarizedLinkMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPSummarizedLinkMetadata)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)LPSummarizedLinkMetadata;
  v3 = [(LPSummarizedLinkMetadata *)&v7 init];
  v4 = v3;
  if (v3) {
    v5 = v3;
  }

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = +[LPSummarizedLinkMetadata allocWithZone:a3];
  v4 = v3;
  if (v3) {
    v5 = v3;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)LPSummarizedLinkMetadata;
  if ([(LPSummarizedLinkMetadata *)&v7 isEqual:v4])
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (unint64_t)hash
{
  return 0;
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)[MEMORY[0x1E4F1CAD0] set];
}

- (id)presentationPropertiesForTransformer:(id)a3
{
  v3 = [a3 unspecializedPresentationPropertiesForStyle:39];

  return v3;
}

- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3
{
  return a3 == 0;
}

@end