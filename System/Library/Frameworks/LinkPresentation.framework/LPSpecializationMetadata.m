@interface LPSpecializationMetadata
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
- (BOOL)_canDeferAsynchronousFieldsMetadataUpdateUntilCompletion;
- (BOOL)_disallowsURLOverrideByDelegate;
- (BOOL)_dummyPropertyForObservation;
- (LPSpecializationMetadata)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation LPSpecializationMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPSpecializationMetadata)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)LPSpecializationMetadata;
  return [(LPSpecializationMetadata *)&v4 init];
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

- (BOOL)_canDeferAsynchronousFieldsMetadataUpdateUntilCompletion
{
  return self->__canDeferAsynchronousFieldsMetadataUpdateUntilCompletion;
}

- (BOOL)_disallowsURLOverrideByDelegate
{
  return self->__disallowsURLOverrideByDelegate;
}

@end