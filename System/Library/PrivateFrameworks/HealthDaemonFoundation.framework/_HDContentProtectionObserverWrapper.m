@interface _HDContentProtectionObserverWrapper
- (_HDContentProtectionObserverWrapper)init;
@end

@implementation _HDContentProtectionObserverWrapper

- (_HDContentProtectionObserverWrapper)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_observer);
}

@end