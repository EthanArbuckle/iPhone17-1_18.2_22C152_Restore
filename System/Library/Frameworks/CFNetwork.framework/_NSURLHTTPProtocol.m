@interface _NSURLHTTPProtocol
+ (const)_cf_internalImpl;
@end

@implementation _NSURLHTTPProtocol

+ (const)_cf_internalImpl
{
  return (const InternalProtocolImplementation *)&HTTPProtocol::kCFHTTPProtocolCBs;
}

@end