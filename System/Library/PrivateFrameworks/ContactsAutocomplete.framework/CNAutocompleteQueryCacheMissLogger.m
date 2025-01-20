@interface CNAutocompleteQueryCacheMissLogger
- (CNAutocompleteQueryCacheMissLogger)init;
- (CNAutocompleteQueryCacheMissLogger)initWithLoggers:(id)a3;
- (NSArray)loggers;
- (void)didReturnCacheFalseNegatives:(id)a3;
- (void)didReturnCacheFalsePositives:(id)a3;
- (void)setLoggers:(id)a3;
@end

@implementation CNAutocompleteQueryCacheMissLogger

- (CNAutocompleteQueryCacheMissLogger)init
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(_CNAutocompleteQueryCacheMissOSLogging);
  v4 = objc_alloc_init(_CNAutocompleteQueryCacheMissAggdLogging);
  v8[0] = v3;
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  v6 = [(CNAutocompleteQueryCacheMissLogger *)self initWithLoggers:v5];

  return v6;
}

- (CNAutocompleteQueryCacheMissLogger)initWithLoggers:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNAutocompleteQueryCacheMissLogger;
  v5 = [(CNAutocompleteQueryCacheMissLogger *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    loggers = v5->_loggers;
    v5->_loggers = (NSArray *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)didReturnCacheFalseNegatives:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = [(CNAutocompleteQueryCacheMissLogger *)self loggers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) didReturnCacheFalseNegatives:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)didReturnCacheFalsePositives:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = [(CNAutocompleteQueryCacheMissLogger *)self loggers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) didReturnCacheFalsePositives:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSArray)loggers
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLoggers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end