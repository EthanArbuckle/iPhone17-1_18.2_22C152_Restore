@interface DDUISearchWebHandler
+ (id)webSearchURLForQueryString:(id)a3;
@end

@implementation DDUISearchWebHandler

+ (id)webSearchURLForQueryString:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = +[_SFSearchEngineController sharedInstance];
    [v4 reloadSearchEngines];

    v5 = +[_SFSearchEngineController sharedInstance];
    v6 = [v5 defaultSearchEngine];
    v7 = [v6 searchURLForUserTypedString:v3];
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

@end