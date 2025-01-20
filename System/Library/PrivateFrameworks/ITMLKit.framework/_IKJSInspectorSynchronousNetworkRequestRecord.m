@interface _IKJSInspectorSynchronousNetworkRequestRecord
+ (int64_t)_protocolResourceTypeForType:(int64_t)a3;
+ (int64_t)_responseSourceTypeForCacheType:(int64_t)a3;
- (NSData)responseBodyData;
- (NSDictionary)timingData;
- (NSString)description;
- (NSString)identifier;
- (NSURLRequest)urlRequest;
- (NSURLResponse)urlResponse;
- (_IKJSInspectorNetworkLoader)loader;
- (_IKJSInspectorSynchronousNetworkRequestRecord)initWithIdentifier:(id)a3 loader:(id)a4 resourceType:(int64_t)a5 initiatorType:(int64_t)a6;
- (int64_t)initiatorType;
- (int64_t)resourceType;
- (int64_t)state;
- (void)_didCompleteLoadingFromCache:(int64_t)a3 mimeType:(id)a4 withResponseBody:(id)a5 timestamp:(double)a6;
- (void)_dispatchEvent:(int64_t)a3 block:(id)a4;
- (void)_processEventType:(int64_t)a3;
- (void)didCompleteLoadingFromCache:(int64_t)a3 mimeType:(id)a4 withResponseBody:(id)a5;
- (void)didCompleteLoadingFromCache:(int64_t)a3 withResponseBody:(id)a4 mimeType:(id)a5;
- (void)didCompleteLoadingFromCache:(int64_t)a3 withResponseBodyBlock:(id)a4;
- (void)didCompleteLoadingFromMemoryWithRequest:(id)a3 response:(id)a4 withResponseBodyBlock:(id)a5;
- (void)didCompleteLoadingWithResponseBody:(id)a3;
- (void)didFailWithError:(id)a3;
- (void)didReceiveData:(id)a3;
- (void)didReceiveResponse:(id)a3 timingData:(id)a4;
- (void)setLoader:(id)a3;
- (void)setResponseBodyData:(id)a3;
- (void)setTimingData:(id)a3;
- (void)setURLRequest:(id)a3;
- (void)setURLResponse:(id)a3;
- (void)willSendRequest:(id)a3;
- (void)willSendRequest:(id)a3 redirectResponse:(id)a4;
@end

@implementation _IKJSInspectorSynchronousNetworkRequestRecord

- (_IKJSInspectorSynchronousNetworkRequestRecord)initWithIdentifier:(id)a3 loader:(id)a4 resourceType:(int64_t)a5 initiatorType:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_IKJSInspectorSynchronousNetworkRequestRecord;
  v13 = [(_IKJSInspectorSynchronousNetworkRequestRecord *)&v16 init];
  v14 = v13;
  if (v13)
  {
    v13->_isRedirecting = 0;
    v13->_state = 0;
    objc_storeStrong((id *)&v13->_identifier, a3);
    objc_storeWeak((id *)&v14->_loader, v12);
    v14->_resourceType = a5;
    v14->_initiatorType = a6;
  }

  return v14;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(_IKJSInspectorSynchronousNetworkRequestRecord *)self identifier];
  v7 = [(_IKJSInspectorSynchronousNetworkRequestRecord *)self loader];
  v8 = [v3 stringWithFormat:@"<%@: %p, identifier = %@, loader = %@, resourceType = %ld, initiatorType = %ld>", v5, self, v6, v7, -[_IKJSInspectorSynchronousNetworkRequestRecord resourceType](self, "resourceType"), -[_IKJSInspectorSynchronousNetworkRequestRecord initiatorType](self, "initiatorType")];

  return (NSString *)v8;
}

- (void)_processEventType:(int64_t)a3
{
  if ((unint64_t)a3 > 6) {
    int64_t v3 = 0;
  }
  else {
    int64_t v3 = qword_1E2B90A90[a3];
  }
  self->_state = v3;
}

