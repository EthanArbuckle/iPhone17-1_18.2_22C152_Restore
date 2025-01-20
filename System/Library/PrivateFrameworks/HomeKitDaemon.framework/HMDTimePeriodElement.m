@interface HMDTimePeriodElement
+ (BOOL)doesTypeMatch:(id)a3 against:(id)a4;
+ (id)type;
- (HMDTimePeriodElement)initWithDictionary:(id)a3;
- (id)serializedRegistrationForRemoteMessage;
@end

@implementation HMDTimePeriodElement

- (HMDTimePeriodElement)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  v7 = NSString;
  v8 = NSStringFromSelector(a2);
  v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (id)serializedRegistrationForRemoteMessage
{
  v6[1] = *MEMORY[0x263EF8340];
  v5 = @"HMDTPN.type";
  v2 = [(id)objc_opt_class() type];
  v6[0] = v2;
  v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)type
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  id v4 = NSString;
  v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (BOOL)doesTypeMatch:(id)a3 against:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [a3 objectForKeyedSubscript:@"HMDTPN.type"];
  char v7 = [v6 isEqualToString:v5];

  return v7;
}

@end