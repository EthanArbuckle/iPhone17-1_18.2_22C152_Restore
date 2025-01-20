@interface _BlastDoorLPSpecializationMetadata
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
- (BOOL)_dummyPropertyForObservation;
- (_BlastDoorLPSpecializationMetadata)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation _BlastDoorLPSpecializationMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPSpecializationMetadata)initWithCoder:(id)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)_BlastDoorLPSpecializationMetadata;
  return [(_BlastDoorLPSpecializationMetadata *)&v4 init];
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  return v2;
}

- (BOOL)_dummyPropertyForObservation
{
  return self->__dummyPropertyForObservation;
}

@end