@interface NSBatchUpdateRequest
+ (NSBatchUpdateRequest)batchUpdateRequestWithEntityName:(NSString *)entityName;
+ (id)decodeFromXPCArchive:(id)a3 withContext:(id)a4 withPolicy:(id)a5;
- (BOOL)_secureOperation;
- (BOOL)includesSubentities;
- (NSBatchUpdateRequest)init;
- (NSBatchUpdateRequest)initWithEntity:(NSEntityDescription *)entity;
- (NSBatchUpdateRequest)initWithEntityName:(NSString *)entityName;
- (NSBatchUpdateRequestResultType)resultType;
- (NSDictionary)propertiesToUpdate;
- (NSEntityDescription)entity;
- (NSPredicate)predicate;
- (NSString)description;
- (NSString)entityName;
- (id)encodeForXPC;
- (unint64_t)requestType;
- (void)_resolveEntityWithContext:(id)a3;
- (void)_setSecureOperation:(BOOL)a3;
- (void)_setValidatedPropertiesToUpdate:(id *)a1;
- (void)dealloc;
- (void)setIncludesSubentities:(BOOL)includesSubentities;
- (void)setPredicate:(NSPredicate *)predicate;
- (void)setPropertiesToUpdate:(NSDictionary *)propertiesToUpdate;
- (void)setResultType:(NSBatchUpdateRequestResultType)resultType;
@end

@implementation NSBatchUpdateRequest

- (NSPredicate)predicate
{
  return (NSPredicate *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)includesSubentities
{
  return *(_DWORD *)&self->_flags & 1;
}

- (unint64_t)requestType
{
  return 6;
}

- (NSBatchUpdateRequestResultType)resultType
{
  return ((unint64_t)self->_flags >> 1) & 3;
}

- (NSDictionary)propertiesToUpdate
{
  return self->_columnsToUpdate;
}

- (BOOL)_secureOperation
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (void)setPredicate:(NSPredicate *)predicate
{
}

- (NSBatchUpdateRequest)initWithEntity:(NSEntityDescription *)entity
{
  v4 = [(NSBatchUpdateRequest *)self init];
  if (v4) {
    v4->_entity = entity;
  }
  return v4;
}

- (NSBatchUpdateRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)NSBatchUpdateRequest;
  result = [(NSBatchUpdateRequest *)&v3 init];
  if (result) {
    result->_flags = (_requestFlags)(*(_DWORD *)&result->_flags & 0xFFFFFFF8 | 1);
  }
  return result;
}

- (void)dealloc
{
  self->_entity = 0;
  self->_predicate = 0;

  self->_columnsToUpdate = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSBatchUpdateRequest;
  [(NSPersistentStoreRequest *)&v3 dealloc];
}

- (void)setPropertiesToUpdate:(NSDictionary *)propertiesToUpdate
{
  if (self->_columnsToUpdate != propertiesToUpdate)
  {
    if ((*(unsigned char *)&self->_flags & 8) != 0)
    {
      v5 = propertiesToUpdate;

      self->_columnsToUpdate = propertiesToUpdate;
    }
    else
    {
      -[NSBatchUpdateRequest _setValidatedPropertiesToUpdate:]((id *)&self->super.super.isa, propertiesToUpdate);
    }
  }
}

