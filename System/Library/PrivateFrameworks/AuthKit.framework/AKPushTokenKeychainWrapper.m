@interface AKPushTokenKeychainWrapper
- (AKPushTokenKeychainWrapper)init;
- (id)_descriptor;
- (id)fetchToken;
- (void)updateToken:(id)a3;
@end

@implementation AKPushTokenKeychainWrapper

- (AKPushTokenKeychainWrapper)init
{
  v6.receiver = self;
  v6.super_class = (Class)AKPushTokenKeychainWrapper;
  v2 = [(AKPushTokenKeychainWrapper *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    keychainManager = v2->_keychainManager;
    v2->_keychainManager = (AAFKeychainManager *)v3;
  }
  return v2;
}

- (id)fetchToken
{
  keychainManager = self->_keychainManager;
  uint64_t v3 = [(AKPushTokenKeychainWrapper *)self _descriptor];
  id v10 = 0;
  v4 = [(AAFKeychainManager *)keychainManager keychainItemForDescriptor:v3 error:&v10];
  id v5 = v10;

  objc_super v6 = _AKLogSystem();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7) {
      sub_10017D008((uint64_t)v5, v6);
    }
  }
  else if (v7)
  {
    sub_10017CFC4(v6);
  }

  v8 = [v4 value];

  return v8;
}

- (void)updateToken:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)AAFKeychainItem);
  objc_super v6 = [(AKPushTokenKeychainWrapper *)self _descriptor];
  id v7 = [v5 initWithDescriptor:v6 value:v4];

  keychainManager = self->_keychainManager;
  id v12 = 0;
  [(AAFKeychainManager *)keychainManager addOrUpdateKeychainItem:v7 error:&v12];
  id v9 = v12;
  id v10 = _AKLogSystem();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
  if (v9)
  {
    if (v11) {
      sub_10017D0C4((uint64_t)v9, v10);
    }
  }
  else if (v11)
  {
    sub_10017D080(v10);
  }
}

- (id)_descriptor
{
  id v2 = objc_alloc_init((Class)AAFKeychainItemDescriptor);
  [v2 setItemClass:1];
  [v2 setItemAccessible:0];
  [v2 setInvisible:2];
  [v2 setSynchronizable:1];
  [v2 setUseDataProtection:2];
  [v2 setService:@"com.apple.authkit.pushToken.svc"];
  [v2 setLabel:@"com.apple.authkit.lastKnownPushToken"];

  return v2;
}

- (void).cxx_destruct
{
}

@end