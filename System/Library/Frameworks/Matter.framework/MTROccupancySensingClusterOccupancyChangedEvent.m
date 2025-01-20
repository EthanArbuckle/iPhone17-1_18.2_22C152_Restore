@interface MTROccupancySensingClusterOccupancyChangedEvent
- (MTROccupancySensingClusterOccupancyChangedEvent)init;
- (NSNumber)occupancy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setOccupancy:(id)a3;
@end

@implementation MTROccupancySensingClusterOccupancyChangedEvent

- (MTROccupancySensingClusterOccupancyChangedEvent)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTROccupancySensingClusterOccupancyChangedEvent;
  v2 = [(MTROccupancySensingClusterOccupancyChangedEvent *)&v6 init];
  v3 = v2;
  if (v2)
  {
    occupancy = v2->_occupancy;
    v2->_occupancy = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTROccupancySensingClusterOccupancyChangedEvent);
  v7 = objc_msgSend_occupancy(self, v5, v6);
  objc_msgSend_setOccupancy_(v4, v8, (uint64_t)v7);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: occupancy:%@ >", v5, self->_occupancy);;

  return v7;
}

- (NSNumber)occupancy
{
  return self->_occupancy;
}

- (void)setOccupancy:(id)a3
{
}

- (void).cxx_destruct
{
}

@end