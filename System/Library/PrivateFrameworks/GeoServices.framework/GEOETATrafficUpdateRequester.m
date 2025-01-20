@interface GEOETATrafficUpdateRequester
- (void)cancelRequest:(id)a3;
- (void)sendConditionalETATrafficUpdateRequest:(id)a3 timeWindowDuration:(double)a4 auditToken:(id)a5 throttleToken:(id)a6 willSendRequestHandler:(id)a7 finishedHandler:(id)a8;
- (void)sendETATrafficUpdateRequest:(id)a3 auditToken:(id)a4 throttleToken:(id)a5 finishedHandler:(id)a6;
@end

@implementation GEOETATrafficUpdateRequester

- (void)sendETATrafficUpdateRequest:(id)a3 auditToken:(id)a4 throttleToken:(id)a5 finishedHandler:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = +[GEOExperimentConfiguration sharedConfiguration];
  v14 = [v13 _mapsAbClientMetadata];
  v15 = [v14 clientDatasetMetadata];
  [v12 setAbClientMetadata:v15];

  v16 = +[GEOETARequester sharedRequester];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __101__GEOETATrafficUpdateRequester_sendETATrafficUpdateRequest_auditToken_throttleToken_finishedHandler___block_invoke;
  v20[3] = &unk_1E53E4820;
  id v21 = v9;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __101__GEOETATrafficUpdateRequester_sendETATrafficUpdateRequest_auditToken_throttleToken_finishedHandler___block_invoke_2;
  v18[3] = &unk_1E53DB698;
  id v19 = v21;
  id v17 = v21;
  [v16 startRequest:v12 connectionProperties:0 auditToken:v11 throttleToken:v10 callbackQueue:MEMORY[0x1E4F14428] willSendRequest:0 finished:v20 networkActivity:0 error:v18];
}

uint64_t __101__GEOETATrafficUpdateRequester_sendETATrafficUpdateRequest_auditToken_throttleToken_finishedHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a2, 0);
  }
  return result;
}

uint64_t __101__GEOETATrafficUpdateRequester_sendETATrafficUpdateRequest_auditToken_throttleToken_finishedHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)sendConditionalETATrafficUpdateRequest:(id)a3 timeWindowDuration:(double)a4 auditToken:(id)a5 throttleToken:(id)a6 willSendRequestHandler:(id)a7 finishedHandler:(id)a8
{
  id v13 = a3;
  id v14 = a7;
  id v15 = a8;
  id v16 = a6;
  id v17 = a5;
  v18 = +[GEOETARequester sharedRequester];
  id v19 = [[GEODataConditionalConnectionProperties alloc] initWithWorkload:1000 timeWindowDuration:a4];
  v20 = +[GEOExperimentConfiguration sharedConfiguration];
  id v21 = [v20 _mapsAbClientMetadata];
  v22 = [v21 clientDatasetMetadata];
  [v13 setAbClientMetadata:v22];

  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __154__GEOETATrafficUpdateRequester_sendConditionalETATrafficUpdateRequest_timeWindowDuration_auditToken_throttleToken_willSendRequestHandler_finishedHandler___block_invoke;
  v30[3] = &unk_1E53E4848;
  id v31 = v13;
  id v32 = v14;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __154__GEOETATrafficUpdateRequester_sendConditionalETATrafficUpdateRequest_timeWindowDuration_auditToken_throttleToken_willSendRequestHandler_finishedHandler___block_invoke_2;
  v28[3] = &unk_1E53E4820;
  id v29 = v15;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __154__GEOETATrafficUpdateRequester_sendConditionalETATrafficUpdateRequest_timeWindowDuration_auditToken_throttleToken_willSendRequestHandler_finishedHandler___block_invoke_3;
  v26[3] = &unk_1E53DB698;
  id v27 = v29;
  id v23 = v29;
  id v24 = v13;
  id v25 = v14;
  [v18 startRequest:v24 connectionProperties:v19 auditToken:v17 throttleToken:v16 callbackQueue:MEMORY[0x1E4F14428] willSendRequest:v30 finished:v28 networkActivity:0 error:v26];
}

uint64_t __154__GEOETATrafficUpdateRequester_sendConditionalETATrafficUpdateRequest_timeWindowDuration_auditToken_throttleToken_willSendRequestHandler_finishedHandler___block_invoke(uint64_t a1, void *a2)
{
  v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4)
  {
    uint64_t v4 = (*(uint64_t (**)(uint64_t, void))(v4 + 16))(v4, *(void *)(a1 + 32));
  }
  else if (v3)
  {
    uint64_t v4 = v3[2](v3, *(void *)(a1 + 32));
  }

  return MEMORY[0x1F4181820](v4);
}

uint64_t __154__GEOETATrafficUpdateRequester_sendConditionalETATrafficUpdateRequest_timeWindowDuration_auditToken_throttleToken_willSendRequestHandler_finishedHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a2, 0);
  }
  return result;
}

uint64_t __154__GEOETATrafficUpdateRequester_sendConditionalETATrafficUpdateRequest_timeWindowDuration_auditToken_throttleToken_willSendRequestHandler_finishedHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)cancelRequest:(id)a3
{
  id v3 = a3;
  id v4 = +[GEOETARequester sharedRequester];
  [v4 cancelRequest:v3];
}

@end