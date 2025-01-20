@interface ATHMAwaitingActivation
+ (BOOL)verifyKeyCommitmentsData:(id)a3;
- (ATHMAwaitingActivation)initWithKeyCommitmentsData:(id)a3 error:(id *)a4;
- (NSData)requestData;
- (_TtC16CryptoKitPrivate10ATHMClient)client;
- (id)activateWithResponseData:(id)a3 error:(id *)a4;
@end

@implementation ATHMAwaitingActivation

- (ATHMAwaitingActivation)initWithKeyCommitmentsData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ATHMAwaitingActivation;
  v7 = [(ATHMAwaitingActivation *)&v14 init];
  if (v7)
  {
    v8 = [[_TtC16CryptoKitPrivate10ATHMClient alloc] initWithKeyCommitmentsData:v6 error:a4];
    client = v7->_client;
    v7->_client = v8;

    uint64_t v10 = [(ATHMClient *)v7->_client request];
    requestData = v7->_requestData;
    v7->_requestData = (NSData *)v10;

    v12 = v7;
  }
  else
  {
    *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.cryptokit.ATHM.error" code:0 userInfo:0];
  }

  return v7;
}

- (id)activateWithResponseData:(id)a3 error:(id *)a4
{
  v5 = -[ATHMClient finalizeWithResponseData:error:](self->_client, "finalizeWithResponseData:error:", a3);
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.cryptokit.ATHM.error" code:2 userInfo:0];
  }

  return v6;
}

+ (BOOL)verifyKeyCommitmentsData:(id)a3
{
  return +[ATHMKeyCommitments verifyWithKeyCommitmentsData:a3];
}

- (NSData)requestData
{
  return self->_requestData;
}

- (_TtC16CryptoKitPrivate10ATHMClient)client
{
  return self->_client;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_requestData, 0);
}

@end