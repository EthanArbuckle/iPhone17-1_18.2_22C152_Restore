@interface UARPProductGroupCHIP
- (UARPProductGroupCHIP)initWithVendorID:(unsigned __int16)a3;
@end

@implementation UARPProductGroupCHIP

- (UARPProductGroupCHIP)initWithVendorID:(unsigned __int16)a3
{
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"%u", a3);
  v7.receiver = self;
  v7.super_class = (Class)UARPProductGroupCHIP;
  v5 = [(UARPProductGroup *)&v7 initWithIdentifier:v4];

  return v5;
}

@end