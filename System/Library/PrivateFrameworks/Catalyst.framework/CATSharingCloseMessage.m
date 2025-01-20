@interface CATSharingCloseMessage
+ (id)instanceWithDictionary:(id)a3;
- (CATSharingCloseMessage)initWithError:(id)a3;
- (NSDictionary)dictionaryValue;
- (NSError)closeError;
- (int64_t)messageType;
@end

@implementation CATSharingCloseMessage

- (CATSharingCloseMessage)initWithError:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CATSharingCloseMessage;
  v6 = [(CATSharingCloseMessage *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_closeError, a3);
  }

  return v7;
}

- (int64_t)messageType
{
  return 2;
}

- (NSDictionary)dictionaryValue
{
  v3 = objc_opt_new();
  v4 = [(CATSharingCloseMessage *)self closeError];
  [v3 setObject:v4 forKeyedSubscript:@"SharingCloseMessageError"];

  id v5 = (void *)[v3 copy];

  return (NSDictionary *)v5;
}

+ (id)instanceWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  v6 = [v4 objectForKeyedSubscript:@"SharingCloseMessageError"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  objc_super v9 = (void *)[v5 initWithError:v8];

  return v9;
}

- (NSError)closeError
{
  return self->_closeError;
}

- (void).cxx_destruct
{
}

@end