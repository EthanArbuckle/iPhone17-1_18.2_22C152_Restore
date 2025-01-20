@interface ABSPersonFetchRequest
+ (BOOL)supportsSecureCoding;
- (ABSPersonFetchRequest)initWithCoder:(id)a3;
- (ABSPersonFetchRequest)initWithPredicate:(id)a3 additionalKeysToFetch:(id)a4 sortOrder:(unsigned int)a5;
- (BOOL)isEqual:(id)a3;
- (NSArray)additionalKeysToFetch;
- (NSPredicate)predicate;
- (id)description;
- (id)descriptionOfKeysToFetch;
- (id)descriptionOfSortOrder;
- (unint64_t)hash;
- (unsigned)sortOrder;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ABSPersonFetchRequest

- (ABSPersonFetchRequest)initWithPredicate:(id)a3 additionalKeysToFetch:(id)a4 sortOrder:(unsigned int)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8) {
    goto LABEL_5;
  }
  if (CNGuardOSLog_cn_once_token_0 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0, &__block_literal_global_9);
  }
  v10 = CNGuardOSLog_cn_once_object_0;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0, OS_LOG_TYPE_FAULT))
  {
    -[ABSPersonFetchRequest initWithPredicate:additionalKeysToFetch:sortOrder:](v10);
    if (v9) {
      goto LABEL_10;
    }
  }
  else
  {
LABEL_5:
    if (v9) {
      goto LABEL_10;
    }
  }
  if (CNGuardOSLog_cn_once_token_0 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0, &__block_literal_global_9);
  }
  v11 = CNGuardOSLog_cn_once_object_0;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0, OS_LOG_TYPE_FAULT)) {
    -[ABSPersonFetchRequest initWithPredicate:additionalKeysToFetch:sortOrder:](v11);
  }
LABEL_10:
  v19.receiver = self;
  v19.super_class = (Class)ABSPersonFetchRequest;
  v12 = [(ABSPersonFetchRequest *)&v19 init];
  if (v12)
  {
    uint64_t v13 = [v8 copy];
    predicate = v12->_predicate;
    v12->_predicate = (NSPredicate *)v13;

    uint64_t v15 = [v9 copy];
    additionalKeysToFetch = v12->_additionalKeysToFetch;
    v12->_additionalKeysToFetch = (NSArray *)v15;

    v12->_sortOrder = a5;
    v17 = v12;
  }

  return v12;
}

- (id)description
{
  v3 = [MEMORY[0x263F335A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"predicate" object:self->_predicate];
  v5 = [(ABSPersonFetchRequest *)self descriptionOfSortOrder];
  id v6 = (id)[v3 appendName:@"sortOrder" object:v5];

  v7 = [(ABSPersonFetchRequest *)self descriptionOfKeysToFetch];
  id v8 = (id)[v3 appendName:@"additionalKeysToFetch" object:v7];

  id v9 = [v3 build];

  return v9;
}

- (id)descriptionOfSortOrder
{
  uint64_t sortOrder = self->_sortOrder;
  if (sortOrder)
  {
    if (sortOrder == 1)
    {
      v3 = @"by family name";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"unknown (%d)", sortOrder);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v3 = @"by given name";
  }

  return v3;
}

- (id)descriptionOfKeysToFetch
{
  return [(NSArray *)self->_additionalKeysToFetch componentsJoinedByString:@","];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ABSPersonFetchRequest *)a3;
  BOOL v7 = 1;
  if (self != v4)
  {
    if ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || self->_sortOrder != v4->_sortOrder
      || (additionalKeysToFetch = self->_additionalKeysToFetch,
          (unint64_t)additionalKeysToFetch | (unint64_t)v4->_additionalKeysToFetch)
      && !-[NSArray isEqual:](additionalKeysToFetch, "isEqual:")
      || (predicate = self->_predicate, (unint64_t)predicate | (unint64_t)v4->_predicate)
      && !-[NSPredicate isEqual:](predicate, "isEqual:"))
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [MEMORY[0x263F335E8] objectHash:self->_predicate];
  uint64_t v4 = [MEMORY[0x263F335E8] arrayHash:self->_additionalKeysToFetch];
  return self->_sortOrder - (v4 - v3 + 32 * v3) + 32 * (v4 - v3 + 32 * v3) + 506447;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ABSPersonFetchRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"predicate"];
  id v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = objc_opt_class();
  id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  id v9 = [v4 decodeObjectOfClasses:v8 forKey:@"additionalKeysToFetch"];

  uint64_t v10 = [v4 decodeInt32ForKey:@"sortOrder"];
  v11 = [(ABSPersonFetchRequest *)self initWithPredicate:v5 additionalKeysToFetch:v9 sortOrder:v10];

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  predicate = self->_predicate;
  id v5 = a3;
  [v5 encodeObject:predicate forKey:@"predicate"];
  [v5 encodeObject:self->_additionalKeysToFetch forKey:@"additionalKeysToFetch"];
  [v5 encodeInt32:self->_sortOrder forKey:@"sortOrder"];
}

- (NSPredicate)predicate
{
  return (NSPredicate *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)additionalKeysToFetch
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (unsigned)sortOrder
{
  return self->_sortOrder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalKeysToFetch, 0);

  objc_storeStrong((id *)&self->_predicate, 0);
}

- (void)initWithPredicate:(os_log_t)log additionalKeysToFetch:sortOrder:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_214A03000, log, OS_LOG_TYPE_FAULT, "parameter ‘additionalKeysToFetch’ must be nonnull", v1, 2u);
}

- (void)initWithPredicate:(os_log_t)log additionalKeysToFetch:sortOrder:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_214A03000, log, OS_LOG_TYPE_FAULT, "parameter ‘predicate’ must be nonnull", v1, 2u);
}

@end