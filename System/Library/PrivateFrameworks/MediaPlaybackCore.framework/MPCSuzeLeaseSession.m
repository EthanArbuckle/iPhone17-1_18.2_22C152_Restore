@interface MPCSuzeLeaseSession
- (ICSuzeLeaseSession)icSuzeLeaseSession;
- (MPCSuzeLeaseSession)initWithICSuzeLeaseSession:(id)a3;
- (void)beginAutomaticallyRefreshingLease;
- (void)endAutomaticallyRefreshingLease;
@end

@implementation MPCSuzeLeaseSession

- (void).cxx_destruct
{
}

- (ICSuzeLeaseSession)icSuzeLeaseSession
{
  return self->_icSuzeLeaseSession;
}

- (void)endAutomaticallyRefreshingLease
{
}

- (void)beginAutomaticallyRefreshingLease
{
}

- (MPCSuzeLeaseSession)initWithICSuzeLeaseSession:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPCSuzeLeaseSession;
  v6 = [(MPCSuzeLeaseSession *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_icSuzeLeaseSession, a3);
  }

  return v7;
}

@end