@interface _BlastDoorLPSummarizedLinkMetadata
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
- (BOOL)isEqual:(id)a3;
- (_BlastDoorLPSummarizedLinkMetadata)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation _BlastDoorLPSummarizedLinkMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPSummarizedLinkMetadata)initWithCoder:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)_BlastDoorLPSummarizedLinkMetadata;
  v3 = [(_BlastDoorLPSummarizedLinkMetadata *)&v7 init];
  v4 = v3;
  if (v3) {
    v5 = v3;
  }

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = +[_BlastDoorLPSummarizedLinkMetadata allocWithZone:a3];
  v4 = v3;
  if (v3) {
    v5 = v3;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_BlastDoorLPSummarizedLinkMetadata;
  if ([(_BlastDoorLPSummarizedLinkMetadata *)&v7 isEqual:v4])
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

@end