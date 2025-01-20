@interface __IMDPersistenceServiceListenerImpl
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (__IMDPersistenceServiceListenerImpl)init;
- (void)resume;
@end

@implementation __IMDPersistenceServiceListenerImpl

- (void)resume
{
  v3 = self;
  v4 = self;
  id v5 = objc_msgSend(v3, sel_serviceListener);
  objc_msgSend(v5, sel_setDelegate_, v4);
  objc_msgSend(v5, sel_resume);
}

- (__IMDPersistenceServiceListenerImpl)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MessagesPersistenceServiceListener();
  return [(__IMDPersistenceServiceListenerImpl *)&v3 init];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_1AFC58FBC(v7);

  return v9 & 1;
}

@end