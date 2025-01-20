@interface IDSPublicIdentityData
- (IDSPublicIdentityData)initWithPublicLegacyIdentityData:(id)a3 publicNGMIdentityData:(id)a4 publicNGMPrekeyData:(id)a5 NGMVersion:(id)a6;
- (NSData)publicLegacyIdentityData;
- (NSData)publicNGMIdentityData;
- (NSData)publicNGMPrekeyData;
- (NSNumber)NGMVersion;
@end

@implementation IDSPublicIdentityData

- (IDSPublicIdentityData)initWithPublicLegacyIdentityData:(id)a3 publicNGMIdentityData:(id)a4 publicNGMPrekeyData:(id)a5 NGMVersion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)IDSPublicIdentityData;
  v15 = [(IDSPublicIdentityData *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_publicLegacyIdentityData, a3);
    objc_storeStrong((id *)&v16->_publicNGMIdentityData, a4);
    objc_storeStrong((id *)&v16->_publicNGMPrekeyData, a5);
    objc_storeStrong((id *)&v16->_NGMVersion, a6);
  }

  return v16;
}

- (NSData)publicLegacyIdentityData
{
  return self->_publicLegacyIdentityData;
}

- (NSData)publicNGMIdentityData
{
  return self->_publicNGMIdentityData;
}

- (NSData)publicNGMPrekeyData
{
  return self->_publicNGMPrekeyData;
}

- (NSNumber)NGMVersion
{
  return self->_NGMVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_NGMVersion, 0);
  objc_storeStrong((id *)&self->_publicNGMPrekeyData, 0);
  objc_storeStrong((id *)&self->_publicNGMIdentityData, 0);

  objc_storeStrong((id *)&self->_publicLegacyIdentityData, 0);
}

@end