- (void)_dispatchEvent:(int64_t)a3 block:(id)a4
{
  v6 = (void (**)(id, id))a4;
  [(_IKJSInspectorSynchronousNetworkRequestRecord *)self _processEventType:a3];
  id v7 = [(_IKJSInspectorSynchronousNetworkRequestRecord *)self loader];
  v6[2](v6, v7);
}

- (void)willSendRequest:(id)a3
{
}

- (void)willSendRequest:(id)a3 redirectResponse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_startTime)
  {
    v8 = [MEMORY[0x1E4F1C9C8] date];
    startTime = self->_startTime;
    self->_startTime = v8;
  }
  if (v7 && !self->_isRedirecting) {
    self->_isRedirecting = 1;
  }
  v10 = [MEMORY[0x1E4F1C9C8] date];
  redirectEndTime = self->_redirectEndTime;
  self->_redirectEndTime = v10;

  [(_IKJSInspectorSynchronousNetworkRequestRecord *)self setURLRequest:v6];
  id v12 = [(_IKJSInspectorSynchronousNetworkRequestRecord *)self loader];
  v13 = [v12 agent];
  v39 = [v13 controller];

  int64_t v14 = [(_IKJSInspectorSynchronousNetworkRequestRecord *)self initiatorType];
  v15 = (void *)[objc_alloc(MEMORY[0x1E4FB6CB0]) initWithType:v14];
  objc_super v16 = objc_msgSend(MEMORY[0x1E4FB6CC0], "ik_networkRequestFromURLRequest:", v6);
  v17 = [MEMORY[0x1E4F1C9C8] date];
  [v17 timeIntervalSince1970];
  double v19 = v18;

  v20 = [v39 inspectorConnectDate];
  [v20 timeIntervalSince1970];
  double v22 = v19 - v21;

  v23 = [(_IKJSInspectorSynchronousNetworkRequestRecord *)self loader];
  v24 = [v23 parentIdentifier];

  v25 = [(_IKJSInspectorSynchronousNetworkRequestRecord *)self loader];
  v26 = [v25 identifier];

  v27 = [(_IKJSInspectorSynchronousNetworkRequestRecord *)self identifier];
  v28 = [v6 URL];
  v29 = [v28 absoluteString];

  int64_t v30 = [(_IKJSInspectorSynchronousNetworkRequestRecord *)self resourceType];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __82___IKJSInspectorSynchronousNetworkRequestRecord_willSendRequest_redirectResponse___block_invoke;
  v40[3] = &unk_1E6DE5430;
  id v41 = v7;
  id v42 = v6;
  v43 = self;
  id v44 = v27;
  id v45 = v24;
  id v46 = v26;
  id v47 = v29;
  id v48 = v16;
  double v51 = v22;
  double v52 = v19;
  id v49 = v15;
  int64_t v50 = v30;
  id v31 = v15;
  id v32 = v16;
  id v33 = v29;
  id v34 = v26;
  id v35 = v24;
  id v36 = v27;
  id v37 = v6;
  id v38 = v7;
  [(_IKJSInspectorSynchronousNetworkRequestRecord *)self _dispatchEvent:0 block:v40];
}

