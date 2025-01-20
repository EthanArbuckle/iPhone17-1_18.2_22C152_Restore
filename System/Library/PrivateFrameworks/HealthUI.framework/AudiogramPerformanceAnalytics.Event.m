@interface AudiogramPerformanceAnalytics.Event
- (BOOL)isEventSubmissionIHAGated;
- (NSString)eventName;
- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
@end

@implementation AudiogramPerformanceAnalytics.Event

- (BOOL)isEventSubmissionIHAGated
{
  return 0;
}

- (NSString)eventName
{
  v2 = (void *)sub_1E0ECD190();
  return (NSString *)v2;
}

- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  v5 = *(void **)self->metric;
  uint64_t v6 = *(void *)&self->metric[8];
  uint64_t ObjectType = swift_getObjectType();
  v8 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  id v9 = a3;
  swift_retain();
  id v10 = v5;
  v8(ObjectType, v6);
  swift_release();

  v11 = (void *)sub_1E0ECCFC0();
  swift_bridgeObjectRelease();
  return v11;
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  v5 = *(void **)self->metric;
  uint64_t v6 = *(void *)&self->metric[8];
  uint64_t ObjectType = swift_getObjectType();
  v8 = *(void (**)(uint64_t, uint64_t))(v6 + 16);
  id v9 = a3;
  swift_retain();
  id v10 = v5;
  v8(ObjectType, v6);
  swift_release();

  v11 = (void *)sub_1E0ECCFC0();
  swift_bridgeObjectRelease();
  return v11;
}

@end