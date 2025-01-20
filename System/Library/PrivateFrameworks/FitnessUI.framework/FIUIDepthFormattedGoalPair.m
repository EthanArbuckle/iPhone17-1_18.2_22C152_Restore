@interface FIUIDepthFormattedGoalPair
- (FIUIDepthFormattedGoalPair)init;
- (FIUIDepthFormattedGoalPair)initWithGoalString:(id)a3 goalValue:(id)a4;
- (NSString)goalString;
- (NSString)goalValue;
- (void)setGoalString:(id)a3;
- (void)setGoalValue:(id)a3;
@end

@implementation FIUIDepthFormattedGoalPair

- (NSString)goalString
{
  return (NSString *)sub_21E498504();
}

- (void)setGoalString:(id)a3
{
}

- (NSString)goalValue
{
  return (NSString *)sub_21E498504();
}

- (void)setGoalValue:(id)a3
{
}

- (FIUIDepthFormattedGoalPair)initWithGoalString:(id)a3 goalValue:(id)a4
{
  uint64_t v5 = sub_21E4D0AF0();
  uint64_t v7 = v6;
  uint64_t v8 = sub_21E4D0AF0();
  v9 = (uint64_t *)((char *)self + OBJC_IVAR___FIUIDepthFormattedGoalPair_goalString);
  uint64_t *v9 = v5;
  v9[1] = v7;
  v10 = (uint64_t *)((char *)self + OBJC_IVAR___FIUIDepthFormattedGoalPair_goalValue);
  uint64_t *v10 = v8;
  v10[1] = v11;
  v13.receiver = self;
  v13.super_class = (Class)FIUIDepthFormattedGoalPair;
  return [(FIUIDepthFormattedGoalPair *)&v13 init];
}

- (FIUIDepthFormattedGoalPair)init
{
  result = (FIUIDepthFormattedGoalPair *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end