@interface PHPersistentObjectChangeDetails
- (NSSet)deletedLocalIdentifiers;
- (NSSet)insertedLocalIdentifiers;
- (NSSet)updatedLocalIdentifiers;
- (PHObjectType)objectType;
- (PHPersistentObjectChangeDetails)initWithObjectType:(int64_t)a3 insertedIdentifiers:(id)a4 updatedIdentifiers:(id)a5 deletedIdentifiers:(id)a6;
@end

@implementation PHPersistentObjectChangeDetails

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_updatedLocalIdentifiers, 0);

  objc_storeStrong((id *)&self->_insertedLocalIdentifiers, 0);
}

- (NSSet)deletedLocalIdentifiers
{
  return self->_deletedLocalIdentifiers;
}

- (NSSet)updatedLocalIdentifiers
{
  return self->_updatedLocalIdentifiers;
}

- (NSSet)insertedLocalIdentifiers
{
  return self->_insertedLocalIdentifiers;
}

- (PHObjectType)objectType
{
  return self->_objectType;
}

- (PHPersistentObjectChangeDetails)initWithObjectType:(int64_t)a3 insertedIdentifiers:(id)a4 updatedIdentifiers:(id)a5 deletedIdentifiers:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)PHPersistentObjectChangeDetails;
  v13 = [(PHPersistentObjectChangeDetails *)&v22 init];
  v14 = v13;
  if (v13)
  {
    v13->_objectType = a3;
    if (v10)
    {
      v15 = (NSSet *)v10;
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CAD0] set];
    }
    insertedLocalIdentifiers = v14->_insertedLocalIdentifiers;
    v14->_insertedLocalIdentifiers = v15;

    if (v11)
    {
      v17 = (NSSet *)v11;
    }
    else
    {
      v17 = [MEMORY[0x1E4F1CAD0] set];
    }
    updatedLocalIdentifiers = v14->_updatedLocalIdentifiers;
    v14->_updatedLocalIdentifiers = v17;

    if (v12)
    {
      v19 = (NSSet *)v12;
    }
    else
    {
      v19 = [MEMORY[0x1E4F1CAD0] set];
    }
    deletedLocalIdentifiers = v14->_deletedLocalIdentifiers;
    v14->_deletedLocalIdentifiers = v19;
  }
  return v14;
}

@end