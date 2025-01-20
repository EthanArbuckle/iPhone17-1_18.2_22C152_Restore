@interface CSLPRFAppSwitcherEditing
+ (void)logAppSwitcherEditingAction:(unint64_t)a3 fromSource:(unint64_t)a4;
@end

@implementation CSLPRFAppSwitcherEditing

+ (void)logAppSwitcherEditingAction:(unint64_t)a3 fromSource:(unint64_t)a4
{
  v12[2] = *MEMORY[0x263EF8340];
  v4 = @"gizmoSettings";
  if (!a4) {
    v4 = @"gizmoSwitcher";
  }
  if (a4 == 2) {
    v5 = @"companionSettings";
  }
  else {
    v5 = v4;
  }
  v11[0] = @"source";
  v11[1] = @"action";
  v6 = @"remove";
  if (a3 == 1) {
    v6 = @"add";
  }
  if (a3 == 2) {
    v6 = @"reorder";
  }
  v12[0] = v5;
  v12[1] = v6;
  v7 = NSDictionary;
  v8 = v6;
  v9 = v5;
  v10 = [v7 dictionaryWithObjects:v12 forKeys:v11 count:2];

  AnalyticsSendEvent();
}

@end