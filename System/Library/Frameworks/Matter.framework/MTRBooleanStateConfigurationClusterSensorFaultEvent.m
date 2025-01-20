@interface MTRBooleanStateConfigurationClusterSensorFaultEvent
- (MTRBooleanStateConfigurationClusterSensorFaultEvent)init;
- (NSNumber)sensorFault;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setSensorFault:(id)a3;
@end

@implementation MTRBooleanStateConfigurationClusterSensorFaultEvent

- (MTRBooleanStateConfigurationClusterSensorFaultEvent)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTRBooleanStateConfigurationClusterSensorFaultEvent;
  v2 = [(MTRBooleanStateConfigurationClusterSensorFaultEvent *)&v6 init];
  v3 = v2;
  if (v2)
  {
    sensorFault = v2->_sensorFault;
    v2->_sensorFault = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRBooleanStateConfigurationClusterSensorFaultEvent);
  v7 = objc_msgSend_sensorFault(self, v5, v6);
  objc_msgSend_setSensorFault_(v4, v8, (uint64_t)v7);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: sensorFault:%@ >", v5, self->_sensorFault);;

  return v7;
}

- (NSNumber)sensorFault
{
  return self->_sensorFault;
}

- (void)setSensorFault:(id)a3
{
}

- (void).cxx_destruct
{
}

@end