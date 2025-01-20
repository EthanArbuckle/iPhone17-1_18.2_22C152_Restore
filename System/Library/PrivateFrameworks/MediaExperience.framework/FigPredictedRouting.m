@interface FigPredictedRouting
@end

@implementation FigPredictedRouting

uint64_t __FigPredictedRouting_StartPreemptivePortChangedTimer_block_invoke()
{
  return FigPredictedRouting_StopPreemptivePortChangedTimer(1);
}

@end