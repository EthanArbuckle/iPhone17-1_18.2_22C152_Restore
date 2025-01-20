@interface CHASAdvancedGoalViewFactory
+ (id)makeViewWithGoalSchedule:(id)a3 goalDaysModel:(id)a4 wheelchairUser:(BOOL)a5 goalType:(int64_t)a6 formattingManager:(id)a7 showFooter:(BOOL)a8;
- (CHASAdvancedGoalViewFactory)init;
@end

@implementation CHASAdvancedGoalViewFactory

+ (id)makeViewWithGoalSchedule:(id)a3 goalDaysModel:(id)a4 wheelchairUser:(BOOL)a5 goalType:(int64_t)a6 formattingManager:(id)a7 showFooter:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v11 = a5;
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  v16 = (void *)sub_17ED4(v14, v11, a6, (uint64_t)v15, v8);

  return v16;
}

- (CHASAdvancedGoalViewFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AdvancedGoalViewFactory();
  return [(CHASAdvancedGoalViewFactory *)&v3 init];
}

@end