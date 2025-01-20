@interface MTRCommissionableBrowserResult
- (BOOL)commissioningMode;
- (NSMutableDictionary)interfaces;
- (NSNumber)discriminator;
- (NSNumber)productID;
- (NSNumber)vendorID;
- (NSString)instanceName;
- (Optional<chip::Controller::SetUpCodePairerParameters>)params;
- (id).cxx_construct;
- (void)setCommissioningMode:(BOOL)a3;
- (void)setDiscriminator:(id)a3;
- (void)setInstanceName:(id)a3;
- (void)setInterfaces:(id)a3;
- (void)setParams:(Optional<chip::Controller::SetUpCodePairerParameters>)a3;
- (void)setProductID:(id)a3;
- (void)setVendorID:(id)a3;
@end

@implementation MTRCommissionableBrowserResult

- (NSString)instanceName
{
  return self->_instanceName;
}

- (void)setInstanceName:(id)a3
{
}

- (NSNumber)vendorID
{
  return self->_vendorID;
}

- (void)setVendorID:(id)a3
{
}

- (NSNumber)productID
{
  return self->_productID;
}

- (void)setProductID:(id)a3
{
}

- (NSNumber)discriminator
{
  return self->_discriminator;
}

- (void)setDiscriminator:(id)a3
{
}

- (BOOL)commissioningMode
{
  return self->_commissioningMode;
}

- (void)setCommissioningMode:(BOOL)a3
{
  self->_commissioningMode = a3;
}

- (NSMutableDictionary)interfaces
{
  return self->_interfaces;
}

- (void)setInterfaces:(id)a3
{
}

- (Optional<chip::Controller::SetUpCodePairerParameters>)params
{
  sub_244C96F8C(v2, (unsigned __int8 *)&self->_params);
  return v3;
}

- (void)setParams:(Optional<chip::Controller::SetUpCodePairerParameters>)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interfaces, 0);
  objc_storeStrong((id *)&self->_discriminator, 0);
  objc_storeStrong((id *)&self->_productID, 0);
  objc_storeStrong((id *)&self->_vendorID, 0);

  objc_storeStrong((id *)&self->_instanceName, 0);
}

- (id).cxx_construct
{
  *((unsigned char *)self + 56) = 0;
  return self;
}

@end