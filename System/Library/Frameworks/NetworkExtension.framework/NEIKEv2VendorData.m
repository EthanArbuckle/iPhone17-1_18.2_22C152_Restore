@interface NEIKEv2VendorData
- (NSData)vendorData;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setVendorData:(id)a3;
@end

@implementation NEIKEv2VendorData

- (void).cxx_destruct
{
}

- (void)setVendorData:(id)a3
{
}

- (NSData)vendorData
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(NEIKEv2VendorData *)self vendorData];
  v6 = (void *)[v5 copy];
  [v4 setVendorData:v6];

  return v4;
}

@end