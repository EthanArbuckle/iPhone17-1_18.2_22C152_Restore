@interface NSData(NSDataUtils)
- (MFMutableData)mf_dataByConvertingUnixNewlinesToNetwork;
- (id)mf_locationsOfUnixNewlinesNeedingConversion;
- (uint64_t)mf_rangeOfCString:()NSDataUtils;
- (uint64_t)mf_rangeOfCString:()NSDataUtils options:;
- (uint64_t)mf_rangeOfCString:()NSDataUtils options:range:;
- (uint64_t)mf_rangeOfData:()NSDataUtils options:range:;
- (uint64_t)mf_rangeOfRFC822HeaderData;
- (uint64_t)mf_subdataFromIndex:()NSDataUtils;
- (uint64_t)mf_subdataToIndex:()NSDataUtils;
@end

@implementation NSData(NSDataUtils)

- (uint64_t)mf_rangeOfCString:()NSDataUtils options:range:
{
  size_t v11 = strlen(__s);
  return _rangeOfBytes(a1, __s, v11, a4, a5, a6);
}

- (uint64_t)mf_rangeOfData:()NSDataUtils options:range:
{
  id v10 = a3;
  uint64_t v11 = _rangeOfBytes(a1, (char *)[v10 bytes], objc_msgSend(v10, "length"), a4, a5, a6);

  return v11;
}

- (uint64_t)mf_rangeOfRFC822HeaderData
{
  return 0;
}

- (MFMutableData)mf_dataByConvertingUnixNewlinesToNetwork
{
  v2 = [(NSData *)a1 mf_locationsOfUnixNewlinesNeedingConversion];
  if ([v2 count])
  {
    v3 = -[MFMutableData initWithCapacity:]([MFMutableData alloc], "initWithCapacity:", [v2 count] + -[MFMutableData length](a1, "length"));
    uint64_t v4 = [v2 firstIndex];
    v5 = a1;
    v6 = [(MFMutableData *)v5 bytes];
    v7 = v3;
    v8 = [(MFMutableData *)v7 mutableBytes];
    uint64_t v9 = 0;
    do
    {
      uint64_t v10 = v9;
      uint64_t v9 = v4;
      uint64_t v11 = v4 - v10;
      memmove(v8, v6, v4 - v10);
      v12 = &v8[v11];
      char *v12 = 13;
      uint64_t v4 = [v2 indexGreaterThanIndex:v4];
      v8 = v12 + 1;
      v6 += v11;
    }
    while (v4 != 0x7FFFFFFFFFFFFFFFLL);
    memmove(v8, v6, [(MFMutableData *)v5 length] - v9);
    -[MFMutableData setLength:](v7, "setLength:", [v2 count] + -[MFMutableData length](v5, "length"));
  }
  else
  {
    v7 = 0;
  }
  if (v7) {
    v13 = v7;
  }
  else {
    v13 = a1;
  }
  v14 = v13;

  return v14;
}

- (id)mf_locationsOfUnixNewlinesNeedingConversion
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  id v3 = a1;
  uint64_t v4 = [v3 bytes];
  uint64_t v5 = [v3 length];
  if (v5 >= 1)
  {
    unint64_t v6 = v4 + v5;
    v7 = (char *)v4;
    do
    {
      v8 = (char *)memchr(v7, 10, v6 - (void)v7);
      if (!v8) {
        break;
      }
      uint64_t v9 = v8;
      if (v7 >= v8 || *(v8 - 1) != 13) {
        [v2 addIndex:&v8[-v4]];
      }
      v7 = v9 + 1;
    }
    while ((unint64_t)(v9 + 1) < v6);
  }
  return v2;
}

- (uint64_t)mf_subdataToIndex:()NSDataUtils
{
  return objc_msgSend(a1, "mf_subdataWithRange:", 0, a3);
}

- (uint64_t)mf_subdataFromIndex:()NSDataUtils
{
  uint64_t v5 = [a1 length] - a3;
  return objc_msgSend(a1, "mf_subdataWithRange:", a3, v5);
}

- (uint64_t)mf_rangeOfCString:()NSDataUtils
{
  size_t v5 = strlen(__s);
  size_t v6 = [a1 length];
  return _rangeOfBytes(a1, __s, v5, 0, 0, v6);
}

- (uint64_t)mf_rangeOfCString:()NSDataUtils options:
{
  size_t v7 = strlen(__s);
  size_t v8 = [a1 length];
  return _rangeOfBytes(a1, __s, v7, a4, 0, v8);
}

@end