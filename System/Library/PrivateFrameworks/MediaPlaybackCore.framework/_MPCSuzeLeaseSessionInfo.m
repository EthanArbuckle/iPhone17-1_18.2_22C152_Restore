@interface _MPCSuzeLeaseSessionInfo
- (BOOL)shouldStopWhenFinished;
- (ICSuzeLeaseSession)icLeaseSession;
- (MPCSuzeLeaseSession)mpcLeaseSession;
- (_MPCSuzeLeaseSessionInfo)initWithICLeaseSession:(id)a3;
- (int64_t)clientCount;
- (void)setClientCount:(int64_t)a3;
- (void)setShouldStopWhenFinished:(BOOL)a3;
@end

@implementation _MPCSuzeLeaseSessionInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mpcLeaseSession, 0);

  objc_storeStrong((id *)&self->_icLeaseSession, 0);
}

- (void)setShouldStopWhenFinished:(BOOL)a3
{
  self->_shouldStopWhenFinished = a3;
}

- (BOOL)shouldStopWhenFinished
{
  return self->_shouldStopWhenFinished;
}

- (MPCSuzeLeaseSession)mpcLeaseSession
{
  return self->_mpcLeaseSession;
}

- (ICSuzeLeaseSession)icLeaseSession
{
  return self->_icLeaseSession;
}

- (void)setClientCount:(int64_t)a3
{
  self->_clientCount = a3;
}

- (int64_t)clientCount
{
  return self->_clientCount;
}

- (_MPCSuzeLeaseSessionInfo)initWithICLeaseSession:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_MPCSuzeLeaseSessionInfo;
  v6 = [(_MPCSuzeLeaseSessionInfo *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_icLeaseSession, a3);
    v8 = [[MPCSuzeLeaseSession alloc] initWithICSuzeLeaseSession:v7->_icLeaseSession];
    mpcLeaseSession = v7->_mpcLeaseSession;
    v7->_mpcLeaseSession = v8;
  }
  return v7;
}

@end