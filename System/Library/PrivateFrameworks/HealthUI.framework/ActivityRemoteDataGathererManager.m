@interface ActivityRemoteDataGathererManager
@end

@implementation ActivityRemoteDataGathererManager

void __130___ActivityRemoteDataGathererManager_gatherDataWithActivitySummaryDataProvider_monthDateInterval_sixMonthDateInterval_completion___block_invoke(uint64_t a1)
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__20;
  v18 = __Block_byref_object_dispose__20;
  id v19 = 0;
  v2 = [_ActivityRemoteDataGatherer alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __130___ActivityRemoteDataGathererManager_gatherDataWithActivitySummaryDataProvider_monthDateInterval_sixMonthDateInterval_completion___block_invoke_2;
  v11 = &unk_1E6D55B68;
  uint64_t v5 = *(void *)(a1 + 48);
  id v12 = *(id *)(a1 + 56);
  v13 = &v14;
  uint64_t v6 = [(_ActivityRemoteDataGatherer *)v2 initWithActivitySummaryDataProvider:v3 monthDateInterval:v4 sixMonthDateInterval:v5 completion:&v8];
  v7 = (void *)v15[5];
  v15[5] = v6;

  objc_msgSend((id)v15[5], "gatherData", v8, v9, v10, v11);
  _Block_object_dispose(&v14, 8);
}

void __130___ActivityRemoteDataGathererManager_gatherDataWithActivitySummaryDataProvider_monthDateInterval_sixMonthDateInterval_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

@end