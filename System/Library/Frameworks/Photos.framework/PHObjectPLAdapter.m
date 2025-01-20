@interface PHObjectPLAdapter
- (NSMutableDictionary)modifiedKeyValues;
- (NSMutableOrderedSet)ignoredKeys;
- (PHObjectPLAdapter)initWithPLManagedObject:(id)a3 photoLibrary:(id)a4;
- (PHPhotoLibrary)photoLibrary;
- (PLManagedObject)backingManagedObject;
- (id)mutableAccessingCopy;
- (id)newObjectWithPropertySets:(id)a3;
- (id)objectForKey:(id)a3;
- (void)removeObjectForKey:(id)a3;
- (void)setIgnoredKeys:(id)a3;
- (void)setModifiedKeyValues:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
@end

@implementation PHObjectPLAdapter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifiedKeyValues, 0);
  objc_storeStrong((id *)&self->_ignoredKeys, 0);
  objc_storeStrong((id *)&self->_backingManagedObject, 0);

  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

- (void)setModifiedKeyValues:(id)a3
{
}

- (NSMutableDictionary)modifiedKeyValues
{
  return self->_modifiedKeyValues;
}

- (void)setIgnoredKeys:(id)a3
{
}

- (NSMutableOrderedSet)ignoredKeys
{
  return self->_ignoredKeys;
}

- (PLManagedObject)backingManagedObject
{
  return self->_backingManagedObject;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  if (a3) {
    [(PHObjectPLAdapter *)self setObject:a3 forKey:a4];
  }
  else {
    [(PHObjectPLAdapter *)self removeObjectForKey:a4];
  }
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  modifiedKeyValues = self->_modifiedKeyValues;
  if (!modifiedKeyValues)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v9 = self->_modifiedKeyValues;
    self->_modifiedKeyValues = v8;

    modifiedKeyValues = self->_modifiedKeyValues;
  }
  [(NSMutableDictionary *)modifiedKeyValues setObject:v10 forKey:v6];
  [(NSMutableOrderedSet *)self->_ignoredKeys removeObject:v6];
}

- (void)removeObjectForKey:(id)a3
{
  id v4 = a3;
  ignoredKeys = self->_ignoredKeys;
  id v8 = v4;
  if (!ignoredKeys)
  {
    id v6 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    v7 = self->_ignoredKeys;
    self->_ignoredKeys = v6;

    id v4 = v8;
    ignoredKeys = self->_ignoredKeys;
  }
  [(NSMutableOrderedSet *)ignoredKeys addObject:v4];
  [(NSMutableDictionary *)self->_modifiedKeyValues removeObjectForKey:v8];
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  if ([(NSMutableOrderedSet *)self->_ignoredKeys containsObject:v4])
  {
    v5 = 0;
  }
  else
  {
    v5 = [(NSMutableDictionary *)self->_modifiedKeyValues objectForKey:v4];
    if (!v5)
    {
      v5 = [(PLManagedObject *)self->_backingManagedObject valueForKeyPath:v4];
    }
  }

  return v5;
}

- (id)mutableAccessingCopy
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithPLManagedObject:self->_backingManagedObject photoLibrary:self->_photoLibrary];
  uint64_t v4 = [(NSMutableOrderedSet *)self->_ignoredKeys mutableCopy];
  v5 = (void *)v3[3];
  v3[3] = v4;

  uint64_t v6 = [(NSMutableDictionary *)self->_modifiedKeyValues mutableCopy];
  v7 = (void *)v3[4];
  v3[4] = v6;

  return v3;
}

- (id)newObjectWithPropertySets:(id)a3
{
  return 0;
}

- (PHObjectPLAdapter)initWithPLManagedObject:(id)a3 photoLibrary:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v23.receiver = self;
  v23.super_class = (Class)PHObjectPLAdapter;
  id v10 = [(PHObjectPLAdapter *)&v23 init];
  if (v10)
  {
    uint64_t v11 = [v8 photoLibrary];
    if (v11)
    {
      v12 = (void *)v11;
      [v8 photoLibrary];
      v13 = SEL v22 = a2;
      v14 = [v13 pathManager];
      v15 = [v14 libraryURL];
      [v9 photoLibraryURL];
      id v16 = a4;
      v18 = id v17 = v9;
      char v21 = [v15 isEqual:v18];

      id v9 = v17;
      a4 = v16;

      if ((v21 & 1) == 0)
      {
        v19 = [MEMORY[0x1E4F28B00] currentHandler];
        [v19 handleFailureInMethod:v22, v10, @"PHObjectPLAdapter.m", 32, @"Invalid parameter not satisfying: %@", @"managedObject.photoLibrary == nil || [managedObject.photoLibrary.pathManager.libraryURL isEqual:photoLibrary.photoLibraryURL]" object file lineNumber description];
      }
    }
    objc_storeStrong((id *)&v10->_backingManagedObject, a3);
    objc_storeStrong((id *)&v10->_photoLibrary, a4);
  }

  return v10;
}

@end