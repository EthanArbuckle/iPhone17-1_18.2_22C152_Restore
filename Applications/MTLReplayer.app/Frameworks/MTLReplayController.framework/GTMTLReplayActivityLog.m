@interface GTMTLReplayActivityLog
- (GTMTLReplayActivityLog)initWithLog:(id)a3;
- (NSString)gputracePath;
- (id)description;
- (id)getBreadcrumbSummary;
- (id)getBreadcrumbsAsJSON;
- (id)init:(BOOL)a3;
- (void)enterActivity:(id)a3;
- (void)enterArgumentBufferDownload;
- (void)enterArgumentBufferUpload;
- (void)enterCollectCounters:(id)a3 statLocations:(unint64_t)a4 withIndex:(unint64_t)a5;
- (void)enterDebugFuncStopFromIndex:(id)a3 toIndex:(id)a4;
- (void)enterDisplayAttachmentAtIndex:(id)a3;
- (void)enterHarvestResourceObjectWithAttributes:(id)a3;
- (void)enterLoadArchiveWithPath:(id)a3;
- (void)enterMessage:(id)a3;
- (void)enterOptimizeRestores;
- (void)enterPerformFrameTimingForIndex:(int)a3;
- (void)enterRestoreCommandBufferAtIndex:(unsigned int)a3;
- (void)enterRestoreResources:(const GTResourceDownloaderRequest *)a3 count:(int)a4;
- (void)enterRewind;
- (void)leaveActivity;
- (void)logActivitiesToFile:(id)a3;
- (void)logCommandBuffer:(id)a3 atIndex:(unsigned int)a4;
- (void)logCommandBuffer:(id)a3 withKey:(unint64_t)a4;
- (void)logSharedCommandBuffer:(id)a3;
@end

@implementation GTMTLReplayActivityLog

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastActivity, 0);
  objc_storeStrong((id *)&self->_lastBreadcrumb, 0);
  objc_storeStrong((id *)&self->_gputracePath, 0);

  objc_storeStrong((id *)&self->_log, 0);
}

- (NSString)gputracePath
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)enterOptimizeRestores
{
  v3 = [[GTMTLReplayActivity alloc] initWithType:@"optimizeRestores"];
  [(GTMTLReplayActivityLog *)self enterActivity:v3];
}

- (void)enterDisplayAttachmentAtIndex:(id)a3
{
  v4 = [[GTMTLReplayActivityDisplayAttachment alloc] initWithIndex:a3];
  [(GTMTLReplayActivityLog *)self enterActivity:v4];
}

- (void)enterPerformFrameTimingForIndex:(int)a3
{
  v4 = [[GTMTLReplayActivityPerformFrameTiming alloc] initWithIndex:*(void *)&a3];
  [(GTMTLReplayActivityLog *)self enterActivity:v4];
}

- (void)enterCollectCounters:(id)a3 statLocations:(unint64_t)a4 withIndex:(unint64_t)a5
{
  id v8 = a3;
  v9 = [[GTMTLReplayActivityCollectCounters alloc] initWithCounters:v8 statLocations:a4 index:a5];

  [(GTMTLReplayActivityLog *)self enterActivity:v9];
}

- (void)enterDebugFuncStopFromIndex:(id)a3 toIndex:(id)a4
{
  v5 = [[GTMTLReplayActivityDebugFuncStop alloc] initWithCurrentIndex:a3 targetIndex:a4];
  [(GTMTLReplayActivityLog *)self enterActivity:v5];
}

- (void)enterArgumentBufferDownload
{
  v3 = [[GTMTLReplayActivity alloc] initWithType:@"argumentBufferDownload"];
  [(GTMTLReplayActivityLog *)self enterActivity:v3];
}

- (void)enterArgumentBufferUpload
{
  v3 = [[GTMTLReplayActivity alloc] initWithType:@"argumentBufferUpload"];
  [(GTMTLReplayActivityLog *)self enterActivity:v3];
}

- (void)enterRewind
{
  v3 = [[GTMTLReplayActivity alloc] initWithType:@"rewind"];
  [(GTMTLReplayActivityLog *)self enterActivity:v3];
}

- (void)enterRestoreResources:(const GTResourceDownloaderRequest *)a3 count:(int)a4
{
  v5 = [[GTMTLReplayActivityRestoreResources alloc] initWithRequests:a3 count:*(void *)&a4];
  [(GTMTLReplayActivityLog *)self enterActivity:v5];
}

- (void)enterRestoreCommandBufferAtIndex:(unsigned int)a3
{
  v4 = [[GTMTLReplayActivityRestoreCommandBuffer alloc] initWithIndex:*(void *)&a3];
  [(GTMTLReplayActivityLog *)self enterActivity:v4];
}

- (void)enterHarvestResourceObjectWithAttributes:(id)a3
{
  id v4 = a3;
  v5 = [[GTMTLReplayActivityHarvestResourceObject alloc] initWithAttributes:v4];

  [(GTMTLReplayActivityLog *)self enterActivity:v5];
}

