@interface AFExperimentServerConfigurationInfo
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFExperimentServerConfigurationInfo)init;
- (AFExperimentServerConfigurationInfo)initWithBuilder:(id)a3;
- (AFExperimentServerConfigurationInfo)initWithCoder:(id)a3;
- (AFExperimentServerConfigurationInfo)initWithConfigurationIdentifier:(id)a3 configurationURL:(id)a4 maxTimeToSync:(double)a5;
- (AFExperimentServerConfigurationInfo)initWithDictionaryRepresentation:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)configurationIdentifier;
- (NSString)description;
- (NSURL)configurationURL;
- (double)maxTimeToSync;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)buildDictionaryRepresentation;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFExperimentServerConfigurationInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationURL, 0);
  objc_storeStrong((id *)&self->_configurationIdentifier, 0);
}

- (double)maxTimeToSync
{
  return self->_maxTimeToSync;
}

- (NSURL)configurationURL
{
  return self->_configurationURL;
}

- (NSString)configurationIdentifier
{
  return self->_configurationIdentifier;
}

- (id)buildDictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = v3;
  configurationIdentifier = self->_configurationIdentifier;
  if (configurationIdentifier) {
    [v3 setObject:configurationIdentifier forKey:@"configurationIdentifier"];
  }
  configurationURL = self->_configurationURL;
  if (configurationURL) {
    [v4 setObject:configurationURL forKey:@"configurationURL"];
  }
  v7 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_maxTimeToSync];
  [v4 setObject:v7 forKey:@"maxTimeToSync"];

  v8 = (void *)[v4 copy];
  return v8;
}

- (AFExperimentServerConfigurationInfo)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 objectForKey:@"configurationIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }

    v9 = [v5 objectForKey:@"configurationURL"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }

    v11 = [v5 objectForKey:@"maxTimeToSync"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }

    [v12 doubleValue];
    double v14 = v13;

    self = [(AFExperimentServerConfigurationInfo *)self initWithConfigurationIdentifier:v7 configurationURL:v10 maxTimeToSync:v14];
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  configurationIdentifier = self->_configurationIdentifier;
  id v5 = a3;
  [v5 encodeObject:configurationIdentifier forKey:@"AFExperimentServerConfigurationInfo::configurationIdentifier"];
  [v5 encodeObject:self->_configurationURL forKey:@"AFExperimentServerConfigurationInfo::configurationURL"];
  id v6 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_maxTimeToSync];
  [v5 encodeObject:v6 forKey:@"AFExperimentServerConfigurationInfo::maxTimeToSync"];
}

- (AFExperimentServerConfigurationInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFExperimentServerConfigurationInfo::configurationIdentifier"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFExperimentServerConfigurationInfo::configurationURL"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFExperimentServerConfigurationInfo::maxTimeToSync"];

  [v7 doubleValue];
  double v9 = v8;

  id v10 = [(AFExperimentServerConfigurationInfo *)self initWithConfigurationIdentifier:v5 configurationURL:v6 maxTimeToSync:v9];
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFExperimentServerConfigurationInfo *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      double maxTimeToSync = self->_maxTimeToSync;
      [(AFExperimentServerConfigurationInfo *)v5 maxTimeToSync];
      if (maxTimeToSync == v7)
      {
        double v9 = [(AFExperimentServerConfigurationInfo *)v5 configurationIdentifier];
        configurationIdentifier = self->_configurationIdentifier;
        if (configurationIdentifier == v9
          || [(NSString *)configurationIdentifier isEqual:v9])
        {
          v11 = [(AFExperimentServerConfigurationInfo *)v5 configurationURL];
          configurationURL = self->_configurationURL;
          BOOL v8 = configurationURL == v11 || [(NSURL *)configurationURL isEqual:v11];
        }
        else
        {
          BOOL v8 = 0;
        }
      }
      else
      {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_configurationIdentifier hash];
  uint64_t v4 = [(NSURL *)self->_configurationURL hash] ^ v3;
  id v5 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_maxTimeToSync];
  unint64_t v6 = v4 ^ [v5 hash];

  return v6;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)AFExperimentServerConfigurationInfo;
  id v5 = [(AFExperimentServerConfigurationInfo *)&v8 description];
  unint64_t v6 = (void *)[v4 initWithFormat:@"%@ {configurationIdentifier = %@, configurationURL = %@, maxTimeToSync = %f}", v5, self->_configurationIdentifier, self->_configurationURL, *(void *)&self->_maxTimeToSync];

  return v6;
}

