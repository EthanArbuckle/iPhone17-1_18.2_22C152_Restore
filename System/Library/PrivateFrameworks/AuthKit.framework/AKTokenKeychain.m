@interface AKTokenKeychain
- (AAFKeychainManager)keychainManager;
- (AKTokenKeychain)init;
- (BOOL)clearAllTokensForAltDSID:(id)a3 error:(id *)a4;
- (BOOL)deleteWithContext:(id)a3 error:(id *)a4;
- (BOOL)updateWithContext:(id)a3 error:(id *)a4;
- (id)_tokenKeychainDescriptorForContext:(id)a3;
- (id)_tokenKeychainDescriptorWithIdentifier:(id)a3 altDSID:(id)a4;
- (id)fetchWithContext:(id)a3 error:(id *)a4;
- (void)setKeychainManager:(id)a3;
@end

@implementation AKTokenKeychain

- (AKTokenKeychain)init
{
  v6.receiver = self;
  v6.super_class = (Class)AKTokenKeychain;
  v2 = [(AKTokenKeychain *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    keychainManager = v2->_keychainManager;
    v2->_keychainManager = (AAFKeychainManager *)v3;
  }
  return v2;
}

- (id)fetchWithContext:(id)a3 error:(id *)a4
{
  objc_super v6 = [(AKTokenKeychain *)self _tokenKeychainDescriptorForContext:a3];
  keychainManager = self->_keychainManager;
  id v19 = 0;
  v8 = [(AAFKeychainManager *)keychainManager keychainItemForDescriptor:v6 error:&v19];
  id v9 = v19;
  v10 = [v8 value];
  if ([v9 code] == (id)-25300
    && ([v9 domain],
        v11 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v12 = [v11 isEqualToString:NSOSStatusErrorDomain],
        v11,
        (v12 & 1) != 0))
  {
    id v13 = 0;
  }
  else
  {
    id v18 = 0;
    v14 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v10 error:&v18];
    id v15 = v18;
    if (v10)
    {
      id v13 = v14;
    }
    else
    {
      v16 = _AKLogSystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_100180410();
      }

      id v13 = 0;
      if (a4) {
        *a4 = v15;
      }
    }
  }

  return v13;
}

- (BOOL)updateWithContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [v6 token];
  id v19 = 0;
  v8 = +[NSKeyedArchiver archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v19];
  id v9 = v19;

  if (v8)
  {
    v10 = [(AKTokenKeychain *)self _tokenKeychainDescriptorForContext:v6];
    id v11 = [objc_alloc((Class)AAFKeychainItem) initWithDescriptor:v10 value:v8];
    keychainManager = self->_keychainManager;
    id v18 = 0;
    [(AAFKeychainManager *)keychainManager addOrUpdateKeychainItem:v11 error:&v18];
    id v13 = v18;
    BOOL v14 = v13 == 0;
    if (v13)
    {
      id v15 = _AKLogSystem();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        sub_1001804F8();
      }

      if (a4) {
        *a4 = v13;
      }
    }
  }
  else
  {
    v16 = _AKLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100180484();
    }

    BOOL v14 = 0;
    if (a4) {
      *a4 = v9;
    }
  }

  return v14;
}

- (BOOL)deleteWithContext:(id)a3 error:(id *)a4
{
  id v6 = [(AKTokenKeychain *)self _tokenKeychainDescriptorForContext:a3];
  [(AAFKeychainManager *)self->_keychainManager deleteKeychainItemsForDescriptor:v6 error:a4];
  if (a4)
  {
    v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_100180560((uint64_t)a4, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  return a4 == 0;
}

- (BOOL)clearAllTokensForAltDSID:(id)a3 error:(id *)a4
{
  id v6 = [(AKTokenKeychain *)self _tokenKeychainDescriptorWithIdentifier:0 altDSID:a3];
  [(AAFKeychainManager *)self->_keychainManager deleteKeychainItemsForDescriptor:v6 error:a4];
  if (a4)
  {
    v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_1001805D0((uint64_t)a4, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  return a4 == 0;
}

- (id)_tokenKeychainDescriptorForContext:(id)a3
{
  id v4 = a3;
  v5 = [v4 tokenIdentifier];
  id v6 = [v4 altDSID];

  v7 = [(AKTokenKeychain *)self _tokenKeychainDescriptorWithIdentifier:v5 altDSID:v6];

  return v7;
}

- (id)_tokenKeychainDescriptorWithIdentifier:(id)a3 altDSID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)AAFKeychainItemDescriptor);
  [v7 setItemClass:1];
  [v7 setItemAccessible:2];
  [v7 setInvisible:2];
  [v7 setSynchronizable:1];
  [v7 setUseDataProtection:2];
  uint64_t v8 = +[NSString stringWithFormat:@"%@.%@", @"com.apple.authkit.tokenManager", v5];
  [v7 setService:v8];
  [v7 setAccount:v6];

  [v7 setLabel:v5];
  uint64_t v9 = _AKLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_100180640();
  }

  return v7;
}

- (AAFKeychainManager)keychainManager
{
  return self->_keychainManager;
}

- (void)setKeychainManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end