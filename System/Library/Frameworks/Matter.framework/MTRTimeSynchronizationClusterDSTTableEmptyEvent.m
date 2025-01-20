@interface MTRTimeSynchronizationClusterDSTTableEmptyEvent
- (MTRTimeSynchronizationClusterDSTTableEmptyEvent)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation MTRTimeSynchronizationClusterDSTTableEmptyEvent

- (MTRTimeSynchronizationClusterDSTTableEmptyEvent)init
{
  v3.receiver = self;
  v3.super_class = (Class)MTRTimeSynchronizationClusterDSTTableEmptyEvent;
  return [(MTRTimeSynchronizationClusterDSTTableEmptyEvent *)&v3 init];
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_alloc_init(MTRTimeSynchronizationClusterDSTTableEmptyEvent);
}

- (id)description
{
  v2 = NSString;
  objc_super v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v6 = objc_msgSend_stringWithFormat_(v2, v5, @"<%@: >", v4);

  return v6;
}

@end