@interface MUISearchRankedSuggester
+ (OS_os_log)log;
+ (id)suggesterWithBundleID:(id)a3;
- (BOOL)shouldQueryForAsYouType;
- (MUISearchRankedSuggester)initWithBundleID:(id)a3;
- (NSArray)categories;
- (NSString)logIdentifier;
- (id)generateSuggestionsUsingPhraseManager:(id)a3 handler:(id)a4;
@end

@implementation MUISearchRankedSuggester

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__MUISearchRankedSuggester_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_9 != -1) {
    dispatch_once(&log_onceToken_9, block);
  }
  v2 = (void *)log_log_9;
  return (OS_os_log *)v2;
}

void __31__MUISearchRankedSuggester_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_9;
  log_log_9 = (uint64_t)v1;
}

+ (id)suggesterWithBundleID:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithBundleID:v4];

  return v5;
}

- (MUISearchRankedSuggester)initWithBundleID:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MUISearchRankedSuggester;
  v5 = [(MUISearchRankedSuggester *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v6;
  }
  return v5;
}

- (BOOL)shouldQueryForAsYouType
{
  return 1;
}

- (NSString)logIdentifier
{
  return (NSString *)@"Ranked";
}

- (NSArray)categories
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = +[MUISearchSuggestionCategory contactCategory];
  v6[0] = v2;
  id v3 = +[MUISearchSuggestionCategory genericCategory];
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return (NSArray *)v4;
}

- (id)generateSuggestionsUsingPhraseManager:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (id *)-[MUISearchRankedSuggesterQuery initWithPhraseManager:handler:suggester:]((uint64_t)[MUISearchRankedSuggesterQuery alloc], v7, v6, self);

  if (v8) {
    [v8[4] start];
  }
  return v8;
}

- (void).cxx_destruct
{
}

@end