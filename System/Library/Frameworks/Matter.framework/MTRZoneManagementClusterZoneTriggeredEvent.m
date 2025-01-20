@interface MTRZoneManagementClusterZoneTriggeredEvent
- (MTRZoneManagementClusterZoneTriggeredEvent)init;
- (NSArray)zones;
- (NSNumber)reason;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setReason:(id)a3;
- (void)setZones:(id)a3;
@end

@implementation MTRZoneManagementClusterZoneTriggeredEvent

- (MTRZoneManagementClusterZoneTriggeredEvent)init
{
  v9.receiver = self;
  v9.super_class = (Class)MTRZoneManagementClusterZoneTriggeredEvent;
  v4 = [(MTRZoneManagementClusterZoneTriggeredEvent *)&v9 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend_array(MEMORY[0x263EFF8C0], v2, v3);
    zones = v4->_zones;
    v4->_zones = (NSArray *)v5;

    reason = v4->_reason;
    v4->_reason = (NSNumber *)&unk_26F9C8620;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRZoneManagementClusterZoneTriggeredEvent);
  v7 = objc_msgSend_zones(self, v5, v6);
  objc_msgSend_setZones_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_reason(self, v9, v10);
  objc_msgSend_setReason_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: zones:%@ reason:%@; >", v5, self->_zones, self->_reason);;

  return v7;
}

- (NSArray)zones
{
  return self->_zones;
}

- (void)setZones:(id)a3
{
}

- (NSNumber)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);

  objc_storeStrong((id *)&self->_zones, 0);
}

@end