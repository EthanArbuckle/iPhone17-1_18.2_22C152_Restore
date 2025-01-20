@interface CLSContextProviderService
- (CLSContextProviderService)init;
- (CLSContextProviderService)initWithExtension:(id)a3;
- (NSString)appIdentifier;
- (NSString)appName;
- (NSString)extensionIdentifier;
- (NSString)localizedAppName;
- (id)description;
- (void)connectWithCompletionHandler:(id)a3;
- (void)disconnect;
- (void)getMainAppContextPathWithCompletion:(id)a3;
- (void)updateDescendantsOfContextPath:(id)a3 completion:(id)a4;
@end

@implementation CLSContextProviderService

- (CLSContextProviderService)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSString;
  uint64_t v6 = objc_opt_class();
  v7 = NSStringFromSelector(a2);
  v9 = objc_msgSend_stringWithFormat_(v5, v8, @"The method -[%@ %@] is not available.", v6, v7);
  objc_msgSend_exceptionWithName_reason_userInfo_(v3, v10, v4, v9, 0);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v11);
}

- (CLSContextProviderService)initWithExtension:(id)a3
{
  id v5 = a3;
  v41.receiver = self;
  v41.super_class = (Class)CLSContextProviderService;
  id v6 = [(CLSContextProviderService *)&v41 init];
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.ClassKit.ContextProviderServiceConnection", v8);
    v10 = (void *)*((void *)v6 + 1);
    *((void *)v6 + 1) = v9;

    objc_storeStrong((id *)v6 + 2, a3);
    uint64_t v13 = objc_msgSend_identifier(v5, v11, v12);
    v14 = (void *)*((void *)v6 + 8);
    *((void *)v6 + 8) = v13;

    id v15 = objc_alloc(MEMORY[0x1E4F223A0]);
    v17 = objc_msgSend_initWithBundleIdentifier_error_(v15, v16, *((void *)v6 + 8), 0);
    v20 = v17;
    if (v17)
    {
      v21 = objc_msgSend_containingBundleRecord(v17, v18, v19);
      v24 = objc_msgSend_infoDictionary(v21, v22, v23);
      uint64_t v27 = objc_msgSend_bundleIdentifier(v21, v25, v26);
      v28 = (void *)*((void *)v6 + 9);
      *((void *)v6 + 9) = v27;

      uint64_t v29 = *MEMORY[0x1E4F1D008];
      uint64_t v30 = objc_opt_class();
      uint64_t v32 = objc_msgSend_objectForKey_ofClass_(v24, v31, v29, v30);
      v33 = (void *)*((void *)v6 + 10);
      *((void *)v6 + 10) = v32;

      if (!objc_msgSend_length(*((void **)v6 + 10), v34, v35)) {
        objc_storeStrong((id *)v6 + 10, *((id *)v6 + 9));
      }
      uint64_t v38 = objc_msgSend_localizedName(v21, v36, v37);
      v39 = (void *)*((void *)v6 + 11);
      *((void *)v6 + 11) = v38;
    }
  }

  return (CLSContextProviderService *)v6;
}

- (void)connectWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  serviceConnectionQueue = self->_serviceConnectionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1DC6616AC;
  block[3] = &unk_1E6C96FC8;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serviceConnectionQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)disconnect
{
  objc_initWeak(&location, self);
  serviceConnectionQueue = self->_serviceConnectionQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1DC661D88;
  v4[3] = &unk_1E6C965E8;
  objc_copyWeak(&v5, &location);
  dispatch_async(serviceConnectionQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)getMainAppContextPathWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  serviceConnectionQueue = self->_serviceConnectionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1DC661F00;
  block[3] = &unk_1E6C96FC8;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serviceConnectionQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)updateDescendantsOfContextPath:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  serviceConnectionQueue = self->_serviceConnectionQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1DC6622E0;
  v11[3] = &unk_1E6C96FF0;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(serviceConnectionQueue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (id)description
{
  v3 = objc_opt_new();
  objc_msgSend_appendFormat_(v3, v4, @"CLSContextProviderService: <%p>\n", self);
  objc_msgSend_appendFormat_(v3, v5, @"  extensionIdentifier: %@\n", self->_extensionIdentifier);
  objc_msgSend_appendFormat_(v3, v6, @"  appIdentifier      : %@\n", self->_appIdentifier);
  objc_msgSend_appendFormat_(v3, v7, @"  appName            : %@\n", self->_appName);
  objc_msgSend_appendFormat_(v3, v8, @"  localizedAppName   : %@\n", self->_localizedAppName);
  objc_msgSend_appendFormat_(v3, v9, @"  mainAppContextPath : %@\n", self->_mainAppContextPath);
  uint64_t v10 = atomic_load((unsigned int *)&self->_connectionCount);
  objc_msgSend_appendFormat_(v3, v11, @"  connectionCount    : %d\n", v10);
  id v14 = objc_msgSend_copy(v3, v12, v13);

  return v14;
}

- (NSString)extensionIdentifier
{
  return self->_extensionIdentifier;
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (NSString)appName
{
  return self->_appName;
}

- (NSString)localizedAppName
{
  return self->_localizedAppName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedAppName, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->_extensionIdentifier, 0);
  objc_storeStrong((id *)&self->_mainAppContextPath, 0);
  objc_storeStrong((id *)&self->_extensionContext, 0);
  objc_storeStrong((id *)&self->_extensionHostContext, 0);
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->_extension, 0);

  objc_storeStrong((id *)&self->_serviceConnectionQueue, 0);
}

@end