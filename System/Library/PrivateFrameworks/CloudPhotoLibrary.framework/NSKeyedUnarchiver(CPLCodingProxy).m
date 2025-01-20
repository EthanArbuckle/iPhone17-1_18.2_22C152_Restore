@interface NSKeyedUnarchiver(CPLCodingProxy)
- (uint64_t)_cplDecodeBoolForKey:()CPLCodingProxy;
- (uint64_t)_cplDecodeCharForKey:()CPLCodingProxy;
@end

@implementation NSKeyedUnarchiver(CPLCodingProxy)

- (uint64_t)_cplDecodeCharForKey:()CPLCodingProxy
{
  id v4 = a3;
  v5 = [a1 error];

  if (v5)
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    uint64_t v6 = [a1 decodeIntForKey:v4];
    v7 = [a1 error];

    if (v7)
    {
      objc_msgSend(a1, "__setError:", 0);
      LOBYTE(v6) = [a1 decodeBoolForKey:v4];
    }
  }

  return (char)v6;
}

- (uint64_t)_cplDecodeBoolForKey:()CPLCodingProxy
{
  id v4 = a3;
  v5 = [a1 error];

  if (v5)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = [a1 decodeBoolForKey:v4];
    v7 = [a1 error];

    if (v7)
    {
      objc_msgSend(a1, "__setError:", 0);
      uint64_t v6 = [a1 decodeIntForKey:v4] != 0;
    }
  }

  return v6;
}

@end