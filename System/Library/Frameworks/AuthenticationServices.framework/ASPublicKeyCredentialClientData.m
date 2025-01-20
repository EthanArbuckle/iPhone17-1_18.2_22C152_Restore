@interface ASPublicKeyCredentialClientData
- (ASPublicKeyCredentialClientData)initWithChallenge:(NSData *)challenge origin:(NSString *)origin;
- (ASPublicKeyCredentialClientDataCrossOriginValue)crossOrigin;
- (NSData)challenge;
- (NSString)origin;
- (NSString)topOrigin;
- (id)jsonForOperationType:(unint64_t)a3;
- (void)setChallenge:(NSData *)challenge;
- (void)setCrossOrigin:(ASPublicKeyCredentialClientDataCrossOriginValue)crossOrigin;
- (void)setOrigin:(NSString *)origin;
- (void)setTopOrigin:(NSString *)topOrigin;
@end

@implementation ASPublicKeyCredentialClientData

- (ASPublicKeyCredentialClientData)initWithChallenge:(NSData *)challenge origin:(NSString *)origin
{
  v6 = challenge;
  v7 = origin;
  v15.receiver = self;
  v15.super_class = (Class)ASPublicKeyCredentialClientData;
  v8 = [(ASPublicKeyCredentialClientData *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [(NSData *)v6 copy];
    v10 = v8->_challenge;
    v8->_challenge = (NSData *)v9;

    uint64_t v11 = [(NSString *)v7 copy];
    v12 = v8->_origin;
    v8->_origin = (NSString *)v11;

    v13 = v8;
  }

  return v8;
}

- (NSData)challenge
{
  return self->_challenge;
}

- (void)setChallenge:(NSData *)challenge
{
}

- (NSString)origin
{
  return self->_origin;
}

- (void)setOrigin:(NSString *)origin
{
}

- (NSString)topOrigin
{
  return self->_topOrigin;
}

- (void)setTopOrigin:(NSString *)topOrigin
{
}

- (ASPublicKeyCredentialClientDataCrossOriginValue)crossOrigin
{
  return self->_crossOrigin;
}

- (void)setCrossOrigin:(ASPublicKeyCredentialClientDataCrossOriginValue)crossOrigin
{
  self->_crossOrigin = crossOrigin;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topOrigin, 0);
  objc_storeStrong((id *)&self->_origin, 0);

  objc_storeStrong((id *)&self->_challenge, 0);
}

- (id)jsonForOperationType:(unint64_t)a3
{
  v4 = self;
  uint64_t v5 = sub_21920738C(a3);
  unint64_t v7 = v6;

  if (v7 >> 60 == 15)
  {
    v8 = 0;
  }
  else
  {
    v8 = (void *)sub_21922ADF8();
    sub_2191E4B04(v5, v7);
  }

  return v8;
}

@end