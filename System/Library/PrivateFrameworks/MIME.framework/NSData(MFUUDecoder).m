@interface NSData(MFUUDecoder)
- (double)_uudecoded_small;
- (id)mf_decodeUuencoded;
- (size_t)_uudecoded_large;
- (uint64_t)_uudecoded_large;
- (uint64_t)_uudecoded_small;
- (void)_uudecoded_large;
- (void)_uudecoded_small;
@end

@implementation NSData(MFUUDecoder)

- (id)mf_decodeUuencoded
{
  if (!a1) {
    goto LABEL_5;
  }
  unint64_t v2 = vcvtpd_u64_f64((double)[(NSData *)a1 length] * 0.74 + 100.0);
  if (v2 <= 0x64) {
    unint64_t v2 = 100;
  }
  if (v2 > 0x20000)
  {
    v3 = -[NSData _uudecoded_large](a1);
  }
  else
  {
LABEL_5:
    v3 = -[NSData _uudecoded_small](a1);
  }
  return v3;
}

- (void)_uudecoded_small
{
}

- (uint64_t)_uudecoded_small
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (double)_uudecoded_small
{
  *(void *)&double result = OutputBuffer::write(*(void *)(a1 + 8), a2).n128_u64[0];
  return result;
}

- (void)_uudecoded_large
{
}

- (uint64_t)_uudecoded_large
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (size_t)_uudecoded_large
{
  uint64_t v2 = *(void *)(a1 + 8);
  size_t result = fwrite(__ptr, 0x2DuLL, 1uLL, *(FILE **)(v2 + 16));
  *(void *)(v2 + 24) += 45;
  return result;
}

@end