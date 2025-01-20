@interface MTROvenCavityOperationalStateClusterOperationalErrorEvent
- (MTROvenCavityOperationalStateClusterErrorStateStruct)errorState;
- (MTROvenCavityOperationalStateClusterOperationalErrorEvent)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setErrorState:(id)a3;
@end

@implementation MTROvenCavityOperationalStateClusterOperationalErrorEvent

- (MTROvenCavityOperationalStateClusterOperationalErrorEvent)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTROvenCavityOperationalStateClusterOperationalErrorEvent;
  v2 = [(MTROvenCavityOperationalStateClusterOperationalErrorEvent *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    errorState = v2->_errorState;
    v2->_errorState = (MTROvenCavityOperationalStateClusterErrorStateStruct *)v3;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTROvenCavityOperationalStateClusterOperationalErrorEvent);
  v7 = objc_msgSend_errorState(self, v5, v6);
  objc_msgSend_setErrorState_(v4, v8, (uint64_t)v7);

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: errorState:%@ >", v5, self->_errorState);;

  return v7;
}

- (MTROvenCavityOperationalStateClusterErrorStateStruct)errorState
{
  return self->_errorState;
}

- (void)setErrorState:(id)a3
{
}

- (void).cxx_destruct
{
}

@end