- (void)enterLoadArchiveWithPath:(id)a3
{
  id v4 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  gputracePath = self->_gputracePath;
  self->_gputracePath = v4;
  v6 = v4;

  os_unfair_lock_unlock(&self->_lock);
  v7 = [[GTMTLReplayActivityLoadArchive alloc] initWithPath:v6];

  [(GTMTLReplayActivityLog *)self enterActivity:v7];
}

- (void)enterMessage:(id)a3
{
  id v4 = a3;
  v5 = [[GTMTLReplayActivityMessage alloc] initWithMessage:v4];

  [(GTMTLReplayActivityLog *)self enterActivity:v5];
}

- (void)leaveActivity
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v7 = self->_lastBreadcrumb;
  id v4 = [(GTMTLReplayActivity *)v7 previousActivity];
  lastBreadcrumb = self->_lastBreadcrumb;
  self->_lastBreadcrumb = v4;

  if (!self->_lastBreadcrumb && self->_retainActivityLog)
  {
    v6 = (GTMTLReplayActivity *)[(GTMTLReplayActivity *)v7 copy];

    [(GTMTLReplayActivity *)v6 setEndTime:mach_absolute_time()];
    [(GTMTLReplayActivity *)v6 setPreviousActivity:self->_lastActivity];
    objc_storeStrong((id *)&self->_lastActivity, v6);
    v7 = v6;
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)enterActivity:(id)a3
{
  id v4 = (GTMTLReplayActivity *)a3;
  os_unfair_lock_lock(&self->_lock);
  [(GTMTLReplayActivity *)v4 setPreviousActivity:self->_lastBreadcrumb];
  lastBreadcrumb = self->_lastBreadcrumb;
  self->_lastBreadcrumb = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)getBreadcrumbsAsJSON
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = ArrayFromActivities(self->_lastBreadcrumb, 1);
  v5 = +[NSJSONSerialization dataWithJSONObject:v4 options:3 error:0];

  os_unfair_lock_unlock(p_lock);

  return v5;
}

- (id)getBreadcrumbSummary
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = BreadcrumbSummary(self->_lastBreadcrumb);
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)logSharedCommandBuffer:(id)a3
{
}

- (void)logCommandBuffer:(id)a3 withKey:(unint64_t)a4
{
  if (a3)
  {
    p_lock = &self->_lock;
    id v7 = a3;
    os_unfair_lock_lock(p_lock);
    id v8 = self->_gputracePath;
    v9 = self->_lastBreadcrumb;
    v10 = self->_lastActivity;
    [(GTMTLReplayActivity *)v9 signpostIntervalBegin:os_signpost_id_make_with_pointer((os_log_t)g_signpostLog, v7)];
    os_unfair_lock_unlock(p_lock);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = __51__GTMTLReplayActivityLog_logCommandBuffer_withKey___block_invoke;
    v14[3] = &unk_7456F0;
    v18 = v10;
    unint64_t v19 = a4;
    v15 = v9;
    v16 = v8;
    v17 = self;
    v11 = v10;
    v12 = v8;
    v13 = v9;
    [v7 addCompletedHandler:v14];
  }
}

void __51__GTMTLReplayActivityLog_logCommandBuffer_withKey___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = g_signpostLog;
  os_signpost_id_t v5 = os_signpost_id_make_with_pointer((os_log_t)g_signpostLog, v3);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v6 = v5;
    if (os_signpost_enabled((os_log_t)v4))
    {
      *(_DWORD *)buf = 134217984;
      id v18 = [v3 status];
      _os_signpost_emit_with_name_impl(&def_1C1270, (os_log_t)v4, OS_SIGNPOST_INTERVAL_END, v6, "Replayer-3-commandQueue", "%lu", buf, 0xCu);
    }
  }

  if ([v3 status] == (char *)&dword_4 + 1)
  {
    id v7 = +[NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 64), @"GTErrorKeyTraceStreamID"];
    v16[0] = v7;
    v15[1] = @"GTErrorKeyMTLCommandBuffer";
    id v8 = GTMTLReplay_dictionaryFromCommandBuffer(v3);
    v16[1] = v8;
    v15[2] = @"GTErrorKeyReplayerContext";
    v9 = BreadcrumbSummary(*(void **)(a1 + 32));
    v16[2] = v9;
    v15[3] = @"GTErrorKeyReplayerBreadcrumbs";
    v10 = ArrayFromActivities(*(void **)(a1 + 32), 1);
    v11 = +[NSJSONSerialization dataWithJSONObject:v10 options:3 error:0];
    v16[3] = v11;
    v15[4] = @"GTErrorKeyGputracePath";
    v12 = *(void **)(a1 + 40);
    v13 = v12;
    if (!v12)
    {
      v13 = +[NSNull null];
    }
    v16[4] = v13;
    v14 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:5];
    if (!v12) {

    }
    [*(id *)(a1 + 48) logActivitiesToFile:*(void *)(a1 + 56)];
    GTMTLReplay_handleCommandBufferError((uint64_t)v14);
  }
}

