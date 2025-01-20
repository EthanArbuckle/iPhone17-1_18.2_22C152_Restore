@interface APSOutgoingItem
- (APSOutgoingItem)initWithSendBlock:(id)a3 completionBlock:(id)a4 timeout:(double)a5;
- (BOOL)hasTimedOut;
- (BOOL)sent;
- (NSDate)timestamp;
- (NSString)sendInterface;
- (double)timeout;
- (id)completionBlock;
- (id)sendBlock;
- (void)setHasTimedOut:(BOOL)a3;
- (void)setSendInterface:(id)a3;
- (void)setSent:(BOOL)a3;
@end

@implementation APSOutgoingItem

- (APSOutgoingItem)initWithSendBlock:(id)a3 completionBlock:(id)a4 timeout:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)APSOutgoingItem;
  v10 = [(APSOutgoingItem *)&v19 init];
  if (v10)
  {
    v11 = (NSDate *)objc_alloc_init((Class)NSDate);
    timestamp = v10->_timestamp;
    v10->_timestamp = v11;

    v10->_timeout = a5;
    id v13 = objc_retainBlock(v9);
    id completionBlock = v10->_completionBlock;
    v10->_id completionBlock = v13;

    id v15 = objc_retainBlock(v8);
    id sendBlock = v10->_sendBlock;
    v10->_id sendBlock = v15;

    sendInterface = v10->_sendInterface;
    v10->_sendInterface = 0;
  }
  return v10;
}

- (BOOL)sent
{
  return self->_sent;
}

- (void)setSent:(BOOL)a3
{
  self->_sent = a3;
}

- (NSString)sendInterface
{
  return self->_sendInterface;
}

- (void)setSendInterface:(id)a3
{
}

- (BOOL)hasTimedOut
{
  return self->_hasTimedOut;
}

- (void)setHasTimedOut:(BOOL)a3
{
  self->_hasTimedOut = a3;
}

- (double)timeout
{
  return self->_timeout;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (id)sendBlock
{
  return self->_sendBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendInterface, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_sendBlock, 0);
}

@end