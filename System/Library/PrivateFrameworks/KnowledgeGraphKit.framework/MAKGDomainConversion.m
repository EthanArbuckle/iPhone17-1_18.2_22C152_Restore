@interface MAKGDomainConversion
+ (id)kgLabelForMADomain:(unsigned __int16)a3;
+ (unsigned)maDomainForKGLabel:(id)a3;
@end

@implementation MAKGDomainConversion

+ (unsigned)maDomainForKGLabel:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 lengthOfBytesUsingEncoding:4];
  if ((unint64_t)(v4 - 33) >= 0xFFFFFFFFFFFFFFE7)
  {
    v6 = (char *)v9 - ((v4 + 16) & 0xFFFFFFFFFFFFFFF0);
    if ([v3 getCString:v6 maxLength:v4 + 1 encoding:4]
      && !strncmp(v6, "domain_", 7uLL))
    {
      int v8 = atoi(v6 + 7);
      if ((v8 - 0x10000) < 0xFFFF0001) {
        unsigned __int16 v5 = -1;
      }
      else {
        unsigned __int16 v5 = v8;
      }
    }
    else
    {
      unsigned __int16 v5 = -1;
    }
  }
  else
  {
    unsigned __int16 v5 = -1;
  }

  return v5;
}

+ (id)kgLabelForMADomain:(unsigned __int16)a3
{
  if ((unsigned __int16)(a3 + 1) >= 2u)
  {
    uint64_t v4 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s%d", "domain_", a3);
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

@end