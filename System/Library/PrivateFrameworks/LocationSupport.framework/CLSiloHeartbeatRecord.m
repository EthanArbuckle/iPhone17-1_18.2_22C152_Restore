@interface CLSiloHeartbeatRecord
- (CLSilo)silo;
- (Class)svcClass;
- (NSString)svcName;
- (id)initTrackingServiceClass:(Class)a3 name:(id)a4;
- (int)ackCount;
- (int)residentCount;
- (int)synCount;
- (void)ack;
- (void)setResidentCount:(int)a3;
- (void)syn;
@end

@implementation CLSiloHeartbeatRecord

- (CLSilo)silo
{
  return self->_silo;
}

- (id)initTrackingServiceClass:(Class)a3 name:(id)a4
{
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CLSiloHeartbeatRecord;
  v8 = [(CLSiloHeartbeatRecord *)&v14 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_svcClass, a3);
    objc_storeStrong((id *)&v9->_svcName, a4);
    uint64_t v10 = [(objc_class *)a3 getSilo];
    silo = v9->_silo;
    v9->_silo = (CLSilo *)v10;

    v9->_residentCount = 1;
    v12 = v9;
  }

  return v9;
}

- (void)syn
{
}

- (void)ack
{
}

- (Class)svcClass
{
  return self->_svcClass;
}

- (NSString)svcName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (int)residentCount
{
  return self->_residentCount;
}

- (void)setResidentCount:(int)a3
{
  self->_residentCount = a3;
}

- (int)synCount
{
  return self->_synCount;
}

- (int)ackCount
{
  return self->_ackCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_svcName, 0);
  objc_storeStrong((id *)&self->_svcClass, 0);
  objc_storeStrong((id *)&self->_silo, 0);
}

@end