@interface MTRBooleanStateClusterStateChangeEvent
- (MTRBooleanStateClusterStateChangeEvent)init;
- (NSNumber)stateValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setStateValue:(NSNumber *)stateValue;
@end

@implementation MTRBooleanStateClusterStateChangeEvent

- (MTRBooleanStateClusterStateChangeEvent)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTRBooleanStateClusterStateChangeEvent;
  v2 = [(MTRBooleanStateClusterStateChangeEvent *)&v6 init];
  v3 = v2;
  if (v2)
  {
    stateValue = v2->_stateValue;
    v2->_stateValue = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRBooleanStateClusterStateChangeEvent);
  v7 = objc_msgSend_stateValue(self, v5, v6);
  objc_msgSend_setStateValue_(v4, v8, (uint64_t)v7);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: stateValue:%@ >", v5, self->_stateValue);;

  return v7;
}

- (NSNumber)stateValue
{
  return self->_stateValue;
}

- (void)setStateValue:(NSNumber *)stateValue
{
}

- (void).cxx_destruct
{
}

@end