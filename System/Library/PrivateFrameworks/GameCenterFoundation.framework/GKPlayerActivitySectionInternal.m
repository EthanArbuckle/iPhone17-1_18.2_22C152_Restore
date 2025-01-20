@interface GKPlayerActivitySectionInternal
+ (id)secureCodedPropertyKeys;
- (GKPlayerActivitySectionInternal)initWithDictionary:(id)a3;
- (NSArray)items;
- (NSString)instrumentationKey;
- (NSString)title;
- (id)description;
- (void)setInstrumentationKey:(id)a3;
- (void)setItems:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation GKPlayerActivitySectionInternal

- (GKPlayerActivitySectionInternal)initWithDictionary:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)GKPlayerActivitySectionInternal;
  v5 = [(GKPlayerActivitySectionInternal *)&v25 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"title"];
    [(GKPlayerActivitySectionInternal *)v5 setTitle:v6];

    v7 = [v4 objectForKeyedSubscript:@"id"];
    v20 = v5;
    [(GKPlayerActivitySectionInternal *)v5 setInstrumentationKey:v7];

    v8 = [MEMORY[0x1E4F1CA48] array];
    v9 = [v4 objectForKeyedSubscript:@"activity"];
    v10 = v9;
    if (v9)
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v22 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            v16 = [v15 objectForKeyedSubscript:@"symbol"];

            if (v16) {
              v17 = off_1E646C458;
            }
            else {
              v17 = off_1E646C410;
            }
            v18 = (void *)[objc_alloc(*v17) initWithDictionary:v15];
            [v8 addObject:v18];
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v26 count:16];
        }
        while (v12);
      }
    }
    v5 = v20;
    [(GKPlayerActivitySectionInternal *)v20 setItems:v8];
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(GKPlayerActivitySectionInternal *)self title];
  v5 = [(GKPlayerActivitySectionInternal *)self items];
  v6 = [(GKPlayerActivitySectionInternal *)self instrumentationKey];
  v7 = [v3 stringWithFormat:@"title: %@            \n items: %@            \n instrumentationKey: %@", v4, v5, v6];

  return v7;
}

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_201 != -1) {
    dispatch_once(&secureCodedPropertyKeys_onceToken_201, &__block_literal_global_203_0);
  }
  v2 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_200;

  return v2;
}

void __58__GKPlayerActivitySectionInternal_secureCodedPropertyKeys__block_invoke()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  v3 = objc_msgSend(v0, "setWithObjects:", v1, v2, objc_opt_class(), 0, @"title", @"instrumentationKey", @"items", v7, v8);
  v9 = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v7 forKeys:&v6 count:3];

  v5 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_200;
  secureCodedPropertyKeys_sSecureCodedKeys_200 = v4;
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)instrumentationKey
{
  return self->_instrumentationKey;
}

- (void)setInstrumentationKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instrumentationKey, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_items, 0);
}

@end