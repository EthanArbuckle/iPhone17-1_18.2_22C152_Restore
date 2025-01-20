@interface KVACTestServer
- (BOOL)verifyWithPresentationData:(id)a3 tokenChallenge:(id)a4;
- (KVACTestServer)init;
- (NSData)keyId;
- (_TtC16CryptoKitPrivate10KVACServer)server;
- (id)issueWithRequestData:(id)a3 error:(id *)a4;
@end

@implementation KVACTestServer

- (KVACTestServer)init
{
  v8.receiver = self;
  v8.super_class = (Class)KVACTestServer;
  v2 = [(KVACTestServer *)&v8 init];
  if (v2)
  {
    v3 = objc_alloc_init(_TtC16CryptoKitPrivate10KVACServer);
    server = v2->_server;
    v2->_server = v3;

    uint64_t v5 = [(KVACServer *)v2->_server keyId];
    keyId = v2->_keyId;
    v2->_keyId = (NSData *)v5;
  }
  return v2;
}

- (id)issueWithRequestData:(id)a3 error:(id *)a4
{
  uint64_t v5 = -[KVACServer issueWithRequestData:error:](self->_server, "issueWithRequestData:error:", a3);
  if (v5)
  {
    v6 = [[KVACIssuance alloc] initWithIssuance:v5];
  }
  else
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.cryptokit.KVAC.error" code:1 userInfo:0];
    v6 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (BOOL)verifyWithPresentationData:(id)a3 tokenChallenge:(id)a4
{
  return [(KVACServer *)self->_server verifyWithPresentationData:a3 tokenChallenge:a4];
}

- (NSData)keyId
{
  return self->_keyId;
}

- (_TtC16CryptoKitPrivate10KVACServer)server
{
  return self->_server;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_keyId, 0);
}

@end