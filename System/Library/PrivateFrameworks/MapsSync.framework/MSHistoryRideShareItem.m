@interface MSHistoryRideShareItem
+ (Class)managedClass;
- (MSHistoryRideShareItem)initWithEndWaypoint:(id)a3 startWaypoint:(id)a4;
- (MSHistoryRideShareItem)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5;
- (MSHistoryRideShareItem)initWithStore:(id)a3 endWaypoint:(id)a4 startWaypoint:(id)a5;
- (NSData)endWaypoint;
- (NSData)startWaypoint;
- (void)setEndWaypoint:(id)a3;
- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4;
- (void)setStartWaypoint:(id)a3;
@end

@implementation MSHistoryRideShareItem

- (MSHistoryRideShareItem)initWithEndWaypoint:(id)a3 startWaypoint:(id)a4
{
  v5 = a3;
  if (!a3)
  {
    id v13 = a4;
    unint64_t v9 = 0xF000000000000000;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v10 = 0;
    unint64_t v12 = 0xF000000000000000;
    return (MSHistoryRideShareItem *)HistoryRideShareItem.init(endWaypoint:startWaypoint:)((uint64_t)v5, v9, v10, v12);
  }
  id v6 = a4;
  id v7 = v5;
  v5 = (void *)sub_1A709D198();
  unint64_t v9 = v8;

  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v10 = sub_1A709D198();
  unint64_t v12 = v11;

  return (MSHistoryRideShareItem *)HistoryRideShareItem.init(endWaypoint:startWaypoint:)((uint64_t)v5, v9, v10, v12);
}

- (MSHistoryRideShareItem)initWithStore:(id)a3 endWaypoint:(id)a4 startWaypoint:(id)a5
{
  id v6 = a4;
  if (!a4)
  {
    id v16 = a3;
    id v17 = a5;
    unint64_t v12 = 0xF000000000000000;
    if (a5) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v13 = 0;
    unint64_t v15 = 0xF000000000000000;
    return (MSHistoryRideShareItem *)HistoryRideShareItem.init(store:endWaypoint:startWaypoint:)(a3, (uint64_t)v6, v12, v13, v15);
  }
  id v8 = a3;
  id v9 = a5;
  id v10 = v6;
  id v6 = (void *)sub_1A709D198();
  unint64_t v12 = v11;

  if (!a5) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v13 = sub_1A709D198();
  unint64_t v15 = v14;

  return (MSHistoryRideShareItem *)HistoryRideShareItem.init(store:endWaypoint:startWaypoint:)(a3, (uint64_t)v6, v12, v13, v15);
}

+ (Class)managedClass
{
  type metadata accessor for MapsSyncManagedHistoryRideShareItem();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4
{
  id v6 = a3;
  id v7 = self;
  sub_1A6FF49E0(v6, a4);
}

- (NSData)endWaypoint
{
  return (NSData *)sub_1A6FF5058(self, (uint64_t)a2, sub_1A6FF4C30);
}

- (void)setEndWaypoint:(id)a3
{
}

- (NSData)startWaypoint
{
  return (NSData *)sub_1A6FF5058(self, (uint64_t)a2, sub_1A6FF50E4);
}

- (void)setStartWaypoint:(id)a3
{
}

- (MSHistoryRideShareItem)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5
{
  BOOL v5 = a5;
  *(_OWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSHistoryRideShareItem__endWaypoint) = xmmword_1A70A4EA0;
  *(_OWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSHistoryRideShareItem__startWaypoint) = xmmword_1A70A4EA0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSHistoryItem__position) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSHistoryItem__positionIndex) = 0;
  id v8 = a3;
  return (MSHistoryRideShareItem *)sub_1A6FBFBA0(a3, a4, v5);
}

- (void).cxx_destruct
{
  sub_1A6EEF5F4(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSHistoryRideShareItem__endWaypoint), *(void *)&self->super.super._store[OBJC_IVAR___MSHistoryRideShareItem__endWaypoint]);
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSHistoryRideShareItem__startWaypoint);
  unint64_t v4 = *(void *)&self->super.super._store[OBJC_IVAR___MSHistoryRideShareItem__startWaypoint];
  sub_1A6EEF5F4(v3, v4);
}

@end