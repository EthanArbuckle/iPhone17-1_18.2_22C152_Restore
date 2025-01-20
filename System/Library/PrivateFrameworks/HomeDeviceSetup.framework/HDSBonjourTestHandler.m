@interface HDSBonjourTestHandler
- (HDSBonjourTestHandler)init;
- (OS_dispatch_queue)dispatchQueue;
- (SFSession)sfSession;
- (void)_handleStart:(id)a3 responseHandler:(id)a4;
- (void)_handleStop:(id)a3 responseHandler:(id)a4;
- (void)activate;
- (void)invalidate;
- (void)setDispatchQueue:(id)a3;
- (void)setSfSession:(id)a3;
@end

@implementation HDSBonjourTestHandler

- (HDSBonjourTestHandler)init
{
  v6.receiver = self;
  v6.super_class = (Class)HDSBonjourTestHandler;
  v2 = [(HDSBonjourTestHandler *)&v6 init];
  if (v2)
  {
    uint64_t v3 = CUMainQueue();
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__HDSBonjourTestHandler_activate__block_invoke;
  block[3] = &unk_26503F6A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __33__HDSBonjourTestHandler_activate__block_invoke(uint64_t a1)
{
  if (gLogCategory_HDSBonjourTest <= 30
    && (gLogCategory_HDSBonjourTest != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 24);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __33__HDSBonjourTestHandler_activate__block_invoke_2;
  v8[3] = &unk_26503FC98;
  v8[4] = v2;
  [v3 registerRequestID:@"_bjtS" options:0 handler:v8];
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 24);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__HDSBonjourTestHandler_activate__block_invoke_3;
  v7[3] = &unk_26503FC98;
  v7[4] = v4;
  return [v5 registerRequestID:@"_bjtD" options:0 handler:v7];
}

uint64_t __33__HDSBonjourTestHandler_activate__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleStart:responseHandler:");
}

uint64_t __33__HDSBonjourTestHandler_activate__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleStop:responseHandler:");
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__HDSBonjourTestHandler_invalidate__block_invoke;
  block[3] = &unk_26503F6A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __35__HDSBonjourTestHandler_invalidate__block_invoke(uint64_t a1)
{
  if (gLogCategory_HDSBonjourTest <= 30
    && (gLogCategory_HDSBonjourTest != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 16) = 1;
  [*(id *)(*(void *)(a1 + 32) + 8) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = 0;
}

- (void)_handleStart:(id)a3 responseHandler:(id)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (gLogCategory_HDSBonjourTest <= 30
    && (gLogCategory_HDSBonjourTest != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v8 = [v6 objectForKeyedSubscript:@"bjtID"];
  if (v8)
  {
    [(CUBonjourAdvertiser *)self->_advertiser invalidate];
    v9 = (CUBonjourAdvertiser *)objc_opt_new();
    advertiser = self->_advertiser;
    self->_advertiser = v9;

    [(CUBonjourAdvertiser *)self->_advertiser setDispatchQueue:self->_dispatchQueue];
    v13 = @"rpBA";
    v14[0] = v8;
    v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
    [(CUBonjourAdvertiser *)self->_advertiser setTxtDictionary:v11];

    [(CUBonjourAdvertiser *)self->_advertiser setServiceType:@"_bonjourtest._tcp"];
    [(CUBonjourAdvertiser *)self->_advertiser setDomain:@"local."];
    [(CUBonjourAdvertiser *)self->_advertiser setLabel:@"HDSBonjour"];
    [(CUBonjourAdvertiser *)self->_advertiser setName:v8];
    [(CUBonjourAdvertiser *)self->_advertiser setPort:9];
    [(CUBonjourAdvertiser *)self->_advertiser activate];
    (*((void (**)(id, void, void, void))v7 + 2))(v7, 0, 0, MEMORY[0x263EFFA78]);
  }
  else
  {
    v12 = NSErrorWithOSStatusF();
    if (gLogCategory_HDSBonjourTest <= 90
      && (gLogCategory_HDSBonjourTest != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*((void (**)(id, void *, void, void))v7 + 2))(v7, v12, 0, 0);
  }
}

- (void)_handleStop:(id)a3 responseHandler:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (gLogCategory_HDSBonjourTest <= 30
    && (gLogCategory_HDSBonjourTest != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [(HDSBonjourTestHandler *)self invalidate];
  (*((void (**)(id, void, void, void))v6 + 2))(v6, 0, 0, MEMORY[0x263EFFA78]);
}

- (SFSession)sfSession
{
  return self->_sfSession;
}

- (void)setSfSession:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_sfSession, 0);
  objc_storeStrong((id *)&self->_advertiser, 0);
}

@end