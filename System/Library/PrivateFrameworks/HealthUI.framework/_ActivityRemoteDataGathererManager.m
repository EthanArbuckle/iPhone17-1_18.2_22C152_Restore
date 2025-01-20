@interface _ActivityRemoteDataGathererManager
+ (void)gatherDataWithActivitySummaryDataProvider:(id)a3 monthDateInterval:(id)a4 sixMonthDateInterval:(id)a5 completion:(id)a6;
@end

@implementation _ActivityRemoteDataGathererManager

+ (void)gatherDataWithActivitySummaryDataProvider:(id)a3 monthDateInterval:(id)a4 sixMonthDateInterval:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __130___ActivityRemoteDataGathererManager_gatherDataWithActivitySummaryDataProvider_monthDateInterval_sixMonthDateInterval_completion___block_invoke;
  v17[3] = &unk_1E6D518B0;
  id v18 = v9;
  id v19 = v10;
  id v20 = v11;
  id v21 = v12;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  id v16 = v9;
  dispatch_async(MEMORY[0x1E4F14428], v17);
}

@end