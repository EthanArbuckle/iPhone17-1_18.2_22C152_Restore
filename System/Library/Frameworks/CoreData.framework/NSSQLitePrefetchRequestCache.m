@interface NSSQLitePrefetchRequestCache
- (NSSQLitePrefetchRequestCache)initWithSQLCore:(id)a3;
- (id)inverseIsToOnePrefetchRequestForRelationshipNamed:(id)a3 onEntity:(id)a4;
- (id)manyToManyPrefetchRequestsForRelationshipNamed:(id)a3 onEntity:(id)a4;
- (id)manyToOnePrefetchRequestForRelationshipNamed:(id)a3 onEntity:(id)a4;
- (void)dealloc;
@end

@implementation NSSQLitePrefetchRequestCache

- (id)inverseIsToOnePrefetchRequestForRelationshipNamed:(id)a3 onEntity:(id)a4
{
  id Weak = objc_loadWeak((id *)&self->_sqlCore);
  if (!Weak) {
    return 0;
  }
  v8 = Weak;
  id v9 = -[NSEntityDescription _relationshipNamed:](a4, (uint64_t)a3);
  uint64_t v10 = _sqlCoreLookupSQLEntityForEntityDescription(v8, a4);
  uint64_t v11 = [(id)v10 model];
  if (v11 != [v8 model]) {
    return 0;
  }
  if (v10) {
    v14 = (void *)[*(id *)(v10 + 40) objectForKey:a3];
  }
  else {
    v14 = 0;
  }
  int v15 = [v14 isToMany];
  int v16 = [v9 isOrdered];
  if (!v14)
  {
    v17 = 0;
    if (!v10) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  v17 = (void *)v14[7];
  if (v10) {
LABEL_9:
  }
    uint64_t v10 = *(unsigned int *)(v10 + 184);
LABEL_10:
  v18 = (NSKnownKeysDictionary *)self->_prefetchRequestsByEntity[v10];
  if (!v18)
  {
    v18 = -[NSKnownKeysDictionary initWithSearchStrategy:]([NSKnownKeysDictionary alloc], "initWithSearchStrategy:", -[NSEntityDescription knownKeysMappingStrategy](a4));
    self->_prefetchRequestsByEntity[v10] = v18;
  }
  v12 = (NSCachingFetchRequest *)[(NSKnownKeysDictionary *)v18 objectForKey:a3];
  if (!v12)
  {
    v12 = objc_alloc_init(NSCachingFetchRequest);
    [(NSCachingFetchRequest *)v12 _disableSQLStatementCaching];
    -[NSFetchRequest setEntity:](v12, "setEntity:", objc_msgSend((id)objc_msgSend(v14, "destinationEntity"), "entityDescription"));
    uint64_t v19 = [MEMORY[0x1E4F28C68] expressionForVariable:@"destinations"];
    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28DA0]), "initWithObject:", objc_msgSend(v17, "name"));
    v21 = (void *)[objc_alloc(MEMORY[0x1E4F28D98]) initWithKeyPath:v20];

    v22 = (void *)[objc_alloc(MEMORY[0x1E4F28B98]) initWithLeftExpression:v21 rightExpression:v19 modifier:0 type:10 options:0];
    [(NSFetchRequest *)v12 setPredicate:v22];

    if (v15)
    {
      v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F29008]), "initWithKey:ascending:", objc_msgSend((id)objc_msgSend(v17, "foreignKey"), "name"), 1);
      if (v16)
      {
        id v24 = objc_alloc(MEMORY[0x1E4F29008]);
        if (v17) {
          v25 = (void *)v17[10];
        }
        else {
          v25 = 0;
        }
        v26 = objc_msgSend(v24, "initWithKey:ascending:", objc_msgSend(v25, "name"), 1);
      }
      else
      {
        v26 = 0;
      }
      v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v23, v26, 0);

      [(NSFetchRequest *)v12 setSortDescriptors:v27];
    }
    v28 = v12;
  }
  return v12;
}

