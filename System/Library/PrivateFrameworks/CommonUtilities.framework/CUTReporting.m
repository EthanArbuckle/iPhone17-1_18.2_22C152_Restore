@interface CUTReporting
+ (id)RTCSessionPromiseWithBatchingInterval:(double)a3;
+ (id)_rtcReportingSession;
+ (id)reportingSession;
+ (void)startRTCReportingSessionWithCompletion:(id)a3;
- (CUTPromise)promise;
- (CUTReporting)init;
- (id)_RTCSessionPromiseWithBatchingInterval:(double)a3;
- (os_unfair_lock_s)promiseLock;
- (void)_beginPromiseTimeoutWithInterval:(int64_t)a3;
- (void)_failSeal:(id)a3 withError:(id)a4;
- (void)_fullfillSeal:(id)a3 withSession:(id)a4;
- (void)_startConfigurationOfSession:(id)a3 withPromiseSeal:(id)a4;
- (void)setPromise:(id)a3;
@end

@implementation CUTReporting

+ (id)reportingSession
{
  if (qword_1E95CDE58 != -1) {
    dispatch_once(&qword_1E95CDE58, &unk_1EF6C42A0);
  }
  v2 = (void *)qword_1E95CDE68;
  return v2;
}

- (CUTReporting)init
{
  v6.receiver = self;
  v6.super_class = (Class)CUTReporting;
  v2 = [(CUTReporting *)&v6 init];
  v3 = v2;
  if (v2)
  {
    promise = v2->_promise;
    v2->_promise = 0;

    v3->_promiseLock._os_unfair_lock_opaque = 0;
  }
  return v3;
}

+ (void)startRTCReportingSessionWithCompletion:(id)a3
{
  id v3 = a3;
  if (CUTIsInternalInstall())
  {
    v4 = sub_1A355C654();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1A355C6A8;
    block[3] = &unk_1E5AFEC38;
    id v6 = v3;
    dispatch_async(v4, block);
  }
  else
  {
    (*((void (**)(id, void))v3 + 2))(v3, 0);
  }
}

+ (id)RTCSessionPromiseWithBatchingInterval:(double)a3
{
  v4 = +[CUTReporting reportingSession];
  v5 = [v4 _RTCSessionPromiseWithBatchingInterval:a3];

  return v5;
}

- (id)_RTCSessionPromiseWithBatchingInterval:(double)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  p_promiseLock = &self->_promiseLock;
  os_unfair_lock_lock(&self->_promiseLock);
  promise = self->_promise;
  if (promise)
  {
    v7 = promise;
    os_unfair_lock_unlock(p_promiseLock);
  }
  else
  {
    v8 = [CUTPromiseSeal alloc];
    v9 = sub_1A355C654();
    v10 = [(CUTPromiseSeal *)v8 initWithQueue:v9];

    v7 = [(CUTPromiseSeal *)v10 promise];
    objc_storeStrong((id *)&self->_promise, v7);
    os_unfair_lock_unlock(p_promiseLock);
    if (v10)
    {
      [(CUTReporting *)self _beginPromiseTimeoutWithInterval:(uint64_t)a3];
      if (CUTIsInternalInstall())
      {
        v11 = +[CUTReporting _rtcReportingSession];
        if (v11)
        {
          [(CUTReporting *)self _startConfigurationOfSession:v11 withPromiseSeal:v10];
        }
        else
        {
          v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CUTReportingErrorDomain" code:2 userInfo:0];
          [(CUTReporting *)self _failSeal:v10 withError:v15];
        }
      }
      else
      {
        v12 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v17 = *MEMORY[0x1E4F28228];
        v18[0] = @"CUTReporting does not support non-internal builds.";
        v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
        v14 = [v12 errorWithDomain:@"CUTReportingErrorDomain" code:1 userInfo:v13];
        [(CUTReporting *)self _failSeal:v10 withError:v14];
      }
    }
  }
  return v7;
}

