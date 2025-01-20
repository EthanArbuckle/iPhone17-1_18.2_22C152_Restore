@interface MTRDistinguishedNameInfo
- (BOOL)isEqual:(id)a3;
- (MTRDistinguishedNameInfo)initWithDN:(const void *)a3;
- (NSNumber)fabricID;
- (NSNumber)intermediateCACertificateID;
- (NSNumber)nodeID;
- (NSNumber)rootCACertificateID;
- (NSSet)caseAuthenticatedTags;
- (id).cxx_construct;
@end

@implementation MTRDistinguishedNameInfo

- (MTRDistinguishedNameInfo)initWithDN:(const void *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)MTRDistinguishedNameInfo;
  result = [(MTRDistinguishedNameInfo *)&v12 init];
  if (result)
  {
    Span<const char> v5 = *(Span<const char> *)a3;
    *(_OWORD *)&result->_dn.rdn[0].mChipVal = *((_OWORD *)a3 + 1);
    result->_dn.rdn[0].mString = v5;
    Span<const char> v6 = (Span<const char>)*((_OWORD *)a3 + 2);
    long long v7 = *((_OWORD *)a3 + 3);
    Span<const char> v8 = (Span<const char>)*((_OWORD *)a3 + 4);
    *(_OWORD *)&result->_dn.rdn[2].mChipVal = *((_OWORD *)a3 + 5);
    result->_dn.rdn[2].mString = v8;
    *(_OWORD *)&result->_dn.rdn[1].mChipVal = v7;
    result->_dn.rdn[1].mString = v6;
    Span<const char> v9 = (Span<const char>)*((_OWORD *)a3 + 6);
    long long v10 = *((_OWORD *)a3 + 7);
    Span<const char> v11 = (Span<const char>)*((_OWORD *)a3 + 8);
    *(_OWORD *)&result->_dn.rdn[4].mChipVal = *((_OWORD *)a3 + 9);
    result->_dn.rdn[4].mString = v11;
    *(_OWORD *)&result->_dn.rdn[3].mChipVal = v10;
    result->_dn.rdn[3].mString = v9;
  }
  return result;
}

- (NSNumber)nodeID
{
  return (NSNumber *)sub_244BC847C((char *)self, (const char *)0x311);
}

- (NSNumber)fabricID
{
  return (NSNumber *)sub_244BC847C((char *)self, (const char *)0x315);
}

- (NSNumber)rootCACertificateID
{
  return (NSNumber *)sub_244BC847C((char *)self, (const char *)0x314);
}

- (NSNumber)intermediateCACertificateID
{
  return (NSNumber *)sub_244BC847C((char *)self, (const char *)0x313);
}

- (NSSet)caseAuthenticatedTags
{
  uint64_t v4 = 0;
  Span<const char> v5 = 0;
  do
  {
    if (self->_dn.rdn[v4].mAttrOID == 790)
    {
      long long v7 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, a2, self->_dn.rdn[v4].mChipVal);
      if (v5)
      {
        objc_msgSend_addObject_(v5, v6, (uint64_t)v7);
      }
      else
      {
        Span<const char> v5 = objc_msgSend_setWithObject_(MEMORY[0x263EFF9C0], v6, (uint64_t)v7);
      }
    }
    else if (!self->_dn.rdn[v4].mAttrOID)
    {
      break;
    }
    ++v4;
  }
  while (v4 != 5);
  if (v5)
  {
    uint64_t v8 = objc_msgSend_copy(v5, a2, v2);
  }
  else
  {
    uint64_t v8 = objc_msgSend_set(MEMORY[0x263EFFA08], a2, v2);
  }
  Span<const char> v9 = (void *)v8;

  return (NSSet *)v9;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (MTRDistinguishedNameInfo *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    BOOL v6 = v5 == objc_opt_class() && sub_244D91EAC((uint64_t)&self->_dn, (uint64_t)&v4->_dn);
  }

  return v6;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  return self;
}

@end