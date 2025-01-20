@interface _COClusterRealmHome
+ (BOOL)supportsSecureCoding;
+ (id)realmForCurrent;
+ (id)realmWithHomeKitHomeIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSUUID)specificHomeUUID;
- (_COClusterRealmHome)initWithCoder:(id)a3;
- (id)_identifierForGroupResult:(id)a3;
- (id)_initWithPredicate:(id)a3 forHome:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)activate:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _COClusterRealmHome

+ (id)realmForCurrent
{
  v2 = [MEMORY[0x263F54700] predicateForCurrentDevice];
  id v3 = [[_COClusterRealmHome alloc] _initWithPredicate:v2];

  return v3;
}

- (id)_initWithPredicate:(id)a3 forHome:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_COClusterRealmHome;
  v8 = [(COClusterRealm *)&v11 _initWithPredicate:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong(v8 + 6, a4);
  }

  return v9;
}

+ (id)realmWithHomeKitHomeIdentifier:(id)a3
{
  v4 = (void *)MEMORY[0x263F08A98];
  id v5 = a3;
  v6 = [v4 predicateWithValue:0];
  id v7 = (void *)[objc_alloc((Class)a1) _initWithPredicate:v6 forHome:v5];

  return v7;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_COClusterRealmHome;
  v4 = [(COClusterRealm *)&v8 description];
  id v5 = [(_COClusterRealmHome *)self specificHomeUUID];
  v6 = [v3 stringWithFormat:@"<%@ sh: %@>", v4, v5];

  return v6;
}

- (unint64_t)hash
{
  id v3 = [(_COClusterRealmHome *)self specificHomeUUID];

  if (v3)
  {
    v4 = [(_COClusterRealmHome *)self specificHomeUUID];
    unint64_t v5 = [v4 hash];

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_COClusterRealmHome;
    return [(COClusterRealm *)&v7 hash];
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_COClusterRealmHome;
  if ([(COClusterRealm *)&v9 isEqual:v4])
  {
    unint64_t v5 = [(_COClusterRealmHome *)self specificHomeUUID];
    v6 = [v4 specificHomeUUID];
    if (v5 == v6) {
      char v7 = 1;
    }
    else {
      char v7 = [v5 isEqual:v6];
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)_identifierForGroupResult:(id)a3
{
  id v3 = [a3 firstObject];
  id v4 = [v3 HomeKitHomeIdentifier];
  unint64_t v5 = [v4 UUIDString];

  return v5;
}

- (void)activate:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (+[COFeatureStatus isCOClusterEnabled])
  {
    unint64_t v5 = COLogForCategory(7);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [(_COClusterRealmHome *)self specificHomeUUID];
      *(_DWORD *)buf = 134218498;
      v12 = self;
      __int16 v13 = 2112;
      v14 = self;
      __int16 v15 = 2112;
      v16 = v6;
      _os_log_impl(&dword_21D3E0000, v5, OS_LOG_TYPE_DEFAULT, "%p COClusterRealmHome %@ activate called with specificHomeUUID %@", buf, 0x20u);
    }
    char v7 = [(_COClusterRealmHome *)self specificHomeUUID];

    if (v7)
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __32___COClusterRealmHome_activate___block_invoke;
      v9[3] = &unk_264444338;
      v9[4] = self;
      id v10 = v4;
      [(COClusterRealm *)self _withLock:v9];
      [(COClusterRealm *)self _invokeUpdateHandler];
    }
    else
    {
      v8.receiver = self;
      v8.super_class = (Class)_COClusterRealmHome;
      [(COClusterRealm *)&v8 activate:v4];
    }
  }
}

- (_COClusterRealmHome)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_COClusterRealmHome;
  unint64_t v5 = [(COClusterRealm *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"homeidentifier"];
    specificHomeUUID = v5->_specificHomeUUID;
    v5->_specificHomeUUID = (NSUUID *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_COClusterRealmHome;
  id v4 = a3;
  [(COClusterRealm *)&v6 encodeWithCoder:v4];
  unint64_t v5 = [(_COClusterRealmHome *)self specificHomeUUID];
  [v4 encodeObject:v5 forKey:@"homeidentifier"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  unint64_t v5 = [(COClusterRealm *)self predicate];
  objc_super v6 = [(_COClusterRealmHome *)self specificHomeUUID];
  char v7 = (void *)[v4 _initWithPredicate:v5 forHome:v6];

  return v7;
}

- (NSUUID)specificHomeUUID
{
  return self->_specificHomeUUID;
}

- (void).cxx_destruct
{
}

@end