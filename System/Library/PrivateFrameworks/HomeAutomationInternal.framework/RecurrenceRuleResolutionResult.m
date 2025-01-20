@interface RecurrenceRuleResolutionResult
+ (id)confirmationRequiredWithObjectToConfirm:(id)a3;
+ (id)confirmationRequiredWithRecurrenceRuleToConfirm:(id)a3;
+ (id)disambiguationWithObjectsToDisambiguate:(id)a3;
+ (id)disambiguationWithRecurrenceRulesToDisambiguate:(id)a3;
+ (id)successWithResolvedObject:(id)a3;
+ (id)successWithResolvedRecurrenceRule:(id)a3;
- (RecurrenceRuleResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation RecurrenceRuleResolutionResult

+ (id)successWithResolvedRecurrenceRule:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = sub_22E6C7D6C((uint64_t)v4);

  return v5;
}

+ (id)disambiguationWithRecurrenceRulesToDisambiguate:(id)a3
{
  type metadata accessor for RecurrenceRule();
  unint64_t v3 = sub_22E6D0430();
  swift_getObjCClassMetadata();
  id v4 = sub_22E6C7E20(v3);
  swift_bridgeObjectRelease();

  return v4;
}

+ (id)confirmationRequiredWithRecurrenceRuleToConfirm:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = sub_22E6C7F84((uint64_t)a3);

  return v5;
}

+ (id)successWithResolvedObject:(id)a3
{
  id result = (id)sub_22E6D0CC0();
  __break(1u);
  return result;
}

+ (id)disambiguationWithObjectsToDisambiguate:(id)a3
{
  id result = (id)sub_22E6D0CC0();
  __break(1u);
  return result;
}

+ (id)confirmationRequiredWithObjectToConfirm:(id)a3
{
  id result = (id)sub_22E6D0CC0();
  __break(1u);
  return result;
}

- (RecurrenceRuleResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  sub_22E6D0050();
  id v6 = a4;
  v7 = (void *)sub_22E6D0030();
  swift_bridgeObjectRelease();
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for RecurrenceRuleResolutionResult();
  v8 = [(RecurrenceRuleResolutionResult *)&v11 initWithJSONDictionary:v7 forIntent:v6];

  v9 = v8;
  if (v9) {

  }
  return v9;
}

@end