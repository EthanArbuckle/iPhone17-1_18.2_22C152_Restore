@interface ATXExpiredDataProvider
- (ATXExpiredDataProvider)initWithAppInfoManager:(id)a3 histogramBundleIdTable:(id)a4;
- (id)expiredActionKeysFromExpiredBundleIds:(id)a3;
- (id)expiredBundleIds;
- (id)expiredBundleIdsAndActionKeys;
@end

@implementation ATXExpiredDataProvider

- (ATXExpiredDataProvider)initWithAppInfoManager:(id)a3 histogramBundleIdTable:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXExpiredDataProvider;
  v9 = [(ATXExpiredDataProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_appInfoManager, a3);
    objc_storeStrong((id *)&v10->_histogramBundleIdTable, a4);
  }

  return v10;
}

- (id)expiredBundleIdsAndActionKeys
{
  v3 = [(ATXExpiredDataProvider *)self expiredBundleIds];
  v4 = [(ATXExpiredDataProvider *)self expiredActionKeysFromExpiredBundleIds:v3];
  v5 = [[ATXExpiredData alloc] initWithExpiredBundleIds:v3 expiredActionKeys:v4];

  return v5;
}

- (id)expiredBundleIds
{
  v3 = [MEMORY[0x1E4F1C9C8] date];
  v4 = [(_ATXAppInfoManager *)self->_appInfoManager allApps];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__ATXExpiredDataProvider_expiredBundleIds__block_invoke;
  v8[3] = &unk_1E68B01A8;
  v8[4] = self;
  id v9 = v3;
  id v5 = v3;
  v6 = [v4 objectsPassingTest:v8];

  return v6;
}

BOOL __42__ATXExpiredDataProvider_expiredBundleIds__block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = [*(id *)(*(void *)(a1 + 32) + 8) appInfoForBundleId:a2];
  v4 = [v3 lastLaunch];

  if (v4)
  {
    id v5 = *(void **)(a1 + 40);
    v6 = [v3 lastLaunch];
    [v5 timeIntervalSinceDate:v6];
    double v8 = fabs(v7);

    BOOL v9 = v8 > 2419200.0;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)expiredActionKeysFromExpiredBundleIds:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    histogramBundleIdTable = self->_histogramBundleIdTable;
    v6 = +[_ATXActionUtils actionKeyFilterForCandidateBundleIds:v4 candidateActionTypes:0 blacklist:0];
    double v7 = [(ATXHistogramTable *)histogramBundleIdTable allKeysFilteredBy:v6];

    double v8 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
  }
  else
  {
    double v8 = objc_opt_new();
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_histogramBundleIdTable, 0);
  objc_storeStrong((id *)&self->_appInfoManager, 0);
}

@end