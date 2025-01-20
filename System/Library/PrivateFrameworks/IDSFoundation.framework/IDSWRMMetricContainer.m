@interface IDSWRMMetricContainer
- (IDSWRMMetricContainer)init;
- (id)description;
- (unint64_t)MessageDeliveredDeliveryError;
- (unint64_t)MessageDeliveredRTT;
- (unint64_t)MessageDeliveredSize;
- (unint64_t)MessageReceivedSize;
- (unint64_t)MessageSentSize;
- (unint64_t)StreamBytesReceived;
- (unint64_t)StreamBytesSent;
- (unint64_t)StreamPacketsReceived;
- (unint64_t)StreamPacketsSent;
- (unint64_t)numMessageDeliveredRTT;
- (unint64_t)numMessageDeliveredSize;
- (unint64_t)numMessageReceivedSize;
- (unint64_t)numMessageSentSize;
- (void)resetMetric;
- (void)setMessageDeliveredDeliveryError:(unint64_t)a3;
- (void)setMessageDeliveredRTT:(unint64_t)a3;
- (void)setMessageDeliveredSize:(unint64_t)a3;
- (void)setMessageReceivedSize:(unint64_t)a3;
- (void)setMessageSentSize:(unint64_t)a3;
- (void)setStreamBytesReceived:(unint64_t)a3;
- (void)setStreamBytesSent:(unint64_t)a3;
- (void)setStreamPacketsReceived:(unint64_t)a3;
- (void)setStreamPacketsSent:(unint64_t)a3;
@end

@implementation IDSWRMMetricContainer

- (IDSWRMMetricContainer)init
{
  v8.receiver = self;
  v8.super_class = (Class)IDSWRMMetricContainer;
  v2 = [(IDSWRMMetricContainer *)&v8 init];
  v6 = v2;
  if (v2) {
    objc_msgSend_resetMetric(v2, v3, v4, v5);
  }
  return v6;
}

- (void)resetMetric
{
  self->_MessageDeliveredDeliveryError = -1;
  *(void *)&long long v2 = -1;
  *((void *)&v2 + 1) = -1;
  *(_OWORD *)&self->_MessageDeliveredRTT = v2;
  *(_OWORD *)&self->_MessageSentSize = v2;
  *(_OWORD *)&self->_StreamPacketsSent = v2;
  *(_OWORD *)&self->_StreamBytesSent = v2;
  *(_OWORD *)&self->_numMessageSentSize = 0u;
  *(_OWORD *)&self->_numMessageDeliveredRTT = 0u;
}

- (id)description
{
  unint64_t StreamBytesSent = self->_StreamBytesSent;
  unint64_t StreamBytesReceived = self->_StreamBytesReceived;
  if (StreamBytesSent == -1) {
    unint64_t StreamBytesSent = 0;
  }
  if (StreamBytesReceived == -1) {
    unint64_t StreamBytesReceived = 0;
  }
  unint64_t StreamPacketsSent = self->_StreamPacketsSent;
  unint64_t StreamPacketsReceived = self->_StreamPacketsReceived;
  if (StreamPacketsSent == -1) {
    unint64_t StreamPacketsSent = 0;
  }
  if (StreamPacketsReceived == -1) {
    unint64_t StreamPacketsReceived = 0;
  }
  unint64_t MessageSentSize = self->_MessageSentSize;
  unint64_t MessageDeliveredSize = self->_MessageDeliveredSize;
  if (MessageSentSize == -1) {
    unint64_t MessageSentSize = 0;
  }
  if (MessageDeliveredSize == -1) {
    unint64_t MessageDeliveredSize = 0;
  }
  unint64_t MessageDeliveredRTT = self->_MessageDeliveredRTT;
  unint64_t MessageReceivedSize = self->_MessageReceivedSize;
  if (MessageDeliveredRTT == -1) {
    unint64_t MessageDeliveredRTT = 0;
  }
  if (MessageReceivedSize == -1) {
    unint64_t MessageReceivedSize = 0;
  }
  unint64_t MessageDeliveredDeliveryError = self->_MessageDeliveredDeliveryError;
  if (MessageDeliveredDeliveryError == -1) {
    unint64_t MessageDeliveredDeliveryError = 0;
  }
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"\nunint64_t StreamBytesSent = %llu \nStreamBytesReceived = %llu \nStreamPacketsSent = %llu \nStreamPacketsReceived = %llu \nMessageSentSize = %llu \nMessageDeliveredSize = %llu \nMessageDeliveredRTT = %llu \nMessageReceivedSize = %llu \nCount of MessageDeliveredDeliveryError = %llu \n", v2, StreamBytesSent, StreamBytesReceived, StreamPacketsSent, StreamPacketsReceived, MessageSentSize, MessageDeliveredSize, MessageDeliveredRTT, MessageReceivedSize, MessageDeliveredDeliveryError);
}

- (void)setStreamBytesSent:(unint64_t)a3
{
  unint64_t StreamBytesSent = self->_StreamBytesSent;
  if (StreamBytesSent == -1) {
    unint64_t StreamBytesSent = 0;
  }
  self->_unint64_t StreamBytesSent = StreamBytesSent + a3;
}

- (void)setStreamBytesReceived:(unint64_t)a3
{
  unint64_t StreamBytesReceived = self->_StreamBytesReceived;
  if (StreamBytesReceived == -1) {
    unint64_t StreamBytesReceived = 0;
  }
  self->_unint64_t StreamBytesReceived = StreamBytesReceived + a3;
}

