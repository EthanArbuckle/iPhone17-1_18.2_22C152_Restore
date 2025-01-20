@interface IDSOTRSessionInfo
- (BOOL)isNegotiating;
- (BOOL)isReady;
- (BOOL)isSuspended;
- (IDSOTRSessionInfo)initWithToken:(id)a3;
- (NSString)token;
- (double)lastStartTime;
- (id)otrTestBlock;
- (unsigned)negotiationCount;
- (void)_handleNegotiationTimeout;
- (void)_negotiationTimerFiredOnMain;
- (void)dealloc;
- (void)removeNegotiationTimer;
- (void)setIsNegotiating:(BOOL)a3;
- (void)setIsReady:(BOOL)a3;
- (void)setIsSuspended:(BOOL)a3;
- (void)setLastStartTime:(double)a3;
- (void)setNegotiationCount:(unsigned int)a3;
- (void)setNegotiationTimer;
- (void)setOtrTestBlock:(id)a3;
@end

@implementation IDSOTRSessionInfo

- (IDSOTRSessionInfo)initWithToken:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSOTRSessionInfo;
  v6 = [(IDSOTRSessionInfo *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_token, a3);
  }

  return v7;
}

- (void)dealloc
{
  negotiationTimer = self->_negotiationTimer;
  if (negotiationTimer)
  {
    [(IMTimer *)negotiationTimer invalidate];
    v4 = self->_negotiationTimer;
    self->_negotiationTimer = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)IDSOTRSessionInfo;
  [(IDSOTRSessionInfo *)&v5 dealloc];
}

- (void)removeNegotiationTimer
{
  if (self->_negotiationTimer)
  {
    v3 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      negotiationTimer = self->_negotiationTimer;
      token = self->_token;
      *(_DWORD *)buf = 134218242;
      v12 = negotiationTimer;
      __int16 v13 = 2112;
      v14 = token;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Remove OTR timer %p for %@.", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      objc_super v9 = self->_negotiationTimer;
      v10 = self->_token;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        objc_super v9 = self->_negotiationTimer;
        v10 = self->_token;
        _IDSLogV();
      }
    }
    v7 = self->_negotiationTimer;
    p_negotiationTimer = &self->_negotiationTimer;
    [(IMTimer *)v7 invalidate];
    v8 = *p_negotiationTimer;
    *p_negotiationTimer = 0;
  }
}

- (void)_handleNegotiationTimeout
{
  v3 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    token = self->_token;
    negotiationTimer = self->_negotiationTimer;
    *(_DWORD *)buf = 138412546;
    v18 = token;
    __int16 v19 = 2048;
    v20 = negotiationTimer;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "OTR timed out for %@, timer %p.", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      v15 = self->_token;
      v16 = self->_negotiationTimer;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        v15 = self->_token;
        v16 = self->_negotiationTimer;
        _IDSLogV();
      }
    }
  }
  *(_WORD *)&self->_isNegotiating = 0;
  self->_lastStartTime = 0.0;
  [(IDSOTRSessionInfo *)self removeNegotiationTimer];
  v6 = +[IDSOTRController sharedInstance];
  v8 = self->_token;
  p_token = (void **)&self->_token;
  [v6 performOTRSessionBlock:2 token:v8];

  id v9 = objc_alloc((Class)IDSOTRSessionNegotiationMetric);
  v10 = sub_10028C320(*p_token);
  id v11 = [v9 initWithService:v10 priority:sub_10028C4AC(*p_token) duration:30000 result:2];

  v12 = +[IDSCoreAnalyticsLogger defaultLogger];
  [v12 logMetric:v11];

  __int16 v13 = +[IDSAWDLogging sharedInstance];
  v14 = sub_10028C320(*p_token);
  [v13 OTRSessionNegotiation:v14 priority:sub_10028C4AC(*p_token) duration:30000 result:2];
}

- (void)setNegotiationTimer
{
  [(IDSOTRSessionInfo *)self removeNegotiationTimer];
  id v3 = objc_alloc((Class)IMTimer);
  v4 = +[NSString stringWithFormat:@"otr-timer-%@", self->_token];
  objc_super v5 = im_primary_queue();
  v6 = (IMTimer *)[v3 initWithTimeInterval:v4 name:1 shouldWake:self target:"_handleNegotiationTimeout" selector:0 userInfo:v5 queue:30.0];
  negotiationTimer = self->_negotiationTimer;
  self->_negotiationTimer = v6;

  v8 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = self->_negotiationTimer;
    token = self->_token;
    *(_DWORD *)buf = 134218242;
    v12 = v9;
    __int16 v13 = 2112;
    v14 = token;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Set OTR timer %p for %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
  {
    _IDSLogTransport();
    if (_IDSShouldLog()) {
      _IDSLogV();
    }
  }
}

- (void)_negotiationTimerFiredOnMain
{
  id v3 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10028C894;
  block[3] = &unk_10097E4D0;
  block[4] = self;
  dispatch_async(v3, block);
}

- (NSString)token
{
  return self->_token;
}

- (BOOL)isNegotiating
{
  return self->_isNegotiating;
}

- (void)setIsNegotiating:(BOOL)a3
{
  self->_isNegotiating = a3;
}

- (BOOL)isReady
{
  return self->_isReady;
}

- (void)setIsReady:(BOOL)a3
{
  self->_isReady = a3;
}

- (BOOL)isSuspended
{
  return self->_isSuspended;
}

- (void)setIsSuspended:(BOOL)a3
{
  self->_isSuspended = a3;
}

- (double)lastStartTime
{
  return self->_lastStartTime;
}

- (void)setLastStartTime:(double)a3
{
  self->_lastStartTime = a3;
}

- (unsigned)negotiationCount
{
  return self->_negotiationCount;
}

- (void)setNegotiationCount:(unsigned int)a3
{
  self->_negotiationCount = a3;
}

- (id)otrTestBlock
{
  return self->_otrTestBlock;
}

- (void)setOtrTestBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_otrTestBlock, 0);
  objc_storeStrong((id *)&self->_negotiationTimer, 0);

  objc_storeStrong((id *)&self->_token, 0);
}

@end