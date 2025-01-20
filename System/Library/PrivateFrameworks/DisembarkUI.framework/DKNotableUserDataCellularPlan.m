@interface DKNotableUserDataCellularPlan
- (BOOL)isTransferred;
- (DKNotableUserDataCellularPlan)initWithCarrierName:(id)a3 phoneNumber:(id)a4 isTransferred:(BOOL)a5;
- (NSString)carrierName;
- (NSString)phoneNumber;
- (void)setCarrierName:(id)a3;
- (void)setIsTransferred:(BOOL)a3;
- (void)setPhoneNumber:(id)a3;
@end

@implementation DKNotableUserDataCellularPlan

- (DKNotableUserDataCellularPlan)initWithCarrierName:(id)a3 phoneNumber:(id)a4 isTransferred:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DKNotableUserDataCellularPlan;
  v11 = [(DKNotableUserDataCellularPlan *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_carrierName, a3);
    objc_storeStrong((id *)&v12->_phoneNumber, a4);
    v12->_isTransferred = a5;
  }

  return v12;
}

- (NSString)carrierName
{
  return self->_carrierName;
}

- (void)setCarrierName:(id)a3
{
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
}

- (BOOL)isTransferred
{
  return self->_isTransferred;
}

- (void)setIsTransferred:(BOOL)a3
{
  self->_isTransferred = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_carrierName, 0);
}

@end