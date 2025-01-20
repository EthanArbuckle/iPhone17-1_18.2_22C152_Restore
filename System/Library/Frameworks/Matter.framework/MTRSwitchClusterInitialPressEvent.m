@interface MTRSwitchClusterInitialPressEvent
- (MTRSwitchClusterInitialPressEvent)init;
- (NSNumber)getNewPosition;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setNewPosition:(NSNumber *)newPosition;
@end

@implementation MTRSwitchClusterInitialPressEvent

- (MTRSwitchClusterInitialPressEvent)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTRSwitchClusterInitialPressEvent;
  v2 = [(MTRSwitchClusterInitialPressEvent *)&v6 init];
  v3 = v2;
  if (v2)
  {
    newPosition = v2->_newPosition;
    v2->_newPosition = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRSwitchClusterInitialPressEvent);
  v7 = objc_msgSend_getNewPosition(self, v5, v6);
  objc_msgSend_setNewPosition_(v4, v8, (uint64_t)v7);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: newPosition:%@ >", v5, self->_newPosition);;

  return v7;
}

- (NSNumber)getNewPosition
{
  return self->_newPosition;
}

- (void)setNewPosition:(NSNumber *)newPosition
{
}

- (void).cxx_destruct
{
}

@end