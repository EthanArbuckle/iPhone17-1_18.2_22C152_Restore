@interface AMSFamilyContentDeletionEvent
+ (id)_notificationPayloadWithAccountPairs:(id)a3;
+ (void)postDistributedNotificationWithAccountPairs:(id)a3;
@end

@implementation AMSFamilyContentDeletionEvent

+ (void)postDistributedNotificationWithAccountPairs:(id)a3
{
  CFDictionaryRef userInfo = [a1 _notificationPayloadWithAccountPairs:a3];
  if (userInfo)
  {
    DistributedCenter = CFNotificationCenterGetDistributedCenter();
    CFNotificationCenterPostNotification(DistributedCenter, @"com.apple.StoreServices.SSVFamilyContentDeletionNotification", 0, userInfo, 0);
  }
}

+ (id)_notificationPayloadWithAccountPairs:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v21[0] = @"did";
        v10 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", objc_msgSend(v9, "downloaderAccountID"));
        v22[0] = v10;
        v21[1] = @"fid";
        v11 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", objc_msgSend(v9, "familyID"));
        v22[1] = v11;
        v21[2] = @"pid";
        v12 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", objc_msgSend(v9, "purchaserAccountID"));
        v22[2] = v12;
        v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];

        [v4 addObject:v13];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v6);
  }

  if ([v4 count]) {
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v4, @"pairs", 0);
  }
  else {
    v14 = 0;
  }

  return v14;
}

@end