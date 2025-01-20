@interface IORegistryIterator
- (BOOL)enterEntry;
- (BOOL)exitEntry;
@end

@implementation IORegistryIterator

- (BOOL)enterEntry
{
  return MEMORY[0x223C6B5B0]([(IOKObject *)self object]) == 0;
}

- (BOOL)exitEntry
{
  return MEMORY[0x223C6B5C0]([(IOKObject *)self object]) == 0;
}

@end