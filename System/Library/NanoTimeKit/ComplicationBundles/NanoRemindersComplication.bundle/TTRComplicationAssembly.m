@interface TTRComplicationAssembly
+ (id)_makeModelSource:(BOOL)a3;
+ (id)assembleModuleForComplicationFamily:(int64_t)a3 isRunningInClockFace:(BOOL)a4;
@end

@implementation TTRComplicationAssembly

+ (id)assembleModuleForComplicationFamily:(int64_t)a3 isRunningInClockFace:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = [TTRComplicationPresenter alloc];
  v8 = [a1 _makeModelSource:v4];
  v9 = objc_alloc_init(_TtC25NanoRemindersComplication21TTRComplicationRouter);
  v10 = [(TTRComplicationPresenter *)v7 initWithModelSource:v8 router:v9 complicationFamily:a3];

  return v10;
}

+ (id)_makeModelSource:(BOOL)a3
{
  v3 = objc_alloc_init(_TtC25NanoRemindersComplication43TTRIComplicationSwitcherTimelineModelSource);

  return v3;
}

@end