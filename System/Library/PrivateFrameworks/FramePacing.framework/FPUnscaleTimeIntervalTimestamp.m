@interface FPUnscaleTimeIntervalTimestamp
@end

@implementation FPUnscaleTimeIntervalTimestamp

void ___FPUnscaleTimeIntervalTimestamp_block_invoke()
{
  if (_initTimebase_onceToken != -1) {
    dispatch_once(&_initTimebase_onceToken, &__block_literal_global_2);
  }
}

@end