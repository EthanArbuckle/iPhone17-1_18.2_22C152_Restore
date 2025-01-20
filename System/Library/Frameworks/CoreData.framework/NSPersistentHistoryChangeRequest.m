@interface NSPersistentHistoryChangeRequest
+ (NSPersistentHistoryChangeRequest)deleteHistoryBeforeDate:(NSDate *)date;
+ (NSPersistentHistoryChangeRequest)deleteHistoryBeforeToken:(NSPersistentHistoryToken *)token;
+ (NSPersistentHistoryChangeRequest)deleteHistoryBeforeTransaction:(NSPersistentHistoryTransaction *)transaction;
+ (NSPersistentHistoryChangeRequest)fetchHistoryAfterDate:(NSDate *)date;
+ (NSPersistentHistoryChangeRequest)fetchHistoryAfterToken:(NSPersistentHistoryToken *)token;
+ (NSPersistentHistoryChangeRequest)fetchHistoryAfterTransaction:(NSPersistentHistoryTransaction *)transaction;
+ (NSPersistentHistoryChangeRequest)fetchHistoryWithFetchRequest:(NSFetchRequest *)fetchRequest;
+ (id)_stringForHistoryRequestResultType:(int64_t)a3;
+ (id)decodeFromXPCArchive:(id)a3 withContext:(id)a4 withPolicy:(id)a5;
+ (id)deleteHistoryBeforeDate:(id)a3 whenHistoryPercentageOfStoreIsGreaterThan:(unint64_t)a4;
+ (id)deleteHistoryBeforeToken:(id)a3 whenHistoryPercentageOfStoreIsGreaterThan:(unint64_t)a4;
+ (id)deleteRequest;
+ (id)fetchHistoryTransactionForToken:(id)a3;
- (BOOL)includesSubentities;
- (BOOL)isDelete;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFetchTransactionForToken;
- (BOOL)isPercentageDelete;
- (BOOL)useQueryGenerationToken;
- (NSFetchRequest)fetchRequest;
- (NSFetchRequest)fetchRequestDescribingChangeRequestForStore:(void *)a1;
- (NSFetchRequest)fetchRequestDescribingTokenCheckForStore:(NSFetchRequest *)a1;
- (NSPersistentHistoryChangeRequest)init;
- (NSPersistentHistoryChangeRequest)initWithDate:(id)a3;
- (NSPersistentHistoryChangeRequest)initWithDate:(id)a3 delete:(BOOL)a4;
- (NSPersistentHistoryChangeRequest)initWithDate:(id)a3 delete:(BOOL)a4 percentageOfDB:(unint64_t)a5;
- (NSPersistentHistoryChangeRequest)initWithFetchRequest:(id)a3;
- (NSPersistentHistoryChangeRequest)initWithToken:(id)a3;
- (NSPersistentHistoryChangeRequest)initWithToken:(id)a3 delete:(BOOL)a4;
- (NSPersistentHistoryChangeRequest)initWithToken:(id)a3 delete:(BOOL)a4 percentageOfDB:(unint64_t)a5;
- (NSPersistentHistoryChangeRequest)initWithTransactionID:(id)a3 delete:(BOOL)a4 transactionOnly:(BOOL)a5 percentageOfDB:(unint64_t)a6;
- (NSPersistentHistoryChangeRequest)initWithTransactionIDs:(id)a3;
- (NSPersistentHistoryChangeRequest)initWithTransactionToken:(id)a3;
- (NSPersistentHistoryResultType)resultType;
- (NSPersistentHistoryToken)token;
- (id)copyWithZone:(_NSZone *)a3;
- (id)date;
- (id)debugDescription;
- (id)description;
- (id)encodeForXPC;
- (id)entityNameToFetch;
- (id)predicate;
- (id)predicateForStoreIdentifier:(id)a3;
- (id)propertiesToFetch;
- (id)propertiesToFetchForEntity:(id)a3;
- (id)propertiesToFetchForEntity:(id)a3 includeTransactionStrings:(BOOL)a4;
- (id)transactionIDs;
- (id)transactionNumber;
- (unint64_t)fetchBatchSize;
- (unint64_t)fetchLimit;
- (unint64_t)fetchOffset;
- (unint64_t)percentageOfDB;
- (unint64_t)requestType;
- (void)_predicateForStoreID:(void *)result;
- (void)dealloc;
- (void)setFetchBatchSize:(unint64_t)a3;
- (void)setFetchLimit:(unint64_t)a3;
- (void)setFetchOffset:(unint64_t)a3;
- (void)setFetchRequest:(NSFetchRequest *)fetchRequest;
- (void)setResultType:(NSPersistentHistoryResultType)resultType;
- (void)setUseQueryGenerationToken:(BOOL)a3;
@end

@implementation NSPersistentHistoryChangeRequest

