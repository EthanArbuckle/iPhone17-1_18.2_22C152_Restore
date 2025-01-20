@interface ATHMTestServer
- (ATHMTestServer)initWithError:(id *)a3;
- (NSData)keyCommitmentsData;
- (_TtC16CryptoKitPrivate10ATHMServer)server;
- (id)readBitWithPresentationData:(id)a3 error:(id *)a4;
- (id)respondWithRequestData:(id)a3 b:(id)a4 error:(id *)a5;
@end

@implementation ATHMTestServer

- (ATHMTestServer)initWithError:(id *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)ATHMTestServer;
  v4 = [(ATHMTestServer *)&v10 init];
  if (v4)
  {
    v5 = objc_alloc_init(_TtC16CryptoKitPrivate10ATHMServer);
    server = v4->_server;
    v4->_server = v5;

    uint64_t v7 = [(ATHMServer *)v4->_server exportKeyCommitmentsAndReturnError:a3];
    keyCommitmentsData = v4->_keyCommitmentsData;
    v4->_keyCommitmentsData = (NSData *)v7;
  }
  return v4;
}

- (id)respondWithRequestData:(id)a3 b:(id)a4 error:(id *)a5
{
  v6 = -[ATHMServer respondWithRequestData:b:error:](self->_server, "respondWithRequestData:b:error:", a3, a4);
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.cryptokit.ATHM.error" code:1 userInfo:0];
  }

  return v7;
}

- (id)readBitWithPresentationData:(id)a3 error:(id *)a4
{
  return [(ATHMServer *)self->_server readBitWithPresentationData:a3 error:a4];
}

- (NSData)keyCommitmentsData
{
  return self->_keyCommitmentsData;
}

- (_TtC16CryptoKitPrivate10ATHMServer)server
{
  return self->_server;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_keyCommitmentsData, 0);
}

@end