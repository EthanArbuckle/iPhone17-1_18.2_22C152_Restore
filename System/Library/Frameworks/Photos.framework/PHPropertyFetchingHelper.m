@interface PHPropertyFetchingHelper
+ (id)fetchPropertiesForObjectIDs:(id)a3 propertyNamesByEntityName:(id)a4 photoLibrary:(id)a5;
- (BOOL)evaluateQuery:(id)a3 withObjectID:(id)a4 outMissingPropertyNames:(id *)a5;
- (PHPhotoLibrary)photoLibrary;
- (PHPropertyFetchingHelper)init;
- (PHPropertyFetchingHelper)initWithObjectIDs:(id)a3 propertyNamesByEntityName:(id)a4 photoLibrary:(id)a5;
- (id)fetchedPropertiesForObjectID:(id)a3;
@end

@implementation PHPropertyFetchingHelper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_lock_dictionaryWrapper, 0);
  objc_storeStrong((id *)&self->_propertyValuesByOID, 0);

  objc_storeStrong((id *)&self->_fetchedPropertyNamesByEntityName, 0);
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (BOOL)evaluateQuery:(id)a3 withObjectID:(id)a4 outMissingPropertyNames:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [(PHPropertyFetchingHelper *)self fetchedPropertiesForObjectID:v9];
  if (v10)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    [(_PHDictionaryKeyValueWrapper *)self->_lock_dictionaryWrapper setObjectID:v9 dictionary:v10];
    char v12 = [v8 evaluateWithObject:self->_lock_dictionaryWrapper];
    v13 = [(_PHDictionaryKeyValueWrapper *)self->_lock_dictionaryWrapper missingPropertyNames];
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    fetchedPropertyNamesByEntityName = self->_fetchedPropertyNamesByEntityName;
    v15 = [v9 entity];
    v16 = [v15 name];
    v13 = [(NSDictionary *)fetchedPropertyNamesByEntityName objectForKeyedSubscript:v16];

    char v12 = 0;
  }
  id v17 = v13;
  *a5 = v17;

  return v12;
}

- (id)fetchedPropertiesForObjectID:(id)a3
{
  return [(NSDictionary *)self->_propertyValuesByOID objectForKeyedSubscript:a3];
}

- (PHPropertyFetchingHelper)init
{
  v2 = self;
  PLMethodNotImplementedException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (PHPropertyFetchingHelper)initWithObjectIDs:(id)a3 propertyNamesByEntityName:(id)a4 photoLibrary:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)PHPropertyFetchingHelper;
  v11 = [(PHPropertyFetchingHelper *)&v20 init];
  char v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_photoLibrary, a5);
    uint64_t v13 = [v9 copy];
    fetchedPropertyNamesByEntityName = v12->_fetchedPropertyNamesByEntityName;
    v12->_fetchedPropertyNamesByEntityName = (NSDictionary *)v13;

    uint64_t v15 = [v10 fetchPropertiesByOID:v8 propertyNamesByEntityName:v9];
    propertyValuesByOID = v12->_propertyValuesByOID;
    v12->_propertyValuesByOID = (NSDictionary *)v15;

    v12->_lock._os_unfair_lock_opaque = 0;
    id v17 = [[_PHDictionaryKeyValueWrapper alloc] initWithFetchedPropertyNamesByEntityName:v9];
    lock_dictionaryWrapper = v12->_lock_dictionaryWrapper;
    v12->_lock_dictionaryWrapper = v17;
  }
  return v12;
}

+ (id)fetchPropertiesForObjectIDs:(id)a3 propertyNamesByEntityName:(id)a4 photoLibrary:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[PHPropertyFetchingHelper alloc] initWithObjectIDs:v9 propertyNamesByEntityName:v8 photoLibrary:v7];

  return v10;
}

@end