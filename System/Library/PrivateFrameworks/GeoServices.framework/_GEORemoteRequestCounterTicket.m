@interface _GEORemoteRequestCounterTicket
+ (id)requestCounterTicketForType:(id)a3 auditToken:(id)a4 traits:(id)a5 remoteProxy:(id)a6;
- (void)_incrementForApp:(id)a3 offlineCohortId:(id)a4 requestMode:(int)a5 startTime:(id)a6 endTime:(id)a7 requestType:(id)a8 result:(unsigned __int8)a9 error:(id)a10 xmitBytes:(int64_t)a11 recvBytes:(int64_t)a12 usedInterfaces:(unint64_t)a13;
@end

@implementation _GEORemoteRequestCounterTicket

+ (id)requestCounterTicketForType:(id)a3 auditToken:(id)a4 traits:(id)a5 remoteProxy:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (!v10)
  {
    id v10 = +[GEOApplicationAuditToken currentProcessAuditToken];
  }
  uint64_t v13 = [a1 requestCounterTicketForType:a3 auditToken:v10 traits:v11];
  v14 = (void *)v13;
  if (v13) {
    objc_storeStrong((id *)(v13 + 136), a6);
  }

  return v14;
}

- (void)_incrementForApp:(id)a3 offlineCohortId:(id)a4 requestMode:(int)a5 startTime:(id)a6 endTime:(id)a7 requestType:(id)a8 result:(unsigned __int8)a9 error:(id)a10 xmitBytes:(int64_t)a11 recvBytes:(int64_t)a12 usedInterfaces:(unint64_t)a13
{
}

- (void).cxx_destruct
{
}

@end