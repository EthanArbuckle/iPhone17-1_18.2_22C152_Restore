@interface __NSArray0
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectEnumerator;
- (unint64_t)count;
- (unint64_t)retainCount;
@end

@implementation __NSArray0

- (unint64_t)count
{
  return 0;
}

- (unint64_t)retainCount
{
  return -1;
}

- (id)objectEnumerator
{
  return &__NSEnumerator0__struct;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (id)objectAtIndex:(unint64_t)a3
{
  v8[1] = *(void *)off_1ECE0A5B0;
  uint64_t v4 = _os_log_pack_size();
  uint64_t v5 = _os_log_pack_fill();
  *(_DWORD *)uint64_t v5 = 136315394;
  *(void *)(v5 + 4) = "-[__NSArray0 objectAtIndex:]";
  *(_WORD *)(v5 + 12) = 2048;
  *(void *)(v5 + 14) = a3;
  CFStringRef v6 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: index %lu beyond bounds for empty array", "-[__NSArray0 objectAtIndex:]", a3);
  v7 = +[NSException exceptionWithName:@"NSRangeException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v6) userInfo:0 osLogPack:(char *)v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0) size:v4];
  objc_exception_throw(v7);
}

@end