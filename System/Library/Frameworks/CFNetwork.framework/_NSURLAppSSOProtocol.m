@interface _NSURLAppSSOProtocol
+ (const)_cf_internalImpl;
@end

@implementation _NSURLAppSSOProtocol

+ (const)_cf_internalImpl
{
  return (const InternalProtocolImplementation *)&AppSSOProtocol::kCFAppSSOProtocolCBs;
}

@end