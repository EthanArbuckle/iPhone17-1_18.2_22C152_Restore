@interface BCCloudKitDataChangedTransaction
+ (id)transactionNameForEntityName:(id)a3;
- (BCCloudKitDataChangedTransaction)initWithEntityName:(id)a3 notificationName:(id)a4 delegate:(id)a5;
- (NSString)notificationName;
- (double)coalescingDelay;
- (void)performWorkWithCompletion:(id)a3;
- (void)setNotificationName:(id)a3;
@end

@implementation BCCloudKitDataChangedTransaction

- (BCCloudKitDataChangedTransaction)initWithEntityName:(id)a3 notificationName:(id)a4 delegate:(id)a5
{
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)BCCloudKitDataChangedTransaction;
  v16 = [(BCCloudKitTransaction *)&v20 initWithEntityName:a3 delegate:a5];
  if (v16)
  {
    uint64_t v17 = objc_msgSend_copy(v8, v9, v10, v11, v12, v13, v14, v15);
    notificationName = v16->_notificationName;
    v16->_notificationName = (NSString *)v17;
  }
  return v16;
}

+ (id)transactionNameForEntityName:(id)a3
{
  return (id)objc_msgSend_stringByAppendingString_(@"BCCloudKitDataChangedTransaction-", a2, (uint64_t)a3, v3, v4, v5, v6, v7);
}

- (void)performWorkWithCompletion:(id)a3
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v12 = objc_msgSend_shared(MEMORY[0x263F2BA58], v5, v6, v7, v8, v9, v10, v11);
  int v20 = objc_msgSend_verboseLoggingEnabled(v12, v13, v14, v15, v16, v17, v18, v19);

  if (v20)
  {
    v28 = BDSCloudKitDevelopmentLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v36 = objc_msgSend_notificationName(self, v29, v30, v31, v32, v33, v34, v35);
      *(_DWORD *)buf = 138543362;
      v90 = v36;
      _os_log_impl(&dword_2360BC000, v28, OS_LOG_TYPE_DEFAULT, "\"\\\"Transaction - posting notification %{public}@\\\"\"", buf, 0xCu);
    }
  }
  v37 = objc_msgSend_defaultCenter(MEMORY[0x263F087C8], v21, v22, v23, v24, v25, v26, v27);
  v45 = objc_msgSend_notificationName(self, v38, v39, v40, v41, v42, v43, v44);
  objc_msgSend_postNotificationName_object_(v37, v46, (uint64_t)v45, 0, v47, v48, v49, v50);

  if (BDSXPCNotificationsEnabled())
  {
    v51 = BDSServiceXPCNotificationLog();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      v59 = objc_msgSend_notificationName(self, v52, v53, v54, v55, v56, v57, v58);
      *(_DWORD *)buf = 138543362;
      v90 = v59;
      _os_log_impl(&dword_2360BC000, v51, OS_LOG_TYPE_DEFAULT, "posting BDSServiceNotificationName for %{public}@", buf, 0xCu);
    }
    v67 = objc_msgSend_notificationName(self, v60, v61, v62, v63, v64, v65, v66, @"name");
    v88 = v67;
    v72 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v68, (uint64_t)&v88, (uint64_t)&v87, 1, v69, v70, v71);

    v80 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v73, v74, v75, v76, v77, v78, v79);
    objc_msgSend_postNotificationName_object_userInfo_(v80, v81, @"BDSServiceNotificationName", 0, (uint64_t)v72, v82, v83, v84);
  }
  v85 = _Block_copy(v4);
  v86 = v85;
  if (v85) {
    (*((void (**)(void *))v85 + 2))(v85);
  }
}

- (double)coalescingDelay
{
  return 0.25;
}

- (NSString)notificationName
{
  return self->_notificationName;
}

- (void)setNotificationName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end