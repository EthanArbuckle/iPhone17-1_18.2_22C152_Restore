@interface CRKErrorBox
+ (id)instanceWithDictionary:(id)a3;
- (CRKErrorBox)initWithError:(id)a3;
- (NSDictionary)dictionaryValue;
- (NSError)error;
@end

@implementation CRKErrorBox

- (CRKErrorBox)initWithError:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKErrorBox;
  v6 = [(CRKErrorBox *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_error, a3);
  }

  return v7;
}

- (NSDictionary)dictionaryValue
{
  v3 = objc_opt_new();
  v4 = NSNumber;
  id v5 = [(CRKErrorBox *)self error];
  v6 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "code"));
  [v3 setObject:v6 forKeyedSubscript:@"Code"];

  v7 = [(CRKErrorBox *)self error];
  v8 = [v7 domain];
  [v3 setObject:v8 forKeyedSubscript:@"Domain"];

  objc_super v9 = [(CRKErrorBox *)self error];
  v10 = [v9 userInfo];
  [v3 setObject:v10 forKeyedSubscript:@"UserInfo"];

  v11 = (void *)[v3 copy];

  return (NSDictionary *)v11;
}

+ (id)instanceWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"Domain"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  v8 = [v4 objectForKeyedSubscript:@"Code"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_super v9 = v8;
  }
  else {
    objc_super v9 = 0;
  }
  id v10 = v9;

  v11 = [v4 objectForKeyedSubscript:@"UserInfo"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  id v13 = v12;

  v14 = 0;
  if (v7 && v10)
  {
    v15 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", v7, objc_msgSend(v10, "integerValue"), v13);
    v14 = (void *)[objc_alloc((Class)a1) initWithError:v15];
  }

  return v14;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
}

@end