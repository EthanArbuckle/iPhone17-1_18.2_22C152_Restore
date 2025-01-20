@interface ATXPlugInManager
+ (void)setPlugInName:(id)a3 isEnabled:(BOOL)a4;
- (_TtC21AppPredictionInternal16ATXPlugInManager)init;
@end

@implementation ATXPlugInManager

+ (void)setPlugInName:(id)a3 isEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = sub_1D13F2688();
  _s21AppPredictionInternal16ATXPlugInManagerC07setPlugE04name9isEnabledySS_SbtFZ_0(v5, v6, v4);
  swift_bridgeObjectRelease();
}

- (_TtC21AppPredictionInternal16ATXPlugInManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(ATXPlugInManager *)&v3 init];
}

@end