- (NSPersistentHistoryToken)token
{
  return (NSPersistentHistoryToken *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFetchRequest:(NSFetchRequest *)fetchRequest
{
  *((void *)self->_additionalPrivateIvars + 3) = fetchRequest;
}

- (unint64_t)percentageOfDB
{
  return self->_percentageOfDB;
}

- (unint64_t)requestType
{
  return 8;
}

- (id)propertiesToFetchForEntity:(id)a3 includeTransactionStrings:(BOOL)a4
{
  BOOL v4 = a4;
  v36[3] = *MEMORY[0x1E4F143B8];
  if ([(NSPersistentHistoryChangeRequest *)self resultType] != NSPersistentHistoryResultTypeObjectIDs
    || (__CFString *)[a3 name] != @"CHANGE")
  {
    v7 = objc_alloc_init(NSExpressionDescription);
    [(NSPropertyDescription *)v7 setName:@"self"];
    -[NSExpressionDescription setExpression:](v7, "setExpression:", [MEMORY[0x1E4F28C68] expressionForEvaluatedObject]);
    [(NSExpressionDescription *)v7 setExpressionResultType:2000];
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v7, 0);

    if (!objc_msgSend((id)objc_msgSend(a3, "name"), "isEqualToString:", @"TRANSACTION")
      || [(NSPersistentHistoryChangeRequest *)self resultType] != NSPersistentHistoryResultTypeObjectIDs
      && [(NSPersistentHistoryChangeRequest *)self resultType] != NSPersistentHistoryResultTypeChangesOnly)
    {
      if (objc_msgSend((id)objc_msgSend(a3, "name"), "isEqualToString:", @"TRANSACTION") && v4)
      {
        v35[0] = @"AUTHORTS";
        v35[1] = @"BUNDLEIDTS";
        v35[2] = @"CONTEXTNAMETS";
        v35[3] = @"PROCESSIDTS";
        v9 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:4];
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v30;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v30 != v12) {
                objc_enumerationMutation(v9);
              }
              if (a3)
              {
                uint64_t v14 = *(void *)(*((void *)&v29 + 1) + 8 * i);
                if (objc_msgSend((id)objc_msgSend(a3, "propertiesByName"), "objectForKey:", v14))
                {
                  uint64_t v15 = [MEMORY[0x1E4F28C68] expressionForKeyPath:objc_msgSend(NSString, "stringWithFormat:", @"%@.%@", v14, @"NAME"];
                  v16 = objc_alloc_init(NSExpressionDescription);
                  [(NSPropertyDescription *)v16 setName:v14];
                  [(NSExpressionDescription *)v16 setExpression:v15];
                  [(NSExpressionDescription *)v16 setExpressionResultType:700];
                  [v8 addObject:v16];
                }
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
          }
          while (v11);
        }
        goto LABEL_21;
      }
      if (!objc_msgSend((id)objc_msgSend(a3, "name"), "isEqualToString:", @"CHANGE")
        || (uint64_t v17 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"TRANSACTIONID"],
            v18 = objc_alloc_init(NSExpressionDescription),
            [(NSPropertyDescription *)v18 setName:@"TRANSACTIONID"],
            [(NSExpressionDescription *)v18 setExpression:v17],
            [(NSExpressionDescription *)v18 setExpressionResultType:2000],
            [v8 addObject:v18],
            v18,
            [(NSPersistentHistoryChangeRequest *)self resultType] != NSPersistentHistoryResultTypeTransactionsOnly))
      {
LABEL_21:
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        v19 = (void *)[a3 attributeKeys];
        uint64_t v20 = [v19 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v26;
          do
          {
            for (uint64_t j = 0; j != v21; ++j)
            {
              if (*(void *)v26 != v22) {
                objc_enumerationMutation(v19);
              }
              [v8 addObject:*(void *)(*((void *)&v25 + 1) + 8 * j)];
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v25 objects:v33 count:16];
          }
          while (v21);
        }
      }
    }
    return v8;
  }
  v36[0] = @"CHANGETYPE";
  v36[1] = @"ENTITY";
  v36[2] = @"ENTITYPK";
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:3];
}

- (NSPersistentHistoryResultType)resultType
{
  return self->_resultType;
}

- (id)transactionNumber
{
  return self->_transactionNumber;
}

- (BOOL)isPercentageDelete
{
  return (*(unsigned char *)&self->_persistentHistoryChangeRequestDescriptionFlags >> 3) & 1;
}

- (unint64_t)fetchBatchSize
{
  unint64_t result = *((void *)self->_additionalPrivateIvars + 2);
  if (result) {
    return [(id)result unsignedIntegerValue];
  }
  return result;
}

- (id)entityNameToFetch
{
  if ([(NSPersistentHistoryChangeRequest *)self fetchRequest])
  {
    v3 = @"TRANSACTION";
    if (![(NSString *)[(NSFetchRequest *)[(NSPersistentHistoryChangeRequest *)self fetchRequest] entityName] isEqualToString:@"TRANSACTION"]&& ![(NSString *)[(NSFetchRequest *)[(NSPersistentHistoryChangeRequest *)self fetchRequest] entityName] isEqualToString:@"Transaction"])
    {
      v3 = @"CHANGE";
      if (![(NSString *)[(NSFetchRequest *)[(NSPersistentHistoryChangeRequest *)self fetchRequest] entityName] isEqualToString:@"CHANGE"]&& ![(NSString *)[(NSFetchRequest *)[(NSPersistentHistoryChangeRequest *)self fetchRequest] entityName] isEqualToString:@"Change"])
      {
        return 0;
      }
    }
  }
  else
  {
    unint64_t v4 = self->_resultType - 1;
    if (v4 > 5) {
      v5 = PFPersistentHistoryTransaction;
    }
    else {
      v5 = off_1E544B5C8[v4];
    }
    return *v5;
  }
  return v3;
}

- (NSFetchRequest)fetchRequest
{
  return (NSFetchRequest *)*((void *)self->_additionalPrivateIvars + 3);
}

- (unint64_t)fetchLimit
{
  unint64_t result = *((void *)self->_additionalPrivateIvars + 1);
  if (result) {
    return [(id)result unsignedIntegerValue];
  }
  return result;
}

- (id)predicateForStoreIdentifier:(id)a3
{
  if ([(NSPersistentHistoryChangeRequest *)self fetchRequest])
  {
    v5 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
    v6 = [(NSFetchRequest *)[(NSPersistentHistoryChangeRequest *)self fetchRequest] predicate];
    if (v6)
    {
      v7 = v6;
      v8 = [[_NSPersistentHistoryPredicateRemapper alloc] initWithStoreIdentifier:a3];
      id v9 = [(_NSPersistentHistoryPredicateRemapper *)v8 createPredicateForFetchFromPredicate:v7];
      id v10 = v9;
    }
    else
    {
      id v9 = (id)[MEMORY[0x1E4F28F60] predicateWithValue:1];
    }
    [v5 addObject:v9];
    if (self->_token
      || [(NSPersistentHistoryChangeRequest *)self date]
      || self->_transactionNumber
      || [(NSArray *)self->_transactionIDs count])
    {
      id v12 = [(NSPersistentHistoryChangeRequest *)self predicate];
      if (v12) {
        [v5 addObject:v12];
      }
    }
    v13 = (void *)MEMORY[0x1E4F28BA0];
    return (id)[v13 andPredicateWithSubpredicates:v5];
  }
  else
  {
    return -[NSPersistentHistoryChangeRequest _predicateForStoreID:](self, (uint64_t)a3);
  }
}

- (id)predicate
{
  return -[NSPersistentHistoryChangeRequest _predicateForStoreID:](self, 0);
}

- (unint64_t)fetchOffset
{
  unint64_t result = *((void *)self->_additionalPrivateIvars + 4);
  if (result) {
    return [(id)result unsignedIntegerValue];
  }
  return result;
}

