@interface DateRangeRelevanceProviderManager
+ (Class)_relevanceProviderClass;
+ (NSArray)_features;
- (_TtC18HealthPlatformCore33DateRangeRelevanceProviderManager)initWithQueue:(id)a3;
- (id)_valueForProvider:(id)a3 context:(id)a4 feature:(id)a5;
- (id)_valueForProvider:(id)a3 feature:(id)a4;
@end

@implementation DateRangeRelevanceProviderManager

+ (NSArray)_features
{
  sub_1C1DDA998(0, (unint64_t *)&qword_1EBB660F8, MEMORY[0x1E4FBC838] + 8, MEMORY[0x1E4FBBE00]);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1C1EB04A0;
  if (qword_1EBB680D0 != -1) {
    swift_once();
  }
  v3 = (void *)qword_1EBB6ACE0;
  *(void *)(v2 + 32) = qword_1EBB6ACE0;
  sub_1C1EAEEB8();
  sub_1C1DDA958();
  id v4 = v3;
  v5 = (void *)sub_1C1EAEE88();
  swift_bridgeObjectRelease();
  return (NSArray *)v5;
}

+ (Class)_relevanceProviderClass
{
  type metadata accessor for DateRangeRelevanceProvider();
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC18HealthPlatformCore33DateRangeRelevanceProviderManager)initWithQueue:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DateRangeRelevanceProviderManager();
  return [(RERelevanceProviderManager *)&v5 initWithQueue:a3];
}

- (id)_valueForProvider:(id)a3 context:(id)a4 feature:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  v12 = (void *)sub_1C1E1A2C8(v8, a4);

  return v12;
}

- (id)_valueForProvider:(id)a3 feature:(id)a4
{
  id v4 = [(DateRangeRelevanceProviderManager *)self _valueForProvider:a3 context:0 feature:a4];
  return v4;
}

@end