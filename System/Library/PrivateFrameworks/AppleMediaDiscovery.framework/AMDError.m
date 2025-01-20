@interface AMDError
+ (id)allocError:(int64_t)a3 withMessage:(id)a4;
@end

@implementation AMDError

+ (id)allocError:(int64_t)a3 withMessage:(id)a4
{
  v16[1] = *MEMORY[0x263EF8340];
  id v14 = a1;
  SEL v13 = a2;
  int64_t v12 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v5 = (id)[MEMORY[0x263F086E0] mainBundle];
  id v10 = (id)[v5 localizedStringForKey:location value:&stru_26BEAC9D8 table:0];

  id v7 = objc_alloc(MEMORY[0x263F087E8]);
  int64_t v6 = v12;
  uint64_t v15 = *MEMORY[0x263F08320];
  v16[0] = v10;
  id v8 = (id)[NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
  v9 = objc_msgSend(v7, "initWithDomain:code:userInfo:", @"com.apple.AppleMediaDiscovery", v6);

  objc_storeStrong(&v10, 0);
  objc_storeStrong(&location, 0);
  return v9;
}

@end