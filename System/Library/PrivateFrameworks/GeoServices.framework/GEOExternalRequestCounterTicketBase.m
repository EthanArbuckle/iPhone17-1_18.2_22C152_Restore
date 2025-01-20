@interface GEOExternalRequestCounterTicketBase
+ (id)externalRequestCounterForType:(id)a3 subtype:(id)a4 source:(id)a5 appId:(id)a6;
- (void)_incrementExternalForApp:(id)a3 startTime:(id)a4 endTime:(id)a5 xmitBytes:(int64_t)a6 recvBytes:(int64_t)a7 usedInterfaces:(unint64_t)a8 requestType:(id)a9 requestSubtype:(id)a10 source:(id)a11;
- (void)requestCompletedWithAMPResult:(id)a3;
@end

@implementation GEOExternalRequestCounterTicketBase

+ (id)externalRequestCounterForType:(id)a3 subtype:(id)a4 source:(id)a5 appId:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = objc_alloc_init((Class)a1);
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    v16 = (void *)v14[1];
    v14[1] = v15;

    uint64_t v17 = [v11 copy];
    v18 = (void *)v14[2];
    v14[2] = v17;

    uint64_t v19 = [v12 copy];
    v20 = (void *)v14[3];
    v14[3] = v19;

    uint64_t v21 = [MEMORY[0x1E4F1C9C8] date];
    v22 = (void *)v14[4];
    v14[4] = v21;

    uint64_t v23 = [v13 copy];
    v24 = (void *)v14[5];
    v14[5] = v23;
  }

  return v14;
}

- (void)_incrementExternalForApp:(id)a3 startTime:(id)a4 endTime:(id)a5 xmitBytes:(int64_t)a6 recvBytes:(int64_t)a7 usedInterfaces:(unint64_t)a8 requestType:(id)a9 requestSubtype:(id)a10 source:(id)a11
{
}

- (void)requestCompletedWithAMPResult:(id)a3
{
  id v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
  startDate = self->_startDate;
  appId = self->_appId;
  v6 = [MEMORY[0x1E4F1C9C8] date];
  -[GEOExternalRequestCounterTicketBase _incrementExternalForApp:startTime:endTime:xmitBytes:recvBytes:usedInterfaces:requestType:requestSubtype:source:](self, "_incrementExternalForApp:startTime:endTime:xmitBytes:recvBytes:usedInterfaces:requestType:requestSubtype:source:", appId, startDate, v6, 0, [v7 length], 0, self->_requestType, self->_requestSubtype, self->_source);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appId, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_requestSubtype, 0);

  objc_storeStrong((id *)&self->_requestType, 0);
}

@end