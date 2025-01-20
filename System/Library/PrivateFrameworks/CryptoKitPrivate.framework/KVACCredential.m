@interface KVACCredential
- (KVACCredential)initWithCredentialData:(id)a3 error:(id *)a4;
- (KVACCredential)initWithIssuanceData:(id)a3 client:(id)a4 request:(id)a5 error:(id *)a6;
- (NSData)credentialData;
- (NSData)serverKeyId;
- (_TtC16CryptoKitPrivate21KVACCredentialWrapper)credential;
- (id)presentWithTagPrefix:(id)a3 error:(id *)a4;
@end

@implementation KVACCredential

- (KVACCredential)initWithIssuanceData:(id)a3 client:(id)a4 request:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v23.receiver = self;
  v23.super_class = (Class)KVACCredential;
  v13 = [(KVACCredential *)&v23 init];
  if (v13)
  {
    v14 = [[_TtC16CryptoKitPrivate19KVACIssuanceWrapper alloc] initWithIssuanceData:v10 error:a6];
    uint64_t v15 = [v11 makeCredentialWithIssuance:v14 request:v12 error:a6];
    credential = v13->_credential;
    v13->_credential = (_TtC16CryptoKitPrivate21KVACCredentialWrapper *)v15;

    if (!v14 || !v13->_credential)
    {
      *a6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.cryptokit.KVAC.error" code:2 userInfo:0];

      v21 = 0;
      goto LABEL_7;
    }
    uint64_t v17 = [(KVACIssuanceWrapper *)v14 keyId];
    serverKeyId = v13->_serverKeyId;
    v13->_serverKeyId = (NSData *)v17;

    uint64_t v19 = [(KVACCredentialWrapper *)v13->_credential credentialData];
    credentialData = v13->_credentialData;
    v13->_credentialData = (NSData *)v19;
  }
  v21 = v13;
LABEL_7:

  return v21;
}

- (KVACCredential)initWithCredentialData:(id)a3 error:(id *)a4
{
  id v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)KVACCredential;
  v8 = [(KVACCredential *)&v16 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_credentialData, a3);
    id v10 = [[_TtC16CryptoKitPrivate21KVACCredentialWrapper alloc] initWithCredentialData:v7 error:a4];
    credential = v9->_credential;
    v9->_credential = v10;

    uint64_t v12 = [(KVACCredentialWrapper *)v9->_credential serverKeyId];
    serverKeyId = v9->_serverKeyId;
    v9->_serverKeyId = (NSData *)v12;

    v14 = v9;
  }
  else
  {
    *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.cryptokit.KVAC.error" code:2 userInfo:0];
  }

  return v9;
}

- (id)presentWithTagPrefix:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [[KVACPresentation alloc] initWithCredential:self tagPrefix:v6 error:a4];

  return v7;
}

- (NSData)serverKeyId
{
  return self->_serverKeyId;
}

- (NSData)credentialData
{
  return self->_credentialData;
}

- (_TtC16CryptoKitPrivate21KVACCredentialWrapper)credential
{
  return self->_credential;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credential, 0);
  objc_storeStrong((id *)&self->_credentialData, 0);
  objc_storeStrong((id *)&self->_serverKeyId, 0);
}

@end