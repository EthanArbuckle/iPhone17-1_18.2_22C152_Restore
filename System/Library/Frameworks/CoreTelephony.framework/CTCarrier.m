@interface CTCarrier
- (BOOL)allowsVOIP;
- (BOOL)isEqual:(id)a3;
- (CTCarrier)init;
- (NSString)carrierName;
- (NSString)isoCountryCode;
- (NSString)mobileCountryCode;
- (NSString)mobileNetworkCode;
- (id)description;
- (void)setAllowsVOIP:(BOOL)a3;
- (void)setCarrierName:(id)a3;
- (void)setIsoCountryCode:(id)a3;
- (void)setMobileCountryCode:(id)a3;
- (void)setMobileNetworkCode:(id)a3;
@end

@implementation CTCarrier

- (id)description
{
  if (self->_carrierName) {
    carrierName = (__CFString *)self->_carrierName;
  }
  else {
    carrierName = @"<nil>";
  }
  if (self->_mobileCountryCode) {
    mobileCountryCode = (__CFString *)self->_mobileCountryCode;
  }
  else {
    mobileCountryCode = @"<nil>";
  }
  mobileNetworkCode = (__CFString *)self->_mobileNetworkCode;
  if (!mobileNetworkCode) {
    mobileNetworkCode = @"<nil>";
  }
  if (self->_isoCountryCode) {
    isoCountryCode = (__CFString *)self->_isoCountryCode;
  }
  else {
    isoCountryCode = @"<nil>";
  }
  v7 = NSString;
  if (self->_allowsVOIP) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  v9 = mobileNetworkCode;
  v10 = mobileCountryCode;
  v11 = carrierName;
  v12 = [v7 stringWithFormat:@"CTCarrier (%p) {\n\tCarrier name: [%@]\n\tMobile Country Code: [%@]\n\tMobile Network Code:[%@]\n\tISO Country Code:[%@]\n\tAllows VOIP? [%@]\n}\n", self, v11, v10, v9, isoCountryCode, v8];

  return v12;
}

- (CTCarrier)init
{
  v9.receiver = self;
  v9.super_class = (Class)CTCarrier;
  v2 = [(CTCarrier *)&v9 init];
  v3 = v2;
  if (v2)
  {
    carrierName = v2->_carrierName;
    v2->_carrierName = (NSString *)@"--";

    mobileCountryCode = v3->_mobileCountryCode;
    v3->_mobileCountryCode = (NSString *)@"65535";

    mobileNetworkCode = v3->_mobileNetworkCode;
    v3->_mobileNetworkCode = (NSString *)@"65535";

    isoCountryCode = v3->_isoCountryCode;
    v3->_isoCountryCode = (NSString *)@"--";

    v3->_allowsVOIP = 1;
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTCarrier *)a3;
  if (self == v4)
  {
    char v14 = 1;
  }
  else if ([(CTCarrier *)v4 isMemberOfClass:objc_opt_class()] {
         && (BOOL allowsVOIP = self->_allowsVOIP, allowsVOIP == [(CTCarrier *)v4 allowsVOIP]))
  }
  {
    carrierName = self->_carrierName;
    v7 = [(CTCarrier *)v4 carrierName];
    if ([(NSString *)carrierName isEqualToString:v7])
    {
      mobileNetworkCode = self->_mobileNetworkCode;
      objc_super v9 = [(CTCarrier *)v4 mobileNetworkCode];
      if ([(NSString *)mobileNetworkCode isEqualToString:v9])
      {
        mobileCountryCode = self->_mobileCountryCode;
        v11 = [(CTCarrier *)v4 mobileCountryCode];
        if ([(NSString *)mobileCountryCode isEqualToString:v11])
        {
          isoCountryCode = self->_isoCountryCode;
          v13 = [(CTCarrier *)v4 isoCountryCode];
          char v14 = [(NSString *)isoCountryCode isEqualToString:v13];
        }
        else
        {
          char v14 = 0;
        }
      }
      else
      {
        char v14 = 0;
      }
    }
    else
    {
      char v14 = 0;
    }
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (NSString)carrierName
{
  return self->_carrierName;
}

- (void)setCarrierName:(id)a3
{
}

- (NSString)mobileCountryCode
{
  return self->_mobileCountryCode;
}

- (void)setMobileCountryCode:(id)a3
{
}

- (NSString)mobileNetworkCode
{
  return self->_mobileNetworkCode;
}

- (void)setMobileNetworkCode:(id)a3
{
}

- (NSString)isoCountryCode
{
  return self->_isoCountryCode;
}

- (void)setIsoCountryCode:(id)a3
{
}

- (BOOL)allowsVOIP
{
  return self->_allowsVOIP;
}

- (void)setAllowsVOIP:(BOOL)a3
{
  self->_BOOL allowsVOIP = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isoCountryCode, 0);
  objc_storeStrong((id *)&self->_mobileNetworkCode, 0);
  objc_storeStrong((id *)&self->_mobileCountryCode, 0);

  objc_storeStrong((id *)&self->_carrierName, 0);
}

@end