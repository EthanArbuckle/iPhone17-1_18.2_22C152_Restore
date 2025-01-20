@interface NSData
- (id)initWithCPPData:(void *)a1 copy:(const void *)a2;
- (void)cppData;
@end

@implementation NSData

- (void)cppData
{
  v2 = result;
  if (a2)
  {
    id v3 = a2;
    v4 = (void *)[v3 bytes];
    size_t v5 = [v3 length];
    return std::string::basic_string[abi:ne180100](v2, v4, v5);
  }
  else
  {
    *result = 0;
    result[1] = 0;
    result[2] = 0;
  }
  return result;
}

- (id)initWithCPPData:(void *)a1 copy:(const void *)a2
{
  id v2 = a1;
  if (a1)
  {
    if (*((char *)a2 + 23) >= 0) {
      size_t v4 = *((unsigned __int8 *)a2 + 23);
    }
    else {
      size_t v4 = (size_t)a2[1];
    }
    std::vector<unsigned char>::vector(&__dst, v4);
    int v5 = *((char *)a2 + 23);
    if (v5 >= 0) {
      size_t v6 = *((unsigned __int8 *)a2 + 23);
    }
    else {
      size_t v6 = (size_t)a2[1];
    }
    if (v6)
    {
      if (v5 >= 0) {
        v7 = a2;
      }
      else {
        v7 = *a2;
      }
      memmove(__dst, v7, v6);
      LOBYTE(v5) = *((unsigned char *)a2 + 23);
    }
    if ((v5 & 0x80u) == 0) {
      v8 = a2;
    }
    else {
      v8 = *a2;
    }
    id v2 = (id)[v2 initWithBytes:v8 length:v11 - (unsigned char *)__dst];
    if (__dst)
    {
      v11 = __dst;
      operator delete(__dst);
    }
  }
  return v2;
}

@end