- (void)_setValidatedPropertiesToUpdate:(id *)a1
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = a1;
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    uint64_t v47 = [a2 countByEnumeratingWithState:&v49 objects:v69 count:16];
    if (v47)
    {
      uint64_t v4 = *(void *)v50;
      v45 = v2;
LABEL_4:
      uint64_t v5 = 0;
      while (1)
      {
        if (*(void *)v50 != v4) {
          objc_enumerationMutation(a2);
        }
        v6 = *(void **)(*((void *)&v49 + 1) + 8 * v5);
        v7 = (void *)MEMORY[0x18C127630]();
        uint64_t v8 = [a2 objectForKey:v6];
        if ([v6 isNSString])
        {
          v46 = v7;
          v9 = (void *)[v6 componentsSeparatedByString:@"."];
          v10 = (void *)[v2 entity];
          if ([v9 count] != 1)
          {

            uint64_t v36 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"Invalid string keypath %@ passed to propertiesToUpdate:", v6), 0 reason userInfo];
            uint64_t v37 = *MEMORY[0x1E4F281F8];
            v67 = @"NSUnderlyingException";
            uint64_t v68 = v36;
            v33 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", v37, 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1));
            v2 = v45;
            v7 = v46;
            goto LABEL_33;
          }
          v11 = objc_msgSend((id)objc_msgSend(v10, "propertiesByName"), "objectForKey:", objc_msgSend(v9, "objectAtIndex:", 0));
          v2 = v45;
          v7 = v46;
          if (!v11 || (v6 = v11, [v11 isTransient]))
          {

            uint64_t v24 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"Invalid string key %@ passed to propertiesToUpdate:", 0), 0 reason userInfo];
            v19 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v20 = *MEMORY[0x1E4F281F8];
            v65 = @"NSUnderlyingException";
            uint64_t v66 = v24;
            v21 = (void *)MEMORY[0x1E4F1C9E8];
            v22 = &v66;
            v23 = &v65;
            goto LABEL_31;
          }
        }
        v12 = (void *)[v2 entity];
        uint64_t v13 = [v6 name];
        if (!v12
          || (v14 = objc_msgSend((id)objc_msgSend(v12, "propertiesByName"), "objectForKey:", v13)) == 0)
        {

          uint64_t v18 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"Attribute/relationship description names passed to propertiesToUpdate must match name on fetch entity (%@)", 0), 0 reason userInfo];
          v19 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v20 = *MEMORY[0x1E4F281F8];
          v63 = @"NSUnderlyingException";
          uint64_t v64 = v18;
          v21 = (void *)MEMORY[0x1E4F1C9E8];
          v22 = &v64;
          v23 = &v63;
          goto LABEL_31;
        }
        v15 = v14;
        if ([v14 isTransient])
        {

          uint64_t v25 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"Invalid property %@ passed as key to propertiesToUpdate:", v15), 0 reason userInfo];
          v19 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v20 = *MEMORY[0x1E4F281F8];
          v61 = @"NSUnderlyingException";
          uint64_t v62 = v25;
          v21 = (void *)MEMORY[0x1E4F1C9E8];
          v22 = &v62;
          v23 = &v61;
          goto LABEL_31;
        }
        uint64_t v16 = [v15 _propertyType];
        switch(v16)
        {
          case 4:

            uint64_t v26 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"Invalid relationship (%@) passed to propertiesToUpdate:", v15), 0 reason userInfo];
            v19 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v20 = *MEMORY[0x1E4F281F8];
            v57 = @"NSUnderlyingException";
            uint64_t v58 = v26;
            v21 = (void *)MEMORY[0x1E4F1C9E8];
            v22 = &v58;
            v23 = &v57;
            goto LABEL_31;
          case 6:

            uint64_t v27 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"Invalid derived attribute (%@) passed to propertiesToUpdate:", v15), 0 reason userInfo];
            v19 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v20 = *MEMORY[0x1E4F281F8];
            v55 = @"NSUnderlyingException";
            uint64_t v56 = v27;
            v21 = (void *)MEMORY[0x1E4F1C9E8];
            v22 = &v56;
            v23 = &v55;
            goto LABEL_31;
          case 5:

            uint64_t v28 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"Invalid expressionDescription %@ passed as key to propertiesToUpdate:", v15), 0 reason userInfo];
            v19 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v20 = *MEMORY[0x1E4F281F8];
            v59 = @"NSUnderlyingException";
            uint64_t v60 = v28;
            v21 = (void *)MEMORY[0x1E4F1C9E8];
            v22 = &v60;
            v23 = &v59;
