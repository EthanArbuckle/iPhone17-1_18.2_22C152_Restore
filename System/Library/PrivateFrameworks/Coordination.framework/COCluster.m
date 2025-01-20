@interface COCluster
+ (BOOL)supportsSecureCoding;
+ (COCluster)activityGroupCluster;
+ (COCluster)clusterWithConfiguration:(id)a3;
+ (COCluster)dynamicGroupCluster;
+ (COCluster)homeCluster;
+ (COCluster)pairCluster;
+ (id)_allowedClusterClasses;
+ (id)_clusterForCluster:(id)a3;
+ (id)_createTemplateFromConfiguration:(id)a3;
+ (id)_homeClusterForHomeKitHomeIdentifier:(id)a3;
+ (id)clusterNameWithHomeKitHome:(id)a3;
+ (id)homeClusterForHomeKitHome:(id)a3;
+ (id)inferClusterLabelFromCluster:(id)a3;
- (BOOL)_isEqualToCluster:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)updateHandlerInvoked;
- (COCluster)initWithCoder:(id)a3;
- (COClusterConfiguration)configuration;
- (NSString)format;
- (NSString)identifier;
- (NSString)label;
- (id)_initWithConfiguration:(id)a3 format:(id)a4 label:(id)a5;
- (id)description;
- (id)updateHandler;
- (unint64_t)hash;
- (void)_invokeUpdateHandler;
- (void)_updateIdentifier;
- (void)_withLock:(id)a3;
- (void)activate:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation COCluster

- (id)_initWithConfiguration:(id)a3 format:(id)a4 label:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)COCluster;
  v12 = [(COCluster *)&v19 init];
  v13 = v12;
  if (v12)
  {
    v12->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v12->_configuration, a3);
    uint64_t v14 = [v10 copy];
    format = v13->_format;
    v13->_format = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    label = v13->_label;
    v13->_label = (NSString *)v16;
  }
  return v13;
}

+ (COCluster)clusterWithConfiguration:(id)a3
{
  id v4 = a3;
  v5 = [a1 _createTemplateFromConfiguration:v4];
  id v6 = objc_alloc((Class)a1);
  v7 = [v4 prefix];
  v8 = (void *)[v6 _initWithConfiguration:v4 format:v5 label:v7];

  return (COCluster *)v8;
}

+ (COCluster)homeCluster
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __24__COCluster_homeCluster__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (homeCluster_onceToken != -1) {
    dispatch_once(&homeCluster_onceToken, block);
  }
  v2 = (void *)homeCluster_cluster;

  return (COCluster *)v2;
}

void __24__COCluster_homeCluster__block_invoke(uint64_t a1)
{
  id v5 = +[_COClusterRealmHome realmForCurrent];
  v2 = +[COClusterConfiguration configurationWithDomain:@"COClusterHome" requiredServices:15 options:1 realm:v5];
  uint64_t v3 = [objc_alloc(*(Class *)(a1 + 32)) _initWithConfiguration:v2 format:@"com.apple.%@-home-mesh" label:@"COClusterHome"];
  id v4 = (void *)homeCluster_cluster;
  homeCluster_cluster = v3;
}

+ (COCluster)pairCluster
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __24__COCluster_pairCluster__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (pairCluster_onceToken != -1) {
    dispatch_once(&pairCluster_onceToken, block);
  }
  v2 = (void *)pairCluster_cluster;

  return (COCluster *)v2;
}

void __24__COCluster_pairCluster__block_invoke(uint64_t a1)
{
  id v5 = +[_COClusterRealmPair realmForCurrent];
  v2 = +[COClusterConfiguration configurationWithDomain:@"COClusterPair" requiredServices:15 options:1 realm:v5];
  uint64_t v3 = [objc_alloc(*(Class *)(a1 + 32)) _initWithConfiguration:v2 format:@"com.apple.%@-media-system-mesh" label:@"COClusterPair"];
  id v4 = (void *)pairCluster_cluster;
  pairCluster_cluster = v3;
}