- (void)_predicateForStoreID:(void *)result
{
  if (!result) {
    return result;
  }
  v3 = result;
  unint64_t v4 = (void *)[result date];
  unint64_t v5 = *((void *)v3 + 3);
  BOOL v6 = v5 > 6;
  uint64_t v7 = (1 << v5) & 0x52;
  if (!v6 && v7 != 0)
  {
    if ([*((id *)v3 + 4) count]) {
      return (void *)[MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY TRANSACTIONID IN %@", *((void *)v3 + 4)];
    }
    if (*((void *)v3 + 5))
    {
      id v9 = NSString;
      if ([v3 isFetchTransactionForToken])
      {
        id v10 = @"=";
      }
      else if ([v3 isDelete])
      {
        id v10 = @"<";
      }
      else
      {
        id v10 = @">";
      }
      v37 = v10;
      uint64_t v38 = [*((id *)v3 + 5) longLongValue];
      v36 = @"TRANSACTIONID";
      v18 = @"ANY %@ %@ %lld";
LABEL_41:
      uint64_t v22 = v9;
LABEL_68:
      uint64_t v23 = objc_msgSend(v22, "stringWithFormat:", v18, v36, v37, v38, v39);
      goto LABEL_69;
    }
    v13 = (void *)*((void *)v3 + 2);
    if (v13)
    {
      uint64_t v14 = objc_msgSend((id)objc_msgSend(v13, "storeTokens"), "valueForKey:", a2);
      if (!v14)
      {
        uint64_t v23 = 0;
LABEL_69:
        v34 = (void *)MEMORY[0x1E4F28F60];
        return (void *)[v34 predicateWithFormat:v23];
      }
      uint64_t v15 = v14;
      v16 = NSString;
      if ([v3 isFetchTransactionForToken])
      {
        uint64_t v17 = @"=";
      }
      else
      {
        int v25 = [v3 isDelete];
        uint64_t v17 = @">";
        if (v25) {
          uint64_t v17 = @"<";
        }
      }
      v37 = v17;
      uint64_t v38 = v15;
      v36 = @"TRANSACTIONID";
      v18 = @"ANY %@ %@ %@";
    }
    else
    {
      v16 = NSString;
      if ([v3 isDelete]) {
        uint64_t v20 = @"<";
      }
      else {
        uint64_t v20 = @">";
      }
      if (v4) {
        [v4 timeIntervalSinceReferenceDate];
      }
      else {
        uint64_t v21 = 0;
      }
      uint64_t v39 = v21;
      v37 = @"TIMESTAMP";
      uint64_t v38 = (uint64_t)v20;
      v36 = @"TRANSACTIONID";
      v18 = @"ANY %@.%@ %@ %f";
    }
LABEL_67:
    uint64_t v22 = v16;
    goto LABEL_68;
  }
  if (*((void *)v3 + 5))
  {
    int v11 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v3, "fetchRequest"), "entityName"), "isEqualToString:", @"Change");
    id v9 = NSString;
    if (v11)
    {
      if ([v3 isFetchTransactionForToken])
      {
        id v12 = @"=";
      }
      else if ([v3 isDelete])
      {
        id v12 = @"<";
      }
      else
      {
        id v12 = @">";
      }
      v37 = v12;
      uint64_t v38 = [*((id *)v3 + 5) longLongValue];
      v36 = @"TRANSACTIONID";
      v18 = @"%@ %@ %lld";
    }
    else
    {
      if ([v3 isFetchTransactionForToken])
      {
        v19 = @"=";
      }
      else if ([v3 isDelete])
      {
        v19 = @"<";
      }
      else
      {
        v19 = @">";
      }
      v36 = v19;
      v37 = (__CFString *)[*((id *)v3 + 5) longLongValue];
      v18 = @"_pk %@ %lld";
    }
    goto LABEL_41;
  }
  if ([*((id *)v3 + 4) count]) {
    return (void *)[MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY _pk IN %@", *((void *)v3 + 4)];
  }
  if (v4 || *((void *)v3 + 2))
  {
    if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v3, "fetchRequest"), "entityName"), "isEqualToString:", @"Change"))v24 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"%@.", @"TRANSACTIONID"); {
    else
    }
      v24 = &stru_1ED787880;
    long long v26 = (void *)*((void *)v3 + 2);
    if (v26)
    {
      uint64_t v27 = objc_msgSend((id)objc_msgSend(v26, "storeTokens"), "valueForKey:", a2);
      if (v27)
      {
        uint64_t v28 = v27;
        long long v29 = NSString;
        if ([v3 isFetchTransactionForToken])
        {
          long long v30 = @"=";
        }
        else
        {
          int v31 = [v3 isDelete];
          long long v30 = @">";
          if (v31) {
            long long v30 = @"<";
          }
        }
        uint64_t v23 = [v29 stringWithFormat:@"%@%@ %@ %@", v24, @"_pk", v30, v28];
        if (v23) {
          goto LABEL_69;
        }
      }
    }
    v16 = NSString;
    if (objc_msgSend(v3, "isDelete", v23)) {
      long long v32 = @"<";
    }
    else {
      long long v32 = @">";
    }
    if (v4) {
      [v4 timeIntervalSinceReferenceDate];
    }
    else {
      uint64_t v33 = 0;
    }
    uint64_t v39 = v33;
    v37 = @"TIMESTAMP";
    uint64_t v38 = (uint64_t)v32;
    v36 = v24;
    v18 = @"%@%@ %@ %f";
    goto LABEL_67;
  }
  v35 = (void *)MEMORY[0x1E4F28F60];

  return (void *)[v35 predicateWithValue:1];
}

- (id)date
{
  return *self->_additionalPrivateIvars;
}

- (BOOL)isFetchTransactionForToken
{
  return (*(unsigned char *)&self->_persistentHistoryChangeRequestDescriptionFlags >> 2) & 1;
}

- (void)setResultType:(NSPersistentHistoryResultType)resultType
{
  if ([(NSPersistentHistoryChangeRequest *)self isDelete]) {
    NSPersistentHistoryResultType v5 = NSPersistentHistoryResultTypeStatusOnly;
  }
  else {
    NSPersistentHistoryResultType v5 = resultType;
  }
  self->_resultType = v5;
}

