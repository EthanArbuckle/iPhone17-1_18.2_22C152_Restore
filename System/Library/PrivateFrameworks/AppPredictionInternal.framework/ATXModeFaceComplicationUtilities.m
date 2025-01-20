@interface ATXModeFaceComplicationUtilities
+ (double)complicationScoreForAppLaunch:(id)a3 environment:(id)a4;
@end

@implementation ATXModeFaceComplicationUtilities

+ (double)complicationScoreForAppLaunch:(id)a3 environment:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    v7 = [v6 appLaunchCounts];
    v8 = [v7 objectForKeyedSubscript:v5];

    if ([v8 rawLaunchCount])
    {
      double v9 = (100.0 - (double)(unint64_t)[v8 rawLaunchCount]) / 100.0;
      if (v9 < 0.0) {
        double v9 = 0.0;
      }
      if (v9 >= 1.0) {
        double v10 = 0.0;
      }
      else {
        double v10 = 1.0 - v9;
      }
    }
    else
    {
      double v10 = 0.0;
    }
  }
  else
  {
    double v10 = 0.0;
  }

  return v10;
}

@end