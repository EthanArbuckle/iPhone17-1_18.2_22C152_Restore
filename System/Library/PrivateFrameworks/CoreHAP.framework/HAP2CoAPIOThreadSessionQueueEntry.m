@interface HAP2CoAPIOThreadSessionQueueEntry
- (BOOL)reapSession:(id)a3;
- (HAP2CoAPIOThreadSessionQueueEntry)initWithSession:(coap_session_t *)a3 startTime:(id)a4;
- (NSDate)startTime;
- (coap_session_t)session;
@end

@implementation HAP2CoAPIOThreadSessionQueueEntry

- (void).cxx_destruct
{
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (coap_session_t)session
{
  return self->_session;
}

- (BOOL)reapSession:(id)a3
{
  id v4 = a3;
  if (self->_session)
  {
    v5 = [(HAP2CoAPIOThreadSessionQueueEntry *)self startTime];
    [v4 timeIntervalSinceDate:v5];
    double v7 = v6;

    session = self->_session;
    if (v7 >= 60.0)
    {
      coap_session_release((uint64_t)session);
      session = 0;
      self->_session = 0;
    }
  }
  else
  {
    session = 0;
  }
  BOOL v9 = session == 0;

  return v9;
}

- (HAP2CoAPIOThreadSessionQueueEntry)initWithSession:(coap_session_t *)a3 startTime:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HAP2CoAPIOThreadSessionQueueEntry;
  v8 = [(HAP2CoAPIOThreadSessionQueueEntry *)&v11 init];
  BOOL v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_startTime, a4);
    v9->_session = a3;
  }

  return v9;
}

@end