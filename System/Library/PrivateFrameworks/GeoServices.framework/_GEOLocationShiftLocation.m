@interface _GEOLocationShiftLocation
- (GEOApplicationAuditToken)auditToken;
- (GEOLatLng)latLng;
- (_GEOLocationShiftLocation)initWithLatLng:(id)a3 accuracy:(double)a4 completionHandler:(id)a5 errorHandler:(id)a6 mustGoToNetworkCallback:(id)a7 callbackQueue:(id)a8;
- (_GEOLocationShiftLocation)initWithLatLng:(id)a3 accuracy:(double)a4 completionHandler:(id)a5 errorHandler:(id)a6 mustGoToNetworkCallback:(id)a7 callbackQueue:(id)a8 auditToken:(id)a9;
- (_GEOLocationShiftLocation)initWithLatLng:(id)a3 auditToken:(id)a4 functionHandler:(id)a5 errorHandler:(id)a6 callbackQueue:(id)a7;
- (double)accuracy;
- (id)_initWithLatLng:(id)a3 accuracy:(double)a4 callbackQueue:(id)a5 completionHandler:(id)a6 errorHandler:(id)a7 mustGoToNetworkCallback:(id)a8;
- (void)_performOnCallbackQueue:(id)a3;
- (void)performCompletionHandlerWithShiftedCoordinate:(id)a3 accuracy:(double)a4 function:(id)a5;
- (void)performErrorHandler:(id)a3;
- (void)performMustGoToNetwork;
@end

@implementation _GEOLocationShiftLocation

- (_GEOLocationShiftLocation)initWithLatLng:(id)a3 accuracy:(double)a4 completionHandler:(id)a5 errorHandler:(id)a6 mustGoToNetworkCallback:(id)a7 callbackQueue:(id)a8 auditToken:(id)a9
{
  id v17 = a9;
  v18 = [(_GEOLocationShiftLocation *)self _initWithLatLng:a3 accuracy:a8 callbackQueue:a5 completionHandler:a6 errorHandler:a7 mustGoToNetworkCallback:a4];
  v19 = (_GEOLocationShiftLocation *)v18;
  if (v18)
  {
    objc_storeStrong(v18 + 2, a9);
    v20 = v19;
  }

  return v19;
}

- (id)_initWithLatLng:(id)a3 accuracy:(double)a4 callbackQueue:(id)a5 completionHandler:(id)a6 errorHandler:(id)a7 mustGoToNetworkCallback:(id)a8
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v30.receiver = self;
  v30.super_class = (Class)_GEOLocationShiftLocation;
  v20 = [(_GEOLocationShiftLocation *)&v30 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_latLng, a3);
    v21->_accuracy = a4;
    objc_storeStrong((id *)&v21->_callbackQueue, a5);
    uint64_t v22 = [v17 copy];
    id completionHandler = v21->_completionHandler;
    v21->_id completionHandler = (id)v22;

    uint64_t v24 = [v18 copy];
    id errorHandler = v21->_errorHandler;
    v21->_id errorHandler = (id)v24;

    uint64_t v26 = [v19 copy];
    id mustGoToNetworkCallback = v21->_mustGoToNetworkCallback;
    v21->_id mustGoToNetworkCallback = (id)v26;

    v28 = v21;
  }

  return v21;
}

- (void)performCompletionHandlerWithShiftedCoordinate:(id)a3 accuracy:(double)a4 function:(id)a5
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v9 = a5;
  v10 = v9;
  if (self->_completionHandler || self->_functionHandler)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __93___GEOLocationShiftLocation_performCompletionHandlerWithShiftedCoordinate_accuracy_function___block_invoke;
    v11[3] = &unk_1E53DEFA8;
    v11[4] = self;
    double v13 = var0;
    double v14 = var1;
    double v15 = a4;
    id v12 = v9;
    [(_GEOLocationShiftLocation *)self _performOnCallbackQueue:v11];
  }
}

- (GEOLatLng)latLng
{
  return self->_latLng;
}

- (double)accuracy
{
  return self->_accuracy;
}

- (void)_performOnCallbackQueue:(id)a3
{
  v4 = (void (**)(void))a3;
  if (v4)
  {
    callbackQueue = self->_callbackQueue;
    block = v4;
    if (callbackQueue) {
      dispatch_async(callbackQueue, v4);
    }
    else {
      v4[2](v4);
    }
    v4 = block;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong(&self->_functionHandler, 0);
  objc_storeStrong(&self->_mustGoToNetworkCallback, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);

  objc_storeStrong((id *)&self->_latLng, 0);
}

- (_GEOLocationShiftLocation)initWithLatLng:(id)a3 accuracy:(double)a4 completionHandler:(id)a5 errorHandler:(id)a6 mustGoToNetworkCallback:(id)a7 callbackQueue:(id)a8
{
  v8 = [(_GEOLocationShiftLocation *)self _initWithLatLng:a3 accuracy:a8 callbackQueue:a5 completionHandler:a6 errorHandler:a7 mustGoToNetworkCallback:a4];
  id v9 = v8;
  if (v8) {
    v10 = v8;
  }

  return v9;
}

- (_GEOLocationShiftLocation)initWithLatLng:(id)a3 auditToken:(id)a4 functionHandler:(id)a5 errorHandler:(id)a6 callbackQueue:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v26.receiver = self;
  v26.super_class = (Class)_GEOLocationShiftLocation;
  id v18 = [(_GEOLocationShiftLocation *)&v26 init];
  id v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_latLng, a3);
    objc_storeStrong((id *)&v19->_auditToken, a4);
    uint64_t v20 = [v15 copy];
    id functionHandler = v19->_functionHandler;
    v19->_id functionHandler = (id)v20;

    uint64_t v22 = [v16 copy];
    id errorHandler = v19->_errorHandler;
    v19->_id errorHandler = (id)v22;

    objc_storeStrong((id *)&v19->_callbackQueue, a7);
    uint64_t v24 = v19;
  }

  return v19;
}

- (void)performErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_errorHandler)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __49___GEOLocationShiftLocation_performErrorHandler___block_invoke;
    v6[3] = &unk_1E53D8998;
    v6[4] = self;
    id v7 = v4;
    [(_GEOLocationShiftLocation *)self _performOnCallbackQueue:v6];
  }
}

- (void)performMustGoToNetwork
{
  if (self->_mustGoToNetworkCallback)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __51___GEOLocationShiftLocation_performMustGoToNetwork__block_invoke;
    v2[3] = &unk_1E53D79D8;
    v2[4] = self;
    [(_GEOLocationShiftLocation *)self _performOnCallbackQueue:v2];
  }
}

- (GEOApplicationAuditToken)auditToken
{
  return self->_auditToken;
}

@end