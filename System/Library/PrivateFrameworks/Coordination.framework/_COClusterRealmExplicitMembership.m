@interface _COClusterRealmExplicitMembership
+ (BOOL)supportsSecureCoding;
+ (id)realmWithClusterIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)clusterIdentifier;
- (_COClusterRealmExplicitMembership)initWithCoder:(id)a3;
- (id)_initWithClusterIdentifier:(id)a3;
- (unint64_t)hash;
- (void)activate:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _COClusterRealmExplicitMembership

- (id)_initWithClusterIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263F08A98] predicateWithValue:0];
  v10.receiver = self;
  v10.super_class = (Class)_COClusterRealmExplicitMembership;
  v6 = [(COClusterRealm *)&v10 _initWithPredicate:v5];

  if (v6)
  {
    uint64_t v7 = [v4 copy];
    v8 = (void *)v6[6];
    v6[6] = v7;
  }
  return v6;
}

+ (id)realmWithClusterIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) _initWithClusterIdentifier:v4];

  return v5;
}

- (unint64_t)hash
{
  v2 = [(_COClusterRealmExplicitMembership *)self clusterIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_COClusterRealmExplicitMembership;
  if ([(COClusterRealm *)&v9 isEqual:v4] && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = [v4 clusterIdentifier];
    v6 = [(_COClusterRealmExplicitMembership *)self clusterIdentifier];
    char v7 = [v5 isEqualToString:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)activate:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (+[COFeatureStatus isCOClusterEnabled])
  {
    v5 = COLogForCategory(7);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [(_COClusterRealmExplicitMembership *)self clusterIdentifier];
      *(_DWORD *)buf = 134218498;
      v14 = self;
      __int16 v15 = 2112;
      v16 = self;
      __int16 v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_21D3E0000, v5, OS_LOG_TYPE_DEFAULT, "%p COClusterRealmExplicitMembership %@ activate called with cluster identifier %@", buf, 0x20u);
    }
    uint64_t v7 = MEMORY[0x263EF8330];
    uint64_t v8 = 3221225472;
    objc_super v9 = __46___COClusterRealmExplicitMembership_activate___block_invoke;
    objc_super v10 = &unk_264444338;
    v11 = self;
    id v12 = v4;
    [(COClusterRealm *)self _withLock:&v7];
    [(COClusterRealm *)self _invokeUpdateHandler];
  }
}

- (_COClusterRealmExplicitMembership)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_COClusterRealmExplicitMembership;
  v5 = [(COClusterRealm *)&v11 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clusteridentifier"];
    if (![v6 length])
    {

      objc_super v9 = 0;
      goto LABEL_6;
    }
    uint64_t v7 = [v6 copy];
    clusterIdentifier = v5->_clusterIdentifier;
    v5->_clusterIdentifier = (NSString *)v7;
  }
  objc_super v9 = v5;
LABEL_6:

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_COClusterRealmExplicitMembership;
  id v4 = a3;
  [(COClusterRealm *)&v6 encodeWithCoder:v4];
  v5 = [(_COClusterRealmExplicitMembership *)self clusterIdentifier];
  [v4 encodeObject:v5 forKey:@"clusteridentifier"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)clusterIdentifier
{
  return self->_clusterIdentifier;
}

- (void).cxx_destruct
{
}

@end