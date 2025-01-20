@interface HKMCExperienceModel
+ (BOOL)supportsSecureCoding;
- (HKMCExperienceModel)initWithCoder:(id)a3;
- (HKMCExperienceModel)initWithPregnancyModeSetupCompletionSet:(id)a3;
- (NSSet)pregnancyModeSetupCompletionSet;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKMCExperienceModel

- (void).cxx_destruct
{
}

- (HKMCExperienceModel)initWithPregnancyModeSetupCompletionSet:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKMCExperienceModel;
  v5 = [(HKMCExperienceModel *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    pregnancyModeSetupCompletionSet = v5->_pregnancyModeSetupCompletionSet;
    v5->_pregnancyModeSetupCompletionSet = (NSSet *)v6;
  }
  return v5;
}

- (NSSet)pregnancyModeSetupCompletionSet
{
  return self->_pregnancyModeSetupCompletionSet;
}

- (HKMCExperienceModel)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKMCExperienceModel;
  v5 = [(HKMCExperienceModel *)&v10 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x263EFFA08], "hk_typesForSetOf:", objc_opt_class());
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"PregnancyModeSetupCompletionSet"];
    pregnancyModeSetupCompletionSet = v5->_pregnancyModeSetupCompletionSet;
    v5->_pregnancyModeSetupCompletionSet = (NSSet *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end