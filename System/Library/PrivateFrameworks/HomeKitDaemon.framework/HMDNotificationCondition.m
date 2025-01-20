@interface HMDNotificationCondition
+ (BOOL)doesTypeMatch:(id)a3 against:(id)a4;
+ (BOOL)supportsSecureCoding;
+ (id)type;
- (BOOL)isEqual:(id)a3;
- (HMDNotificationCondition)initWithCoder:(id)a3;
- (HMDNotificationCondition)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializedRegistrationForRemoteMessage;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDNotificationCondition

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)type
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (BOOL)doesTypeMatch:(id)a3 against:(id)a4
{
  id v5 = a4;
  v6 = [a3 objectForKeyedSubscript:@"HMDBNC.type"];
  char v7 = [v6 isEqualToString:v5];

  return v7;
}

- (HMDNotificationCondition)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  char v7 = NSString;
  v8 = NSStringFromSelector(a2);
  v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  char v7 = NSString;
  v8 = NSStringFromSelector(a2);
  v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  id v5 = NSString;
  uint64_t v6 = NSStringFromSelector(a2);
  char v7 = [v5 stringWithFormat:@"You must override %@ in a subclass", v6];
  id v8 = [v3 exceptionWithName:v4 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (unint64_t)hash
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  uint64_t v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  id v7 = NSString;
  id v8 = NSStringFromSelector(a2);
  v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (HMDNotificationCondition)initWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  id v7 = NSString;
  id v8 = NSStringFromSelector(a2);
  v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (id)serializedRegistrationForRemoteMessage
{
  v6[1] = *MEMORY[0x263EF8340];
  id v5 = @"HMDBNC.type";
  v2 = [(id)objc_opt_class() type];
  v6[0] = v2;
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

@end