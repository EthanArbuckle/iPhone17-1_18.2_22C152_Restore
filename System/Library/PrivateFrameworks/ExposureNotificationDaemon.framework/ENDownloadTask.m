@interface ENDownloadTask
+ (id)taskWithEndpointState:(id)a3 date:(id)a4 group:(id)a5 scheduler:(id)a6;
- (BOOL)didDefer;
- (BOOL)shouldDefer;
- (ENDownloadEndpointState)endpointState;
- (NSDate)date;
- (NSString)shortIdentifier;
- (unint64_t)downloadCount;
- (void)finishDeferred:(BOOL)a3 error:(id)a4;
- (void)incrementDownloadCount;
@end

@implementation ENDownloadTask

+ (id)taskWithEndpointState:(id)a3 date:(id)a4 group:(id)a5 scheduler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = (id *)objc_alloc_init((Class)a1);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong(v15 + 4, a3);
    uint64_t v17 = [v12 copy];
    id v18 = v16[5];
    v16[5] = (id)v17;

    objc_storeStrong(v16 + 1, a5);
    objc_storeStrong(v16 + 2, a6);
  }

  return v16;
}

- (void)incrementDownloadCount
{
}

- (BOOL)shouldDefer
{
  scheduler = self->_scheduler;
  if (scheduler) {
    LOBYTE(scheduler) = [(NSBackgroundActivityScheduler *)scheduler shouldDefer];
  }
  return (char)scheduler;
}

- (void)finishDeferred:(BOOL)a3 error:(id)a4
{
  id v6 = a4;
  if (!self->_finished)
  {
    id v9 = v6;
    [(NSDate *)self->_date timeIntervalSinceNow];
    if (v9)
    {
      if (gLogCategory_ENDownloadManager > 90
        || gLogCategory_ENDownloadManager == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_13;
      }
      v7 = [(ENDownloadTask *)self shortIdentifier];
      v8 = CUPrintNSError();
      LogPrintF_safe();
    }
    else
    {
      if (gLogCategory_ENDownloadManager > 50
        || gLogCategory_ENDownloadManager == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_13;
      }
      v7 = [(ENDownloadTask *)self shortIdentifier];
      LogPrintF_safe();
    }

LABEL_13:
    self->_finished = 1;
    self->_didDefer = a3;
    dispatch_group_leave((dispatch_group_t)self->_group);
    id v6 = v9;
  }
}

- (NSString)shortIdentifier
{
  return [(ENDownloadEndpointState *)self->_endpointState shortIdentifier];
}

- (ENDownloadEndpointState)endpointState
{
  return self->_endpointState;
}

- (NSDate)date
{
  return self->_date;
}

- (BOOL)didDefer
{
  return self->_didDefer;
}

- (unint64_t)downloadCount
{
  return self->_downloadCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_endpointState, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);

  objc_storeStrong((id *)&self->_group, 0);
}

@end