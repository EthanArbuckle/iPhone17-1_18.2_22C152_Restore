@interface MSHistoryEvDirectionsItem
+ (Class)managedClass;
- (MSHistoryEvDirectionsItem)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5;
- (MSHistoryEvDirectionsItem)initWithRequiredCharge:(double)a3 vehicleIdentifier:(id)a4;
- (MSHistoryEvDirectionsItem)initWithStore:(id)a3 requiredCharge:(double)a4 vehicleIdentifier:(id)a5;
- (NSString)vehicleIdentifier;
- (double)requiredCharge;
- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4;
- (void)setRequiredCharge:(double)a3;
- (void)setVehicleIdentifier:(id)a3;
@end

@implementation MSHistoryEvDirectionsItem

- (MSHistoryEvDirectionsItem)initWithRequiredCharge:(double)a3 vehicleIdentifier:(id)a4
{
  if (a4)
  {
    sub_1A709D438();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v7 = 0;
  }
  if (qword_1EB6705E0 != -1) {
    swift_once();
  }
  uint64_t v8 = qword_1EB670750;
  if (v7)
  {
    v9 = (void *)sub_1A709D428();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  v10 = [(MSHistoryEvDirectionsItem *)self initWithStore:v8 requiredCharge:v9 vehicleIdentifier:a3];

  return v10;
}

- (MSHistoryEvDirectionsItem)initWithStore:(id)a3 requiredCharge:(double)a4 vehicleIdentifier:(id)a5
{
  if (a5)
  {
    uint64_t v7 = sub_1A709D438();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  v10 = sub_1A6FEFAC0(a3, v7, v9, a4);
  swift_bridgeObjectRelease();
  return (MSHistoryEvDirectionsItem *)v10;
}

+ (Class)managedClass
{
  type metadata accessor for MapsSyncManagedHistoryEvDirectionsItem();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_1A6FEEC5C(v6, a4);
}

- (double)requiredCharge
{
  v2 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  double v4 = *(double *)((char *)&v3->super.super.super.super.isa + OBJC_IVAR___MSHistoryEvDirectionsItem__requiredCharge);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setRequiredCharge:(double)a3
{
  double v4 = self;
  sub_1A6FEEEE8(a3);
}

- (NSString)vehicleIdentifier
{
  v2 = self;
  sub_1A6FEF22C();
  uint64_t v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1A709D428();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setVehicleIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1A709D438();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  uint64_t v7 = self;
  sub_1A6FEFD94(v4, v6);

  swift_bridgeObjectRelease();
}

- (MSHistoryEvDirectionsItem)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5
{
  BOOL v5 = a5;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___MSHistoryEvDirectionsItem__requiredCharge) = 0;
  uint64_t v8 = (Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___MSHistoryEvDirectionsItem__vehicleIdentifier);
  *uint64_t v8 = 0;
  v8[1] = 0;
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR___MSHistoryDirectionsItem__navigationInterrupted) = 0;
  *(_OWORD *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___MSHistoryDirectionsItem__routeRequestStorage) = xmmword_1A70A4EA0;
  *(_OWORD *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___MSHistoryDirectionsItem__sharedETAData) = xmmword_1A70A4EA0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___MSHistoryItem__position) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___MSHistoryItem__positionIndex) = 0;
  id v9 = a3;
  return (MSHistoryEvDirectionsItem *)sub_1A6FBFBA0(a3, a4, v5);
}

- (void).cxx_destruct
{
}

@end