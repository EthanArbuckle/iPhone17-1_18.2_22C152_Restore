@interface CNCFPhoneNumber
+ (id)makeProxy;
- (__CFPhoneNumber)create:(id)a3 :(id)a4;
@end

@implementation CNCFPhoneNumber

- (__CFPhoneNumber)create:(id)a3 :(id)a4
{
  return (__CFPhoneNumber *)MEMORY[0x1F4109240](*MEMORY[0x1E4F1CF80], a3, a4);
}

+ (id)makeProxy
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

@end