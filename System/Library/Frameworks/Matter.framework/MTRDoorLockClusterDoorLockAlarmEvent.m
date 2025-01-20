@interface MTRDoorLockClusterDoorLockAlarmEvent
- (MTRDoorLockClusterDoorLockAlarmEvent)init;
- (NSNumber)alarmCode;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setAlarmCode:(NSNumber *)alarmCode;
@end

@implementation MTRDoorLockClusterDoorLockAlarmEvent

- (MTRDoorLockClusterDoorLockAlarmEvent)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTRDoorLockClusterDoorLockAlarmEvent;
  v2 = [(MTRDoorLockClusterDoorLockAlarmEvent *)&v6 init];
  v3 = v2;
  if (v2)
  {
    alarmCode = v2->_alarmCode;
    v2->_alarmCode = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRDoorLockClusterDoorLockAlarmEvent);
  v7 = objc_msgSend_alarmCode(self, v5, v6);
  objc_msgSend_setAlarmCode_(v4, v8, (uint64_t)v7);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: alarmCode:%@ >", v5, self->_alarmCode);;

  return v7;
}

- (NSNumber)alarmCode
{
  return self->_alarmCode;
}

- (void)setAlarmCode:(NSNumber *)alarmCode
{
}

- (void).cxx_destruct
{
}

@end