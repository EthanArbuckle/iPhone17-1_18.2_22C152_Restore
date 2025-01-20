@interface NSBatchUpdateRequestEncodingToken
+ (BOOL)supportsSecureCoding;
- (BOOL)includeSubEntities;
- (BOOL)secure;
- (NSBatchUpdateRequestEncodingToken)initWithCoder:(id)a3;
- (NSDictionary)columnsToUpdate;
- (NSPredicate)predicate;
- (NSString)entityName;
- (id)initForRequest:(id)a3;
- (int64_t)nullValueCount;
- (int64_t)resultType;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSBatchUpdateRequestEncodingToken

- (id)initForRequest:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v5 = objc_msgSend((id)objc_msgSend(a3, "propertiesToUpdate"), "allValues");
  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    v22 = self;
    int v8 = 0;
    uint64_t v9 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          _NSCoreDataLog(1, @"Unsupported Expression with the XPC Store: %@", v12, v13, v14, v15, v16, v17, (uint64_t)v11);

          return 0;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          int v18 = [v11 constantValue] == 0;
        }
        else {
          int v18 = objc_msgSend(v11, "isEqual:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"));
        }
        v8 += v18;
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v7) {
        continue;
      }
      break;
    }
    int64_t v19 = v8;
    self = v22;
  }
  else
  {
    int64_t v19 = 0;
  }
  v23.receiver = self;
  v23.super_class = (Class)NSBatchUpdateRequestEncodingToken;
  v20 = [(NSBatchUpdateRequestEncodingToken *)&v23 init];
  if (v20)
  {
    v20->_entityName = (NSString *)objc_msgSend((id)objc_msgSend(a3, "entityName"), "copy");
    v20->_predicate = (NSPredicate *)objc_msgSend((id)objc_msgSend(a3, "predicate"), "copy");
    v20->_columnsToUpdate = (NSDictionary *)objc_msgSend((id)objc_msgSend(a3, "propertiesToUpdate"), "copy");
    v20->_resultType = [a3 resultType];
    v20->_nullValueCount = v19;
    v20->_includeSubEntities = [a3 includesSubentities];
    v20->_secure = [a3 _secureOperation];
  }
  return v20;
}

- (void)dealloc
{
  self->_entityName = 0;
  self->_predicate = 0;

  self->_columnsToUpdate = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSBatchUpdateRequestEncodingToken;
  [(NSBatchUpdateRequestEncodingToken *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSBatchUpdateRequestEncodingToken)initWithCoder:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)NSBatchUpdateRequestEncodingToken;
  v4 = [(NSBatchUpdateRequestEncodingToken *)&v14 init];
  if (v4)
  {
    v4->_entityName = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"entityName"];
    v5 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v6 = objc_opt_class();
    v4->_predicate = (NSPredicate *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), @"predicate");
    uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, objc_opt_class(), 0);
    if (objc_msgSend((id)objc_msgSend(a3, "allowedClasses"), "count")) {
      uint64_t v12 = objc_msgSend(v12, "setByAddingObjectsFromSet:", objc_msgSend(a3, "allowedClasses"));
    }
    v4->_columnsToUpdate = (NSDictionary *)(id)[a3 decodeObjectOfClasses:v12 forKey:@"columnsToUpdate"];
    v4->_nullValueCount = [a3 decodeIntegerForKey:@"nullValueCount"];
    v4->_resultType = [a3 decodeIntegerForKey:@"resultType"];
    v4->_includeSubEntities = [a3 decodeBoolForKey:@"includeSubEntities"];
    v4->_secure = [a3 decodeBoolForKey:@"secure"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  [a3 encodeObject:self->_entityName forKey:@"entityName"];
  id v19 = a3;
  [a3 encodeObject:self->_predicate forKey:@"predicate"];
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSDictionary count](self->_columnsToUpdate, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  columnsToUpdate = self->_columnsToUpdate;
  uint64_t v7 = [(NSDictionary *)columnsToUpdate countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(columnsToUpdate);
        }
        uint64_t v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v12 = [(NSDictionary *)self->_columnsToUpdate objectForKey:v11];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          _NSCoreDataLog(1, @"Unsupported Expression for the XPC Store: %@", v13, v14, v15, v16, v17, v18, (uint64_t)v12);
        }
        else {
          objc_msgSend(v5, "setObject:forKey:", v12, objc_msgSend(v11, "name"));
        }
      }
      uint64_t v8 = [(NSDictionary *)columnsToUpdate countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }
  [v19 encodeObject:v5 forKey:@"columnsToUpdate"];

  [v19 encodeInteger:self->_nullValueCount forKey:@"nullValueCount"];
  [v19 encodeInteger:self->_resultType forKey:@"resultType"];
  [v19 encodeBool:self->_includeSubEntities forKey:@"includeSubEntities"];
  [v19 encodeBool:self->_secure forKey:@"secure"];
}

- (NSString)entityName
{
  return self->_entityName;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (NSDictionary)columnsToUpdate
{
  return self->_columnsToUpdate;
}

- (int64_t)resultType
{
  return self->_resultType;
}

- (int64_t)nullValueCount
{
  return self->_nullValueCount;
}

- (BOOL)includeSubEntities
{
  return self->_includeSubEntities;
}

- (BOOL)secure
{
  return self->_secure;
}

@end