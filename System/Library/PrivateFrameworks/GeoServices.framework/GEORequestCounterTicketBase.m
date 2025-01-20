@interface GEORequestCounterTicketBase
+ (id)_requestCounterTicketForType:(id)a3 appId:(id)a4 traits:(id)a5 offlineCohortId:(id)a6 withParent:(id)a7 logNetworkActivityOnly:(BOOL)a8;
+ (id)requestCounterTicketForType:(id)a3 auditToken:(id)a4 traits:(id)a5;
- (NSString)appId;
- (NSString)description;
- (id)createSubtask:(BOOL)a3;
- (void)_incrementForApp:(id)a3 offlineCohortId:(id)a4 requestMode:(int)a5 startTime:(id)a6 endTime:(id)a7 requestType:(id)a8 result:(unsigned __int8)a9 error:(id)a10 xmitBytes:(int64_t)a11 recvBytes:(int64_t)a12 usedInterfaces:(unint64_t)a13;
- (void)_requestCompletedWithError:(id)a3 xmitBytes:(int64_t)a4 recvBytes:(int64_t)a5;
- (void)_subTask:(id)a3 completed:(unsigned __int8)a4 error:(id)a5 started:(double)a6 finished:(double)a7 xmitBytes:(int64_t)a8 recvBytes:(int64_t)a9 usedInterfaces:(unint64_t)a10;
- (void)dealloc;
- (void)explicitInterfaceRequestCompleted:(id)a3 xmitBytes:(unint64_t)a4 recvBytes:(unint64_t)a5;
- (void)requestCompleted:(id)a3;
- (void)startingRequestWithExplicitInterfaces:(unint64_t)a3;
- (void)startingRequestWithTask:(id)a3;
@end

@implementation GEORequestCounterTicketBase

- (void)requestCompleted:(id)a3
{
  id v4 = a3;
  if (self->_explicitInterfaces)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: _explicitInterfaces == 0", v6, 2u);
    }
  }
  else
  {
    v5 = [(NSURLSessionTask *)self->_task _incompleteCurrentTaskTransactionMetrics];
    -[GEORequestCounterTicketBase _requestCompletedWithError:xmitBytes:recvBytes:](self, "_requestCompletedWithError:xmitBytes:recvBytes:", v4, [v5 countOfRequestBodyBytesSent] + objc_msgSend(v5, "countOfRequestHeaderBytesSent"), objc_msgSend(v5, "countOfResponseBodyBytesReceived") + objc_msgSend(v5, "countOfResponseHeaderBytesReceived"));
  }
}

