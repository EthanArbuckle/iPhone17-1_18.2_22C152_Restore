@interface _IMPingPacketData
- (BOOL)timedOut;
- (_IMPingPacketData)initWithSequeneceNumber:(int)a3 timesent:(timeval *)a4 error:(int)a5;
- (double)rtt;
- (id)copyWithZone:(_NSZone *)a3;
- (int)error;
- (int)sequenceNumber;
- (timeval)timeSent;
- (void)_markPacketAsTimedOut:(double)a3;
- (void)_returnPacketArrived;
@end

@implementation _IMPingPacketData

- (_IMPingPacketData)initWithSequeneceNumber:(int)a3 timesent:(timeval *)a4 error:(int)a5
{
  v9.receiver = self;
  v9.super_class = (Class)_IMPingPacketData;
  result = [(_IMPingPacketData *)&v9 init];
  if (result)
  {
    result->_sequenceNumber = a3;
    result->_timeSent = *a4;
    result->_error = a5;
  }
  return result;
}

- (void)_markPacketAsTimedOut:(double)a3
{
  self->_timedOut = sub_1918DD538((uint64_t)&self->_timeSent) > a3;
}

- (void)_returnPacketArrived
{
  self->_rtt = sub_1918DD538((uint64_t)&self->_timeSent);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend_allocWithZone_(_IMPingPacketData, a2, (uint64_t)a3, v3);
  id result = (id)objc_msgSend_init(v5, v6, v7, v8);
  if (result)
  {
    *((_DWORD *)result + 2) = self->_sequenceNumber;
    *((void *)result + 5) = *(void *)&self->_rtt;
    *((unsigned char *)result + 12) = self->_timedOut;
    *(timeval *)((char *)result + 24) = self->_timeSent;
    *((_DWORD *)result + 4) = self->_error;
  }
  return result;
}

- (int)sequenceNumber
{
  return self->_sequenceNumber;
}

- (BOOL)timedOut
{
  return self->_timedOut;
}

- (timeval)timeSent
{
  uint64_t v2 = *(void *)&self->_timeSent.tv_usec;
  __darwin_time_t tv_sec = self->_timeSent.tv_sec;
  result.tv_usec = v2;
  result.__darwin_time_t tv_sec = tv_sec;
  return result;
}

- (int)error
{
  return self->_error;
}

- (double)rtt
{
  return self->_rtt;
}

@end