@interface CATActiveIDSServiceConnectionContentClose
+ (id)instanceWithDictionary:(id)a3;
- (CATActiveIDSServiceConnectionContentClose)init;
- (CATActiveIDSServiceConnectionContentClose)initWithError:(id)a3;
- (NSDictionary)dictionaryValue;
- (NSError)error;
- (int64_t)contentType;
- (void)setError:(id)a3;
@end

@implementation CATActiveIDSServiceConnectionContentClose

- (CATActiveIDSServiceConnectionContentClose)init
{
  return [(CATActiveIDSServiceConnectionContentClose *)self initWithError:0];
}

- (CATActiveIDSServiceConnectionContentClose)initWithError:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CATActiveIDSServiceConnectionContentClose;
  v6 = [(CATActiveIDSServiceConnectionContentClose *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_error, a3);
  }

  return v7;
}

- (int64_t)contentType
{
  return 4;
}

- (NSDictionary)dictionaryValue
{
  v3 = objc_opt_new();
  v4 = [(CATActiveIDSServiceConnectionContentClose *)self error];
  id v5 = objc_msgSend(v4, "cat_dictionaryValue");
  [v3 setObject:v5 forKeyedSubscript:@"Error"];

  v6 = (void *)[v3 copy];

  return (NSDictionary *)v6;
}

+ (id)instanceWithDictionary:(id)a3
{
  v4 = [a3 objectForKeyedSubscript:@"Error"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  v7 = objc_msgSend(v6, "cat_errorValue");

  v8 = (void *)[objc_alloc((Class)a1) initWithError:v7];

  return v8;
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
}

@end