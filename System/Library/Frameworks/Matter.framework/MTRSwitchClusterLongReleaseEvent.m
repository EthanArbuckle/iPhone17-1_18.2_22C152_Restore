@interface MTRSwitchClusterLongReleaseEvent
- (MTRSwitchClusterLongReleaseEvent)init;
- (NSNumber)previousPosition;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setPreviousPosition:(NSNumber *)previousPosition;
@end

@implementation MTRSwitchClusterLongReleaseEvent

- (MTRSwitchClusterLongReleaseEvent)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTRSwitchClusterLongReleaseEvent;
  v2 = [(MTRSwitchClusterLongReleaseEvent *)&v6 init];
  v3 = v2;
  if (v2)
  {
    previousPosition = v2->_previousPosition;
    v2->_previousPosition = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRSwitchClusterLongReleaseEvent);
  v7 = objc_msgSend_previousPosition(self, v5, v6);
  objc_msgSend_setPreviousPosition_(v4, v8, (uint64_t)v7);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: previousPosition:%@ >", v5, self->_previousPosition);;

  return v7;
}

- (NSNumber)previousPosition
{
  return self->_previousPosition;
}

- (void)setPreviousPosition:(NSNumber *)previousPosition
{
}

- (void).cxx_destruct
{
}

@end