@interface GEOButtonItem
+ (id)buttonItemsFromPDButtonItems:(id)a3;
+ (int)GEOButtonItemTypeFromGEOPDButtonItemType:(int)a3;
- (GEOButtonItem)initWithButtonItem:(id)a3;
- (id)debugDescription;
- (int)buttonType;
@end

@implementation GEOButtonItem

- (GEOButtonItem)initWithButtonItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOButtonItem;
  v6 = [(GEOButtonItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_buttonItem, a3);
  }

  return v7;
}

- (int)buttonType
{
  unsigned int v2 = [(GEOPDButtonItem *)self->_buttonItem buttonType] - 1;
  if (v2 > 0xE) {
    return 0;
  }
  else {
    return dword_18A635F90[v2];
  }
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(GEOPDButtonItem *)self->_buttonItem debugDescription];
  v6 = [v3 stringWithFormat:@"<%@: %p> %@", v4, self, v5];

  return v6;
}

+ (int)GEOButtonItemTypeFromGEOPDButtonItemType:(int)a3
{
  if ((a3 - 1) > 0xE) {
    return 0;
  }
  else {
    return dword_18A635F90[a3 - 1];
  }
}

+ (id)buttonItemsFromPDButtonItems:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v10, "buttonType", (void)v16) != 8)
        {
          v13 = [[GEOButtonItem alloc] initWithButtonItem:v10];
          if (!v13) {
            goto LABEL_11;
          }
LABEL_10:
          [v4 addObject:v13];
          goto LABEL_11;
        }
        v11 = [GEOButtonItemGroup alloc];
        v12 = [v10 groupParams];
        v13 = [(GEOButtonItemGroup *)v11 initWithGroupParams:v12];

        if (v13) {
          goto LABEL_10;
        }
LABEL_11:
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  v14 = (void *)[v4 copy];

  return v14;
}

- (void).cxx_destruct
{
}

@end