- (BOOL)isDelete
{
  return (*(unsigned char *)&self->_persistentHistoryChangeRequestDescriptionFlags & 0xA) != 0;
}

- (id)propertiesToFetch
{
  return 0;
}

- (void)dealloc
{
  self->_token = 0;
  self->_transactionIDs = 0;

  self->_transactionNumber = 0;
  additionalPrivateIvars = self->_additionalPrivateIvars;
  if (additionalPrivateIvars)
  {

    PF_FREE_OBJECT_ARRAY(self->_additionalPrivateIvars);
    self->_additionalPrivateIvars = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)NSPersistentHistoryChangeRequest;
  [(NSPersistentStoreRequest *)&v4 dealloc];
}

- (void)setFetchBatchSize:(unint64_t)a3
{
  NSPersistentHistoryResultType v5 = (void *)*((void *)self->_additionalPrivateIvars + 2);
  if (v5)
  {
    if ([v5 unsignedIntegerValue] == a3) {
      return;
    }
    BOOL v6 = (void *)*((void *)self->_additionalPrivateIvars + 2);
  }
  else
  {
    BOOL v6 = 0;
  }

  *((void *)self->_additionalPrivateIvars + 2) = [objc_alloc(NSNumber) initWithUnsignedInteger:a3];
}

- (void)setFetchLimit:(unint64_t)a3
{
  NSPersistentHistoryResultType v5 = (void *)*((void *)self->_additionalPrivateIvars + 1);
  if (v5)
  {
    if ([v5 unsignedIntegerValue] == a3) {
      return;
    }
    BOOL v6 = (void *)*((void *)self->_additionalPrivateIvars + 1);
  }
  else
  {
    BOOL v6 = 0;
  }

  *((void *)self->_additionalPrivateIvars + 1) = [objc_alloc(NSNumber) initWithUnsignedInteger:a3];
}

+ (NSPersistentHistoryChangeRequest)deleteHistoryBeforeDate:(NSDate *)date
{
  v3 = (void *)[objc_alloc((Class)a1) initWithDate:date delete:1];

  return (NSPersistentHistoryChangeRequest *)v3;
}

- (NSPersistentHistoryChangeRequest)initWithDate:(id)a3 delete:(BOOL)a4 percentageOfDB:(unint64_t)a5
{
  BOOL v6 = a4;
  v8 = [(NSPersistentHistoryChangeRequest *)self init];
  if (v8)
  {
    *v8->_additionalPrivateIvars = a3;
    uint64_t v9 = 5;
    if (v6) {
      uint64_t v9 = 0;
    }
    v8->_resultType = v9;
    v8->_transactionIDs = (NSArray *)(id)NSArray_EmptyArray;
    if (a5)
    {
      *(_DWORD *)&v8->_persistentHistoryChangeRequestDescriptionFlags |= 8u;
      v8->_percentageOfDB = a5;
    }
    if (v6) {
      int v10 = 2;
    }
    else {
      int v10 = 0;
    }
    v8->_persistentHistoryChangeRequestDescriptionFlags = (__persistentHistoryChangeRequestDescriptionFlags)(*(_DWORD *)&v8->_persistentHistoryChangeRequestDescriptionFlags & 0xFFFFFFFD | v10);
  }
  return v8;
}

- (NSPersistentHistoryChangeRequest)initWithDate:(id)a3 delete:(BOOL)a4
{
  return [(NSPersistentHistoryChangeRequest *)self initWithDate:a3 delete:a4 percentageOfDB:0];
}

- (NSPersistentHistoryChangeRequest)initWithTransactionIDs:(id)a3
{
  objc_super v4 = [(NSPersistentHistoryChangeRequest *)self init];
  if (v4)
  {
    v4->_transactionIDs = (NSArray *)a3;
    v4->_resultType = 4;
  }
  return v4;
}

+ (NSPersistentHistoryChangeRequest)fetchHistoryAfterToken:(NSPersistentHistoryToken *)token
{
  v3 = (void *)[objc_alloc((Class)a1) initWithToken:token];

  return (NSPersistentHistoryChangeRequest *)v3;
}

- (NSPersistentHistoryChangeRequest)initWithToken:(id)a3 delete:(BOOL)a4 percentageOfDB:(unint64_t)a5
{
  BOOL v6 = a4;
  v8 = [(NSPersistentHistoryChangeRequest *)self init];
  if (v8)
  {
    if (a3) {
      v8->_token = (NSPersistentHistoryToken *)a3;
    }
    uint64_t v9 = 5;
    if (v6) {
      uint64_t v9 = 0;
    }
    v8->_resultType = v9;
    if (v6)
    {
      if (a5)
      {
        v8->_percentageOfDB = a5;
        int v10 = 8;
      }
      else
      {
        int v10 = 2;
      }
      *(_DWORD *)&v8->_persistentHistoryChangeRequestDescriptionFlags |= v10;
    }
  }
  return v8;
}

- (NSPersistentHistoryChangeRequest)initWithTransactionID:(id)a3 delete:(BOOL)a4 transactionOnly:(BOOL)a5 percentageOfDB:(unint64_t)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  if (a4 && a5) {
    return 0;
  }
  int v10 = [(NSPersistentHistoryChangeRequest *)self init];
  if (v10)
  {
    v10->_transactionNumber = (NSNumber *)a3;
    __persistentHistoryChangeRequestDescriptionFlags persistentHistoryChangeRequestDescriptionFlags = v10->_persistentHistoryChangeRequestDescriptionFlags;
    if (a6)
    {
      v10->___persistentHistoryChangeRequestDescriptionFlags persistentHistoryChangeRequestDescriptionFlags = (__persistentHistoryChangeRequestDescriptionFlags)(*(_DWORD *)&persistentHistoryChangeRequestDescriptionFlags | 8);
      v10->_percentageOfDB = a6;
      unsigned int v12 = v10->_persistentHistoryChangeRequestDescriptionFlags;
    }
    else
    {
      if (v8) {
        int v13 = 2;
      }
      else {
        int v13 = 0;
      }
      unsigned int v12 = *(_DWORD *)&persistentHistoryChangeRequestDescriptionFlags & 0xFFFFFFFD | v13;
    }
    if (v7) {
      int v14 = 4;
    }
    else {
      int v14 = 0;
    }
    v10->___persistentHistoryChangeRequestDescriptionFlags persistentHistoryChangeRequestDescriptionFlags = (__persistentHistoryChangeRequestDescriptionFlags)(v12 & 0xFFFFFFFB | v14);
    uint64_t v15 = 5;
    if (v8) {
      uint64_t v15 = 0;
    }
    v10->_resultType = v15;
  }
  return v10;
}

