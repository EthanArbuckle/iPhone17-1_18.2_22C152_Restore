@interface INObjectCollection
+ (BOOL)supportsSecureCoding;
- (BOOL)usesIndexedCollation;
- (INObjectCollection)initWithCoder:(id)a3;
- (INObjectCollection)initWithItems:(NSArray *)items;
- (INObjectCollection)initWithSections:(NSArray *)sections;
- (NSArray)allItems;
- (NSArray)sections;
- (id)_typedObjectCollectionWithCodableAttribute:(id)a3;
- (id)_untypedObjectCollectionWithItemClass:(Class)a3 codableAttribute:(id)a4 error:(id *)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setUsesIndexedCollation:(BOOL)usesIndexedCollation;
@end

@implementation INObjectCollection

- (void).cxx_destruct
{
}

uint64_t __30__INObjectCollection_allItems__block_invoke(uint64_t a1, void *a2)
{
  return [a2 items];
}

- (void)setUsesIndexedCollation:(BOOL)usesIndexedCollation
{
  self->_usesIndexedCollation = usesIndexedCollation;
}

INObjectSection *__39__INObjectCollection_initWithSections___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 title];
  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 32) countForObject:v4];
    uint64_t v6 = v5 - [*(id *)(a1 + 40) countForObject:v4];
    [*(id *)(a1 + 40) removeObject:v4];
    v7 = [INObjectSection alloc];
    v8 = objc_msgSend(v4, "stringByAppendingFormat:", @"-%lu", v6);
    v9 = [v3 title];
    v10 = [v3 subtitle];
    v11 = [v3 image];
    v12 = [v3 items];
    v13 = [(INObjectSection *)v7 initWithIdentifier:v8 title:v9 subtitle:v10 image:v11 items:v12];
  }
  else
  {
    v13 = (INObjectSection *)v3;
  }

  return v13;
}

- (NSArray)allItems
{
  v2 = [(INObjectCollection *)self sections];
  id v3 = objc_msgSend(v2, "if_flatMap:", &__block_literal_global_100205);
  v4 = v3;
  if (!v3) {
    id v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v5 = v3;

  return v5;
}

- (NSArray)sections
{
  return self->_sections;
}

- (INObjectCollection)initWithItems:(NSArray *)items
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v4 = items;
  uint64_t v5 = [[INObjectSection alloc] initWithTitle:0 items:v4];

  v9[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  v7 = [(INObjectCollection *)self initWithSections:v6];

  return v7;
}

- (INObjectCollection)initWithSections:(NSArray *)sections
{
  v4 = sections;
  v18.receiver = self;
  v18.super_class = (Class)INObjectCollection;
  uint64_t v5 = [(INObjectCollection *)&v18 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F28BD0];
    v7 = [(NSArray *)v4 valueForKey:@"title"];
    v8 = [v6 setWithArray:v7];

    v9 = [MEMORY[0x1E4F28BD0] setWithSet:v8];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __39__INObjectCollection_initWithSections___block_invoke;
    v15[3] = &unk_1E551DA98;
    id v16 = v8;
    id v17 = v9;
    id v10 = v9;
    id v11 = v8;
    uint64_t v12 = [(NSArray *)v4 if_map:v15];
    v13 = v5->_sections;
    v5->_sections = (NSArray *)v12;
  }
  return v5;
}

- (BOOL)usesIndexedCollation
{
  return self->_usesIndexedCollation;
}

