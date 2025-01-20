@interface GDScreenTimeCategory
+ (id)categoryForBundleId:(id)a3;
@end

@implementation GDScreenTimeCategory

+ (id)categoryForBundleId:(id)a3
{
  id v3 = a3;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_1C791E8B4;
  v20 = sub_1C791E8C4;
  id v21 = 0;
  v8 = objc_msgSend_sharedCategories(MEMORY[0x1E4F580A0], v5, v6, v7);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1C791E8CC;
  v13[3] = &unk_1E65371C8;
  v15 = &v16;
  v9 = v4;
  v14 = v9;
  objc_msgSend_categoryForBundleID_completionHandler_(v8, v10, (uint64_t)v3, (uint64_t)v13);

  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  id v11 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v11;
}

@end