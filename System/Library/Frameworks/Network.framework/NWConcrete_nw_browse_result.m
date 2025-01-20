@interface NWConcrete_nw_browse_result
- (NSString)description;
- (id).cxx_construct;
- (id)redactedDescription;
- (void)dealloc;
@end

@implementation NWConcrete_nw_browse_result

- (id).cxx_construct
{
  *((_DWORD *)self + 12) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 3, 0);
  objc_storeStrong((id *)self + 2, 0);

  objc_storeStrong((id *)self + 1, 0);
}

- (id)redactedDescription
{
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  description = nw_browse_result_get_description(self, 1);
  v4 = (__CFString *)CFStringCreateWithCString(v2, description, 0x8000100u);

  return v4;
}

- (NSString)description
{
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  description = nw_browse_result_get_description(self, 0);
  v4 = (__CFString *)CFStringCreateWithCString(v2, description, 0x8000100u);

  return (NSString *)v4;
}

- (void)dealloc
{
  v3 = (void *)*((void *)self + 4);
  if (v3)
  {
    free(v3);
    *((void *)self + 4) = 0;
  }
  v4 = (void *)*((void *)self + 5);
  if (v4)
  {
    free(v4);
    *((void *)self + 5) = 0;
  }
  v5 = (void *)*((void *)self + 3);
  *((void *)self + 3) = 0;

  v6 = (void *)*((void *)self + 2);
  *((void *)self + 2) = 0;

  v7.receiver = self;
  v7.super_class = (Class)NWConcrete_nw_browse_result;
  [(NWConcrete_nw_browse_result *)&v7 dealloc];
}

@end