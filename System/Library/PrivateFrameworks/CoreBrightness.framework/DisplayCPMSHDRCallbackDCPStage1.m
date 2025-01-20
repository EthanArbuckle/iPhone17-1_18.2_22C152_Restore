@interface DisplayCPMSHDRCallbackDCPStage1
@end

@implementation DisplayCPMSHDRCallbackDCPStage1

void ____DisplayCPMSHDRCallbackDCPStage1_block_invoke(void *a1)
{
  v13 = a1;
  v12 = a1;
  *(void *)(*(void *)(a1[4] + 8) + 24) = __DisplayGetPowerAccumulatorDCP(a1[7], (void *)(*(void *)(a1[5] + 8) + 24));
  v1 = *(NSObject **)(a1[7] + 144);
  uint64_t block = MEMORY[0x1E4F143A8];
  int v4 = -1073741824;
  int v5 = 0;
  v6 = ____DisplayCPMSHDRCallbackDCPStage1_block_invoke_2;
  v7 = &unk_1E621A6D8;
  uint64_t v11 = a1[7];
  uint64_t v8 = a1[4];
  uint64_t v9 = a1[5];
  uint64_t v10 = a1[6];
  dispatch_async(v1, &block);
}

void ____DisplayCPMSHDRCallbackDCPStage1_block_invoke_2(void *a1)
{
}

@end