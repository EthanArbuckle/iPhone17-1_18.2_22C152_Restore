@interface HMDPendingCharacteristic
- (HMDCharacteristicWriteRequest)writeRequest;
- (HMDPendingCharacteristic)initWithCharacteristic:(id)a3 queue:(id)a4 handler:(id)a5;
- (OS_dispatch_queue)queue;
- (id)handler;
@end

@implementation HMDPendingCharacteristic

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_writeRequest, 0);
}

- (id)handler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (HMDCharacteristicWriteRequest)writeRequest
{
  return (HMDCharacteristicWriteRequest *)objc_getProperty(self, a2, 8, 1);
}

- (HMDPendingCharacteristic)initWithCharacteristic:(id)a3 queue:(id)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HMDPendingCharacteristic;
  v12 = [(HMDPendingCharacteristic *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_writeRequest, a3);
    objc_storeStrong((id *)&v13->_queue, a4);
    v14 = _Block_copy(v11);
    id handler = v13->_handler;
    v13->_id handler = v14;
  }
  return v13;
}

@end