@interface NMSObfuscatableDescription
- (NMSObfuscatableDescription)init;
- (NSMutableArray)items;
- (NSString)prefixString;
- (id)CPSafeDescription;
- (id)_descriptionObfuscated:(BOOL)a3;
- (id)description;
- (void)addDescription:(id)a3 value:(id)a4;
- (void)addObfuscatedDescription:(id)a3 value:(id)a4;
- (void)setItems:(id)a3;
- (void)setPrefixString:(id)a3;
@end

@implementation NMSObfuscatableDescription

- (NMSObfuscatableDescription)init
{
  v6.receiver = self;
  v6.super_class = (Class)NMSObfuscatableDescription;
  v2 = [(NMSObfuscatableDescription *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    items = v2->_items;
    v2->_items = v3;
  }
  return v2;
}

- (void)addDescription:(id)a3 value:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(NMSObfuscatableDescription *)self items];
  v8 = [[NMSObfuscatableDescriptionItem alloc] initWithPrefix:v7 value:v6 obfuscated:0];

  [v9 addObject:v8];
}

- (void)addObfuscatedDescription:(id)a3 value:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(NMSObfuscatableDescription *)self items];
  v8 = [[NMSObfuscatableDescriptionItem alloc] initWithPrefix:v7 value:v6 obfuscated:1];

  [v9 addObject:v8];
}

- (id)_descriptionObfuscated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = objc_alloc_init(MEMORY[0x263F089D8]);
  id v6 = [(NMSObfuscatableDescription *)self prefixString];

  if (v6)
  {
    id v7 = [(NMSObfuscatableDescription *)self prefixString];
    [v5 appendFormat:@"%@\n", v7];
  }
  [v5 appendString:@"{\n"];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v8 = [(NMSObfuscatableDescription *)self items];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        [v5 appendString:@"    "];
        v14 = [v13 prefix];
        [v5 appendString:v14];

        LODWORD(v14) = [v13 obfuscated];
        v15 = [v13 value];
        v16 = v15;
        if (v14) {
          BOOL v17 = !v3;
        }
        else {
          BOOL v17 = 1;
        }
        if (v17)
        {
          [v5 appendFormat:@": %@\n", v15];
        }
        else
        {
          v18 = _SYObfuscate(v15);
          [v5 appendFormat:@": %@\n", v18];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  [v5 appendString:@"}"];
  return v5;
}

- (id)description
{
  return [(NMSObfuscatableDescription *)self _descriptionObfuscated:0];
}

- (id)CPSafeDescription
{
  return [(NMSObfuscatableDescription *)self _descriptionObfuscated:1];
}

- (NSString)prefixString
{
  return self->_prefixString;
}

- (void)setPrefixString:(id)a3
{
}

- (NSMutableArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_prefixString, 0);
}

@end