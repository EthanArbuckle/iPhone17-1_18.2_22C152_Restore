@interface EDSearchableIndexClientState
+ (id)clientState;
+ (id)clientStateFromData:(id)a3;
+ (id)transactionAttributeKey;
- (EDSearchableIndexClientState)init;
- (EDSearchableIndexClientState)initWithDictionary:(id)a3;
- (NSDate)transactionDate;
- (NSNumber)transactionValue;
- (NSString)systemBuildVersion;
- (id)archiveRepresentation;
- (id)description;
- (int64_t)transaction;
- (void)addTransactionValueToAttributeSet:(id)a3;
- (void)setSystemBuildVersion:(id)a3;
- (void)setTransaction:(int64_t)a3;
- (void)setTransactionDate:(id)a3;
@end

@implementation EDSearchableIndexClientState

- (void)addTransactionValueToAttributeSet:(id)a3
{
  id v6 = a3;
  v4 = [(EDSearchableIndexClientState *)self transactionValue];
  if (v4)
  {
    v5 = [(id)objc_opt_class() transactionAttributeKey];
    [v6 setValue:v4 forCustomKey:v5];
  }
}

- (NSNumber)transactionValue
{
  transactionValue = self->_transactionValue;
  if (!transactionValue)
  {
    v4 = [NSNumber numberWithLongLong:self->_transaction];
    v5 = self->_transactionValue;
    self->_transactionValue = v4;

    transactionValue = self->_transactionValue;
  }

  return transactionValue;
}

+ (id)transactionAttributeKey
{
  if (transactionAttributeKey_onceToken != -1) {
    dispatch_once(&transactionAttributeKey_onceToken, &__block_literal_global_67);
  }
  v2 = (void *)transactionAttributeKey_key;

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemBuildVersion, 0);
  objc_storeStrong((id *)&self->_transactionDate, 0);

  objc_storeStrong((id *)&self->_transactionValue, 0);
}

+ (id)clientState
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (EDSearchableIndexClientState)init
{
  v9.receiver = self;
  v9.super_class = (Class)EDSearchableIndexClientState;
  id v2 = [(EDSearchableIndexClientState *)&v9 init];
  if (v2)
  {
    v3 = EFSystemBuildVersion();
    uint64_t v4 = [v3 copy];
    systemBuildVersion = v2->_systemBuildVersion;
    v2->_systemBuildVersion = (NSString *)v4;

    id v6 = (NSDate *)objc_alloc_init(MEMORY[0x1E4F1C9C8]);
    transactionDate = v2->_transactionDate;
    v2->_transactionDate = v6;
  }
  return v2;
}

- (int64_t)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(int64_t)a3
{
  self->_transaction = a3;
}

- (id)archiveRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v4 = [NSNumber numberWithLongLong:self->_transaction];
  [v3 setObject:v4 forKeyedSubscript:@"transaction"];

  v5 = NSNumber;
  [(NSDate *)self->_transactionDate timeIntervalSince1970];
  id v6 = objc_msgSend(v5, "numberWithDouble:");
  [v3 setObject:v6 forKeyedSubscript:@"date"];

  [v3 setObject:self->_systemBuildVersion forKeyedSubscript:@"build"];
  v7 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v3 options:0 error:0];

  return v7;
}

void __55__EDSearchableIndexClientState_transactionAttributeKey__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F237C0]) initWithKeyName:@"com_apple_mail_transaction" searchable:1 searchableByDefault:0 unique:0 multiValued:0];
  v1 = (void *)transactionAttributeKey_key;
  transactionAttributeKey_key = v0;
}

+ (id)clientStateFromData:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v5 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v4 options:4 error:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = (void *)[objc_alloc((Class)a1) initWithDictionary:v5];
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA20], "ef_posixLocale");
  [v3 setLocale:v4];

  [v3 setDateFormat:@"yyyy-MM-dd HH:mm:ssZ"];
  v5 = [v3 stringFromDate:self->_transactionDate];
  id v6 = [NSString stringWithFormat:@"<%@: %p> version=%@ date=%@ transaction=%lld", objc_opt_class(), self, self->_systemBuildVersion, v5, self->_transaction];

  return v6;
}

- (EDSearchableIndexClientState)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"transaction"];
  id v6 = [v4 objectForKeyedSubscript:@"date"];
  v7 = [v4 objectForKeyedSubscript:@"build"];
  if (objc_opt_respondsToSelector())
  {
    v12.receiver = self;
    v12.super_class = (Class)EDSearchableIndexClientState;
    v8 = [(EDSearchableIndexClientState *)&v12 init];
    if (v8)
    {
      v8->_transaction = [v5 longLongValue];
      if (v7) {
        [(EDSearchableIndexClientState *)v8 setSystemBuildVersion:v7];
      }
      if (objc_opt_respondsToSelector())
      {
        objc_super v9 = (void *)MEMORY[0x1E4F1C9C8];
        [v6 doubleValue];
        v10 = objc_msgSend(v9, "dateWithTimeIntervalSince1970:");
        [(EDSearchableIndexClientState *)v8 setTransactionDate:v10];
      }
    }
  }
  else
  {

    v8 = 0;
  }

  return v8;
}

- (NSDate)transactionDate
{
  return self->_transactionDate;
}

- (void)setTransactionDate:(id)a3
{
}

- (NSString)systemBuildVersion
{
  return self->_systemBuildVersion;
}

- (void)setSystemBuildVersion:(id)a3
{
}

@end