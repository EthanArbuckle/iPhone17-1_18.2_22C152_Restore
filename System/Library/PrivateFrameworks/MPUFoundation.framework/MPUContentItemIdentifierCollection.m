@interface MPUContentItemIdentifierCollection
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (MPUContentItemIdentifierCollection)initWithCoder:(id)a3;
- (MPUContentItemIdentifierCollection)initWithItemType:(unint64_t)a3;
- (id)_copyWithZone:(_NSZone *)a3 class:(Class)a4;
- (id)description;
- (id)identifierForIdentifierType:(unint64_t)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)identifierCount;
- (unint64_t)itemType;
- (void)_setIdentifier:(id)a3 forIdentifierType:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateIdentifiersUsingBlock:(id)a3;
@end

@implementation MPUContentItemIdentifierCollection

- (MPUContentItemIdentifierCollection)initWithItemType:(unint64_t)a3
{
  result = [(MPUContentItemIdentifierCollection *)self init];
  if (result) {
    result->_itemType = a3;
  }
  return result;
}

- (id)description
{
  v3 = (void *)MEMORY[0x263F089D8];
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v6 = (void *)v5;
  unint64_t itemType = self->_itemType;
  if (itemType > 0xE) {
    v8 = 0;
  }
  else {
    v8 = off_2647D0DB0[itemType];
  }
  v9 = [v3 stringWithFormat:@"<%@ %p itemType:%@", v5, self, v8];

  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  char v21 = 1;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __49__MPUContentItemIdentifierCollection_description__block_invoke;
  v12[3] = &unk_2647D0D90;
  v14 = v20;
  id v10 = v9;
  id v13 = v10;
  v15 = &v16;
  [(MPUContentItemIdentifierCollection *)self enumerateIdentifiersUsingBlock:v12];
  if (*((unsigned char *)v17 + 24)) {
    [v10 appendString:@"}"];
  }
  [v10 appendString:@">"];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);

  return v10;
}

void __49__MPUContentItemIdentifierCollection_description__block_invoke(uint64_t a1, unint64_t a2, void *a3)
{
  id v7 = a3;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v5 + 24))
  {
    *(unsigned char *)(v5 + 24) = 0;
    [*(id *)(a1 + 32) appendString:@" identifiers: {\n"];
  }
  if (a2 > 8) {
    v6 = 0;
  }
  else {
    v6 = off_2647D0E28[a2];
  }
  [*(id *)(a1 + 32) appendFormat:@"%@: %@\n", v6, v7];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
}

- (unint64_t)hash
{
  return self->_itemType ^ [(NSMapTable *)self->_identifierTypeToIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MPUContentItemIdentifierCollection *)a3;
  if (self == v4) {
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || self->_itemType != v4->_itemType)
  {
    char v6 = 0;
    goto LABEL_8;
  }
  identifierTypeToIdentifier = self->_identifierTypeToIdentifier;
  if (identifierTypeToIdentifier == v4->_identifierTypeToIdentifier)
  {
LABEL_7:
    char v6 = 1;
    goto LABEL_8;
  }
  char v6 = -[NSMapTable isEqual:](identifierTypeToIdentifier, "isEqual:");
LABEL_8:

  return v6;
}

