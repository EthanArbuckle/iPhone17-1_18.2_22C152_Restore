@interface ApplePayDiagnosticsExtension
- (ApplePayDiagnosticsExtension)init;
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
@end

@implementation ApplePayDiagnosticsExtension

- (ApplePayDiagnosticsExtension)init
{
  v3.receiver = self;
  v3.super_class = (Class)ApplePayDiagnosticsExtension;
  return [(ApplePayDiagnosticsExtension *)&v3 init];
}

- (id)attachmentList
{
  return [(ApplePayDiagnosticsExtension *)self attachmentsForParameters:0];
}

- (id)attachmentsForParameters:(id)a3
{
  id v3 = a3;
  v23 = [v3 objectForKeyedSubscript:@"DEExtensionHostAppKey"];
  v4 = [v3 objectForKeyedSubscript:@"DEExtensionAttachmentsParamConsentProvidedKey"];
  unsigned int v5 = [v4 BOOLValue];

  v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v23;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "ApplePayDiagnosticsExtension: Host Application: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "ApplePayDiagnosticsExtension: Sensitive Collection Allowed", (uint8_t *)&buf, 2u);
    }

    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v38 = 0x3032000000;
    v39 = sub_100003738;
    v40 = sub_100003748;
    id v41 = 0;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100003750;
    v29[3] = &unk_100004130;
    p_long long buf = &buf;
    v8 = v7;
    v30 = v8;
    +[PKDiagnostics generateDiagnosticsPackageWithPassLibrary:0 completion:v29];
    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    if (*(void *)(*((void *)&buf + 1) + 40))
    {
      v9 = objc_alloc_init((Class)NSMutableArray);
      unsigned int v20 = [*(id *)(*((void *)&buf + 1) + 40) startAccessingSecurityScopedResource];
      v10 = +[NSFileManager defaultManager];
      uint64_t v11 = *(void *)(*((void *)&buf + 1) + 40);
      id v28 = 0;
      v21 = [v10 contentsOfDirectoryAtURL:v11 includingPropertiesForKeys:0 options:0 error:&v28];
      v22 = v28;

      if (v22)
      {
        v12 = v6;
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          v13 = [*(id *)(*((void *)&buf + 1) + 40) path];
          *(_DWORD *)v32 = 138543618;
          id v33 = v13;
          __int16 v34 = 2114;
          v35 = v22;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "ApplePayDiagnosticsExtension: Error getting contents of %{public}@, error: %{public}@", v32, 0x16u);

          v12 = v6;
        }
      }
      else
      {
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        v12 = v21;
        id v15 = [v12 countByEnumeratingWithState:&v24 objects:v36 count:16];
        if (v15)
        {
          uint64_t v16 = *(void *)v25;
          do
          {
            for (i = 0; i != v15; i = (char *)i + 1)
            {
              if (*(void *)v25 != v16) {
                objc_enumerationMutation(v12);
              }
              v18 = +[DEAttachmentItem attachmentWithPathURL:*(void *)(*((void *)&v24 + 1) + 8 * i)];
              [v18 setDeleteOnAttach:&__kCFBooleanTrue];
              if (v18) {
                [v9 addObject:v18];
              }
            }
            id v15 = [v12 countByEnumeratingWithState:&v24 objects:v36 count:16];
          }
          while (v15);
        }
      }

      if (v20) {
        [*(id *)(*((void *)&buf + 1) + 40) stopAccessingSecurityScopedResource];
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v32 = 138412546;
        id v33 = v3;
        __int16 v34 = 2112;
        v35 = v9;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "ApplePayDiagnosticsExtension: attachmentsForParameters: %@ %@", v32, 0x16u);
      }

      id v14 = [v9 copy];
      v6 = v9;
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v32 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "ApplePayDiagnosticsExtension: Error requesting diagnostics", v32, 2u);
      }
      id v14 = &__NSArray0__struct;
    }

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    id v14 = &__NSArray0__struct;
  }

  return v14;
}

@end