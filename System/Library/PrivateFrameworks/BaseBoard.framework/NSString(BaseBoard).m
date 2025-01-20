@interface NSString(BaseBoard)
+ (id)bs_stringWithUTF8String:()BaseBoard;
- (uint64_t)_initWithUTF8String:()BaseBoard maxLength:;
@end

@implementation NSString(BaseBoard)

+ (id)bs_stringWithUTF8String:()BaseBoard
{
  if (__s)
  {
    size_t v5 = strlen(__s);
    int is_memory_immutable = _dyld_is_memory_immutable();
    id v7 = [NSString alloc];
    if (is_memory_immutable) {
      v8 = (void *)[v7 initWithBytesNoCopy:__s length:v5 encoding:4 freeWhenDone:0];
    }
    else {
      v8 = (void *)[v7 initWithBytes:__s length:v5 encoding:4];
    }
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (uint64_t)_initWithUTF8String:()BaseBoard maxLength:
{
  id v7 = memchr(__s, 0, __n);
  if (v7) {
    size_t v8 = v7 - (unsigned char *)__s;
  }
  else {
    size_t v8 = __n;
  }
  return [a1 initWithBytes:__s length:v8 encoding:4];
}

@end