@interface _SFRecentWebSearchesController
+ (unint64_t)_maximumNumberOfSearchesToTrack;
- (id)_recentSearchDictionariesFromUserDefaultsUsingKey:(id)a3;
- (void)_saveRecentSearchDictionaries:(id)a3 toUserDefaultsUsingKey:(id)a4;
@end

@implementation _SFRecentWebSearchesController

+ (unint64_t)_maximumNumberOfSearchesToTrack
{
  return 20;
}

- (void)_saveRecentSearchDictionaries:(id)a3 toUserDefaultsUsingKey:(id)a4
{
  id v7 = a3;
  id v5 = a4;
  v6 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  [v6 setObject:v7 forKey:v5];
}

- (id)_recentSearchDictionariesFromUserDefaultsUsingKey:(id)a3
{
  id v3 = a3;
  v4 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  id v5 = [v4 arrayForKey:v3];

  return v5;
}

@end