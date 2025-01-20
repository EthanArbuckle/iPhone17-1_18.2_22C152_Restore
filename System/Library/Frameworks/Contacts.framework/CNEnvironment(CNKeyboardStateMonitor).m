@interface CNEnvironment(CNKeyboardStateMonitor)
- (uint64_t)keyboardStateMonitor;
@end

@implementation CNEnvironment(CNKeyboardStateMonitor)

- (uint64_t)keyboardStateMonitor
{
  return [a1 valueForKey:@"keyboard-state-monitor" onCacheMiss:&__block_literal_global_21];
}

@end