@interface JobManagerClient
- (JobManagerClient)initWithConnection:(id)a3;
@end

@implementation JobManagerClient

- (JobManagerClient)initWithConnection:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)JobManagerClient;
  v6 = [(XPCClient *)&v14 initWithConnection:v5];
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_opt_class();
      id v8 = v7;
      v9 = [(XPCClient *)v6 clientID];
      *(_DWORD *)buf = 138412546;
      v16 = v7;
      __int16 v17 = 2112;
      v18 = v9;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%@]: Client connected: %@", buf, 0x16u);
    }
    objc_storeStrong((id *)&v6->_connection, a3);
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.appstored.JobManagerClient", v10);
    dispatchQueue = v6->_dispatchQueue;
    v6->_dispatchQueue = (OS_dispatch_queue *)v11;
  }
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queuedStateUpdates, 0);
  objc_storeStrong((id *)&self->_queuedProgressUpdates, 0);
  objc_storeStrong((id *)&self->_queuedCompletedJobsPhases, 0);
  objc_storeStrong((id *)&self->_queuedCompletedJobs, 0);
  objc_storeStrong((id *)&self->_queuedChangedJobs, 0);
  objc_storeStrong((id *)&self->_persistenceIdentifier, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end