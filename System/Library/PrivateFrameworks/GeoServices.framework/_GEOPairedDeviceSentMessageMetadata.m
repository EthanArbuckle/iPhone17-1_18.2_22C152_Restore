@interface _GEOPairedDeviceSentMessageMetadata
- (BOOL)isReply;
- (OS_dispatch_source)timeoutTimer;
- (_GEOPairedDeviceSentMessageMetadata)init;
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

@implementation _GEOPairedDeviceSentMessageMetadata

- (_GEOPairedDeviceSentMessageMetadata)init
{
  v7.receiver = self;
  v7.super_class = (Class)_GEOPairedDeviceSentMessageMetadata;
  v2 = [(_GEOPairedDeviceSentMessageMetadata *)&v7 init];
  if (v2)
  {
    uint64_t v3 = _GEOCreateTransaction();
    id transaction = v2->_transaction;
    v2->_id transaction = (id)v3;

    v5 = v2;
  }

  return v2;
}

- (void)dealloc
{
  id transaction = self->_transaction;
  self->_id transaction = 0;

  v4.receiver = self;
  v4.super_class = (Class)_GEOPairedDeviceSentMessageMetadata;
  [(_GEOPairedDeviceSentMessageMetadata *)&v4 dealloc];
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

  objc_storeStrong(&self->_transaction, 0);
}

@end