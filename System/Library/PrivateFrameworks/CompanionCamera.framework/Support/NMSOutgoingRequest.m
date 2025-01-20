@interface NMSOutgoingRequest
+ (id)request;
- (BOOL)doNotCompress;
- (BOOL)fireAndForget;
- (BOOL)queueOnly1;
- (NMSMessageCenter)messageCenter;
- (NMSOutgoingRequest)init;
- (NSData)data;
- (NSString)idsIdentifier;
- (double)replyTimeout;
- (double)sendTimeout;
- (id)description;
- (id)didSendHandler;
- (id)errorHandler;
- (id)pbRequest;
- (id)pbResponseHandler;
- (id)responseHandler;
- (unint64_t)priority;
- (unsigned)messageID;
- (void)_replyTimerDidTimeout;
- (void)invalidate;
- (void)invalidateReplyTimer;
- (void)setData:(id)a3;
- (void)setDidSendHandler:(id)a3;
- (void)setDoNotCompress:(BOOL)a3;
- (void)setErrorHandler:(id)a3;
- (void)setFireAndForget:(BOOL)a3;
- (void)setIdsIdentifier:(id)a3;
- (void)setMessageCenter:(id)a3;
- (void)setMessageID:(unsigned __int16)a3;
- (void)setPbRequest:(id)a3;
- (void)setPbResponseHandler:(id)a3;
- (void)setPriority:(unint64_t)a3;
- (void)setQueueOnly1:(BOOL)a3;
- (void)setReplyTimeout:(double)a3;
- (void)setResponseHandler:(id)a3;
- (void)setSendTimeout:(double)a3;
- (void)startReplyTimer;
@end

@implementation NMSOutgoingRequest

+ (id)request
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NMSOutgoingRequest)init
{
  v7.receiver = self;
  v7.super_class = (Class)NMSOutgoingRequest;
  id v2 = [(NMSOutgoingRequest *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_priority = 1;
    uint64_t v4 = os_transaction_create();
    transaction = v3->_transaction;
    v3->_transaction = (OS_os_transaction *)v4;
  }
  return v3;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  v5 = +[NSString stringWithFormat:@"<%@: %p messageID: %hu idsIdentifier: %@ sendTimeout:%.1f replyTimeout:%.1f doNotCompress:%d fireAndForget:%d", v4, self, self->_messageID, self->_idsIdentifier, *(void *)&self->_sendTimeout, *(void *)&self->_replyTimeout, self->_doNotCompress, self->_fireAndForget];

  return v5;
}

- (void)invalidate
{
  [(NMSOutgoingRequest *)self invalidateReplyTimer];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageCenter);
  [WeakRetained _invalidateOutgoingRequest:self];
}

- (void)_replyTimerDidTimeout
{
  id v4 = +[NSError errorWithDomain:@"NMSErrorDomain" code:2 userInfo:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageCenter);
  [WeakRetained _handleError:v4 forRequest:self];
}

- (void)startReplyTimer
{
  if (self->_replyTimeout > 0.0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_messageCenter);
    id v4 = [WeakRetained _queue];
    v5 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v4);
    replyTimer = self->_replyTimer;
    self->_replyTimer = v5;

    objc_initWeak(&location, self);
    objc_super v7 = self->_replyTimer;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10001ED6C;
    v10[3] = &unk_100030DD8;
    objc_copyWeak(&v11, &location);
    dispatch_source_set_event_handler(v7, v10);
    v8 = self->_replyTimer;
    dispatch_time_t v9 = dispatch_time(0, (uint64_t)(self->_replyTimeout * 1000000000.0));
    dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    dispatch_resume((dispatch_object_t)self->_replyTimer);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (void)invalidateReplyTimer
{
  replyTimer = self->_replyTimer;
  if (replyTimer)
  {
    dispatch_source_cancel(replyTimer);
    id v4 = self->_replyTimer;
    self->_replyTimer = 0;
  }
}

- (void)setPbRequest:(id)a3
{
  objc_storeStrong(&self->_pbRequest, a3);
  id v7 = a3;
  v5 = [self->_pbRequest data];
  data = self->_data;
  self->_data = v5;
}

- (id)pbResponseHandler
{
  id v2 = objc_retainBlock(self->_pbResponseHandler);
  return v2;
}

- (void)setPbResponseHandler:(id)a3
{
  id v4 = a3;
  id v5 = [v4 copy];
  id pbResponseHandler = self->_pbResponseHandler;
  self->_id pbResponseHandler = v5;

  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001EF78;
  v7[3] = &unk_100030E00;
  objc_copyWeak(&v8, &location);
  [(NMSOutgoingRequest *)self setResponseHandler:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (unsigned)messageID
{
  return self->_messageID;
}

- (void)setMessageID:(unsigned __int16)a3
{
  self->_messageID = a3;
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (void)setIdsIdentifier:(id)a3
{
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
}

- (id)didSendHandler
{
  return self->_didSendHandler;
}

- (void)setDidSendHandler:(id)a3
{
}

- (unint64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(unint64_t)a3
{
  self->_priority = a3;
}

- (double)sendTimeout
{
  return self->_sendTimeout;
}

- (void)setSendTimeout:(double)a3
{
  self->_sendTimeout = a3;
}

- (double)replyTimeout
{
  return self->_replyTimeout;
}

- (void)setReplyTimeout:(double)a3
{
  self->_replyTimeout = a3;
}

- (BOOL)doNotCompress
{
  return self->_doNotCompress;
}

- (void)setDoNotCompress:(BOOL)a3
{
  self->_doNotCompress = a3;
}

- (BOOL)fireAndForget
{
  return self->_fireAndForget;
}

- (void)setFireAndForget:(BOOL)a3
{
  self->_fireAndForget = a3;
}

- (BOOL)queueOnly1
{
  return self->_queueOnly1;
}

- (void)setQueueOnly1:(BOOL)a3
{
  self->_queueOnly1 = a3;
}

- (NMSMessageCenter)messageCenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageCenter);
  return (NMSMessageCenter *)WeakRetained;
}

- (void)setMessageCenter:(id)a3
{
}

- (id)pbRequest
{
  return self->_pbRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pbRequest, 0);
  objc_destroyWeak((id *)&self->_messageCenter);
  objc_storeStrong(&self->_didSendHandler, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong(&self->_pbResponseHandler, 0);
  objc_storeStrong((id *)&self->_replyTimer, 0);
}

@end