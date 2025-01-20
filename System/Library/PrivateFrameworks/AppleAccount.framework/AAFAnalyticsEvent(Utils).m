@interface AAFAnalyticsEvent(Utils)
- (void)updateTaskResultWithError:()Utils;
@end

@implementation AAFAnalyticsEvent(Utils)

- (void)updateTaskResultWithError:()Utils
{
  v4 = NSNumber;
  BOOL v5 = a3 == 0;
  id v7 = a3;
  v6 = [v4 numberWithInt:v5];
  [a1 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F47028]];

  [a1 populateUnderlyingErrorsStartingWithRootError:v7];
}

@end