@interface MTRSwitchClusterMultiPressCompleteEvent
- (MTRSwitchClusterMultiPressCompleteEvent)init;
- (NSNumber)previousPosition;
- (NSNumber)totalNumberOfPressesCounted;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setPreviousPosition:(NSNumber *)previousPosition;
- (void)setTotalNumberOfPressesCounted:(NSNumber *)totalNumberOfPressesCounted;
@end

@implementation MTRSwitchClusterMultiPressCompleteEvent

- (MTRSwitchClusterMultiPressCompleteEvent)init
{
  v7.receiver = self;
  v7.super_class = (Class)MTRSwitchClusterMultiPressCompleteEvent;
  v2 = [(MTRSwitchClusterMultiPressCompleteEvent *)&v7 init];
  v3 = v2;
  if (v2)
  {
    previousPosition = v2->_previousPosition;
    v2->_previousPosition = (NSNumber *)&unk_26F9C8620;

    totalNumberOfPressesCounted = v3->_totalNumberOfPressesCounted;
    v3->_totalNumberOfPressesCounted = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRSwitchClusterMultiPressCompleteEvent);
  objc_super v7 = objc_msgSend_previousPosition(self, v5, v6);
  objc_msgSend_setPreviousPosition_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_totalNumberOfPressesCounted(self, v9, v10);
  objc_msgSend_setTotalNumberOfPressesCounted_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: previousPosition:%@; totalNumberOfPressesCounted:%@; >",
    v5,
    self->_previousPosition,
  objc_super v7 = self->_totalNumberOfPressesCounted);

  return v7;
}

- (NSNumber)previousPosition
{
  return self->_previousPosition;
}

- (void)setPreviousPosition:(NSNumber *)previousPosition
{
}

- (NSNumber)totalNumberOfPressesCounted
{
  return self->_totalNumberOfPressesCounted;
}

- (void)setTotalNumberOfPressesCounted:(NSNumber *)totalNumberOfPressesCounted
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalNumberOfPressesCounted, 0);

  objc_storeStrong((id *)&self->_previousPosition, 0);
}

@end