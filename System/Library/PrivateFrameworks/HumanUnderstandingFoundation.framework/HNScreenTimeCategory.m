@interface HNScreenTimeCategory
+ (id)categoryForBundleId:(id)a3;
@end

@implementation HNScreenTimeCategory

+ (id)categoryForBundleId:(id)a3
{
  id v3 = a3;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_22330BE10;
  v16 = sub_22330BE20;
  id v17 = 0;
  v5 = [MEMORY[0x263F318B0] sharedCategories];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_22330BE28;
  v9[3] = &unk_2646A8778;
  v11 = &v12;
  v6 = v4;
  v10 = v6;
  [v5 categoryForBundleID:v3 completionHandler:v9];

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

@end