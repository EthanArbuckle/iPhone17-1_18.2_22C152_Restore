@interface MTRTimeSynchronizationClusterDSTStatusEvent
- (MTRTimeSynchronizationClusterDSTStatusEvent)init;
- (NSNumber)dstOffsetActive;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setDstOffsetActive:(id)a3;
@end

@implementation MTRTimeSynchronizationClusterDSTStatusEvent

- (MTRTimeSynchronizationClusterDSTStatusEvent)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTRTimeSynchronizationClusterDSTStatusEvent;
  v2 = [(MTRTimeSynchronizationClusterDSTStatusEvent *)&v6 init];
  v3 = v2;
  if (v2)
  {
    dstOffsetActive = v2->_dstOffsetActive;
    v2->_dstOffsetActive = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRTimeSynchronizationClusterDSTStatusEvent);
  v7 = objc_msgSend_dstOffsetActive(self, v5, v6);
  objc_msgSend_setDstOffsetActive_(v4, v8, (uint64_t)v7);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: dstOffsetActive:%@ >", v5, self->_dstOffsetActive);;

  return v7;
}

- (NSNumber)dstOffsetActive
{
  return self->_dstOffsetActive;
}

- (void)setDstOffsetActive:(id)a3
{
}

- (void).cxx_destruct
{
}

@end