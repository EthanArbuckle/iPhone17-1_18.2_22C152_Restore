@interface Int:
- (void)Any;
- (void)Int;
@end

@implementation Int:

- (void)Any
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

- (void)Int
{
  if (!*a2)
  {
    unint64_t v3 = type metadata accessor for Dictionary();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

@end