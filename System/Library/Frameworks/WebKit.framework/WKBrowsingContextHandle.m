@interface WKBrowsingContextHandle
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (ObjectIdentifierGeneric<WebKit::WebPageProxyIdentifierType,)_pageProxyID;
- (WKBrowsingContextHandle)initWithCoder:(id)a3;
- (id).cxx_construct;
- (id)_initWithPage:(NakedRef<WebKit::WebPage>)a3;
- (id)_initWithPageProxy:(NakedRef<WebKit::WebPageProxy>)a3;
- (id)_initWithPageProxyID:()ObjectIdentifierGeneric<WebKit:()WTF:(unsigned long)long :(WTF:()ObjectIdentifierGeneric<WebCore:()WTF:(unsigned long)long :(WTF::SupportsObjectIdentifierNullState::No>)a4 ObjectIdentifierMainThreadAccessTraits<uint64_t> :PageIdentifierType :SupportsObjectIdentifierNullState::Yes>)a3 ObjectIdentifierMainThreadAccessTraits<uint64_t> :WebPageProxyIdentifierType andWebPageID:;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)_webPageID;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WKBrowsingContextHandle

- (id)_initWithPageProxy:(NakedRef<WebKit::WebPageProxy>)a3
{
  return [(WKBrowsingContextHandle *)self _initWithPageProxyID:*(void *)(*((void *)a3.var0 + 4) + 760) andWebPageID:*(void *)(*((void *)a3.var0 + 4) + 1928)];
}

- (id)_initWithPage:(NakedRef<WebKit::WebPage>)a3
{
  return [(WKBrowsingContextHandle *)self _initWithPageProxyID:*((void *)a3.var0 + 265) andWebPageID:*((void *)a3.var0 + 5)];
}

- (id)_initWithPageProxyID:()ObjectIdentifierGeneric<WebKit:()WTF:(unsigned long)long :(WTF:()ObjectIdentifierGeneric<WebCore:()WTF:(unsigned long)long :(WTF::SupportsObjectIdentifierNullState::No>)a4 ObjectIdentifierMainThreadAccessTraits<uint64_t> :PageIdentifierType :SupportsObjectIdentifierNullState::Yes>)a3 ObjectIdentifierMainThreadAccessTraits<uint64_t> :WebPageProxyIdentifierType andWebPageID:
{
  v7.receiver = self;
  v7.super_class = (Class)WKBrowsingContextHandle;
  id result = [(WKBrowsingContextHandle *)&v7 init];
  if (result)
  {
    *((ObjectIdentifierGeneric<WebKit::WebPageProxyIdentifierType, WTF::ObjectIdentifierMainThreadAccessTraits<uint64_t>, unsigned long long, WTF::SupportsObjectIdentifierNullState::Yes> *)result
    + 1) = a3;
    *((ObjectIdentifierGeneric<WebCore::PageIdentifierType, WTF::ObjectIdentifierMainThreadAccessTraits<uint64_t>, unsigned long long, WTF::SupportsObjectIdentifierNullState::No> *)result
    + 2) = a4;
  }
  return result;
}

- (unint64_t)hash
{
  __int16 v7 = 0;
  char v8 = 0;
  unint64_t m_identifier = self->_pageProxyID.m_identifier;
  unint64_t webPageID = self->_webPageID;
  unsigned int v4 = (m_identifier >> 5) & 0x7FFF800 ^ (((unsigned __int16)m_identifier - 1640531527) << 16) ^ ((unsigned __int16)m_identifier - 1640531527);
  LODWORD(m_identifier) = (m_identifier >> 37) & 0x7FFF800 ^ ((v4 + WORD2(m_identifier) + (v4 >> 11)) << 16) ^ (v4 + WORD2(m_identifier) + (v4 >> 11));
  LODWORD(m_identifier) = (webPageID >> 5) & 0x7FFF800 ^ ((m_identifier
                                                                       + (unsigned __int16)webPageID
                                                                       + (m_identifier >> 11)) << 16) ^ (m_identifier + (unsigned __int16)webPageID + (m_identifier >> 11));
  LODWORD(m_identifier) = m_identifier + WORD2(webPageID) + (m_identifier >> 11);
  LODWORD(webPageID) = (webPageID >> 37) & 0x7FFF800 ^ (m_identifier << 16);
  int v6 = (webPageID ^ m_identifier) + ((webPageID ^ m_identifier) >> 11);
  return WTF::SuperFastHash::hash((WTF::SuperFastHash *)&v6);
}

- (BOOL)isEqual:(id)a3
{
  return (objc_opt_isKindOfClass() & 1) != 0
      && self->_pageProxyID.m_identifier == *((void *)a3 + 1)
      && self->_webPageID == *((void *)a3 + 2);
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeInt64:self->_pageProxyID.m_identifier forKey:@"pageProxyID"];
  unint64_t webPageID = self->_webPageID;

  [a3 encodeInt64:webPageID forKey:@"webPageID"];
}

- (WKBrowsingContextHandle)initWithCoder:(id)a3
{
  uint64_t v5 = [a3 decodeInt64ForKey:@"pageProxyID"];
  if (v5 == -1
    || (uint64_t v6 = v5,
        uint64_t v7 = [a3 decodeInt64ForKey:@"webPageID"],
        (unint64_t)(v7 - 1) >= 0xFFFFFFFFFFFFFFFELL))
  {
    __break(0xC471u);
    JUMPOUT(0x198A99C2CLL);
  }

  return (WKBrowsingContextHandle *)[(WKBrowsingContextHandle *)self _initWithPageProxyID:v6 andWebPageID:v7];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unsigned int v4 = +[WKBrowsingContextHandle allocWithZone:a3];
  if (self->_webPageID - 1 >= 0xFFFFFFFFFFFFFFFELL)
  {
    id result = (id)153;
    __break(0xC471u);
  }
  else
  {
    unint64_t m_identifier = self->_pageProxyID.m_identifier;
    return -[WKBrowsingContextHandle _initWithPageProxyID:andWebPageID:](v4, "_initWithPageProxyID:andWebPageID:", m_identifier);
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  unsigned int v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; pageProxyID = %llu; unint64_t webPageID = %llu>",
               NSStringFromClass(v4),
               self,
               self->_pageProxyID.m_identifier,
               self->_webPageID);
}

- (ObjectIdentifierGeneric<WebKit::WebPageProxyIdentifierType,)_pageProxyID
{
  return self->_pageProxyID;
}

- (unint64_t)_webPageID
{
  return self->_webPageID;
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end