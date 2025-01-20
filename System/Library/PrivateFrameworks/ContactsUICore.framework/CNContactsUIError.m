@interface CNContactsUIError
+ (id)errorWithCode:(int64_t)a3;
+ (id)errorWithCode:(int64_t)a3 userInfo:(id)a4;
@end

@implementation CNContactsUIError

+ (id)errorWithCode:(int64_t)a3 userInfo:(id)a4
{
  return (id)[MEMORY[0x263F087E8] errorWithDomain:@"CNContactsUIErrorDomain" code:a3 userInfo:a4];
}

+ (id)errorWithCode:(int64_t)a3
{
  return (id)[a1 errorWithCode:a3 userInfo:0];
}

@end