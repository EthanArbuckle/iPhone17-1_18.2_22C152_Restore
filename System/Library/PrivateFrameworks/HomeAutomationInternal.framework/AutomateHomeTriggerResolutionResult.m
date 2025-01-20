@interface AutomateHomeTriggerResolutionResult
+ (id)unsupportedForReason:(int64_t)a3;
- (AutomateHomeTriggerResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation AutomateHomeTriggerResolutionResult

+ (id)unsupportedForReason:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = sub_22E6B953C(a3);

  return v4;
}

- (AutomateHomeTriggerResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  return (AutomateHomeTriggerResolutionResult *)sub_22E6B97C0(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(uint64_t))type metadata accessor for AutomateHomeTriggerResolutionResult);
}

@end