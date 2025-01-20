@interface EspressoMetalSingleton
+ (id)shared;
- (int)is_memory_tight;
- (void)setIs_memory_tight:(int)a3;
@end

@implementation EspressoMetalSingleton

- (void)setIs_memory_tight:(int)a3
{
  self->_is_memory_tight = a3;
}

- (int)is_memory_tight
{
  return self->_is_memory_tight;
}

+ (id)shared
{
  if (onceToken != -1) {
    dispatch_once(&onceToken, &__block_literal_global_11772);
  }
  v2 = (void *)singleton;

  return v2;
}

uint64_t __32__EspressoMetalSingleton_shared__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = singleton;
  singleton = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end