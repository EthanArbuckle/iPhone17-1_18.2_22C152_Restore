@interface MSIncidentReport
+ (Class)managedClass;
- (MSIncidentReport)initWithCountryCode:(id)a3 positionIndex:(int64_t)a4 type:(signed __int16)a5;
- (MSIncidentReport)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5;
- (MSIncidentReport)initWithStore:(id)a3 countryCode:(id)a4 positionIndex:(int64_t)a5 type:(signed __int16)a6;
- (NSString)countryCode;
- (int64_t)positionIndex;
- (signed)type;
- (void)setCountryCode:(id)a3;
- (void)setPositionIndex:(int64_t)a3;
- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4;
- (void)setType:(signed __int16)a3;
@end

@implementation MSIncidentReport

- (MSIncidentReport)initWithCountryCode:(id)a3 positionIndex:(int64_t)a4 type:(signed __int16)a5
{
  uint64_t v5 = a5;
  if (a3)
  {
    sub_1A709D438();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v9 = 0;
  }
  if (qword_1EB6705E0 != -1) {
    swift_once();
  }
  uint64_t v10 = qword_1EB670750;
  if (v9)
  {
    v11 = (void *)sub_1A709D428();
    swift_bridgeObjectRelease();
  }
  else
  {
    v11 = 0;
  }
  v12 = [(MSIncidentReport *)self initWithStore:v10 countryCode:v11 positionIndex:a4 type:v5];

  return v12;
}

- (MSIncidentReport)initWithStore:(id)a3 countryCode:(id)a4 positionIndex:(int64_t)a5 type:(signed __int16)a6
{
  if (a4)
  {
    uint64_t v9 = sub_1A709D438();
    uint64_t v11 = v10;
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v11 = 0;
  }
  v12 = sub_1A6FF1930(a3, v9, v11, a5, a6);
  swift_bridgeObjectRelease();
  return (MSIncidentReport *)v12;
}

+ (Class)managedClass
{
  type metadata accessor for MapsSyncManagedIncidentReport();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_1A6FF07A4(v6, a4);
}

- (NSString)countryCode
{
  v2 = self;
  sub_1A6FF0980();
  uint64_t v4 = v3;

  if (v4)
  {
    uint64_t v5 = (void *)sub_1A709D428();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setCountryCode:(id)a3
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
  v7 = self;
  sub_1A6FF1BC0(v4, v6);

  swift_bridgeObjectRelease();
}

- (int64_t)positionIndex
{
  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  uint64_t v3 = self;
  objc_msgSend(v2, sel_lock);
  int64_t v4 = *(int64_t *)((char *)&v3->super.super.isa + OBJC_IVAR___MSIncidentReport__positionIndex);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setPositionIndex:(int64_t)a3
{
  int64_t v4 = self;
  sub_1A6FF1168(a3);
}

- (signed)type
{
  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  uint64_t v3 = self;
  objc_msgSend(v2, sel_lock);
  signed __int16 v4 = *(_WORD *)((char *)&v3->super.super.isa + OBJC_IVAR___MSIncidentReport__type);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setType:(signed __int16)a3
{
  signed __int16 v4 = self;
  sub_1A6FF152C(a3);
}

- (MSIncidentReport)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v8 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR___MSIncidentReport__countryCode);
  *uint64_t v8 = 0;
  v8[1] = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___MSIncidentReport__positionIndex) = 0;
  *(_WORD *)((char *)&self->super.super.isa + OBJC_IVAR___MSIncidentReport__type) = 0;
  id v9 = a3;
  return (MSIncidentReport *)sub_1A6FBFBA0(a3, a4, v5);
}

- (void).cxx_destruct
{
}

@end