@interface MSServerEvaluationStatus
+ (Class)managedClass;
- (BOOL)arpStatus;
- (BOOL)rapStatus;
- (BOOL)reliabilityStatus;
- (MSServerEvaluationStatus)initWithArpStatus:(BOOL)a3 positionIndex:(int64_t)a4 rapStatus:(BOOL)a5 reliabilityStatus:(BOOL)a6;
- (MSServerEvaluationStatus)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5;
- (MSServerEvaluationStatus)initWithStore:(id)a3 arpStatus:(BOOL)a4 positionIndex:(int64_t)a5 rapStatus:(BOOL)a6 reliabilityStatus:(BOOL)a7;
- (int64_t)positionIndex;
- (void)setArpStatus:(BOOL)a3;
- (void)setPositionIndex:(int64_t)a3;
- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4;
- (void)setRapStatus:(BOOL)a3;
- (void)setReliabilityStatus:(BOOL)a3;
@end

@implementation MSServerEvaluationStatus

- (MSServerEvaluationStatus)initWithArpStatus:(BOOL)a3 positionIndex:(int64_t)a4 rapStatus:(BOOL)a5 reliabilityStatus:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v9 = a3;
  if (qword_1EB6705E0 != -1) {
    swift_once();
  }
  uint64_t v11 = qword_1EB670750;
  return [(MSServerEvaluationStatus *)self initWithStore:v11 arpStatus:v9 positionIndex:a4 rapStatus:v7 reliabilityStatus:v6];
}

- (MSServerEvaluationStatus)initWithStore:(id)a3 arpStatus:(BOOL)a4 positionIndex:(int64_t)a5 rapStatus:(BOOL)a6 reliabilityStatus:(BOOL)a7
{
  return (MSServerEvaluationStatus *)ServerEvaluationStatus.init(store:arpStatus:positionIndex:rapStatus:reliabilityStatus:)(a3, a4, a5, a6, a7);
}

+ (Class)managedClass
{
  type metadata accessor for MapsSyncManagedServerEvaluationStatus();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4
{
  id v5 = a3;
  BOOL v6 = self;
  sub_1A6F73F58(v5);
}

- (BOOL)arpStatus
{
  return sub_1A6F73408((char *)self, (uint64_t)a2, &OBJC_IVAR___MSServerEvaluationStatus__arpStatus);
}

- (void)setArpStatus:(BOOL)a3
{
  v4 = self;
  sub_1A6F72B34(a3);
}

- (int64_t)positionIndex
{
  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  int64_t v4 = *(int64_t *)((char *)&v3->super.super.isa + OBJC_IVAR___MSServerEvaluationStatus__positionIndex);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setPositionIndex:(int64_t)a3
{
  int64_t v4 = self;
  sub_1A6F72E98(a3);
}

- (BOOL)rapStatus
{
  return sub_1A6F73408((char *)self, (uint64_t)a2, &OBJC_IVAR___MSServerEvaluationStatus__rapStatus);
}

- (void)setRapStatus:(BOOL)a3
{
  int64_t v4 = self;
  sub_1A6F731B0(a3);
}

- (BOOL)reliabilityStatus
{
  return sub_1A6F73408((char *)self, (uint64_t)a2, &OBJC_IVAR___MSServerEvaluationStatus__reliabilityStatus);
}

- (void)setReliabilityStatus:(BOOL)a3
{
  int64_t v4 = self;
  sub_1A6F73534(a3);
}

- (MSServerEvaluationStatus)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5
{
  BOOL v5 = a5;
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR___MSServerEvaluationStatus__arpStatus) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___MSServerEvaluationStatus__positionIndex) = 0;
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR___MSServerEvaluationStatus__rapStatus) = 0;
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR___MSServerEvaluationStatus__reliabilityStatus) = 0;
  id v8 = a3;
  return (MSServerEvaluationStatus *)sub_1A6FBFBA0(a3, a4, v5);
}

@end