@interface CERecommendationActionCache
- (CERecommendationActionCache)init;
- (NSUserDefaults)defaults;
- (id)_timestamp:(id)a3 tableName:(id)a4;
- (id)lastDismissedTimestamp:(id)a3;
- (id)timestampForLastCanceled:(id)a3;
- (id)timestampForLastCompleted:(id)a3;
- (void)_clearAction:(id)a3 tableName:(id)a4;
- (void)_trackAction:(id)a3 tableName:(id)a4;
- (void)clearLastDismissed:(id)a3;
- (void)flushCache;
- (void)setDefaults:(id)a3;
- (void)trackActionCanceledForRecommendation:(id)a3;
- (void)trackActionCompletedForRecommendation:(id)a3;
- (void)trackActionDismissedForRecommendation:(id)a3;
@end

@implementation CERecommendationActionCache

- (CERecommendationActionCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)CERecommendationActionCache;
  v2 = [(CERecommendationActionCache *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.cloudexperience"];
    defaults = v2->_defaults;
    v2->_defaults = (NSUserDefaults *)v3;
  }
  return v2;
}

- (id)_timestamp:(id)a3 tableName:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(CERecommendationActionCache *)self defaults];
  v9 = [v8 dictionaryForKey:v6];

  v10 = [v7 identifier];

  v11 = [v9 objectForKeyedSubscript:v10];

  return v11;
}

- (void)_trackAction:(id)a3 tableName:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  id v7 = objc_opt_class();
  objc_sync_enter(v7);
  v8 = [(CERecommendationActionCache *)self defaults];
  v9 = [v8 dictionaryForKey:v6];
  v10 = (void *)[v9 mutableCopy];

  if (!v10) {
    v10 = (void *)[MEMORY[0x263EFFA78] mutableCopy];
  }
  v11 = [MEMORY[0x263EFF910] date];
  v12 = [v14 identifier];
  [v10 setObject:v11 forKeyedSubscript:v12];

  v13 = [(CERecommendationActionCache *)self defaults];
  [v13 setObject:v10 forKey:v6];

  objc_sync_exit(v7);
}

- (void)_clearAction:(id)a3 tableName:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = objc_opt_class();
  objc_sync_enter(v7);
  v8 = [(CERecommendationActionCache *)self defaults];
  v9 = [v8 dictionaryForKey:v6];
  v10 = (void *)[v9 mutableCopy];

  if (v10)
  {
    v11 = [v13 identifier];
    [v10 setObject:0 forKeyedSubscript:v11];

    v12 = [(CERecommendationActionCache *)self defaults];
    [v12 setObject:v10 forKey:v6];
  }
  objc_sync_exit(v7);
}

- (id)timestampForLastCompleted:(id)a3
{
  return [(CERecommendationActionCache *)self _timestamp:a3 tableName:@"CERecommendationCompletedActionsTable"];
}

- (void)trackActionCompletedForRecommendation:(id)a3
{
}

- (id)timestampForLastCanceled:(id)a3
{
  return [(CERecommendationActionCache *)self _timestamp:a3 tableName:@"CERecommendationCanceledActionsTable"];
}

- (void)trackActionCanceledForRecommendation:(id)a3
{
}

- (void)trackActionDismissedForRecommendation:(id)a3
{
}

- (id)lastDismissedTimestamp:(id)a3
{
  return [(CERecommendationActionCache *)self _timestamp:a3 tableName:@"CERecommendationDismissedActionsTable"];
}

- (void)clearLastDismissed:(id)a3
{
}

- (void)flushCache
{
  uint64_t v3 = [(CERecommendationActionCache *)self defaults];
  [v3 removeObjectForKey:@"CERecommendationCompletedActionsTable"];

  v4 = [(CERecommendationActionCache *)self defaults];
  [v4 removeObjectForKey:@"CERecommendationCanceledActionsTable"];

  id v5 = [(CERecommendationActionCache *)self defaults];
  [v5 removeObjectForKey:@"CERecommendationDismissedActionsTable"];
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (void).cxx_destruct
{
}

@end