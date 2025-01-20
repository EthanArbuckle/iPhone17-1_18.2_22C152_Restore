@interface Prefixes
@end

@implementation Prefixes

void ___Prefixes_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = (void *)_Prefixes_prefixes;
  _Prefixes_prefixes = (uint64_t)v0;

  for (uint64_t i = 0; i != 28; i += 2)
  {
    v3 = (&__PrefixDefinitions)[i + 1];
    v4 = [NSString stringWithUTF8String:(&__PrefixDefinitions)[i]];
    v5 = [NSNumber numberWithDouble:*(double *)&v3];
    [(id)_Prefixes_prefixes setObject:v5 forKeyedSubscript:v4];
  }
}

@end