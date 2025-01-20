@interface UIDocumentPickerAllContainersModel
@end

@implementation UIDocumentPickerAllContainersModel

uint64_t __51___UIDocumentPickerAllContainersModel_updateScopes__block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  uint64_t v4 = [*(id *)(a1 + 40) shouldEnableContainer:v3];
  uint64_t v5 = v4;
  if (*(void *)(*(void *)(a1 + 40) + 120)) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6) {
    uint64_t v5 = objc_msgSend(MEMORY[0x263F32588], "canMoveFilesWithoutDownloadingFromContainer:toContainer:");
  }

  return v5;
}

@end