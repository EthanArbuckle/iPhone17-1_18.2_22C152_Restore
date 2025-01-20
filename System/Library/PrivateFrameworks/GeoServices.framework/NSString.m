@interface NSString
+ (id)stringWithStdString:(uint64_t)a1 copy:(uint64_t *)a2;
- (id)_geo_stringByAppendingOptionalPathComponent:(void *)a1;
- (void)stdString;
@end

@implementation NSString

- (id)_geo_stringByAppendingOptionalPathComponent:(void *)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    if ([v3 length])
    {
      id v5 = [a1 stringByAppendingPathComponent:v4];
    }
    else
    {
      id v5 = a1;
    }
    a1 = v5;
  }

  return a1;
}

+ (id)stringWithStdString:(uint64_t)a1 copy:(uint64_t *)a2
{
  self;
  id v3 = [NSString alloc];
  if (v3)
  {
    int v4 = *((char *)a2 + 23);
    if (v4 >= 0) {
      id v5 = a2;
    }
    else {
      id v5 = (uint64_t *)*a2;
    }
    if (v4 >= 0) {
      uint64_t v6 = *((unsigned __int8 *)a2 + 23);
    }
    else {
      uint64_t v6 = a2[1];
    }
    id v3 = (id)[v3 initWithBytes:v5 length:v6 encoding:4];
  }

  return v3;
}

- (void)stdString
{
  v2 = result;
  if (a2)
  {
    id v3 = a2;
    int v4 = (void *)[v3 UTF8String];
    size_t v5 = [v3 lengthOfBytesUsingEncoding:4];
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

@end