- (NSPersistentHistoryChangeRequest)init
{
  v5.receiver = self;
  v5.super_class = (Class)NSPersistentHistoryChangeRequest;
  v2 = [(NSPersistentHistoryChangeRequest *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_resultType = 5;
    v2->_additionalPrivateIvars = (id *)PF_CALLOC_OBJECT_ARRAY(5);
  }
  return v3;
}

- (NSPersistentHistoryChangeRequest)initWithToken:(id)a3 delete:(BOOL)a4
{
  return [(NSPersistentHistoryChangeRequest *)self initWithToken:a3 delete:a4 percentageOfDB:0];
}

- (NSPersistentHistoryChangeRequest)initWithToken:(id)a3
{
  return [(NSPersistentHistoryChangeRequest *)self initWithToken:a3 delete:0];
}

- (id)encodeForXPC
{
  id v2 = [[NSPersistentHistoryChangeRequestToken alloc] initForRequest:self];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [v3 setDelegate:objc_opt_class()];
  [v3 encodeObject:v2 forKey:@"root"];
  [v3 finishEncoding];
  id v4 = (id)[v3 encodedData];

  return v4;
}

+ (id)decodeFromXPCArchive:(id)a3 withContext:(id)a4 withPolicy:(id)a5
{
  BOOL v7 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:a3 error:0];
  [v7 setDelegate:a4];
  BOOL v8 = (void *)[v7 decodeObjectOfClass:objc_opt_class() forKey:@"root"];

  if ([v8 fetchData])
  {
    id v9 = +[NSFetchRequest decodeFromXPCArchive:withContext:andPolicy:](NSFetchRequest, "decodeFromXPCArchive:withContext:andPolicy:", [v8 fetchData], a4, a5);
    if ([v8 delete])
    {
      int v10 = +[NSPersistentHistoryChangeRequest deleteRequest];
      [(NSPersistentHistoryChangeRequest *)v10 setFetchRequest:v9];
    }
    else
    {
      int v10 = [[NSPersistentHistoryChangeRequest alloc] initWithFetchRequest:v9];
      int v13 = v10;
    }
  }
  else
  {
    if ([v8 date] || objc_msgSend(v8, "token"))
    {
      int v10 = 0;
    }
    else
    {
      if ([v8 delete])
      {
        if ([v8 percentageOfDB]) {
          uint64_t v17 = +[NSPersistentHistoryChangeRequest deleteHistoryBeforeToken:whenHistoryPercentageOfStoreIsGreaterThan:](NSPersistentHistoryChangeRequest, "deleteHistoryBeforeToken:whenHistoryPercentageOfStoreIsGreaterThan:", 0, [v8 percentageOfDB]);
        }
        else {
          uint64_t v17 = +[NSPersistentHistoryChangeRequest deleteHistoryBeforeToken:0];
        }
      }
      else
      {
        uint64_t v17 = +[NSPersistentHistoryChangeRequest fetchHistoryAfterToken:0];
      }
      int v10 = v17;
    }
    if ([v8 token])
    {
      int v11 = -[_NSPersistentHistoryToken initWithDictionary:]([_NSPersistentHistoryToken alloc], "initWithDictionary:", [v8 token]);
      if ([v8 delete])
      {
        if ([v8 percentageOfDB]) {
          unsigned int v12 = +[NSPersistentHistoryChangeRequest deleteHistoryBeforeToken:whenHistoryPercentageOfStoreIsGreaterThan:](NSPersistentHistoryChangeRequest, "deleteHistoryBeforeToken:whenHistoryPercentageOfStoreIsGreaterThan:", v11, [v8 percentageOfDB]);
        }
        else {
          unsigned int v12 = +[NSPersistentHistoryChangeRequest deleteHistoryBeforeToken:v11];
        }
      }
      else if ([v8 transactionFromToken])
      {
        unsigned int v12 = +[NSPersistentHistoryChangeRequest fetchHistoryTransactionForToken:v11];
      }
      else
      {
        unsigned int v12 = +[NSPersistentHistoryChangeRequest fetchHistoryAfterToken:v11];
      }
      int v10 = v12;
    }
    else if ([v8 date])
    {
      if ([v8 delete])
      {
        uint64_t v14 = [v8 percentageOfDB];
        uint64_t v15 = [v8 date];
        if (v14) {
          v16 = +[NSPersistentHistoryChangeRequest deleteHistoryBeforeDate:whenHistoryPercentageOfStoreIsGreaterThan:](NSPersistentHistoryChangeRequest, "deleteHistoryBeforeDate:whenHistoryPercentageOfStoreIsGreaterThan:", v15, [v8 percentageOfDB]);
        }
        else {
          v16 = +[NSPersistentHistoryChangeRequest deleteHistoryBeforeDate:v15];
        }
      }
      else
      {
        v16 = +[NSPersistentHistoryChangeRequest fetchHistoryAfterDate:](NSPersistentHistoryChangeRequest, "fetchHistoryAfterDate:", [v8 date]);
      }
      int v10 = v16;
    }
  }
  -[NSPersistentHistoryChangeRequest setResultType:](v10, "setResultType:", [v8 resultType]);
  if ([v8 fetchLimit])
  {
    -[NSPersistentHistoryChangeRequest setFetchLimit:](v10, "setFetchLimit:", [v8 fetchLimit]);
    if ([v8 fetchOffset]) {
      -[NSPersistentHistoryChangeRequest setFetchOffset:](v10, "setFetchOffset:", [v8 fetchOffset]);
    }
  }
  if ([v8 fetchBatchSize]) {
    -[NSPersistentHistoryChangeRequest setFetchBatchSize:](v10, "setFetchBatchSize:", [v8 fetchBatchSize]);
  }
  return v10;
}

+ (NSPersistentHistoryChangeRequest)fetchHistoryAfterDate:(NSDate *)date
{
  v3 = (void *)[objc_alloc((Class)a1) initWithDate:date];

  return (NSPersistentHistoryChangeRequest *)v3;
}

