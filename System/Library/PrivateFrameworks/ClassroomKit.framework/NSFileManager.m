@interface NSFileManager
@end

@implementation NSFileManager

uint64_t __67__NSFileManager_CRKAdditions__crk_nonContainerizedHomeDirectoryURL__block_invoke(uint64_t a1)
{
  crk_nonContainerizedHomeDirectoryURL_URL = objc_msgSend(*(id *)(a1 + 32), "crk_computeNonContainerizedHomeDirectoryURL");

  return MEMORY[0x270F9A758]();
}

uint64_t __79__NSFileManager_CRKAdditions__crk_deepContentsOfDirectoryAtPath_options_error___block_invoke(uint64_t a1, int a2, id obj)
{
  return 0;
}

@end