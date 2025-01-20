@interface _GEOLocalRequestCounterTicket
+ (id)requestCounterTicketForType:(id)a3 auditToken:(id)a4 traits:(id)a5 persistence:(id)a6;
- (void)_incrementForApp:(id)a3 offlineCohortId:(id)a4 requestMode:(int)a5 startTime:(id)a6 endTime:(id)a7 requestType:(id)a8 result:(unsigned __int8)a9 error:(id)a10 xmitBytes:(int64_t)a11 recvBytes:(int64_t)a12 usedInterfaces:(unint64_t)a13;
@end

@implementation _GEOLocalRequestCounterTicket

- (void).cxx_destruct
{
}

- (void)_incrementForApp:(id)a3 offlineCohortId:(id)a4 requestMode:(int)a5 startTime:(id)a6 endTime:(id)a7 requestType:(id)a8 result:(unsigned __int8)a9 error:(id)a10 xmitBytes:(int64_t)a11 recvBytes:(int64_t)a12 usedInterfaces:(unint64_t)a13
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a6;
  id v19 = a7;
  id v20 = a10;
  id v21 = a4;
  v22 = GEOGetNetworkRequestLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    [v18 timeIntervalSinceReferenceDate];
    uint64_t v24 = v23;
    [v19 timeIntervalSinceReferenceDate];
    *(_DWORD *)buf = 138414082;
    id v32 = v17;
    __int16 v33 = 1024;
    int v34 = a8.var1.var0 | a8.var0;
    __int16 v35 = 1024;
    int v36 = a9;
    __int16 v37 = 2048;
    uint64_t v38 = v24;
    __int16 v39 = 2048;
    uint64_t v40 = v25;
    __int16 v41 = 1024;
    int v42 = a11;
    __int16 v43 = 1024;
    int v44 = a12;
    __int16 v45 = 1024;
    int v46 = a13;
    _os_log_impl(&dword_188D96000, v22, OS_LOG_TYPE_DEFAULT, "A:%@,T:%d,R:%d,B:%.6f,E:%.6f,S:%d,V:%d,M:%d", buf, 0x3Eu);
  }

  v26 = +[GEORequestCountPowerLogger sharedInstance];
  [v26 incrementCountForClient:v17 requestType:(a8.var1.var0 | a8.var0)];

  v27 = +[GEOOfflineStateManager shared];
  if ([v21 length]) {
    id v28 = v21;
  }
  else {
    id v28 = v17;
  }
  [v19 timeIntervalSinceDate:v18];
  objc_msgSend(v27, "reportResponse:usedInterfaces:requestMode:forCohortId:duration:error:", a8, a13, a5, v28, v20);

  [(GEORequestCounterPersistence *)self->_persistence incrementForApp:v17 startTime:v18 endTime:v19 requestType:(a8.var1.var0 | a8.var0) result:a9 xmitBytes:a11 recvBytes:a12 usedInterfaces:a13 withCompletion:0];
}

+ (id)requestCounterTicketForType:(id)a3 auditToken:(id)a4 traits:(id)a5 persistence:(id)a6
{
  id v11 = a6;
  uint64_t v12 = [a1 requestCounterTicketForType:a3 auditToken:a4 traits:a5];
  v13 = (void *)v12;
  if (v12) {
    objc_storeStrong((id *)(v12 + 136), a6);
  }

  return v13;
}

@end