+ (NSPersistentHistoryChangeRequest)fetchHistoryAfterTransaction:(NSPersistentHistoryTransaction *)transaction
{
  v3 = objc_msgSend(objc_alloc((Class)a1), "initWithToken:", -[NSPersistentHistoryTransaction token](transaction, "token"));

  return (NSPersistentHistoryChangeRequest *)v3;
}

+ (id)fetchHistoryTransactionForToken:(id)a3
{
  if (!a3) {
    return 0;
  }
  v3 = (void *)[objc_alloc((Class)a1) initWithTransactionToken:a3];

  return v3;
}

+ (NSPersistentHistoryChangeRequest)fetchHistoryWithFetchRequest:(NSFetchRequest *)fetchRequest
{
  v3 = (void *)[objc_alloc((Class)a1) initWithFetchRequest:fetchRequest];

  return (NSPersistentHistoryChangeRequest *)v3;
}

+ (NSPersistentHistoryChangeRequest)deleteHistoryBeforeToken:(NSPersistentHistoryToken *)token
{
  v3 = (void *)[objc_alloc((Class)a1) initWithToken:token delete:1];

  return (NSPersistentHistoryChangeRequest *)v3;
}

+ (NSPersistentHistoryChangeRequest)deleteHistoryBeforeTransaction:(NSPersistentHistoryTransaction *)transaction
{
  v3 = objc_msgSend(objc_alloc((Class)a1), "initWithToken:delete:", -[NSPersistentHistoryTransaction token](transaction, "token"), 1);

  return (NSPersistentHistoryChangeRequest *)v3;
}

+ (id)deleteHistoryBeforeDate:(id)a3 whenHistoryPercentageOfStoreIsGreaterThan:(unint64_t)a4
{
  id v4 = (void *)[objc_alloc((Class)a1) initWithDate:a3 delete:1 percentageOfDB:a4];

  return v4;
}

+ (id)deleteHistoryBeforeToken:(id)a3 whenHistoryPercentageOfStoreIsGreaterThan:(unint64_t)a4
{
  id v4 = (void *)[objc_alloc((Class)a1) initWithToken:a3 delete:1 percentageOfDB:a4];

  return v4;
}

+ (id)deleteRequest
{
  id v2 = objc_alloc_init(NSPersistentHistoryChangeRequest);
  v2->_resultType = 0;
  v2->_transactionIDs = (NSArray *)(id)NSArray_EmptyArray;
  *(_DWORD *)&v2->_persistentHistoryChangeRequestDescriptionFlags |= 2u;
  return v2;
}

- (NSPersistentHistoryChangeRequest)initWithDate:(id)a3
{
  return [(NSPersistentHistoryChangeRequest *)self initWithDate:a3 delete:0];
}

- (NSPersistentHistoryChangeRequest)initWithFetchRequest:(id)a3
{
  if ((objc_msgSend((id)objc_msgSend(a3, "entityName"), "isEqualToString:", @"Change") & 1) != 0
    || (objc_msgSend((id)objc_msgSend(a3, "entityName"), "isEqualToString:", @"Transaction") & 1) != 0)
  {
    objc_super v5 = [(NSPersistentHistoryChangeRequest *)self init];
    if (v5)
    {
      *((void *)v5->_additionalPrivateIvars + 3) = a3;
      v5->_transactionIDs = (NSArray *)(id)NSArray_EmptyArray;
      if (objc_msgSend((id)objc_msgSend(a3, "entityName"), "isEqualToString:", @"Change")) {
        v5->_resultType = 4;
      }
    }
  }
  else
  {
    uint64_t v6 = objc_opt_class();
    _NSCoreDataLog(1, @"%@ only accepts a NSFetchRequest that has the entity set to a Persistent History Entity", v7, v8, v9, v10, v11, v12, v6);

    return 0;
  }
  return v5;
}

