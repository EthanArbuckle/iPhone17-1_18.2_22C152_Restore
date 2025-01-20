@interface HDMinorExperiencesProfileExtension
- (HDMinorExperiencesProfileExtension)initWithProfile:(id)a3;
- (id)featureAvailabilityExtensionForFeatureIdentifier:(id)a3;
@end

@implementation HDMinorExperiencesProfileExtension

- (HDMinorExperiencesProfileExtension)initWithProfile:(id)a3
{
  v14[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HDMinorExperiencesProfileExtension;
  v5 = [(HDMinorExperiencesProfileExtension *)&v13 init];
  if (v5)
  {
    v6 = [[HDExampleFeatureProfileExtension alloc] initWithProfile:v4];
    v14[0] = v6;
    v7 = [[HDGlucoseExperienceProfileExtension alloc] initWithProfile:v4];
    v14[1] = v7;
    v8 = [[HDRespiratoryRateMeasurementsProfileExtension alloc] initWithProfile:v4];
    v14[2] = v8;
    v9 = [[HDWristTemperatureMeasurementsProfileExtension alloc] initWithProfile:v4];
    v14[3] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:4];
    minorExperiences = v5->_minorExperiences;
    v5->_minorExperiences = (NSArray *)v10;
  }
  return v5;
}

- (id)featureAvailabilityExtensionForFeatureIdentifier:(id)a3
{
  id v4 = a3;
  minorExperiences = self->_minorExperiences;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __87__HDMinorExperiencesProfileExtension_featureAvailabilityExtensionForFeatureIdentifier___block_invoke;
  v10[3] = &unk_1E62F9158;
  id v11 = v4;
  id v6 = v4;
  v7 = [(NSArray *)minorExperiences hk_map:v10];
  v8 = [v7 firstObject];

  return v8;
}

uint64_t __87__HDMinorExperiencesProfileExtension_featureAvailabilityExtensionForFeatureIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 featureAvailabilityExtensionForFeatureIdentifier:*(void *)(a1 + 32)];
}

- (void).cxx_destruct
{
}

@end