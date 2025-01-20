@interface NSOwnedDictionaryProxy
- (NSOwnedDictionaryProxy)initWithOwner:(id)a3;
- (NSOwnedDictionaryProxy)retain;
- (id)keyEnumerator;
- (id)objectForKey:(id)a3;
- (unint64_t)count;
- (void)release;
- (void)superRelease;
@end

@implementation NSOwnedDictionaryProxy

- (unint64_t)count
{
  return [self->_owner ownedDictionaryCount];
}

- (void)release
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSOwnedDictionaryProxy;
  [(NSOwnedDictionaryProxy *)&v3 release];
}

- (NSOwnedDictionaryProxy)retain
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = self->_owner;
  v5.receiver = self;
  v5.super_class = (Class)NSOwnedDictionaryProxy;
  return [(NSOwnedDictionaryProxy *)&v5 retain];
}

- (NSOwnedDictionaryProxy)initWithOwner:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)NSOwnedDictionaryProxy;
  result = [(NSOwnedDictionaryProxy *)&v5 init];
  if (result) {
    result->_owner = a3;
  }
  return result;
}

- (void)superRelease
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2.receiver = self;
  v2.super_class = (Class)NSOwnedDictionaryProxy;
  [(NSOwnedDictionaryProxy *)&v2 release];
}

- (id)keyEnumerator
{
  return (id)[self->_owner ownedDictionaryKeyEnumerator];
}

- (id)objectForKey:(id)a3
{
  return (id)[self->_owner ownedDictionaryObjectForKey:a3];
}

@end