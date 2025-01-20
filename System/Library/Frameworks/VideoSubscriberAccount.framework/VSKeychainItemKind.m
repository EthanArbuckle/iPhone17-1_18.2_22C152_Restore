@interface VSKeychainItemKind
- (NSArray)properties;
- (NSDictionary)attributesByName;
- (NSDictionary)attributesBySecItemAttributeKey;
- (NSString)itemClassName;
- (VSKeychainItemKind)init;
- (__CFString)secItemClass;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)setItemClassName:(id)a3;
- (void)setProperties:(id)a3;
- (void)setSecItemClass:(__CFString *)a3;
@end

@implementation VSKeychainItemKind

- (VSKeychainItemKind)init
{
  v8.receiver = self;
  v8.super_class = (Class)VSKeychainItemKind;
  v2 = [(VSKeychainItemKind *)&v8 init];
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    uint64_t v4 = NSStringFromClass(v3);
    itemClassName = v2->_itemClassName;
    v2->_itemClassName = (NSString *)v4;

    properties = v2->_properties;
    v2->_properties = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return v2;
}

- (void)dealloc
{
  secItemClass = self->_secItemClass;
  if (secItemClass) {
    CFRelease(secItemClass);
  }
  v4.receiver = self;
  v4.super_class = (Class)VSKeychainItemKind;
  [(VSKeychainItemKind *)&v4 dealloc];
}

- (void)setItemClassName:(id)a3
{
  objc_super v4 = (NSString *)a3;
  if (!v4)
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    objc_super v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  if (v4 != self->_itemClassName)
  {
    objc_super v8 = v4;
    v6 = (NSString *)[(NSString *)v4 copy];
    itemClassName = self->_itemClassName;
    self->_itemClassName = v6;

    objc_super v4 = v8;
  }
}

- (void)setSecItemClass:(__CFString *)a3
{
  secItemClass = self->_secItemClass;
  if (secItemClass != a3)
  {
    if (secItemClass) {
      CFRelease(secItemClass);
    }
    self->_secItemClass = (__CFString *)CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a3);
  }
}

- (NSDictionary)attributesByName
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  objc_super v4 = [(VSKeychainItemKind *)self properties];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v10 = [v9 name];
          [v3 setObject:v9 forKey:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return (NSDictionary *)v3;
}

- (NSDictionary)attributesBySecItemAttributeKey
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  objc_super v4 = [(VSKeychainItemKind *)self properties];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v9 secItemAttributeKey]) {
          objc_msgSend(v3, "setObject:forKey:", v9, objc_msgSend(v9, "secItemAttributeKey"));
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSDictionary *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = [+[VSKeychainItemKind allocWithZone:a3] init];
  uint64_t v5 = [(VSKeychainItemKind *)self itemClassName];
  [(VSKeychainItemKind *)v4 setItemClassName:v5];

  [(VSKeychainItemKind *)v4 setSecItemClass:[(VSKeychainItemKind *)self secItemClass]];
  uint64_t v6 = [(VSKeychainItemKind *)self properties];
  [(VSKeychainItemKind *)v4 setProperties:v6];

  return v4;
}

- (NSString)itemClassName
{
  return self->_itemClassName;
}

- (__CFString)secItemClass
{
  return self->_secItemClass;
}

- (NSArray)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);

  objc_storeStrong((id *)&self->_itemClassName, 0);
}

@end