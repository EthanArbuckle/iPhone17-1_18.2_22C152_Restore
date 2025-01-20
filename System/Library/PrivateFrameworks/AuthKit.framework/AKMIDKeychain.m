@interface AKMIDKeychain
- (AKMIDKeychain)init;
- (BOOL)_clearLastKnownMID:(id *)a3;
- (BOOL)updateLastKnownMID:(id)a3 error:(id *)a4;
- (id)_lastKnownMIDDescriptor;
- (id)lastKnownMID:(id *)a3;
@end

@implementation AKMIDKeychain

- (AKMIDKeychain)init
{
  v6.receiver = self;
  v6.super_class = (Class)AKMIDKeychain;
  v2 = [(AKMIDKeychain *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    keychainManager = v2->_keychainManager;
    v2->_keychainManager = (AAFKeychainManager *)v3;
  }
  return v2;
}

- (id)lastKnownMID:(id *)a3
{
  v5 = [(AKMIDKeychain *)self _lastKnownMIDDescriptor];
  keychainManager = self->_keychainManager;
  id v18 = 0;
  v7 = [(AAFKeychainManager *)keychainManager keychainItemForDescriptor:v5 error:&v18];
  id v8 = v18;
  v9 = [v7 value];
  if ([v8 code] == (id)-25300
    && ([v8 domain],
        v10 = objc_claimAutoreleasedReturnValue(),
        unsigned int v11 = [v10 isEqualToString:NSOSStatusErrorDomain],
        v10,
        v11))
  {
    v12 = _AKLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_100194FE8((uint64_t)self, (uint64_t)v8, v12);
    }
    id v13 = 0;
  }
  else
  {
    id v17 = 0;
    v14 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v9 error:&v17];
    v15 = v17;
    v12 = v15;
    if (v9)
    {
      id v13 = v14;
    }
    else
    {
      id v13 = 0;
      if (a3) {
        *a3 = v15;
      }
    }
  }

  return v13;
}

- (BOOL)updateLastKnownMID:(id)a3 error:(id *)a4
{
  if (a3)
  {
    id v17 = 0;
    objc_super v6 = +[NSKeyedArchiver archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v17];
    id v7 = v17;
    id v8 = v7;
    if (v6)
    {
      v9 = [(AKMIDKeychain *)self _lastKnownMIDDescriptor];
      id v10 = [objc_alloc((Class)AAFKeychainItem) initWithDescriptor:v9 value:v6];
      keychainManager = self->_keychainManager;
      id v16 = 0;
      [(AAFKeychainManager *)keychainManager addOrUpdateKeychainItem:v10 error:&v16];
      id v12 = v16;
      id v13 = v12;
      BOOL v14 = v12 == 0;
      if (a4)
      {
        if (v12) {
          *a4 = v12;
        }
      }
    }
    else
    {
      BOOL v14 = 0;
      if (a4) {
        *a4 = v7;
      }
    }

    return v14;
  }
  else
  {
    return [(AKMIDKeychain *)self _clearLastKnownMID:a4];
  }
}

- (id)_lastKnownMIDDescriptor
{
  id v2 = objc_alloc_init((Class)AAFKeychainItemDescriptor);
  [v2 setItemClass:1];
  [v2 setItemAccessible:5];
  [v2 setInvisible:2];
  [v2 setSynchronizable:1];
  [v2 setUseDataProtection:2];
  [v2 setSysBound:1];
  [v2 setService:@"com.apple.authkit.MID.svc"];
  [v2 setLabel:@"com.apple.authkit.previousKnownMID"];

  return v2;
}

- (BOOL)_clearLastKnownMID:(id *)a3
{
  v5 = [(AKMIDKeychain *)self _lastKnownMIDDescriptor];
  [(AAFKeychainManager *)self->_keychainManager deleteKeychainItemsForDescriptor:v5 error:a3];

  return a3 != 0;
}

- (void).cxx_destruct
{
}

@end