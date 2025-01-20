@interface SRCHSupportService
+ (void)initialize;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)validateConnection:(id)a3;
- (CHCustomCategories)customCategories;
- (CHVersion)version;
- (NSXPCListener)listener;
- (OS_dispatch_queue)q;
- (SRCHSupportService)initWithQueue:(id)a3;
- (SRCHSupportService)initWithQueue:(id)a3 listener:(id)a4 customCategories:(id)a5 version:(id)a6;
- (id)valueForEntitlement:(id)a3 connection:(id)a4;
- (void)dealloc;
- (void)downloadDatabaseAssetIfNeeded:(id)a3;
- (void)fetchCustomCategoriesForBundleIdentifiers:(id)a3 completion:(id)a4;
- (void)fetchVersion:(id)a3;
- (void)resume;
- (void)setCustomCategories:(id)a3;
- (void)setListener:(id)a3;
- (void)setQ:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation SRCHSupportService

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    qword_100008930 = (uint64_t)os_log_create("com.apple.SensorKit", "CHSupportService");
  }
}

- (SRCHSupportService)initWithQueue:(id)a3
{
  v5 = +[NSXPCListener serviceListener];
  id v6 = objc_alloc_init((Class)CHCustomCategories);
  id v7 = objc_alloc_init((Class)CHVersion);
  v8 = [(SRCHSupportService *)self initWithQueue:a3 listener:v5 customCategories:v6 version:v7];

  return v8;
}

- (SRCHSupportService)initWithQueue:(id)a3 listener:(id)a4 customCategories:(id)a5 version:(id)a6
{
  v13.receiver = self;
  v13.super_class = (Class)SRCHSupportService;
  v10 = [(SRCHSupportService *)&v13 init];
  if (v10)
  {
    v10->_q = (OS_dispatch_queue *)a3;
    v11 = (NSXPCListener *)a4;
    v10->_listener = v11;
    [(NSXPCListener *)v11 _setQueue:v10->_q];
    [(NSXPCListener *)v10->_listener setDelegate:v10];
    v10->_customCategories = (CHCustomCategories *)a5;
    v10->_version = (CHVersion *)a6;
  }
  return v10;
}

- (void)dealloc
{
  [(NSXPCListener *)self->_listener invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SRCHSupportService;
  [(SRCHSupportService *)&v3 dealloc];
}

- (id)valueForEntitlement:(id)a3 connection:(id)a4
{
  return [a4 valueForEntitlement:a3];
}

- (BOOL)validateConnection:(id)a3
{
  id v3 = [(SRCHSupportService *)self valueForEntitlement:@"com.apple.private.sensorkit.chSupportService.allow" connection:a3];
  if (v3
    && (v4 = v3, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v4 BOOLValue] & 1) != 0)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    id v6 = qword_100008930;
    BOOL v5 = os_log_type_enabled((os_log_t)qword_100008930, OS_LOG_TYPE_ERROR);
    if (v5)
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Connection does not have a valid entitlement", v8, 2u);
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v7 = qword_100008930;
  if (os_log_type_enabled((os_log_t)qword_100008930, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = [a3 serviceName];
    __int16 v11 = 2112;
    id v12 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Got a connection attempt on %@ from %@", (uint8_t *)&v9, 0x16u);
  }
  [a4 _setQueue:self->_q];
  objc_msgSend(a4, "setExportedInterface:", +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___SRCHSupportServiceProtocol));
  [a4 setExportedObject:self];
  [a4 setInvalidationHandler:&stru_100004160];
  [a4 resume];
  return 1;
}

- (void)resume
{
  v2 = [(SRCHSupportService *)self listener];

  [(NSXPCListener *)v2 resume];
}

- (void)fetchCustomCategoriesForBundleIdentifiers:(id)a3 completion:(id)a4
{
  if ([(SRCHSupportService *)self validateConnection:+[NSXPCConnection currentConnection]])
  {
    customCategories = self->_customCategories;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000218C;
    v10[3] = &unk_100004188;
    v10[4] = a4;
    [(CHCustomCategories *)customCategories categoriesForBundleIdSet:a3 completion:v10];
  }
  else
  {
    v8 = +[SRError errorWithCode:0];
    int v9 = (void (*)(id, void *, SRError *))*((void *)a4 + 2);
    v9(a4, &__NSDictionary0__struct, v8);
  }
}

- (void)fetchVersion:(id)a3
{
  if ([(SRCHSupportService *)self validateConnection:+[NSXPCConnection currentConnection]])
  {
    CFStringRef v5 = (const __CFString *)[(CHVersion *)[(SRCHSupportService *)self version] semanticVersion];
    id v6 = (void (*)(id, const __CFString *, SRError *))*((void *)a3 + 2);
    id v7 = a3;
    v8 = 0;
  }
  else
  {
    v8 = +[SRError errorWithCode:0];
    id v6 = (void (*)(id, const __CFString *, SRError *))*((void *)a3 + 2);
    CFStringRef v5 = &stru_1000041B0;
    id v7 = a3;
  }

  v6(v7, v5, v8);
}

- (void)downloadDatabaseAssetIfNeeded:(id)a3
{
  [(SRCHSupportService *)self customCategories];
  v4 = (objc_class *)objc_opt_class();
  CFStringRef v5 = qword_100008930;
  if (os_log_type_enabled((os_log_t)qword_100008930, OS_LOG_TYPE_INFO))
  {
    int v6 = 138543362;
    id v7 = NSStringFromClass(v4);
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Class is %{public}@", (uint8_t *)&v6, 0xCu);
  }
  [(objc_class *)v4 downloadDatabaseAssetIfNeeded];
  (*((void (**)(id, void))a3 + 2))(a3, 0);
}

- (OS_dispatch_queue)q
{
  return self->_q;
}

- (void)setQ:(id)a3
{
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (CHCustomCategories)customCategories
{
  return self->_customCategories;
}

- (void)setCustomCategories:(id)a3
{
}

- (CHVersion)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

@end