- (void)_requestCompletedWithError:(id)a3 xmitBytes:(int64_t)a4 recvBytes:(int64_t)a5
{
  v59[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = [MEMORY[0x1E4F1C9C8] date];
  [v9 timeIntervalSinceReferenceDate];
  double v11 = v10;

  uint64_t v12 = GEOErrorToCounterInfoResult(v8);
  int result = self->_result;
  if (result == 3 || result == 254)
  {
    if (self->_signpostId + 1 >= 2)
    {
      v14 = [(NSURLSessionTask *)self->_task originalRequest];
      v15 = [v14 valueForHTTPHeaderField:@"Proxy-Authorization"];

      v16 = GEOGetNetworkRequestLog();
      v17 = v16;
      os_signpost_id_t signpostId = self->_signpostId;
      if (signpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
      {
        parentTask = self->_parentTask;
        if (parentTask) {
          parentTask = (GEORequestCounterTicketBase *)parentTask->_signpostId;
        }
        appId = self->_appId;
        int v21 = self->_type.subtype.raw | self->_type.type;
        if (v15) {
          int v22 = 89;
        }
        else {
          int v22 = 78;
        }
        *(_DWORD *)buf = 134218754;
        v55 = parentTask;
        __int16 v56 = 2112;
        v57 = (__CFString *)appId;
        __int16 v58 = 1024;
        LODWORD(v59[0]) = v21;
        WORD2(v59[0]) = 1024;
        *(_DWORD *)((char *)v59 + 6) = v22;
        _os_signpost_emit_with_name_impl(&dword_188D96000, v17, OS_SIGNPOST_INTERVAL_END, signpostId, "RequestInterval", "Parent=%#llx App=%@ RequestKind=%#05x Proxied=%c", buf, 0x22u);
      }
    }
    if (self->_nwActivity
      && !self->_nwActivityCompleted
      && (self->_result == 254 || (self->_explicitInterfaces & 0x100) != 0))
    {
      nw_activity_complete_with_reason();
      self->_nwActivityCompleted = 1;
    }
    uint64_t v53 = v12;
    self->_int result = v12;
    int64_t v26 = self->_subTaskXmitBytes + a4;
    int64_t v27 = self->_subTaskRecvBytes + a5;
    unint64_t v28 = self->_explicitInterfaces | self->_subTaskUsedInterfaces;
    v23 = [(NSURLSessionTask *)self->_task _incompleteCurrentTaskTransactionMetrics];
    task = self->_task;
    self->_task = 0;

    if (v23)
    {
      v30 = [v23 fetchStartDate];
      [v30 timeIntervalSinceReferenceDate];
      float64_t v51 = v31;

      v32 = [v23 responseEndDate];
      [v32 timeIntervalSinceReferenceDate];
      double v34 = v33;

      if (v34 == 0.0) {
        float64_t v35 = v11;
      }
      else {
        float64_t v35 = v34;
      }
      v36.f64[0] = self->_start;
      v36.f64[1] = v35;
      v37.f64[1] = self->_end;
      v37.f64[0] = v51;
      int8x16_t v38 = (int8x16_t)vcgtq_f64(v37, v36);
      v36.f64[0] = v51;
      *(int8x16_t *)&self->_start = vbslq_s8(v38, *(int8x16_t *)&self->_start, (int8x16_t)v36);
      if (!v8 || v26 || v27) {
        goto LABEL_38;
      }
      v39 = [v23 connectEndDate];
      if (v39)
      {

LABEL_38:
        int v41 = [v23 isCellular];
        uint64_t v42 = 1;
        if (v41) {
          uint64_t v42 = 2;
        }
        unint64_t v43 = v42 | v28;
        if ([v23 isExpensive]) {
          v43 |= 4uLL;
        }
        if ([v23 isConstrained]) {
          v43 |= 8uLL;
        }
        if ([v23 isMultipath]) {
          unint64_t v28 = v43 | 0x10;
        }
        else {
          unint64_t v28 = v43;
        }
        goto LABEL_47;
      }
      v40 = [v23 networkProtocolName];

      if (v40) {
        goto LABEL_38;
      }
    }
    else
    {
      self->_end = v11;
    }
LABEL_47:
    if (!self->_logNetworkActivityOnly)
    {
      v44 = self->_appId;
      offlineCohortId = self->_offlineCohortId;
      unsigned int requestMode = self->_requestMode;
      v46 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->_start];
      v47 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->_end];
      LOBYTE(v50) = v53;
      [(GEORequestCounterTicketBase *)self _incrementForApp:v44 offlineCohortId:offlineCohortId requestMode:requestMode startTime:v46 endTime:v47 requestType:*(void *)&self->_type result:v50 error:v8 xmitBytes:v26 recvBytes:v27 usedInterfaces:v28];
    }
    v48 = self->_parentTask;
    if (v48)
    {
      [(GEORequestCounterTicketBase *)v48 _subTask:self completed:v53 error:v8 started:v26 finished:v27 xmitBytes:v28 recvBytes:self->_start usedInterfaces:self->_end];
      v49 = self->_parentTask;
      self->_parentTask = 0;
    }
    goto LABEL_51;
  }
  v23 = GEOFindOrCreateLog("com.apple.GeoServices", "GEORequestCounter");
  if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
  {
    if ((self->_result + 2) > 7u) {
      v24 = @"Success";
    }
    else {
      v24 = off_1E53DA298[(char)(self->_result + 2)];
    }
    if ((v12 - 1) > 3u) {
      v25 = @"Success";
    }
    else {
      v25 = off_1E53DA2D8[(char)v12 - 1];
    }
    *(_DWORD *)buf = 138412802;
    v55 = v24;
    __int16 v56 = 2112;
    v57 = v25;
    __int16 v58 = 2112;
    v59[0] = self;
    _os_log_impl(&dword_188D96000, v23, OS_LOG_TYPE_FAULT, "Tried to complete request twice (initial: %@, new: %@): %@", buf, 0x20u);
  }
LABEL_51:
}

