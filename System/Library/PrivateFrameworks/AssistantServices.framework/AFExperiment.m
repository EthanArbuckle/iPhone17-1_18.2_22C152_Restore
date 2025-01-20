@interface AFExperiment
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFExperiment)init;
- (AFExperiment)initWithBuilder:(id)a3;
- (AFExperiment)initWithCoder:(id)a3;
- (AFExperiment)initWithConfigurationIdentifier:(id)a3 configurationVersion:(id)a4 deploymentGroupIdentifier:(id)a5 deploymentGroupProperties:(id)a6 deploymentReason:(int64_t)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFeatureGroupFourEnabled;
- (BOOL)isFeatureGroupOneEnabled;
- (BOOL)isFeatureGroupThreeEnabled;
- (BOOL)isFeatureGroupTwoEnabled;
- (BOOL)playsSessionInactiveSoundForSiriVOXSounds;
- (BOOL)playsSound;
- (BOOL)playsTwoShotSoundForSiriVOXSounds;
- (NSDictionary)deploymentGroupProperties;
- (NSString)configurationIdentifier;
- (NSString)configurationVersion;
- (NSString)deploymentGroupIdentifier;
- (NSString)description;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)mutatedCopyWithMutator:(id)a3;
- (int64_t)deploymentReason;
- (unint64_t)featureGroups;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)logExperimentExposureForInvocationFeedbacks;
- (void)logExperimentExposureForSiriVOXSounds;
- (void)logExperimentExposureForTapToSiriBehavior;
@end

@implementation AFExperiment

- (void)logExperimentExposureForSiriVOXSounds
{
  id v4 = +[AFAnalytics sharedAnalytics];
  v3 = AFAnalyticsContextCreateWithExperiment(self);
  [v4 logEventWithType:3401 context:v3];
}

- (BOOL)playsSessionInactiveSoundForSiriVOXSounds
{
  v2 = [(AFExperiment *)self deploymentGroupProperties];
  v3 = [v2 objectForKey:@"playsSessionInactiveSound"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)playsTwoShotSoundForSiriVOXSounds
{
  v2 = [(AFExperiment *)self deploymentGroupProperties];
  v3 = [v2 objectForKey:@"playsTwoShotSound"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deploymentGroupProperties, 0);
  objc_storeStrong((id *)&self->_deploymentGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_configurationVersion, 0);
  objc_storeStrong((id *)&self->_configurationIdentifier, 0);
}

- (int64_t)deploymentReason
{
  return self->_deploymentReason;
}

- (NSDictionary)deploymentGroupProperties
{
  return self->_deploymentGroupProperties;
}

- (NSString)deploymentGroupIdentifier
{
  return self->_deploymentGroupIdentifier;
}

- (NSString)configurationVersion
{
  return self->_configurationVersion;
}

- (NSString)configurationIdentifier
{
  return self->_configurationIdentifier;
}

- (void)encodeWithCoder:(id)a3
{
  configurationIdentifier = self->_configurationIdentifier;
  id v5 = a3;
  [v5 encodeObject:configurationIdentifier forKey:@"AFExperiment::configurationIdentifier"];
  [v5 encodeObject:self->_configurationVersion forKey:@"AFExperiment::configurationVersion"];
  [v5 encodeObject:self->_deploymentGroupIdentifier forKey:@"AFExperiment::deploymentGroupIdentifier"];
  [v5 encodeObject:self->_deploymentGroupProperties forKey:@"AFExperiment::deploymentGroupProperties"];
  id v6 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_deploymentReason];
  [v5 encodeObject:v6 forKey:@"AFExperiment::deploymentReason"];
}

