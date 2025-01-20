@interface MKLocationShifter
@end

@implementation MKLocationShifter

void __58___MKLocationShifter_shiftLocation_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(*(void *)(a1 + 32) + 8);
  id v6 = a3;
  id v7 = a2;
  [v4 horizontalAccuracy];
  objc_msgSend(v5, "shiftLatLng:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:", v7, v6, 0, 0, MEMORY[0x1E4F14428]);
}

void __72___MKLocationShifter_shiftLocation_withCompletionHandler_callbackQueue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = *(void **)(a1 + 40);
  id v6 = *(void **)(*(void *)(a1 + 32) + 8);
  id v7 = a3;
  id v8 = a2;
  [v5 horizontalAccuracy];
  double v10 = v9;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72___MKLocationShifter_shiftLocation_withCompletionHandler_callbackQueue___block_invoke_2;
  v11[3] = &unk_1E54B9C60;
  id v12 = *(id *)(a1 + 56);
  [v6 shiftLatLng:v8 accuracy:v7 withCompletionHandler:0 mustGoToNetworkCallback:v11 errorHandler:*(void *)(a1 + 48) callbackQueue:v10];
}

uint64_t __72___MKLocationShifter_shiftLocation_withCompletionHandler_callbackQueue___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __91___MKLocationShifter__prepareShiftForLocation_withCompletionHandler_withShiftRequestBlock___block_invoke(uint64_t a1, double a2, double a3)
{
  long long v15 = 0u;
  memset(v16, 0, 60);
  memset(v14, 0, sizeof(v14));
  long long v13 = 0u;
  memset(&v12[2], 0, 32);
  id v6 = *(void **)(a1 + 32);
  if (v6)
  {
    [v6 clientLocation];
    id v6 = *(void **)(a1 + 32);
  }
  *(double *)((char *)&v12[2] + 4) = a2;
  *(double *)((char *)&v12[2] + 12) = a3;
  [v6 rawCourse];
  *(void *)((char *)v14 + 12) = v7;
  *(double *)((char *)v16 + 4) = a2;
  *(double *)((char *)v16 + 12) = a3;
  DWORD1(v16[2]) = 2;
  id v8 = objc_alloc(MEMORY[0x1E4F1E5F0]);
  double v9 = [*(id *)(a1 + 32) coarseMetaData];
  v11[6] = v16[0];
  v11[7] = v16[1];
  v12[0] = v16[2];
  *(_OWORD *)((char *)v12 + 12) = *(_OWORD *)((char *)&v16[2] + 12);
  v11[2] = v13;
  v11[3] = v14[0];
  void v11[4] = v14[1];
  v11[5] = v15;
  v11[0] = v12[2];
  v11[1] = v12[3];
  double v10 = (void *)[v8 initWithClientLocation:v11 coarseMetaData:v9];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

@end