@interface ATIDSConnectionInfo
- (ATIDSConnectionInfo)init;
- (ATIDSSocket)socket;
- (IDSDevice)device;
- (double)wakeupTimestamp;
- (int64_t)priority;
- (unint64_t)connectionState;
- (unsigned)failureCount;
- (void)dealloc;
- (void)setConnectionState:(unint64_t)a3;
- (void)setDevice:(id)a3;
- (void)setFailureCount:(unsigned int)a3;
- (void)setPriority:(int64_t)a3;
- (void)setSocket:(id)a3;
- (void)setWakeupTimestamp:(double)a3;
@end

@implementation ATIDSConnectionInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_socket, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

- (void)setSocket:(id)a3
{
}

- (ATIDSSocket)socket
{
  return self->_socket;
}

- (void)setFailureCount:(unsigned int)a3
{
  self->_failureCount = a3;
}

- (unsigned)failureCount
{
  return self->_failureCount;
}

- (void)setConnectionState:(unint64_t)a3
{
  self->_connectionState = a3;
}

- (unint64_t)connectionState
{
  return self->_connectionState;
}

- (void)setWakeupTimestamp:(double)a3
{
  self->_wakeupTimestamp = a3;
}

- (double)wakeupTimestamp
{
  return self->_wakeupTimestamp;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setDevice:(id)a3
{
}

- (IDSDevice)device
{
  return self->_device;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)ATIDSConnectionInfo;
  [(ATIDSConnectionInfo *)&v2 dealloc];
}

- (ATIDSConnectionInfo)init
{
  v3.receiver = self;
  v3.super_class = (Class)ATIDSConnectionInfo;
  return [(ATIDSConnectionInfo *)&v3 init];
}

@end