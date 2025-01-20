@interface DIIdentityProofingSession
- (DIIdentityProofingSession)init;
- (_TtC7CoreIDV23IdentityProofingSession)proofingSession;
- (void)cancelProofingWithState:(id)a3 country:(id)a4 completion:(id)a5;
- (void)setProofingSession:(id)a3;
@end

@implementation DIIdentityProofingSession

- (DIIdentityProofingSession)init
{
  v5.receiver = self;
  v5.super_class = (Class)DIIdentityProofingSession;
  v2 = [(DIIdentityProofingSession *)&v5 init];
  if (v2)
  {
    v3 = objc_alloc_init(_TtC7CoreIDV23IdentityProofingSession);
    [(DIIdentityProofingSession *)v2 setProofingSession:v3];
  }
  return v2;
}

- (void)cancelProofingWithState:(id)a3 country:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(DIIdentityProofingSession *)self proofingSession];
  [v11 cancelProofingWithState:v10 country:v9 completionHandler:v8];
}

- (_TtC7CoreIDV23IdentityProofingSession)proofingSession
{
  return self->_proofingSession;
}

- (void)setProofingSession:(id)a3
{
}

- (void).cxx_destruct
{
}

@end