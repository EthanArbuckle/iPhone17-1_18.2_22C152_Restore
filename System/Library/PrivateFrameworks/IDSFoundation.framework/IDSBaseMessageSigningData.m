@interface IDSBaseMessageSigningData
- (IDSBaseMessageSigningData)initWithSHA256Digest:(id)a3 requestBody:(id)a4 serverTimestamp:(id)a5;
- (NSData)requestBody;
- (NSData)sha256Digest;
- (NSNumber)serverTimestamp;
@end

@implementation IDSBaseMessageSigningData

- (IDSBaseMessageSigningData)initWithSHA256Digest:(id)a3 requestBody:(id)a4 serverTimestamp:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)IDSBaseMessageSigningData;
  v12 = [(IDSBaseMessageSigningData *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sha256Digest, a3);
    objc_storeStrong((id *)&v13->_requestBody, a4);
    objc_storeStrong((id *)&v13->_serverTimestamp, a5);
  }

  return v13;
}

- (NSData)sha256Digest
{
  return self->_sha256Digest;
}

- (NSData)requestBody
{
  return self->_requestBody;
}

- (NSNumber)serverTimestamp
{
  return self->_serverTimestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverTimestamp, 0);
  objc_storeStrong((id *)&self->_requestBody, 0);
  objc_storeStrong((id *)&self->_sha256Digest, 0);
}

@end