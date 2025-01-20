@interface CRXFFetchUserInfoRequest
- (CRXFFetchUserInfoRequest)initWithTimeout:(double)a3 completionQueue:(id)a4 completion:(id)a5;
- (void)finishWithUserInfo:(id)a3 error:(id)a4;
- (void)timerDidFire:(id)a3;
@end

@implementation CRXFFetchUserInfoRequest

- (CRXFFetchUserInfoRequest)initWithTimeout:(double)a3 completionQueue:(id)a4 completion:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CRXFFetchUserInfoRequest;
  v11 = [(CRXFFetchUserInfoRequest *)&v18 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_completionQueue, a4);
    uint64_t v13 = MEMORY[0x24C5DB9E0](v10);
    id completion = v12->_completion;
    v12->_id completion = (id)v13;

    uint64_t v15 = +[CRXUTimer scheduledTimerWithTimeInterval:v12 weakTarget:sel_timerDidFire_ selector:0 repeats:v12->_completionQueue queue:a3];
    timer = v12->_timer;
    v12->_timer = (CRXUTimer *)v15;
  }
  return v12;
}

- (void)timerDidFire:(id)a3
{
  objc_msgSend(MEMORY[0x263F087E8], "crxf_errorWithCode:file:line:userInfo:", 7, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFCalibrationDataDownloader.m", 215, MEMORY[0x263EFFA78]);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(CRXFFetchUserInfoRequest *)self finishWithUserInfo:0 error:v4];
}

- (void)finishWithUserInfo:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(CRXUTimer *)self->_timer invalidate];
  timer = self->_timer;
  self->_timer = 0;

  if (!self->_finished)
  {
    self->_finished = 1;
    completionQueue = self->_completionQueue;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __53__CRXFFetchUserInfoRequest_finishWithUserInfo_error___block_invoke;
    v10[3] = &unk_2652E1888;
    v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    [(CRXUDispatchQueue *)completionQueue dispatchAsync:v10];
  }
}

uint64_t __53__CRXFFetchUserInfoRequest_finishWithUserInfo_error___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1[4] + 24) + 16))(*(void *)(a1[4] + 24), a1[5], a1[6]);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
}

@end