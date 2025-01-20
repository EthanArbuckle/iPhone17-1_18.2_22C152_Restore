@interface JFXEffect(AssetDownloading)
@end

@implementation JFXEffect(AssetDownloading)

- (void)registerMotionDocumentWithinAssets:()AssetDownloading .cold.1()
{
  OUTLINED_FUNCTION_7_0();
  v2 = NSStringFromJFXEffectType([v1 type]);
  v3 = [v0 displayName];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_234C41000, v4, v5, "downloading assets for %@ %@ motion document not found", v6, v7, v8, v9, v10);
}

- (void)registerMotionDocumentWithinAssets:()AssetDownloading .cold.2()
{
  OUTLINED_FUNCTION_6_0();
  v2 = NSStringFromJFXEffectType([v1 type]);
  v3 = [v0 displayName];
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_3_4(&dword_234C41000, v4, v5, "downloading motion document for %@ %@ succeeded with path %@", v6, v7, v8, v9, v10);
}

- (void)requestPreviewingAssetsWithPriority:()AssetDownloading onlyThumbnailAssetWhenAvailable:progressHandler:completionHandler:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = [a1 displayName];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_234C41000, a2, OS_LOG_TYPE_DEBUG, "requesting preview image for overlay %@", (uint8_t *)&v4, 0xCu);
}

@end