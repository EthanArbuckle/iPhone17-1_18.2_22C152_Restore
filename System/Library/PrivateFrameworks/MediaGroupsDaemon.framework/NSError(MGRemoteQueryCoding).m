@interface NSError(MGRemoteQueryCoding)
+ (id)rq_instanceFromCoded:()MGRemoteQueryCoding;
- (id)rq_coded;
@end

@implementation NSError(MGRemoteQueryCoding)

- (id)rq_coded
{
  v2 = [MEMORY[0x263EFF9A0] dictionary];
  v3 = [a1 domain];
  v4 = objc_msgSend(v3, "rq_coded");

  v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "code"));
  v6 = objc_msgSend(v5, "rq_coded");

  v7 = objc_msgSend(v4, "rq_coded");
  [v2 setObject:v7 forKey:@"domain"];

  v8 = objc_msgSend(v6, "rq_coded");
  [v2 setObject:v8 forKey:@"code"];

  return v2;
}

+ (id)rq_instanceFromCoded:()MGRemoteQueryCoding
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  v5 = objc_msgSend(v4, "rq_stringForKey:", @"domain");
  v6 = objc_msgSend(v4, "rq_numberForKey:", @"code");
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    v8 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", v5, objc_msgSend(v6, "integerValue"), 0);
  }

  return v8;
}

@end