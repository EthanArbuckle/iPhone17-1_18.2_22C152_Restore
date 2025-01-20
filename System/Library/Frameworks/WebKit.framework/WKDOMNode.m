@interface WKDOMNode
- (NSArray)textRects;
- (OpaqueWKBundleNodeHandle)_copyBundleNodeHandleRef;
- (WKDOMDocument)document;
- (WKDOMNode)firstChild;
- (WKDOMNode)lastChild;
- (WKDOMNode)nextSibling;
- (WKDOMNode)parentNode;
- (WKDOMNode)previousSibling;
- dealloc;
- (id).cxx_construct;
- (id)_initWithImpl:(void *)a3;
- (uint64_t)dealloc;
- (void)appendChild:(id)a3;
- (void)dealloc;
- (void)insertNode:(id)a3 before:(id)a4;
- (void)removeChild:(id)a3;
@end

@implementation WKDOMNode

- (id)_initWithImpl:(void *)a3
{
  v22.receiver = self;
  v22.super_class = (Class)WKDOMNode;
  v4 = [(WKDOMNode *)&v22 init];
  v5 = v4;
  if (!v4) {
    return v5;
  }
  if (a3) {
    *((_DWORD *)a3 + 7) += 2;
  }
  m_ptr = v4->_impl.m_ptr;
  v5->_impl.m_ptr = (Node *)a3;
  if (m_ptr)
  {
    if (*((_DWORD *)m_ptr + 7) == 2)
    {
      if ((*((_WORD *)m_ptr + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef((WebCore::Node *)m_ptr);
      }
    }
    else
    {
      *((_DWORD *)m_ptr + 7) -= 2;
    }
  }
  if (_MergedGlobals_92)
  {
    uint64_t v7 = qword_1EB359C18;
    if (qword_1EB359C18) {
      goto LABEL_10;
    }
  }
  else
  {
    qword_1EB359C18 = 0;
    _MergedGlobals_92 = 1;
  }
  WTF::HashTable<WebCore::Node *,WTF::KeyValuePair<WebCore::Node *,WKDOMNode *>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WebCore::Node *,WKDOMNode *>>,WTF::DefaultHash<WebCore::Node *>,WTF::HashMap<WebCore::Node *,WKDOMNode *,WTF::DefaultHash<WebCore::Node *>,WTF::HashTraits<WebCore::Node *>,WTF::HashTraits<WKDOMNode *>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WebCore::Node *>>::expand();
  uint64_t v7 = qword_1EB359C18;
  if (!qword_1EB359C18)
  {
    int v8 = 0;
    goto LABEL_11;
  }
LABEL_10:
  int v8 = *(_DWORD *)(v7 - 8);
LABEL_11:
  unint64_t v9 = ((unint64_t)a3 + ~((void)a3 << 32)) ^ (((unint64_t)a3 + ~((void)a3 << 32)) >> 22);
  unint64_t v10 = 9 * ((v9 + ~(v9 << 13)) ^ ((v9 + ~(v9 << 13)) >> 8));
  unint64_t v11 = (v10 ^ (v10 >> 15)) + ~((v10 ^ (v10 >> 15)) << 27);
  unsigned int v12 = v8 & ((v11 >> 31) ^ v11);
  v13 = (void **)(v7 + 16 * v12);
  v14 = *v13;
  if (!*v13)
  {
LABEL_19:
    *v13 = a3;
    v13[1] = v5;
    if (qword_1EB359C18) {
      int v17 = *(_DWORD *)(qword_1EB359C18 - 12) + 1;
    }
    else {
      int v17 = 1;
    }
    *(_DWORD *)(qword_1EB359C18 - 12) = v17;
    if (qword_1EB359C18) {
      int v18 = *(_DWORD *)(qword_1EB359C18 - 12);
    }
    else {
      int v18 = 0;
    }
    uint64_t v19 = (*(_DWORD *)(qword_1EB359C18 - 16) + v18);
    unint64_t v20 = *(unsigned int *)(qword_1EB359C18 - 4);
    if (v20 > 0x400)
    {
      if (v20 > 2 * v19) {
        return v5;
      }
    }
    else if (3 * v20 > 4 * v19)
    {
      return v5;
    }
    WTF::HashTable<WebCore::Node *,WTF::KeyValuePair<WebCore::Node *,WKDOMNode *>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WebCore::Node *,WKDOMNode *>>,WTF::DefaultHash<WebCore::Node *>,WTF::HashMap<WebCore::Node *,WKDOMNode *,WTF::DefaultHash<WebCore::Node *>,WTF::HashTraits<WebCore::Node *>,WTF::HashTraits<WKDOMNode *>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WebCore::Node *>>::expand();
    return v5;
  }
  v15 = 0;
  int v16 = 1;
  while (v14 != a3)
  {
    if (v14 == (void *)-1) {
      v15 = v13;
    }
    unsigned int v12 = (v12 + v16) & v8;
    v13 = (void **)(v7 + 16 * v12);
    v14 = *v13;
    ++v16;
    if (!*v13)
    {
      if (v15)
      {
        *v15 = 0;
        v15[1] = 0;
        --*(_DWORD *)(v7 - 16);
        v13 = v15;
      }
      goto LABEL_19;
    }
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v2 = a1[1];
  *a1 = &unk_1EE9D7838;
  a1[1] = 0;
  if (v2)
  {
    if (*(_DWORD *)(v2 + 28) == 2)
    {
      if ((*(_WORD *)(v2 + 34) & 0x400) == 0) {
        WebCore::Node::removedLastRef((WebCore::Node *)v2);
      }
    }
    else
    {
      *(_DWORD *)(v2 + 28) -= 2;
    }
  }
  return a1;
}

- (void)insertNode:(id)a3 before:(id)a4
{
  if (a3)
  {
    if (a4)
    {
      v4 = (WebCore::Node *)*((void *)a4 + 1);
      if (v4) {
        *((_DWORD *)v4 + 7) += 2;
      }
    }
    else
    {
      v4 = 0;
    }
    v6 = v4;
    WebCore::Node::insertBefore();
    if (v8 && v7)
    {
      if (*(_DWORD *)v7 == 2) {
        WTF::StringImpl::destroy(v7, v5);
      }
      else {
        *(_DWORD *)v7 -= 2;
      }
    }
    if (v6)
    {
      if (*((_DWORD *)v6 + 7) == 2)
      {
        if ((*((_WORD *)v6 + 17) & 0x400) == 0) {
          WebCore::Node::removedLastRef(v6);
        }
      }
      else
      {
        *((_DWORD *)v6 + 7) -= 2;
      }
    }
  }
}

- (void)appendChild:(id)a3
{
  if (a3)
  {
    WebCore::Node::appendChild(&v5, (WebCore::Node *)self->_impl.m_ptr, *((Node **)a3 + 1));
    if (v7)
    {
      v4 = v6;
      v6 = 0;
      if (v4)
      {
        if (*(_DWORD *)v4 == 2) {
          WTF::StringImpl::destroy(v4, v3);
        }
        else {
          *(_DWORD *)v4 -= 2;
        }
      }
    }
  }
}

- (void)removeChild:(id)a3
{
  if (a3)
  {
    WebCore::Node::removeChild(&v5, (WebCore::Node *)self->_impl.m_ptr, *((WebCore::Node **)a3 + 1));
    if (v7)
    {
      v4 = v6;
      v6 = 0;
      if (v4)
      {
        if (*(_DWORD *)v4 == 2) {
          WTF::StringImpl::destroy(v4, v3);
        }
        else {
          *(_DWORD *)v4 -= 2;
        }
      }
    }
  }
}

- (WKDOMDocument)document
{
  return (WKDOMDocument *)WebKit::toWKDOMNode(*(WebKit **)(*((void *)self->_impl.m_ptr + 6) + 8), (WebCore::Node *)a2);
}

- (WKDOMNode)parentNode
{
  return (WKDOMNode *)WebKit::toWKDOMNode(*((WebKit **)self->_impl.m_ptr + 5), (WebCore::Node *)a2);
}

- (WKDOMNode)firstChild
{
  m_ptr = self->_impl.m_ptr;
  if (m_ptr) {
    BOOL v3 = (*((_WORD *)m_ptr + 16) & 4) == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3) {
    v4 = 0;
  }
  else {
    v4 = (WebKit *)*((void *)m_ptr + 11);
  }
  return (WKDOMNode *)WebKit::toWKDOMNode(v4, (WebCore::Node *)a2);
}

- (WKDOMNode)lastChild
{
  m_ptr = self->_impl.m_ptr;
  if (m_ptr) {
    BOOL v3 = (*((_WORD *)m_ptr + 16) & 4) == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3) {
    v4 = 0;
  }
  else {
    v4 = (WebKit *)*((void *)m_ptr + 12);
  }
  return (WKDOMNode *)WebKit::toWKDOMNode(v4, (WebCore::Node *)a2);
}

- (WKDOMNode)previousSibling
{
  return (WKDOMNode *)WebKit::toWKDOMNode((WebKit *)(*((void *)self->_impl.m_ptr + 7) & 0xFFFFFFFFFFFFLL), (WebCore::Node *)a2);
}

- (WKDOMNode)nextSibling
{
  return (WKDOMNode *)WebKit::toWKDOMNode(*((WebKit **)self->_impl.m_ptr + 8), (WebCore::Node *)a2);
}

- (NSArray)textRects
{
  WebCore::Document::updateLayout();
  m_ptr = self->_impl.m_ptr;
  if ((*((void *)m_ptr + 9) & 0xFFFFFFFFFFFFLL) == 0) {
    return 0;
  }
  WebCore::makeRangeSelectingNodeContents(v9, (WebCore *)m_ptr, v3);
  WebCore::RenderObject::absoluteTextRects();
  WTF::createNSArray<WTF::Vector<WebCore::IntRect,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>>((uint64_t *)&v13, (uint64_t)&v11);
  v6 = (id)CFMakeCollectable(v13);
  char v7 = v11;
  if (v11)
  {
    unint64_t v11 = 0;
    int v12 = 0;
    WTF::fastFree(v7, v5);
  }
  WTF::Ref<WebCore::Node,WTF::RawPtrTraits<WebCore::Node>,WTF::DefaultRefDerefTraits<WebCore::Node>>::~Ref(&v10);
  WTF::Ref<WebCore::Node,WTF::RawPtrTraits<WebCore::Node>,WTF::DefaultRefDerefTraits<WebCore::Node>>::~Ref(v9);
  return v6;
}

- (void).cxx_destruct
{
  m_ptr = self->_impl.m_ptr;
  self->_impl.m_ptr = 0;
  if (m_ptr)
  {
    if (*((_DWORD *)m_ptr + 7) == 2)
    {
      if ((*((_WORD *)m_ptr + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef((WebCore::Node *)m_ptr);
      }
    }
    else
    {
      *((_DWORD *)m_ptr + 7) -= 2;
    }
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (OpaqueWKBundleNodeHandle)_copyBundleNodeHandleRef
{
  result = (OpaqueWKBundleNodeHandle *)self->_impl.m_ptr;
  if (result)
  {
    WebKit::InjectedBundleNodeHandle::getOrCreate((WebKit::InjectedBundleNodeHandle *)result, &v3);
    if (v3) {
      return (OpaqueWKBundleNodeHandle *)*((void *)v3 + 1);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (uint64_t)dealloc
{
  uint64_t v3 = *((void *)this + 1);
  *(void *)this = &unk_1EE9D7838;
  *((void *)this + 1) = 0;
  if (v3)
  {
    if (*(_DWORD *)(v3 + 28) == 2)
    {
      if ((*(_WORD *)(v3 + 34) & 0x400) == 0) {
        WebCore::Node::removedLastRef((WebCore::Node *)v3);
      }
    }
    else
    {
      *(_DWORD *)(v3 + 28) -= 2;
    }
  }

  return WTF::fastFree(this, a2);
}

- dealloc
{
  uint64_t v1;
  unsigned int v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  int v10;
  unsigned int v11;

  if (_MergedGlobals_92)
  {
    if (qword_1EB359C18)
    {
      v1 = *((void *)result + 1);
      uint64_t v2 = *(_DWORD *)(qword_1EB359C18 - 8);
      uint64_t v3 = (~(v1 << 32) + v1) ^ ((unint64_t)(~(v1 << 32) + v1) >> 22);
      v4 = 9 * ((v3 + ~(v3 << 13)) ^ ((v3 + ~(v3 << 13)) >> 8));
      uint64_t v5 = (v4 ^ (v4 >> 15)) + ~((v4 ^ (v4 >> 15)) << 27);
      v6 = v2 & ((v5 >> 31) ^ v5);
      char v7 = *(void *)(qword_1EB359C18 + 16 * v6);
      if (v7 != v1)
      {
        char v8 = 1;
        while (v7)
        {
          v6 = (v6 + v8) & v2;
          char v7 = *(void *)(qword_1EB359C18 + 16 * v6);
          ++v8;
          if (v7 == v1) {
            goto LABEL_9;
          }
        }
        v6 = *(unsigned int *)(qword_1EB359C18 - 4);
      }
LABEL_9:
      if (v6 != *(_DWORD *)(qword_1EB359C18 - 4))
      {
        *(void *)(qword_1EB359C18 + 16 * v6) = -1;
        unint64_t v9 = qword_1EB359C18;
        ++*(_DWORD *)(qword_1EB359C18 - 16);
        uint64_t v10 = v9 ? *(_DWORD *)(v9 - 12) - 1 : -1;
        *(_DWORD *)(v9 - 12) = v10;
        if (qword_1EB359C18)
        {
          unint64_t v11 = *(_DWORD *)(qword_1EB359C18 - 4);
          if (6 * *(_DWORD *)(qword_1EB359C18 - 12) < v11 && v11 >= 9) {
            return WTF::HashTable<WebCore::Node *,WTF::KeyValuePair<WebCore::Node *,WKDOMNode *>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WebCore::Node *,WKDOMNode *>>,WTF::DefaultHash<WebCore::Node *>,WTF::HashMap<WebCore::Node *,WKDOMNode *,WTF::DefaultHash<WebCore::Node *>,WTF::HashTraits<WebCore::Node *>,WTF::HashTraits<WKDOMNode *>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WebCore::Node *>>::rehash(v11 >> 1);
          }
        }
      }
    }
  }
  else
  {
    qword_1EB359C18 = 0;
    _MergedGlobals_92 = 1;
  }
  return result;
}

@end