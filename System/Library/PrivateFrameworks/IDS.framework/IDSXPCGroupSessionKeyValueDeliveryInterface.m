@interface IDSXPCGroupSessionKeyValueDeliveryInterface
+ (id)interface;
@end

@implementation IDSXPCGroupSessionKeyValueDeliveryInterface

+ (id)interface
{
  if (qword_1EB2BD5C8 != -1) {
    dispatch_once(&qword_1EB2BD5C8, &unk_1EE2469E8);
  }
  v2 = (void *)qword_1EB2BD660;

  return v2;
}

@end