LABEL_31:
            uint64_t v29 = [v21 dictionaryWithObjects:v22 forKeys:v23 count:1];
            v30 = v19;
            uint64_t v31 = v20;
            uint64_t v32 = 134060;
LABEL_32:
            v33 = (void *)[v30 errorWithDomain:v31 code:v32 userInfo:v29];
LABEL_33:
            id v17 = v33;
            id v3 = 0;
            goto LABEL_34;
        }
        if (HIBYTE(dword_1EB270AB8))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && ([v15 isOptional] & 1) == 0)
          {

            v38 = (void *)MEMORY[0x1E4F1C9E8];
            uint64_t v39 = [v15 name];
            uint64_t v40 = objc_msgSend(v38, "dictionaryWithObjectsAndKeys:", v12, @"NSValidationErrorObject", v39, @"NSValidationErrorKey", objc_msgSend(MEMORY[0x1E4F1CA98], "null"), @"NSValidationErrorValue", 0);
            uint64_t v41 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"Invalid NULL value for key (%@) passed to propertiesToUpdate:", objc_msgSend(v15, "name")), v40 reason userInfo];
            v42 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v43 = *MEMORY[0x1E4F281F8];
            v53 = @"NSUnderlyingException";
            uint64_t v54 = v41;
            uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
            v30 = v42;
            uint64_t v31 = v43;
            uint64_t v32 = 1570;
            goto LABEL_32;
          }
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          uint64_t v8 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v8];
        }
        [v3 setObject:v8 forKey:v15];
        if (v47 == ++v5)
        {
          uint64_t v47 = [a2 countByEnumeratingWithState:&v49 objects:v69 count:16];
          if (v47) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
    id v17 = 0;
LABEL_34:
    uint64_t v34 = [v3 count];
    if (v34 != [a2 count])
    {

      if (v17) {
        id v44 = v17;
      }
LABEL_46:
      objc_exception_throw((id)objc_msgSend((id)objc_msgSend(v17, "userInfo"), "valueForKey:", @"NSUnderlyingException"));
    }
    if (v17)
    {
      id v35 = v17;
      if (!v3) {
        goto LABEL_46;
      }
    }
    else if (!v3)
    {
      id v17 = 0;
      goto LABEL_46;
    }

    v2[5] = v3;
  }
}

- (NSEntityDescription)entity
{
  if ((*(unsigned char *)&self->_flags & 8) != 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F28778], objc_msgSend(NSString, "stringWithFormat:", @"This batch update request (%p) was created with a string name (%@), and cannot respond to -entity until used by an NSManagedObjectContext", self, self->_entity, 0), 0 reason userInfo]);
  }
  return (NSEntityDescription *)self->_entity;
}

- (void)_resolveEntityWithContext:(id)a3
{
  if ((*(unsigned char *)&self->_flags & 8) == 0) {
    return;
  }
  int v5 = [a3 _allowAncillaryEntities];
  v6 = (void *)[a3 persistentStoreCoordinator];
  if (v5)
  {
    if (!v6 || (uint64_t v7 = v6[12]) == 0) {
LABEL_12:
    }
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], objc_msgSend(NSString, "stringWithFormat:", @"Can't find entity for batch update (%@)", self->_entity), 0 reason userInfo]);
    uint64_t v8 = (id *)(v7 + 56);
  }
  else
  {
    uint64_t v9 = [v6 managedObjectModel];
    if (!v9) {
      goto LABEL_12;
    }
    uint64_t v8 = (id *)(v9 + 32);
  }
  v10 = (void *)[*v8 objectForKey:self->_entity];
  if (!v10) {
    goto LABEL_12;
  }
  v11 = v10;
  id v12 = v10;
  id entity = self->_entity;
  self->_id entity = v11;
  *(_DWORD *)&self->_flags &= ~8u;
  uint64_t v13 = self->_columnsToUpdate;
  -[NSBatchUpdateRequest _setValidatedPropertiesToUpdate:]((id *)&self->super.super.isa, v13);
}

