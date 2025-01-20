void sub_100002318(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  long long v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unsigned int v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  void v30[4];
  id v31;
  id v32;
  uint64_t v33;
  id v34;
  _OWORD v35[2];
  id v36;
  id v37;
  id v38;

  v2 = *(void **)(a1 + 32);
  v3 = *(void *)(a1 + 64);
  v38 = 0;
  v4 = [v2 _urlDecoderWithVersion:v3 error:&v38];
  v5 = v38;
  if (v4)
  {
    v6 = *(void *)(a1 + 40);
    v37 = 0;
    v7 = [v4 decodeURLWithData:v6 error:&v37];
    v8 = v37;
    [v4 clearCaches];
    if (v7)
    {
      if (*(unsigned char *)(a1 + 104))
      {
        v9 = +[CPSDeveloperOverride overrideForURL:v7];
        v36 = v5;
        v10 = *(_OWORD *)(a1 + 88);
        v35[0] = *(_OWORD *)(a1 + 72);
        v35[1] = v10;
        v11 = +[LSBundleProxy bundleProxyWithAuditToken:v35 error:&v36];
        v12 = v36;

        v13 = [v11 bundleIdentifier];
        v14 = (void *)v13;
        if (v12 || !v13)
        {
          v19 = *(void *)(a1 + 56);
          v20 = *(void **)(a1 + 32);
          v21 = [v12 localizedDescription];
          v22 = [v20 _urlDecoderErrorWithCode:0 description:v21];
          (*(void (**)(uint64_t, void *, void *))(v19 + 16))(v19, v7, v22);
        }
        else
        {
          v15 = [v9 clipBundleID];
          v16 = [v15 isEqualToString:v14];

          if (v16)
          {
            (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
          }
          else if ([*(id *)(a1 + 32) _associatedDomainIsApprovedForURL:v7 applicationIdentifier:*(void *)(a1 + 48)])
          {
            v23 = *(void **)(*(void *)(a1 + 32) + 24);
            if (!v23)
            {
              v24 = objc_alloc_init((Class)BCSBusinessQueryService);
              v25 = *(void *)(a1 + 32);
              v26 = *(void **)(v25 + 24);
              *(void *)(v25 + 24) = v24;

              v23 = *(void **)(*(void *)(a1 + 32) + 24);
            }
            v30[0] = _NSConcreteStackBlock;
            v30[1] = 3221225472;
            v30[2] = sub_100002698;
            v30[3] = &unk_100004210;
            v31 = v14;
            v32 = v7;
            v27 = *(id *)(a1 + 56);
            v33 = *(void *)(a1 + 32);
            v34 = v27;
            [v23 isBusinessRegisteredForURL:v32 chopURL:1 completion:v30];
          }
          else
          {
            v28 = *(void *)(a1 + 56);
            v29 = [*(id *)(a1 + 32) _urlDecoderErrorWithCode:3 description:@"Decoded URL is not authorized for this application"];
            (*(void (**)(uint64_t, void, void *))(v28 + 16))(v28, 0, v29);
          }
        }

        goto LABEL_16;
      }
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    else
    {
      v17 = *(void *)(a1 + 56);
      if (v8)
      {
        v18 = [*(id *)(a1 + 32) _urlDecoderErrorWithCode:2 description:@"Decoding of the URL failed"];
        (*(void (**)(uint64_t, void, void *))(v17 + 16))(v17, 0, v18);
      }
      else
      {
        (*(void (**)(void, void, void))(v17 + 16))(*(void *)(a1 + 56), 0, 0);
      }
    }
    v12 = v5;
LABEL_16:

    v5 = v12;
    goto LABEL_17;
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_17:
}

void sub_100002698(uint64_t a1, unsigned int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (v7 && a2) {
    a2 = [*(id *)(a1 + 32) isEqualToString:v7];
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    sub_100002A3C(a1, a2, (uint64_t)v7);
    if (a2) {
      goto LABEL_6;
    }
  }
  else if (a2)
  {
LABEL_6:
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    goto LABEL_11;
  }
  uint64_t v9 = *(void *)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 40);
  v10 = *(void **)(a1 + 48);
  if (v8)
  {
    v12 = [v8 localizedDescription];
    v13 = [v10 _urlDecoderErrorWithCode:0 description:v12];
    (*(void (**)(uint64_t, uint64_t, void *))(v9 + 16))(v9, v11, v13);
  }
  else
  {
    v14 = [v10 _urlDecoderErrorWithCode:4 description:@"URL is not registered as an app clip"];
    (*(void (**)(uint64_t, uint64_t, void *))(v9 + 16))(v9, v11, v14);
  }
LABEL_11:
}

void sub_100002838(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

uint64_t start()
{
  v0 = objc_opt_new();
  v1 = +[NSXPCListener serviceListener];
  [v1 setDelegate:v0];
  [v1 resume];

  return 0;
}

void sub_100002940(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000297C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000029B8()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "BarcodeParsingService: there is no text string in CIQRCodeFeature.", v0, 2u);
}

void sub_100002A00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100002A3C(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 40);
  int v5 = 138740483;
  uint64_t v6 = v3;
  if (a2) {
    CFStringRef v4 = @"YES";
  }
  else {
    CFStringRef v4 = @"NO";
  }
  __int16 v7 = 2112;
  CFStringRef v8 = v4;
  __int16 v9 = 2113;
  uint64_t v10 = a3;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "BarcodeParsingService: URL: %{sensitive}@, valid: %@, machingBundleID: %{private}@", (uint8_t *)&v5, 0x20u);
}

uint64_t MRCDescriptorCreateWithAttributes()
{
  return _MRCDescriptorCreateWithAttributes();
}

uint64_t MRCDescriptorDecodePayload()
{
  return _MRCDescriptorDecodePayload();
}

uint64_t WBSApplicationIdentifierFromAuditToken()
{
  return _WBSApplicationIdentifierFromAuditToken();
}

uint64_t WBSAuditTokenHasEntitlement()
{
  return _WBSAuditTokenHasEntitlement();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_clearCaches(void *a1, const char *a2, ...)
{
  return [a1 clearCaches];
}

id objc_msgSend_clipBundleID(void *a1, const char *a2, ...)
{
  return [a1 clipBundleID];
}

id objc_msgSend_codingVersion(void *a1, const char *a2, ...)
{
  return [a1 codingVersion];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return [a1 currentConnection];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return [a1 host];
}

id objc_msgSend_isApproved(void *a1, const char *a2, ...)
{
  return [a1 isApproved];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_messageString(void *a1, const char *a2, ...)
{
  return [a1 messageString];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_serviceSpecifier(void *a1, const char *a2, ...)
{
  return [a1 serviceSpecifier];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}