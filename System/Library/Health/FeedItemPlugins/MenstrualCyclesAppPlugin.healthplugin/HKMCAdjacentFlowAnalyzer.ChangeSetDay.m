@interface HKMCAdjacentFlowAnalyzer.ChangeSetDay
- (BOOL)hasConfirmedNoFlow;
- (BOOL)hasFlow;
- (BOOL)isFetched;
- (int64_t)dayIndex;
@end

@implementation HKMCAdjacentFlowAnalyzer.ChangeSetDay

- (int64_t)dayIndex
{
  swift_retain();
  int64_t v2 = sub_241631A88();
  swift_release();
  return v2;
}

- (BOOL)hasFlow
{
  return *((unsigned char *)&self->super.isa
         + OBJC_IVAR____TtCE24MenstrualCyclesAppPluginCSo24HKMCAdjacentFlowAnalyzer12ChangeSetDay_shouldShowMenstruationFlow);
}

- (BOOL)hasConfirmedNoFlow
{
  return objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtCE24MenstrualCyclesAppPluginCSo24HKMCAdjacentFlowAnalyzer12ChangeSetDay_cycleDay+ *(int *)(type metadata accessor for CycleDay() + 20)), sel_menstruationLevel) == (id)5;
}

- (BOOL)isFetched
{
  int64_t v2 = (char *)self + OBJC_IVAR____TtCE24MenstrualCyclesAppPluginCSo24HKMCAdjacentFlowAnalyzer12ChangeSetDay_cycleDay;
  v3 = *(void **)&v2[*(int *)(type metadata accessor for CycleDay() + 20)];

  return objc_msgSend(v3, sel_isFetched);
}

@end