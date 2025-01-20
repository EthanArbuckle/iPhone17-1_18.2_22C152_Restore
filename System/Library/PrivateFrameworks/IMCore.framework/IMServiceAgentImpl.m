@interface IMServiceAgentImpl
+ (id)imageNameForStatus:(unint64_t)a3;
+ (id)imageURLForStatus:(unint64_t)a3;
+ (id)notificationCenter;
+ (id)sharedAgent;
+ (void)_determineStatusImageAppearance;
+ (void)forgetStatusImageAppearance;
- (IMServiceAgentImpl)init;
- (id)myAvailableMessages;
- (id)myAwayMessages;
- (id)notificationCenter;
- (id)serviceWithName:(id)a3;
- (unint64_t)vcCapabilities;
- (void)_customMessagesChanged:(id)a3;
- (void)_statusImageAppearanceChanged:(id)a3;
- (void)dealloc;
- (void)setMyAvailableMessages:(id)a3;
- (void)setMyAwayMessages:(id)a3;
- (void)setupComplete;
@end

@implementation IMServiceAgentImpl

+ (id)sharedAgent
{
  v2 = (void *)qword_1E965E8C0;
  if (!qword_1E965E8C0)
  {
    v3 = objc_alloc_init(IMServiceAgentImpl);
    v4 = (void *)qword_1E965E8C0;
    qword_1E965E8C0 = (uint64_t)v3;

    v2 = (void *)qword_1E965E8C0;
  }

  return v2;
}

- (IMServiceAgentImpl)init
{
  v3.receiver = self;
  v3.super_class = (Class)IMServiceAgentImpl;
  return [(IMServiceAgentImpl *)&v3 init];
}

- (void)dealloc
{
  v5 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], a2, v2, v3);
  objc_msgSend_removeObserver_name_object_(v5, v6, (uint64_t)self, 0, 0);

  v7.receiver = self;
  v7.super_class = (Class)IMServiceAgentImpl;
  [(IMServiceAgentImpl *)&v7 dealloc];
}

- (id)serviceWithName:(id)a3
{
  uint64_t v3 = (__CFString *)a3;
  objc_super v7 = objc_msgSend_sharedInstance(IMDaemonController, v4, v5, v6);
  objc_msgSend_blockUntilConnected(v7, v8, v9, v10);

  if (objc_msgSend_isEqualToString_(v3, v11, @"Bonjour", v12))
  {

    uint64_t v3 = @"SubNet";
  }
  v16 = objc_msgSend_sharedInstance(IMDaemonController, v13, v14, v15);
  v20 = objc_msgSend_listener(v16, v17, v18, v19);
  v23 = objc_msgSend_serviceWithName_(v20, v21, (uint64_t)v3, v22);

  return v23;
}

+ (id)notificationCenter
{
  return 0;
}

- (id)notificationCenter
{
  return 0;
}

+ (void)forgetStatusImageAppearance
{
  qword_1E965BF20 = -1;
}

- (void)_statusImageAppearanceChanged:(id)a3
{
  v4 = objc_opt_class();
  objc_msgSend_forgetStatusImageAppearance(v4, v5, v6, v7);
  objc_msgSend_notificationCenter(self, v8, v9, v10);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend___mainThreadPostNotificationName_object_(v12, v11, @"__kIMStatusImagesChangedAppearanceNotification", 0);
}

+ (void)_determineStatusImageAppearance
{
  objc_msgSend__IMAppObjectForKey_(MEMORY[0x1E4F1CB18], a2, @"UseAlternateStatusIndicators", v2);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  qword_1E965BF20 = objc_msgSend_BOOLValue(v6, v3, v4, v5);
}

