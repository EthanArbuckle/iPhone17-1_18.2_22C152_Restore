@interface HMDFMFQuery
- (HMDFMFQuery)initWithResponseQueue:(id)a3 completion:(id)a4;
- (NSString)queryID;
- (OS_dispatch_queue)responseQueue;
- (id)completion;
- (id)description;
@end

@implementation HMDFMFQuery

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_responseQueue, 0);
  objc_storeStrong((id *)&self->_queryID, 0);
}

- (id)completion
{
  return self->_completion;
}

- (OS_dispatch_queue)responseQueue
{
  return self->_responseQueue;
}

- (NSString)queryID
{
  return self->_queryID;
}

- (id)description
{
  v2 = NSString;
  v3 = [(HMDFMFQuery *)self queryID];
  v4 = [v2 stringWithFormat:@"[FMF-Query: %@]", v3];

  return v4;
}

- (HMDFMFQuery)initWithResponseQueue:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HMDFMFQuery;
  v9 = [(HMDFMFQuery *)&v16 init];
  if (v9)
  {
    v10 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v11 = [v10 UUIDString];
    queryID = v9->_queryID;
    v9->_queryID = (NSString *)v11;

    objc_storeStrong((id *)&v9->_responseQueue, a3);
    v13 = _Block_copy(v8);
    id completion = v9->_completion;
    v9->_id completion = v13;
  }
  return v9;
}

@end