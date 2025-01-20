@interface ISImageCache
- (ISImageCache)init;
- (NSData)latestValidationToken;
- (NSMutableDictionary)imageBagsByDescriptor;
- (id)allImages;
- (id)debugDescription;
- (id)imageForDescriptor:(id)a3;
- (os_unfair_lock_s)lock;
- (void)setImage:(id)a3 forDescriptor:(id)a4;
- (void)setImageBagsByDescriptor:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
@end

@implementation ISImageCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageBagsByDescriptor, 0);
  objc_storeStrong((id *)&self->_latestValidationToken, 0);
}

- (id)imageForDescriptor:(id)a3
{
  id v4 = a3;
  v5 = [v4 digest];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v7 = [(NSMutableDictionary *)self->_imageBagsByDescriptor objectForKeyedSubscript:v5];
  [v4 size];
  double v9 = v8;
  double v11 = v10;
  [v4 scale];
  double v13 = v12;

  v14 = objc_msgSend(v7, "imageForSize:scale:", v9, v11, v13);
  os_unfair_lock_unlock(p_lock);

  return v14;
}

- (void)setImage:(id)a3 forDescriptor:(id)a4
{
  if (a3)
  {
    id v6 = a3;
    id v9 = [a4 digest];
    os_unfair_lock_lock(&self->_lock);
    v7 = [(NSMutableDictionary *)self->_imageBagsByDescriptor objectForKeyedSubscript:v9];
    if (!v7)
    {
      v7 = objc_opt_new();
      [(NSMutableDictionary *)self->_imageBagsByDescriptor setObject:v7 forKeyedSubscript:v9];
    }
    [v7 insertImage:v6];
    double v8 = [v6 validationToken];

    if (v8) {
      objc_storeStrong((id *)&self->_latestValidationToken, v8);
    }
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (NSData)latestValidationToken
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (ISImageCache)init
{
  v7.receiver = self;
  v7.super_class = (Class)ISImageCache;
  v2 = [(ISImageCache *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = objc_opt_new();
    imageBagsByDescriptor = v3->_imageBagsByDescriptor;
    v3->_imageBagsByDescriptor = (NSMutableDictionary *)v4;
  }
  return v3;
}

- (id)debugDescription
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28E78];
  v19.receiver = self;
  v19.super_class = (Class)ISImageCache;
  uint64_t v4 = [(ISImageCache *)&v19 debugDescription];
  v5 = [v3 stringWithString:v4];

  [v5 appendString:@"\n"];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  objc_super v7 = [(NSMutableDictionary *)self->_imageBagsByDescriptor allValues];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = [*(id *)(*((void *)&v15 + 1) + 8 * i) debugDescription];
        [v5 appendFormat:@"Bag [%u]: %@", 0, v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v9);
  }

  os_unfair_lock_unlock(p_lock);
  double v13 = (void *)[v5 copy];

  return v13;
}

- (id)allImages
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = [(NSMutableDictionary *)self->_imageBagsByDescriptor allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) images];
        [v3 addObjectsFromArray:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_lock);
  double v11 = (void *)[v3 copy];

  return v11;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (NSMutableDictionary)imageBagsByDescriptor
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setImageBagsByDescriptor:(id)a3
{
}

@end