@interface DIIdentityNationalIDCardDescriptor
- (DIIdentityNationalIDCardDescriptor)init;
- (NSArray)elements;
- (NSString)description;
- (NSString)regionCode;
- (id)elementsToIntentToStore;
- (id)intentToStoreForElement:(id)a3;
- (void)addElements:(id)a3 withIntentToStore:(id)a4;
- (void)setElementsToIntentToStore:(id)a3;
- (void)setRegionCode:(id)a3;
@end

@implementation DIIdentityNationalIDCardDescriptor

- (DIIdentityNationalIDCardDescriptor)init
{
  v7.receiver = self;
  v7.super_class = (Class)DIIdentityNationalIDCardDescriptor;
  v2 = [(DIIdentityNationalIDCardDescriptor *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    elementsToIntentToStore = v3->_elementsToIntentToStore;
    v3->_elementsToIntentToStore = v4;
  }
  return v3;
}

- (NSArray)elements
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = [(NSMutableDictionary *)self->_elementsToIntentToStore allKeys];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)addElements:(id)a3 withIntentToStore:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_elementsToIntentToStore, "setObject:forKeyedSubscript:", v7, *(void *)(*((void *)&v13 + 1) + 8 * v12++), (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (id)intentToStoreForElement:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [(NSMutableDictionary *)self->_elementsToIntentToStore objectForKeyedSubscript:v5];

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)elementsToIntentToStore
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_elementsToIntentToStore;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)regionCode
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_regionCode;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setRegionCode:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [v5 uppercaseString];

  regionCode = self->_regionCode;
  self->_regionCode = v6;

  os_unfair_lock_unlock(p_lock);
}

- (void)setElementsToIntentToStore:(id)a3
{
  id v6 = (NSMutableDictionary *)a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_elementsToIntentToStore != v6)
  {
    v4 = (NSMutableDictionary *)[(NSMutableDictionary *)v6 copyWithZone:0];
    elementsToIntentToStore = self->_elementsToIntentToStore;
    self->_elementsToIntentToStore = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)description
{
  v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  os_unfair_lock_lock(&self->_lock);
  [v3 appendFormat:@"elementsToIntentToStore: %@, ", self->_elementsToIntentToStore];
  [v3 appendFormat:@"regionCode: %@, ", self->_regionCode];
  os_unfair_lock_unlock(&self->_lock);
  [v3 appendFormat:@">"];
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionCode, 0);
  objc_storeStrong((id *)&self->_elementsToIntentToStore, 0);
}

@end