- (AFExperiment)initWithCoder:(id)a3
{
  id v3 = a3;
  v23 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFExperiment::configurationIdentifier"];
  v22 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFExperiment::configurationVersion"];
  uint64_t v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFExperiment::deploymentGroupIdentifier"];
  v20 = (void *)MEMORY[0x1E4F1CAD0];
  v21 = (void *)v4;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  v14 = objc_msgSend(v20, "setWithObjects:", v5, v6, v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
  v15 = [v3 decodeObjectOfClasses:v14 forKey:@"AFExperiment::deploymentGroupProperties"];

  v16 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFExperiment::deploymentReason"];

  uint64_t v17 = [v16 integerValue];
  v18 = [(AFExperiment *)self initWithConfigurationIdentifier:v23 configurationVersion:v22 deploymentGroupIdentifier:v21 deploymentGroupProperties:v15 deploymentReason:v17];

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (AFExperiment *)a3;
  if (self == v4)
  {
    BOOL v15 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      int64_t deploymentReason = self->_deploymentReason;
      if (deploymentReason == [(AFExperiment *)v5 deploymentReason])
      {
        uint64_t v7 = [(AFExperiment *)v5 configurationIdentifier];
        configurationIdentifier = self->_configurationIdentifier;
        if (configurationIdentifier == v7
          || [(NSString *)configurationIdentifier isEqual:v7])
        {
          uint64_t v9 = [(AFExperiment *)v5 configurationVersion];
          configurationVersion = self->_configurationVersion;
          if (configurationVersion == v9 || [(NSString *)configurationVersion isEqual:v9])
          {
            uint64_t v11 = [(AFExperiment *)v5 deploymentGroupIdentifier];
            deploymentGroupIdentifier = self->_deploymentGroupIdentifier;
            if (deploymentGroupIdentifier == v11
              || [(NSString *)deploymentGroupIdentifier isEqual:v11])
            {
              uint64_t v13 = [(AFExperiment *)v5 deploymentGroupProperties];
              deploymentGroupProperties = self->_deploymentGroupProperties;
              BOOL v15 = deploymentGroupProperties == v13
                 || [(NSDictionary *)deploymentGroupProperties isEqual:v13];
            }
            else
            {
              BOOL v15 = 0;
            }
          }
          else
          {
            BOOL v15 = 0;
          }
        }
        else
        {
          BOOL v15 = 0;
        }
      }
      else
      {
        BOOL v15 = 0;
      }
    }
    else
    {
      BOOL v15 = 0;
    }
  }

  return v15;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_configurationIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_configurationVersion hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_deploymentGroupIdentifier hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSDictionary *)self->_deploymentGroupProperties hash];
  uint64_t v7 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_deploymentReason];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v15.receiver = self;
  v15.super_class = (Class)AFExperiment;
  NSUInteger v5 = [(AFExperiment *)&v15 description];
  configurationIdentifier = self->_configurationIdentifier;
  configurationVersion = self->_configurationVersion;
  deploymentGroupIdentifier = self->_deploymentGroupIdentifier;
  deploymentGroupProperties = self->_deploymentGroupProperties;
  unint64_t deploymentReason = self->_deploymentReason;
  if (deploymentReason > 2) {
    uint64_t v11 = @"(unknown)";
  }
  else {
    uint64_t v11 = off_1E5929348[deploymentReason];
  }
  uint64_t v12 = v11;
  uint64_t v13 = (void *)[v4 initWithFormat:@"%@ {configurationIdentifier = %@, configurationVersion = %@, deploymentGroupIdentifier = %@, deploymentGroupProperties = %@, deploymentReason = %@}", v5, configurationIdentifier, configurationVersion, deploymentGroupIdentifier, deploymentGroupProperties, v12];

  return v13;
}

- (NSString)description
{
  return (NSString *)[(AFExperiment *)self _descriptionWithIndent:0];
}

- (AFExperiment)initWithConfigurationIdentifier:(id)a3 configurationVersion:(id)a4 deploymentGroupIdentifier:(id)a5 deploymentGroupProperties:(id)a6 deploymentReason:(int64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __138__AFExperiment_initWithConfigurationIdentifier_configurationVersion_deploymentGroupIdentifier_deploymentGroupProperties_deploymentReason___block_invoke;
  v22[3] = &unk_1E5927670;
  id v23 = v12;
  id v24 = v13;
  id v25 = v14;
  id v26 = v15;
  int64_t v27 = a7;
  id v16 = v15;
  id v17 = v14;
  id v18 = v13;
  id v19 = v12;
  v20 = [(AFExperiment *)self initWithBuilder:v22];

  return v20;
}

void __138__AFExperiment_initWithConfigurationIdentifier_configurationVersion_deploymentGroupIdentifier_deploymentGroupProperties_deploymentReason___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  [v4 setConfigurationIdentifier:v3];
  [v4 setConfigurationVersion:a1[5]];
  [v4 setDeploymentGroupIdentifier:a1[6]];
  [v4 setDeploymentGroupProperties:a1[7]];
  [v4 setDeploymentReason:a1[8]];
}

- (AFExperiment)init
{
  return [(AFExperiment *)self initWithBuilder:0];
}

