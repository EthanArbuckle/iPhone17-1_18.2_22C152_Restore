@interface ATXFaceSuggestionAppLaunchSignal
- (ATXFaceSuggestionAppLaunchSignal)initWithAppLaunchDictionary:(id)a3;
- (double)valueForDescriptor:(id)a3;
- (double)weight;
@end

@implementation ATXFaceSuggestionAppLaunchSignal

- (ATXFaceSuggestionAppLaunchSignal)initWithAppLaunchDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXFaceSuggestionAppLaunchSignal;
  v5 = [(ATXFaceSuggestionAppLaunchSignal *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    appLaunchDictionary = v5->_appLaunchDictionary;
    v5->_appLaunchDictionary = (NSDictionary *)v6;
  }
  return v5;
}

- (double)valueForDescriptor:(id)a3
{
  id v4 = a3;
  v5 = [v4 containerBundleIdentifier];

  if (v5)
  {
    appLaunchDictionary = self->_appLaunchDictionary;
    v7 = [v4 containerBundleIdentifier];
    v8 = [(NSDictionary *)appLaunchDictionary objectForKeyedSubscript:v7];
    double v9 = (double)(unint64_t)[v8 rawLaunchCount];
  }
  else
  {
    double v9 = 0.0;
  }

  return v9;
}

- (double)weight
{
  return 1.0;
}

- (void).cxx_destruct
{
}

@end