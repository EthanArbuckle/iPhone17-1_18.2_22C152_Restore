@interface MTRValveConfigurationAndControlClusterValveStateChangedEvent
- (MTRValveConfigurationAndControlClusterValveStateChangedEvent)init;
- (NSNumber)valveLevel;
- (NSNumber)valveState;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setValveLevel:(id)a3;
- (void)setValveState:(id)a3;
@end

@implementation MTRValveConfigurationAndControlClusterValveStateChangedEvent

- (MTRValveConfigurationAndControlClusterValveStateChangedEvent)init
{
  v7.receiver = self;
  v7.super_class = (Class)MTRValveConfigurationAndControlClusterValveStateChangedEvent;
  v2 = [(MTRValveConfigurationAndControlClusterValveStateChangedEvent *)&v7 init];
  v3 = v2;
  if (v2)
  {
    valveState = v2->_valveState;
    v2->_valveState = (NSNumber *)&unk_26F9C8620;

    valveLevel = v3->_valveLevel;
    v3->_valveLevel = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRValveConfigurationAndControlClusterValveStateChangedEvent);
  objc_super v7 = objc_msgSend_valveState(self, v5, v6);
  objc_msgSend_setValveState_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_valveLevel(self, v9, v10);
  objc_msgSend_setValveLevel_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: valveState:%@; valveLevel:%@; >",
    v5,
    self->_valveState,
  objc_super v7 = self->_valveLevel);

  return v7;
}

- (NSNumber)valveState
{
  return self->_valveState;
}

- (void)setValveState:(id)a3
{
}

- (NSNumber)valveLevel
{
  return self->_valveLevel;
}

- (void)setValveLevel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valveLevel, 0);

  objc_storeStrong((id *)&self->_valveState, 0);
}

@end