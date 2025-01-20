@interface MADProtoAssetOCRAnalysis(Photos)
@end

@implementation MADProtoAssetOCRAnalysis(Photos)

+ (void)protoFromPhotosAsset:()Photos .cold.1(void *a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = [a1 localIdentifier];
  int v4 = 138412546;
  v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1BBEDA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "[%@] Failed to fetch asset's cloud identifier: %@", (uint8_t *)&v4, 0x16u);
}

@end