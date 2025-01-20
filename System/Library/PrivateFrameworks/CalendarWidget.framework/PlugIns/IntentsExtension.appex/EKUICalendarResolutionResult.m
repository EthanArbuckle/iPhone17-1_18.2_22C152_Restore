@interface EKUICalendarResolutionResult
+ (id)confirmationRequiredWithEKUICalendarToConfirm:(id)a3;
+ (id)confirmationRequiredWithObjectToConfirm:(id)a3;
+ (id)disambiguationWithEKUICalendarsToDisambiguate:(id)a3;
+ (id)disambiguationWithObjectsToDisambiguate:(id)a3;
+ (id)successWithResolvedEKUICalendar:(id)a3;
+ (id)successWithResolvedObject:(id)a3;
- (EKUICalendarResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation EKUICalendarResolutionResult

+ (id)successWithResolvedEKUICalendar:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static EKUICalendarResolutionResult.success(with:)((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithEKUICalendarsToDisambiguate:(id)a3
{
  type metadata accessor for EKUICalendar();
  unint64_t v3 = sub_100009920();
  swift_getObjCClassMetadata();
  id v4 = static EKUICalendarResolutionResult.disambiguation(with:)(v3);
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)confirmationRequiredWithEKUICalendarToConfirm:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = static EKUICalendarResolutionResult.confirmationRequired(with:)((uint64_t)a3);

  return v5;
}

+ (id)successWithResolvedObject:(id)a3
{
  id result = (id)sub_100009A00();
  __break(1u);
  return result;
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
  id result = (id)sub_100009A00();
  __break(1u);
  return result;
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
  id result = (id)sub_100009A00();
  __break(1u);
  return result;
}

- (EKUICalendarResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  sub_1000098C0();
  id v6 = a4;
  Class isa = sub_1000098B0().super.isa;
  swift_bridgeObjectRelease();
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for EKUICalendarResolutionResult();
  v8 = [(EKUICalendarResolutionResult *)&v11 initWithJSONDictionary:isa forIntent:v6];

  v9 = v8;
  if (v9) {

  }
  return v9;
}

@end