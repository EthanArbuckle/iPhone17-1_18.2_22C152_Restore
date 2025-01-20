@interface GTCaptureRequestToken
- (GTCaptureRequestToken)initWithCaptureService:(id)a3 andTokenId:(unint64_t)a4;
- (id)description;
- (unint64_t)tokenId;
- (void)completed;
- (void)waitUntilCompleted;
@end

@implementation GTCaptureRequestToken

- (GTCaptureRequestToken)initWithCaptureService:(id)a3 andTokenId:(unint64_t)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GTCaptureRequestToken;
  v8 = [(GTCaptureRequestToken *)&v13 init];
  if (v8)
  {
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    finished = v8->_finished;
    v8->_finished = (OS_dispatch_semaphore *)v9;

    v8->_tokenId = a4;
    objc_storeStrong((id *)&v8->_service, a3);
    v11 = v8;
  }

  return v8;
}

- (id)description
{
  v2 = NSString;
  v6.receiver = self;
  v6.super_class = (Class)GTCaptureRequestToken;
  v3 = [(GTCaptureRequestToken *)&v6 self];
  v4 = [v2 stringWithFormat:@"%@", v3];

  return v4;
}

- (void)completed
{
}

- (void)waitUntilCompleted
{
}

- (unint64_t)tokenId
{
  return self->_tokenId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_finished, 0);
}

@end