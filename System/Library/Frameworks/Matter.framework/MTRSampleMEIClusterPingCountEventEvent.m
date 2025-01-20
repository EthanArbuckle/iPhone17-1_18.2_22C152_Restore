@interface MTRSampleMEIClusterPingCountEventEvent
- (MTRSampleMEIClusterPingCountEventEvent)init;
- (NSNumber)fabricIndex;
- (NSNumber)getCount;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setCount:(id)a3;
- (void)setFabricIndex:(id)a3;
@end

@implementation MTRSampleMEIClusterPingCountEventEvent

- (MTRSampleMEIClusterPingCountEventEvent)init
{
  v7.receiver = self;
  v7.super_class = (Class)MTRSampleMEIClusterPingCountEventEvent;
  v2 = [(MTRSampleMEIClusterPingCountEventEvent *)&v7 init];
  v3 = v2;
  if (v2)
  {
    count = v2->_count;
    v2->_count = (NSNumber *)&unk_26F9C8620;

    fabricIndex = v3->_fabricIndex;
    v3->_fabricIndex = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRSampleMEIClusterPingCountEventEvent);
  objc_super v7 = objc_msgSend_getCount(self, v5, v6);
  objc_msgSend_setCount_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_fabricIndex(self, v9, v10);
  objc_msgSend_setFabricIndex_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: count:%@; fabricIndex:%@; >",
    v5,
    self->_count,
  objc_super v7 = self->_fabricIndex);

  return v7;
}

- (NSNumber)getCount
{
  return self->_count;
}

- (void)setCount:(id)a3
{
}

- (NSNumber)fabricIndex
{
  return self->_fabricIndex;
}

- (void)setFabricIndex:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fabricIndex, 0);

  objc_storeStrong((id *)&self->_count, 0);
}

@end