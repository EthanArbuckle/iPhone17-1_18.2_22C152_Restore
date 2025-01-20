@interface ATXCombinedIntentStream
- (ATXCombinedIntentStream)init;
- (ATXCombinedIntentStream)initWithIntentStream:(id)a3 activityStream:(id)a4;
- (id)getActivityAndIntentEventsBetweenStartDate:(id)a3 endDate:(id)a4 ascending:(BOOL)a5;
- (id)getActivityAndIntentEventsFromLastMonth;
- (id)getSortedActivityAndIntentEventsBetweenStartDate:(id)a3 endDate:(id)a4 bundleIdFilter:(id)a5 comparator:(id)a6;
@end

@implementation ATXCombinedIntentStream

- (ATXCombinedIntentStream)init
{
  v3 = objc_opt_new();
  v4 = objc_opt_new();
  v5 = [(ATXCombinedIntentStream *)self initWithIntentStream:v3 activityStream:v4];

  return v5;
}

- (ATXCombinedIntentStream)initWithIntentStream:(id)a3 activityStream:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXCombinedIntentStream;
  v9 = [(ATXCombinedIntentStream *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_intentStream, a3);
    objc_storeStrong((id *)&v10->_activityStream, a4);
  }

  return v10;
}

- (id)getSortedActivityAndIntentEventsBetweenStartDate:(id)a3 endDate:(id)a4 bundleIdFilter:(id)a5 comparator:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = (void *)MEMORY[0x1AD0D3C30]();
  v15 = [(ATXIntentStream *)self->_intentStream getIntentEventsBetweenStartDate:v10 endDate:v11 forSource:1 bundleIdFilter:v12 allowMissingTitles:0];
  v16 = [(ATXUserActivityStream *)self->_activityStream getActivityIntentEventsBetweenStartDate:v10 endDate:v11 bundleIdFilter:v12];
  v17 = objc_opt_new();
  if ([v15 count]) {
    [v17 addObjectsFromArray:v15];
  }
  if ([v16 count]) {
    [v17 addObjectsFromArray:v16];
  }
  if (v13) {
    [v17 sortUsingComparator:v13];
  }
  v18 = (void *)[v17 copy];

  return v18;
}

- (id)getActivityAndIntentEventsBetweenStartDate:(id)a3 endDate:(id)a4 ascending:(BOOL)a5
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __88__ATXCombinedIntentStream_getActivityAndIntentEventsBetweenStartDate_endDate_ascending___block_invoke;
  v9[3] = &__block_descriptor_33_e43_q24__0__ATXIntentEvent_8__ATXIntentEvent_16l;
  BOOL v10 = a5;
  v5 = [(ATXCombinedIntentStream *)self getSortedActivityAndIntentEventsBetweenStartDate:a3 endDate:a4 bundleIdFilter:0 comparator:v9];
  v6 = v5;
  if (!v5) {
    v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v7 = v5;

  return v7;
}

uint64_t __88__ATXCombinedIntentStream_getActivityAndIntentEventsBetweenStartDate_endDate_ascending___block_invoke(uint64_t a1, void *a2, void *a3)
{
  int v4 = *(unsigned __int8 *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v7 = v6;
  if (v4)
  {
    id v8 = [v6 dateInterval];

    v9 = [v5 dateInterval];
  }
  else
  {
    id v8 = [v5 dateInterval];

    v9 = [v7 dateInterval];
  }
  uint64_t v10 = [v8 compare:v9];

  return v10;
}

- (id)getActivityAndIntentEventsFromLastMonth
{
  v3 = [MEMORY[0x1E4F1C9C8] date];
  int v4 = [v3 dateByAddingTimeInterval:-2419200.0];
  id v5 = [(ATXCombinedIntentStream *)self getActivityAndIntentEventsBetweenStartDate:v4 endDate:v3 ascending:1];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityStream, 0);

  objc_storeStrong((id *)&self->_intentStream, 0);
}

@end