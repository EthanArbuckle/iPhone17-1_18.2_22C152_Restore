@interface CTCellularPlanPendingTransfer
+ (BOOL)supportsSecureCoding;
- (CTCellularPlanPendingTransfer)init;
- (CTCellularPlanPendingTransfer)initWithCoder:(id)a3;
- (CTUserLabel)planLabel;
- (NSString)carrierName;
- (NSString)countryCode;
- (NSString)deviceName;
- (NSString)phoneNumber;
- (NSString)sourceIccid;
- (id)description;
- (int64_t)status;
- (void)encodeWithCoder:(id)a3;
- (void)setCarrierName:(id)a3;
- (void)setCountryCode:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setPhoneNumber:(id)a3;
- (void)setPlanLabel:(id)a3;
- (void)setSourceIccid:(id)a3;
- (void)setStatus:(int64_t)a3;
@end

@implementation CTCellularPlanPendingTransfer

- (CTCellularPlanPendingTransfer)init
{
  v5.receiver = self;
  v5.super_class = (Class)CTCellularPlanPendingTransfer;
  v2 = [(CTCellularPlanPendingTransfer *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(CTCellularPlanPendingTransfer *)v2 setSourceIccid:0];
    [(CTCellularPlanPendingTransfer *)v3 setCarrierName:0];
    [(CTCellularPlanPendingTransfer *)v3 setDeviceName:0];
    [(CTCellularPlanPendingTransfer *)v3 setPlanLabel:0];
    [(CTCellularPlanPendingTransfer *)v3 setPhoneNumber:0];
    [(CTCellularPlanPendingTransfer *)v3 setCountryCode:0];
    [(CTCellularPlanPendingTransfer *)v3 setStatus:0];
  }
  return v3;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTCellularPlanPendingTransfer *)self sourceIccid];
  [v3 appendFormat:@", sourceIccid=%@", v4];

  objc_super v5 = [(CTCellularPlanPendingTransfer *)self carrierName];
  [v3 appendFormat:@", carrierName=%@", v5];

  v6 = [(CTCellularPlanPendingTransfer *)self deviceName];
  [v3 appendFormat:@", deviceName=%@", v6];

  v7 = [(CTCellularPlanPendingTransfer *)self planLabel];
  [v3 appendFormat:@", planLabel=%@", v7];

  v8 = [(CTCellularPlanPendingTransfer *)self phoneNumber];
  [v3 appendFormat:@", phoneNumber=%@", v8];

  v9 = [(CTCellularPlanPendingTransfer *)self countryCode];
  [v3 appendFormat:@", countryCode=%@", v9];

  [v3 appendFormat:@", status=%s", CTCellularPlanPendingTransferStatusAsString(-[CTCellularPlanPendingTransfer status](self, "status"))];
  [v3 appendString:@">"];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  v4 = [(CTCellularPlanPendingTransfer *)self sourceIccid];
  [v10 encodeObject:v4 forKey:@"iccid"];

  objc_super v5 = [(CTCellularPlanPendingTransfer *)self carrierName];
  [v10 encodeObject:v5 forKey:@"carrierName"];

  v6 = [(CTCellularPlanPendingTransfer *)self deviceName];
  [v10 encodeObject:v6 forKey:@"deviceName"];

  v7 = [(CTCellularPlanPendingTransfer *)self planLabel];
  [v10 encodeObject:v7 forKey:@"label"];

  v8 = [(CTCellularPlanPendingTransfer *)self phoneNumber];
  [v10 encodeObject:v8 forKey:@"phoneNumber"];

  v9 = [(CTCellularPlanPendingTransfer *)self countryCode];
  [v10 encodeObject:v9 forKey:@"countryCode"];

  objc_msgSend(v10, "encodeInteger:forKey:", -[CTCellularPlanPendingTransfer status](self, "status"), @"status");
}

- (CTCellularPlanPendingTransfer)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTCellularPlanPendingTransfer;
  objc_super v5 = [(CTCellularPlanPendingTransfer *)&v13 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iccid"];
    [(CTCellularPlanPendingTransfer *)v5 setSourceIccid:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"carrierName"];
    [(CTCellularPlanPendingTransfer *)v5 setCarrierName:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceName"];
    [(CTCellularPlanPendingTransfer *)v5 setDeviceName:v8];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"label"];
    [(CTCellularPlanPendingTransfer *)v5 setPlanLabel:v9];

    id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phoneNumber"];
    [(CTCellularPlanPendingTransfer *)v5 setPhoneNumber:v10];

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"countryCode"];
    [(CTCellularPlanPendingTransfer *)v5 setCountryCode:v11];

    -[CTCellularPlanPendingTransfer setStatus:](v5, "setStatus:", [v4 decodeIntegerForKey:@"status"]);
  }

  return v5;
}

- (NSString)sourceIccid
{
  return self->_sourceIccid;
}

- (void)setSourceIccid:(id)a3
{
}

- (NSString)carrierName
{
  return self->_carrierName;
}

- (void)setCarrierName:(id)a3
{
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (CTUserLabel)planLabel
{
  return self->_planLabel;
}

- (void)setPlanLabel:(id)a3
{
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_planLabel, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_carrierName, 0);
  objc_storeStrong((id *)&self->_sourceIccid, 0);
}

@end