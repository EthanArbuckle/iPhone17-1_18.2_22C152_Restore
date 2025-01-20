@interface DKSyncDownCloudKitKnowledgeStorage
@end

@implementation DKSyncDownCloudKitKnowledgeStorage

uint64_t __53___DKSyncDownCloudKitKnowledgeStorage_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedInstance_sharedInstance_415;
  sharedInstance_sharedInstance_415 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end