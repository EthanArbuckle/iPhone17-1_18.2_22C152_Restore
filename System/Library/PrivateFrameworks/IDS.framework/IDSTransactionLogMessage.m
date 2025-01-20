@interface IDSTransactionLogMessage
+ (id)transactionLogMessageFromDictionaryRepresentation:(id)a3;
- (IDSTransactionLogMessage)initWithDictionaryRepresentation:(id)a3;
- (NSString)accountUniqueID;
- (NSString)fromID;
- (NSString)loginID;
- (NSString)serviceName;
- (id)_dictionaryRepresentation;
- (id)_initWithAccountUniqueID:(id)a3 fromID:(id)a4 loginID:(id)a5 serviceName:(id)a6;
@end

@implementation IDSTransactionLogMessage

- (id)_initWithAccountUniqueID:(id)a3 fromID:(id)a4 loginID:(id)a5 serviceName:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)IDSTransactionLogMessage;
  v15 = [(IDSTransactionLogMessage *)&v18 init];
  p_isa = (id *)&v15->super.isa;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_accountUniqueID, a3);
    objc_storeStrong(p_isa + 1, a4);
    objc_storeStrong(p_isa + 2, a5);
    objc_storeStrong(p_isa + 4, a6);
  }

  return p_isa;
}

- (IDSTransactionLogMessage)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"IDSTransactionLogMessageAccountUniqueIDKey"];
  v6 = [v4 objectForKeyedSubscript:@"IDSTransactionLogMessageFromIDKey"];
  v7 = [v4 objectForKeyedSubscript:@"IDSTransactionLogMessageLoginIDKey"];
  v8 = [v4 objectForKeyedSubscript:@"IDSTransactionLogMessageServiceNameKey"];

  v9 = [(IDSTransactionLogMessage *)self _initWithAccountUniqueID:v5 fromID:v6 loginID:v7 serviceName:v8];
  return v9;
}

- (id)_dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:5];
  id v4 = [(IDSTransactionLogMessage *)self accountUniqueID];

  if (v4)
  {
    v5 = [(IDSTransactionLogMessage *)self accountUniqueID];
    [v3 setObject:v5 forKeyedSubscript:@"IDSTransactionLogMessageAccountUniqueIDKey"];
  }
  v6 = [(IDSTransactionLogMessage *)self fromID];

  if (v6)
  {
    v7 = [(IDSTransactionLogMessage *)self fromID];
    [v3 setObject:v7 forKeyedSubscript:@"IDSTransactionLogMessageFromIDKey"];
  }
  v8 = [(IDSTransactionLogMessage *)self loginID];

  if (v8)
  {
    v9 = [(IDSTransactionLogMessage *)self loginID];
    [v3 setObject:v9 forKeyedSubscript:@"IDSTransactionLogMessageLoginIDKey"];
  }
  v10 = [(IDSTransactionLogMessage *)self serviceName];

  if (v10)
  {
    id v11 = [(IDSTransactionLogMessage *)self serviceName];
    [v3 setObject:v11 forKeyedSubscript:@"IDSTransactionLogMessageServiceNameKey"];
  }

  return v3;
}

+ (id)transactionLogMessageFromDictionaryRepresentation:(id)a3
{
  id v3 = a3;
  if (!v3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v6 = 0;
    goto LABEL_9;
  }
  id v4 = [v3 objectForKeyedSubscript:@"IDSTransactionLogMessageDictionaryValueKey"];

  if (v4)
  {
    v5 = off_1E5728788;
  }
  else
  {
    v6 = [v3 objectForKeyedSubscript:@"IDSTransactionLogMessageDataValueKey"];

    if (!v6) {
      goto LABEL_9;
    }
    v5 = off_1E5728780;
  }
  v6 = (void *)[objc_alloc(*v5) initWithDictionaryRepresentation:v3];
LABEL_9:

  return v6;
}

- (NSString)accountUniqueID
{
  return self->_accountUniqueID;
}

- (NSString)fromID
{
  return self->_fromID;
}

- (NSString)loginID
{
  return self->_loginID;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_accountUniqueID, 0);
  objc_storeStrong((id *)&self->_loginID, 0);

  objc_storeStrong((id *)&self->_fromID, 0);
}

@end