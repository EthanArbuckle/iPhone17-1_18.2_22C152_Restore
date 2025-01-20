@interface NSCloudKitMirroringFetchRecordsRequest
- (BOOL)validateForUseWithStore:(id)a3 error:(id *)a4;
- (NSArray)objectIDsToFetch;
- (NSCloudKitMirroringFetchRecordsRequest)initWithOptions:(id)a3 completionBlock:(id)a4;
- (NSDictionary)entityNameToAttributesToFetch;
- (uint64_t)throwNotEditable:(uint64_t)result;
- (void)dealloc;
- (void)setEntityNameToAttributeNamesToFetch:(id)a3;
- (void)setEntityNameToAttributesToFetch:(id)a3;
- (void)setObjectIDsToFetch:(id)a3;
@end

@implementation NSCloudKitMirroringFetchRecordsRequest

- (NSCloudKitMirroringFetchRecordsRequest)initWithOptions:(id)a3 completionBlock:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)NSCloudKitMirroringFetchRecordsRequest;
  v4 = [(NSCloudKitMirroringRequest *)&v6 initWithOptions:a3 completionBlock:a4];
  if (v4)
  {
    v4->_objectIDsToFetch = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    v4->_entityNameToAttributeNamesToFetch = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1C9E8]);
    v4->_entityNameToAttributesToFetch = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1C9E8]);
    v4->_editable = 1;
    v4->_perOperationObjectThreshold = 400;
  }
  return v4;
}

- (void)dealloc
{
  self->_entityNameToAttributesToFetch = 0;
  self->_entityNameToAttributeNamesToFetch = 0;

  self->_objectIDsToFetch = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSCloudKitMirroringFetchRecordsRequest;
  [(NSCloudKitMirroringRequest *)&v3 dealloc];
}

- (NSDictionary)entityNameToAttributesToFetch
{
  return self->_entityNameToAttributesToFetch;
}

- (void)setEntityNameToAttributesToFetch:(id)a3
{
  if (self->_editable)
  {
    entityNameToAttributesToFetch = self->_entityNameToAttributesToFetch;
    if (entityNameToAttributesToFetch != a3)
    {

      self->_entityNameToAttributesToFetch = (NSDictionary *)[a3 copy];
      if ([(NSDictionary *)self->_entityNameToAttributeNamesToFetch count])
      {

        self->_entityNameToAttributeNamesToFetch = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1C9E8]);
      }
    }
  }
  else
  {
    -[NSCloudKitMirroringFetchRecordsRequest throwNotEditable:]((uint64_t)self, a2);
  }
}

- (uint64_t)throwNotEditable:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    objc_super v3 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v4 = *MEMORY[0x1E4F1C3B8];
    v5 = NSString;
    objc_super v6 = NSStringFromSelector(aSelector);
    v7 = (void *)[v3 exceptionWithName:v4, objc_msgSend(v5, "stringWithFormat:", @"%@ called after the request was sent to %@\nRequest: %@", v6, NSStringFromSelector(sel_executeRequest_error_), v2), 0 reason userInfo];
    objc_exception_throw(v7);
  }
  return result;
}

- (void)setEntityNameToAttributeNamesToFetch:(id)a3
{
  if (self->_editable)
  {
    entityNameToAttributeNamesToFetch = self->_entityNameToAttributeNamesToFetch;
    if (entityNameToAttributeNamesToFetch != a3)
    {

      self->_entityNameToAttributeNamesToFetch = (NSDictionary *)[a3 copy];
      if ([(NSDictionary *)self->_entityNameToAttributesToFetch count])
      {

        self->_entityNameToAttributesToFetch = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1C9E8]);
      }
    }
  }
  else
  {
    -[NSCloudKitMirroringFetchRecordsRequest throwNotEditable:]((uint64_t)self, a2);
  }
}

- (void)setObjectIDsToFetch:(id)a3
{
  if (self->_editable)
  {
    objectIDsToFetch = self->_objectIDsToFetch;
    if (objectIDsToFetch != a3)
    {

      self->_objectIDsToFetch = (NSArray *)[a3 copy];
    }
  }
  else
  {
    -[NSCloudKitMirroringFetchRecordsRequest throwNotEditable:]((uint64_t)self, a2);
  }
}

