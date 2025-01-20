@interface IMCoreCommSafetyHelper
+ (id)sharedInstance;
- (id)_urlFromAddressList:(id)a3;
- (void)addressesForParents:(id)a3 completion:(id)a4;
- (void)getOpenChatURLWith:(id)a3;
@end

@implementation IMCoreCommSafetyHelper

+ (id)sharedInstance
{
  if (qword_1EB3F2338 != -1) {
    dispatch_once(&qword_1EB3F2338, &unk_1EF8E5658);
  }
  v2 = (void *)qword_1E965E778;

  return v2;
}

- (void)getOpenChatURLWith:(id)a3
{
  id v4 = a3;
  v8 = objc_msgSend_sharedManager(MEMORY[0x1E4F6E6D0], v5, v6, v7);
  int IsYoungAgeGroup = objc_msgSend_childIsYoungAgeGroup(v8, v9, v10, v11);
  int v13 = _IMWillLog();
  if (IsYoungAgeGroup)
  {
    if (v13)
    {
      v22 = objc_msgSend_parents(v8, v14, v15, v16);
      _IMAlwaysLog();
    }
    v17 = objc_msgSend_parents(v8, v14, v15, v16, v22);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = sub_1A4C0F3D8;
    v25[3] = &unk_1E5B7E310;
    v18 = &v26;
    v25[4] = self;
    id v26 = v4;
    id v19 = v4;
    objc_msgSend_addressesForParents_completion_(self, v20, (uint64_t)v17, (uint64_t)v25);
  }
  else
  {
    if (v13) {
      _IMAlwaysLog();
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1A4C0F4F0;
    block[3] = &unk_1E5B7B220;
    v18 = &v24;
    block[4] = self;
    id v24 = v4;
    id v21 = v4;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

- (void)addressesForParents:(id)a3 completion:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v39 = a4;
  uint64_t v6 = dispatch_group_create();
  uint64_t v10 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v7, v8, v9);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = v5;
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v48, (uint64_t)v52, 16);
  if (v12)
  {
    uint64_t v16 = v12;
    uint64_t v17 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v49 != v17) {
          objc_enumerationMutation(obj);
        }
        id v19 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        v20 = objc_msgSend_contact(v19, v13, v14, v15, v39);

        if (v20)
        {
          dispatch_group_enter(v6);
          id v24 = (void *)MEMORY[0x1E4F1CAD0];
          v28 = objc_msgSend_contact(v19, v25, v26, v27);
          v31 = objc_msgSend_setWithObject_(v24, v29, (uint64_t)v28, v30);
          v45[0] = MEMORY[0x1E4F143A8];
          v45[1] = 3221225472;
          v45[2] = sub_1A4C0F820;
          v45[3] = &unk_1E5B7E338;
          v45[4] = v19;
          id v46 = v10;
          v47 = v6;
          objc_msgSend_bestHandlesForContacts_completion_(IMHandle, v32, (uint64_t)v31, (uint64_t)v45);
        }
        else
        {
          v33 = objc_msgSend_appleID(v19, v21, v22, v23);
          objc_msgSend_addObject_(v10, v34, (uint64_t)v33, v35);
        }
      }
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v48, (uint64_t)v52, 16);
    }
    while (v16);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A4C0FA28;
  block[3] = &unk_1E5B7B180;
  id v42 = v10;
  id v43 = obj;
  id v44 = v39;
  id v36 = v39;
  id v37 = obj;
  id v38 = v10;
  dispatch_group_notify(v6, MEMORY[0x1E4F14428], block);
}

- (id)_urlFromAddressList:(id)a3
{
  id v3 = a3;
  uint64_t v6 = objc_msgSend_componentsWithString_(MEMORY[0x1E4F29088], v4, @"sms://open", v5);
  uint64_t v7 = objc_opt_new();
  uint64_t v9 = objc_msgSend_queryItemWithName_value_(MEMORY[0x1E4F290C8], v8, @"service", *MEMORY[0x1E4F6E1B0]);
  objc_msgSend_addObject_(v7, v10, (uint64_t)v9, v11);

  uint64_t v12 = IMSharedUtilitiesFrameworkBundle();
  uint64_t v14 = objc_msgSend_localizedStringForKey_value_table_(v12, v13, @"MESSAGE_GROWNUP_BODY", (uint64_t)&stru_1EF8E78C8, @"CommSafetyLocalizable");

  uint64_t v16 = objc_msgSend_queryItemWithName_value_(MEMORY[0x1E4F290C8], v15, @"body", (uint64_t)v14);
  objc_msgSend_addObject_(v7, v17, (uint64_t)v16, v18);

  if (v3 && objc_msgSend_count(v3, v19, v20, v21))
  {
    uint64_t v22 = objc_msgSend_componentsJoinedByString_(v3, v19, @",", v21);
    id v24 = objc_msgSend_queryItemWithName_value_(MEMORY[0x1E4F290C8], v23, @"recipients", (uint64_t)v22);
    objc_msgSend_addObject_(v7, v25, (uint64_t)v24, v26);
  }
  objc_msgSend_setQueryItems_(v6, v19, (uint64_t)v7, v21);
  uint64_t v30 = objc_msgSend_URL(v6, v27, v28, v29);

  return v30;
}

@end