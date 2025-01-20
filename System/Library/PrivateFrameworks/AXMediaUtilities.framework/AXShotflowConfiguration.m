@interface AXShotflowConfiguration
- (AXShotflowConfiguration)initWithURL:(id)a3;
- (NSArray)defaultBoxesSidesNormalized;
- (NSArray)filterThresholds;
- (NSArray)ratios;
- (NSNumber)networkThreshold;
- (NSNumber)nmsThreshold;
- (id)description;
@end

@implementation AXShotflowConfiguration

- (AXShotflowConfiguration)initWithURL:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)AXShotflowConfiguration;
  v5 = [(AXShotflowConfiguration *)&v21 init];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v4];
    filterThresholds = v5->_filterThresholds;
    v5->_filterThresholds = (NSArray *)&unk_1F0E942D8;

    networkThreshold = v5->_networkThreshold;
    v5->_networkThreshold = (NSNumber *)&unk_1F0E94010;

    nmsThreshold = v5->_nmsThreshold;
    v5->_nmsThreshold = (NSNumber *)&unk_1F0E93FE0;

    defaultBoxesSidesNormalized = v5->_defaultBoxesSidesNormalized;
    v5->_defaultBoxesSidesNormalized = (NSArray *)&unk_1F0E942F0;

    ratios = v5->_ratios;
    v5->_ratios = (NSArray *)&unk_1F0E94308;

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = [v6 objectForKey:@"filterThresholds"];
      id obj = [v6 objectForKey:@"networkThreshold"];
      id v19 = [v6 objectForKey:@"nmsThreshold"];
      id v18 = [v6 objectForKey:@"defaultBoxesSidesNormalized"];
      v13 = [v6 objectForKey:@"ratios"];
      if (__38__AXMindNetConfiguration_initWithURL___block_invoke((uint64_t)v13, v12))
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_opt_class();
          uint64_t isKindOfClass = objc_opt_isKindOfClass();
          if (isKindOfClass)
          {
            BOOL v15 = __38__AXMindNetConfiguration_initWithURL___block_invoke(isKindOfClass, v18);
            if (v15 && __38__AXMindNetConfiguration_initWithURL___block_invoke(v15, v13))
            {
              objc_storeStrong((id *)&v5->_filterThresholds, v12);
              objc_storeStrong((id *)&v5->_networkThreshold, obj);
              objc_storeStrong((id *)&v5->_nmsThreshold, v19);
              objc_storeStrong((id *)&v5->_defaultBoxesSidesNormalized, v18);
              objc_storeStrong((id *)&v5->_ratios, v13);
            }
          }
        }
      }
    }
    v16 = v5;
  }
  return v5;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"filterThresholds: %@\nnetworkThreshold: %@\nnmsThreshold: %@\ndefaultBoxesSidesNormalized: %@\nratios: %@", self->_filterThresholds, self->_networkThreshold, self->_nmsThreshold, self->_defaultBoxesSidesNormalized, self->_ratios];
}

- (NSArray)filterThresholds
{
  return self->_filterThresholds;
}

- (NSNumber)networkThreshold
{
  return self->_networkThreshold;
}

- (NSNumber)nmsThreshold
{
  return self->_nmsThreshold;
}

- (NSArray)defaultBoxesSidesNormalized
{
  return self->_defaultBoxesSidesNormalized;
}

- (NSArray)ratios
{
  return self->_ratios;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ratios, 0);
  objc_storeStrong((id *)&self->_defaultBoxesSidesNormalized, 0);
  objc_storeStrong((id *)&self->_nmsThreshold, 0);
  objc_storeStrong((id *)&self->_networkThreshold, 0);

  objc_storeStrong((id *)&self->_filterThresholds, 0);
}

@end