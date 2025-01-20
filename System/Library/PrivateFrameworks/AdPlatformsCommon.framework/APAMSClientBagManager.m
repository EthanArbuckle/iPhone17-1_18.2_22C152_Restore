@interface APAMSClientBagManager
+ (BOOL)isSubsequentAdsFetchDisabled;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)adprivacydBag;
+ (void)isDisabledAdsPrefetch:(id)a3 withCompletionHandler:(id)a4;
+ (void)isSubsequentAdsFetchDisabled:(id)a3 withCompletionHandler:(id)a4;
@end

@implementation APAMSClientBagManager

+ (NSString)bagSubProfile
{
  if (qword_26AB0B188 != -1) {
    dispatch_once(&qword_26AB0B188, &unk_26D9FF240);
  }
  v2 = (void *)qword_26AB0B180;
  return (NSString *)v2;
}

+ (NSString)bagSubProfileVersion
{
  if (qword_26AB0B198 != -1) {
    dispatch_once(&qword_26AB0B198, &unk_26D9FF2A0);
  }
  v2 = (void *)qword_26AB0B190;
  return (NSString *)v2;
}

+ (id)adprivacydBag
{
  v7 = (void *)MEMORY[0x263F27B28];
  v8 = objc_msgSend_bagSubProfile(APAMSClientBagManager, a2, v2, v3, v4, v5, v6);
  v15 = objc_msgSend_bagSubProfileVersion(APAMSClientBagManager, v9, v10, v11, v12, v13, v14);
  v20 = objc_msgSend_bagForProfile_profileVersion_(v7, v16, (uint64_t)v8, (uint64_t)v15, v17, v18, v19);

  return v20;
}

+ (BOOL)isSubsequentAdsFetchDisabled
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  v8 = objc_msgSend_adprivacydBag(a1, a2, v2, v3, v4, v5, v6);
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  char v47 = 0;
  double v14 = objc_msgSend_BOOLForKey_(v8, v10, @"disablePromotedContentDaemonSubsequentAdsFetch", v11, v12, COERCE_DOUBLE(0x2020000000), v13);
  v21 = objc_msgSend_valuePromise(v14, v15, v16, v17, v18, v19, v20);

  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = sub_22630D5C8;
  v40[3] = &unk_26479BAA0;
  v42 = &v44;
  id v43 = a1;
  v22 = v9;
  v41 = v22;
  objc_msgSend_addFinishBlock_(v21, v23, (uint64_t)v40, v24, v25, v26, v27);
  dispatch_time_t v28 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v22, v28))
  {
    v29 = APLogForCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = objc_opt_class();
      *(_DWORD *)buf = 138477827;
      v49 = v30;
      id v31 = v30;
      _os_log_impl(&dword_226303000, v29, OS_LOG_TYPE_ERROR, "%{private}@: Failed to get the 'disablePromotedContentDaemonSubsequentAdsFetch' key from the bag in time.", buf, 0xCu);
    }
    v37 = objc_msgSend_stringWithFormat_(NSString, v32, @"Failed to get the 'disablePromotedContentDaemonSubsequentAdsFetch' key from the bag in time.", v33, v34, v35, v36);
    CreateDiagnosticReport();
  }
  BOOL v38 = *((unsigned char *)v45 + 24) != 0;

  _Block_object_dispose(&v44, 8);
  return v38;
}

+ (void)isSubsequentAdsFetchDisabled:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v11 = a4;
  if (!v6)
  {
    objc_msgSend_adprivacydBag(a1, v7, v8, v9, v10, v12, v13);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  double v14 = objc_msgSend_BOOLForKey_(v6, v7, @"disablePromotedContentDaemonSubsequentAdsFetch", v9, v10, v12, v13);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = sub_22630D7AC;
  v21[3] = &unk_26479BAC8;
  id v22 = v11;
  id v23 = a1;
  id v15 = v11;
  objc_msgSend_valueWithCompletion_(v14, v16, (uint64_t)v21, v17, v18, v19, v20);
}

+ (void)isDisabledAdsPrefetch:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v11 = a4;
  if (!v6)
  {
    objc_msgSend_adprivacydBag(a1, v7, v8, v9, v10, v12, v13);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  double v14 = objc_msgSend_BOOLForKey_(v6, v7, @"disableAdsPreFetch7006", v9, v10, v12, v13);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = sub_22630D99C;
  v21[3] = &unk_26479BAF0;
  id v22 = v11;
  id v15 = v11;
  objc_msgSend_valueWithCompletion_(v14, v16, (uint64_t)v21, v17, v18, v19, v20);
}

@end