- (MPUContentItemIdentifierCollection)initWithCoder:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MPUContentItemIdentifierCollection;
  uint64_t v5 = [(MPUContentItemIdentifierCollection *)&v23 init];
  if (v5)
  {
    v5->_unint64_t itemType = [v4 decodeIntegerForKey:@"MPUContentItemIdentifierCollectionItemType"];
    char v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    id v10 = [v4 decodeObjectOfClasses:v9 forKey:@"MPUContentItemIdentifierCollectionIdentifierTypeNumberToIdentifier"];

    if (_NSIsNSDictionary())
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v20 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            v17 = [v11 objectForKey:v16];
            -[MPUContentItemIdentifierCollection _setIdentifier:forIdentifierType:](v5, "_setIdentifier:forIdentifierType:", v17, [v16 unsignedIntegerValue]);
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v24 count:16];
        }
        while (v13);
      }
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v13 = a3;
  [v13 encodeInteger:self->_itemType forKey:@"MPUContentItemIdentifierCollectionItemType"];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_identifierTypeToIdentifier;
  uint64_t v5 = [(NSMapTable *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v11 = [(NSMapTable *)self->_identifierTypeToIdentifier objectForKey:v10];
        if (v11)
        {
          if (!v7) {
            uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", -[NSMapTable count](self->_identifierTypeToIdentifier, "count"));
          }
          uint64_t v12 = [NSNumber numberWithUnsignedInteger:v10];
          [v7 setObject:v11 forKey:v12];
        }
      }
      uint64_t v6 = [(NSMapTable *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
  }

  [v13 encodeObject:v7 forKey:@"MPUContentItemIdentifierCollectionIdentifierTypeNumberToIdentifier"];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();

  return [(MPUContentItemIdentifierCollection *)self _copyWithZone:a3 class:v5];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)identifierCount
{
  return [(NSMapTable *)self->_identifierTypeToIdentifier count];
}

- (void)enumerateIdentifiersUsingBlock:(id)a3
{
  id v4 = (void (**)(id, void *, void *, unsigned char *))a3;
  if (v4)
  {
    identifierTypeToIdentifier = self->_identifierTypeToIdentifier;
    if (identifierTypeToIdentifier)
    {
      memset(&enumerator, 0, sizeof(enumerator));
      NSEnumerateMapTable(&enumerator, identifierTypeToIdentifier);
      value = 0;
      key = 0;
      char v6 = 0;
      do
      {
        if (!NSNextMapEnumeratorPair(&enumerator, &key, &value)) {
          break;
        }
        v4[2](v4, key, value, &v6);
      }
      while (!v6);
      NSEndMapTableEnumeration(&enumerator);
    }
  }
}

- (id)identifierForIdentifierType:(unint64_t)a3
{
  identifierTypeToIdentifier = self->_identifierTypeToIdentifier;
  if (identifierTypeToIdentifier) {
    identifierTypeToIdentifier = (NSMapTable *)NSMapGet(identifierTypeToIdentifier, (const void *)a3);
  }

  return identifierTypeToIdentifier;
}

- (id)_copyWithZone:(_NSZone *)a3 class:(Class)a4
{
  uint64_t v5 = [[(objc_class *)a4 allocWithZone:a3] initWithItemType:self->_itemType];
  if (v5)
  {
    uint64_t v6 = [(NSMapTable *)self->_identifierTypeToIdentifier copy];
    uint64_t v7 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v6;
  }
  return v5;
}

- (void)_setIdentifier:(id)a3 forIdentifierType:(unint64_t)a4
{
  uint64_t v6 = (NSMapTable *)a3;
  uint64_t v7 = v6;
  long long v17 = v6;
  if (a4 > 8)
  {
    if (v6)
    {
LABEL_9:
      v9 = (NSMapTable *)[(NSMapTable *)v7 copy];
      if (v9)
      {
        identifierTypeToIdentifier = self->_identifierTypeToIdentifier;
        if (!identifierTypeToIdentifier)
        {
          id v11 = (NSMapTable *)[objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:1282 valueOptions:0 capacity:1];
          uint64_t v12 = self->_identifierTypeToIdentifier;
          self->_identifierTypeToIdentifier = v11;

          identifierTypeToIdentifier = self->_identifierTypeToIdentifier;
        }
        NSMapInsert(identifierTypeToIdentifier, (const void *)a4, v9);
      }
      goto LABEL_21;
    }
  }
  else
  {
    if (((1 << a4) & 0x1E2) != 0)
    {
      if (!v6) {
        goto LABEL_17;
      }
      char v8 = [(NSMapTable *)v6 isNSNumber];
    }
    else
    {
      if (((1 << a4) & 0x1C) == 0) {
        goto LABEL_22;
      }
      if (!v6) {
        goto LABEL_17;
      }
      char v8 = [(NSMapTable *)v6 isNSString];
    }
    uint64_t v7 = v17;
    if (v8) {
      goto LABEL_9;
    }
    id v13 = (objc_class *)objc_opt_class();
    uint64_t v14 = NSStringFromClass(v13);
    long long v15 = (void *)v14;
    if (a4 - 1 > 7) {
      long long v16 = 0;
    }
    else {
      long long v16 = off_2647D0E70[a4 - 1];
    }
    NSLog(&cfstr_InvalidIdentif.isa, self, v14, v17, v16);
  }
LABEL_17:
  uint64_t v6 = self->_identifierTypeToIdentifier;
  if (!v6
    || (NSMapRemove(v6, (const void *)a4), (uint64_t v6 = [(NSMapTable *)self->_identifierTypeToIdentifier count]) != 0))
  {
    uint64_t v7 = 0;
    goto LABEL_22;
  }
  long long v17 = 0;
  v9 = self->_identifierTypeToIdentifier;
  self->_identifierTypeToIdentifier = 0;
LABEL_21:

  uint64_t v7 = v17;
LABEL_22:

  MEMORY[0x270F9A758](v6, v7);
}

- (unint64_t)itemType
{
  return self->_itemType;
}

- (void).cxx_destruct
{
}

@end