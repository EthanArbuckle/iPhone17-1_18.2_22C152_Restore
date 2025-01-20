@interface _NSURLFTPProtocol
+ (const)_cf_internalImpl;
@end

@implementation _NSURLFTPProtocol

+ (const)_cf_internalImpl
{
  return (const InternalProtocolImplementation *)&FTPProtocol::kCFFTPProtocolCBs;
}

@end