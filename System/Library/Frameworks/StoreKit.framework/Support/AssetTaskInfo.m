@interface AssetTaskInfo
+ (id)newTaskInfoForTask:(id)a3;
+ (id)taskInfoForTask:(id)a3;
+ (void)recordTaskInfo:(id)a3 forTask:(id)a4;
+ (void)removeAllTaskInfo;
+ (void)removeTaskInfo:(id)a3;
- (AssetPromise)promise;
- (AssetRequestProperties)properties;
- (AssetTaskInfo)initWithTask:(id)a3;
- (BOOL)ignoreAssetCache;
- (KeepAlive)keepAlive;
- (NSError)error;
- (NSProgress)progress;
- (NSString)configurationID;
- (NSString)logKey;
- (NSURLRequest)request;
- (NSURLSession)session;
- (NSURLSessionTask)task;
- (NSURLSessionTaskMetrics)metrics;
- (OS_nw_activity)networkActivity;
- (int64_t)action;
- (unint64_t)bytesReceived;
- (unint64_t)requestOffset;
- (unint64_t)signpostId;
- (void)setAction:(int64_t)a3;
- (void)setBytesReceived:(unint64_t)a3;
- (void)setConfigurationID:(id)a3;
- (void)setError:(id)a3;
- (void)setIgnoreAssetCache:(BOOL)a3;
- (void)setKeepAlive:(id)a3;
- (void)setLogKey:(id)a3;
- (void)setMetrics:(id)a3;
- (void)setNetworkActivity:(id)a3;
- (void)setProgress:(id)a3;
- (void)setPromise:(id)a3;
- (void)setProperties:(id)a3;
- (void)setRequest:(id)a3;
- (void)setRequestOffset:(unint64_t)a3;
- (void)setSession:(id)a3;
- (void)setSignpostId:(unint64_t)a3;
@end

@implementation AssetTaskInfo

+ (id)newTaskInfoForTask:(id)a3
{
  id v4 = a3;
  v5 = [[AssetTaskInfo alloc] initWithTask:v4];
  [a1 recordTaskInfo:v5 forTask:v4];

  return v5;
}

- (AssetTaskInfo)initWithTask:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AssetTaskInfo;
  v6 = [(AssetTaskInfo *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_task, a3);
    uint64_t v8 = [v5 originalRequest];
    request = v7->_request;
    v7->_request = (NSURLRequest *)v8;
  }
  return v7;
}

+ (void)recordTaskInfo:(id)a3 forTask:(id)a4
{
  v15 = a3;
  id v5 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1003A0858);
  if (!qword_1003A0850)
  {
    uint64_t v6 = +[NSMapTable strongToStrongObjectsMapTable];
    v7 = (void *)qword_1003A0850;
    qword_1003A0850 = v6;
  }
  uint64_t v8 = [v15 task];

  if (v8)
  {
    v9 = (void *)qword_1003A0850;
    v10 = [v15 task];
    [v9 removeObjectForKey:v10];
  }
  objc_super v11 = (void *)v15[17];
  v15[17] = v5;
  id v12 = v5;

  v13 = (void *)qword_1003A0850;
  v14 = [v15 task];
  [v13 setObject:v15 forKey:v14];

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1003A0858);
}

+ (void)removeAllTaskInfo
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1003A0858);
  v2 = (void *)qword_1003A0850;
  qword_1003A0850 = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1003A0858);
}

+ (void)removeTaskInfo:(id)a3
{
  id v5 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1003A0858);
  v3 = (void *)qword_1003A0850;
  if (qword_1003A0850)
  {
    id v4 = [v5 task];
    [v3 removeObjectForKey:v4];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1003A0858);
}

+ (id)taskInfoForTask:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1003A0858);
  if (qword_1003A0850)
  {
    id v4 = [(id)qword_1003A0850 objectForKey:v3];
  }
  else
  {
    id v4 = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1003A0858);

  return v4;
}

- (int64_t)action
{
  return self->_action;
}

- (void)setAction:(int64_t)a3
{
  self->_action = a3;
}

- (unint64_t)bytesReceived
{
  return self->_bytesReceived;
}

- (void)setBytesReceived:(unint64_t)a3
{
  self->_bytesReceived = a3;
}

- (NSString)configurationID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setConfigurationID:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 40, 1);
}

- (void)setError:(id)a3
{
}

- (BOOL)ignoreAssetCache
{
  return self->_ignoreAssetCache;
}

- (void)setIgnoreAssetCache:(BOOL)a3
{
  self->_ignoreAssetCache = a3;
}

- (KeepAlive)keepAlive
{
  return (KeepAlive *)objc_getProperty(self, a2, 48, 1);
}

- (void)setKeepAlive:(id)a3
{
}

- (NSString)logKey
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLogKey:(id)a3
{
}

- (NSURLSessionTaskMetrics)metrics
{
  return (NSURLSessionTaskMetrics *)objc_getProperty(self, a2, 64, 1);
}

- (void)setMetrics:(id)a3
{
}

- (OS_nw_activity)networkActivity
{
  return (OS_nw_activity *)objc_getProperty(self, a2, 72, 1);
}

- (void)setNetworkActivity:(id)a3
{
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 80, 1);
}

- (void)setProgress:(id)a3
{
}

- (AssetPromise)promise
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_promise);

  return (AssetPromise *)WeakRetained;
}

- (void)setPromise:(id)a3
{
}

- (AssetRequestProperties)properties
{
  return (AssetRequestProperties *)objc_getProperty(self, a2, 96, 1);
}

- (void)setProperties:(id)a3
{
}

- (NSURLRequest)request
{
  return (NSURLRequest *)objc_getProperty(self, a2, 104, 1);
}

- (void)setRequest:(id)a3
{
}

- (unint64_t)requestOffset
{
  return self->_requestOffset;
}

- (void)setRequestOffset:(unint64_t)a3
{
  self->_requestOffset = a3;
}

- (NSURLSession)session
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);

  return (NSURLSession *)WeakRetained;
}

- (void)setSession:(id)a3
{
}

- (unint64_t)signpostId
{
  return self->_signpostId;
}

- (void)setSignpostId:(unint64_t)a3
{
  self->_signpostId = a3;
}

- (NSURLSessionTask)task
{
  return (NSURLSessionTask *)objc_getProperty(self, a2, 136, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_task, 0);
  objc_destroyWeak((id *)&self->_session);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_destroyWeak((id *)&self->_promise);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_networkActivity, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_keepAlive, 0);
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_configurationID, 0);
}

@end