+ (id)imageNameForStatus:(unint64_t)a3
{
  if (qword_1E965BF20 == -1) {
    objc_msgSend__determineStatusImageAppearance(a1, a2, a3, v3);
  }
  if (a3 - 1 > 3) {
    uint64_t v5 = @"NSStatusUnknown";
  }
  else {
    uint64_t v5 = off_1E5B7CB40[a3 - 1];
  }
  if (qword_1E965BF20)
  {
    objc_msgSend_stringByAppendingString_(v5, a2, @"Flat", v3);
    uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

+ (id)imageURLForStatus:(unint64_t)a3
{
  if (qword_1E965BF20 == -1) {
    objc_msgSend__determineStatusImageAppearance(a1, a2, a3, v3);
  }
  uint64_t v5 = (void *)qword_1E965E8C8;
  if (!qword_1E965E8C8)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = (void *)qword_1E965E8C8;
    qword_1E965E8C8 = (uint64_t)v6;

    v8 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v9 = _IMFrameworkBundle();
    v11 = objc_msgSend_pathForResource_ofType_(v9, v10, @"OnlineStatuses", @"plist");
    uint64_t v14 = objc_msgSend_dictionaryWithContentsOfFile_(v8, v12, (uint64_t)v11, v13);

    v17 = objc_msgSend_objectForKey_(v14, v15, @"StatusList", v16);
    uint64_t v21 = objc_msgSend_count(v17, v18, v19, v20);
    if (v21)
    {
      uint64_t v23 = v21;
      for (uint64_t i = 0; i != v23; ++i)
      {
        uint64_t v25 = IMPersonStatusFromFZPersonStatus(i, v22);
        v28 = objc_msgSend_objectAtIndex_(v17, v26, v25, v27);
        v29 = (void *)qword_1E965E8C8;
        v32 = objc_msgSend_objectForKey_(v28, v30, @"ImageName", v31);
        objc_msgSend_addObject_(v29, v33, (uint64_t)v32, v34);
      }
    }

    uint64_t v5 = (void *)qword_1E965E8C8;
  }
  if (objc_msgSend_count(v5, a2, a3, v3) && objc_msgSend_count((void *)qword_1E965E8C8, v35, v36, v37) > a3)
  {
    v40 = objc_msgSend_objectAtIndex_((void *)qword_1E965E8C8, v38, a3, v39);
    v43 = v40;
    if (qword_1E965BF20 == 1)
    {
      uint64_t v44 = objc_msgSend_stringByAppendingString_(v40, v41, @"_flat", v42);

      v43 = (void *)v44;
    }
    if (v43)
    {
      v45 = (void *)MEMORY[0x1E4F1CB10];
      v46 = _IMFrameworkBundle();
      v48 = objc_msgSend_pathForResource_ofType_(v46, v47, (uint64_t)v43, @"tiff");
      v51 = objc_msgSend_fileURLWithPath_(v45, v49, (uint64_t)v48, v50);
    }
    else
    {
      v51 = 0;
    }
  }
  else
  {
    v51 = 0;
  }

  return v51;
}

- (void)_customMessagesChanged:(id)a3
{
  id v4 = a3;
  IMSyncronizeAppPreferences();
  v8 = objc_msgSend_notificationCenter(self, v5, v6, v7);
  id v12 = objc_msgSend_name(v4, v9, v10, v11);
  uint64_t v13 = qword_1E965E8C0;
  v17 = objc_msgSend_userInfo(v4, v14, v15, v16);

  objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v8, v18, (uint64_t)v12, v13, v17);
  objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v19, v20, v21);
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend___mainThreadPostNotificationName_object_(v23, v22, @"__kIMCustomStatusMessagesChangedNotification", 0);
}

- (id)myAvailableMessages
{
  uint64_t v2 = *MEMORY[0x1E4F6C4A8];
  uint64_t v3 = IMGetCachedDomainValueForKey();
  if (objc_msgSend_count(v3, v4, v5, v6))
  {
    id v9 = v3;
  }
  else
  {
    objc_msgSend__IMAppObjectForKey_(MEMORY[0x1E4F1CB18], v7, v2, v8);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v10 = v9;

  return v10;
}

- (id)myAwayMessages
{
  uint64_t v2 = *MEMORY[0x1E4F6C4B0];
  uint64_t v3 = IMGetCachedDomainValueForKey();
  if (objc_msgSend_count(v3, v4, v5, v6))
  {
    id v9 = v3;
  }
  else
  {
    objc_msgSend__IMAppObjectForKey_(MEMORY[0x1E4F1CB18], v7, v2, v8);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v10 = v9;

  return v10;
}

- (void)setMyAvailableMessages:(id)a3
{
  IMSetDomainValueForKey();
  objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v3, v4, v5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend___mainThreadPostNotificationName_object_(v7, v6, @"__kIMCustomStatusMessagesChangedNotification", 0);
}

- (void)setMyAwayMessages:(id)a3
{
  IMSetDomainValueForKey();
  objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v3, v4, v5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend___mainThreadPostNotificationName_object_(v7, v6, @"__kIMCustomStatusMessagesChangedNotification", 0);
}

- (void)setupComplete
{
  objc_msgSend_sharedInstance(IMDaemonController, a2, v2, v3);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = objc_msgSend_listener(v14, v4, v5, v6);
  uint64_t v11 = objc_msgSend_allServices(v7, v8, v9, v10);
  objc_msgSend_makeObjectsPerformSelector_(v11, v12, (uint64_t)sel_doneSetup, v13);
}

- (unint64_t)vcCapabilities
{
  uint64_t v4 = objc_msgSend_sharedInstance(IMDaemonController, a2, v2, v3);
  uint64_t v8 = objc_msgSend_listener(v4, v5, v6, v7);
  unint64_t v12 = objc_msgSend_vcCapabilities(v8, v9, v10, v11);

  return v12;
}

@end