- (NSString)description
{
  return (NSString *)[(AFExperimentServerConfigurationInfo *)self _descriptionWithIndent:0];
}

- (AFExperimentServerConfigurationInfo)initWithConfigurationIdentifier:(id)a3 configurationURL:(id)a4 maxTimeToSync:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __102__AFExperimentServerConfigurationInfo_initWithConfigurationIdentifier_configurationURL_maxTimeToSync___block_invoke;
  v14[3] = &unk_1E5929A20;
  id v15 = v8;
  id v16 = v9;
  double v17 = a5;
  id v10 = v9;
  id v11 = v8;
  id v12 = [(AFExperimentServerConfigurationInfo *)self initWithBuilder:v14];

  return v12;
}

void __102__AFExperimentServerConfigurationInfo_initWithConfigurationIdentifier_configurationURL_maxTimeToSync___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setConfigurationIdentifier:v3];
  [v4 setConfigurationURL:*(void *)(a1 + 40)];
  [v4 setMaxTimeToSync:*(double *)(a1 + 48)];
}

- (AFExperimentServerConfigurationInfo)init
{
  return [(AFExperimentServerConfigurationInfo *)self initWithBuilder:0];
}

- (AFExperimentServerConfigurationInfo)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFExperimentServerConfigurationInfoMutation *))a3;
  v16.receiver = self;
  v16.super_class = (Class)AFExperimentServerConfigurationInfo;
  id v5 = [(AFExperimentServerConfigurationInfo *)&v16 init];
  unint64_t v6 = v5;
  if (v4 && v5)
  {
    double v7 = [[_AFExperimentServerConfigurationInfoMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFExperimentServerConfigurationInfoMutation *)v7 isDirty])
    {
      id v8 = [(_AFExperimentServerConfigurationInfoMutation *)v7 getConfigurationIdentifier];
      uint64_t v9 = [v8 copy];
      configurationIdentifier = v6->_configurationIdentifier;
      v6->_configurationIdentifier = (NSString *)v9;

      id v11 = [(_AFExperimentServerConfigurationInfoMutation *)v7 getConfigurationURL];
      uint64_t v12 = [v11 copy];
      configurationURL = v6->_configurationURL;
      v6->_configurationURL = (NSURL *)v12;

      [(_AFExperimentServerConfigurationInfoMutation *)v7 getMaxTimeToSync];
      v6->_double maxTimeToSync = v14;
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
  id v4 = (void (**)(id, _AFExperimentServerConfigurationInfoMutation *))a3;
  if (v4)
  {
    id v5 = [[_AFExperimentServerConfigurationInfoMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFExperimentServerConfigurationInfoMutation *)v5 isDirty])
    {
      unint64_t v6 = objc_alloc_init(AFExperimentServerConfigurationInfo);
      double v7 = [(_AFExperimentServerConfigurationInfoMutation *)v5 getConfigurationIdentifier];
      uint64_t v8 = [v7 copy];
      configurationIdentifier = v6->_configurationIdentifier;
      v6->_configurationIdentifier = (NSString *)v8;

      id v10 = [(_AFExperimentServerConfigurationInfoMutation *)v5 getConfigurationURL];
      uint64_t v11 = [v10 copy];
      configurationURL = v6->_configurationURL;
      v6->_configurationURL = (NSURL *)v11;

      [(_AFExperimentServerConfigurationInfoMutation *)v5 getMaxTimeToSync];
      v6->_double maxTimeToSync = v13;
    }
    else
    {
      unint64_t v6 = (AFExperimentServerConfigurationInfo *)[(AFExperimentServerConfigurationInfo *)self copy];
    }
  }
  else
  {
    unint64_t v6 = (AFExperimentServerConfigurationInfo *)[(AFExperimentServerConfigurationInfo *)self copy];
  }

  return v6;
}

@end