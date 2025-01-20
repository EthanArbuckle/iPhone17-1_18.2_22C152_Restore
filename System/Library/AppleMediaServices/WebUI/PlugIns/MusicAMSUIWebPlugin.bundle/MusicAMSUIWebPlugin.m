void sub_314C(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  CFStringRef v5;
  CFStringRef v6;
  uint64_t vars8;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    [v3 finishWithError:a2];
  }
  else
  {
    v5 = @"status";
    v6 = @"succeeded";
    v4 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
    [*(id *)(a1 + 32) finishWithResult:v4];
  }
}

uint64_t AMSError()
{
  return _AMSError();
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_isCloudLibraryEnabled(void *a1, const char *a2, ...)
{
  return [a1 isCloudLibraryEnabled];
}

id objc_msgSend_propertiesChangedHandler(void *a1, const char *a2, ...)
{
  return [a1 propertiesChangedHandler];
}

id objc_msgSend_sharedCloudController(void *a1, const char *a2, ...)
{
  return [a1 sharedCloudController];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}
(id)generateGlobalProperties
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  CFStringRef v7;
  void *v8;
  uint64_t vars8;

  v2 = +[MPCloudController sharedCloudController];
  v3 = [v2 isCloudLibraryEnabled];

  v7 = @"iCloudLibraryEnabled";
  v4 = +[NSNumber numberWithBool:v3];
  v8 = v4;
  v5 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];

  return v5;
}

- (id)runActionWithIdentifier:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_314C;
  v14[3] = &unk_4170;
  id v8 = objc_alloc_init((Class)AMSPromise);
  id v15 = v8;
  v9 = objc_retainBlock(v14);
  unsigned int v10 = [v7 isEqualToString:@"enableCloudLibrary"];

  if (v10)
  {
    [(MusicAMSUIWebPlugin *)self _enableCloudLibraryWithOptions:v6 completionHandler:v9];
  }
  else
  {
    v11 = AMSError();
    [v8 finishWithError:v11];
  }
  id v12 = v8;

  return v12;
}

- (void)_enableCloudLibraryWithOptions:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5
    && ([v5 valueForKey:@"mergeWithCloudLibrary"],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    id v8 = [v5 valueForKey:@"mergeWithCloudLibrary"];
    id v9 = [v8 BOOLValue];
  }
  else
  {
    id v9 = &dword_0 + 1;
  }
  v13[0] = MPCloudControllerEnableCloudLibraryOptionStartInitialImport;
  v13[1] = MPCloudControllerEnableCloudLibraryOptionMergeWithCloudLibrary;
  v14[0] = &__kCFBooleanTrue;
  unsigned int v10 = +[NSNumber numberWithBool:v9];
  v14[1] = v10;
  v11 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];

  id v12 = +[MPCloudController sharedCloudController];
  [v12 enableCloudLibraryWithOptions:v11 completionHandler:v6];
}

- (void)_cloudLibaryEnabledDidChange
{
  v2 = [(MusicAMSUIWebPlugin *)self propertiesChangedHandler];
  v2[2]();
}

- (ACAccount)account
{
  return self->_account;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (id)propertiesChangedHandler
{
  return self->_propertiesChangedHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_propertiesChangedHandler, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_bag, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end