@interface TechKeepAliveScheduler
- (TechKeepAliveScheduler)initWithContextID:(int)a3 delegateQueue:(dispatch_queue_s *)a4 maxInterval:(double)a5 instance:(unsigned int)a6;
- (id).cxx_construct;
- (void)connectionManager:(id)a3 handleEvent:(int)a4;
- (void)dealloc;
- (void)growKeepAliveInterval;
- (void)shrinkKeepAliveInterval;
- (void)startKeepAlive;
- (void)stopKeepAlive;
@end

@implementation TechKeepAliveScheduler

- (TechKeepAliveScheduler)initWithContextID:(int)a3 delegateQueue:(dispatch_queue_s *)a4 maxInterval:(double)a5 instance:(unsigned int)a6
{
  v20.receiver = self;
  v20.super_class = (Class)TechKeepAliveScheduler;
  v10 = [(TechKeepAliveScheduler *)&v20 init];
  v11 = v10;
  if (v10)
  {
    v10->_int contextID = a3;
    v10->_int instance = a6;
    os_log_t v12 = os_log_create(kCtLoggingSystemName, "TechKeepAliveScheduler");
    fRef = v11->_logger.fRef;
    v11->_logger.fRef = (os_log_s *)v12;
    *(void *)buf = fRef;
    sub_10003F684((void **)buf);
    v14 = (PCConnectionManager *)[objc_alloc((Class)PCConnectionManager) initWithConnectionClass:0, v11, a4, +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"TechKeepAlive-%d.%d", v11->_contextID, v11->_instance) delegate delegateQueue serviceIdentifier];
    v11->_manager = v14;
    [(PCConnectionManager *)v14 setOnlyAllowedStyle:0];
    [(PCConnectionManager *)v11->_manager setMaximumKeepAliveInterval:a5];
    [(PCConnectionManager *)v11->_manager setEnableNonCellularConnections:1];
    v15 = v11->_logger.fRef;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int contextID = v11->_contextID;
      int instance = v11->_instance;
      uint64_t v18 = asStringBool(v11->_manager != 0);
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&buf[4] = contextID;
      __int16 v22 = 1024;
      int v23 = instance;
      __int16 v24 = 2080;
      uint64_t v25 = v18;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "TechKeepAlive-%d.%d:PC connection Manager created, success: %s", buf, 0x18u);
    }
  }
  return v11;
}

- (void)dealloc
{
  self->_manager = 0;
  fRef = self->_logger.fRef;
  self->_logger.fRef = 0;
  v5 = fRef;
  sub_10003F684((void **)&v5);
  v4.receiver = self;
  v4.super_class = (Class)TechKeepAliveScheduler;
  [(TechKeepAliveScheduler *)&v4 dealloc];
}

- (void)startKeepAlive
{
  fRef = self->_logger.fRef;
  if (os_log_type_enabled(fRef, OS_LOG_TYPE_INFO))
  {
    int contextID = self->_contextID;
    int instance = self->_instance;
    v6[0] = 67109376;
    v6[1] = contextID;
    __int16 v7 = 1024;
    int v8 = instance;
    _os_log_impl((void *)&_mh_execute_header, fRef, OS_LOG_TYPE_INFO, "TechKeepAlive-%d.%d:Starting PC connection Manager", (uint8_t *)v6, 0xEu);
  }
  [(PCConnectionManager *)self->_manager startManager];
}

- (void)stopKeepAlive
{
  [(PCConnectionManager *)self->_manager stopManager];
  fRef = self->_logger.fRef;
  if (os_log_type_enabled(fRef, OS_LOG_TYPE_INFO))
  {
    int contextID = self->_contextID;
    int instance = self->_instance;
    v6[0] = 67109376;
    v6[1] = contextID;
    __int16 v7 = 1024;
    int v8 = instance;
    _os_log_impl((void *)&_mh_execute_header, fRef, OS_LOG_TYPE_INFO, "TechKeepAlive-%d.%d:PC connection Manager Stopped", (uint8_t *)v6, 0xEu);
  }
}

- (void)growKeepAliveInterval
{
  fRef = self->_logger.fRef;
  if (os_log_type_enabled(fRef, OS_LOG_TYPE_INFO))
  {
    int contextID = self->_contextID;
    int instance = self->_instance;
    v6[0] = 67109376;
    v6[1] = contextID;
    __int16 v7 = 1024;
    int v8 = instance;
    _os_log_impl((void *)&_mh_execute_header, fRef, OS_LOG_TYPE_INFO, "TechKeepAlive-%d.%d:Enlarge keep alive interval", (uint8_t *)v6, 0xEu);
  }
  [(PCConnectionManager *)self->_manager resumeManagerWithAction:0];
}

- (void)shrinkKeepAliveInterval
{
  fRef = self->_logger.fRef;
  if (os_log_type_enabled(fRef, OS_LOG_TYPE_INFO))
  {
    int contextID = self->_contextID;
    int instance = self->_instance;
    v6[0] = 67109376;
    v6[1] = contextID;
    __int16 v7 = 1024;
    int v8 = instance;
    _os_log_impl((void *)&_mh_execute_header, fRef, OS_LOG_TYPE_INFO, "TechKeepAlive-%d.%d:Shrink keep alive interval", (uint8_t *)v6, 0xEu);
  }
  [(PCConnectionManager *)self->_manager resumeManagerWithAction:1];
}

- (void)connectionManager:(id)a3 handleEvent:(int)a4
{
  fRef = self->_logger.fRef;
  BOOL v7 = os_log_type_enabled(fRef, OS_LOG_TYPE_INFO);
  if (a4 == 2)
  {
    if (v7)
    {
      int contextID = self->_contextID;
      int instance = self->_instance;
      int v12 = 67109376;
      int v13 = contextID;
      __int16 v14 = 1024;
      int v15 = instance;
      _os_log_impl((void *)&_mh_execute_header, fRef, OS_LOG_TYPE_INFO, "TechKeepAlive-%d.%d:Got PC Push Keep Alive event", (uint8_t *)&v12, 0xEu);
    }
    sub_100818BD8((uint64_t)&event::data::TechKeepAlive, self->_contextID);
  }
  else if (v7)
  {
    int v10 = self->_contextID;
    int v11 = self->_instance;
    int v12 = 67109632;
    int v13 = v10;
    __int16 v14 = 1024;
    int v15 = v11;
    __int16 v16 = 1024;
    int v17 = a4;
    _os_log_impl((void *)&_mh_execute_header, fRef, OS_LOG_TYPE_INFO, "TechKeepAlive-%d.%d:Got PC event %d", (uint8_t *)&v12, 0x14u);
  }
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  return self;
}

@end