@interface ControlHomeFiltersResolutionResult
+ (id)unsupportedForReason:(int64_t)a3;
- (ControlHomeFiltersResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4;
@end

@implementation ControlHomeFiltersResolutionResult

+ (id)unsupportedForReason:(int64_t)a3
{
  swift_getObjCClassMetadata();
  id v4 = sub_22E6B953C(a3);

  return v4;
}

- (ControlHomeFiltersResolutionResult)initWithJSONDictionary:(id)a3 forIntent:(id)a4
{
  return (ControlHomeFiltersResolutionResult *)sub_22E6BD524(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(uint64_t))type metadata accessor for ControlHomeFiltersResolutionResult);
}

@end