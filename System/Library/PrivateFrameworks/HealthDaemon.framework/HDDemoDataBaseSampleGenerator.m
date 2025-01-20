@interface HDDemoDataBaseSampleGenerator
+ (BOOL)supportsSecureCoding;
- (BOOL)_createdFromNSKeyedUnarchiver;
- (BOOL)createdFromNSKeyedUnarchiver;
- (HDDemoDataBaseSampleGenerator)init;
- (HDDemoDataBaseSampleGenerator)initWithCoder:(id)a3;
- (HDDemoDataGenerator)demoDataGenerator;
- (HDProfile)profile;
- (void)setDemoDataGenerationContextWithProfile:(id)a3 generatorState:(id)a4;
- (void)setDemoDataGenerator:(id)a3;
- (void)setProfile:(id)a3;
- (void)setupWithDemoDataGenerator:(id)a3;
@end

@implementation HDDemoDataBaseSampleGenerator

- (HDDemoDataBaseSampleGenerator)init
{
  v3.receiver = self;
  v3.super_class = (Class)HDDemoDataBaseSampleGenerator;
  result = [(HDDemoDataBaseSampleGenerator *)&v3 init];
  if (result) {
    result->_createdFromNSKeyedUnarchiver = 0;
  }
  return result;
}

- (BOOL)_createdFromNSKeyedUnarchiver
{
  return self->_createdFromNSKeyedUnarchiver;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDDemoDataBaseSampleGenerator)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HDDemoDataBaseSampleGenerator;
  result = [(HDDemoDataBaseSampleGenerator *)&v4 init];
  if (result) {
    result->_createdFromNSKeyedUnarchiver = 1;
  }
  return result;
}

- (void)setupWithDemoDataGenerator:(id)a3
{
}

- (void)setDemoDataGenerationContextWithProfile:(id)a3 generatorState:(id)a4
{
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  return (HDProfile *)WeakRetained;
}

- (void)setProfile:(id)a3
{
}

- (HDDemoDataGenerator)demoDataGenerator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_demoDataGenerator);

  return (HDDemoDataGenerator *)WeakRetained;
}

- (void)setDemoDataGenerator:(id)a3
{
}

- (BOOL)createdFromNSKeyedUnarchiver
{
  return self->_createdFromNSKeyedUnarchiver;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_demoDataGenerator);

  objc_destroyWeak((id *)&self->_profile);
}

@end