- (void)startingRequestWithTask:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = v5;
  if (self->_nwActivity) {
    objc_msgSend(v5, "set_nw_activity:");
  }
  v7 = [MEMORY[0x1E4F1C9C8] date];
  [v7 timeIntervalSinceReferenceDate];
  self->_start = v8;

  objc_storeStrong((id *)&self->_task, a3);
  if (self->_signpostId + 1 >= 2)
  {
    v9 = [(NSURLSessionTask *)self->_task originalRequest];
    double v10 = [v9 valueForHTTPHeaderField:@"Proxy-Authorization"];

    double v11 = GEOGetNetworkRequestLog();
    uint64_t v12 = v11;
    os_signpost_id_t signpostId = self->_signpostId;
    if (signpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      parentTask = self->_parentTask;
      if (parentTask) {
        parentTask = (GEORequestCounterTicketBase *)parentTask->_signpostId;
      }
      appId = self->_appId;
      int v16 = self->_type.subtype.raw | self->_type.type;
      if (v10) {
        int v17 = 89;
      }
      else {
        int v17 = 78;
      }
      int v18 = 134218754;
      v19 = parentTask;
      __int16 v20 = 2112;
      int v21 = appId;
      __int16 v22 = 1024;
      int v23 = v16;
      __int16 v24 = 1024;
      int v25 = v17;
      _os_signpost_emit_with_name_impl(&dword_188D96000, v12, OS_SIGNPOST_INTERVAL_BEGIN, signpostId, "RequestInterval", "Parent=%#llx App=%@ RequestKind=%#05x Proxied=%c", (uint8_t *)&v18, 0x22u);
    }
  }
}

+ (id)requestCounterTicketForType:(id)a3 auditToken:(id)a4 traits:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  double v10 = [v9 bundleId];
  double v11 = [v9 offlineCohortId];

  uint64_t v12 = [a1 _requestCounterTicketForType:a3 appId:v10 traits:v8 offlineCohortId:v11 withParent:0 logNetworkActivityOnly:0];

  return v12;
}

+ (id)_requestCounterTicketForType:(id)a3 appId:(id)a4 traits:(id)a5 offlineCohortId:(id)a6 withParent:(id)a7 logNetworkActivityOnly:(BOOL)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  int v17 = a7;
  if ([v14 length])
  {
    int v18 = (char *)objc_alloc_init((Class)a1);
    if (v18)
    {
      uint64_t v19 = [v14 copy];
      __int16 v20 = (void *)*((void *)v18 + 1);
      *((void *)v18 + 1) = v19;

      uint64_t v21 = [v16 copy];
      __int16 v22 = (void *)*((void *)v18 + 2);
      *((void *)v18 + 2) = v21;

      int v23 = v17 ? v17[6] : [v15 requestMode];
      *((_DWORD *)v18 + 6) = v23;
      *((void *)v18 + 16) = 0;
      *($C4D369C9F02205611300857CFD58F739 *)(v18 + 28) = a3;
      v18[36] = a8;
      __int16 v24 = GEOGetNetworkRequestLog();
      *((void *)v18 + 15) = os_signpost_id_generate(v24);

      *(_OWORD *)(v18 + 40) = xmmword_18A62D110;
      v18[37] = -2;
      if ([v14 length])
      {
        int v25 = GEORequestCounterNWActivityDomainForAppId(v14);
        int v26 = GEODataRequestKindToNWActivityLabel(*(void *)&a3);
        if (v25)
        {
          if (v26)
          {
            uint64_t v27 = nw_activity_create();
            unint64_t v28 = (void *)*((void *)v18 + 13);
            *((void *)v18 + 13) = v27;

            if (v17)
            {
              objc_storeStrong((id *)v18 + 10, a7);
              if (*((void *)v18 + 13))
              {
                if (*((void *)v17 + 13)) {
                  nw_activity_set_parent_activity();
                }
              }
            }
            nw_activity_activate();
          }
        }
      }
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v30 = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: appId.length > 0", v30, 2u);
    }
    int v18 = 0;
  }

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nwActivity, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_parentTask, 0);
  objc_storeStrong((id *)&self->_offlineCohortId, 0);

  objc_storeStrong((id *)&self->_appId, 0);
}

- (void)startingRequestWithExplicitInterfaces:(unint64_t)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  self->_explicitInterfaces = a3;
  if (self->_nwActivity && !self->_nwActivityCompleted) {
    nw_activity_activate();
  }
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  [v4 timeIntervalSinceReferenceDate];
  self->_start = v5;

  if (self->_signpostId + 1 >= 2)
  {
    v6 = [(NSURLSessionTask *)self->_task originalRequest];
    v7 = [v6 valueForHTTPHeaderField:@"Proxy-Authorization"];

    id v8 = GEOGetNetworkRequestLog();
    id v9 = v8;
    os_signpost_id_t signpostId = self->_signpostId;
    if (signpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      parentTask = self->_parentTask;
      if (parentTask) {
        parentTask = (GEORequestCounterTicketBase *)parentTask->_signpostId;
      }
      appId = self->_appId;
      int v13 = self->_type.subtype.raw | self->_type.type;
      if (v7) {
        int v14 = 89;
      }
      else {
        int v14 = 78;
      }
      int v15 = 134218754;
      id v16 = parentTask;
      __int16 v17 = 2112;
      int v18 = appId;
      __int16 v19 = 1024;
      int v20 = v13;
      __int16 v21 = 1024;
      int v22 = v14;
      _os_signpost_emit_with_name_impl(&dword_188D96000, v9, OS_SIGNPOST_INTERVAL_BEGIN, signpostId, "RequestInterval", "Parent=%#llx App=%@ RequestKind=%#05x Proxied=%c", (uint8_t *)&v15, 0x22u);
    }
  }
}

