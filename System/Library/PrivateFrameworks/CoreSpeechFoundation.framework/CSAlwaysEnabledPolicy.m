@interface CSAlwaysEnabledPolicy
- (CSAlwaysEnabledPolicy)init;
- (void)_addAlwaysEnabledCondition;
@end

@implementation CSAlwaysEnabledPolicy

- (void)_addAlwaysEnabledCondition
{
}

uint64_t __51__CSAlwaysEnabledPolicy__addAlwaysEnabledCondition__block_invoke()
{
  return 1;
}

- (CSAlwaysEnabledPolicy)init
{
  v5.receiver = self;
  v5.super_class = (Class)CSAlwaysEnabledPolicy;
  v2 = [(CSPolicy *)&v5 init];
  v3 = v2;
  if (v2) {
    [(CSAlwaysEnabledPolicy *)v2 _addAlwaysEnabledCondition];
  }
  return v3;
}

@end