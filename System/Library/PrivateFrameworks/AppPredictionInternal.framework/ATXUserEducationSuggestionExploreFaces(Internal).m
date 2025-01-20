@interface ATXUserEducationSuggestionExploreFaces(Internal)
- (id)server;
- (id)userDefaultsKeyForTrackingSuggestionState;
- (uint64_t)metricClass;
- (void)logFeedback:()Internal;
@end

@implementation ATXUserEducationSuggestionExploreFaces(Internal)

- (id)userDefaultsKeyForTrackingSuggestionState
{
  v1 = NSString;
  v5.receiver = a1;
  v5.super_class = (Class)&off_1F2899048;
  v2 = objc_msgSendSuper2(&v5, sel_userDefaultsKeyForTrackingSuggestionState);
  v3 = [v1 stringWithFormat:@"%@.%@", v2, @"ExploreFaces"];

  return v3;
}

- (uint64_t)metricClass
{
  return objc_opt_class();
}

- (id)server
{
  v0 = +[ATXUserEducationSuggestionServer sharedInstance];
  v1 = [v0 exploreFacesServer];

  return v1;
}

- (void)logFeedback:()Internal
{
  id v4 = a3;
  objc_super v5 = [a1 server];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__ATXUserEducationSuggestionExploreFaces_Internal__logFeedback___block_invoke;
  v7[3] = &unk_1E68AB870;
  id v8 = v4;
  v9 = a1;
  id v6 = v4;
  [v5 performBlockOnInternalSerialQueue:v7];
}

@end