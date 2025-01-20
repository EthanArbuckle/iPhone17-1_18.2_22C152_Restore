@interface IDSBassHarborCheckInMetric
- (IDSBassHarborCheckInMetric)initWithCohort:(id)a3;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)cohort;
- (NSString)name;
@end

@implementation IDSBassHarborCheckInMetric

- (IDSBassHarborCheckInMetric)initWithCohort:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSBassHarborCheckInMetric;
  v6 = [(IDSBassHarborCheckInMetric *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_cohort, a3);
  }

  return v7;
}

- (NSString)name
{
  return (NSString *)@"CohortCheckIn";
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = v3;
  cohort = self->_cohort;
  if (cohort) {
    CFDictionarySetValue(v3, @"cohort", cohort);
  }
  return (NSDictionary *)v4;
}

- (NSNumber)cohort
{
  return self->_cohort;
}

- (void).cxx_destruct
{
}

@end