@interface MSAnalyticsIdentifier
+ (Class)managedClass;
- (MSAnalyticsIdentifier)initWithData:(id)a3 positionIndex:(int64_t)a4;
- (MSAnalyticsIdentifier)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5;
- (MSAnalyticsIdentifier)initWithStore:(id)a3 data:(id)a4 positionIndex:(int64_t)a5;
- (NSData)data;
- (int64_t)positionIndex;
- (void)setData:(id)a3;
- (void)setPositionIndex:(int64_t)a3;
- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4;
@end

@implementation MSAnalyticsIdentifier

- (MSAnalyticsIdentifier)initWithData:(id)a3 positionIndex:(int64_t)a4
{
  uint64_t v5 = (uint64_t)a3;
  if (a3)
  {
    id v7 = a3;
    uint64_t v5 = sub_1A709D198();
    unint64_t v9 = v8;
  }
  else
  {
    unint64_t v9 = 0xF000000000000000;
  }
  if (qword_1EB6705E0 != -1) {
    swift_once();
  }
  uint64_t v10 = qword_1EB670750;
  if (v9 >> 60 == 15)
  {
    v11 = 0;
  }
  else
  {
    sub_1A6EEF59C(v5, v9);
    v11 = (void *)sub_1A709D188();
    sub_1A6EEF5F4(v5, v9);
  }
  v12 = [(MSAnalyticsIdentifier *)self initWithStore:v10 data:v11 positionIndex:a4];
  sub_1A6EEF5F4(v5, v9);

  return v12;
}

- (MSAnalyticsIdentifier)initWithStore:(id)a3 data:(id)a4 positionIndex:(int64_t)a5
{
  v6 = a4;
  if (a4)
  {
    id v8 = a3;
    id v9 = v6;
    v6 = (void *)sub_1A709D198();
    unint64_t v11 = v10;
  }
  else
  {
    id v12 = a3;
    unint64_t v11 = 0xF000000000000000;
  }
  return (MSAnalyticsIdentifier *)AnalyticsIdentifier.init(store:data:positionIndex:)(a3, (uint64_t)v6, v11, a5);
}

+ (Class)managedClass
{
  type metadata accessor for MapsSyncManagedAnalyticsIdentifier();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4
{
  id v6 = a3;
  id v7 = self;
  sub_1A6F75E60(v6, a4);
}

- (NSData)data
{
  v2 = self;
  uint64_t v3 = sub_1A6F7602C();
  unint64_t v5 = v4;

  if (v5 >> 60 == 15)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = (void *)sub_1A709D188();
    sub_1A6EEF5F4(v3, v5);
  }
  return (NSData *)v6;
}

- (void)setData:(id)a3
{
  uint64_t v3 = a3;
  if (a3)
  {
    unint64_t v4 = self;
    id v5 = v3;
    uint64_t v3 = (void *)sub_1A709D198();
    unint64_t v7 = v6;
  }
  else
  {
    id v8 = self;
    unint64_t v7 = 0xF000000000000000;
  }
  sub_1A6F76CD0((uint64_t)v3, v7);
  sub_1A6EEF5F4((uint64_t)v3, v7);
}

- (int64_t)positionIndex
{
  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  uint64_t v3 = self;
  objc_msgSend(v2, sel_lock);
  int64_t v4 = *(int64_t *)((char *)&v3->super.super.isa + OBJC_IVAR___MSAnalyticsIdentifier__positionIndex);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setPositionIndex:(int64_t)a3
{
  int64_t v4 = self;
  sub_1A6F76870(a3);
}

- (MSAnalyticsIdentifier)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5
{
  BOOL v5 = a5;
  *(_OWORD *)((char *)&self->super.super.isa + OBJC_IVAR___MSAnalyticsIdentifier__data) = xmmword_1A70A4EA0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___MSAnalyticsIdentifier__positionIndex) = 0;
  id v8 = a3;
  return (MSAnalyticsIdentifier *)sub_1A6FBFBA0(a3, a4, v5);
}

- (void).cxx_destruct
{
}

@end