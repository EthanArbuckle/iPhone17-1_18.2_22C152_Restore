@interface _NSURLDataProtocol
+ (const)_cf_internalImpl;
@end

@implementation _NSURLDataProtocol

+ (const)_cf_internalImpl
{
  return (const InternalProtocolImplementation *)&DataProtocol::kCFDataProtocolCBs;
}

@end