+ (COCluster)activityGroupCluster
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__COCluster_activityGroupCluster__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (activityGroupCluster_onceToken != -1) {
    dispatch_once(&activityGroupCluster_onceToken, block);
  }
  v2 = (void *)activityGroupCluster_cluster;

  return (COCluster *)v2;
}

void __33__COCluster_activityGroupCluster__block_invoke(uint64_t a1)
{
  id v6 = +[_COClusterRealmActivityGroup realmForCurrent];
  v2 = +[COClusterConfiguration configurationWithDomain:@"COClusterActivityGroup" requiredServices:15 options:1 realm:v6];
  uint64_t v3 = [*(id *)(a1 + 32) _createTemplateFromConfiguration:v2];
  uint64_t v4 = [objc_alloc(*(Class *)(a1 + 32)) _initWithConfiguration:v2 format:v3 label:@"COClusterActivityGroup"];
  id v5 = (void *)activityGroupCluster_cluster;
  activityGroupCluster_cluster = v4;
}

+ (COCluster)dynamicGroupCluster
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__COCluster_dynamicGroupCluster__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (dynamicGroupCluster_onceToken != -1) {
    dispatch_once(&dynamicGroupCluster_onceToken, block);
  }
  v2 = (void *)dynamicGroupCluster_cluster;

  return (COCluster *)v2;
}

void __32__COCluster_dynamicGroupCluster__block_invoke(uint64_t a1)
{
  id v5 = +[_COClusterRealmDynamicGroup realmForCurrent];
  v2 = +[COClusterConfiguration configurationWithDomain:@"COClusterDynamicGroup" requiredServices:15 options:1 realm:v5];
  uint64_t v3 = [objc_alloc(*(Class *)(a1 + 32)) _initWithConfiguration:v2 format:@"com.apple.dynamic-group-mesh-%@" label:@"COClusterDynamicGroup"];
  uint64_t v4 = (void *)dynamicGroupCluster_cluster;
  dynamicGroupCluster_cluster = v3;
}

+ (id)_homeClusterForHomeKitHomeIdentifier:(id)a3
{
  uint64_t v4 = +[_COClusterRealmHome realmWithHomeKitHomeIdentifier:a3];
  id v5 = +[COClusterConfiguration configurationWithDomain:@"COClusterHome" requiredServices:15 options:1 realm:v4];
  id v6 = (void *)[objc_alloc((Class)a1) _initWithConfiguration:v5 format:@"com.apple.%@-home-mesh" label:@"COClusterHome"];

  return v6;
}

+ (id)homeClusterForHomeKitHome:(id)a3
{
  uint64_t v4 = [a3 uniqueIdentifier];
  id v5 = [a1 homeClusterForHomeKitHomeUniqueIdentifier:v4];

  return v5;
}

- (COCluster)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 decodeIntegerForKey:@"version"] == 1)
  {
    id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"configuration"];
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"format"];
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"label"];
    if (v5) {
      BOOL v8 = v6 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8
      || (([v6 componentsSeparatedByString:@"%@"],
           id v9 = objc_claimAutoreleasedReturnValue(),
           uint64_t v10 = [v9 count],
           v9,
           v10 == 2)
        ? (BOOL v11 = v7 == 0)
        : (BOOL v11 = 1),
          v11))
    {

      v12 = 0;
    }
    else
    {
      v12 = [(COCluster *)self _initWithConfiguration:v5 format:v6 label:v7];
    }
  }
  else
  {
    v12 = 0;
    id v5 = self;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInteger:1 forKey:@"version"];
  id v5 = [(COCluster *)self configuration];
  [v4 encodeObject:v5 forKey:@"configuration"];

  id v6 = [(COCluster *)self format];
  [v4 encodeObject:v6 forKey:@"format"];

  id v7 = [(COCluster *)self label];
  [v4 encodeObject:v7 forKey:@"label"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [(COCluster *)self identifier];
  id v7 = [(COCluster *)self label];
  BOOL v8 = [(COCluster *)self configuration];
  id v9 = [v3 stringWithFormat:@"<%@: %p, i(%@), l(%@), c(%@)>", v5, self, v6, v7, v8];

  return v9;
}

