@interface HKActivityGoalSchedule
+ (id)scheduleFrom:(id)a3 goalType:(int64_t)a4;
- (id)goalQuantityForToday;
@end

@implementation HKActivityGoalSchedule

+ (id)scheduleFrom:(id)a3 goalType:(int64_t)a4
{
  type metadata accessor for GoalDay();
  unint64_t v5 = sub_25410();
  v6 = sub_18A50(v5, a4);
  swift_bridgeObjectRelease();

  return v6;
}

- (id)goalQuantityForToday
{
  v2 = self;
  id v3 = sub_186B8();

  return v3;
}

@end