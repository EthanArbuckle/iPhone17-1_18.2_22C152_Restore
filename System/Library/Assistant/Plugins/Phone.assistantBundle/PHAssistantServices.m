@interface PHAssistantServices
+ (CNContactStore)sharedContactStore;
@end

@implementation PHAssistantServices

+ (CNContactStore)sharedContactStore
{
  if (qword_2687F5A10 != -1) {
    dispatch_once(&qword_2687F5A10, &unk_26E87C020);
  }
  v2 = (void *)qword_2687F5A08;

  return (CNContactStore *)v2;
}

@end