- (unint64_t)hash
{
  v2 = [(COCluster *)self configuration];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (COCluster *)a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (self == v4)
  {
    BOOL v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v6 = [(COCluster *)self _isEqualToCluster:v5];
  }
  else {
LABEL_5:
  }
    BOOL v6 = 0;
LABEL_7:

  return v6;
}

- (BOOL)_isEqualToCluster:(id)a3
{
  id v4 = a3;
  id v5 = [(COCluster *)self configuration];
  BOOL v6 = [v4 configuration];
  if ([v5 isEqual:v6])
  {
    id v7 = [(COCluster *)self format];
    BOOL v8 = [v4 format];
    if ([v7 isEqual:v8])
    {
      id v9 = [(COCluster *)self label];
      uint64_t v10 = [v4 label];
      char v11 = [v9 isEqual:v10];
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

+ (id)_createTemplateFromConfiguration:(id)a3
{
  v12[4] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 realm];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  BOOL v6 = @"%@";
  if ((isKindOfClass & 1) == 0)
  {
    id v7 = [v3 prefix];
    v12[0] = v7;
    BOOL v8 = objc_msgSend(NSString, "stringWithFormat:", @"%lX", objc_msgSend(v3, "requiredServices"));
    v12[1] = v8;
    id v9 = objc_msgSend(NSString, "stringWithFormat:", @"%lX", objc_msgSend(v3, "options"));
    v12[2] = v9;
    v12[3] = @"%@";
    uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:4];

    BOOL v6 = [v10 componentsJoinedByString:@"."];
  }

  return v6;
}

- (void)_updateIdentifier
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __30__COCluster__updateIdentifier__block_invoke;
  v3[3] = &unk_2644446D8;
  v3[4] = self;
  v3[5] = &v4;
  [(COCluster *)self _withLock:v3];
  if (*((unsigned char *)v5 + 24) || ![(COCluster *)self updateHandlerInvoked]) {
    [(COCluster *)self _invokeUpdateHandler];
  }
  _Block_object_dispose(&v4, 8);
}

void __30__COCluster__updateIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) identifier];
  id v3 = [*(id *)(a1 + 32) configuration];
  uint64_t v4 = [v3 realm];
  id v5 = [v4 identifier];

  if (v5)
  {
    uint64_t v6 = NSString;
    char v7 = [*(id *)(a1 + 32) format];
    BOOL v8 = objc_msgSend(v6, "stringWithFormat:", v7, v5);

    if (!v2) {
      goto LABEL_6;
    }
  }
  else
  {
    BOOL v8 = 0;
    if (!v2)
    {
LABEL_6:
      if (!v8 || ([v8 isEqual:v2] & 1) != 0) {
        goto LABEL_11;
      }
      goto LABEL_8;
    }
  }
  if ([v2 isEqual:v8]) {
    goto LABEL_6;
  }
LABEL_8:
  id v9 = COLogForCategory(7);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218498;
    uint64_t v15 = v10;
    __int16 v16 = 2112;
    v17 = v8;
    __int16 v18 = 2112;
    objc_super v19 = v2;
    _os_log_impl(&dword_21D3E0000, v9, OS_LOG_TYPE_DEFAULT, "%p cluster identifier changing to %@ from %@", buf, 0x20u);
  }

  uint64_t v11 = [v8 copy];
  uint64_t v12 = *(void *)(a1 + 32);
  v13 = *(void **)(v12 + 32);
  *(void *)(v12 + 32) = v11;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
LABEL_11:
}

- (void)activate:(id)a3
{
  id v4 = a3;
  if (+[COFeatureStatus isCOClusterEnabled])
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __22__COCluster_activate___block_invoke;
    v10[3] = &unk_264444338;
    v10[4] = self;
    id v11 = v4;
    [(COCluster *)self _withLock:v10];
    objc_initWeak(&location, self);
    id v5 = [(COCluster *)self configuration];
    uint64_t v6 = [v5 realm];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __22__COCluster_activate___block_invoke_53;
    v7[3] = &unk_264444700;
    objc_copyWeak(&v8, &location);
    [v6 activate:v7];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __22__COCluster_activate___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = COLogForCategory(7);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v9 = 134218242;
    uint64_t v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v3;
    _os_log_impl(&dword_21D3E0000, v2, OS_LOG_TYPE_DEFAULT, "%p cluster activating %@", (uint8_t *)&v9, 0x16u);
  }

  uint64_t v4 = [*(id *)(a1 + 40) copy];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v4;

  *(unsigned char *)(*(void *)(a1 + 32) + 12) = 0;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 32);
  *(void *)(v7 + 32) = 0;
}

