@interface NFCVASResponse
- (NFCVASErrorCode)status;
- (NFCVASResponse)init;
- (NFCVASResponse)initWithStatus:(int64_t)a3 data:(id)a4 mobileToken:(id)a5;
- (NSData)mobileToken;
- (NSData)vasData;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation NFCVASResponse

- (NFCVASResponse)init
{
  v3 = objc_opt_new();
  v4 = objc_opt_new();
  v5 = [(NFCVASResponse *)self initWithStatus:0 data:v3 mobileToken:v4];

  return v5;
}

- (NFCVASResponse)initWithStatus:(int64_t)a3 data:(id)a4 mobileToken:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)NFCVASResponse;
  v11 = [(NFCVASResponse *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_status = a3;
    objc_storeStrong((id *)&v11->_vasData, a4);
    objc_storeStrong((id *)&v12->_mobileToken, a5);
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  int64_t status = self->_status;
  vasData = self->_vasData;
  mobileToken = self->_mobileToken;

  return (id)[v4 initWithStatus:status data:vasData mobileToken:mobileToken];
}

- (NFCVASErrorCode)status
{
  return self->_status;
}

- (NSData)vasData
{
  return self->_vasData;
}

- (NSData)mobileToken
{
  return self->_mobileToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mobileToken, 0);

  objc_storeStrong((id *)&self->_vasData, 0);
}

@end