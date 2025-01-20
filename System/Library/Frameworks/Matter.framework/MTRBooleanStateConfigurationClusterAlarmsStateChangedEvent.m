@interface MTRBooleanStateConfigurationClusterAlarmsStateChangedEvent
- (MTRBooleanStateConfigurationClusterAlarmsStateChangedEvent)init;
- (NSNumber)alarmsActive;
- (NSNumber)alarmsSuppressed;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setAlarmsActive:(id)a3;
- (void)setAlarmsSuppressed:(id)a3;
@end

@implementation MTRBooleanStateConfigurationClusterAlarmsStateChangedEvent

- (MTRBooleanStateConfigurationClusterAlarmsStateChangedEvent)init
{
  v7.receiver = self;
  v7.super_class = (Class)MTRBooleanStateConfigurationClusterAlarmsStateChangedEvent;
  v2 = [(MTRBooleanStateConfigurationClusterAlarmsStateChangedEvent *)&v7 init];
  v3 = v2;
  if (v2)
  {
    alarmsActive = v2->_alarmsActive;
    v2->_alarmsActive = (NSNumber *)&unk_26F9C8620;

    alarmsSuppressed = v3->_alarmsSuppressed;
    v3->_alarmsSuppressed = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRBooleanStateConfigurationClusterAlarmsStateChangedEvent);
  objc_super v7 = objc_msgSend_alarmsActive(self, v5, v6);
  objc_msgSend_setAlarmsActive_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_alarmsSuppressed(self, v9, v10);
  objc_msgSend_setAlarmsSuppressed_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: alarmsActive:%@; alarmsSuppressed:%@; >",
    v5,
    self->_alarmsActive,
  objc_super v7 = self->_alarmsSuppressed);

  return v7;
}

- (NSNumber)alarmsActive
{
  return self->_alarmsActive;
}

- (void)setAlarmsActive:(id)a3
{
}

- (NSNumber)alarmsSuppressed
{
  return self->_alarmsSuppressed;
}

- (void)setAlarmsSuppressed:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarmsSuppressed, 0);

  objc_storeStrong((id *)&self->_alarmsActive, 0);
}

@end