void __22__COCluster_activate___block_invoke_53(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _handleRealmUpdate:v5];
  }
}

- (void)_invokeUpdateHandler
{
  uint64_t v10 = 0;
  __int16 v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__1;
  uint64_t v14 = __Block_byref_object_dispose__1;
  id v15 = 0;
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  uint64_t v7 = __Block_byref_object_copy__55;
  id v8 = __Block_byref_object_dispose__56;
  id v9 = 0;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __33__COCluster__invokeUpdateHandler__block_invoke;
  v3[3] = &unk_2644443D0;
  v3[4] = self;
  v3[5] = &v10;
  void v3[6] = &v4;
  [(COCluster *)self _withLock:v3];
  uint64_t v2 = v11[5];
  if (v2) {
    (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, v5[5]);
  }
  _Block_object_dispose(&v4, 8);

  _Block_object_dispose(&v10, 8);
}

void __33__COCluster__invokeUpdateHandler__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) updateHandler];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = [*(id *)(a1 + 32) identifier];
  uint64_t v6 = [v5 copy];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    *(unsigned char *)(*(void *)(a1 + 32) + 12) = 1;
  }
}

- (void)_withLock:(id)a3
{
  p_lock = &self->_lock;
  uint64_t v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

+ (id)_clusterForCluster:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!+[COFeatureStatus isCOClusterEnabled])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      objc_opt_isKindOfClass();
      id v5 = 0;
      goto LABEL_23;
    }
    id v6 = v4;
    goto LABEL_22;
  }
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if (v5) {
      goto LABEL_23;
    }
    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v4;
    if ([@"COClusterHome" isEqual:v7])
    {
      uint64_t v8 = [a1 homeCluster];
    }
    else if ([@"COClusterPair" isEqualToString:v7])
    {
      uint64_t v8 = [a1 pairCluster];
    }
    else if ([@"COClusterActivityGroup" isEqualToString:v7])
    {
      uint64_t v8 = [a1 activityGroupCluster];
    }
    else
    {
      if (![@"COClusterDynamicGroup" isEqualToString:v7])
      {
        id v21 = 0;
        __int16 v11 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"com.apple.([0-9A-F]{8}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{12})-home-mesh" options:0 error:&v21];
        id v12 = v21;
        id v5 = 0;
        if (!v12)
        {
          uint64_t v13 = objc_msgSend(v11, "firstMatchInString:options:range:", v7, 0, 0, objc_msgSend(v7, "length"));
          id v5 = 0;
          if ([v13 numberOfRanges] == 2)
          {
            uint64_t v14 = [v13 rangeAtIndex:1];
            uint64_t v20 = objc_msgSend(v7, "substringWithRange:", v14, v15);
            __int16 v16 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v20];
            objc_super v19 = +[_COClusterRealmHome realmWithHomeKitHomeIdentifier:v16];
            v17 = +[COClusterConfiguration configurationWithDomain:requiredServices:options:realm:](COClusterConfiguration, "configurationWithDomain:requiredServices:options:realm:", @"COClusterHome", 15, 1);
            id v5 = (id)[objc_alloc((Class)a1) _initWithConfiguration:v17 format:@"com.apple.%@-home-mesh" label:@"COClusterHome"];
            __int16 v18 = COLogForCategory(7);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218498;
              id v23 = a1;
              __int16 v24 = 2112;
              v25 = v16;
              __int16 v26 = 2112;
              id v27 = v7;
              _os_log_impl(&dword_21D3E0000, v18, OS_LOG_TYPE_DEFAULT, "Created legacy Home cluster %p using %@ from %@", buf, 0x20u);
            }
          }
        }

