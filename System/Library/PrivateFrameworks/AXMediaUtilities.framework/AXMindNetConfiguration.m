@interface AXMindNetConfiguration
- (AXMindNetConfiguration)initWithURL:(id)a3;
- (NSArray)filterThresholds;
- (NSNumber)nmsThreshold;
- (id)description;
@end

@implementation AXMindNetConfiguration

- (AXMindNetConfiguration)initWithURL:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AXMindNetConfiguration;
  v5 = [(AXMindNetConfiguration *)&v13 init];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v4];
    filterThresholds = v5->_filterThresholds;
    v5->_filterThresholds = (NSArray *)&unk_1F0E942C0;

    nmsThreshold = v5->_nmsThreshold;
    v5->_nmsThreshold = (NSNumber *)&unk_1F0E93F90;

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [v6 objectForKey:@"filterThresholds"];
      v10 = [v6 objectForKey:@"nmsThreshold"];
      if (__38__AXMindNetConfiguration_initWithURL___block_invoke((uint64_t)v10, v9))
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_storeStrong((id *)&v5->_filterThresholds, v9);
          objc_storeStrong((id *)&v5->_nmsThreshold, v10);
        }
      }
    }
    v11 = v5;
  }
  return v5;
}

BOOL __38__AXMindNetConfiguration_initWithURL___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v3 = v2;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
      while (2)
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            goto LABEL_12;
          }
          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }

    BOOL v8 = objc_msgSend(v3, "count", v10) != 0;
  }
  else
  {
LABEL_12:
    BOOL v8 = 0;
  }

  return v8;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"filterThresholds: %@\nnmsThreshold: %@", self->_filterThresholds, self->_nmsThreshold];
}

- (NSArray)filterThresholds
{
  return self->_filterThresholds;
}

- (NSNumber)nmsThreshold
{
  return self->_nmsThreshold;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nmsThreshold, 0);

  objc_storeStrong((id *)&self->_filterThresholds, 0);
}

@end