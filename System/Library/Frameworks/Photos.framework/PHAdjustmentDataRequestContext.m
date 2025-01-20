@interface PHAdjustmentDataRequestContext
- (BOOL)isNetworkAccessAllowed;
- (PHAdjustmentDataRequestContext)initWithRequestID:(int)a3 managerID:(unint64_t)a4 asset:(id)a5 options:(id)a6 resultHandler:(id)a7;
- (PHImageRequestOptions)options;
- (id)initialRequests;
- (int64_t)type;
- (void)processMediaResult:(id)a3 forRequest:(id)a4;
@end

@implementation PHAdjustmentDataRequestContext

- (void).cxx_destruct
{
}

- (PHImageRequestOptions)options
{
  return self->_options;
}

- (void)processMediaResult:(id)a3 forRequest:(id)a4
{
  resultHandler = (void (**)(id, id, id, PHAdjustmentDataRequestContext *))self->super._resultHandler;
  if (resultHandler) {
    resultHandler[2](resultHandler, a3, a4, self);
  }
}

- (id)initialRequests
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(PHAdjustmentDataRequestBehaviorSpec);
  [(PHAdjustmentDataRequestBehaviorSpec *)v3 setNetworkAccessAllowed:[(PHImageRequestOptions *)self->_options isNetworkAccessAllowed]];
  [(PHAdjustmentDataRequestBehaviorSpec *)v3 setSynchronous:[(PHImageRequestOptions *)self->_options isSynchronous]];
  v4 = [PHAdjustmentDataRequest alloc];
  uint64_t v5 = [(PHMediaRequestContext *)self requestID];
  unint64_t v6 = [(PHMediaRequestContext *)self nextRequestIndex];
  int64_t v7 = [(PHAdjustmentDataRequestContext *)self type];
  unint64_t v8 = [(PHMediaRequestContext *)self managerID];
  v9 = [(PHMediaRequestContext *)self asset];
  v10 = [(PHAdjustmentDataRequest *)v4 initWithRequestID:v5 requestIndex:v6 contextType:v7 managerID:v8 asset:v9 behaviorSpec:v3 delegate:self];

  v13[0] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];

  return v11;
}

- (BOOL)isNetworkAccessAllowed
{
  return [(PHImageRequestOptions *)self->_options isNetworkAccessAllowed];
}

- (int64_t)type
{
  return 3;
}

- (PHAdjustmentDataRequestContext)initWithRequestID:(int)a3 managerID:(unint64_t)a4 asset:(id)a5 options:(id)a6 resultHandler:(id)a7
{
  uint64_t v11 = *(void *)&a3;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)PHAdjustmentDataRequestContext;
  v14 = [(PHMediaRequestContext *)&v17 initWithRequestID:v11 managerID:a4 asset:a5 displaySpec:0 resultHandler:a7];
  v15 = v14;
  if (v14) {
    objc_storeStrong((id *)&v14->_options, a6);
  }

  return v15;
}

@end