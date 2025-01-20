@interface _MXExtensionContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
@end

@implementation _MXExtensionContext

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_MergedGlobals_163 != -1) {
    dispatch_once(&_MergedGlobals_163, &__block_literal_global_81);
  }
  v2 = (void *)qword_1EB3160E8;

  return v2;
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (qword_1EB3160F0 != -1) {
    dispatch_once(&qword_1EB3160F0, &__block_literal_global_54);
  }
  v2 = (void *)qword_1EB3160F8;

  return v2;
}

@end