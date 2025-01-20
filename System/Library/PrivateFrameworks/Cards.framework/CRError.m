@interface CRError
+ (id)errorWithCode:(int64_t)a3;
+ (id)errorWithCode:(int64_t)a3 description:(id)a4;
+ (id)errorWithCode:(int64_t)a3 description:(id)a4 underlyingError:(id)a5 userInfo:(id)a6;
@end

@implementation CRError

+ (id)errorWithCode:(int64_t)a3
{
  return (id)[a1 errorWithCode:a3 description:0 underlyingError:0 userInfo:0];
}

+ (id)errorWithCode:(int64_t)a3 description:(id)a4
{
  return (id)[a1 errorWithCode:a3 description:a4 underlyingError:0 userInfo:0];
}

+ (id)errorWithCode:(int64_t)a3 description:(id)a4 underlyingError:(id)a5 userInfo:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if (v11) {
    uint64_t v12 = [objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:v11 copyItems:1];
  }
  else {
    uint64_t v12 = objc_opt_new();
  }
  v13 = (void *)v12;
  uint64_t v14 = CRErrorCodeGetName(a3);
  v15 = (void *)v14;
  if (v9 && v14)
  {
    v16 = (void *)[[NSString alloc] initWithFormat:@"%@: %@", v14, v9];
    [v13 setObject:v16 forKey:*MEMORY[0x263F08320]];
  }
  else if (v14)
  {
    [v13 setObject:v14 forKey:*MEMORY[0x263F08320]];
  }
  if (v10) {
    [v13 setObject:v10 forKey:*MEMORY[0x263F08608]];
  }
  v17 = (void *)MEMORY[0x263F087E8];
  if ([v13 count]) {
    v18 = v13;
  }
  else {
    v18 = 0;
  }
  v19 = [v17 errorWithDomain:@"com.apple.cards.error" code:a3 userInfo:v18];

  return v19;
}

@end