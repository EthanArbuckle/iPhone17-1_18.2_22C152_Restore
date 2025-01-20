@interface IPv6PrefixWrapper
- (IPv6PrefixWrapper)initWithPrefix:(id *)a3;
- (const)ipv6Prefix;
- (void)dealloc;
@end

@implementation IPv6PrefixWrapper

- (IPv6PrefixWrapper)initWithPrefix:(id *)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)IPv6PrefixWrapper;
  v4 = [(IPv6PrefixWrapper *)&v7 init];
  if (v4)
  {
    v5 = ($B0CAF2F970A52CDCEAEBD8ED9A40FEA0 *)malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
    v4->_ipv6Prefix = v5;
    if (v5)
    {
      $B0CAF2F970A52CDCEAEBD8ED9A40FEA0 *v5 = *a3;
      return v4;
    }

    return 0;
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  free(self->_ipv6Prefix);
  v3.receiver = self;
  v3.super_class = (Class)IPv6PrefixWrapper;
  [(IPv6PrefixWrapper *)&v3 dealloc];
}

- (const)ipv6Prefix
{
  return self->_ipv6Prefix;
}

@end