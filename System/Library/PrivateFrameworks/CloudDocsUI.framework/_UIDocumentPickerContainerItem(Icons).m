@interface _UIDocumentPickerContainerItem(Icons)
@end

@implementation _UIDocumentPickerContainerItem(Icons)

+ (void)_blockingThumbnailForItem:()Icons documentProxy:withSize:scale:wantsBorder:generatedThumbnail:.cold.1(void *a1)
{
  v1 = [a1 lastPathComponent];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22CA47000, v2, v3, "[DEBUG] No thumbnail found for %@, error %@", v4, v5, v6, v7, v8);
}

+ (void)_blockingFolderIconForURL:()Icons container:size:scale:.cold.1(double a1, double a2, uint64_t a3, NSObject *a4)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v5 = NSStringFromCGSize(*(CGSize *)&a1);
  OUTLINED_FUNCTION_0();
  _os_log_fault_impl(&dword_22CA47000, a4, OS_LOG_TYPE_FAULT, "[ERROR] Unknown icon size %@ requested for file %@", v6, 0x16u);
}

@end