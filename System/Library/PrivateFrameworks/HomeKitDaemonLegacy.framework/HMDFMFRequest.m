@interface HMDFMFRequest
- (FMFSession)fmfSession;
- (HMDFMFRequest)initWithResponseTimerDelegate:(id)a3;
- (HMFTimer)fmfSessionResponseTimer;
- (NSString)requestID;
- (id)description;
@end

@implementation HMDFMFRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fmfSessionResponseTimer, 0);
  objc_storeStrong((id *)&self->_fmfSession, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
}

- (HMFTimer)fmfSessionResponseTimer
{
  return self->_fmfSessionResponseTimer;
}

- (FMFSession)fmfSession
{
  return self->_fmfSession;
}

- (NSString)requestID
{
  return self->_requestID;
}

- (id)description
{
  v2 = NSString;
  v3 = [(HMDFMFRequest *)self requestID];
  v4 = [v2 stringWithFormat:@"[FMF-Request: %@]", v3];

  return v4;
}

- (HMDFMFRequest)initWithResponseTimerDelegate:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HMDFMFRequest;
  v5 = [(HMDFMFRequest *)&v14 init];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v7 = [v6 UUIDString];
    requestID = v5->_requestID;
    v5->_requestID = (NSString *)v7;

    v9 = (FMFSession *)objc_alloc_init(MEMORY[0x1E4F615B0]);
    fmfSession = v5->_fmfSession;
    v5->_fmfSession = v9;

    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:1 options:10.0];
    fmfSessionResponseTimer = v5->_fmfSessionResponseTimer;
    v5->_fmfSessionResponseTimer = (HMFTimer *)v11;

    [(HMFTimer *)v5->_fmfSessionResponseTimer setDelegate:v4];
  }

  return v5;
}

@end