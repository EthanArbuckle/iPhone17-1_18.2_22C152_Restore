@interface MPNondurableMediaItem
+ (BOOL)canFilterByProperty:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)defaultPropertyValues;
- (BOOL)existsInLibrary;
- (BOOL)isUsableAsRepresentativeItem;
- (MPNondurableMediaItem)initWithCoder:(id)a3;
- (MPNondurableMediaItem)initWithPersistentID:(unint64_t)a3;
- (id)mediaLibrary;
- (id)valueForProperty:(id)a3;
- (id)valuesForProperties:(id)a3;
- (unint64_t)persistentID;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateValuesForProperties:(id)a3 usingBlock:(id)a4;
- (void)setValue:(id)a3 forKey:(id)a4;
@end

@implementation MPNondurableMediaItem

- (id)mediaLibrary
{
  return 0;
}

- (BOOL)isUsableAsRepresentativeItem
{
  return 0;
}

- (void)enumerateValuesForProperties:(id)a3 usingBlock:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__MPNondurableMediaItem_enumerateValuesForProperties_usingBlock___block_invoke;
  v8[3] = &unk_1E57F21E8;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [a3 enumerateObjectsUsingBlock:v8];
}

void __65__MPNondurableMediaItem_enumerateValuesForProperties_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 valueForProperty:v4];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MPNondurableMediaItem;
  id v4 = a3;
  [(MPMediaItem *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", self->_persistentID, @"MPPersistentID", v5.receiver, v5.super_class);
}

- (MPNondurableMediaItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MPNondurableMediaItem;
  objc_super v5 = [(MPMediaItem *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_persistentID = [v4 decodeInt64ForKey:@"MPPersistentID"];
  }

  return v5;
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  uint64_t v6 = [(id)objc_opt_class() instanceMethodForSelector:a2];
  if (v6 == [(id)objc_opt_class() instanceMethodForSelector:a2])
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_super v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    id v9 = NSStringFromSelector(a2);
    [v10 handleFailureInMethod:a2, self, @"MPMediaItem.m", 1433, @"Subclass %@ must implement -%@ defined in %@.", v8, v9, @"[MPNondurableMediaItem class]" object file lineNumber description];
  }
}

- (id)valueForProperty:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(id)objc_opt_class() defaultPropertyValues];
  objc_super v7 = [(id)v6 objectForKey:v5];

  v8 = [MEMORY[0x1E4F1CA98] null];
  LOBYTE(v6) = [v7 isEqual:v8];

  if ((v6 & 1) == 0)
  {
    if (v7)
    {
      id v9 = v7;
      goto LABEL_7;
    }
    uint64_t v10 = [(id)objc_opt_class() instanceMethodForSelector:a2];
    if (v10 == [(id)objc_opt_class() instanceMethodForSelector:a2])
    {
      v12 = [MEMORY[0x1E4F28B00] currentHandler];
      v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      v15 = NSStringFromSelector(a2);
      [v12 handleFailureInMethod:a2, self, @"MPMediaItem.m", 1428, @"Subclass %@ must implement -%@ defined in %@.", v14, v15, @"[MPNondurableMediaItem class]" object file lineNumber description];
    }
  }
  id v9 = 0;
LABEL_7:

  return v9;
}

- (id)valuesForProperties:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  uint64_t v6 = [v4 dictionary];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __45__MPNondurableMediaItem_valuesForProperties___block_invoke;
  v11[3] = &unk_1E57F4A68;
  v11[4] = self;
  id v7 = v6;
  id v12 = v7;
  [v5 enumerateObjectsUsingBlock:v11];

  v8 = v12;
  id v9 = v7;

  return v9;
}

void __45__MPNondurableMediaItem_valuesForProperties___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "valueForProperty:");
  if (v3) {
    [*(id *)(a1 + 40) setObject:v3 forKey:v4];
  }
}

- (BOOL)existsInLibrary
{
  return 0;
}

- (unint64_t)persistentID
{
  return self->_persistentID;
}

- (MPNondurableMediaItem)initWithPersistentID:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MPNondurableMediaItem;
  result = [(MPNondurableMediaItem *)&v5 init];
  if (result) {
    result->_persistentID = a3;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)defaultPropertyValues
{
  return 0;
}

+ (BOOL)canFilterByProperty:(id)a3
{
  return 0;
}

@end