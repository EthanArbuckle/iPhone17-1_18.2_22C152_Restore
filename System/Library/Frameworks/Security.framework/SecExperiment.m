@interface SecExperiment
- (BOOL)experimentIsAllowedForProcess;
- (BOOL)isSamplingDisabled;
- (BOOL)isSamplingDisabledWithDefault:(BOOL)a3;
- (BOOL)samplingDisabled;
- (NSString)identifier;
- (NSString)name;
- (SecExperiment)initWithName:(const char *)a3;
- (SecExperimentConfig)cachedConfig;
- (id)copyExperimentConfiguration;
- (id)copyExperimentConfigurationFromUserDefaults;
- (id)copyRandomExperimentConfigurationFromAsset:(id)a3;
- (id)copyRemoteExperimentAsset;
- (void)setCachedConfig:(id)a3;
- (void)setName:(id)a3;
- (void)setSamplingDisabled:(BOOL)a3;
@end

@implementation SecExperiment

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedConfig, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setCachedConfig:(id)a3
{
}

- (SecExperimentConfig)cachedConfig
{
  return (SecExperimentConfig *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSamplingDisabled:(BOOL)a3
{
  self->_samplingDisabled = a3;
}

- (BOOL)samplingDisabled
{
  return self->_samplingDisabled;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)identifier
{
  v3 = [(SecExperiment *)self cachedConfig];

  if (v3)
  {
    v4 = [(SecExperiment *)self cachedConfig];
    v5 = [v4 identifier];
  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

- (id)copyExperimentConfiguration
{
  v3 = [(SecExperiment *)self cachedConfig];

  if (v3)
  {
    [(SecExperiment *)self cachedConfig];
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = [(SecExperiment *)self copyExperimentConfigurationFromUserDefaults];
    if (v5)
    {
      v6 = [[SecExperimentConfig alloc] initWithConfiguration:v5];
      [(SecExperiment *)self setCachedConfig:v6];

      v4 = [(SecExperiment *)self cachedConfig];
    }
    else
    {
      id v7 = [(SecExperiment *)self copyRemoteExperimentAsset];
      if (v7)
      {
        id v8 = [(SecExperiment *)self copyRandomExperimentConfigurationFromAsset:v7];
        v9 = [[SecExperimentConfig alloc] initWithConfiguration:v8];
        [(SecExperiment *)self setCachedConfig:v9];

        v4 = [(SecExperiment *)self cachedConfig];
      }
      else
      {
        v4 = 0;
      }
    }
  }
  return v4;
}

- (id)copyRandomExperimentConfigurationFromAsset:(id)a3
{
  v3 = [a3 valueForKey:@"ConfigArray"];
  if (v3)
  {
    v4 = objc_msgSend(v3, "objectAtIndex:", arc4random() % (unint64_t)objc_msgSend(v3, "count"));
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)copyRemoteExperimentAsset
{
  CFTypeRef cf = 0;
  v3 = (void *)SecTrustOTASecExperimentCopyAsset(&cf);
  if (v3)
  {
    v4 = [(SecExperiment *)self name];
    id v5 = [v3 valueForKey:v4];
  }
  else
  {
    id v5 = 0;
  }
  CFTypeRef v6 = cf;
  if (cf)
  {
    CFTypeRef cf = 0;
    CFRelease(v6);
  }

  return v5;
}

- (id)copyExperimentConfigurationFromUserDefaults
{
  v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  if (v3)
  {
    v4 = [NSString stringWithUTF8String:kSecExperimentDefaultsDomain];
    id v5 = [v3 persistentDomainForName:v4];
    CFTypeRef v6 = (void *)[v5 mutableCopy];

    if (v6)
    {
      id v7 = [(SecExperiment *)self name];
      id v8 = [v6 objectForKeyedSubscript:v7];

      if (v8)
      {
        id v8 = [v6 objectForKeyedSubscript:v7];
      }
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (BOOL)isSamplingDisabled
{
  BOOL v3 = [(SecExperiment *)self samplingDisabled];

  return [(SecExperiment *)self isSamplingDisabledWithDefault:v3];
}

- (BOOL)isSamplingDisabledWithDefault:(BOOL)a3
{
  v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  if (v4)
  {
    id v5 = [NSString stringWithUTF8String:kSecExperimentDefaultsDomain];
    CFTypeRef v6 = [v4 persistentDomainForName:v5];
    id v7 = (void *)[v6 mutableCopy];

    if (v7)
    {
      id v8 = [NSString stringWithUTF8String:"disableSampling"];
      v9 = [v7 objectForKeyedSubscript:v8];

      if (v9)
      {
        v10 = [v7 objectForKeyedSubscript:v8];
        a3 = [v10 BOOLValue];
      }
    }
  }
  return a3;
}

- (BOOL)experimentIsAllowedForProcess
{
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3032000000;
  v5[3] = __Block_byref_object_copy_;
  v5[4] = __Block_byref_object_dispose_;
  id v6 = &unk_1ED86CB40;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__SecExperiment_experimentIsAllowedForProcess__block_invoke;
  block[3] = &unk_1E5484FA0;
  block[4] = v5;
  if (experimentIsAllowedForProcess_onceToken != -1) {
    dispatch_once(&experimentIsAllowedForProcess_onceToken, block);
  }
  char v2 = experimentIsAllowedForProcess_isAllowed;
  _Block_object_dispose(v5, 8);

  return v2;
}

void __46__SecExperiment_experimentIsAllowedForProcess__block_invoke()
{
  if (!csops()) {
    experimentIsAllowedForProcess_isAllowed = 1;
  }
}

uint64_t __46__SecExperiment_experimentIsAllowedForProcess__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 isEqualToString:*(void *)(a1 + 32)];
  if (result)
  {
    experimentIsAllowedForProcess_isAllowed = 1;
    *a4 = 1;
  }
  return result;
}

- (SecExperiment)initWithName:(const char *)a3
{
  BOOL v3 = (SecExperiment *)a3;
  if (a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)SecExperiment;
    self = [(SecExperiment *)&v7 init];
    if (self)
    {
      v4 = self;
      id v5 = [NSString stringWithUTF8String:v3];
      [(SecExperiment *)v4 setName:v5];

      self = v4;
      BOOL v3 = self;
    }
    else
    {
      BOOL v3 = 0;
    }
  }

  return v3;
}

@end