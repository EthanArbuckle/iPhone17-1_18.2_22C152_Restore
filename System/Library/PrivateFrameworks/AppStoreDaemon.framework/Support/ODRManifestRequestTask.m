@interface ODRManifestRequestTask
- (void)main;
@end

@implementation ODRManifestRequestTask

- (void)main
{
  v2 = self;
  v3 = self->_application;
  self;
  id v4 = objc_alloc((Class)AMSURLRequestEncoder);
  v5 = sub_10030B11C();
  id v6 = [v4 initWithBag:v5];

  v7 = +[ACAccountStore ams_sharedAccountStore];
  v8 = objc_msgSend(v7, "ams_activeiTunesAccount");

  if (v8)
  {
    v9 = +[ACAccountStore ams_sharedAccountStore];
    v10 = objc_msgSend(v9, "ams_activeiTunesAccount");
    [v6 setAccount:v10];
  }
  v11 = v3;
  self;
  if (sub_1003BAD08((uint64_t)v11))
  {
    BOOL v12 = sub_1003BAA8C((uint64_t)v11);
    v13 = v11;
    self;
    id v14 = objc_alloc_init((Class)NSMutableDictionary);
    v15 = sub_1003BA26C((uint64_t)v13);
    [v14 setObject:v15 forKeyedSubscript:@"adamId"];

    uint64_t v16 = sub_1003BAE04((uint64_t)v13);
    v17 = (void *)v16;
    if (v16) {
      CFStringRef v18 = (const __CFString *)v16;
    }
    else {
      CFStringRef v18 = &stru_10052E4D8;
    }
    [v14 setObject:v18 forKeyedSubscript:@"thinningVariant"];

    v19 = sub_1003BA7E4((uint64_t)v13);
    if (v12)
    {
      [v14 setObject:v19 forKeyedSubscript:@"betaExternalVersionId"];

      v20 = sub_1003BA400((uint64_t)v13);
      [v14 setObject:v20 forKeyedSubscript:@"bundleShortVersionId"];

      v21 = sub_1003BA69C((uint64_t)v13);
      [v14 setObject:v21 forKeyedSubscript:@"bundleVersionId"];

      LODWORD(v21) = sub_1003BAC34((uint64_t)v13);
      if (!v21) {
        goto LABEL_20;
      }
      v13 = +[AMSDevice serialNumber];
      if (v13) {
        [v14 setObject:v13 forKeyedSubscript:@"serial-no"];
      }
    }
    else
    {
      [v14 setObject:v19 forKeyedSubscript:@"externalVersionId"];

      v23 = +[AMSDevice deviceGUID];
      if (v23) {
        [v14 setObject:v23 forKeyedSubscript:@"guid"];
      }
      if (sub_1003BAC34((uint64_t)v13))
      {
        v24 = +[AMSDevice serialNumber];
        if (v24) {
          [v14 setObject:v24 forKeyedSubscript:@"serial-no"];
        }
      }
    }

LABEL_20:
    v22 = 0;
    id v25 = 0;
    if (v14) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  v22 = +[NSError errorWithDomain:@"_OnDemandResourcesErrorDomain" code:117 userInfo:0];
LABEL_21:
  id v25 = v22;
  id v14 = 0;
LABEL_22:

  id v26 = v25;
  id v27 = v26;
  if (!v14)
  {
    if (v26)
    {
      v36 = 0;
    }
    else
    {
      ASDErrorWithDescription();
      id v27 = (id)objc_claimAutoreleasedReturnValue();
      v36 = 0;
      if (!v27) {
        goto LABEL_33;
      }
    }
LABEL_31:
    id v43 = v27;
    goto LABEL_34;
  }
  v56 = v2;
  v28 = sub_10030B11C();
  v29 = [v28 URLForKey:@"onDemandResources"];
  id v55 = v6;
  v30 = [v6 requestWithMethod:4 bagURL:v29 parameters:v14];
  *(void *)buf = v27;
  v31 = [v30 resultWithError:buf];
  id v32 = *(id *)buf;

  v33 = +[AMSURLSession defaultSession];
  v34 = [v33 dataTaskPromiseWithRequest:v31];

  id v57 = v32;
  v35 = [v34 resultWithError:&v57];
  id v27 = v57;

  v36 = [v35 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v37 = [v36 objectForKeyedSubscript:@"error"];
    uint64_t v38 = [v36 objectForKeyedSubscript:@"message"];
    v39 = (void *)v38;
    if (v37 && v38)
    {
      [v35 responseCorrelationId];
      v40 = v54 = v11;
      v41 = +[NSString stringWithFormat:@"Error message: %@, Correlation ID: %@", v39, v40];

      [v37 integerValue];
      uint64_t v42 = ASDErrorWithDescription();

      id v27 = (id)v42;
      v11 = v54;
    }
  }
  else
  {
    v37 = +[NSString stringWithFormat:@"Error fetching manifest, invalid response received: %@", v36];
    ASDErrorWithDescription();
    v39 = v27;
    id v27 = (id)objc_claimAutoreleasedReturnValue();
  }

  v2 = v56;
  id v6 = v55;
  if (v27) {
    goto LABEL_31;
  }
LABEL_33:
  id v43 = 0;
LABEL_34:

  id v44 = v43;
  v45 = v44;
  if (!v36)
  {
    if (!v44)
    {
      v45 = ASDErrorWithDescription();
      if (!v45) {
        goto LABEL_36;
      }
    }
LABEL_41:
    [(Task *)v2 completeWithError:v45];

    goto LABEL_42;
  }
  v46 = [ODRManifest alloc];
  v47 = sub_1003B9E28((uint64_t)v2->_application);
  v48 = (ODRManifest *)sub_1002AE640(v46, v36, v47, 1);
  manifest = v2->_manifest;
  v2->_manifest = v48;

  if (v45) {
    goto LABEL_41;
  }
LABEL_36:
  v50 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    v51 = sub_1002AEDB4((id *)&v2->_manifest->super.super.isa);
    id v52 = [v51 count];
    application = v2->_application;
    *(_DWORD *)buf = 134218242;
    *(void *)&buf[4] = v52;
    __int16 v59 = 2114;
    v60 = application;
    _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "Successfully fetched a manifest with %lu asset packs for %{public}@", buf, 0x16u);
  }
  [(Task *)v2 completeWithSuccess];
LABEL_42:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manifest, 0);
  objc_storeStrong((id *)&self->_application, 0);
}

@end