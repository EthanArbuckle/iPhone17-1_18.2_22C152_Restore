@interface MTRBasicInformationClusterReachableChangedEvent
- (MTRBasicInformationClusterReachableChangedEvent)init;
- (NSNumber)reachableNewValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setReachableNewValue:(NSNumber *)reachableNewValue;
@end

@implementation MTRBasicInformationClusterReachableChangedEvent

- (MTRBasicInformationClusterReachableChangedEvent)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTRBasicInformationClusterReachableChangedEvent;
  v2 = [(MTRBasicInformationClusterReachableChangedEvent *)&v6 init];
  v3 = v2;
  if (v2)
  {
    reachableNewValue = v2->_reachableNewValue;
    v2->_reachableNewValue = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRBasicInformationClusterReachableChangedEvent);
  v7 = objc_msgSend_reachableNewValue(self, v5, v6);
  objc_msgSend_setReachableNewValue_(v4, v8, (uint64_t)v7);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: reachableNewValue:%@ >", v5, self->_reachableNewValue);;

  return v7;
}

- (NSNumber)reachableNewValue
{
  return self->_reachableNewValue;
}

- (void)setReachableNewValue:(NSNumber *)reachableNewValue
{
}

- (void).cxx_destruct
{
}

@end