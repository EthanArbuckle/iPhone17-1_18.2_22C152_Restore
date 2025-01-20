@interface _NMSentMessageMetadata
- (BOOL)isReply;
- (OS_dispatch_source)timeoutTimer;
- (_NMSentMessageMetadata)init;
- (double)timestamp;
- (int)type;
- (unint64_t)payloadSize;
- (void)dealloc;
- (void)setPayloadSize:(unint64_t)a3;
- (void)setReply:(BOOL)a3;
- (void)setTimeoutTimer:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)setType:(int)a3;
@end

@implementation _NMSentMessageMetadata

- (_NMSentMessageMetadata)init
{
  v10.receiver = self;
  v10.super_class = (Class)_NMSentMessageMetadata;
  v2 = [(_NMSentMessageMetadata *)&v10 init];
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    v4 = NSStringFromClass(v3);
    id v5 = +[NSString stringWithFormat:@"%@.%p", v4, v2];
    [v5 UTF8String];
    uint64_t v6 = os_transaction_create();
    transaction = v2->_transaction;
    v2->_transaction = (OS_os_transaction *)v6;

    v8 = v2;
  }

  return v2;
}

- (void)dealloc
{
  transaction = self->_transaction;
  self->_transaction = 0;

  v4.receiver = self;
  v4.super_class = (Class)_NMSentMessageMetadata;
  [(_NMSentMessageMetadata *)&v4 dealloc];
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (OS_dispatch_source)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
}

- (unint64_t)payloadSize
{
  return self->_payloadSize;
}

- (void)setPayloadSize:(unint64_t)a3
{
  self->_payloadSize = a3;
}

- (BOOL)isReply
{
  return self->_reply;
}

- (void)setReply:(BOOL)a3
{
  self->_reply = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutTimer, 0);

  objc_storeStrong((id *)&self->_transaction, 0);
}

@end