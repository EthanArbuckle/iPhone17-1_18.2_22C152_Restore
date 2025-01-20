@interface MTRTargetNavigatorClusterTargetUpdatedEvent
- (MTRTargetNavigatorClusterTargetUpdatedEvent)init;
- (NSArray)targetList;
- (NSData)data;
- (NSNumber)currentTarget;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setCurrentTarget:(id)a3;
- (void)setData:(id)a3;
- (void)setTargetList:(id)a3;
@end

@implementation MTRTargetNavigatorClusterTargetUpdatedEvent

- (MTRTargetNavigatorClusterTargetUpdatedEvent)init
{
  v13.receiver = self;
  v13.super_class = (Class)MTRTargetNavigatorClusterTargetUpdatedEvent;
  v4 = [(MTRTargetNavigatorClusterTargetUpdatedEvent *)&v13 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend_array(MEMORY[0x263EFF8C0], v2, v3);
    targetList = v4->_targetList;
    v4->_targetList = (NSArray *)v5;

    currentTarget = v4->_currentTarget;
    v4->_currentTarget = (NSNumber *)&unk_26F9C8620;

    uint64_t v10 = objc_msgSend_data(MEMORY[0x263EFF8F8], v8, v9);
    data = v4->_data;
    v4->_data = (NSData *)v10;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRTargetNavigatorClusterTargetUpdatedEvent);
  v7 = objc_msgSend_targetList(self, v5, v6);
  objc_msgSend_setTargetList_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_currentTarget(self, v9, v10);
  objc_msgSend_setCurrentTarget_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_data(self, v13, v14);
  objc_msgSend_setData_(v4, v16, (uint64_t)v15);

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  targetList = self->_targetList;
  currentTarget = self->_currentTarget;
  uint64_t v9 = objc_msgSend_base64EncodedStringWithOptions_(self->_data, v8, 0);
  objc_msgSend_stringWithFormat_(v3, v10, @"<%@: targetList:%@; currentTarget:%@; data:%@; >",
    v5,
    targetList,
    currentTarget,
  v11 = v9);

  return v11;
}

- (NSArray)targetList
{
  return self->_targetList;
}

- (void)setTargetList:(id)a3
{
}

- (NSNumber)currentTarget
{
  return self->_currentTarget;
}

- (void)setCurrentTarget:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_currentTarget, 0);

  objc_storeStrong((id *)&self->_targetList, 0);
}

@end