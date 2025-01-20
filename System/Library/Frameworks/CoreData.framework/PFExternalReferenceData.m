@interface PFExternalReferenceData
@end

@implementation PFExternalReferenceData

BOOL __46___PFExternalReferenceData__attemptToMapData___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 48) stringByDeletingLastPathComponent];
  uint64_t v6 = 0;
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", v4) & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, 0, &v6);
  }
  BOOL result = +[_PFRoutines createExternalReferenceLinkFromPath:toPath:protectionLevel:error:]((uint64_t)_PFRoutines, [a2 path], *(void *)(*(void *)(a1 + 32) + 48), objc_msgSend(*(id *)(a1 + 32), "preferredProtectionLevel"), &v6);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end