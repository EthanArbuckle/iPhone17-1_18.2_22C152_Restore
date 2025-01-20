@interface WKDOMElement
- (BOOL)hasAttribute:(id)a3;
- (NSString)tagName;
- (id)getAttribute:(id)a3;
- (void)setAttribute:(id)a3 value:(id)a4;
@end

@implementation WKDOMElement

- (BOOL)hasAttribute:(id)a3
{
  m_ptr = self->super._impl.m_ptr;
  if ((*((_WORD *)m_ptr + 16) & 8) != 0)
  {
    WTF::AtomStringImpl::add((uint64_t *)&v8, (WTF::AtomStringImpl *)a3, (const __CFString *)a2);
    char hasAttribute = WebCore::Element::hasAttribute((WebCore::Element *)m_ptr, &v8);
    v6 = v8.var0.m_impl.m_ptr;
    v8.var0.m_impl.m_ptr = 0;
    if (v6)
    {
      if (*(_DWORD *)v6 == 2) {
        WTF::StringImpl::destroy((WTF::StringImpl *)v6, v4);
      }
      else {
        *(_DWORD *)v6 -= 2;
      }
    }
    return hasAttribute;
  }
  else
  {
    BOOL result = 96;
    __break(0xC471u);
  }
  return result;
}

- (id)getAttribute:(id)a3
{
  m_ptr = self->super._impl.m_ptr;
  if ((*((_WORD *)m_ptr + 16) & 8) == 0)
  {
    __break(0xC471u);
    JUMPOUT(0x198E1171CLL);
  }
  WTF::AtomStringImpl::add((uint64_t *)&v8, (WTF::AtomStringImpl *)a3, (const __CFString *)a2);
  if (*(void *)WebCore::Element::getAttribute((WebCore::Element *)m_ptr, &v8)) {
    v5 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    v5 = &stru_1EEA10550;
  }
  v6 = v8.var0.m_impl.m_ptr;
  v8.var0.m_impl.m_ptr = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy((WTF::StringImpl *)v6, v4);
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
  return v5;
}

- (void)setAttribute:(id)a3 value:(id)a4
{
  m_ptr = self->super._impl.m_ptr;
  if ((*((_WORD *)m_ptr + 16) & 8) != 0)
  {
    WTF::AtomStringImpl::add((uint64_t *)&v12, (WTF::AtomStringImpl *)a3, (const __CFString *)a2);
    WTF::AtomStringImpl::add((uint64_t *)&v16, (WTF::AtomStringImpl *)a4, v6);
    v11 = v16;
    WebCore::Element::setAttribute(&v13, (WebCore::Element *)m_ptr, &v12, (const AtomString *)&v11);
    if (v15)
    {
      AtomString v8 = v14;
      v14 = 0;
      if (v8)
      {
        if (*(_DWORD *)v8 == 2) {
          WTF::StringImpl::destroy(v8, v7);
        }
        else {
          *(_DWORD *)v8 -= 2;
        }
      }
    }
    v9 = v11;
    v11 = 0;
    if (v9)
    {
      if (*(_DWORD *)v9 == 2) {
        WTF::StringImpl::destroy(v9, v7);
      }
      else {
        *(_DWORD *)v9 -= 2;
      }
    }
    v10 = v12.var0.m_impl.m_ptr;
    v12.var0.m_impl.m_ptr = 0;
    if (v10)
    {
      if (*(_DWORD *)v10 == 2) {
        WTF::StringImpl::destroy((WTF::StringImpl *)v10, v7);
      }
      else {
        *(_DWORD *)v10 -= 2;
      }
    }
  }
  else
  {
    __break(0xC471u);
  }
}

- (NSString)tagName
{
  m_ptr = self->super._impl.m_ptr;
  if ((*((_WORD *)m_ptr + 16) & 8) == 0)
  {
    __break(0xC471u);
    JUMPOUT(0x198E11960);
  }
  (*(void (**)(WTF::StringImpl **__return_ptr))(*(void *)m_ptr + 104))(&v7);
  if (!v7) {
    return (NSString *)&stru_1EEA10550;
  }
  v4 = (NSString *)WTF::StringImpl::operator NSString *();
  v5 = v7;
  v7 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2) {
      WTF::StringImpl::destroy(v5, v3);
    }
    else {
      *(_DWORD *)v5 -= 2;
    }
  }
  return v4;
}

@end