+ (id)_rtcReportingSession
{
  v23[4] = *MEMORY[0x1E4F143B8];
  if (qword_1E95CDDF0 != -1) {
    dispatch_once(&qword_1E95CDDF0, &unk_1EF6C4440);
  }
  v2 = (void *)qword_1E95CDDE8;
  if (qword_1E95CDDE8) {
    v2 = *(void **)qword_1E95CDDE8;
  }
  id v3 = v2;
  v22[0] = v3;
  v23[0] = &unk_1EF6C7168;
  if (qword_1E95CDE00 != -1) {
    dispatch_once(&qword_1E95CDE00, &unk_1EF6C4460);
  }
  v4 = (void *)qword_1E95CDDF8;
  if (qword_1E95CDDF8) {
    v4 = *(void **)qword_1E95CDDF8;
  }
  id v5 = v4;
  v22[1] = v5;
  v23[1] = &unk_1EF6C7180;
  if (qword_1E95CDE10 != -1) {
    dispatch_once(&qword_1E95CDE10, &unk_1EF6C4480);
  }
  id v6 = (void *)qword_1E95CDE08;
  if (qword_1E95CDE08) {
    id v6 = *(void **)qword_1E95CDE08;
  }
  id v7 = v6;
  v22[2] = v7;
  v23[2] = &unk_1EF6C7180;
  if (qword_1E95CDDE0 != -1) {
    dispatch_once(&qword_1E95CDDE0, &unk_1EF6C44C0);
  }
  v8 = (void *)qword_1E95CDDD8;
  if (qword_1E95CDDD8) {
    v8 = *(void **)qword_1E95CDDD8;
  }
  v22[3] = v8;
  v23[3] = MEMORY[0x1E4F1CC38];
  v9 = (void *)MEMORY[0x1E4F1C9E8];
  id v10 = v8;
  v11 = [v9 dictionaryWithObjects:v23 forKeys:v22 count:4];

  if (qword_1E95CDE20 != -1) {
    dispatch_once(&qword_1E95CDE20, &unk_1EF6C44E0);
  }
  v12 = (void *)qword_1E95CDE18;
  if (qword_1E95CDE18) {
    v12 = *(void **)qword_1E95CDE18;
  }
  id v13 = v12;
  v20[0] = v13;
  v21[0] = @"ids";
  if (qword_1E95CDE30 != -1) {
    dispatch_once(&qword_1E95CDE30, &unk_1EF6C4500);
  }
  v14 = (void *)qword_1E95CDE28;
  if (qword_1E95CDE28) {
    v14 = *(void **)qword_1E95CDE28;
  }
  v20[1] = v14;
  v21[1] = @"client";
  v15 = (void *)MEMORY[0x1E4F1C9E8];
  id v16 = v14;
  uint64_t v17 = [v15 dictionaryWithObjects:v21 forKeys:v20 count:2];

  if (qword_1E95CDE40 != -1) {
    dispatch_once(&qword_1E95CDE40, &unk_1EF6C43A0);
  }
  v18 = objc_msgSend(objc_alloc((Class)CUTWeakLinkClass(@"RTCReporting", @"RTCReporting")), "initWithSessionInfo:userInfo:frameworksToCheck:", v11, v17, qword_1E95CDE38);

  return v18;
}

- (void)_beginPromiseTimeoutWithInterval:(int64_t)a3
{
  dispatch_time_t v4 = dispatch_time(0, 1000000000 * a3);
  id v5 = sub_1A355C654();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A355CDC4;
  block[3] = &unk_1E5AFED50;
  void block[4] = self;
  dispatch_after(v4, v5, block);
}

- (void)_startConfigurationOfSession:(id)a3 withPromiseSeal:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1A355CEDC;
  v10[3] = &unk_1E5AFED78;
  v10[4] = self;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  [v8 startConfigurationWithCompletionHandler:v10];
}

- (void)_fullfillSeal:(id)a3 withSession:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_1A355C654();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1A355D048;
  v10[3] = &unk_1E5AFEC10;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);
}

- (void)_failSeal:(id)a3 withError:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_1A355C654();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1A355D120;
  v10[3] = &unk_1E5AFEC10;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);
}

- (CUTPromise)promise
{
  return self->_promise;
}

- (void)setPromise:(id)a3
{
}

- (os_unfair_lock_s)promiseLock
{
  return self->_promiseLock;
}

- (void).cxx_destruct
{
}

@end