@interface AMSAppleCardSilentEnrollment
+ (AMSBagKeySet)bagKeySet;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)createBagForSubProfile;
+ (id)gsTokenForAccount:(id)a3 error:(id *)a4;
+ (id)headersForAccount:(id)a3;
@end

@implementation AMSAppleCardSilentEnrollment

+ (id)gsTokenForAccount:(id)a3 error:(id *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [v5 accountStore];
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  v7 = (void **)qword_1EB38D610;
  uint64_t v23 = qword_1EB38D610;
  if (!qword_1EB38D610)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getAppleIDAuthenticationAppleIDSettingsTokenIdentifierSymbolLoc_block_invoke;
    v25 = &unk_1E559EC70;
    v26 = &v20;
    __getAppleIDAuthenticationAppleIDSettingsTokenIdentifierSymbolLoc_block_invoke((uint64_t)buf);
    v7 = (void **)v21[3];
  }
  _Block_object_dispose(&v20, 8);
  if (!v7)
  {
    dlerror();
    abort_report_np();
    __break(1u);
  }
  v8 = *v7;
  id v19 = 0;
  id v9 = v8;
  v10 = objc_msgSend(v6, "ams_fetchGrandSlamTokenForAccount:withIdentifier:error:", v5, v9, &v19);
  id v11 = v19;

  if (v10)
  {
    if (!a4) {
      goto LABEL_13;
    }
LABEL_12:
    *a4 = v11;
    goto LABEL_13;
  }
  v12 = +[AMSLogConfig sharedConfig];
  if (!v12)
  {
    v12 = +[AMSLogConfig sharedConfig];
  }
  v13 = [v12 OSLogObject];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v14 = objc_opt_class();
    id v15 = v14;
    v16 = AMSSetLogKeyIfNeeded();
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v14;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v16;
    _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] GS-Token lookup failed for no GS token", buf, 0x16u);
  }
  uint64_t v17 = AMSError(7, @"Silent Enrollment Error", @"No GS Token", 0);

  id v11 = (id)v17;
  if (a4) {
    goto LABEL_12;
  }
LABEL_13:

  return v10;
}

+ (id)headersForAccount:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = AMSSetLogKeyIfNeeded();
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v20 = 0;
  v7 = [a1 gsTokenForAccount:v4 error:&v20];

  id v8 = v20;
  if (v8) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v7 == 0;
  }
  if (v9)
  {
    v10 = +[AMSLogConfig sharedConfig];
    if (!v10)
    {
      v10 = +[AMSLogConfig sharedConfig];
    }
    id v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      uint64_t v22 = v12;
      __int16 v23 = 2114;
      v24 = v5;
      __int16 v25 = 2114;
      id v26 = v8;
      id v13 = v12;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to attach GS token with error: %{public}@", buf, 0x20u);
    }
  }
  objc_msgSend(v6, "ams_setNullableObject:forKey:", v7, @"X-Apple-GS-Token");
  v14 = [MEMORY[0x1E4F4BFA0] currentInfo];
  id v15 = [v14 clientInfoHeader];

  objc_msgSend(v6, "ams_setNullableObject:forKey:", v15, @"X-MMe-Client-Info");
  v16 = +[AMSDevice uniqueDeviceId];
  objc_msgSend(v6, "ams_setNullableObject:forKey:", v16, @"X-Mme-Device-Id");
  uint64_t v17 = +[AMSDevice deviceGUID];
  objc_msgSend(v6, "ams_setNullableObject:forKey:", v17, @"Guid");
  v18 = (void *)[v6 copy];

  return v18;
}

+ (NSString)bagSubProfile
{
  if (_MergedGlobals_80 != -1) {
    dispatch_once(&_MergedGlobals_80, &__block_literal_global_7);
  }
  v2 = (void *)qword_1EB38D5F8;
  return (NSString *)v2;
}

void __45__AMSAppleCardSilentEnrollment_bagSubProfile__block_invoke()
{
  v0 = (void *)qword_1EB38D5F8;
  qword_1EB38D5F8 = @"AMSAppleCardSilentEnrollment";
}

+ (NSString)bagSubProfileVersion
{
  if (qword_1EB38D600 != -1) {
    dispatch_once(&qword_1EB38D600, &__block_literal_global_12_0);
  }
  v2 = (void *)qword_1EB38D608;
  return (NSString *)v2;
}

void __52__AMSAppleCardSilentEnrollment_bagSubProfileVersion__block_invoke()
{
  v0 = (void *)qword_1EB38D608;
  qword_1EB38D608 = @"1";
}

+ (id)createBagForSubProfile
{
  v2 = [(id)objc_opt_class() bagSubProfile];
  v3 = [(id)objc_opt_class() bagSubProfileVersion];
  id v4 = +[AMSBag bagForProfile:v2 profileVersion:v3];

  return v4;
}

+ (AMSBagKeySet)bagKeySet
{
  v2 = objc_alloc_init(AMSBagKeySet);
  return v2;
}

@end