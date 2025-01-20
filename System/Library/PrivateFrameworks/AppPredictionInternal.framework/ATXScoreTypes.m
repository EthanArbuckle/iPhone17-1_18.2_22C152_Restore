@interface ATXScoreTypes
@end

@implementation ATXScoreTypes

void __38___ATXScoreTypes_scoreInputForString___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)scoreInputForString__scoreInputMap;
  scoreInputForString__scoreInputMap = v0;

  for (uint64_t i = 0; i != 817; ++i)
  {
    v3 = [NSNumber numberWithUnsignedInteger:i];
    v4 = (void *)scoreInputForString__scoreInputMap;
    v5 = +[_ATXScoreTypes stringForScoreInput:i];
    [v4 setObject:v3 forKeyedSubscript:v5];
  }
}

@end