@interface DDUISearchWebHandler
+ (id)webSearchURLForQueryString:(id)a3;
@end

@implementation DDUISearchWebHandler

+ (id)webSearchURLForQueryString:(id)a3
{
  if (a3)
  {
    v3 = (void *)MEMORY[0x1E4F3B060];
    id v4 = a3;
    v5 = [v3 sharedInstance];
    [v5 reloadSearchEngines];

    v6 = [MEMORY[0x1E4F3B060] sharedInstance];
    v7 = [v6 defaultSearchEngine];
    v8 = [v7 searchURLForUserTypedString:v4];
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

@end