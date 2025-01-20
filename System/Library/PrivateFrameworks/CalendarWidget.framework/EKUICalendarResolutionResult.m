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
  id v5 = sub_1DAF9755C((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithEKUICalendarsToDisambiguate:(id)a3
{
  type metadata accessor for EKUICalendar();
  unint64_t v3 = sub_1DAF998C0();
  swift_getObjCClassMetadata();
  id v4 = sub_1DAF97610(v3);
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)confirmationRequiredWithEKUICalendarToConfirm:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = sub_1DAF977B4((uint64_t)a3);

  return v5;
}

+ (id)successWithResolvedObject:(id)a3
{
  id result = (id)sub_1DAF99C60();
  __break(1u);
  return result;
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
  id result = (id)sub_1DAF99C60();
  __break(1u);
  return result;
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
  id result = (id)sub_1DAF99C60();
  __break(1u);
  return result;
}

- (EKUICalendarResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  sub_1DAF996B0();
  id v6 = a4;
  v7 = (void *)sub_1DAF996A0();
  swift_bridgeObjectRelease();
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for EKUICalendarResolutionResult();
  v8 = [(EKUICalendarResolutionResult *)&v11 initWithJSONDictionary:v7 forIntent:v6];

  v9 = v8;
  if (v9) {

  }
  return v9;
}

@end