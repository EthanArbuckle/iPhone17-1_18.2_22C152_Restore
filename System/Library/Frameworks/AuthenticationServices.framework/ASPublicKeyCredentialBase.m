@interface ASPublicKeyCredentialBase
+ (BOOL)supportsSecureCoding;
- (ASPublicKeyCredentialBase)initWithCoder:(id)a3;
- (ASPublicKeyCredentialBase)initWithCredentialID:(id)a3 rawClientDataJSON:(id)a4 attachment:(int64_t)a5;
- (NSData)credentialID;
- (NSData)rawClientDataJSON;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)attachment;
- (void)encodeWithCoder:(id)a3;
- (void)setAttachment:(int64_t)a3;
@end

@implementation ASPublicKeyCredentialBase

- (ASPublicKeyCredentialBase)initWithCredentialID:(id)a3 rawClientDataJSON:(id)a4 attachment:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ASPublicKeyCredentialBase;
  v10 = [(ASPublicKeyCredentialBase *)&v17 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    credentialID = v10->_credentialID;
    v10->_credentialID = (NSData *)v11;

    uint64_t v13 = [v9 copy];
    rawClientDataJSON = v10->_rawClientDataJSON;
    v10->_rawClientDataJSON = (NSData *)v13;

    v10->_attachment = a5;
    v15 = v10;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  rawClientDataJSON = self->_rawClientDataJSON;
  credentialID = self->_credentialID;
  int64_t attachment = self->_attachment;

  return (id)[v4 initWithCredentialID:credentialID rawClientDataJSON:rawClientDataJSON attachment:attachment];
}

- (void)encodeWithCoder:(id)a3
{
  credentialID = self->_credentialID;
  id v5 = a3;
  [v5 encodeObject:credentialID forKey:@"credentialID"];
  [v5 encodeObject:self->_rawClientDataJSON forKey:@"rawClientDataJSON"];
  [v5 encodeInteger:self->_attachment forKey:@"attachment"];
}

- (ASPublicKeyCredentialBase)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"credentialID"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rawClientDataJSON"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"attachment"];

  id v8 = [(ASPublicKeyCredentialBase *)self initWithCredentialID:v5 rawClientDataJSON:v6 attachment:v7];
  return v8;
}

- (NSData)rawClientDataJSON
{
  return self->_rawClientDataJSON;
}

- (NSData)credentialID
{
  return self->_credentialID;
}

- (int64_t)attachment
{
  return self->_attachment;
}

- (void)setAttachment:(int64_t)a3
{
  self->_int64_t attachment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentialID, 0);

  objc_storeStrong((id *)&self->_rawClientDataJSON, 0);
}

@end