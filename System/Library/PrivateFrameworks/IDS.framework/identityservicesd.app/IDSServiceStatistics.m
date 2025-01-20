@interface IDSServiceStatistics
- (id)description;
- (unint64_t)bytesReceived;
- (unint64_t)bytesSent;
- (unint64_t)packetsReceived;
- (unint64_t)packetsSent;
- (void)setBytesReceived:(unint64_t)a3;
- (void)setBytesSent:(unint64_t)a3;
- (void)setPacketsReceived:(unint64_t)a3;
- (void)setPacketsSent:(unint64_t)a3;
@end

@implementation IDSServiceStatistics

- (id)description
{
  return +[NSString stringWithFormat:@"pS: %llu pR: %llu bS: %llu bR: %llu", self->_packetsSent, self->_packetsReceived, self->_bytesSent, self->_bytesReceived];
}

- (unint64_t)packetsSent
{
  return self->_packetsSent;
}

- (void)setPacketsSent:(unint64_t)a3
{
  self->_packetsSent = a3;
}

- (unint64_t)packetsReceived
{
  return self->_packetsReceived;
}

- (void)setPacketsReceived:(unint64_t)a3
{
  self->_packetsReceived = a3;
}

- (unint64_t)bytesSent
{
  return self->_bytesSent;
}

- (void)setBytesSent:(unint64_t)a3
{
  self->_bytesSent = a3;
}

- (unint64_t)bytesReceived
{
  return self->_bytesReceived;
}

- (void)setBytesReceived:(unint64_t)a3
{
  self->_bytesReceived = a3;
}

@end