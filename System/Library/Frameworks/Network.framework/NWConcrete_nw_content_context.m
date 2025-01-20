@interface NWConcrete_nw_content_context
- (NSString)description;
- (id).cxx_construct;
- (void)dealloc;
@end

@implementation NWConcrete_nw_content_context

- (id).cxx_construct
{
  *((_DWORD *)self + 28) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 13, 0);
  objc_storeStrong((id *)self + 12, 0);
  objc_storeStrong((id *)self + 11, 0);

  objc_storeStrong((id *)self + 7, 0);
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)NWConcrete_nw_content_context;
  [(NWConcrete_nw_content_context *)&v2 dealloc];
}

- (NSString)description
{
  objc_super v2 = (__CFString *)CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"<nw_content_context %s priority %f expiration %llu>", (char *)self + 24, *((void *)self + 10), *((void *)self + 8));

  return (NSString *)v2;
}

@end