- (void)didReceiveResponse:(id)a3 timingData:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(_IKJSInspectorSynchronousNetworkRequestRecord *)self setURLResponse:v7];
  v8 = [(_IKJSInspectorSynchronousNetworkRequestRecord *)self loader];
  v9 = [v8 agent];
  v10 = [v9 controller];

  id v11 = (void *)MEMORY[0x1E4FB6CD0];
  id v12 = [(_IKJSInspectorSynchronousNetworkRequestRecord *)self urlRequest];
  v13 = objc_msgSend(v11, "ik_responseFromURLResponse:forRequest:", v7, v12);

  int64_t v14 = (void *)[v6 mutableCopy];
  v15 = NSNumber;
  [(NSDate *)self->_startTime timeIntervalSinceReferenceDate];
  objc_super v16 = objc_msgSend(v15, "numberWithDouble:");
  [v14 setObject:v16 forKey:@"IKJSNetworkRequestRecordStartTime"];

  if (self->_isRedirecting)
  {
    v17 = NSNumber;
    [(NSDate *)self->_startTime timeIntervalSinceReferenceDate];
    double v18 = objc_msgSend(v17, "numberWithDouble:");
    [v14 setObject:v18 forKey:@"IKJSNetworkRequestRecordRedirectStartTime"];

    double v19 = NSNumber;
    [(NSDate *)self->_redirectEndTime timeIntervalSinceReferenceDate];
    v20 = objc_msgSend(v19, "numberWithDouble:");
    [v14 setObject:v20 forKey:@"IKJSNetworkRequestRecordRedirectEndTime"];
  }
  [(_IKJSInspectorSynchronousNetworkRequestRecord *)self setTimingData:v14];
  double v21 = (void *)MEMORY[0x1E4FB6CC8];
  double v22 = [(_IKJSInspectorSynchronousNetworkRequestRecord *)self timingData];
  v23 = [v10 inspectorConnectDate];
  v24 = objc_msgSend(v21, "ik_networkResourceTimingFromData:referenceStartDate:", v22, v23);

  if (v24) {
    [v13 setTiming:v24];
  }
  v25 = [(_IKJSInspectorSynchronousNetworkRequestRecord *)self identifier];
  v26 = [(_IKJSInspectorSynchronousNetworkRequestRecord *)self loader];
  [v26 currentTimeIntervalSince1970];
  uint64_t v28 = v27;

  uint64_t v29 = objc_msgSend((id)objc_opt_class(), "_protocolResourceTypeForType:", -[_IKJSInspectorSynchronousNetworkRequestRecord resourceType](self, "resourceType"));
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __79___IKJSInspectorSynchronousNetworkRequestRecord_didReceiveResponse_timingData___block_invoke;
  v32[3] = &unk_1E6DE5458;
  uint64_t v35 = v28;
  uint64_t v36 = v29;
  id v33 = v25;
  id v34 = v13;
  id v30 = v13;
  id v31 = v25;
  [(_IKJSInspectorSynchronousNetworkRequestRecord *)self _dispatchEvent:2 block:v32];
}

- (void)didReceiveData:(id)a3
{
  id v4 = a3;
  v5 = [(_IKJSInspectorSynchronousNetworkRequestRecord *)self identifier];
  id v6 = [(_IKJSInspectorSynchronousNetworkRequestRecord *)self loader];
  [v6 currentTimeIntervalSince1970];
  uint64_t v8 = v7;

  LODWORD(v6) = [v4 length];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64___IKJSInspectorSynchronousNetworkRequestRecord_didReceiveData___block_invoke;
  v10[3] = &unk_1E6DE5480;
  id v11 = v5;
  uint64_t v12 = v8;
  int v13 = (int)v6;
  id v9 = v5;
  [(_IKJSInspectorSynchronousNetworkRequestRecord *)self _dispatchEvent:3 block:v10];
}

- (void)didFailWithError:(id)a3
{
  id v4 = a3;
  v5 = [(_IKJSInspectorSynchronousNetworkRequestRecord *)self identifier];
  id v6 = [(_IKJSInspectorSynchronousNetworkRequestRecord *)self loader];
  [v6 currentTimeIntervalSince1970];
  uint64_t v8 = v7;

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66___IKJSInspectorSynchronousNetworkRequestRecord_didFailWithError___block_invoke;
  v11[3] = &unk_1E6DE54A8;
  uint64_t v14 = v8;
  id v12 = v5;
  id v13 = v4;
  id v9 = v4;
  id v10 = v5;
  [(_IKJSInspectorSynchronousNetworkRequestRecord *)self _dispatchEvent:6 block:v11];
}

