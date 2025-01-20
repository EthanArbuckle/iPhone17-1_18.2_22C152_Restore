@interface BRKSignificantTimeChangeNotifier
@end

@implementation BRKSignificantTimeChangeNotifier

uint64_t __51___BRKSignificantTimeChangeNotifier_sharedInstance__block_invoke()
{
  sharedInstance_Notifier = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

@end