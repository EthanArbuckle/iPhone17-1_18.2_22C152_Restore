@interface IETestResults
- (NSArray)parseErrors;
- (NSArray)results;
- (int)getCount:(unint64_t)a3;
- (void)setParseErrors:(id)a3;
- (void)setResults:(id)a3;
@end

@implementation IETestResults

- (int)getCount:(unint64_t)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = [(IETestResults *)self results];
  int v5 = 0;
  uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * i) status] == a3) {
          ++v5;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v5;
}

- (NSArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
}

- (NSArray)parseErrors
{
  return self->_parseErrors;
}

- (void)setParseErrors:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parseErrors, 0);

  objc_storeStrong((id *)&self->_results, 0);
}

@end