- (void)didCompleteLoadingWithResponseBody:(id)a3
{
  id v4 = a3;
  [(_IKJSInspectorSynchronousNetworkRequestRecord *)self setResponseBodyData:v4];
  v5 = [(_IKJSInspectorSynchronousNetworkRequestRecord *)self identifier];
  id v6 = [(_IKJSInspectorSynchronousNetworkRequestRecord *)self loader];
  [v6 currentTimeIntervalSince1970];
  uint64_t v8 = v7;

  id v9 = [(_IKJSInspectorSynchronousNetworkRequestRecord *)self urlRequest];
  id v10 = [(_IKJSInspectorSynchronousNetworkRequestRecord *)self urlResponse];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = [(_IKJSInspectorSynchronousNetworkRequestRecord *)self urlResponse];
  }
  else
  {
    id v11 = 0;
  }

  id v12 = [(_IKJSInspectorSynchronousNetworkRequestRecord *)self timingData];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __84___IKJSInspectorSynchronousNetworkRequestRecord_didCompleteLoadingWithResponseBody___block_invoke;
  v18[3] = &unk_1E6DE54D0;
  id v19 = v9;
  id v20 = v11;
  id v21 = v4;
  id v22 = v12;
  id v23 = v5;
  uint64_t v24 = v8;
  id v13 = v5;
  id v14 = v12;
  id v15 = v4;
  id v16 = v11;
  id v17 = v9;
  [(_IKJSInspectorSynchronousNetworkRequestRecord *)self _dispatchEvent:4 block:v18];
}

- (void)didCompleteLoadingFromCache:(int64_t)a3 withResponseBody:(id)a4 mimeType:(id)a5
{
}

- (void)didCompleteLoadingFromCache:(int64_t)a3 mimeType:(id)a4 withResponseBody:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __103___IKJSInspectorSynchronousNetworkRequestRecord_didCompleteLoadingFromCache_mimeType_withResponseBody___block_invoke;
  v12[3] = &unk_1E6DE54F8;
  id v13 = v9;
  id v14 = v8;
  id v10 = v8;
  id v11 = v9;
  [(_IKJSInspectorSynchronousNetworkRequestRecord *)self didCompleteLoadingFromCache:a3 withResponseBodyBlock:v12];
}