- (id)encodeForXPC
{
  id v2 = [[NSBatchUpdateRequestEncodingToken alloc] initForRequest:self];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [v3 setDelegate:objc_opt_class()];
  [v3 encodeObject:v2 forKey:@"root"];
  [v3 finishEncoding];
  id v4 = (id)[v3 encodedData];

  return v4;
}

+ (id)decodeFromXPCArchive:(id)a3 withContext:(id)a4 withPolicy:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:a3 error:0];
  [v7 setDelegate:a4];
  uint64_t v8 = (void *)[MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  if (a5) {
    uint64_t v8 = objc_msgSend(v8, "setByAddingObjectsFromSet:", objc_msgSend(a5, "allowableClassesForClientWithContext:", a4));
  }
  uint64_t v9 = (void *)[v7 decodeObjectOfClasses:v8 forKey:@"root"];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v10 = objc_msgSend((id)objc_msgSend(v9, "columnsToUpdate", 0), "allValues");
  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    int v12 = 0;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          int v16 = [v15 constantValue] == 0;
        }
        else {
          int v16 = objc_msgSend(v15, "isEqual:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"));
        }
        v12 += v16;
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
    uint64_t v17 = v12;
  }
  else
  {
    uint64_t v17 = 0;
  }
  if ([v9 nullValueCount] != v17) {
    return 0;
  }
  uint64_t v18 = -[NSBatchUpdateRequest initWithEntityName:]([NSBatchUpdateRequest alloc], "initWithEntityName:", [v9 entityName]);
  -[NSBatchUpdateRequest setPredicate:](v18, "setPredicate:", [v9 predicate]);
  -[NSBatchUpdateRequest setPropertiesToUpdate:](v18, "setPropertiesToUpdate:", [v9 columnsToUpdate]);
  -[NSBatchUpdateRequest setResultType:](v18, "setResultType:", [v9 resultType]);
  -[NSBatchUpdateRequest setIncludesSubentities:](v18, "setIncludesSubentities:", [v9 includeSubEntities]);
  -[NSBatchUpdateRequest _setSecureOperation:](v18, "_setSecureOperation:", [v9 secure]);
  return v18;
}

+ (NSBatchUpdateRequest)batchUpdateRequestWithEntityName:(NSString *)entityName
{
  id v3 = (void *)[objc_alloc((Class)a1) initWithEntityName:entityName];

  return (NSBatchUpdateRequest *)v3;
}

- (NSBatchUpdateRequest)initWithEntityName:(NSString *)entityName
{
  id v4 = [(NSBatchUpdateRequest *)self init];
  if (v4)
  {
    v4->_id entity = entityName;
    *(_DWORD *)&v4->_flags |= 8u;
  }
  return v4;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<NSBatchUpdateRequest : id entity = %@, properties = %@, subentities = %d, predicate = %@", -[NSBatchUpdateRequest entityName](self, "entityName"), self->_columnsToUpdate, *(_DWORD *)&self->_flags & 1, self->_predicate];
}

- (NSString)entityName
{
  result = (NSString *)self->_entity;
  if ((*(unsigned char *)&self->_flags & 8) == 0) {
    return (NSString *)[(NSString *)result name];
  }
  return result;
}

- (void)setIncludesSubentities:(BOOL)includesSubentities
{
  self->_flags = (_requestFlags)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | includesSubentities);
}

- (void)setResultType:(NSBatchUpdateRequestResultType)resultType
{
  self->_flags = (_requestFlags)(*(_DWORD *)&self->_flags & 0xFFFFFFF9 | (2 * (resultType & 3)));
}

- (void)_setSecureOperation:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_flags = (_requestFlags)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v3);
}

@end