@interface KmlCancelMessage
- (id)asData;
- (id)initWithCCCErrorCode:(id)result;
@end

@implementation KmlCancelMessage

- (id)initWithCCCErrorCode:(id)result
{
  if (result)
  {
    v5.receiver = result;
    v5.super_class = (Class)KmlCancelMessage;
    result = objc_msgSendSuper2(&v5, sel_init);
    if (result)
    {
      uint64_t v3 = 0;
      *((unsigned char *)result + 8) = a2;
      while (LOBYTE(KmlCCCErrorConversionMap[v3 + 1]) != a2)
      {
        v3 += 2;
        if (v3 == 8)
        {
          int v4 = 105;
          goto LABEL_8;
        }
      }
      int v4 = KmlCCCErrorConversionMap[v3];
LABEL_8:
      *((_DWORD *)result + 3) = v4;
    }
  }
  return result;
}

- (id)asData
{
  if (a1)
  {
    v1 = +[KmlTlv TLVWithTag:unsignedChar:]((uint64_t)KmlTlv, 109, *(unsigned char *)(a1 + 8));
    v2 = -[KmlTlv asData]((uint64_t)v1);
    uint64_t v3 = +[KmlTlv TLVWithTag:value:]((uint64_t)KmlTlv, 32620, v2);

    int v4 = -[KmlTlv asData]((uint64_t)v3);
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

@end