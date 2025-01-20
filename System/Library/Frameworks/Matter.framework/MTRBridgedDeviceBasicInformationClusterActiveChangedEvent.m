@interface MTRBridgedDeviceBasicInformationClusterActiveChangedEvent
- (MTRBridgedDeviceBasicInformationClusterActiveChangedEvent)init;
- (NSNumber)promisedActiveDuration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setPromisedActiveDuration:(id)a3;
@end

@implementation MTRBridgedDeviceBasicInformationClusterActiveChangedEvent

- (MTRBridgedDeviceBasicInformationClusterActiveChangedEvent)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTRBridgedDeviceBasicInformationClusterActiveChangedEvent;
  v2 = [(MTRBridgedDeviceBasicInformationClusterActiveChangedEvent *)&v6 init];
  v3 = v2;
  if (v2)
  {
    promisedActiveDuration = v2->_promisedActiveDuration;
    v2->_promisedActiveDuration = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRBridgedDeviceBasicInformationClusterActiveChangedEvent);
  v7 = objc_msgSend_promisedActiveDuration(self, v5, v6);
  objc_msgSend_setPromisedActiveDuration_(v4, v8, (uint64_t)v7);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: promisedActiveDuration:%@; >",
    v5,
  v7 = self->_promisedActiveDuration);

  return v7;
}

- (NSNumber)promisedActiveDuration
{
  return self->_promisedActiveDuration;
}

- (void)setPromisedActiveDuration:(id)a3
{
}

- (void).cxx_destruct
{
}

@end