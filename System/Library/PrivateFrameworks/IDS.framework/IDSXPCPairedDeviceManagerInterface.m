@interface IDSXPCPairedDeviceManagerInterface
+ (id)interface;
@end

@implementation IDSXPCPairedDeviceManagerInterface

+ (id)interface
{
  if (qword_1EB2BD588 != -1) {
    dispatch_once(&qword_1EB2BD588, &unk_1EE246728);
  }
  v2 = (void *)qword_1EB2BD620;

  return v2;
}

@end