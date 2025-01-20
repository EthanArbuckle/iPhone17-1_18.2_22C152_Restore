@interface CNAutocompleteStoreReproStringRecorder
- (CNAutocompleteStoreReproStringRecorder)init;
- (CNAutocompleteStoreReproStringRecorder)initWithTimeProvider:(id)a3;
- (CNTimeProvider)timeProvider;
- (NSMutableString)reproStringStorage;
- (NSNumber)lastTimestamp;
- (NSString)lastString;
- (NSString)reproString;
- (id)description;
- (id)stringForIntervalSinceLastTimestamp:(double)a3;
- (id)stringForKeystrokesSinceLastString:(id)a3;
- (void)clear;
- (void)recordString:(id)a3;
- (void)setLastString:(id)a3;
- (void)setLastTimestamp:(id)a3;
@end

@implementation CNAutocompleteStoreReproStringRecorder

- (CNAutocompleteStoreReproStringRecorder)init
{
  v3 = [MEMORY[0x1E4F5A538] defaultProvider];
  v4 = [(CNAutocompleteStoreReproStringRecorder *)self initWithTimeProvider:v3];

  return v4;
}

- (CNAutocompleteStoreReproStringRecorder)initWithTimeProvider:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNAutocompleteStoreReproStringRecorder;
  v6 = [(CNAutocompleteStoreReproStringRecorder *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_timeProvider, a3);
    v8 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
    reproStringStorage = v7->_reproStringStorage;
    v7->_reproStringStorage = v8;

    lastString = v7->_lastString;
    v7->_lastString = (NSString *)&stru_1F1A2F2D8;

    lastTimestamp = v7->_lastTimestamp;
    v7->_lastTimestamp = 0;

    v12 = v7;
  }

  return v7;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  v4 = [(CNAutocompleteStoreReproStringRecorder *)self reproStringStorage];
  id v5 = (id)[v3 appendName:@"reproString" object:v4];

  v6 = [v3 build];

  return v6;
}

- (void)clear
{
  v3 = [(CNAutocompleteStoreReproStringRecorder *)self reproStringStorage];
  [v3 setString:&stru_1F1A2F2D8];

  [(CNAutocompleteStoreReproStringRecorder *)self setLastString:&stru_1F1A2F2D8];
}

- (NSString)reproString
{
  v2 = [(CNAutocompleteStoreReproStringRecorder *)self reproStringStorage];
  v3 = (void *)[v2 copy];

  return (NSString *)v3;
}

- (void)recordString:(id)a3
{
  id v14 = a3;
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A298] + 16))())
  {
    [(CNAutocompleteStoreReproStringRecorder *)self clear];
  }
  else
  {
    v4 = [(CNAutocompleteStoreReproStringRecorder *)self timeProvider];
    [v4 timestamp];
    double v6 = v5;

    v7 = [(CNAutocompleteStoreReproStringRecorder *)self stringForIntervalSinceLastTimestamp:v6];
    v8 = [(CNAutocompleteStoreReproStringRecorder *)self reproStringStorage];
    uint64_t v9 = [v8 length];

    if (v9 && v7)
    {
      v10 = [(CNAutocompleteStoreReproStringRecorder *)self reproStringStorage];
      [v10 appendFormat:@"~%@~", v7];
    }
    v11 = [(CNAutocompleteStoreReproStringRecorder *)self stringForKeystrokesSinceLastString:v14];
    v12 = [(CNAutocompleteStoreReproStringRecorder *)self reproStringStorage];
    [v12 appendString:v11];

    v13 = [MEMORY[0x1E4F28ED0] numberWithDouble:v6];
    [(CNAutocompleteStoreReproStringRecorder *)self setLastTimestamp:v13];

    [(CNAutocompleteStoreReproStringRecorder *)self setLastString:v14];
  }
}

- (id)stringForIntervalSinceLastTimestamp:(double)a3
{
  double v5 = [(CNAutocompleteStoreReproStringRecorder *)self lastTimestamp];

  if (v5)
  {
    double v6 = NSString;
    v7 = [(CNAutocompleteStoreReproStringRecorder *)self lastTimestamp];
    [v7 doubleValue];
    uint64_t v9 = objc_msgSend(v6, "stringWithFormat:", @"%lu", (unint64_t)((a3 - v8) * 1000.0));
  }
  else
  {
    uint64_t v9 = 0;
  }
  return v9;
}

- (id)stringForKeystrokesSinceLastString:(id)a3
{
  id v4 = a3;
  double v5 = [(CNAutocompleteStoreReproStringRecorder *)self lastString];
  objc_msgSend(v4, "_cn_rangeOfCommonPrefixWithString:", v5);
  uint64_t v7 = v6;

  double v8 = [(CNAutocompleteStoreReproStringRecorder *)self lastString];
  uint64_t v9 = [v8 substringFromIndex:v7];

  v10 = [v4 substringFromIndex:v7];

  id v11 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v12 = objc_msgSend(v9, "_cn_flatMap:", &__block_literal_global_3);
  [v11 appendString:v12];

  [v11 appendString:v10];
  return v11;
}

- (CNTimeProvider)timeProvider
{
  return (CNTimeProvider *)objc_getProperty(self, a2, 8, 1);
}

- (NSMutableString)reproStringStorage
{
  return (NSMutableString *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)lastTimestamp
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLastTimestamp:(id)a3
{
}

- (NSString)lastString
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLastString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastString, 0);
  objc_storeStrong((id *)&self->_lastTimestamp, 0);
  objc_storeStrong((id *)&self->_reproStringStorage, 0);
  objc_storeStrong((id *)&self->_timeProvider, 0);
}

@end