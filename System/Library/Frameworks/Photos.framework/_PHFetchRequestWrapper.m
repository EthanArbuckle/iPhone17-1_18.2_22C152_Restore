@interface _PHFetchRequestWrapper
- (BOOL)isEqual:(id)a3;
- (NSFetchRequest)fetchRequest;
- (NSManagedObjectID)containerIdentifier;
- (NSSet)fetchPropertySets;
- (_PHFetchRequestWrapper)initWithFetchRequest:(id)a3 containerIdentifier:(id)a4 fetchPropertySets:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation _PHFetchRequestWrapper

- (_PHFetchRequestWrapper)initWithFetchRequest:(id)a3 containerIdentifier:(id)a4 fetchPropertySets:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)_PHFetchRequestWrapper;
  v12 = [(_PHFetchRequestWrapper *)&v18 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_fetchRequest, a3);
    v14 = [v9 predicate];
    v15 = v14;
    if (v14)
    {
      v13->_hash = _FastHashForPredicate(v14);
    }
    else
    {
      v16 = [v9 entityName];
      v13->_hash = [v16 hash];
    }
    objc_storeStrong((id *)&v13->_containerIdentifier, a4);
    objc_storeStrong((id *)&v13->_fetchPropertySets, a5);
  }
  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchPropertySets, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);

  objc_storeStrong((id *)&self->_fetchRequest, 0);
}

- (NSSet)fetchPropertySets
{
  return self->_fetchPropertySets;
}

- (NSManagedObjectID)containerIdentifier
{
  return self->_containerIdentifier;
}

- (NSFetchRequest)fetchRequest
{
  return self->_fetchRequest;
}

- (unint64_t)hash
{
  return self->_hash;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [(_PHFetchRequestWrapper *)self fetchRequest];
  v5 = (void *)[v4 copy];

  v6 = [_PHFetchRequestWrapper alloc];
  v7 = (void *)[(NSManagedObjectID *)self->_containerIdentifier copy];
  v8 = [(_PHFetchRequestWrapper *)v6 initWithFetchRequest:v5 containerIdentifier:v7 fetchPropertySets:self->_fetchPropertySets];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(_PHFetchRequestWrapper *)self fetchRequest];
    v6 = [v4 fetchRequest];
    if (![v5 isEqual:v6])
    {
      char v11 = 0;
LABEL_16:

      goto LABEL_17;
    }
    v7 = [(_PHFetchRequestWrapper *)self containerIdentifier];
    v8 = [v4 containerIdentifier];
    if (v7 == v8)
    {
      [(_PHFetchRequestWrapper *)self fetchPropertySets];
    }
    else
    {
      id v9 = [(_PHFetchRequestWrapper *)self containerIdentifier];
      id v10 = [v4 containerIdentifier];
      if (![v9 isEqual:v10])
      {
        char v11 = 0;
LABEL_14:

LABEL_15:
        goto LABEL_16;
      }
      [(_PHFetchRequestWrapper *)self fetchPropertySets];
    v12 = };
    uint64_t v13 = [v4 fetchPropertySets];
    if (v12 == (void *)v13)
    {

      char v11 = 1;
    }
    else
    {
      v14 = (void *)v13;
      v15 = [(_PHFetchRequestWrapper *)self fetchPropertySets];
      v16 = [v4 fetchPropertySets];
      char v11 = [v15 isEqualToSet:v16];
    }
    id v10 = v19;
    id v9 = v21;
    if (v7 == v8) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  char v11 = 0;
LABEL_17:

  return v11;
}

@end