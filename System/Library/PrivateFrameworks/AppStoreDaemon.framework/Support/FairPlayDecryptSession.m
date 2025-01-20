@interface FairPlayDecryptSession
- (void)dealloc;
@end

@implementation FairPlayDecryptSession

- (void)dealloc
{
  session = self->_session;
  if (session)
  {
    sub_1000FD3C0((uint64_t)session);
    self->_session = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)FairPlayDecryptSession;
  [(FairPlayDecryptSession *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verifier, 0);
  objc_storeStrong((id *)&self->_digest, 0);
}

@end