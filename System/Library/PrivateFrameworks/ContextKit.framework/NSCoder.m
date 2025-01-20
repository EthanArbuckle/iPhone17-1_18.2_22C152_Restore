@interface NSCoder
- (void)decodeUInt32ForKey:(void *)a1;
- (void)decodeUInt64ForKey:(void *)a1;
- (void)decodeUIntegerForKey:(void *)a1;
- (void)encodeUInt32:(uint64_t)a3 forKey:;
- (void)encodeUInt64:(uint64_t)a3 forKey:;
- (void)encodeUInteger:(uint64_t)a3 forKey:;
@end

@implementation NSCoder

- (void)encodeUInteger:(uint64_t)a3 forKey:
{
  if (a1) {
    return (void *)[a1 encodeInteger:a2 forKey:a3];
  }
  return a1;
}

- (void)encodeUInt32:(uint64_t)a3 forKey:
{
  if (a1) {
    return (void *)[a1 encodeInt32:a2 forKey:a3];
  }
  return a1;
}

- (void)decodeUIntegerForKey:(void *)a1
{
  if (a1) {
    return (void *)[a1 decodeIntegerForKey:a2];
  }
  return a1;
}

- (void)decodeUInt32ForKey:(void *)a1
{
  if (a1) {
    return (void *)[a1 decodeInt32ForKey:a2];
  }
  return a1;
}

- (void)decodeUInt64ForKey:(void *)a1
{
  if (a1) {
    return (void *)[a1 decodeInt64ForKey:a2];
  }
  return a1;
}

- (void)encodeUInt64:(uint64_t)a3 forKey:
{
  if (a1) {
    return (void *)[a1 encodeInt64:a2 forKey:a3];
  }
  return a1;
}

@end