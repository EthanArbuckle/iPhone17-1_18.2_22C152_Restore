@interface CLSContextProviderExtensionHostContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
@end

@implementation CLSContextProviderExtensionHostContext

+ (id)_extensionAuxiliaryHostProtocol
{
  if (qword_1EB5D4770 != -1) {
    dispatch_once(&qword_1EB5D4770, &unk_1F37A14F0);
  }
  v2 = (void *)qword_1EB5D4778;

  return v2;
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (qword_1EB5D4780 != -1) {
    dispatch_once(&qword_1EB5D4780, &unk_1F37A1870);
  }
  v2 = (void *)qword_1EB5D4788;

  return v2;
}

@end