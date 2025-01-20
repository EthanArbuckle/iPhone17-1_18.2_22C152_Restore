@interface CATInitializingIDSServiceConnectionContentReject
+ (id)instanceWithDictionary:(id)a3;
- (CATInitializingIDSServiceConnectionContentReject)initWithConnectionIdentifier:(id)a3 error:(id)a4;
- (NSDictionary)dictionaryValue;
- (NSError)error;
- (NSUUID)connectionIdentifier;
- (int64_t)contentType;
- (void)setError:(id)a3;
@end

@implementation CATInitializingIDSServiceConnectionContentReject

- (CATInitializingIDSServiceConnectionContentReject)initWithConnectionIdentifier:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CATInitializingIDSServiceConnectionContentReject;
  v9 = [(CATInitializingIDSServiceConnectionContentReject *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connectionIdentifier, a3);
    objc_storeStrong((id *)&v10->_error, a4);
  }

  return v10;
}

- (int64_t)contentType
{
  return 3;
}

- (NSDictionary)dictionaryValue
{
  v3 = objc_opt_new();
  v4 = [(CATInitializingIDSServiceConnectionContentReject *)self connectionIdentifier];
  v5 = [v4 UUIDString];
  [v3 setObject:v5 forKeyedSubscript:@"ConnectionIdenfitier"];

  v6 = [(CATInitializingIDSServiceConnectionContentReject *)self error];
  id v7 = objc_msgSend(v6, "cat_dictionaryValue");
  [v3 setObject:v7 forKeyedSubscript:@"Error"];

  id v8 = (void *)[v3 copy];

  return (NSDictionary *)v8;
}

+ (id)instanceWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"Error"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  id v8 = objc_msgSend(v7, "cat_errorValue");

  v9 = objc_msgSend(v4, "cat_uuidForKey:", @"ConnectionIdenfitier");

  if (v9) {
    v10 = (void *)[objc_alloc((Class)a1) initWithConnectionIdentifier:v9 error:v8];
  }
  else {
    v10 = 0;
  }

  return v10;
}

- (NSUUID)connectionIdentifier
{
  return self->_connectionIdentifier;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_connectionIdentifier, 0);
}

@end