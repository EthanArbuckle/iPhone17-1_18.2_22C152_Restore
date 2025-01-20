@interface _AppIntentsUserActivityHelper
+ (void)associateAppIntentWithUserActivity:(NSUserActivity *)a3 completionHandler:(id)a4;
- (_AppIntentsUserActivityHelper)init;
@end

@implementation _AppIntentsUserActivityHelper

+ (void)associateAppIntentWithUserActivity:(NSUserActivity *)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = a1;
  v8 = a3;

  sub_236569A04((uint64_t)&unk_2688628B8, (uint64_t)v7);
}

- (_AppIntentsUserActivityHelper)init
{
  return (_AppIntentsUserActivityHelper *)UserActivityHelper.init()();
}

@end