- (AFExperiment)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFExperimentMutation *))a3;
  v21.receiver = self;
  v21.super_class = (Class)AFExperiment;
  NSUInteger v5 = [(AFExperiment *)&v21 init];
  uint64_t v6 = v5;
  if (v4 && v5)
  {
    uint64_t v7 = [[_AFExperimentMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFExperimentMutation *)v7 isDirty])
    {
      unint64_t v8 = [(_AFExperimentMutation *)v7 getConfigurationIdentifier];
      uint64_t v9 = [v8 copy];
      configurationIdentifier = v6->_configurationIdentifier;
      v6->_configurationIdentifier = (NSString *)v9;

      uint64_t v11 = [(_AFExperimentMutation *)v7 getConfigurationVersion];
      uint64_t v12 = [v11 copy];
      configurationVersion = v6->_configurationVersion;
      v6->_configurationVersion = (NSString *)v12;

      id v14 = [(_AFExperimentMutation *)v7 getDeploymentGroupIdentifier];
      uint64_t v15 = [v14 copy];
      deploymentGroupIdentifier = v6->_deploymentGroupIdentifier;
      v6->_deploymentGroupIdentifier = (NSString *)v15;

      id v17 = [(_AFExperimentMutation *)v7 getDeploymentGroupProperties];
      uint64_t v18 = [v17 copy];
      deploymentGroupProperties = v6->_deploymentGroupProperties;
      v6->_deploymentGroupProperties = (NSDictionary *)v18;

      v6->_unint64_t deploymentReason = [(_AFExperimentMutation *)v7 getDeploymentReason];
    }
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)newWithBuilder:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBuilder:v3];

  return v4;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _AFExperimentMutation *))a3;
  if (v4)
  {
    NSUInteger v5 = [[_AFExperimentMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFExperimentMutation *)v5 isDirty])
    {
      uint64_t v6 = objc_alloc_init(AFExperiment);
      uint64_t v7 = [(_AFExperimentMutation *)v5 getConfigurationIdentifier];
      uint64_t v8 = [v7 copy];
      configurationIdentifier = v6->_configurationIdentifier;
      v6->_configurationIdentifier = (NSString *)v8;

      uint64_t v10 = [(_AFExperimentMutation *)v5 getConfigurationVersion];
      uint64_t v11 = [v10 copy];
      configurationVersion = v6->_configurationVersion;
      v6->_configurationVersion = (NSString *)v11;

      id v13 = [(_AFExperimentMutation *)v5 getDeploymentGroupIdentifier];
      uint64_t v14 = [v13 copy];
      deploymentGroupIdentifier = v6->_deploymentGroupIdentifier;
      v6->_deploymentGroupIdentifier = (NSString *)v14;

      id v16 = [(_AFExperimentMutation *)v5 getDeploymentGroupProperties];
      uint64_t v17 = [v16 copy];
      deploymentGroupProperties = v6->_deploymentGroupProperties;
      v6->_deploymentGroupProperties = (NSDictionary *)v17;

      v6->_unint64_t deploymentReason = [(_AFExperimentMutation *)v5 getDeploymentReason];
    }
    else
    {
      uint64_t v6 = (AFExperiment *)[(AFExperiment *)self copy];
    }
  }
  else
  {
    uint64_t v6 = (AFExperiment *)[(AFExperiment *)self copy];
  }

  return v6;
}

- (void)logExperimentExposureForTapToSiriBehavior
{
  id v4 = +[AFAnalytics sharedAnalytics];
  id v3 = AFAnalyticsContextCreateWithExperiment(self);
  [v4 logEventWithType:3402 context:v3];
}

- (BOOL)playsSound
{
  v2 = [(AFExperiment *)self deploymentGroupProperties];
  id v3 = [v2 objectForKey:@"playsSound"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)isFeatureGroupFourEnabled
{
  return ([(AFExperiment *)self featureGroups] >> 3) & 1;
}

- (BOOL)isFeatureGroupThreeEnabled
{
  return ([(AFExperiment *)self featureGroups] >> 2) & 1;
}

- (BOOL)isFeatureGroupTwoEnabled
{
  return ([(AFExperiment *)self featureGroups] >> 1) & 1;
}

- (BOOL)isFeatureGroupOneEnabled
{
  return [(AFExperiment *)self featureGroups] & 1;
}

- (void)logExperimentExposureForInvocationFeedbacks
{
  id v4 = +[AFAnalytics sharedAnalytics];
  id v3 = AFAnalyticsContextCreateWithExperiment(self);
  [v4 logEventWithType:3403 context:v3];
}

- (unint64_t)featureGroups
{
  v2 = [(AFExperiment *)self deploymentGroupProperties];
  id v3 = [v2 objectForKey:@"featureGroups"];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

@end