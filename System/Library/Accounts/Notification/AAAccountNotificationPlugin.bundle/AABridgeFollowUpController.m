@interface AABridgeFollowUpController
+ (void)dismissBridgeAppleIDFollowUp;
@end

@implementation AABridgeFollowUpController

+ (void)dismissBridgeAppleIDFollowUp
{
  v26[1] = *MEMORY[0x263EF8340];
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2050000000;
  v5 = (void *)qword_268C87BC0;
  uint64_t v25 = qword_268C87BC0;
  if (!qword_268C87BC0)
  {
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = sub_24052BAC4;
    v21[3] = &unk_2650BEC30;
    v21[4] = &v22;
    sub_24052BAC4((uint64_t)v21, a2, v2, v3, v4);
    v5 = (void *)v23[3];
  }
  v6 = v5;
  _Block_object_dispose(&v22, 8);
  id v7 = [v6 alloc];
  v11 = objc_msgSend_initWithClientIdentifier_(v7, v8, @"com.apple.Bridge", v9, v10);
  v15 = objc_msgSend_stringWithFormat_(NSString, v12, @"%@.%@", v13, v14, @"com.apple.Bridge", @"AppleID-FollowUp");
  v26[0] = v15;
  v18 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v16, (uint64_t)v26, 1, v17);
  objc_msgSend_clearPendingFollowUpItemsWithUniqueIdentifiers_completion_(v11, v19, (uint64_t)v18, (uint64_t)&unk_26F49EC48, v20);
}

@end