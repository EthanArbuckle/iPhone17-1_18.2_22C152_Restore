@interface BWInferenceDataRequirement
- (BOOL)isEqual:(id)a3;
- (BWInferenceDataRequirement)init;
- (BWInferenceDataRequirement)initWithDataRequirement:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)identifier;
- (unint64_t)hash;
@end

@implementation BWInferenceDataRequirement

- (unint64_t)hash
{
  return self->_identifier;
}

- (BWInferenceDataRequirement)initWithDataRequirement:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BWInferenceDataRequirement;
  v4 = [(BWInferenceDataRequirement *)&v6 init];
  if (v4) {
    v4->_identifier = [a3 identifier];
  }
  return v4;
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (BWInferenceDataRequirement)init
{
  v3.receiver = self;
  v3.super_class = (Class)BWInferenceDataRequirement;
  result = [(BWInferenceDataRequirement *)&v3 init];
  if (result) {
    result->_identifier = atomic_fetch_add(&nextRequirementIdentifier, 1uLL);
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int64_t identifier = self->_identifier;
  return identifier == [a3 identifier];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@(%ld) %p>", objc_opt_class(), self->_identifier, self];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v4 initWithDataRequirement:self];
}

@end