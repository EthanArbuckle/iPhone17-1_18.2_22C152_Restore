@interface MTRWaterHeaterManagementClusterBoostStartedEvent
- (MTRWaterHeaterManagementClusterBoostStartedEvent)init;
- (MTRWaterHeaterManagementClusterWaterHeaterBoostInfoStruct)boostInfo;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setBoostInfo:(id)a3;
@end

@implementation MTRWaterHeaterManagementClusterBoostStartedEvent

- (MTRWaterHeaterManagementClusterBoostStartedEvent)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTRWaterHeaterManagementClusterBoostStartedEvent;
  v2 = [(MTRWaterHeaterManagementClusterBoostStartedEvent *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    boostInfo = v2->_boostInfo;
    v2->_boostInfo = (MTRWaterHeaterManagementClusterWaterHeaterBoostInfoStruct *)v3;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRWaterHeaterManagementClusterBoostStartedEvent);
  v7 = objc_msgSend_boostInfo(self, v5, v6);
  objc_msgSend_setBoostInfo_(v4, v8, (uint64_t)v7);

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: boostInfo:%@ >", v5, self->_boostInfo);;

  return v7;
}

- (MTRWaterHeaterManagementClusterWaterHeaterBoostInfoStruct)boostInfo
{
  return self->_boostInfo;
}

- (void)setBoostInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end