@interface BDSBookWidgetInfoSource
+ (id)sharedServiceProxy;
- (BDSBookWidgetInfoSource)init;
- (BDSServiceProtocol)serviceProxy;
- (void)getBookWidgetInfoWithLimit:(unint64_t)a3 completionHandler:(id)a4;
@end

@implementation BDSBookWidgetInfoSource

+ (id)sharedServiceProxy
{
  if (qword_26AD776D0 != -1) {
    dispatch_once(&qword_26AD776D0, &unk_26E971C50);
  }
  v2 = (void *)qword_26AD776A0;
  return v2;
}

- (BDSBookWidgetInfoSource)init
{
  v13.receiver = self;
  v13.super_class = (Class)BDSBookWidgetInfoSource;
  v9 = [(BDSBookWidgetInfoSource *)&v13 init];
  if (v9)
  {
    uint64_t v10 = objc_msgSend_sharedServiceProxy(BDSBookWidgetInfoSource, v2, v3, v4, v5, v6, v7, v8);
    serviceProxy = v9->_serviceProxy;
    v9->_serviceProxy = (BDSServiceProtocol *)v10;
  }
  return v9;
}

- (void)getBookWidgetInfoWithLimit:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = BDSServiceLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_2360BC000, v7, OS_LOG_TYPE_DEFAULT, "BDSBookWidgetInfoSource getBookWidgetDataWithLimit calling remote.", v21, 2u);
  }

  v15 = objc_msgSend_serviceProxy(self, v8, v9, v10, v11, v12, v13, v14);
  objc_msgSend_getBookWidgetInfoWithLimit_completion_(v15, v16, a3, (uint64_t)v6, v17, v18, v19, v20);
}

- (BDSServiceProtocol)serviceProxy
{
  return self->_serviceProxy;
}

- (void).cxx_destruct
{
}

@end