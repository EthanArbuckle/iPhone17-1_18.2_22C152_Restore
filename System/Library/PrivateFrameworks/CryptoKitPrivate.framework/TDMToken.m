@interface TDMToken
- (TDMToken)initWithTID:(id)a3;
- (_TtC16CryptoKitPrivate9TDMClient)tdmClient;
- (id)blindedElement;
- (id)finalizeWithEvaluatedElement:(id)a3 proof:(id)a4 publicKey:(id)a5 fsr:(id)a6 error:(id *)a7;
@end

@implementation TDMToken

- (TDMToken)initWithTID:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TDMToken;
  v5 = [(TDMToken *)&v9 init];
  if (v5)
  {
    v6 = [[_TtC16CryptoKitPrivate9TDMClient alloc] initWithTID:v4];
    tdmClient = v5->_tdmClient;
    v5->_tdmClient = v6;
  }
  return v5;
}

- (id)blindedElement
{
  return [(TDMClient *)self->_tdmClient blindedElement];
}

- (id)finalizeWithEvaluatedElement:(id)a3 proof:(id)a4 publicKey:(id)a5 fsr:(id)a6 error:(id *)a7
{
  return [(TDMClient *)self->_tdmClient finalizeWithFSR:a6 evaluatedElement:a3 proof:a4 publicKey:a5 error:a7];
}

- (_TtC16CryptoKitPrivate9TDMClient)tdmClient
{
  return self->_tdmClient;
}

- (void).cxx_destruct
{
}

@end