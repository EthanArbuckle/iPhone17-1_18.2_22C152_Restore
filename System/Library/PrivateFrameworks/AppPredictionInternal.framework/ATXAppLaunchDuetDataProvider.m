@interface ATXAppLaunchDuetDataProvider
+ (Class)supportedDuetEventClass;
+ (id)biomePublisher:(id)a3 andEndDate:(id)a4 isIncluded:(id)a5;
+ (int64_t)supportedCoreDuetStream;
@end

@implementation ATXAppLaunchDuetDataProvider

+ (Class)supportedDuetEventClass
{
  return (Class)objc_opt_class();
}

+ (int64_t)supportedCoreDuetStream
{
  return 0;
}

+ (id)biomePublisher:(id)a3 andEndDate:(id)a4 isIncluded:(id)a5
{
  id v25 = a3;
  id v8 = a4;
  id v9 = a5;
  context = (void *)MEMORY[0x1D25F6CC0]();
  v10 = objc_opt_class();
  v11 = objc_msgSend(v10, "duetHelperStreamTypeToDuetEventStream:", objc_msgSend((id)objc_opt_class(), "supportedCoreDuetStream"));
  id v12 = objc_alloc(MEMORY[0x1E4F50310]);
  v13 = [v11 name];
  v14 = (void *)[v12 initWithDKStreamIdentifier:v13];

  v15 = NSNumber;
  [v25 timeIntervalSinceReferenceDate];
  v16 = objc_msgSend(v15, "numberWithDouble:");
  v17 = NSNumber;
  [v8 timeIntervalSinceReferenceDate];
  v18 = objc_msgSend(v17, "numberWithDouble:");
  v19 = [v14 publisherWithStartTime:v16 endTime:v18 maxEvents:0 lastN:0 reversed:0];
  v20 = [v19 filterWithIsIncluded:&__block_literal_global_121];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __69__ATXAppLaunchDuetDataProvider_biomePublisher_andEndDate_isIncluded___block_invoke_2;
  v29[3] = &__block_descriptor_40_e22__16__0__BMStoreEvent_8l;
  v29[4] = a1;
  v21 = [v20 mapWithTransform:v29];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __69__ATXAppLaunchDuetDataProvider_biomePublisher_andEndDate_isIncluded___block_invoke_3;
  v27[3] = &unk_1E68AD3D8;
  id v22 = v9;
  id v28 = v22;
  v23 = [v21 filterWithIsIncluded:v27];

  return v23;
}

BOOL __69__ATXAppLaunchDuetDataProvider_biomePublisher_andEndDate_isIncluded___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBody];
  BOOL v3 = v2 != 0;

  return v3;
}

id __69__ATXAppLaunchDuetDataProvider_biomePublisher_andEndDate_isIncluded___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBody];
  BOOL v3 = [v2 dkEvent];
  v4 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "supportedDuetEventClass")), "initWithDKEvent:", v3);

  return v4;
}

uint64_t __69__ATXAppLaunchDuetDataProvider_biomePublisher_andEndDate_isIncluded___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end