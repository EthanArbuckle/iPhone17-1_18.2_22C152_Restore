@interface NSPersistentStoreRequest
+ (void)initialize;
- (BOOL)_secureOperation;
- (NSArray)affectedStores;
- (NSPersistentStoreRequestType)requestType;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)setAffectedStores:(NSArray *)affectedStores;
@end

@implementation NSPersistentStoreRequest

- (void)dealloc
{
  self->_affectedStores = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSPersistentStoreRequest;
  [(NSPersistentStoreRequest *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4) {
    v4[1] = [(NSArray *)self->_affectedStores copy];
  }
  return v4;
}

+ (void)initialize
{
}

- (NSArray)affectedStores
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  result = self->_affectedStores;
  if (byte_1EB270AB4)
  {
    result = [(NSArray *)result count];
    if (result)
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      affectedStores = self->_affectedStores;
      uint64_t v6 = [(NSArray *)affectedStores countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v15;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v15 != v8) {
              objc_enumerationMutation(affectedStores);
            }
            uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
            if (v10)
            {
              id WeakRetained = objc_loadWeakRetained((id *)(v10 + 8));
              if (WeakRetained)
              {
                v12 = WeakRetained;
                [v4 addObject:WeakRetained];
              }
            }
          }
          uint64_t v7 = [(NSArray *)affectedStores countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v7);
      }
      v13 = (NSArray *)(id)[v4 copy];

      if ([(NSArray *)v13 count]) {
        return v13;
      }
      else {
        return 0;
      }
    }
  }
  return result;
}

- (BOOL)_secureOperation
{
  return 0;
}

- (void)setAffectedStores:(NSArray *)affectedStores
{
  v22[1] = *MEMORY[0x1E4F143B8];
  v5 = self->_affectedStores;
  if (byte_1EB270AB4)
  {
    if (v5 == affectedStores) {
      return;
    }

    if ([(NSArray *)affectedStores count])
    {
      uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:affectedStores];
      unint64_t v7 = [v6 count];
      unint64_t v8 = v7;
      if (v7 <= 1) {
        uint64_t v9 = 1;
      }
      else {
        uint64_t v9 = v7;
      }
      if (v7 >= 0x201) {
        uint64_t v10 = 1;
      }
      else {
        uint64_t v10 = v9;
      }
      v11 = (char *)v22 - ((8 * v10 + 15) & 0xFFFFFFFFFFFFFFF0);
      if (v7 >= 0x201)
      {
        v11 = (char *)NSAllocateScannedUncollectable();
        [v6 getObjects:v11];
      }
      else
      {
        bzero((char *)v22 - ((8 * v10 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v9);
        [v6 getObjects:v11];
        if (!v8)
        {
          self->_affectedStores = 0;

          return;
        }
      }
      uint64_t v18 = 0;
      uint64_t v19 = 0;
      do
      {
        id v20 = +[_PFWeakReference weakReferenceWithObject:]((uint64_t)_PFWeakReference, *(void *)&v11[8 * v18]);
        if (v20) {
          *(void *)&v11[8 * v19++] = v20;
        }
        ++v18;
      }
      while (v8 != v18);
      if (v19) {
        v21 = (NSArray *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:v11 count:v19];
      }
      else {
        v21 = 0;
      }
      self->_affectedStores = v21;

      if (v8 >= 0x201) {
        NSZoneFree(0, v11);
      }
    }
    else
    {
      self->_affectedStores = 0;
    }
  }
  else if (v5 != affectedStores)
  {

    if ([(NSArray *)affectedStores count] < 2)
    {
      self->_affectedStores = (NSArray *)[(NSArray *)affectedStores copy];
    }
    else
    {
      v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:affectedStores];
      unint64_t v13 = [v12 count];
      unint64_t v14 = v13;
      if (v13 <= 1) {
        uint64_t v15 = 1;
      }
      else {
        uint64_t v15 = v13;
      }
      if (v13 >= 0x201) {
        uint64_t v16 = 1;
      }
      else {
        uint64_t v16 = v15;
      }
      long long v17 = (char *)v22 - ((8 * v16 + 15) & 0xFFFFFFFFFFFFFFF0);
      if (v13 > 0x200) {
        long long v17 = (char *)NSAllocateScannedUncollectable();
      }
      else {
        bzero((char *)v22 - ((8 * v16 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v15);
      }
      [v12 getObjects:v17];
      self->_affectedStores = (NSArray *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:v17 count:v14];

      if (v14 >= 0x201) {
        NSZoneFree(0, v17);
      }
    }
  }
}

- (NSPersistentStoreRequestType)requestType
{
  return 0;
}

@end