- (BOOL)validateForUseWithStore:(id)a3 error:(id *)a4
{
  v35[1] = *MEMORY[0x1E4F143B8];
  v29 = 0;
  v28.receiver = self;
  v28.super_class = (Class)NSCloudKitMirroringFetchRecordsRequest;
  if (![(NSCloudKitMirroringRequest *)&v28 validateForUseWithStore:a3 error:&v29]) {
    goto LABEL_10;
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v9 = objc_msgSend((id)objc_msgSend(a3, "persistentStoreCoordinator"), "managedObjectModel");
  if ([(NSDictionary *)self->_entityNameToAttributesToFetch count])
  {
    entityNameToAttributesToFetch = self->_entityNameToAttributesToFetch;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __72__NSCloudKitMirroringFetchRecordsRequest_validateForUseWithStore_error___block_invoke;
    v27[3] = &unk_1E544D6B8;
    v27[4] = v9;
    v27[5] = v8;
    v27[6] = v7;
    v11 = v27;
LABEL_6:
    [(NSDictionary *)entityNameToAttributesToFetch enumerateKeysAndObjectsUsingBlock:v11];
    goto LABEL_7;
  }
  if ([(NSDictionary *)self->_entityNameToAttributeNamesToFetch count])
  {
    entityNameToAttributesToFetch = self->_entityNameToAttributeNamesToFetch;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __72__NSCloudKitMirroringFetchRecordsRequest_validateForUseWithStore_error___block_invoke_3;
    v26[3] = &unk_1E544D6B8;
    v26[4] = v9;
    v26[5] = v8;
    v26[6] = v7;
    v11 = v26;
    goto LABEL_6;
  }
LABEL_7:
  if ([v7 count])
  {
    [v7 sortUsingSelector:sel_compare_];
    id v12 = objc_alloc(MEMORY[0x1E4F28E78]);
    v13 = (objc_class *)objc_opt_class();
    v14 = (void *)[v12 initWithFormat:@"Invalid '%@'. The following validation failures occured:", NSStringFromClass(v13)];
    [v14 appendFormat:@"\n%@", objc_msgSend(v7, "componentsJoinedByString:", @"\n"];
    uint64_t v15 = *MEMORY[0x1E4F281F8];
    uint64_t v34 = *MEMORY[0x1E4F28588];
    v35[0] = v14;
    v29 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", v15, 134070, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1));
  }
  else if (v8)
  {

    self->_entityNameToAttributesToFetch = (NSDictionary *)[v8 copy];
    self->_editable = 0;
    LOBYTE(v16) = 1;
    return v16;
  }

LABEL_10:
  if (!v29)
  {
    uint64_t v17 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v17, v18, v19, v20, v21, v22, v23, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSCloudKitMirroringFetchRecordsRequest.m");
    v24 = __pflogFaultLog;
    BOOL v16 = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
    if (!v16) {
      return v16;
    }
    *(_DWORD *)buf = 136315394;
    v31 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSCloudKitMirroringFetchRecordsRequest.m";
    __int16 v32 = 1024;
    int v33 = 195;
    _os_log_fault_impl(&dword_18AB82000, v24, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
LABEL_15:
    LOBYTE(v16) = 0;
    return v16;
  }
  if (!a4) {
    goto LABEL_15;
  }
  LOBYTE(v16) = 0;
  *a4 = v29;
  return v16;
}

void __72__NSCloudKitMirroringFetchRecordsRequest_validateForUseWithStore_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "entitiesByName"), "objectForKey:", a2);
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = (id)[*(id *)(a1 + 40) objectForKey:a2];
    if (!v8)
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [*(id *)(a1 + 40) setObject:v8 forKey:a2];
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __72__NSCloudKitMirroringFetchRecordsRequest_validateForUseWithStore_error___block_invoke_2;
    v11[3] = &unk_1E544D690;
    v11[4] = v7;
    v11[5] = v8;
    v11[6] = *(void *)(a1 + 48);
    v11[7] = a2;
    [a3 enumerateObjectsUsingBlock:v11];
  }
  else
  {
    uint64_t v9 = *(void **)(a1 + 48);
    uint64_t v10 = [NSString stringWithFormat:@"%@ - entity not found in model", a2];
    [v9 addObject:v10];
  }
}

uint64_t __72__NSCloudKitMirroringFetchRecordsRequest_validateForUseWithStore_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "attributesByName"), "objectForKey:", objc_msgSend(a2, "name"));
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void **)(a1 + 40);
  }
  else
  {
    uint64_t v7 = *(void **)(a1 + 48);
    uint64_t v5 = [NSString stringWithFormat:@"%@.%@ - attribute not found on entity", *(void *)(a1 + 56), objc_msgSend(a2, "name")];
    uint64_t v6 = v7;
  }

  return [v6 addObject:v5];
}

void __72__NSCloudKitMirroringFetchRecordsRequest_validateForUseWithStore_error___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "entitiesByName"), "objectForKey:", a2);
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = (id)[*(id *)(a1 + 40) objectForKey:a2];
    if (!v8)
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [*(id *)(a1 + 40) setObject:v8 forKey:a2];
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __72__NSCloudKitMirroringFetchRecordsRequest_validateForUseWithStore_error___block_invoke_4;
    v11[3] = &unk_1E544D6E0;
    v11[4] = v7;
    v11[5] = v8;
    v11[6] = *(void *)(a1 + 48);
    v11[7] = a2;
    [a3 enumerateObjectsUsingBlock:v11];
  }
  else
  {
    uint64_t v9 = *(void **)(a1 + 48);
    uint64_t v10 = [NSString stringWithFormat:@"%@ - entity not found in model", a2];
    [v9 addObject:v10];
  }
}

uint64_t __72__NSCloudKitMirroringFetchRecordsRequest_validateForUseWithStore_error___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "attributesByName"), "objectForKey:", a2);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void **)(a1 + 40);
  }
  else
  {
    uint64_t v7 = *(void **)(a1 + 48);
    uint64_t v5 = [NSString stringWithFormat:@"%@.%@ - attribute not found on entity", *(void *)(a1 + 56), a2];
    uint64_t v6 = v7;
  }

  return [v6 addObject:v5];
}

- (NSArray)objectIDsToFetch
{
  return self->_objectIDsToFetch;
}

@end