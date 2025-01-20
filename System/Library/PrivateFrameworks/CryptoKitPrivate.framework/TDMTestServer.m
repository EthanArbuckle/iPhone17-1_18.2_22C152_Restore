@interface TDMTestServer
- (BOOL)validateOutput:(id)a3 TID:(id)a4;
- (TDMTestServer)init;
- (_TtC16CryptoKitPrivate9TDMServer)tdmServer;
- (id)FSR;
- (id)evaluate:(id)a3 error:(id *)a4;
- (id)publicKey;
@end

@implementation TDMTestServer

- (id)publicKey
{
  return [(TDMServer *)self->_tdmServer publicKey];
}

- (TDMTestServer)init
{
  v6.receiver = self;
  v6.super_class = (Class)TDMTestServer;
  v2 = [(TDMTestServer *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(_TtC16CryptoKitPrivate9TDMServer);
    tdmServer = v2->_tdmServer;
    v2->_tdmServer = v3;
  }
  return v2;
}

- (id)evaluate:(id)a3 error:(id *)a4
{
  v4 = [(TDMServer *)self->_tdmServer evaluateWithBlindedElement:a3 error:a4];
  if (v4)
  {
    v5 = [TDMEvaluation alloc];
    objc_super v6 = [v4 evaluatedElement];
    v7 = [v4 proof];
    v8 = [(TDMEvaluation *)v5 initWithEvaluatedElement:v6 proof:v7];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)FSR
{
  return [(TDMServer *)self->_tdmServer info];
}

- (BOOL)validateOutput:(id)a3 TID:(id)a4
{
  tdmServer = self->_tdmServer;
  id v7 = a4;
  id v8 = a3;
  v9 = [(TDMTestServer *)self FSR];
  LOBYTE(tdmServer) = [(TDMServer *)tdmServer verifyTokenWithOutput:v8 TID:v7 FSR:v9];

  return (char)tdmServer;
}

- (_TtC16CryptoKitPrivate9TDMServer)tdmServer
{
  return self->_tdmServer;
}

- (void).cxx_destruct
{
}

@end