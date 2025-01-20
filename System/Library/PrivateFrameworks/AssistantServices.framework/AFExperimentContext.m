@interface AFExperimentContext
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFExperimentContext)init;
- (AFExperimentContext)initWithBuilder:(id)a3;
- (AFExperimentContext)initWithCoder:(id)a3;
- (AFExperimentContext)initWithExperimentsByConfigurationIdentifier:(id)a3;
- (AFExperimentForSiriVOXSounds)experimentForSiriVOXSounds;
- (AFExperimentForSiriVOXTapToSiriBehavior)experimentForSiriVOXTapToSiriBehavior;
- (AFInvocationFeedbackExperiment)invocationFeedbackExperiment;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)experimentsByConfigurationIdentifier;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFExperimentContext

- (AFExperimentForSiriVOXSounds)experimentForSiriVOXSounds
{
  v2 = [(AFExperimentContext *)self experimentsByConfigurationIdentifier];
  v3 = [v2 objectForKey:@"siri_vox_sounds_experiment"];

  return (AFExperimentForSiriVOXSounds *)v3;
}

- (void).cxx_destruct
{
}

- (NSDictionary)experimentsByConfigurationIdentifier
{
  return self->_experimentsByConfigurationIdentifier;
}

- (void)encodeWithCoder:(id)a3
{
}

- (AFExperimentContext)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v4, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  v9 = [v5 decodeObjectOfClasses:v8 forKey:@"AFExperimentContext::experimentsByConfigurationIdentifier"];

  v10 = [(AFExperimentContext *)self initWithExperimentsByConfigurationIdentifier:v9];
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (AFExperimentContext *)a3;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(AFExperimentContext *)v4 experimentsByConfigurationIdentifier];
      experimentsByConfigurationIdentifier = self->_experimentsByConfigurationIdentifier;
      BOOL v7 = experimentsByConfigurationIdentifier == v5
        || [(NSDictionary *)experimentsByConfigurationIdentifier isEqual:v5];
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  return [(NSDictionary *)self->_experimentsByConfigurationIdentifier hash];
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)AFExperimentContext;
  id v5 = [(AFExperimentContext *)&v8 description];
  uint64_t v6 = (void *)[v4 initWithFormat:@"%@ {experimentsByConfigurationIdentifier = %@}", v5, self->_experimentsByConfigurationIdentifier];

  return v6;
}

- (id)description
{
  return [(AFExperimentContext *)self _descriptionWithIndent:0];
}

- (AFExperimentContext)initWithExperimentsByConfigurationIdentifier:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__AFExperimentContext_initWithExperimentsByConfigurationIdentifier___block_invoke;
  v8[3] = &unk_1E5928F80;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = [(AFExperimentContext *)self initWithBuilder:v8];

  return v6;
}

uint64_t __68__AFExperimentContext_initWithExperimentsByConfigurationIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setExperimentsByConfigurationIdentifier:*(void *)(a1 + 32)];
}

- (AFExperimentContext)init
{
  return [(AFExperimentContext *)self initWithBuilder:0];
}

- (AFExperimentContext)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFExperimentContextMutation *))a3;
  v12.receiver = self;
  v12.super_class = (Class)AFExperimentContext;
  id v5 = [(AFExperimentContext *)&v12 init];
  uint64_t v6 = v5;
  if (v4 && v5)
  {
    BOOL v7 = [[_AFExperimentContextMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFExperimentContextMutation *)v7 isDirty])
    {
      objc_super v8 = [(_AFExperimentContextMutation *)v7 getExperimentsByConfigurationIdentifier];
      uint64_t v9 = [v8 copy];
      experimentsByConfigurationIdentifier = v6->_experimentsByConfigurationIdentifier;
      v6->_experimentsByConfigurationIdentifier = (NSDictionary *)v9;
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
  id v4 = (void (**)(id, _AFExperimentContextMutation *))a3;
  if (v4)
  {
    id v5 = [[_AFExperimentContextMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFExperimentContextMutation *)v5 isDirty])
    {
      uint64_t v6 = objc_alloc_init(AFExperimentContext);
      BOOL v7 = [(_AFExperimentContextMutation *)v5 getExperimentsByConfigurationIdentifier];
      uint64_t v8 = [v7 copy];
      experimentsByConfigurationIdentifier = v6->_experimentsByConfigurationIdentifier;
      v6->_experimentsByConfigurationIdentifier = (NSDictionary *)v8;
    }
    else
    {
      uint64_t v6 = (AFExperimentContext *)[(AFExperimentContext *)self copy];
    }
  }
  else
  {
    uint64_t v6 = (AFExperimentContext *)[(AFExperimentContext *)self copy];
  }

  return v6;
}

- (AFExperimentForSiriVOXTapToSiriBehavior)experimentForSiriVOXTapToSiriBehavior
{
  v2 = [(AFExperimentContext *)self experimentsByConfigurationIdentifier];
  id v3 = [v2 objectForKey:@"siri_vox_tap_to_siri_behavior_experiment"];

  return (AFExperimentForSiriVOXTapToSiriBehavior *)v3;
}

- (AFInvocationFeedbackExperiment)invocationFeedbackExperiment
{
  v2 = [(AFExperimentContext *)self experimentsByConfigurationIdentifier];
  id v3 = [v2 objectForKey:@"invocation_feedback_experiment"];

  return (AFInvocationFeedbackExperiment *)v3;
}

@end