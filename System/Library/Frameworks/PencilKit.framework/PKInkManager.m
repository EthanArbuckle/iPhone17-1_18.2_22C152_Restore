@interface PKInkManager
+ (id)defaultInkManager;
+ (void)clearCachedManager;
- (NSMutableDictionary)inks;
- (NSMutableDictionary)supportedInkIdentifiers;
- (PKInkManager)init;
- (id)inkBehaviorForIdentifier:(id)a3 variant:(id)a4;
- (id)inkBehaviorForIdentifier:(id)a3 version:(unint64_t)a4 variant:(id)a5;
- (id)supportedInkIdentifierFromIdentifier:(id)a3;
- (void)addInkBehavior:(id)a3 forIdentifier:(id)a4;
@end

@implementation PKInkManager

+ (id)defaultInkManager
{
  if (qword_1EB3C6088 != -1) {
    dispatch_once(&qword_1EB3C6088, &__block_literal_global_57);
  }
  v2 = (void *)_MergedGlobals_144;

  return v2;
}

- (id)supportedInkIdentifierFromIdentifier:(id)a3
{
  v4 = (__CFString *)a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = [(NSMutableDictionary *)v5->_supportedInkIdentifiers objectForKeyedSubscript:v4];
  if (!v6)
  {
    BOOL v7 = +[PKInkParser hasDefinitionForIdentifier:]((uint64_t)PKInkParser, v4);
    v8 = @"com.apple.ink.pen";
    if (v7) {
      v8 = v4;
    }
    v6 = v8;
    [(NSMutableDictionary *)v5->_supportedInkIdentifiers setObject:v6 forKeyedSubscript:v4];
  }
  objc_sync_exit(v5);

  return v6;
}

- (id)inkBehaviorForIdentifier:(id)a3 version:(unint64_t)a4 variant:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = (__CFString *)a5;
  v10 = self;
  objc_sync_enter(v10);
  if (!v9) {
    v9 = @"default";
  }
  v11 = -[PKInkKey initWithIdentifier:version:variant:]([PKInkKey alloc], v8, a4, v9);
  v12 = [(NSMutableDictionary *)v10->_inks objectForKeyedSubscript:v11];

  if (!v12)
  {
    v13 = +[PKInkParser inkBehaviorsWithIdentifer:version:]((uint64_t)PKInkParser, v8, a4);
    [(NSMutableDictionary *)v10->_inks addEntriesFromDictionary:v13];
    if (!a4 || v13)
    {
      v15 = v11;
    }
    else
    {
      uint64_t v14 = a4 - 1;
      do
      {
        v13 = +[PKInkParser inkBehaviorsWithIdentifer:version:]((uint64_t)PKInkParser, v8, v14);
        [(NSMutableDictionary *)v10->_inks addEntriesFromDictionary:v13];
        v15 = -[PKInkKey initWithIdentifier:version:variant:]([PKInkKey alloc], v8, v14, v9);

        if (v14-- == 0) {
          break;
        }
        v11 = v15;
      }
      while (!v13);
      a4 = v14 + 1;
    }

    v11 = v15;
  }
  v17 = [(NSMutableDictionary *)v10->_inks objectForKeyedSubscript:v11];

  if (v17)
  {
    v18 = [(NSMutableDictionary *)v10->_inks objectForKeyedSubscript:v11];
  }
  else
  {
    v19 = os_log_create("com.apple.pencilkit", "");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      int v22 = 138412546;
      v23 = v9;
      __int16 v24 = 2112;
      id v25 = v8;
      _os_log_error_impl(&dword_1C44F8000, v19, OS_LOG_TYPE_ERROR, "Could not find variant %@ for ink identifier %@, falling back to default", (uint8_t *)&v22, 0x16u);
    }

    v20 = -[PKInkKey initWithIdentifier:version:variant:]([PKInkKey alloc], v8, a4, @"default");
    v18 = [(NSMutableDictionary *)v10->_inks objectForKeyedSubscript:v20];
    v11 = v20;
  }

  objc_sync_exit(v10);

  return v18;
}

void __33__PKInkManager_defaultInkManager__block_invoke()
{
  v0 = objc_alloc_init(PKInkManager);
  v1 = (void *)_MergedGlobals_144;
  _MergedGlobals_144 = (uint64_t)v0;
}

- (PKInkManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)PKInkManager;
  v2 = [(PKInkManager *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    inks = v2->_inks;
    v2->_inks = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    supportedInkIdentifiers = v2->_supportedInkIdentifiers;
    v2->_supportedInkIdentifiers = (NSMutableDictionary *)v5;
  }
  return v2;
}

+ (void)clearCachedManager
{
  v2 = objc_alloc_init(PKInkManager);
  uint64_t v3 = (void *)_MergedGlobals_144;
  _MergedGlobals_144 = (uint64_t)v2;
}

- (id)inkBehaviorForIdentifier:(id)a3 variant:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(PKInkManager *)self inkBehaviorForIdentifier:v6 version:+[PKInk currentInkVersionForInkIdentifier:v6] variant:v7];

  return v8;
}

- (void)addInkBehavior:(id)a3 forIdentifier:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = self;
  objc_sync_enter(v7);
  objc_super v8 = -[PKInkKey initWithIdentifier:version:variant:]([PKInkKey alloc], v6, 3, @"default");
  [(NSMutableDictionary *)v7->_inks setObject:v9 forKeyedSubscript:v8];

  objc_sync_exit(v7);
}

- (NSMutableDictionary)inks
{
  return self->_inks;
}

- (NSMutableDictionary)supportedInkIdentifiers
{
  return self->_supportedInkIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedInkIdentifiers, 0);

  objc_storeStrong((id *)&self->_inks, 0);
}

@end