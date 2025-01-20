@interface MADComputeServiceProxy
- (MADComputeServiceProxy)initWithCoordinator:(id)a3;
- (void)handleResults:(id)a3 assetRepresentation:(id)a4 requestID:(id)a5 error:(id)a6 acknowledgement:(id)a7;
- (void)reportProgress:(double)a3 requestID:(id)a4;
@end

@implementation MADComputeServiceProxy

- (MADComputeServiceProxy)initWithCoordinator:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MADComputeServiceProxy;
  v5 = [(MADComputeServiceProxy *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_coordinator, v4);
  }

  return v6;
}

- (void)reportProgress:(double)a3 requestID:(id)a4
{
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);
  v7 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained reportProgress:v8 requestID:a3];
  }
}

- (void)handleResults:(id)a3 assetRepresentation:(id)a4 requestID:(id)a5 error:(id)a6 acknowledgement:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = (void (**)(id, void))a7;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);
  v18 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained handleResults:v12 assetRepresentation:v13 requestID:v14 error:v15 acknowledgement:v16];
  }
  else
  {
    BOOL v19 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v19) {
      -[MADComputeServiceProxy handleResults:assetRepresentation:requestID:error:acknowledgement:](v19, v20, v21, v22, v23, v24, v25, v26);
    }
    v16[2](v16, 0);
  }
}

- (void).cxx_destruct
{
}

- (void)handleResults:(uint64_t)a3 assetRepresentation:(uint64_t)a4 requestID:(uint64_t)a5 error:(uint64_t)a6 acknowledgement:(uint64_t)a7 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end