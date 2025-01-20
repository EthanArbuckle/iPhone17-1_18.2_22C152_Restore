@interface ADSynapseService
- (id)customVocabSyncInfo;
- (id)identifier;
@end

@implementation ADSynapseService

- (id)customVocabSyncInfo
{
  v2 = +[AFPreferences sharedPreferences];
  unsigned int v3 = [v2 assistantIsEnabled];

  if (v3)
  {
    v4 = +[_INVocabularyStoreManager savedCustomVocabularyOverviewDictionary];
  }
  else
  {
    v4 = &__NSDictionary0__struct;
  }
  return v4;
}

- (id)identifier
{
  return @"com.apple.siri.SynapseSyncPlugin";
}

@end