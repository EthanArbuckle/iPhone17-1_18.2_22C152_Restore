@interface ABRequestHandler
- (ABRequestHandler)init;
- (void)fetchProxyCredential:(id)a3 reply:(id)a4;
@end

@implementation ABRequestHandler

- (void)fetchProxyCredential:(id)a3 reply:(id)a4
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int buf = 138412290;
    id buf_4 = a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Fetching proxy credential for query %@", (uint8_t *)&buf, 0xCu);
  }
  operator new();
}

- (ABRequestHandler)init
{
  v10.receiver = self;
  v10.super_class = (Class)ABRequestHandler;
  v2 = [(ABRequestHandler *)&v10 init];
  if (v2)
  {
    if (qword_10000C7C0 != -1) {
      dispatch_once(&qword_10000C7C0, &stru_1000085A0);
    }
    Instance = (_OWORD *)_CFRuntimeCreateInstance();
    v4 = Instance;
    if (Instance)
    {
      Instance[1] = 0u;
      v4 = Instance + 1;
      Instance[7] = 0u;
      Instance[8] = 0u;
      Instance[5] = 0u;
      Instance[6] = 0u;
      Instance[3] = 0u;
      Instance[4] = 0u;
      Instance[2] = 0u;
    }
    *(void *)v4 = off_100008528;
    *((void *)v4 + 1) = &off_1000087B0;
    pthread_mutex_init((pthread_mutex_t *)(v4 + 1), 0);
    *(void *)v4 = off_1000085D0;
    *((void *)v4 + 1) = off_100008618;
    *((void *)v4 + 10) = off_100008638;
    CFAllocatorRef v5 = CFGetAllocator(v4 - 1);
    *((void *)v4 + 13) = off_100008730;
    *((void *)v4 + 14) = CFDictionaryCreateMutable(v5, 0, &kCFTypeDictionaryKeyCallBacks, (const CFDictionaryValueCallBacks *)&unk_10000C668);
    *((void *)v4 + 15) = 0;
    CFGetAllocator(v4 - 1);
    *((void *)v4 + 11) = CFURLCredentialStorageCreate();
    if (CFURLCredentialStorageIsSystemKeychainSupported()) {
      CFURLCredentialStorageSetUseSystemKeychain();
    }
    *((void *)v4 + 12) = CFSetCreateMutable(kCFAllocatorDefault, 0, &kCFTypeSetCallBacks);
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.cfnetwork.authbroker.authenticator.work-queue", v6);
    v8 = *((void *)v4 + 15);
    *((void *)v4 + 15) = v7;
    if (v8) {
      dispatch_release(v8);
    }
    v2->authenticator = v4;
  }
  return v2;
}

@end