- (void)dealloc
{
  if (self->_nwActivity && !self->_nwActivityCompleted)
  {
    nw_activity_complete_with_reason();
    self->_nwActivityCompleted = 1;
  }
  parentTask = self->_parentTask;
  if (parentTask && self->_result == 254)
  {
    [(GEORequestCounterTicketBase *)parentTask _subTask:self completed:255 error:0 started:0 finished:0 xmitBytes:0 recvBytes:0.0 usedInterfaces:0.0];
    id v4 = self->_parentTask;
    self->_parentTask = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)GEORequestCounterTicketBase;
  [(GEORequestCounterTicketBase *)&v5 dealloc];
}

- (id)createSubtask:(BOOL)a3
{
  if (self->_result == 254)
  {
    ++self->_subtasks;
    v3 = [(id)objc_opt_class() _requestCounterTicketForType:*(void *)&self->_type appId:self->_appId traits:0 offlineCohortId:self->_offlineCohortId withParent:self logNetworkActivityOnly:a3];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)_subTask:(id)a3 completed:(unsigned __int8)a4 error:(id)a5 started:(double)a6 finished:(double)a7 xmitBytes:(int64_t)a8 recvBytes:(int64_t)a9 usedInterfaces:(unint64_t)a10
{
  long long v24 = *(_OWORD *)&a7;
  int v14 = a4;
  id v26 = a3;
  id v16 = a5;
  unsigned __int8 subtasks = self->_subtasks;
  if (subtasks)
  {
    if (v14 == 255) {
      goto LABEL_5;
    }
    int64_t subTaskRecvBytes = self->_subTaskRecvBytes;
    int64_t v19 = self->_subTaskXmitBytes + a8;
    v20.f64[0] = self->_start;
    *(void *)&v20.f64[1] = v24;
    v21.f64[1] = self->_end;
    v21.f64[0] = a6;
    int8x16_t v22 = (int8x16_t)vcgtq_f64(v21, v20);
    v20.f64[0] = a6;
    *(int8x16_t *)&self->_start = vbslq_s8(v22, *(int8x16_t *)&self->_start, (int8x16_t)v20);
    self->_subTaskXmitBytes = v19;
    self->_int64_t subTaskRecvBytes = subTaskRecvBytes + a9;
    self->_subTaskUsedInterfaces |= a10;
    if ((v14 - 1) > 0xFD)
    {
LABEL_5:
      unsigned __int8 v23 = subtasks - 1;
      self->_unsigned __int8 subtasks = v23;
      if (v23) {
        goto LABEL_7;
      }
    }
    else
    {
      self->_unsigned __int8 subtasks = 0;
      self->_subTaskResult = v14;
    }
    -[GEORequestCounterTicketBase requestCompleted:](self, "requestCompleted:", v16, v24);
  }
LABEL_7:
}

- (void)explicitInterfaceRequestCompleted:(id)a3 xmitBytes:(unint64_t)a4 recvBytes:(unint64_t)a5
{
  id v8 = a3;
  if (self->_explicitInterfaces)
  {
    [(GEORequestCounterTicketBase *)self _requestCompletedWithError:v8 xmitBytes:a4 recvBytes:a5];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: _explicitInterfaces != 0", v9, 2u);
  }
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<RT %p app: %@ %@>", self, self->_appId, self->_nwActivity];
}

- (void)_incrementForApp:(id)a3 offlineCohortId:(id)a4 requestMode:(int)a5 startTime:(id)a6 endTime:(id)a7 requestType:(id)a8 result:(unsigned __int8)a9 error:(id)a10 xmitBytes:(int64_t)a11 recvBytes:(int64_t)a12 usedInterfaces:(unint64_t)a13
{
}

- (NSString)appId
{
  return self->_appId;
}

@end