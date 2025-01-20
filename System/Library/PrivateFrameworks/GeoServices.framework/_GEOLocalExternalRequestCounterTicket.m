@interface _GEOLocalExternalRequestCounterTicket
+ (id)externalRequestCounterForType:(id)a3 subtype:(id)a4 source:(id)a5 appId:(id)a6 persistence:(id)a7;
- (void)_incrementExternalForApp:(id)a3 startTime:(id)a4 endTime:(id)a5 xmitBytes:(int64_t)a6 recvBytes:(int64_t)a7 usedInterfaces:(unint64_t)a8 requestType:(id)a9 requestSubtype:(id)a10 source:(id)a11;
@end

@implementation _GEOLocalExternalRequestCounterTicket

+ (id)externalRequestCounterForType:(id)a3 subtype:(id)a4 source:(id)a5 appId:(id)a6 persistence:(id)a7
{
  id v13 = a7;
  v17.receiver = a1;
  v17.super_class = (Class)&OBJC_METACLASS____GEOLocalExternalRequestCounterTicket;
  uint64_t v14 = objc_msgSendSuper2(&v17, sel_externalRequestCounterForType_subtype_source_appId_, a3, a4, a5, a6);
  v15 = (void *)v14;
  if (v14) {
    objc_storeStrong((id *)(v14 + 48), a7);
  }

  return v15;
}

- (void)_incrementExternalForApp:(id)a3 startTime:(id)a4 endTime:(id)a5 xmitBytes:(int64_t)a6 recvBytes:(int64_t)a7 usedInterfaces:(unint64_t)a8 requestType:(id)a9 requestSubtype:(id)a10 source:(id)a11
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a9;
  id v20 = a10;
  id v21 = a11;
  v22 = GEOGetExternalRequestLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    [v17 timeIntervalSinceReferenceDate];
    uint64_t v24 = v23;
    [v18 timeIntervalSinceReferenceDate];
    *(_DWORD *)buf = 138414338;
    id v28 = v16;
    __int16 v29 = 2048;
    uint64_t v30 = v24;
    __int16 v31 = 2048;
    uint64_t v32 = v25;
    __int16 v33 = 2048;
    int64_t v34 = a6;
    __int16 v35 = 2048;
    int64_t v36 = a7;
    __int16 v37 = 2048;
    unint64_t v38 = a8;
    __int16 v39 = 2112;
    id v40 = v19;
    __int16 v41 = 2112;
    id v42 = v20;
    __int16 v43 = 2112;
    id v44 = v21;
    _os_log_impl(&dword_188D96000, v22, OS_LOG_TYPE_INFO, "A:%@,SD:%.6f,ED:%.6f,S:%lld,R:%lld,I:%lu,RT:%@,RS:%@,S:%@", buf, 0x5Cu);
  }

  [(GEORequestCounterPersistence *)self->_persistence incrementExternalForApp:v16 startTime:v17 endTime:v18 xmitBytes:a6 recvBytes:a7 usedInterfaces:a8 requestType:v19 requestSubtype:v20 source:v21];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_requestSubtype, 0);
  objc_storeStrong((id *)&self->_requestType, 0);
  objc_storeStrong((id *)&self->_startDate, 0);

  objc_storeStrong((id *)&self->_persistence, 0);
}

@end