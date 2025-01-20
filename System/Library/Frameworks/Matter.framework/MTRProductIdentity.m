@interface MTRProductIdentity
- (MTRProductIdentity)initWithVendorID:(NSNumber *)vendorID productID:(NSNumber *)productID;
- (NSNumber)productID;
- (NSNumber)vendorID;
@end

@implementation MTRProductIdentity

- (MTRProductIdentity)initWithVendorID:(NSNumber *)vendorID productID:(NSNumber *)productID
{
  v7 = vendorID;
  v8 = productID;
  v12.receiver = self;
  v12.super_class = (Class)MTRProductIdentity;
  v9 = [(MTRProductIdentity *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_vendorID, vendorID);
    objc_storeStrong((id *)&v10->_productID, productID);
  }

  return v10;
}

- (NSNumber)vendorID
{
  return self->_vendorID;
}

- (NSNumber)productID
{
  return self->_productID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productID, 0);

  objc_storeStrong((id *)&self->_vendorID, 0);
}

@end