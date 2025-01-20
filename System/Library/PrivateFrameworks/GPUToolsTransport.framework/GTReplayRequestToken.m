@interface GTReplayRequestToken
- (BOOL)cancel;
- (BOOL)pause;
- (BOOL)resume;
- (GTReplayRequestToken)initWithService:(id)a3 andTokenId:(unint64_t)a4;
- (unint64_t)tokenId;
- (void)completed;
- (void)waitUntilCompleted;
@end

@implementation GTReplayRequestToken

- (GTReplayRequestToken)initWithService:(id)a3 andTokenId:(unint64_t)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GTReplayRequestToken;
  v8 = [(GTReplayRequestToken *)&v13 init];
  if (v8)
  {
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    finished = v8->_finished;
    v8->_finished = (OS_dispatch_semaphore *)v9;

    v8->_tokenId = a4;
    objc_storeStrong((id *)&v8->_replayer, a3);
    v11 = v8;
  }

  return v8;
}

- (void)completed
{
}

- (void)waitUntilCompleted
{
}

- (BOOL)cancel
{
  return [(GTMTLReplayService *)self->_replayer cancel:self->_tokenId];
}

- (BOOL)pause
{
  return [(GTMTLReplayService *)self->_replayer pause:self->_tokenId];
}

- (BOOL)resume
{
  return [(GTMTLReplayService *)self->_replayer resume:self->_tokenId];
}

- (unint64_t)tokenId
{
  return self->_tokenId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replayer, 0);
  objc_storeStrong((id *)&self->_finished, 0);
}

@end