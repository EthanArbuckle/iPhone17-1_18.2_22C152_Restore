@interface KVACAwaitingActivation
- (KVACAwaitingActivation)initWithTokenChallenge:(id)a3 error:(id *)a4;
- (NSData)requestData;
- (_TtC16CryptoKitPrivate10KVACClient)client;
- (_TtC16CryptoKitPrivate18KVACRequestWrapper)request;
- (id)activateWithIssuanceData:(id)a3 error:(id *)a4;
@end

@implementation KVACAwaitingActivation

- (KVACAwaitingActivation)initWithTokenChallenge:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)KVACAwaitingActivation;
  v7 = [(KVACAwaitingActivation *)&v17 init];
  if (v7)
  {
    v8 = [[_TtC16CryptoKitPrivate10KVACClient alloc] initWithTokenChallenge:v6 error:a4];
    client = v7->_client;
    v7->_client = v8;

    v10 = [(KVACClient *)v7->_client makeRequestAndReturnError:a4];
    if (!v10)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.cryptokit.KVAC.error" code:0 userInfo:0];
      v15 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    request = v7->_request;
    v7->_request = v10;
    v12 = v10;

    uint64_t v13 = [(KVACRequestWrapper *)v12 requestData];
    requestData = v7->_requestData;
    v7->_requestData = (NSData *)v13;
  }
  v15 = v7;
LABEL_6:

  return v15;
}

- (id)activateWithIssuanceData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [[KVACCredential alloc] initWithIssuanceData:v6 client:self->_client request:self->_request error:a4];

  if (!v7)
  {
    *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.cryptokit.KVAC.error" code:2 userInfo:0];
    goto LABEL_5;
  }
  v8 = [@"Test tag prefix" dataUsingEncoding:4];
  v9 = [[KVACPresentation alloc] initWithCredential:v7 tagPrefix:v8 error:a4];
  if (v9)
  {

LABEL_5:
    v10 = v7;
    goto LABEL_7;
  }
  *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.cryptokit.KVAC.error" code:2 userInfo:0];

  v10 = 0;
LABEL_7:

  return v10;
}

- (NSData)requestData
{
  return self->_requestData;
}

- (_TtC16CryptoKitPrivate10KVACClient)client
{
  return self->_client;
}

- (_TtC16CryptoKitPrivate18KVACRequestWrapper)request
{
  return self->_request;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_requestData, 0);
}

@end