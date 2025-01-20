@interface _HDAssertionRecord
- (void)initWithAssertionIdentifier:(void *)a1;
@end

@implementation _HDAssertionRecord

- (void)initWithAssertionIdentifier:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)_HDAssertionRecord;
    a1 = objc_msgSendSuper2(&v9, sel_init);
    if (a1)
    {
      uint64_t v4 = [v3 copy];
      v5 = (void *)a1[1];
      a1[1] = v4;

      uint64_t v6 = [MEMORY[0x263F088B0] weakObjectsHashTable];
      v7 = (void *)a1[2];
      a1[2] = v6;
    }
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertions, 0);

  objc_storeStrong((id *)&self->_assertionIdentifier, 0);
}

@end