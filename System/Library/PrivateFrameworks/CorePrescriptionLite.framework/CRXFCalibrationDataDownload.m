@interface CRXFCalibrationDataDownload
- (CRXFCalibrationDataDownload)initWithTimeout:(double)a3 completionQueue:(id)a4 completion:(id)a5;
- (double)roundtripTime;
- (void)finishWithData:(id)a3 error:(id)a4;
- (void)timerDidFire:(id)a3;
@end

@implementation CRXFCalibrationDataDownload

- (CRXFCalibrationDataDownload)initWithTimeout:(double)a3 completionQueue:(id)a4 completion:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)CRXFCalibrationDataDownload;
  v11 = [(CRXFCalibrationDataDownload *)&v20 init];
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

    v17 = [MEMORY[0x263EFF910] date];
    [v17 timeIntervalSinceReferenceDate];
    v12->_startTime = v18;
  }
  return v12;
}

- (double)roundtripTime
{
  return self->_roundtripTime;
}

- (void)timerDidFire:(id)a3
{
  objc_msgSend(MEMORY[0x263F087E8], "crxf_errorWithCode:file:line:userInfo:", 7, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFCalibrationDataDownloader.m", 148, MEMORY[0x263EFFA78]);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(CRXFCalibrationDataDownload *)self finishWithData:0 error:v4];
}

- (void)finishWithData:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(CRXUTimer *)self->_timer invalidate];
  timer = self->_timer;
  self->_timer = 0;

  if (!self->_finished)
  {
    self->_finished = 1;
    id v9 = [MEMORY[0x263EFF910] date];
    [v9 timeIntervalSinceReferenceDate];
    double v11 = v10;

    double v12 = v11 - self->_startTime;
    self->_roundtripTime = v12;
    completionQueue = self->_completionQueue;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __52__CRXFCalibrationDataDownload_finishWithData_error___block_invoke;
    v14[3] = &unk_2652E1860;
    v14[4] = self;
    id v15 = v6;
    double v17 = v12;
    id v16 = v7;
    [(CRXUDispatchQueue *)completionQueue dispatchAsync:v14];
  }
}

uint64_t __52__CRXFCalibrationDataDownload_finishWithData_error___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, double))(*(void *)(*(void *)(a1 + 32) + 24) + 16))(*(void *)(*(void *)(a1 + 32) + 24), *(void *)(a1 + 40), *(void *)(a1 + 48), *(double *)(a1 + 56));
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
}

@end