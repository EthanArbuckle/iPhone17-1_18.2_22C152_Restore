@interface NSFileHandle(IsOpenFor)
- (uint64_t)isOpenForUpdating;
@end

@implementation NSFileHandle(IsOpenFor)

- (uint64_t)isOpenForUpdating
{
  return (fcntl([a1 fileDescriptor], 3) >> 1) & 1;
}

@end