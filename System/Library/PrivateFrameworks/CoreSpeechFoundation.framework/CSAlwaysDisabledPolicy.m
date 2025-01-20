@interface CSAlwaysDisabledPolicy
- (CSAlwaysDisabledPolicy)init;
- (void)_addDisabledConditions;
@end

@implementation CSAlwaysDisabledPolicy

- (void)_addDisabledConditions
{
}

uint64_t __48__CSAlwaysDisabledPolicy__addDisabledConditions__block_invoke()
{
  return 0;
}

- (CSAlwaysDisabledPolicy)init
{
  v5.receiver = self;
  v5.super_class = (Class)CSAlwaysDisabledPolicy;
  v2 = [(CSPolicy *)&v5 init];
  v3 = v2;
  if (v2) {
    [(CSAlwaysDisabledPolicy *)v2 _addDisabledConditions];
  }
  return v3;
}

@end