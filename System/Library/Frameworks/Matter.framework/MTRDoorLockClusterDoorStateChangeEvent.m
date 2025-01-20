@interface MTRDoorLockClusterDoorStateChangeEvent
- (MTRDoorLockClusterDoorStateChangeEvent)init;
- (NSNumber)doorState;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setDoorState:(NSNumber *)doorState;
@end

@implementation MTRDoorLockClusterDoorStateChangeEvent

- (MTRDoorLockClusterDoorStateChangeEvent)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTRDoorLockClusterDoorStateChangeEvent;
  v2 = [(MTRDoorLockClusterDoorStateChangeEvent *)&v6 init];
  v3 = v2;
  if (v2)
  {
    doorState = v2->_doorState;
    v2->_doorState = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRDoorLockClusterDoorStateChangeEvent);
  v7 = objc_msgSend_doorState(self, v5, v6);
  objc_msgSend_setDoorState_(v4, v8, (uint64_t)v7);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: doorState:%@ >", v5, self->_doorState);;

  return v7;
}

- (NSNumber)doorState
{
  return self->_doorState;
}

- (void)setDoorState:(NSNumber *)doorState
{
}

- (void).cxx_destruct
{
}

@end