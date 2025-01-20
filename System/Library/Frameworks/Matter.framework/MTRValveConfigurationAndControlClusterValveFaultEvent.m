@interface MTRValveConfigurationAndControlClusterValveFaultEvent
- (MTRValveConfigurationAndControlClusterValveFaultEvent)init;
- (NSNumber)valveFault;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setValveFault:(id)a3;
@end

@implementation MTRValveConfigurationAndControlClusterValveFaultEvent

- (MTRValveConfigurationAndControlClusterValveFaultEvent)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTRValveConfigurationAndControlClusterValveFaultEvent;
  v2 = [(MTRValveConfigurationAndControlClusterValveFaultEvent *)&v6 init];
  v3 = v2;
  if (v2)
  {
    valveFault = v2->_valveFault;
    v2->_valveFault = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRValveConfigurationAndControlClusterValveFaultEvent);
  v7 = objc_msgSend_valveFault(self, v5, v6);
  objc_msgSend_setValveFault_(v4, v8, (uint64_t)v7);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: valveFault:%@ >", v5, self->_valveFault);;

  return v7;
}

- (NSNumber)valveFault
{
  return self->_valveFault;
}

- (void)setValveFault:(id)a3
{
}

- (void).cxx_destruct
{
}

@end