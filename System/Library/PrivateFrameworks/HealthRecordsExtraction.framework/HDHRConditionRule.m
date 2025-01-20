@interface HDHRConditionRule
- (BOOL)evaluateWith:(id)a3;
- (HDHRConditionRule)init;
- (HDHRConditionRule)initWithDefinition:(id)a3 error:(id *)a4;
@end

@implementation HDHRConditionRule

- (HDHRConditionRule)initWithDefinition:(id)a3 error:(id *)a4
{
  unint64_t v4 = sub_23309B710();
  return (HDHRConditionRule *)ConditionRule.init(definition:)(v4, v5);
}

- (BOOL)evaluateWith:(id)a3
{
  id v4 = a3;
  unint64_t v5 = self;
  LOBYTE(self) = sub_232F38178(v4);

  return self & 1;
}

- (HDHRConditionRule)init
{
  result = (HDHRConditionRule *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end