- (void)setStreamPacketsSent:(unint64_t)a3
{
  unint64_t StreamPacketsSent = self->_StreamPacketsSent;
  if (StreamPacketsSent == -1) {
    unint64_t StreamPacketsSent = 0;
  }
  self->_unint64_t StreamPacketsSent = StreamPacketsSent + a3;
}

- (void)setStreamPacketsReceived:(unint64_t)a3
{
  unint64_t StreamPacketsReceived = self->_StreamPacketsReceived;
  if (StreamPacketsReceived == -1) {
    unint64_t StreamPacketsReceived = 0;
  }
  self->_unint64_t StreamPacketsReceived = StreamPacketsReceived + a3;
}

- (void)setMessageSentSize:(unint64_t)a3
{
  unint64_t MessageSentSize = self->_MessageSentSize;
  if (MessageSentSize == -1)
  {
    self->_unint64_t MessageSentSize = a3;
    self->_numunint64_t MessageSentSize = 1;
  }
  else
  {
    numunint64_t MessageSentSize = self->_numMessageSentSize;
    unint64_t v5 = a3 + numMessageSentSize * MessageSentSize;
    ++numMessageSentSize;
    self->_unint64_t MessageSentSize = v5 / numMessageSentSize;
    self->_numunint64_t MessageSentSize = numMessageSentSize;
  }
}

- (void)setMessageDeliveredSize:(unint64_t)a3
{
  unint64_t MessageDeliveredSize = self->_MessageDeliveredSize;
  if (MessageDeliveredSize == -1)
  {
    self->_unint64_t MessageDeliveredSize = a3;
    self->_numunint64_t MessageDeliveredSize = 1;
  }
  else
  {
    numunint64_t MessageDeliveredSize = self->_numMessageDeliveredSize;
    unint64_t v5 = a3 + numMessageDeliveredSize * MessageDeliveredSize;
    ++numMessageDeliveredSize;
    self->_unint64_t MessageDeliveredSize = v5 / numMessageDeliveredSize;
    self->_numunint64_t MessageDeliveredSize = numMessageDeliveredSize;
  }
}

- (void)setMessageDeliveredRTT:(unint64_t)a3
{
  unint64_t MessageDeliveredRTT = self->_MessageDeliveredRTT;
  if (MessageDeliveredRTT == -1)
  {
    self->_unint64_t MessageDeliveredRTT = a3;
    self->_numunint64_t MessageDeliveredRTT = 1;
  }
  else
  {
    numunint64_t MessageDeliveredRTT = self->_numMessageDeliveredRTT;
    unint64_t v5 = a3 + numMessageDeliveredRTT * MessageDeliveredRTT;
    ++numMessageDeliveredRTT;
    self->_unint64_t MessageDeliveredRTT = v5 / numMessageDeliveredRTT;
    self->_numunint64_t MessageDeliveredRTT = numMessageDeliveredRTT;
  }
}

- (void)setMessageReceivedSize:(unint64_t)a3
{
  unint64_t MessageReceivedSize = self->_MessageReceivedSize;
  if (MessageReceivedSize == -1)
  {
    self->_unint64_t MessageReceivedSize = a3;
    self->_numunint64_t MessageReceivedSize = 1;
  }
  else
  {
    numunint64_t MessageReceivedSize = self->_numMessageReceivedSize;
    unint64_t v5 = a3 + numMessageReceivedSize * MessageReceivedSize;
    ++numMessageReceivedSize;
    self->_unint64_t MessageReceivedSize = v5 / numMessageReceivedSize;
    self->_numunint64_t MessageReceivedSize = numMessageReceivedSize;
  }
}

- (void)setMessageDeliveredDeliveryError:(unint64_t)a3
{
  if (a3)
  {
    unint64_t MessageDeliveredDeliveryError = self->_MessageDeliveredDeliveryError;
    BOOL v4 = __CFADD__(MessageDeliveredDeliveryError, 1);
    unint64_t v5 = MessageDeliveredDeliveryError + 1;
    if (v4) {
      unint64_t v5 = 1;
    }
    self->_unint64_t MessageDeliveredDeliveryError = v5;
  }
}

- (unint64_t)StreamBytesSent
{
  return self->_StreamBytesSent;
}

- (unint64_t)StreamBytesReceived
{
  return self->_StreamBytesReceived;
}

- (unint64_t)StreamPacketsSent
{
  return self->_StreamPacketsSent;
}

- (unint64_t)StreamPacketsReceived
{
  return self->_StreamPacketsReceived;
}

- (unint64_t)MessageSentSize
{
  return self->_MessageSentSize;
}

- (unint64_t)MessageDeliveredSize
{
  return self->_MessageDeliveredSize;
}

- (unint64_t)MessageDeliveredRTT
{
  return self->_MessageDeliveredRTT;
}

- (unint64_t)MessageReceivedSize
{
  return self->_MessageReceivedSize;
}

- (unint64_t)MessageDeliveredDeliveryError
{
  return self->_MessageDeliveredDeliveryError;
}

- (unint64_t)numMessageSentSize
{
  return self->_numMessageSentSize;
}

- (unint64_t)numMessageDeliveredSize
{
  return self->_numMessageDeliveredSize;
}

- (unint64_t)numMessageDeliveredRTT
{
  return self->_numMessageDeliveredRTT;
}

- (unint64_t)numMessageReceivedSize
{
  return self->_numMessageReceivedSize;
}

@end