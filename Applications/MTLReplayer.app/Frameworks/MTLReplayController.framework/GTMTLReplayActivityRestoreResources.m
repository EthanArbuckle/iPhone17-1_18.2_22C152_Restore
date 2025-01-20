@interface GTMTLReplayActivityRestoreResources
- (GTMTLReplayActivityRestoreResources)initWithRequests:(const GTResourceDownloaderRequest *)a3 count:(int)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)jsonObject;
- (id)summary;
- (void)outputToLog:(id)a3;
- (void)signpostIntervalBegin:(unint64_t)a3;
@end

@implementation GTMTLReplayActivityRestoreResources

- (void)signpostIntervalBegin:(unint64_t)a3
{
  v5 = g_signpostLog;
  v6 = v5;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v5))
  {
    unsigned int v7 = [(GTMTLReplayActivity *)self messageSerial];
    activityType = self->super._activityType;
    int requestCount = self->_requestCount;
    v10[0] = 67109634;
    v10[1] = v7;
    __int16 v11 = 2112;
    v12 = activityType;
    __int16 v13 = 1024;
    int v14 = requestCount;
    _os_signpost_emit_with_name_impl(&def_1C1270, v6, OS_SIGNPOST_INTERVAL_BEGIN, a3, "Replayer-3-commandQueue", "%u. %@ x%d", (uint8_t *)v10, 0x18u);
  }
}

- (void)outputToLog:(id)a3
{
  if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_INFO))
  {
    activityType = self->super._activityType;
    requests = self->_requests;
    int requestCount = self->_requestCount;
    v8 = a3;
    v9 = ArrayFromDownloadRequests((uint64_t)requests, requestCount);
    int v10 = 138543618;
    __int16 v11 = activityType;
    __int16 v12 = 2114;
    __int16 v13 = v9;
    _os_log_impl(&def_1C1270, v8, OS_LOG_TYPE_INFO, "%{public}@:\t%{public}@", (uint8_t *)&v10, 0x16u);
  }
}

- (id)jsonObject
{
  v9[0] = self->super._activityType;
  v8[0] = @"activityType";
  v8[1] = @"requests";
  v3 = ArrayFromDownloadRequests((uint64_t)self->_requests, self->_requestCount);
  v9[1] = v3;
  v8[2] = @"activityStartTime";
  v4 = +[NSNumber numberWithDouble:*(double *)&time_scale * (double)self->super._activityStartTime];
  v9[2] = v4;
  v8[3] = @"activityEndTime";
  v5 = +[NSNumber numberWithDouble:*(double *)&time_scale * (double)self->super._activityEndTime];
  v9[3] = v5;
  v6 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:4];

  return v6;
}

- (id)summary
{
  return @"Restoring resources";
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GTMTLReplayActivityRestoreResources;
  id result = [(GTMTLReplayActivity *)&v5 copyWithZone:a3];
  if (result)
  {
    *((void *)result + 5) = self->_requests;
    *((_DWORD *)result + 12) = self->_requestCount;
  }
  return result;
}

- (GTMTLReplayActivityRestoreResources)initWithRequests:(const GTResourceDownloaderRequest *)a3 count:(int)a4
{
  v7.receiver = self;
  v7.super_class = (Class)GTMTLReplayActivityRestoreResources;
  id result = [(GTMTLReplayActivity *)&v7 initWithType:@"restoreResources"];
  if (result)
  {
    result->_requests = a3;
    result->_int requestCount = a4;
  }
  return result;
}

@end