- (void)logCommandBuffer:(id)a3 atIndex:(unsigned int)a4
{
  if (a3)
  {
    p_lock = &self->_lock;
    id v7 = a3;
    os_unfair_lock_lock(p_lock);
    id v8 = self->_gputracePath;
    v9 = self->_lastBreadcrumb;
    v10 = self->_lastActivity;
    [(GTMTLReplayActivity *)v9 signpostIntervalBegin:os_signpost_id_make_with_pointer((os_log_t)g_signpostLog, v7)];
    os_unfair_lock_unlock(p_lock);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = __51__GTMTLReplayActivityLog_logCommandBuffer_atIndex___block_invoke;
    v14[3] = &unk_7456C8;
    unsigned int v19 = a4;
    v15 = v9;
    v16 = v8;
    v17 = self;
    id v18 = v10;
    v11 = v10;
    v12 = v8;
    v13 = v9;
    [v7 addCompletedHandler:v14];
  }
}

void __51__GTMTLReplayActivityLog_logCommandBuffer_atIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = g_signpostLog;
  os_signpost_id_t v5 = os_signpost_id_make_with_pointer((os_log_t)g_signpostLog, v3);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v6 = v5;
    if (os_signpost_enabled((os_log_t)v4))
    {
      *(_DWORD *)buf = 134217984;
      id v18 = [v3 status];
      _os_signpost_emit_with_name_impl(&def_1C1270, (os_log_t)v4, OS_SIGNPOST_INTERVAL_END, v6, "Replayer-3-commandQueue", "%lu", buf, 0xCu);
    }
  }

  if ([v3 status] == (char *)&dword_4 + 1)
  {
    id v7 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 64), @"GTErrorKeyFunctionIndex"];
    v16[0] = v7;
    v15[1] = @"GTErrorKeyMTLCommandBuffer";
    id v8 = GTMTLReplay_dictionaryFromCommandBuffer(v3);
    v16[1] = v8;
    v15[2] = @"GTErrorKeyReplayerContext";
    v9 = BreadcrumbSummary(*(void **)(a1 + 32));
    v16[2] = v9;
    v15[3] = @"GTErrorKeyReplayerBreadcrumbs";
    v10 = ArrayFromActivities(*(void **)(a1 + 32), 1);
    v11 = +[NSJSONSerialization dataWithJSONObject:v10 options:3 error:0];
    v16[3] = v11;
    v15[4] = @"GTErrorKeyGputracePath";
    v12 = *(void **)(a1 + 40);
    v13 = v12;
    if (!v12)
    {
      v13 = +[NSNull null];
    }
    v16[4] = v13;
    v14 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:5];
    if (!v12) {

    }
    [*(id *)(a1 + 48) logActivitiesToFile:*(void *)(a1 + 56)];
    GTMTLReplay_handleCommandBufferError((uint64_t)v14);
  }
}

- (void)logActivitiesToFile:(id)a3
{
  id v4 = ArrayFromActivities(a3, 1);
  os_signpost_id_t v5 = +[NSJSONSerialization dataWithJSONObject:v4 options:3 error:0];

  id v6 = objc_alloc((Class)NSURL);
  id v7 = +[NSFileManager defaultManager];
  id v8 = [v7 temporaryDirectory];
  id v9 = [v6 initFileURLWithPath:@"GTMTLReplayActivityLog.json" relativeToURL:v8];

  [v5 writeToURL:v9 atomically:0];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    v11 = log;
    v12 = [v9 path];
    int v13 = 138543362;
    v14 = v12;
    _os_log_impl(&def_1C1270, v11, OS_LOG_TYPE_INFO, "logPath:\t%{public}@", (uint8_t *)&v13, 0xCu);
  }
}

- (id)description
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = ArrayFromActivities(self->_lastBreadcrumb, 1);
  os_signpost_id_t v5 = [v4 description];

  os_unfair_lock_unlock(p_lock);

  return v5;
}

- (GTMTLReplayActivityLog)initWithLog:(id)a3
{
  id v4 = (id *)a3;
  v9.receiver = self;
  v9.super_class = (Class)GTMTLReplayActivityLog;
  os_signpost_id_t v5 = [(GTMTLReplayActivityLog *)&v9 init];
  id v6 = v5;
  if (v5)
  {
    if (!v4)
    {
      id v7 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v5->_log, v4[1]);
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_gputracePath, v4[2]);
    objc_storeStrong((id *)&v6->_lastBreadcrumb, v4[3]);
    objc_storeStrong((id *)&v6->_lastActivity, v4[4]);
    v6->_retainActivityLog = *((unsigned char *)v4 + 40);
  }
  id v7 = v6;
LABEL_6:

  return v7;
}

- (id)init:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GTMTLReplayActivityLog;
  id v4 = [(GTMTLReplayActivityLog *)&v7 init];
  os_signpost_id_t v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_log, &_os_log_default);
    v5->_lock._os_unfair_lock_opaque = 0;
    v5->_retainActivityLog = a3;
  }
  return v5;
}

@end