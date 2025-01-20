@interface _LAMKBLog
+ (id)log;
@end

@implementation _LAMKBLog

+ (id)log
{
  if (log_onceToken != -1) {
    dispatch_once(&log_onceToken, &__block_literal_global_10);
  }
  v2 = (void *)log_log;

  return v2;
}

@end