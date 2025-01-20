@interface _NSPersistentHistoryTransactionPredicateParser
- (BOOL)parse:(id *)a3;
- (_NSPersistentHistoryTransactionPredicateParser)initWithPredicate:(id)a3;
- (id)storeTokens;
- (void)dealloc;
- (void)visitPredicateExpression:(id)a3;
@end

@implementation _NSPersistentHistoryTransactionPredicateParser

- (id)storeTokens
{
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:self->_storeTokens];
}

- (BOOL)parse:(id *)a3
{
  predicate = self->_predicate;
  if (!predicate) {
    return 1;
  }
  [(NSPredicate *)predicate acceptVisitor:self flags:1];
  localError = self->_localError;
  BOOL result = localError == 0;
  if (a3)
  {
    if (localError)
    {
      BOOL result = 0;
      *a3 = localError;
    }
  }
  return result;
}

- (_NSPersistentHistoryTransactionPredicateParser)initWithPredicate:(id)a3
{
  v4 = [(_NSPersistentHistoryTransactionPredicateParser *)self init];
  if (v4)
  {
    v4->_predicate = (NSPredicate *)[a3 copy];
    v4->_storeTokens = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    *(_WORD *)&v4->_hasDate = 0;
    v4->_localError = 0;
  }
  return v4;
}

- (void)visitPredicateExpression:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  if (self->_localError) {
    return;
  }
  if ([a3 expressionType])
  {
    if ([a3 expressionType] != 10
      || !objc_msgSend((id)objc_msgSend(a3, "keyPath"), "isEqualToString:", @"TIMESTAMP"))
    {
      return;
    }
    if (self->_hasDate)
    {
      uint64_t v14 = *MEMORY[0x1E4F28568];
      v15 = @"Only one date predicate is allowed for history deletion.";
      v5 = (void *)MEMORY[0x1E4F1C9E8];
      v6 = &v15;
      v7 = &v14;
LABEL_19:
      uint64_t v12 = [v5 dictionaryWithObjects:v6 forKeys:v7 count:1];
      id v13 = objc_alloc(MEMORY[0x1E4F28C58]);
      self->_localError = (NSError *)[v13 initWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:v12];
      return;
    }
    goto LABEL_20;
  }
  [a3 constantValue];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v9 = (void *)[a3 constantValue];
  if (isKindOfClass)
  {
    storeTokens = self->_storeTokens;
    uint64_t v11 = [v9 storeTokens];
    [(NSMutableDictionary *)storeTokens addEntriesFromDictionary:v11];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && objc_msgSend((id)objc_msgSend(a3, "constantValue"), "isEqualToString:", @"TIMESTAMP"))
    {
      self->_hasTimestamp = 1;
      return;
    }
    [a3 constantValue];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && self->_hasTimestamp)
    {
      if (self->_hasDate)
      {
        uint64_t v16 = *MEMORY[0x1E4F28568];
        v17[0] = @"Only one date predicate is allowed for history deletion.";
        v5 = (void *)MEMORY[0x1E4F1C9E8];
        v6 = (__CFString **)v17;
        v7 = &v16;
        goto LABEL_19;
      }
LABEL_20:
      self->_hasDate = 1;
    }
  }
}

- (void)dealloc
{
  self->_predicate = 0;
  self->_storeTokens = 0;

  self->_localError = 0;
  v3.receiver = self;
  v3.super_class = (Class)_NSPersistentHistoryTransactionPredicateParser;
  [(_NSPersistentHistoryTransactionPredicateParser *)&v3 dealloc];
}

@end