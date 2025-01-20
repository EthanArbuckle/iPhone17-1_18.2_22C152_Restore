@interface VSErrorRecoveryAttempterDelegate
+ (id)sharedDelegate;
- (void)didPresentErrorWithRecovery:(BOOL)a3 contextInfo:(void *)a4;
@end

@implementation VSErrorRecoveryAttempterDelegate

+ (id)sharedDelegate
{
  if (sharedDelegate___vs_lazy_init_predicate != -1) {
    dispatch_once(&sharedDelegate___vs_lazy_init_predicate, &__block_literal_global_40);
  }
  v2 = (void *)sharedDelegate___vs_lazy_init_variable;

  return v2;
}

uint64_t __50__VSErrorRecoveryAttempterDelegate_sharedDelegate__block_invoke()
{
  sharedDelegate___vs_lazy_init_variable = objc_alloc_init(VSErrorRecoveryAttempterDelegate);

  return MEMORY[0x1F41817F8]();
}

- (void)didPresentErrorWithRecovery:(BOOL)a3 contextInfo:(void *)a4
{
  if (a4)
  {
    v5 = a4;
    self = (VSErrorRecoveryAttempterDelegate *)(*((uint64_t (**)(void *, BOOL))a4 + 2))(a4, a3);
    a4 = v5;
    uint64_t v4 = vars8;
  }
  MEMORY[0x1F4181870](self, a2, a3, a4);
}

@end