- (NSPersistentHistoryChangeRequest)initWithTransactionToken:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = [(NSPersistentHistoryChangeRequest *)self init];
  if (v4)
  {
    v4->_token = (NSPersistentHistoryToken *)a3;
    *(_DWORD *)&v4->_persistentHistoryChangeRequestDescriptionFlags |= 4u;
    v4->_resultType = 5;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NSPersistentHistoryChangeRequest;
  id v4 = [(NSPersistentStoreRequest *)&v9 copyWithZone:a3];
  if (v4)
  {
    token = self->_token;
    if (token) {
      v4[2] = token;
    }
    transactionIDs = self->_transactionIDs;
    if (transactionIDs) {
      v4[4] = [(NSArray *)transactionIDs copy];
    }
    transactionNumber = self->_transactionNumber;
    if (transactionNumber) {
      v4[5] = [(NSNumber *)transactionNumber copy];
    }
    v4[8] = self->_percentageOfDB;
    *((_DWORD *)v4 + 12) = self->_persistentHistoryChangeRequestDescriptionFlags;
    *(void *)v4[7] = [*self->_additionalPrivateIvars copy];
    *(void *)(v4[7] + 8) = [self->_additionalPrivateIvars[1] copy];
    *(void *)(v4[7] + 16) = [self->_additionalPrivateIvars[2] copy];
    *(void *)(v4[7] + 24) = [self->_additionalPrivateIvars[3] copy];
    *(void *)(v4[7] + 32) = [self->_additionalPrivateIvars[4] copy];
    v4[3] = self->_resultType;
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    goto LABEL_33;
  }
  if (!a3) {
    goto LABEL_32;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_32;
  }
  objc_super v5 = [(NSPersistentHistoryChangeRequest *)self token];
  uint64_t v6 = [a3 token];
  if (v5 != (NSPersistentHistoryToken *)v6)
  {
    uint64_t v7 = v6;
    LOBYTE(v6) = 0;
    if (!v5) {
      return v6;
    }
    if (!v7) {
      return v6;
    }
    LODWORD(v6) = -[NSPersistentHistoryToken isEqual:](v5, "isEqual:");
    if (!v6) {
      return v6;
    }
  }
  id v8 = [(NSPersistentHistoryChangeRequest *)self transactionNumber];
  uint64_t v6 = [a3 transactionNumber];
  if (v8 != (id)v6)
  {
    uint64_t v9 = v6;
    LOBYTE(v6) = 0;
    if (!v8) {
      return v6;
    }
    if (!v9) {
      return v6;
    }
    LODWORD(v6) = objc_msgSend(v8, "isEqual:");
    if (!v6) {
      return v6;
    }
  }
  id v10 = [(NSPersistentHistoryChangeRequest *)self transactionIDs];
  uint64_t v6 = [a3 transactionIDs];
  if (v10 != (id)v6)
  {
    uint64_t v11 = v6;
    LOBYTE(v6) = 0;
    if (!v10) {
      return v6;
    }
    if (!v11) {
      return v6;
    }
    LODWORD(v6) = objc_msgSend(v10, "isEqual:");
    if (!v6) {
      return v6;
    }
  }
  if (((*((_DWORD *)a3 + 12) ^ *(_DWORD *)&self->_persistentHistoryChangeRequestDescriptionFlags) & 0xF) != 0) {
    goto LABEL_32;
  }
  NSPersistentHistoryResultType v12 = [(NSPersistentHistoryChangeRequest *)self resultType];
  if (v12 != [a3 resultType]) {
    goto LABEL_32;
  }
  unint64_t v13 = [(NSPersistentHistoryChangeRequest *)self percentageOfDB];
  if (v13 != [a3 percentageOfDB]) {
    goto LABEL_32;
  }
  id v14 = [(NSPersistentHistoryChangeRequest *)self date];
  uint64_t v6 = [a3 date];
  if (v14 != (id)v6)
  {
    uint64_t v15 = v6;
    LOBYTE(v6) = 0;
    if (!v14) {
      return v6;
    }
    if (!v15) {
      return v6;
    }
    LODWORD(v6) = objc_msgSend(v14, "isEqual:");
    if (!v6) {
      return v6;
    }
  }
  unint64_t v16 = [(NSPersistentHistoryChangeRequest *)self fetchLimit];
  if (v16 != [a3 fetchLimit]
    || (unint64_t v17 = [(NSPersistentHistoryChangeRequest *)self fetchOffset],
        v17 != [a3 fetchOffset])
    || (unint64_t v18 = [(NSPersistentHistoryChangeRequest *)self fetchBatchSize],
        v18 != [a3 fetchBatchSize]))
  {
LABEL_32:
    LOBYTE(v6) = 0;
    return v6;
  }
  v19 = [(NSPersistentHistoryChangeRequest *)self fetchRequest];
  uint64_t v6 = [a3 fetchRequest];
  if (v19 == (NSFetchRequest *)v6)
  {
LABEL_33:
    LOBYTE(v6) = 1;
    return v6;
  }
  uint64_t v20 = v6;
  LOBYTE(v6) = 0;
  if (v19 && v20)
  {
    LOBYTE(v6) = -[NSFetchRequest isEqual:](v19, "isEqual:");
  }
  return v6;
}

- (id)transactionIDs
{
  return self->_transactionIDs;
}

- (id)propertiesToFetchForEntity:(id)a3
{
  return [(NSPersistentHistoryChangeRequest *)self propertiesToFetchForEntity:a3 includeTransactionStrings:1];
}

- (BOOL)useQueryGenerationToken
{
  return *(_DWORD *)&self->_persistentHistoryChangeRequestDescriptionFlags & 1;
}

- (void)setUseQueryGenerationToken:(BOOL)a3
{
  self->___persistentHistoryChangeRequestDescriptionFlags persistentHistoryChangeRequestDescriptionFlags = (__persistentHistoryChangeRequestDescriptionFlags)(*(_DWORD *)&self->_persistentHistoryChangeRequestDescriptionFlags & 0xFFFFFFFE | a3);
}

- (void)setFetchOffset:(unint64_t)a3
{
  objc_super v5 = (void *)*((void *)self->_additionalPrivateIvars + 4);
  if (v5)
  {
    if ([v5 unsignedIntegerValue] == a3) {
      return;
    }
    uint64_t v6 = (void *)*((void *)self->_additionalPrivateIvars + 4);
  }
  else
  {
    uint64_t v6 = 0;
  }

  *((void *)self->_additionalPrivateIvars + 4) = [objc_alloc(NSNumber) initWithUnsignedInteger:a3];
}

- (BOOL)includesSubentities
{
  return 0;
}

