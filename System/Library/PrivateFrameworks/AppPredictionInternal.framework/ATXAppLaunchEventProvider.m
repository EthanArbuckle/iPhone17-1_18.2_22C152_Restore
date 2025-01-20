@interface ATXAppLaunchEventProvider
- (BOOL)isEventFromProvider:(id)a3;
- (BOOL)publisherIsCoreDuetWrapper;
- (NSString)description;
- (id)aggregationEventsFromEvent:(id)a3;
- (id)biomePublisherWithBookmark:(id)a3;
- (id)dateIntervalFromEvent:(id)a3;
- (id)eventsFromPublisher;
@end

@implementation ATXAppLaunchEventProvider

- (id)biomePublisherWithBookmark:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F1C9C8], "timeIntervalSinceReferenceDate", a3);
  v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v5 + -2419200.0];
  v7 = BiomeLibrary();
  v8 = [v7 App];
  v9 = [v8 InFocus];

  v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E8]) initWithStartDate:v6 endDate:0 maxEvents:0 lastN:0 reversed:0];
  v11 = [v9 publisherWithUseCase:*MEMORY[0x1E4F4B5A0] options:v10];
  v12 = [v11 mapWithTransform:&__block_literal_global_160];
  if (!v12)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"ATXAppLaunchEventProvider.m" lineNumber:34 description:@"Publisher for app launches was nil."];
  }
  return v12;
}

ATXBiomeAppLaunchWrapper *__56__ATXAppLaunchEventProvider_biomePublisherWithBookmark___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [ATXBiomeAppLaunchWrapper alloc];
  v4 = [v2 eventBody];

  double v5 = [(ATXBiomeAppLaunchWrapper *)v3 initWithAppLaunch:v4 isLocal:1 isMacPortable:0 isMacDesktop:0];
  return v5;
}

- (id)eventsFromPublisher
{
  v3 = objc_opt_new();
  v4 = [(ATXAppLaunchEventProvider *)self biomePublisherWithBookmark:0];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__ATXAppLaunchEventProvider_eventsFromPublisher__block_invoke_2;
  v10[3] = &unk_1E68AD360;
  v10[4] = self;
  id v5 = v3;
  id v11 = v5;
  id v6 = (id)[v4 sinkWithCompletion:&__block_literal_global_23_3 receiveInput:v10];

  v7 = v11;
  id v8 = v5;

  return v8;
}

void __48__ATXAppLaunchEventProvider_eventsFromPublisher__block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = [v7 eventBody];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v5 = v7;
  if (isKindOfClass)
  {
    id v6 = [*(id *)(a1 + 32) aggregationEventsFromEvent:v7];
    if ([v6 count]) {
      [*(id *)(a1 + 40) addObjectsFromArray:v6];
    }

    id v5 = v7;
  }
}

- (BOOL)publisherIsCoreDuetWrapper
{
  return 0;
}

- (BOOL)isEventFromProvider:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  BOOL v4 = (objc_opt_isKindOfClass() & 1) != 0 && ([v3 isLocal] & 1) != 0;

  return v4;
}

- (id)aggregationEventsFromEvent:(id)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(ATXAppLaunchEventProvider *)self isEventFromProvider:v4])
  {
    id v5 = [v4 appLaunchEvent];
    if ([v5 starting])
    {
      id v6 = [v5 bundleID];
      uint64_t v7 = +[ATXSessionTaggingAppEntity genreIdForBundleId:v6];
      id v8 = (void *)v7;
      v9 = &unk_1F27F1B90;
      if (v7) {
        v9 = (void *)v7;
      }
      id v10 = v9;

      id v11 = objc_alloc(MEMORY[0x1E4F4AED8]);
      v12 = [v5 bundleID];
      v22[0] = v10;
      v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
      v14 = (void *)[v11 initWithBundleId:v12 itunesGenreIds:v13];

      v15 = [ATXModeEvent alloc];
      v16 = [v5 absoluteTimestamp];
      v17 = [v5 absoluteTimestamp];
      v18 = [(ATXModeEvent *)v15 initWithStartDate:v16 endDate:v17 entity:v14];

      id v19 = objc_alloc(MEMORY[0x1E4F1C978]);
      v20 = objc_msgSend(v19, "initWithObjects:", v18, 0);
    }
    else
    {
      v20 = 0;
    }
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)dateIntervalFromEvent:(id)a3
{
  id v4 = a3;
  if ([(ATXAppLaunchEventProvider *)self isEventFromProvider:v4])
  {
    id v5 = v4;
    id v6 = [v5 launchTimestamp];

    if (v6)
    {
      id v7 = objc_alloc(MEMORY[0x1E4F28C18]);
      id v8 = [v5 launchTimestamp];
      v9 = [v5 launchTimestamp];
      id v6 = (void *)[v7 initWithStartDate:v8 endDate:v9];
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (NSString)description
{
  return (NSString *)@"AppLaunches";
}

@end