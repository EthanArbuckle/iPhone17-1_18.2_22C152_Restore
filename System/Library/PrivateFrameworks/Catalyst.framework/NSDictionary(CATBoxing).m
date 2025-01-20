@interface NSDictionary(CATBoxing)
- (id)cat_errorValue;
@end

@implementation NSDictionary(CATBoxing)

- (id)cat_errorValue
{
  v2 = [a1 objectForKeyedSubscript:@"Domain"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  v5 = [a1 objectForKeyedSubscript:@"Code"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  v8 = [a1 objectForKeyedSubscript:@"UserInfo"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  v11 = 0;
  if (v4) {
    BOOL v12 = v7 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (!v12)
  {
    v11 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", v4, objc_msgSend(v7, "integerValue"), v10);
  }

  return v11;
}

@end