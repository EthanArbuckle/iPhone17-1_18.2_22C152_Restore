@interface _GEOMapServiceWiFiQualityLookupTicket
- ($C4D369C9F02205611300857CFD58F739)dataRequestKind;
- (_GEOMapServiceWiFiQualityLookupTicket)initWithRequest:(id)a3 requestId:(id)a4;
- (_GEOMapServiceWiFiQualityLookupTicket)initWithRequestID:(id)a3;
- (_GEOMapServiceWiFiQualityLookupTicket)initWithTileKey:(id)a3 eTag:(id)a4 requestId:(id)a5;
- (void)_cancel;
- (void)cancelLocationSearch;
- (void)submitLocationSearchWithCompletionQueue:(id)a3 completion:(id)a4;
- (void)submitNetworkSearchWithCompletionQueue:(id)a3 completion:(id)a4;
- (void)submitTileLoadWithCompletionQueue:(id)a3 completion:(id)a4;
@end

@implementation _GEOMapServiceWiFiQualityLookupTicket

- (_GEOMapServiceWiFiQualityLookupTicket)initWithRequestID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_GEOMapServiceWiFiQualityLookupTicket;
  v6 = [(GEOAbstractTicket *)&v9 initWithTraits:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_requestID, a3);
  }

  return v7;
}

- (_GEOMapServiceWiFiQualityLookupTicket)initWithRequest:(id)a3 requestId:(id)a4
{
  id v7 = a3;
  v8 = [(_GEOMapServiceWiFiQualityLookupTicket *)self initWithRequestID:a4];
  objc_super v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_request, a3);
  }

  return v9;
}

- (_GEOMapServiceWiFiQualityLookupTicket)initWithTileKey:(id)a3 eTag:(id)a4 requestId:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = [(_GEOMapServiceWiFiQualityLookupTicket *)self initWithRequestID:a5];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_tileKey, a3);
    objc_storeStrong((id *)&v12->_eTag, a4);
  }

  return v12;
}

- (void)submitNetworkSearchWithCompletionQueue:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[GEOWiFiQualityServiceManager sharedManager];
  request = self->_request;
  requestID = self->_requestID;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __91___GEOMapServiceWiFiQualityLookupTicket_submitNetworkSearchWithCompletionQueue_completion___block_invoke;
  v13[3] = &unk_1E53DEBF0;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  [v8 submitWiFiQualityServiceRequest:request requestId:requestID auditToken:0 completionQueue:v12 completion:v13];
}

- (void)submitLocationSearchWithCompletionQueue:(id)a3 completion:(id)a4
{
  id v5 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92___GEOMapServiceWiFiQualityLookupTicket_submitLocationSearchWithCompletionQueue_completion___block_invoke;
  block[3] = &unk_1E53DA028;
  id v9 = v5;
  id v6 = v5;
  dispatch_async((dispatch_queue_t)a3, block);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: -[_GEOMapServiceWiFiQualityLookupTicket submitLocationSearchWithCompletionQueue:completion:] is unsupported", v7, 2u);
  }
}

- (void)cancelLocationSearch
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unreachable reached: -[_GEOMapServiceWiFiQualityLookupTicket cancelLocationSearch] is unsupported", v2, 2u);
  }
}

- (void)submitTileLoadWithCompletionQueue:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[GEOWiFiQualityServiceManager sharedManager];
  tileKey = self->_tileKey;
  eTag = self->_eTag;
  requestID = self->_requestID;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __86___GEOMapServiceWiFiQualityLookupTicket_submitTileLoadWithCompletionQueue_completion___block_invoke;
  v14[3] = &unk_1E53DEC40;
  v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v12 = v7;
  id v13 = v6;
  [v8 submitWiFiQualityTileLoadForKey:tileKey eTag:eTag requestId:requestID auditToken:0 completionQueue:v13 completion:v14];
}

- (void)_cancel
{
  v4.receiver = self;
  v4.super_class = (Class)_GEOMapServiceWiFiQualityLookupTicket;
  [(GEOAbstractTicket *)&v4 cancel];
  v3 = +[GEOWiFiQualityServiceManager sharedManager];
  [v3 cancelRequestId:self->_requestID];
}

- ($C4D369C9F02205611300857CFD58F739)dataRequestKind
{
  return ($C4D369C9F02205611300857CFD58F739)2856;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_eTag, 0);
  objc_storeStrong((id *)&self->_tileKey, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

@end