- (id)manyToOnePrefetchRequestForRelationshipNamed:(id)a3 onEntity:(id)a4
{
  id Weak = objc_loadWeak((id *)&self->_sqlCore);
  if (!Weak) {
    return 0;
  }
  v8 = Weak;
  uint64_t v9 = _sqlCoreLookupSQLEntityForEntityDescription(Weak, a4);
  uint64_t v10 = [(id)v9 model];
  if (v10 != [v8 model]) {
    return 0;
  }
  if (v9)
  {
    v13 = (void *)[*(id *)(v9 + 40) objectForKey:a3];
    uint64_t v9 = *(unsigned int *)(v9 + 184);
  }
  else
  {
    v13 = 0;
  }
  v14 = (NSKnownKeysDictionary *)self->_prefetchRequestsByEntity[v9];
  if (!v14)
  {
    v14 = -[NSKnownKeysDictionary initWithSearchStrategy:]([NSKnownKeysDictionary alloc], "initWithSearchStrategy:", -[NSEntityDescription knownKeysMappingStrategy](a4));
    self->_prefetchRequestsByEntity[v9] = v14;
  }
  uint64_t v11 = (NSCachingFetchRequest *)[(NSKnownKeysDictionary *)v14 objectForKey:a3];
  if (!v11)
  {
    uint64_t v11 = objc_alloc_init(NSCachingFetchRequest);
    [(NSCachingFetchRequest *)v11 _disableSQLStatementCaching];
    -[NSFetchRequest setEntity:](v11, "setEntity:", objc_msgSend((id)objc_msgSend(v13, "destinationEntity"), "entityDescription"));
    uint64_t v15 = _SELF_Expression;
    uint64_t v16 = [MEMORY[0x1E4F28C68] expressionForVariable:@"objects"];
    v17 = (void *)[objc_alloc(MEMORY[0x1E4F28B98]) initWithLeftExpression:v15 rightExpression:v16 modifier:0 type:10 options:0];
    [(NSFetchRequest *)v11 setPredicate:v17];

    v18 = v11;
  }
  return v11;
}

- (id)manyToManyPrefetchRequestsForRelationshipNamed:(id)a3 onEntity:(id)a4
{
  id Weak = objc_loadWeak((id *)&self->_sqlCore);
  if (!Weak) {
    return 0;
  }
  uint64_t v8 = _sqlCoreLookupSQLEntityForEntityDescription(Weak, a4);
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = (void *)[*(id *)(v8 + 40) objectForKey:a3];
    uint64_t v9 = *(unsigned int *)(v9 + 184);
  }
  else
  {
    uint64_t v10 = 0;
  }
  uint64_t v11 = (NSKnownKeysDictionary *)self->_prefetchRequestsByEntity[v9];
  if (!v11)
  {
    uint64_t v11 = -[NSKnownKeysDictionary initWithSearchStrategy:]([NSKnownKeysDictionary alloc], "initWithSearchStrategy:", -[NSEntityDescription knownKeysMappingStrategy](a4));
    self->_prefetchRequestsByEntity[v9] = v11;
  }
  v12 = (NSCachingFetchRequest *)[(NSKnownKeysDictionary *)v11 objectForKey:a3];
  if (!v12)
  {
    v12 = objc_alloc_init(NSCachingFetchRequest);
    [(NSCachingFetchRequest *)v12 _disableSQLStatementCaching];
    -[NSFetchRequest setEntity:](v12, "setEntity:", objc_msgSend((id)objc_msgSend(v10, "destinationEntity"), "entityDescription"));
    uint64_t v13 = _SELF_Expression;
    uint64_t v14 = [MEMORY[0x1E4F28C68] expressionForVariable:@"mtmObjects"];
    uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F28B98]) initWithLeftExpression:v13 rightExpression:v14 modifier:0 type:10 options:0];
    [(NSFetchRequest *)v12 setPredicate:v15];

    uint64_t v16 = v12;
  }
  return v12;
}

- (NSSQLitePrefetchRequestCache)initWithSQLCore:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NSSQLitePrefetchRequestCache;
  v4 = [(NSSQLitePrefetchRequestCache *)&v9 init];
  v5 = v4;
  if (v4)
  {
    objc_storeWeak((id *)&v4->_sqlCore, a3);
    v6 = (void *)[a3 model];
    if (v6) {
      v6 = (void *)v6[4];
    }
    uint64_t v7 = [v6 count];
    v5->_length = v7;
    v5->_prefetchRequestsByEntity = (id *)PF_CALLOC_OBJECT_ARRAY(v7 + 1);
  }
  return v5;
}

- (void)dealloc
{
  unint64_t length = self->_length;
  if (length)
  {
    for (unint64_t i = 1; i <= length; ++i)
    {
      id v5 = self->_prefetchRequestsByEntity[i];
      if (v5) {
    }
      }
  }
  PF_FREE_OBJECT_ARRAY(self->_prefetchRequestsByEntity);
  self->_prefetchRequestsByEntity = 0;
  objc_storeWeak((id *)&self->_sqlCore, 0);
  v6.receiver = self;
  v6.super_class = (Class)NSSQLitePrefetchRequestCache;
  [(NSSQLitePrefetchRequestCache *)&v6 dealloc];
}

- (void).cxx_destruct
{
}

@end