@interface CNMeCardSharingSettingsEditingStateMachine
+ (int64_t)stateAfterPerformingAction:(int64_t)a3 onState:(int64_t)a4;
+ (int64_t)stateAfterRevertingAction:(int64_t)a3 onState:(int64_t)a4;
@end

@implementation CNMeCardSharingSettingsEditingStateMachine

+ (int64_t)stateAfterRevertingAction:(int64_t)a3 onState:(int64_t)a4
{
  int64_t v4 = 1;
  if (a3)
  {
    unsigned int v5 = 0;
  }
  else
  {
    int64_t v4 = 2;
    unsigned int v5 = 1;
  }
  int64_t v6 = 2 * v5;
  BOOL v7 = a3 != 0;
  if (a4 != 1) {
    BOOL v7 = 0;
  }
  if (a4 != 2) {
    int64_t v6 = v7;
  }
  if (a4 == 3) {
    return v4;
  }
  else {
    return v6;
  }
}

+ (int64_t)stateAfterPerformingAction:(int64_t)a3 onState:(int64_t)a4
{
  int64_t v4 = 3;
  int64_t v5 = 2;
  if (!a3) {
    int64_t v5 = 3;
  }
  uint64_t v6 = 3;
  if (!a3) {
    uint64_t v6 = 1;
  }
  uint64_t v7 = 1;
  if (a3) {
    uint64_t v7 = 2;
  }
  if (!a4) {
    int64_t v4 = v7;
  }
  if (a4 == 1) {
    int64_t v4 = v6;
  }
  if (a4 == 2) {
    return v5;
  }
  else {
    return v4;
  }
}

@end