@interface NSMetadataItem
- (NSArray)attributes;
- (NSDictionary)valuesForAttributes:(NSArray *)keys;
- (id)_init:(id)a3;
- (id)_item;
- (id)valueForAttribute:(NSString *)key;
- (id)valueForKey:(id)a3;
- (void)_setQuery:(id)a3;
- (void)dealloc;
@end

@implementation NSMetadataItem

- (id)_init:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)NSMetadataItem;
  v4 = [(NSMetadataItem *)&v6 init];
  v4->_item = a3;
  v4->_reserved = objc_alloc_init(_NSMetadataItemPrivateIvars);
  return v4;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSMetadataItem;
  [(NSMetadataItem *)&v3 dealloc];
}

- (id)_item
{
  return self->_item;
}

- (void)_setQuery:(id)a3
{
  *((void *)self->_reserved + 1) = a3;
}

- (id)valueForKey:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if ([a3 isEqualToString:@"attributes"])
    {
      return [(NSMetadataItem *)self attributes];
    }
    else if ([@"kMDItemPath" isEqualToString:a3] {
           || (objc_super v6 = (void *)*((void *)self->_reserved + 1), [v6 _isMDQuery])
    }
           && (objc_msgSend((id)objc_msgSend(v6, "_allAttributes"), "containsObject:", a3) & 1) != 0
           || [(NSArray *)[(NSMetadataItem *)self attributes] containsObject:a3])
    {
      return [(NSMetadataItem *)self valueForAttribute:a3];
    }
    else
    {
      v7.receiver = self;
      v7.super_class = (Class)NSMetadataItem;
      return -[NSMetadataItem valueForKey:](&v7, sel_valueForKey_);
    }
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NSMetadataItem;
    return -[NSMetadataItem valueForKey:](&v8, sel_valueForKey_);
  }
}

- (id)valueForAttribute:(NSString *)key
{
  v5 = (void *)*((void *)self->_reserved + 1);
  if (![v5 _isMDQuery]
    || !objc_msgSend((id)objc_msgSend(v5, "_allAttributes"), "containsObject:", key)
    || (uint64_t v6 = [v5 indexOfResult:self], v6 == 0x7FFFFFFFFFFFFFFFLL)
    || (id result = (id)[v5 valueOfAttribute:key forResultAtIndex:v6]) == 0)
  {
    objc_super v8 = objc_msgSend((id)objc_msgSend(self->_item, "attributeForName:", key), "copy");
    return v8;
  }
  return result;
}

- (NSDictionary)valuesForAttributes:(NSArray *)keys
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v5 = (void *)*((void *)self->_reserved + 1);
  if (![v5 _isMDQuery]) {
    return (NSDictionary *)(id)objc_msgSend((id)objc_msgSend(self->_item, "attributesForNames:", keys), "copy");
  }
  uint64_t v6 = (void *)[v5 _allAttributes];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v7 = [(NSArray *)keys countByEnumeratingWithState:&v25 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
LABEL_4:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v26 != v9) {
        objc_enumerationMutation(keys);
      }
      if (![v6 containsObject:*(void *)(*((void *)&v25 + 1) + 8 * v10)]) {
        return (NSDictionary *)(id)objc_msgSend((id)objc_msgSend(self->_item, "attributesForNames:", keys), "copy");
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [(NSArray *)keys countByEnumeratingWithState:&v25 objects:v24 count:16];
        if (v8) {
          goto LABEL_4;
        }
        break;
      }
    }
  }
  uint64_t v11 = [v5 indexOfResult:self];
  if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
    return (NSDictionary *)(id)objc_msgSend((id)objc_msgSend(self->_item, "attributesForNames:", keys), "copy");
  }
  uint64_t v12 = v11;
  v13 = (NSDictionary *)[MEMORY[0x1E4F1CA60] dictionary];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v14 = [(NSArray *)keys countByEnumeratingWithState:&v20 objects:v19 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(keys);
        }
        -[NSDictionary setObject:forKey:](v13, "setObject:forKey:", [v5 valueOfAttribute:*(void *)(*((void *)&v20 + 1) + 8 * i) forResultAtIndex:v12], *(void *)(*((void *)&v20 + 1) + 8 * i));
      }
      uint64_t v15 = [(NSArray *)keys countByEnumeratingWithState:&v20 objects:v19 count:16];
    }
    while (v15);
  }
  if (!v13) {
    return (NSDictionary *)(id)objc_msgSend((id)objc_msgSend(self->_item, "attributesForNames:", keys), "copy");
  }
  return v13;
}

- (NSArray)attributes
{
  id result = (NSArray *)(id)objc_msgSend((id)objc_msgSend(self->_item, "attributeNames"), "copy");
  if (!result) {
    return (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return result;
}

@end