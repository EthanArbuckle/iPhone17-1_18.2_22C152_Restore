@interface IDSDeviceConnectionDurationEventMetric
- (BOOL)wasSuccessful;
- (IDSDeviceConnectionDurationEventMetric)initWithService:(id)a3 wasSuccessful:(BOOL)a4 clientInitTime:(id)a5 clientOpenSocketCompletionTime:(id)a6 daemonOpenSocketTime:(id)a7 daemonOpenSocketCompletionTime:(id)a8 firstPacketReceiveTime:(id)a9 connectionInitTime:(id)a10;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)clientInitTime;
- (NSNumber)clientOpenSocketCompletionTime;
- (NSNumber)connectionInitTime;
- (NSNumber)daemonOpenSocketCompletionTime;
- (NSNumber)daemonOpenSocketTime;
- (NSNumber)firstPacketReceiveTime;
- (NSString)name;
- (NSString)serviceName;
@end

@implementation IDSDeviceConnectionDurationEventMetric

- (NSString)name
{
  return (NSString *)@"IDSDeviceConnectionDuration";
}

- (NSDictionary)dictionaryRepresentation
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  return (NSDictionary *)v2;
}

- (IDSDeviceConnectionDurationEventMetric)initWithService:(id)a3 wasSuccessful:(BOOL)a4 clientInitTime:(id)a5 clientOpenSocketCompletionTime:(id)a6 daemonOpenSocketTime:(id)a7 daemonOpenSocketCompletionTime:(id)a8 firstPacketReceiveTime:(id)a9 connectionInitTime:(id)a10
{
  id v26 = a3;
  id v25 = a5;
  id v24 = a6;
  id v23 = a7;
  id v22 = a8;
  id v16 = a9;
  id v17 = a10;
  v27.receiver = self;
  v27.super_class = (Class)IDSDeviceConnectionDurationEventMetric;
  v18 = [(IDSDeviceConnectionDurationEventMetric *)&v27 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_serviceName, a3);
    v19->_wasSuccessful = a4;
    objc_storeStrong((id *)&v19->_clientInitTime, a5);
    objc_storeStrong((id *)&v19->_clientOpenSocketCompletionTime, a6);
    objc_storeStrong((id *)&v19->_daemonOpenSocketTime, a7);
    objc_storeStrong((id *)&v19->_daemonOpenSocketCompletionTime, a8);
    objc_storeStrong((id *)&v19->_firstPacketReceiveTime, a9);
    objc_storeStrong((id *)&v19->_connectionInitTime, a10);
  }

  return v19;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (BOOL)wasSuccessful
{
  return self->_wasSuccessful;
}

- (NSNumber)clientInitTime
{
  return self->_clientInitTime;
}

- (NSNumber)clientOpenSocketCompletionTime
{
  return self->_clientOpenSocketCompletionTime;
}

- (NSNumber)daemonOpenSocketTime
{
  return self->_daemonOpenSocketTime;
}

- (NSNumber)daemonOpenSocketCompletionTime
{
  return self->_daemonOpenSocketCompletionTime;
}

- (NSNumber)firstPacketReceiveTime
{
  return self->_firstPacketReceiveTime;
}

- (NSNumber)connectionInitTime
{
  return self->_connectionInitTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionInitTime, 0);
  objc_storeStrong((id *)&self->_firstPacketReceiveTime, 0);
  objc_storeStrong((id *)&self->_daemonOpenSocketCompletionTime, 0);
  objc_storeStrong((id *)&self->_daemonOpenSocketTime, 0);
  objc_storeStrong((id *)&self->_clientOpenSocketCompletionTime, 0);
  objc_storeStrong((id *)&self->_clientInitTime, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end