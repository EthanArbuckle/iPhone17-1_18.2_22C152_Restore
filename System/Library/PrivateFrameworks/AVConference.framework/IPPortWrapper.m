@interface IPPortWrapper
- (IPPortWrapper)init;
- (tagIPPORT)ipport;
- (void)dealloc;
- (void)setIpport:(tagIPPORT *)a3;
@end

@implementation IPPortWrapper

- (IPPortWrapper)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)IPPortWrapper;
  v2 = [(IPPortWrapper *)&v5 init];
  if (v2)
  {
    v3 = (tagIPPORT *)malloc_type_calloc(1uLL, 0x28uLL, 0x100004053E81896uLL);
    v2->_ipport = v3;
    if (!v3) {
      return 0;
    }
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  free(self->_ipport);
  v3.receiver = self;
  v3.super_class = (Class)IPPortWrapper;
  [(IPPortWrapper *)&v3 dealloc];
}

- (tagIPPORT)ipport
{
  return self->_ipport;
}

- (void)setIpport:(tagIPPORT *)a3
{
  self->_ipport = a3;
}

@end