- (void)didCompleteLoadingFromCache:(int64_t)a3 withResponseBodyBlock:(id)a4
{
  id v6 = (void (**)(id, void *))a4;
  uint64_t v7 = [(_IKJSInspectorSynchronousNetworkRequestRecord *)self loader];
  [v7 currentTimeIntervalSince1970];
  id v9 = v8;

  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __99___IKJSInspectorSynchronousNetworkRequestRecord_didCompleteLoadingFromCache_withResponseBodyBlock___block_invoke;
  v10[3] = &unk_1E6DE5520;
  objc_copyWeak(v11, &location);
  v11[1] = (id)a3;
  v11[2] = v9;
  v6[2](v6, v10);
  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

- (void)_didCompleteLoadingFromCache:(int64_t)a3 mimeType:(id)a4 withResponseBody:(id)a5 timestamp:(double)a6
{
  id v9 = a5;
  id v10 = (__CFString *)a4;
  [(_IKJSInspectorSynchronousNetworkRequestRecord *)self setResponseBodyData:v9];
  id v11 = [(_IKJSInspectorSynchronousNetworkRequestRecord *)self identifier];
  id v12 = [(_IKJSInspectorSynchronousNetworkRequestRecord *)self urlRequest];
  id v13 = [v12 URL];
  id v14 = [v13 absoluteString];

  id v15 = [(_IKJSInspectorSynchronousNetworkRequestRecord *)self urlResponse];
  uint64_t v16 = [v15 MIMEType];
  id v17 = (void *)v16;
  double v18 = @"text/plain";
  if (v16) {
    double v18 = (__CFString *)v16;
  }
  id v19 = v18;

  uint64_t v20 = [v9 length];
  uint64_t v21 = objc_msgSend((id)objc_opt_class(), "_protocolResourceTypeForType:", -[_IKJSInspectorSynchronousNetworkRequestRecord resourceType](self, "resourceType"));
  id v22 = (void *)MEMORY[0x1E4FB6CD0];
  id v23 = objc_alloc_init(MEMORY[0x1E4FB6CA8]);
  if (v10) {
    uint64_t v24 = v10;
  }
  else {
    uint64_t v24 = v19;
  }
  v25 = objc_msgSend(v22, "safe_initWithUrl:status:statusText:headers:mimeType:source:", v14, 200, @"OK", v23, v24, objc_msgSend((id)objc_opt_class(), "_responseSourceTypeForCacheType:", a3));

  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __114___IKJSInspectorSynchronousNetworkRequestRecord__didCompleteLoadingFromCache_mimeType_withResponseBody_timestamp___block_invoke;
  v29[3] = &unk_1E6DE5548;
  double v32 = a6;
  id v30 = v11;
  id v31 = v25;
  uint64_t v33 = v21;
  uint64_t v34 = v20;
  id v26 = v25;
  id v27 = v11;
  [(_IKJSInspectorSynchronousNetworkRequestRecord *)self _dispatchEvent:5 block:v29];
}

- (void)didCompleteLoadingFromMemoryWithRequest:(id)a3 response:(id)a4 withResponseBodyBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  id v11 = [(_IKJSInspectorSynchronousNetworkRequestRecord *)self loader];
  [v11 currentTimeIntervalSince1970];
  id v13 = v12;

  id v14 = [(_IKJSInspectorSynchronousNetworkRequestRecord *)self identifier];
  id v15 = [v8 URL];
  uint64_t v16 = [v15 absoluteString];

  id v17 = objc_msgSend((id)objc_opt_class(), "_protocolResourceTypeForType:", -[_IKJSInspectorSynchronousNetworkRequestRecord resourceType](self, "resourceType"));
  double v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB6CB0]), "initWithType:", -[_IKJSInspectorSynchronousNetworkRequestRecord initiatorType](self, "initiatorType"));
  objc_initWeak(&location, self);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __120___IKJSInspectorSynchronousNetworkRequestRecord_didCompleteLoadingFromMemoryWithRequest_response_withResponseBodyBlock___block_invoke;
  v24[3] = &unk_1E6DE5598;
  objc_copyWeak(v30, &location);
  id v19 = v9;
  id v25 = v19;
  id v20 = v8;
  id v26 = v20;
  id v21 = v16;
  id v27 = v21;
  v30[1] = v17;
  id v22 = v14;
  id v28 = v22;
  v30[2] = v13;
  id v23 = v18;
  id v29 = v23;
  v10[2](v10, v24);

  objc_destroyWeak(v30);
  objc_destroyWeak(&location);
}

+ (int64_t)_responseSourceTypeForCacheType:(int64_t)a3
{
  if (a3 == 1) {
    return 3;
  }
  else {
    return 0;
  }
}

+ (int64_t)_protocolResourceTypeForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    return 11;
  }
  else {
    return qword_1E2B90AC8[a3 - 1];
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (_IKJSInspectorNetworkLoader)loader
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_loader);
  return (_IKJSInspectorNetworkLoader *)WeakRetained;
}

- (void)setLoader:(id)a3
{
}

- (int64_t)resourceType
{
  return self->_resourceType;
}

- (int64_t)initiatorType
{
  return self->_initiatorType;
}

- (int64_t)state
{
  return self->_state;
}

- (NSDictionary)timingData
{
  return self->_timingData;
}

- (void)setTimingData:(id)a3
{
}

- (NSURLRequest)urlRequest
{
  return self->_URLRequest;
}

- (void)setURLRequest:(id)a3
{
}

- (NSURLResponse)urlResponse
{
  return self->_URLResponse;
}

- (void)setURLResponse:(id)a3
{
}

- (NSData)responseBodyData
{
  return self->_responseBodyData;
}

- (void)setResponseBodyData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseBodyData, 0);
  objc_storeStrong((id *)&self->_URLResponse, 0);
  objc_storeStrong((id *)&self->_URLRequest, 0);
  objc_storeStrong((id *)&self->_timingData, 0);
  objc_destroyWeak((id *)&self->_loader);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_redirectEndTime, 0);
}

@end