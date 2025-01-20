@interface PHPersistentChange
- (PHPersistentChange)initWithChange:(id)a3;
- (PHPersistentChangeToken)changeToken;
- (PHPersistentObjectChangeDetails)changeDetailsForObjectType:(PHObjectType)objectType error:(NSError *)error;
@end

@implementation PHPersistentChange

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeToken, 0);

  objc_storeStrong((id *)&self->_change, 0);
}

- (PHPersistentChangeToken)changeToken
{
  return self->_changeToken;
}

- (PHPersistentObjectChangeDetails)changeDetailsForObjectType:(PHObjectType)objectType error:(NSError *)error
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ([(PHChange *)self->_change hasIncrementalChanges])
  {
    v7 = +[PHPhotoLibrary PHObjectClassForObjectType:objectType];
    if (v7)
    {
      v8 = [(PHChange *)self->_change changedLocalIdentifiersForEntityClass:v7];
      v9 = v8;
      if (v8)
      {
        v10 = [v8 objectForKeyedSubscript:@"PHInsertedLocalIdentifiersKey"];
        v11 = [v9 objectForKeyedSubscript:@"PHUpdatedLocalIdentifiersKey"];
        v12 = [v9 objectForKeyedSubscript:@"PHDeletedLocalIdentifiersKey"];
        v13 = [[PHPersistentObjectChangeDetails alloc] initWithObjectType:objectType insertedIdentifiers:v10 updatedIdentifiers:v11 deletedIdentifiers:v12];

        if (v13)
        {
LABEL_15:

          goto LABEL_16;
        }
      }
    }
    else
    {
      v9 = 0;
    }
    v16 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      change = self->_change;
      int v21 = 138412546;
      v22 = change;
      __int16 v23 = 2112;
      v24 = v7;
      _os_log_impl(&dword_19B043000, v16, OS_LOG_TYPE_ERROR, "Missing changeDetails for change %@ and entityClass %@", (uint8_t *)&v21, 0x16u);
    }

    v18 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", -1, 0);
    v19 = v18;
    if (error) {
      *error = (NSError *)v18;
    }

    v13 = 0;
    goto LABEL_15;
  }
  v14 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3210, 0);
  v15 = v14;
  if (error) {
    *error = (NSError *)v14;
  }

  v13 = 0;
LABEL_16:

  return v13;
}

- (PHPersistentChange)initWithChange:(id)a3
{
  id v5 = a3;
  v6 = [(PHPersistentChange *)self init];
  if (v6)
  {
    v7 = [v5 changeToken];
    if (v7)
    {
      objc_storeStrong((id *)&v6->_change, a3);
      objc_storeStrong((id *)&v6->_changeToken, v7);
    }
    else
    {

      v6 = 0;
    }
  }
  return v6;
}

@end