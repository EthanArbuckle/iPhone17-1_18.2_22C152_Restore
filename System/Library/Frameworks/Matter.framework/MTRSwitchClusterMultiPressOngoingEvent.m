@interface MTRSwitchClusterMultiPressOngoingEvent
- (MTRSwitchClusterMultiPressOngoingEvent)init;
- (NSNumber)currentNumberOfPressesCounted;
- (NSNumber)getNewPosition;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setCurrentNumberOfPressesCounted:(NSNumber *)currentNumberOfPressesCounted;
- (void)setNewPosition:(NSNumber *)newPosition;
@end

@implementation MTRSwitchClusterMultiPressOngoingEvent

- (MTRSwitchClusterMultiPressOngoingEvent)init
{
  v7.receiver = self;
  v7.super_class = (Class)MTRSwitchClusterMultiPressOngoingEvent;
  v2 = [(MTRSwitchClusterMultiPressOngoingEvent *)&v7 init];
  v3 = v2;
  if (v2)
  {
    newPosition = v2->_newPosition;
    v2->_newPosition = (NSNumber *)&unk_26F9C8620;

    currentNumberOfPressesCounted = v3->_currentNumberOfPressesCounted;
    v3->_currentNumberOfPressesCounted = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRSwitchClusterMultiPressOngoingEvent);
  objc_super v7 = objc_msgSend_getNewPosition(self, v5, v6);
  objc_msgSend_setNewPosition_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_currentNumberOfPressesCounted(self, v9, v10);
  objc_msgSend_setCurrentNumberOfPressesCounted_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: newPosition:%@; currentNumberOfPressesCounted:%@; >",
    v5,
    self->_newPosition,
  objc_super v7 = self->_currentNumberOfPressesCounted);

  return v7;
}

- (NSNumber)getNewPosition
{
  return self->_newPosition;
}

- (void)setNewPosition:(NSNumber *)newPosition
{
}

- (NSNumber)currentNumberOfPressesCounted
{
  return self->_currentNumberOfPressesCounted;
}

- (void)setCurrentNumberOfPressesCounted:(NSNumber *)currentNumberOfPressesCounted
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentNumberOfPressesCounted, 0);

  objc_storeStrong((id *)&self->_newPosition, 0);
}

@end