LABEL_18:
        if (v5) {
          goto LABEL_23;
        }
        goto LABEL_19;
      }
      uint64_t v8 = [a1 dynamicGroupCluster];
    }
    id v5 = (id)v8;
    goto LABEL_18;
  }
LABEL_19:
  id v9 = COLogForCategory(7);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    +[COCluster _clusterForCluster:]((uint64_t)v4, v9);
  }

  id v6 = [a1 homeCluster];
LABEL_22:
  id v5 = v6;
LABEL_23:

  return v5;
}

+ (id)_allowedClusterClasses
{
  if (_allowedClusterClasses_onceToken != -1) {
    dispatch_once(&_allowedClusterClasses_onceToken, &__block_literal_global_1);
  }
  uint64_t v2 = (void *)_allowedClusterClasses_allowedClasses;

  return v2;
}

uint64_t __35__COCluster__allowedClusterClasses__block_invoke()
{
  +[COFeatureStatus isCOClusterEnabled];
  _allowedClusterClasses_allowedClasses = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", objc_opt_class(), 0);

  return MEMORY[0x270F9A758]();
}

+ (id)inferClusterLabelFromCluster:(id)a3
{
  uint64_t v3 = (__CFString *)a3;
  id v4 = v3;
  if (v3 == @"COClusterDynamicGroup"
    || v3 == @"COClusterActivityGroup"
    || v3 == @"COClusterHome"
    || v3 == @"COClusterPair")
  {
    id v9 = v3;
    goto LABEL_31;
  }
  uint64_t v16 = 0;
  uint64_t v8 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"com.apple.(?:(?:(?:[A-F0-9\\-]+)-(?:([a-z\\-]+)(?:-mesh)))|(?:(activity-group-mesh-[a-z-]+)(?:-[A-F0-9-]+))|(?:(dynamic-group-mesh-[a-z-]+)(?:-[A-F0-9-]+)))" options:0 error:&v16];
  if (!v16)
  {
    uint64_t v10 = objc_msgSend(v8, "matchesInString:options:range:", v4, 0, 0, -[__CFString length](v4, "length"));
    if (![v10 count])
    {
      id v9 = v4;
LABEL_29:

      goto LABEL_30;
    }
    __int16 v11 = [v10 firstObject];
    uint64_t v12 = [v11 rangeAtIndex:1];
    if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v14 = -[__CFString substringWithRange:](v4, "substringWithRange:", v12, v13);
      if ([v14 isEqualToString:@"home"])
      {
        id v9 = @"COClusterHome";
LABEL_21:

LABEL_28:
        goto LABEL_29;
      }
      if ([v14 isEqualToString:@"media-system"])
      {
        id v9 = @"COClusterPair";
        goto LABEL_21;
      }
    }
    if ([v11 rangeAtIndex:2] == 0x7FFFFFFFFFFFFFFFLL)
    {
      if ([v11 rangeAtIndex:3] == 0x7FFFFFFFFFFFFFFFLL) {
        id v9 = v4;
      }
      else {
        id v9 = @"COClusterDynamicGroup";
      }
    }
    else
    {
      id v9 = @"COClusterActivityGroup";
    }
    goto LABEL_28;
  }
  id v9 = v4;
LABEL_30:

LABEL_31:

  return v9;
}

+ (id)clusterNameWithHomeKitHome:(id)a3
{
  uint64_t v3 = [a3 uniqueIdentifier];
  id v4 = [v3 UUIDString];

  id v5 = [NSString stringWithFormat:@"com.apple.%@-home-mesh", v4];

  return v5;
}

- (COClusterConfiguration)configuration
{
  return self->_configuration;
}

- (NSString)format
{
  return self->_format;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)label
{
  return self->_label;
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (BOOL)updateHandlerInvoked
{
  return self->_updateHandlerInvoked;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_format, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

+ (void)_clusterForCluster:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21D3E0000, a2, OS_LOG_TYPE_ERROR, "Failed to identify cluster for %@, falling back", (uint8_t *)&v2, 0xCu);
}

@end