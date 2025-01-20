@interface FFDefaultParseErrorReporter
- (void)reportError:(id)a3;
@end

@implementation FFDefaultParseErrorReporter

- (void)reportError:(id)a3
{
  id v15 = a3;
  v3 = [v15 objectForKeyedSubscript:FFParseErrorContextFilenameKey];
  if (v3)
  {
    v4 = NSString;
    v5 = [v15 objectForKeyedSubscript:FFParseErrorContextFilenameKey];
    v6 = [v4 stringWithFormat:@" in file \"%@\":", v5];
  }
  else
  {
    v6 = &stru_1F38A7CC8;
  }

  v7 = [v15 objectForKeyedSubscript:FFParseErrorContextKeyKey];
  if (v7)
  {
    v8 = NSString;
    v9 = [v15 objectForKeyedSubscript:FFParseErrorContextKeyKey];
    v10 = [v8 stringWithFormat:@" while reading key \"%@\":", v9];
  }
  else
  {
    v10 = &stru_1F38A7CC8;
  }

  v11 = NSString;
  v12 = [v15 objectForKeyedSubscript:FFParseErrorContextSeverityKey];
  v13 = [v15 objectForKeyedSubscript:FFParseErrorMessageKey];
  v14 = [v11 stringWithFormat:@"%@:%@%@ %@", v12, v6, v10, v13];

  NSLog(&stru_1F38A7D28.isa, v14);
}

@end