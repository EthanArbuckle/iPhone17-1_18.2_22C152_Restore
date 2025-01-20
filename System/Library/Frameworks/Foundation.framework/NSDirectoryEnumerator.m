@interface NSDirectoryEnumerator
- (BOOL)isEnumeratingDirectoryPostOrder;
- (NSDictionary)directoryAttributes;
- (NSDictionary)fileAttributes;
- (NSUInteger)level;
- (id)nextObject;
- (void)skipDescendants;
- (void)skipDescendents;
@end

@implementation NSDirectoryEnumerator

- (id)nextObject
{
  v4 = NSClassFromString((NSString *)@"NSDirectoryEnumerator");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSDictionary)fileAttributes
{
  v4 = NSClassFromString((NSString *)@"NSDirectoryEnumerator");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSDictionary)directoryAttributes
{
  v4 = NSClassFromString((NSString *)@"NSDirectoryEnumerator");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSUInteger)level
{
  v4 = NSClassFromString((NSString *)@"NSDirectoryEnumerator");
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)skipDescendents
{
  v4 = NSClassFromString((NSString *)@"NSDirectoryEnumerator");

  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)skipDescendants
{
  v4 = NSClassFromString((NSString *)@"NSDirectoryEnumerator");

  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (BOOL)isEnumeratingDirectoryPostOrder
{
  return 0;
}

@end