- (NSFetchRequest)fetchRequestDescribingTokenCheckForStore:(NSFetchRequest *)a1
{
  id v2 = a1;
  if (a1)
  {
    if ([(NSFetchRequest *)a1 token]
      && (id v4 = objc_msgSend((id)-[NSArray storeTokens](v2->_groupByProperties, "storeTokens"), "valueForKey:", objc_msgSend(a2, "identifier")), objc_msgSend(v4, "longLongValue") >= 1))
    {
      id v2 = -[NSFetchRequest initWithEntityName:]([NSFetchRequest alloc], "initWithEntityName:", [NSString stringWithFormat:@"%@/%@", +[_PFPersistentHistoryModel ancillaryModelNamespace](_PFPersistentHistoryModel, "ancillaryModelNamespace"), @"TRANSACTION"]);
      [(NSFetchRequest *)v2 setIncludesSubentities:0];
      -[NSFetchRequest setPredicate:](v2, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"_pk = %@", v4]);
      [(NSFetchRequest *)v2 setResultType:4];
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

- (NSFetchRequest)fetchRequestDescribingChangeRequestForStore:(void *)a1
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  id v4 = (void *)[a1 entityNameToFetch];
  uint64_t v5 = [a2 persistentStoreCoordinator];
  if (v5) {
    uint64_t v6 = *(void *)(v5 + 96);
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = @"TRANSACTION";
  if (([v4 isEqualToString:@"TRANSACTION"] & 1) == 0
    && ![v4 isEqualToString:@"Transaction"])
  {
    uint64_t v7 = @"CHANGE";
    if (([v4 isEqualToString:@"CHANGE"] & 1) == 0
      && ![v4 isEqualToString:@"Change"])
    {
      uint64_t v13 = [NSString stringWithUTF8String:"Unexepected Entity Name for a History Request - %@"];
      _NSCoreDataLog(17, v13, v14, v15, v16, v17, v18, v19, (uint64_t)v4);
      uint64_t v20 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        int v25 = v4;
        _os_log_fault_impl(&dword_18AB82000, v20, OS_LOG_TYPE_FAULT, "CoreData: Unexepected Entity Name for a History Request - %@", buf, 0xCu);
      }
      goto LABEL_30;
    }
  }
  uint64_t v8 = [NSString stringWithFormat:@"%@/%@", +[_PFPersistentHistoryModel ancillaryModelNamespace](_PFPersistentHistoryModel, "ancillaryModelNamespace"), v7];
  if (!v6)
  {
LABEL_30:
    uint64_t v9 = 0;
    goto LABEL_10;
  }
  uint64_t v9 = (void *)[*(id *)(v6 + 56) objectForKey:v8];
LABEL_10:
  id v10 = -[NSFetchRequest initWithEntityName:]([NSFetchRequest alloc], "initWithEntityName:", [NSString stringWithFormat:@"%@/%@", +[_PFPersistentHistoryModel ancillaryModelNamespace](_PFPersistentHistoryModel, "ancillaryModelNamespace"), objc_msgSend((id)objc_msgSend(v9, "name"), "uppercaseString")]);
  [(NSFetchRequest *)v10 setIncludesSubentities:0];
  uint64_t v11 = objc_msgSend(a1, "predicateForStoreIdentifier:", objc_msgSend(a2, "identifier"));
  if (v11) {
    [(NSFetchRequest *)v10 setPredicate:v11];
  }
  [(NSFetchRequest *)v10 setIncludesPropertyValues:1];
  [(NSFetchRequest *)v10 setIncludesPendingChanges:0];
  if ([a1 fetchLimit])
  {
    -[NSFetchRequest setFetchLimit:](v10, "setFetchLimit:", [a1 fetchLimit]);
    if ([a1 fetchOffset]) {
      -[NSFetchRequest setFetchOffset:](v10, "setFetchOffset:", [a1 fetchOffset]);
    }
  }
  if ([a1 fetchRequest]
    && objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "fetchRequest"), "sortDescriptors"), "count"))
  {
    -[NSFetchRequest setSortDescriptors:](v10, "setSortDescriptors:", objc_msgSend((id)objc_msgSend(a1, "fetchRequest"), "sortDescriptors"));
  }
  if ([a1 fetchBatchSize])
  {
    -[NSFetchRequest setFetchBatchSize:](v10, "setFetchBatchSize:", [a1 fetchBatchSize]);
    if (![(NSArray *)[(NSFetchRequest *)v10 sortDescriptors] count])
    {
      uint64_t v23 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"self" ascending:1];
      -[NSFetchRequest setSortDescriptors:](v10, "setSortDescriptors:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1]);
    }
  }
  if ([a1 resultType] == 5)
  {
    uint64_t v22 = @"CHANGES";
    -[NSFetchRequest setRelationshipKeyPathsForPrefetching:](v10, "setRelationshipKeyPathsForPrefetching:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1]);
  }
  if ([a1 resultType] && objc_msgSend(a1, "resultType") != 2 && objc_msgSend(a1, "resultType") != 6)
  {
    if ([a1 propertiesToFetch])
    {
      NSPersistentHistoryResultType v12 = (void *)[a1 propertiesToFetch];
    }
    else
    {
      NSPersistentHistoryResultType v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithArray:", objc_msgSend(a1, "propertiesToFetchForEntity:includeTransactionStrings:", v9, 1));
      if (objc_msgSend((id)objc_msgSend(a2, "type"), "isEqualToString:", @"NSXPCStore")) {
        [v12 removeObject:@"QUERYGEN"];
      }
    }
    [(NSFetchRequest *)v10 setPropertiesToFetch:v12];
  }
  if (objc_msgSend((id)objc_msgSend(a1, "affectedStores"), "count")) {
    -[NSFetchRequest setAffectedStores:](v10, "setAffectedStores:", [a1 affectedStores]);
  }
  return v10;
}

- (id)description
{
  if ((*(_DWORD *)&self->_persistentHistoryChangeRequestDescriptionFlags & 2) != 0) {
    id v2 = @"Delete";
  }
  else {
    id v2 = @"Fetch";
  }
  return (id)[NSString stringWithFormat:@"NSPersistentHistoryChangeRequest : %@ < %@ - %@-%@> %@", v2, *self->_additionalPrivateIvars, self->_token, self->_transactionNumber, +[NSPersistentHistoryChangeRequest _stringForHistoryRequestResultType:](NSPersistentHistoryChangeRequest, "_stringForHistoryRequestResultType:", self->_resultType)];
}

- (id)debugDescription
{
  v3 = NSString;
  if ((*(_DWORD *)&self->_persistentHistoryChangeRequestDescriptionFlags & 2) != 0) {
    id v4 = @"Delete";
  }
  else {
    id v4 = @"Fetch";
  }
  id v5 = *self->_additionalPrivateIvars;
  token = self->_token;
  transactionNumber = self->_transactionNumber;
  unint64_t v8 = [(NSPersistentHistoryChangeRequest *)self fetchLimit];
  unint64_t v9 = [(NSPersistentHistoryChangeRequest *)self fetchOffset];
  unint64_t v10 = [(NSPersistentHistoryChangeRequest *)self fetchBatchSize];
  id v11 = +[NSPersistentHistoryChangeRequest _stringForHistoryRequestResultType:self->_resultType];
  NSPersistentHistoryResultType v12 = [(NSPersistentHistoryChangeRequest *)self fetchRequest];
  uint64_t v13 = @"nil";
  if (v12) {
    uint64_t v13 = (__CFString *)v12;
  }
  return (id)[v3 stringWithFormat:@"NSPersistentHistoryChangeRequest : %@ <Date-%@ Token-%@ TransactionID-%@> limit - %lu offset - %lu batchSize - %lu, resultType - %@, fetchRequest - %@", v4, v5, token, transactionNumber, v8, v9, v10, v11, v13];
}

+ (id)_stringForHistoryRequestResultType:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)a3 < 7) {
    return off_1E544B5F8[a3];
  }
  uint64_t v5 = [NSString stringWithUTF8String:"Unknown fetch request result type: %ld"];
  _NSCoreDataLog(17, v5, v6, v7, v8, v9, v10, v11, a3);
  NSPersistentHistoryResultType v12 = __pflogFaultLog;
  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v14 = a3;
    _os_log_fault_impl(&dword_18AB82000, v12, OS_LOG_TYPE_FAULT, "CoreData: Unknown fetch request result type: %ld", buf, 0xCu);
  }
  return 0;
}

@end