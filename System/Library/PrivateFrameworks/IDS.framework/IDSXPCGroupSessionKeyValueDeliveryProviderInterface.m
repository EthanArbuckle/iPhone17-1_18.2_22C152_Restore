@interface IDSXPCGroupSessionKeyValueDeliveryProviderInterface
+ (id)interface;
@end

@implementation IDSXPCGroupSessionKeyValueDeliveryProviderInterface

+ (id)interface
{
  if (qword_1EB2BD580 != -1) {
    dispatch_once(&qword_1EB2BD580, &unk_1EE246668);
  }
  v2 = (void *)qword_1EB2BD618;

  return v2;
}

@end