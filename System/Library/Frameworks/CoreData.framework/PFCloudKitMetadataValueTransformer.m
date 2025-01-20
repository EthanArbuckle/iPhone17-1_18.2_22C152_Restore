@interface PFCloudKitMetadataValueTransformer
+ (NSArray)allowedTopLevelClasses;
@end

@implementation PFCloudKitMetadataValueTransformer

+ (NSArray)allowedTopLevelClasses
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS___PFCloudKitMetadataValueTransformer;
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithArray:", objc_msgSendSuper2(&v13, sel_allowedTopLevelClasses));
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  getCloudKitCKRecordClass[0]();
  v14[0] = objc_opt_class();
  getCloudKitCKShareClass[0]();
  v14[1] = objc_opt_class();
  getCloudKitCKRecordIDClass[0]();
  v14[2] = objc_opt_class();
  getCloudKitCKRecordZoneIDClass[0]();
  v14[3] = objc_opt_class();
  getCloudKitCKServerChangeTokenClass[0]();
  v14[4] = objc_opt_class();
  getCloudKitCKNotificationInfoClass[0]();
  v14[5] = objc_opt_class();
  v14[6] = objc_opt_class();
  v3 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:7];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [v2 addObject:*(void *)(*((void *)&v9 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v15 count:16];
    }
    while (v5);
  }
  return (NSArray *)v2;
}

@end