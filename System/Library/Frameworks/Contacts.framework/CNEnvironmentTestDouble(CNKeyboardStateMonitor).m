@interface CNEnvironmentTestDouble(CNKeyboardStateMonitor)
- (uint64_t)setKeyboardStateMonitor:()CNKeyboardStateMonitor;
@end

@implementation CNEnvironmentTestDouble(CNKeyboardStateMonitor)

- (uint64_t)setKeyboardStateMonitor:()CNKeyboardStateMonitor
{
  return [a1 setValue:a3 forKey:@"keyboard-state-monitor"];
}

@end