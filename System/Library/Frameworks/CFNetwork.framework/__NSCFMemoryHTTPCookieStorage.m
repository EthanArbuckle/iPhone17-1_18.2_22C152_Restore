@interface __NSCFMemoryHTTPCookieStorage
- (__NSCFMemoryHTTPCookieStorage)init;
- (id)description;
@end

@implementation __NSCFMemoryHTTPCookieStorage

- (__NSCFMemoryHTTPCookieStorage)init
{
  v3 = _CookieStorageCreateInMemory((const __CFAllocator *)*MEMORY[0x1E4F1CF80], (OpaqueCFHTTPCookieStorage *)a2);
  v6.receiver = self;
  v6.super_class = (Class)__NSCFMemoryHTTPCookieStorage;
  v4 = [(NSHTTPCookieStorage *)&v6 _initWithCFHTTPCookieStorage:v3];
  if (v3) {
    CFRelease(v3);
  }
  return v4;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)__NSCFMemoryHTTPCookieStorage;
  return (id)[NSString stringWithFormat:@"Ephemeral %@", -[NSHTTPCookieStorage description](&v3, sel_description)];
}

@end