@interface CNEnvironment
+ (id)makeDefaultContactStore;
- (CNContactStore)contactStore;
@end

@implementation CNEnvironment

- (CNContactStore)contactStore
{
  return (CNContactStore *)[(CNEnvironment *)self valueForKey:@"contact-store" onCacheMiss:&stru_100024B70];
}

+ (id)makeDefaultContactStore
{
  id v2 = objc_alloc_init((Class)CNContactStore);

  return v2;
}

@end