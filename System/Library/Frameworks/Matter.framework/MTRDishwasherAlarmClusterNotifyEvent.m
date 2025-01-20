@interface MTRDishwasherAlarmClusterNotifyEvent
- (MTRDishwasherAlarmClusterNotifyEvent)init;
- (NSNumber)active;
- (NSNumber)inactive;
- (NSNumber)mask;
- (NSNumber)state;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setActive:(id)a3;
- (void)setInactive:(id)a3;
- (void)setMask:(id)a3;
- (void)setState:(id)a3;
@end

@implementation MTRDishwasherAlarmClusterNotifyEvent

- (MTRDishwasherAlarmClusterNotifyEvent)init
{
  v9.receiver = self;
  v9.super_class = (Class)MTRDishwasherAlarmClusterNotifyEvent;
  v2 = [(MTRDishwasherAlarmClusterNotifyEvent *)&v9 init];
  v3 = v2;
  if (v2)
  {
    active = v2->_active;
    v2->_active = (NSNumber *)&unk_26F9C8620;

    inactive = v3->_inactive;
    v3->_inactive = (NSNumber *)&unk_26F9C8620;

    state = v3->_state;
    v3->_state = (NSNumber *)&unk_26F9C8620;

    mask = v3->_mask;
    v3->_mask = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRDishwasherAlarmClusterNotifyEvent);
  v7 = objc_msgSend_active(self, v5, v6);
  objc_msgSend_setActive_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_inactive(self, v9, v10);
  objc_msgSend_setInactive_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_state(self, v13, v14);
  objc_msgSend_setState_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_mask(self, v17, v18);
  objc_msgSend_setMask_(v4, v20, (uint64_t)v19);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: active:%@; inactive:%@; state:%@; mask:%@; >",
    v5,
    self->_active,
    self->_inactive,
    self->_state,
  v7 = self->_mask);

  return v7;
}

- (NSNumber)active
{
  return self->_active;
}

- (void)setActive:(id)a3
{
}

- (NSNumber)inactive
{
  return self->_inactive;
}

- (void)setInactive:(id)a3
{
}

- (NSNumber)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (NSNumber)mask
{
  return self->_mask;
}

- (void)setMask:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mask, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_inactive, 0);

  objc_storeStrong((id *)&self->_active, 0);
}

@end