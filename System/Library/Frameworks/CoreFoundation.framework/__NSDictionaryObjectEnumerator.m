@interface __NSDictionaryObjectEnumerator
- (id)nextObject;
@end

@implementation __NSDictionaryObjectEnumerator

- (id)nextObject
{
  uint64_t v5 = *(void *)off_1ECE0A5B0;
  v4.receiver = self;
  v4.super_class = (Class)__NSDictionaryObjectEnumerator;
  id result = [(__NSFastEnumerationEnumerator *)&v4 nextObject];
  if (result) {
    return (id)[self->super._origObj objectForKey:result];
  }
  return result;
}

@end