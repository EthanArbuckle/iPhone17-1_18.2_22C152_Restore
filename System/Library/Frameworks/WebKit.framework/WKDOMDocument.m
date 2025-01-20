@interface WKDOMDocument
- (WKDOMElement)body;
- (id)createDocumentFragmentWithMarkupString:(id)a3 baseURL:(id)a4;
- (id)createDocumentFragmentWithText:(id)a3;
- (id)createElement:(id)a3;
- (id)createTextNode:(id)a3;
- (id)parserYieldToken;
@end

@implementation WKDOMDocument

- (id)createElement:(id)a3
{
  m_ptr = self->super._impl.m_ptr;
  if ((*((_WORD *)m_ptr + 16) & 0xF000) == 0x9000)
  {
    WTF::AtomStringImpl::add((uint64_t *)&v10, (WTF::AtomStringImpl *)a3, (const __CFString *)a2);
    WebCore::Document::createElementForBindings((uint64_t *)v11, (WebCore::Document *)m_ptr, (const AtomString *)&v10);
    v5 = v10;
    v10 = 0;
    if (v5)
    {
      if (*(_DWORD *)v5 == 2) {
        WTF::StringImpl::destroy(v5, v4);
      }
      else {
        *(_DWORD *)v5 -= 2;
      }
    }
    int v6 = v12;
    if (v12)
    {
      id v7 = 0;
    }
    else
    {
      v8 = v11[0];
      v10 = v11[0];
      v11[0] = 0;
      id v7 = WebKit::toWKDOMNode(v8, v4);
      WTF::Ref<WebCore::Node,WTF::RawPtrTraits<WebCore::Node>,WTF::DefaultRefDerefTraits<WebCore::Node>>::~Ref((uint64_t *)&v10);
      int v6 = v12;
    }
    if (v6 != -1) {
      ((void (*)(WTF::StringImpl **, WebKit **))off_1EE9D7378[v6])(&v10, v11);
    }
    return v7;
  }
  else
  {
    id result = (id)96;
    __break(0xC471u);
  }
  return result;
}

- (id)createTextNode:(id)a3
{
  if ((*((_WORD *)self->super._impl.m_ptr + 16) & 0xF000) == 0x9000)
  {
    MEMORY[0x19972EAD0](&v8, a3);
    WebCore::Document::createTextNode();
    id v4 = WebKit::toWKDOMNode(v9, v3);
    WTF::Ref<WebCore::Node,WTF::RawPtrTraits<WebCore::Node>,WTF::DefaultRefDerefTraits<WebCore::Node>>::~Ref((uint64_t *)&v9);
    int v6 = v8;
    v8 = 0;
    if (v6)
    {
      if (*(_DWORD *)v6 == 2) {
        WTF::StringImpl::destroy(v6, v5);
      }
      else {
        *(_DWORD *)v6 -= 2;
      }
    }
    return v4;
  }
  else
  {
    id result = (id)96;
    __break(0xC471u);
  }
  return result;
}

- (WKDOMElement)body
{
  m_ptr = self->super._impl.m_ptr;
  if ((*((_WORD *)m_ptr + 16) & 0xF000) == 0x9000)
  {
    v3 = (WebKit *)WebCore::Document::bodyOrFrameset((WebCore::Document *)m_ptr);
    return (WKDOMElement *)WebKit::toWKDOMNode(v3, v4);
  }
  else
  {
    id result = (WKDOMElement *)96;
    __break(0xC471u);
  }
  return result;
}

- (id)createDocumentFragmentWithMarkupString:(id)a3 baseURL:(id)a4
{
  if ((*((_WORD *)self->super._impl.m_ptr + 16) & 0xF000) == 0x9000)
  {
    MEMORY[0x19972EAD0](&v12, a3);
    MEMORY[0x19972EAD0](&v11, [a4 absoluteString]);
    WebCore::createFragmentFromMarkup();
    id v6 = WebKit::toWKDOMNode(v13, v5);
    WTF::Ref<WebCore::Node,WTF::RawPtrTraits<WebCore::Node>,WTF::DefaultRefDerefTraits<WebCore::Node>>::~Ref((uint64_t *)&v13);
    v8 = v11;
    v11 = 0;
    if (v8)
    {
      if (*(_DWORD *)v8 == 2) {
        WTF::StringImpl::destroy(v8, v7);
      }
      else {
        *(_DWORD *)v8 -= 2;
      }
    }
    v9 = v12;
    int v12 = 0;
    if (v9)
    {
      if (*(_DWORD *)v9 == 2) {
        WTF::StringImpl::destroy(v9, v7);
      }
      else {
        *(_DWORD *)v9 -= 2;
      }
    }
    return v6;
  }
  else
  {
    id result = (id)96;
    __break(0xC471u);
  }
  return result;
}

- (id)createDocumentFragmentWithText:(id)a3
{
  m_ptr = self->super._impl.m_ptr;
  if ((*((_WORD *)m_ptr + 16) & 0xF000) == 0x9000)
  {
    WebCore::makeRangeSelectingNodeContents(v11, (WebCore *)m_ptr, (Node *)a2);
    MEMORY[0x19972EAD0](&v10, a3);
    WebCore::createFragmentFromText();
    id v6 = WebKit::toWKDOMNode(v13, v5);
    WTF::Ref<WebCore::Node,WTF::RawPtrTraits<WebCore::Node>,WTF::DefaultRefDerefTraits<WebCore::Node>>::~Ref((uint64_t *)&v13);
    v8 = v10;
    v10 = 0;
    if (v8)
    {
      if (*(_DWORD *)v8 == 2) {
        WTF::StringImpl::destroy(v8, v7);
      }
      else {
        *(_DWORD *)v8 -= 2;
      }
    }
    WTF::Ref<WebCore::Node,WTF::RawPtrTraits<WebCore::Node>,WTF::DefaultRefDerefTraits<WebCore::Node>>::~Ref(&v12);
    WTF::Ref<WebCore::Node,WTF::RawPtrTraits<WebCore::Node>,WTF::DefaultRefDerefTraits<WebCore::Node>>::~Ref(v11);
    return v6;
  }
  else
  {
    id result = (id)96;
    __break(0xC471u);
  }
  return result;
}

- (id)parserYieldToken
{
  v3 = [WKDOMDocumentParserYieldToken alloc];
  if ((*((_WORD *)self->super._impl.m_ptr + 16) & 0xF000) == 0x9000)
  {
    id v4 = (void *)CFMakeCollectable(-[WKDOMDocumentParserYieldToken initWithDocument:](v3, "initWithDocument:"));
    return v4;
  }
  else
  {
    id result = (id)96;
    __break(0xC471u);
  }
  return result;
}

@end