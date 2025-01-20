@interface _NSPersistentHistoryToken
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (_NSPersistentHistoryToken)initWithCoder:(id)a3;
- (_NSPersistentHistoryToken)initWithDictionary:(id)a3;
- (_NSPersistentHistoryToken)initWithTransactionNumber:(id)a3 andStoreID:(id)a4;
- (id)description;
- (id)storeTokens;
- (int64_t)compare:(id)a3;
- (int64_t)compareToken:(id)a3 error:(id *)a4;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _NSPersistentHistoryToken

- (id)storeTokens
{
  return self->_storeTokens;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (void)dealloc
{
  self->_storeTokens = 0;
  v3.receiver = self;
  v3.super_class = (Class)_NSPersistentHistoryToken;
  [(_NSPersistentHistoryToken *)&v3 dealloc];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<NSPersistentHistoryToken - %@>", self->_storeTokens];
}

- (_NSPersistentHistoryToken)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_NSPersistentHistoryToken;
  v4 = [(_NSPersistentHistoryToken *)&v10 init];
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    v8 = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0), @"NSPersistentHistoryTokenDictionary");
    v4->_storeTokens = v8;
    if (![(NSDictionary *)v8 count])
    {

      return 0;
    }
  }
  return v4;
}

- (_NSPersistentHistoryToken)initWithTransactionNumber:(id)a3 andStoreID:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_NSPersistentHistoryToken;
  uint64_t v6 = [(_NSPersistentHistoryToken *)&v9 init];
  uint64_t v7 = v6;
  if (v6)
  {
    if (a3 && a4)
    {
      v6->_storeTokens = (NSDictionary *)(id)[MEMORY[0x1E4F1C9E8] dictionaryWithObject:a3 forKey:a4];
    }
    else
    {

      return 0;
    }
  }
  return v7;
}

- (_NSPersistentHistoryToken)initWithDictionary:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_NSPersistentHistoryToken;
  v4 = [(_NSPersistentHistoryToken *)&v6 init];
  if (v4)
  {
    if ([a3 count])
    {
      v4->_storeTokens = (NSDictionary *)a3;
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  storeTokens = self->_storeTokens;
  uint64_t v6 = [a3 storeTokens];

  return [(NSDictionary *)storeTokens isEqual:v6];
}

- (int64_t)compare:(id)a3
{
  objc_super v3 = NSString;
  v4 = NSStringFromSelector(a2);
  v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  uint64_t v7 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8], objc_msgSend(v3, "stringWithFormat:", @"%@ is not supported for %@, use %@", v4, v6, NSStringFromSelector(sel_compareToken_error_)), 0 reason userInfo];
  objc_exception_throw(v7);
}

- (int64_t)compareToken:(id)a3 error:(id *)a4
{
  v51[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_msgSend((id)objc_msgSend(-[_NSPersistentHistoryToken storeTokens](self, "storeTokens"), "allKeys"), "sortedArrayUsingComparator:", &__block_literal_global_17);
  v8 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "storeTokens"), "allKeys"), "sortedArrayUsingComparator:", &__block_literal_global_13);
  uint64_t v9 = [v7 count];
  if (v9 != [v8 count])
  {
    v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F281F8];
    uint64_t v50 = *MEMORY[0x1E4F28588];
    v51[0] = [NSString stringWithFormat:@"Tokens have different number of stores."];
    v20 = objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, 134501, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v51, &v50, 1));
    if (v20) {
      goto LABEL_17;
    }
    uint64_t v21 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v21, v22, v23, v24, v25, v26, v27, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentHistoryToken.m");
    v28 = __pflogFaultLog;
    if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
      return 0;
    }
    *(_DWORD *)buf = 136315394;
    v47 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentHistoryToken.m";
    __int16 v48 = 1024;
    int v49 = 89;
    goto LABEL_27;
  }
  if (([v7 isEqualToArray:v8] & 1) == 0)
  {
    v29 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v30 = *MEMORY[0x1E4F281F8];
    uint64_t v44 = *MEMORY[0x1E4F28588];
    uint64_t v45 = [NSString stringWithFormat:@"Tokens have different set of stores."];
    v20 = objc_msgSend(v29, "errorWithDomain:code:userInfo:", v30, 134501, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1));
    if (v20)
    {
LABEL_17:
      if (a4)
      {
        int64_t v13 = 0;
        *a4 = v20;
        return v13;
      }
      return 0;
    }
    uint64_t v31 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v31, v32, v33, v34, v35, v36, v37, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentHistoryToken.m");
    v28 = __pflogFaultLog;
    if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
      return 0;
    }
    *(_DWORD *)buf = 136315394;
    v47 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentHistoryToken.m";
    __int16 v48 = 1024;
    int v49 = 96;
LABEL_27:
    _os_log_fault_impl(&dword_18AB82000, v28, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    return 0;
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v10 = [v7 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (!v10) {
    return 3;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v40;
  int64_t v13 = 3;
  while (2)
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v40 != v12) {
        objc_enumerationMutation(v7);
      }
      uint64_t v15 = *(void *)(*((void *)&v39 + 1) + 8 * i);
      uint64_t v16 = objc_msgSend((id)objc_msgSend(a3, "storeTokens"), "objectForKey:", v15);
      if (v16)
      {
        uint64_t v17 = objc_msgSend(-[NSDictionary objectForKey:](self->_storeTokens, "objectForKey:", v15), "compare:", v16);
        if (v17)
        {
          if (v17 == 1) {
            return 4;
          }
          else {
            return 2;
          }
        }
      }
    }
    uint64_t v11 = [v7 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v11) {
      continue;
    }
    break;
  }
  return v13;
}

- (unint64_t)hash
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  if ([(NSDictionary *)self->_storeTokens count])
  {
    storeTokens = self->_storeTokens;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __33___NSPersistentHistoryToken_hash__block_invoke;
    v6[3] = &unk_1E544DE20;
    v6[4] = &v8;
    [(NSDictionary *)storeTokens enumerateKeysAndObjectsUsingBlock:v6];
    id v4 = (id)v9[3];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_NSPersistentHistoryToken;
    id v4 = [(_NSPersistentHistoryToken *)&v7 hash];
    v9[3] = (uint64_t)v4;
  }
  _Block_object_dispose(&v8, 8);
  return (unint64_t)v4;
}

@end