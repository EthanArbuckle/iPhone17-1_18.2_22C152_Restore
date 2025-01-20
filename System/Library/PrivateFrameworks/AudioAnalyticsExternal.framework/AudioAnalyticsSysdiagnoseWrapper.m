@interface AudioAnalyticsSysdiagnoseWrapper
+ (BOOL)isInProgressWithDestination:(BOOL *)a3 error:(id *)a4;
@end

@implementation AudioAnalyticsSysdiagnoseWrapper

+ (BOOL)isInProgressWithDestination:(BOOL *)a3 error:(id *)a4
{
  *a3 = [MEMORY[0x263F8C7E8] isSysdiagnoseInProgressWithError:a4];
  return 1;
}

@end