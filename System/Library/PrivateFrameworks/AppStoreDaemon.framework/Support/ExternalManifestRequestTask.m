@interface ExternalManifestRequestTask
- (void)main;
@end

@implementation ExternalManifestRequestTask

- (void)main
{
  if (self) {
    options = self->super._options;
  }
  else {
    options = 0;
  }
  v4 = options;
  v5 = objc_alloc_init(_TtC9appstored6LogKey);
  uint64_t v6 = qos_class_self();
  v7 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [(ASDRequestOptions *)v4 manifestURL];
    if (self) {
      client = self->super._client;
    }
    else {
      client = 0;
    }
    v10 = client;
    v11 = [(XPCClient *)v10 clientID];
    v12 = sub_10032F778(v6);
    *(_DWORD *)buf = 138413314;
    v38 = v5;
    __int16 v39 = 2114;
    v40 = v8;
    __int16 v41 = 2114;
    v42 = v11;
    __int16 v43 = 2114;
    v44 = v12;
    __int16 v45 = 1024;
    int v46 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[%@] Manifest for UPP: %{public}@ clientID: %{public}@ qoS: %{public}@ (0x%x)", buf, 0x30u);
  }
  v13 = objc_alloc_init(TaskQueue);
  v14 = [UPPManifestDownloadTask alloc];
  v15 = [(ASDRequestOptions *)v4 manifestURL];
  v16 = sub_100416894((uint64_t)XPCRequestToken, 1);
  v17 = sub_1002438B4((char *)v14, v15, v16, (char)[(ASDRequestOptions *)v4 shouldHideUserPrompts]);

  if (v17) {
    objc_setProperty_atomic(v17, v18, v5, 90);
  }
  if (self) {
    v19 = self->super._client;
  }
  else {
    v19 = 0;
  }
  v20 = v19;
  v21 = [(XPCClient *)v20 clientID];
  v23 = v21;
  if (v17)
  {
    objc_setProperty_atomic(v17, v22, v21, 82);

    *(_DWORD *)(v17 + 78) = v6;
  }
  else
  {
  }
  v36 = v17;
  v24 = +[NSArray arrayWithObjects:&v36 count:1];
  if (v13) {
    [(NSOperationQueue *)v13->_operationQueue addOperations:v24 waitUntilFinished:1];
  }

  if (v17) {
    id Property = objc_getProperty(v17, v25, 32, 1);
  }
  else {
    id Property = 0;
  }
  id v27 = Property;
  id v28 = objc_alloc((Class)ASDExternalManifestResponse);
  if (v27) {
    id v29 = [v28 initWithError:v27];
  }
  else {
    id v29 = [v28 initWithResults:&__NSArray0__struct];
  }
  v30 = v29;
  sub_1000079C8(self, v29);
  if (v17)
  {
    BOOL v32 = v17[24] & 1;
    if (!self) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  BOOL v32 = 0;
  if (self) {
LABEL_22:
  }
    self->super.super._success = v32;
LABEL_23:
  if (v17) {
    id v33 = objc_getProperty(v17, v31, 32, 1);
  }
  else {
    id v33 = 0;
  }
  id v35 = v33;
  if (self) {
    objc_setProperty_atomic_copy(self, v34, v35, 32);
  }
}

@end