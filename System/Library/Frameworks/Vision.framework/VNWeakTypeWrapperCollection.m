@interface VNWeakTypeWrapperCollection
- (BOOL)isEqual:(id)a3;
- (VNWeakTypeWrapperCollection)init;
- (id)allObjectsDroppingWeakZeroedObjects:(BOOL)a3;
- (id)description;
- (id)findObjectMeetingSearchCriteria:(id)a3 droppingWeakZeroedObjects:(BOOL)a4;
- (unint64_t)hash;
- (void)_enumerateObjectsDroppingWeakZeroedObjects:(BOOL)a3 usingBlock:(id)a4;
- (void)addObject:(id)a3 droppingWeakZeroedObjects:(BOOL)a4;
@end

@implementation VNWeakTypeWrapperCollection

void __85__VNWeakTypeWrapperCollection__enumerateObjectsDroppingWeakZeroedObjects_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 objectAndReturnError:0];
  if (v5 || !*(unsigned char *)(a1 + 64))
  {
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    [*(id *)(a1 + 32) addIndex:a3];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

uint64_t __67__VNWeakTypeWrapperCollection_allObjectsDroppingWeakZeroedObjects___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

uint64_t __67__VNWeakTypeWrapperCollection_addObject_droppingWeakZeroedObjects___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = [*(id *)(a1 + 32) isEqual:a2];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (void)addObject:(id)a3 droppingWeakZeroedObjects:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(NSRecursiveLock *)self->_weakObjectWrappersLock lock];
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __67__VNWeakTypeWrapperCollection_addObject_droppingWeakZeroedObjects___block_invoke;
  v13 = &unk_1E5B1C238;
  id v7 = v6;
  id v14 = v7;
  v15 = &v16;
  [(VNWeakTypeWrapperCollection *)self _enumerateObjectsDroppingWeakZeroedObjects:v4 usingBlock:&v10];
  if (!*((unsigned char *)v17 + 24))
  {
    v8 = [VNWeakTypeWrapper alloc];
    v9 = -[VNWeakTypeWrapper initWithObject:](v8, "initWithObject:", v7, v10, v11, v12, v13);
    [(NSMutableArray *)self->_weakObjectWrappers addObject:v9];
  }
  _Block_object_dispose(&v16, 8);
  [(NSRecursiveLock *)self->_weakObjectWrappersLock unlock];
}

- (id)allObjectsDroppingWeakZeroedObjects:(BOOL)a3
{
  BOOL v3 = a3;
  [(NSRecursiveLock *)self->_weakObjectWrappersLock lock];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__VNWeakTypeWrapperCollection_allObjectsDroppingWeakZeroedObjects___block_invoke;
  v9[3] = &unk_1E5B1C288;
  id v6 = v5;
  id v10 = v6;
  [(VNWeakTypeWrapperCollection *)self _enumerateObjectsDroppingWeakZeroedObjects:v3 usingBlock:v9];
  id v7 = (void *)[v6 copy];

  [(NSRecursiveLock *)self->_weakObjectWrappersLock unlock];

  return v7;
}

- (void)_enumerateObjectsDroppingWeakZeroedObjects:(BOOL)a3 usingBlock:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  char v18 = 0;
  if (v4) {
    id v7 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  }
  weakObjectWrappers = self->_weakObjectWrappers;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __85__VNWeakTypeWrapperCollection__enumerateObjectsDroppingWeakZeroedObjects_usingBlock___block_invoke;
  v11[3] = &unk_1E5B1C210;
  BOOL v16 = v4;
  id v9 = v7;
  id v12 = v9;
  id v14 = &v19;
  v15 = v17;
  id v10 = v6;
  id v13 = v10;
  [(NSMutableArray *)weakObjectWrappers enumerateObjectsUsingBlock:v11];
  if (*((unsigned char *)v20 + 24)) {
    [(NSMutableArray *)self->_weakObjectWrappers removeObjectsAtIndexes:v9];
  }

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(&v19, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weakObjectWrappersLock, 0);

  objc_storeStrong((id *)&self->_weakObjectWrappers, 0);
}

- (id)description
{
  id v3 = [NSString alloc];
  v7.receiver = self;
  v7.super_class = (Class)VNWeakTypeWrapperCollection;
  BOOL v4 = [(VNWeakTypeWrapperCollection *)&v7 description];
  id v5 = (void *)[v3 initWithFormat:@"%@: %@", v4, self->_weakObjectWrappers];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = (VNWeakTypeWrapperCollection *)a3;
  if (self == v4)
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v5 = [(NSMutableArray *)self->_weakObjectWrappers isEqualToArray:v4->_weakObjectWrappers];
    }
    else {
      char v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  return [(NSMutableArray *)self->_weakObjectWrappers hash];
}

- (id)findObjectMeetingSearchCriteria:(id)a3 droppingWeakZeroedObjects:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(NSRecursiveLock *)self->_weakObjectWrappersLock lock];
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__2198;
  v20 = __Block_byref_object_dispose__2199;
  id v21 = 0;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __89__VNWeakTypeWrapperCollection_findObjectMeetingSearchCriteria_droppingWeakZeroedObjects___block_invoke;
  id v13 = &unk_1E5B1C260;
  id v7 = v6;
  id v14 = v7;
  v15 = &v16;
  [(VNWeakTypeWrapperCollection *)self _enumerateObjectsDroppingWeakZeroedObjects:v4 usingBlock:&v10];
  id v8 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  [(NSRecursiveLock *)self->_weakObjectWrappersLock unlock];

  return v8;
}

void __89__VNWeakTypeWrapperCollection_findObjectMeetingSearchCriteria_droppingWeakZeroedObjects___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (VNWeakTypeWrapperCollection)init
{
  v8.receiver = self;
  v8.super_class = (Class)VNWeakTypeWrapperCollection;
  v2 = [(VNWeakTypeWrapperCollection *)&v8 init];
  if (v2)
  {
    id v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    weakObjectWrappers = v2->_weakObjectWrappers;
    v2->_weakObjectWrappers = v3;

    char v5 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E4F28FD0]);
    weakObjectWrappersLock = v2->_weakObjectWrappersLock;
    v2->_weakObjectWrappersLock = v5;
  }
  return v2;
}

@end