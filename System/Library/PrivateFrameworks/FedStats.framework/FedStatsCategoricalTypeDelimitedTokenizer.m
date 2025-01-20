@interface FedStatsCategoricalTypeDelimitedTokenizer
+ (id)instanceWithParameters:(id)a3 error:(id *)a4;
+ (id)mutateParameters:(id)a3 usingFieldValues:(id)a4 assetURLs:(id)a5 requiredFields:(id *)a6 assetNames:(id *)a7 error:(id *)a8;
- (FedStatsCategoricalTypeDelimitedTokenizer)initWithDelimiter:(id)a3;
- (NSString)delimiter;
- (id)tokenize:(id)a3;
@end

@implementation FedStatsCategoricalTypeDelimitedTokenizer

- (FedStatsCategoricalTypeDelimitedTokenizer)initWithDelimiter:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FedStatsCategoricalTypeDelimitedTokenizer;
  v6 = [(FedStatsCategoricalTypeDelimitedTokenizer *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_delimiter, a3);
  }

  return v7;
}

+ (id)instanceWithParameters:(id)a3 error:(id *)a4
{
  uint64_t v6 = [a3 objectForKey:@"delimiter"];
  if (v6) {
    v7 = (__CFString *)v6;
  }
  else {
    v7 = @" ";
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    a4 = (id *)[objc_alloc((Class)a1) initWithDelimiter:v7];
  }
  else if (a4) {
    v8 = {;
  }
    *a4 = +[FedStatsError errorWithCode:101 description:v8];

    a4 = 0;
  }

  return a4;
}

- (id)tokenize:(id)a3
{
  if (a3)
  {
    v4 = [NSString stringWithFormat:@"%@", a3];
    id v5 = [(FedStatsCategoricalTypeDelimitedTokenizer *)self delimiter];
    uint64_t v6 = [v4 componentsSeparatedByString:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

+ (id)mutateParameters:(id)a3 usingFieldValues:(id)a4 assetURLs:(id)a5 requiredFields:(id *)a6 assetNames:(id *)a7 error:(id *)a8
{
  return a3;
}

- (NSString)delimiter
{
  return self->_delimiter;
}

- (void).cxx_destruct
{
}

@end