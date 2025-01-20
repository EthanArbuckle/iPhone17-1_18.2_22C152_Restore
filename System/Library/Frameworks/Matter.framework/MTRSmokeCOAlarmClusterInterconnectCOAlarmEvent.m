@interface MTRSmokeCOAlarmClusterInterconnectCOAlarmEvent
- (MTRSmokeCOAlarmClusterInterconnectCOAlarmEvent)init;
- (NSNumber)alarmSeverityLevel;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setAlarmSeverityLevel:(id)a3;
@end

@implementation MTRSmokeCOAlarmClusterInterconnectCOAlarmEvent

- (MTRSmokeCOAlarmClusterInterconnectCOAlarmEvent)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTRSmokeCOAlarmClusterInterconnectCOAlarmEvent;
  v2 = [(MTRSmokeCOAlarmClusterInterconnectCOAlarmEvent *)&v6 init];
  v3 = v2;
  if (v2)
  {
    alarmSeverityLevel = v2->_alarmSeverityLevel;
    v2->_alarmSeverityLevel = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRSmokeCOAlarmClusterInterconnectCOAlarmEvent);
  v7 = objc_msgSend_alarmSeverityLevel(self, v5, v6);
  objc_msgSend_setAlarmSeverityLevel_(v4, v8, (uint64_t)v7);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: alarmSeverityLevel:%@ >", v5, self->_alarmSeverityLevel);;

  return v7;
}

- (NSNumber)alarmSeverityLevel
{
  return self->_alarmSeverityLevel;
}

- (void)setAlarmSeverityLevel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end