- (id)_untypedObjectCollectionWithItemClass:(Class)a3 codableAttribute:(id)a4 error:(id *)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  unint64_t v7 = 0x1E4F1C000uLL;
  id v8 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v9 = [(INObjectCollection *)self sections];
  id v10 = objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v37 = self;
  id v11 = [(INObjectCollection *)self sections];
  uint64_t v38 = [v11 countByEnumeratingWithState:&v48 objects:v55 count:16];
  if (v38)
  {
    uint64_t v12 = *(void *)v49;
    v42 = v11;
    v43 = v10;
    uint64_t v36 = *(void *)v49;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v49 != v12) {
          objc_enumerationMutation(v11);
        }
        uint64_t v40 = v13;
        v14 = *(void **)(*((void *)&v48 + 1) + 8 * v13);
        id v15 = objc_alloc_init(*(Class *)(v7 + 2632));
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        v39 = v14;
        id v16 = [v14 items];
        uint64_t v17 = [v16 countByEnumeratingWithState:&v44 objects:v54 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v45;
          while (2)
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v45 != v19) {
                objc_enumerationMutation(v16);
              }
              v21 = *(void **)(*((void *)&v44 + 1) + 8 * i);
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v29 = (void *)MEMORY[0x1E4F28C58];
                uint64_t v52 = *MEMORY[0x1E4F28568];
                v30 = NSString;
                v31 = (objc_class *)objc_opt_class();
                v32 = NSStringFromClass(v31);
                v33 = [v30 stringWithFormat:@"Unexpected class %@", v32];
                v53 = v33;
                v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
                *a5 = [v29 errorWithDomain:@"_INObjectCollectionErrorDomain" code:1001 userInfo:v34];

                v28 = 0;
                id v10 = v43;
                goto LABEL_20;
              }
              v22 = objc_alloc_init(INJSONEncoder);
              v23 = INObjectWithTypedObject(v21, v6);
              if (v23)
              {
                v24 = [(INJSONEncoder *)v22 encodeObject:v23 withCodableAttribute:v6];
                objc_msgSend(v15, "if_addObjectIfNonNil:", v24);
              }
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v44 objects:v54 count:16];
            if (v18) {
              continue;
            }
            break;
          }
        }

        v25 = [INObjectSection alloc];
        v26 = [v39 title];
        v27 = [(INObjectSection *)v25 initWithTitle:v26 items:v15];
        id v10 = v43;
        [v43 addObject:v27];

        uint64_t v13 = v40 + 1;
        id v11 = v42;
        unint64_t v7 = 0x1E4F1C000;
        uint64_t v12 = v36;
      }
      while (v40 + 1 != v38);
      uint64_t v38 = [v42 countByEnumeratingWithState:&v48 objects:v55 count:16];
    }
    while (v38);
  }

  v28 = [[INObjectCollection alloc] initWithSections:v10];
  [(INObjectCollection *)v28 setUsesIndexedCollation:[(INObjectCollection *)v37 usesIndexedCollation]];
LABEL_20:

  return v28;
}

- (id)_typedObjectCollectionWithCodableAttribute:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v6 = [(INObjectCollection *)self sections];
  v25 = objc_msgSend(v5, "initWithCapacity:", objc_msgSend(v6, "count"));

  unint64_t v7 = objc_alloc_init(INJSONDecoder);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v22 = self;
  obuint64_t j = [(INObjectCollection *)self sections];
  uint64_t v26 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v26)
  {
    uint64_t v24 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v32 != v24) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v11 = [v9 items];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v28;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v28 != v14) {
                objc_enumerationMutation(v11);
              }
              id v16 = [(INJSONDecoder *)v7 decodeWithCodableAttribute:v4 from:*(void *)(*((void *)&v27 + 1) + 8 * j)];
              objc_msgSend(v10, "if_addObjectIfNonNil:", v16);
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v35 count:16];
          }
          while (v13);
        }

        uint64_t v17 = [INObjectSection alloc];
        uint64_t v18 = [v9 title];
        uint64_t v19 = [(INObjectSection *)v17 initWithTitle:v18 items:v10];
        [v25 addObject:v19];
      }
      uint64_t v26 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v26);
  }

  v20 = [[INObjectCollection alloc] initWithSections:v25];
  [(INObjectCollection *)v20 setUsesIndexedCollation:[(INObjectCollection *)v22 usesIndexedCollation]];

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  sections = self->_sections;
  id v5 = a3;
  [v5 encodeObject:sections forKey:@"sections"];
  [v5 encodeBool:self->_usesIndexedCollation forKey:@"usesIndexedCollation"];
}

- (INObjectCollection)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  unint64_t v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  id v8 = [v5 decodeObjectOfClasses:v7 forKey:@"sections"];

  if (v8) {
    v9 = v8;
  }
  else {
    v9 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v10 = [(INObjectCollection *)self initWithSections:v9];
  uint64_t v11 = [v5 decodeBoolForKey:@"usesIndexedCollation"];

  [(INObjectCollection *)v10 setUsesIndexedCollation:v11];
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [INObjectCollection alloc];
  id v5 = [(INObjectCollection *)self sections];
  uint64_t v6 = [(INObjectCollection *)v4 initWithSections:v5];

  [(INObjectCollection *)v6 setUsesIndexedCollation:[(INObjectCollection *)self usesIndexedCollation]];
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end