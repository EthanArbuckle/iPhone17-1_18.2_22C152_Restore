@interface WKDOMRange
- (BOOL)isCollapsed;
- (NSArray)textRects;
- (NSString)text;
- (OpaqueWKBundleRangeHandle)_copyBundleRangeHandleRef;
- (WKDOMNode)endContainer;
- (WKDOMNode)startContainer;
- (WKDOMRange)initWithDocument:(id)a3;
- dealloc;
- (id).cxx_construct;
- (id)_initWithImpl:(void *)a3;
- (id)rangeByExpandingToWordBoundaryByCharacters:(unint64_t)a3 inDirection:(int64_t)a4;
- (int64_t)endOffset;
- (int64_t)startOffset;
- (uint64_t)dealloc;
- (void)collapse:(BOOL)a3;
- (void)dealloc;
- (void)selectNode:(id)a3;
- (void)selectNodeContents:(id)a3;
- (void)setEnd:(id)a3 offset:(int)a4;
- (void)setStart:(id)a3 offset:(int)a4;
@end

@implementation WKDOMRange

- (id)_initWithImpl:(void *)a3
{
  v22.receiver = self;
  v22.super_class = (Class)WKDOMRange;
  v4 = [(WKDOMRange *)&v22 init];
  v5 = v4;
  if (!v4) {
    return v5;
  }
  if (a3) {
    ++*((_DWORD *)a3 + 2);
  }
  m_ptr = v4->_impl.m_ptr;
  v5->_impl.m_ptr = (Range *)a3;
  if (m_ptr)
  {
    if (*((_DWORD *)m_ptr + 2) == 1) {
      (*(void (**)(Range *))(*(void *)m_ptr + 8))(m_ptr);
    }
    else {
      --*((_DWORD *)m_ptr + 2);
    }
  }
  if (byte_1EB359C11)
  {
    uint64_t v7 = qword_1EB359C20;
    if (qword_1EB359C20) {
      goto LABEL_11;
    }
  }
  else
  {
    qword_1EB359C20 = 0;
    byte_1EB359C11 = 1;
  }
  WTF::HashTable<WebCore::Range *,WTF::KeyValuePair<WebCore::Range *,WKDOMRange *>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WebCore::Range *,WKDOMRange *>>,WTF::DefaultHash<WebCore::Range *>,WTF::HashMap<WebCore::Range *,WKDOMRange *,WTF::DefaultHash<WebCore::Range *>,WTF::HashTraits<WebCore::Range *>,WTF::HashTraits<WKDOMRange *>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WebCore::Range *>>::expand();
  uint64_t v7 = qword_1EB359C20;
  if (!qword_1EB359C20)
  {
    int v8 = 0;
    goto LABEL_12;
  }
LABEL_11:
  int v8 = *(_DWORD *)(v7 - 8);
LABEL_12:
  unint64_t v9 = ((unint64_t)a3 + ~((void)a3 << 32)) ^ (((unint64_t)a3 + ~((void)a3 << 32)) >> 22);
  unint64_t v10 = 9 * ((v9 + ~(v9 << 13)) ^ ((v9 + ~(v9 << 13)) >> 8));
  unint64_t v11 = (v10 ^ (v10 >> 15)) + ~((v10 ^ (v10 >> 15)) << 27);
  unsigned int v12 = v8 & ((v11 >> 31) ^ v11);
  v13 = (void **)(v7 + 16 * v12);
  v14 = *v13;
  if (!*v13)
  {
LABEL_20:
    *v13 = a3;
    v13[1] = v5;
    if (qword_1EB359C20) {
      int v17 = *(_DWORD *)(qword_1EB359C20 - 12) + 1;
    }
    else {
      int v17 = 1;
    }
    *(_DWORD *)(qword_1EB359C20 - 12) = v17;
    if (qword_1EB359C20) {
      int v18 = *(_DWORD *)(qword_1EB359C20 - 12);
    }
    else {
      int v18 = 0;
    }
    uint64_t v19 = (*(_DWORD *)(qword_1EB359C20 - 16) + v18);
    unint64_t v20 = *(unsigned int *)(qword_1EB359C20 - 4);
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
    WTF::HashTable<WebCore::Range *,WTF::KeyValuePair<WebCore::Range *,WKDOMRange *>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WebCore::Range *,WKDOMRange *>>,WTF::DefaultHash<WebCore::Range *>,WTF::HashMap<WebCore::Range *,WKDOMRange *,WTF::DefaultHash<WebCore::Range *>,WTF::HashTraits<WebCore::Range *>,WTF::HashTraits<WKDOMRange *>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WebCore::Range *>>::expand();
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
      goto LABEL_20;
    }
  }
  return v5;
}

- (WKDOMRange)initWithDocument:(id)a3
{
  WebCore::Range::create((uint64_t *)&v7, *((WebCore::Range **)a3 + 1), (Document *)a2);
  v4 = [(WKDOMRange *)self _initWithImpl:v7];
  v5 = v7;
  uint64_t v7 = 0;
  if (v5)
  {
    if (v5[2] == 1) {
      (*(void (**)(_DWORD *))(*(void *)v5 + 8))(v5);
    }
    else {
      --v5[2];
    }
  }
  return v4;
}

- (void)dealloc
{
  v2 = (_DWORD *)a1[1];
  *a1 = &unk_1EE9D7860;
  a1[1] = 0;
  if (v2)
  {
    if (v2[2] == 1) {
      (*(void (**)(_DWORD *))(*(void *)v2 + 8))(v2);
    }
    else {
      --v2[2];
    }
  }
  return a1;
}

- (void)setStart:(id)a3 offset:(int)a4
{
  if (a3)
  {
    uint64_t v4 = *((void *)a3 + 1);
    *(_DWORD *)(v4 + 28) += 2;
    uint64_t v7 = v4;
    WebCore::Range::setStart();
    if (v9)
    {
      v6 = v8;
      int v8 = 0;
      if (v6)
      {
        if (*(_DWORD *)v6 == 2) {
          WTF::StringImpl::destroy(v6, v5);
        }
        else {
          *(_DWORD *)v6 -= 2;
        }
      }
    }
    WTF::Ref<WebCore::Node,WTF::RawPtrTraits<WebCore::Node>,WTF::DefaultRefDerefTraits<WebCore::Node>>::~Ref(&v7);
  }
}

- (void)setEnd:(id)a3 offset:(int)a4
{
  if (a3)
  {
    uint64_t v4 = *((void *)a3 + 1);
    *(_DWORD *)(v4 + 28) += 2;
    uint64_t v7 = v4;
    WebCore::Range::setEnd();
    if (v9)
    {
      v6 = v8;
      int v8 = 0;
      if (v6)
      {
        if (*(_DWORD *)v6 == 2) {
          WTF::StringImpl::destroy(v6, v5);
        }
        else {
          *(_DWORD *)v6 -= 2;
        }
      }
    }
    WTF::Ref<WebCore::Node,WTF::RawPtrTraits<WebCore::Node>,WTF::DefaultRefDerefTraits<WebCore::Node>>::~Ref(&v7);
  }
}

- (void)collapse:(BOOL)a3
{
}

- (void)selectNode:(id)a3
{
  if (a3)
  {
    WebCore::Range::selectNode(&v5, (WebCore::Range *)self->_impl.m_ptr, *((WebCore::Node **)a3 + 1));
    if (v7)
    {
      uint64_t v4 = v6;
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

- (void)selectNodeContents:(id)a3
{
  if (a3)
  {
    WebCore::Range::selectNodeContents(&v5, (WebCore::Range *)self->_impl.m_ptr, *((WebCore::Node **)a3 + 1));
    if (v7)
    {
      uint64_t v4 = v6;
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

- (WKDOMNode)startContainer
{
  return (WKDOMNode *)WebKit::toWKDOMNode(*((WebKit **)self->_impl.m_ptr + 4), (WebCore::Node *)a2);
}

- (int64_t)startOffset
{
  return *((unsigned int *)self->_impl.m_ptr + 10);
}

- (WKDOMNode)endContainer
{
  return (WKDOMNode *)WebKit::toWKDOMNode(*((WebKit **)self->_impl.m_ptr + 7), (WebCore::Node *)a2);
}

- (int64_t)endOffset
{
  return *((unsigned int *)self->_impl.m_ptr + 16);
}

- (NSString)text
{
  WebCore::makeSimpleRange(v6, (WebCore *)self->_impl.m_ptr, (const Range *)a2);
  WebCore::Document::updateLayout();
  WebCore::plainText();
  if (v5)
  {
    v3 = (__CFString *)WTF::StringImpl::operator NSString *();
    if (*(_DWORD *)v5 == 2) {
      WTF::StringImpl::destroy(v5, v2);
    }
    else {
      *(_DWORD *)v5 -= 2;
    }
  }
  else
  {
    v3 = &stru_1EEA10550;
  }
  WTF::Ref<WebCore::Node,WTF::RawPtrTraits<WebCore::Node>,WTF::DefaultRefDerefTraits<WebCore::Node>>::~Ref(&v7);
  WTF::Ref<WebCore::Node,WTF::RawPtrTraits<WebCore::Node>,WTF::DefaultRefDerefTraits<WebCore::Node>>::~Ref(v6);
  return &v3->isa;
}

- (BOOL)isCollapsed
{
  m_ptr = self->_impl.m_ptr;
  BOOL v5 = *((void *)m_ptr + 4) == *((void *)m_ptr + 7);
  int v3 = *((_DWORD *)m_ptr + 10);
  int v4 = *((_DWORD *)m_ptr + 16);
  return v5 && v3 == v4;
}

- (NSArray)textRects
{
  WebCore::makeSimpleRange(v9, (WebCore *)self->_impl.m_ptr, (const Range *)a2);
  WebCore::Document::updateLayout();
  WebCore::RenderObject::absoluteTextRects();
  WTF::createNSArray<WTF::Vector<WebCore::IntRect,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>>((uint64_t *)&cf, (uint64_t)&v6);
  int v3 = (id)CFMakeCollectable(cf);
  int v4 = v6;
  if (v6)
  {
    v6 = 0;
    int v7 = 0;
    WTF::fastFree(v4, v2);
  }
  WTF::Ref<WebCore::Node,WTF::RawPtrTraits<WebCore::Node>,WTF::DefaultRefDerefTraits<WebCore::Node>>::~Ref(&v10);
  WTF::Ref<WebCore::Node,WTF::RawPtrTraits<WebCore::Node>,WTF::DefaultRefDerefTraits<WebCore::Node>>::~Ref(v9);
  return v3;
}

- (id)rangeByExpandingToWordBoundaryByCharacters:(unint64_t)a3 inDirection:(int64_t)a4
{
  WebCore::makeSimpleRange(v10, (WebCore *)self->_impl.m_ptr, (const Range *)a2);
  WebCore::makeDeprecatedLegacyPosition();
  WebCore::VisiblePosition::VisiblePosition();
  WebCore::rangeExpandedByCharactersInDirectionAtWordBoundary();
  if (v8)
  {
    if (*((_DWORD *)v8 + 7) == 2)
    {
      if ((*((_WORD *)v8 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v8);
      }
    }
    else
    {
      *((_DWORD *)v8 + 7) -= 2;
    }
  }
  if (v7)
  {
    if (*((_DWORD *)v7 + 7) == 2)
    {
      if ((*((_WORD *)v7 + 17) & 0x400) == 0) {
        WebCore::Node::removedLastRef(v7);
      }
    }
    else
    {
      *((_DWORD *)v7 + 7) -= 2;
    }
  }
  int v4 = [WKDOMRange alloc];
  WebCore::createLiveRange();
  CFTypeRef v5 = (id)CFMakeCollectable(-[WKDOMRange _initWithImpl:](v4, "_initWithImpl:", 0, 0));
  std::__optional_destruct_base<WebCore::SimpleRange,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)v9);
  WTF::Ref<WebCore::Node,WTF::RawPtrTraits<WebCore::Node>,WTF::DefaultRefDerefTraits<WebCore::Node>>::~Ref(&v11);
  WTF::Ref<WebCore::Node,WTF::RawPtrTraits<WebCore::Node>,WTF::DefaultRefDerefTraits<WebCore::Node>>::~Ref(v10);
  return (id)v5;
}

- (void).cxx_destruct
{
  m_ptr = self->_impl.m_ptr;
  self->_impl.m_ptr = 0;
  if (m_ptr)
  {
    if (*((_DWORD *)m_ptr + 2) == 1) {
      (*(void (**)(void))(*(void *)m_ptr + 8))();
    }
    else {
      --*((_DWORD *)m_ptr + 2);
    }
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (OpaqueWKBundleRangeHandle)_copyBundleRangeHandleRef
{
  WebKit::InjectedBundleRangeHandle::getOrCreate((WTF *)self->_impl.m_ptr, (WebCore::Range *)a2, &v3);
  if (v3) {
    return *(OpaqueWKBundleRangeHandle **)(v3 + 8);
  }
  else {
    return 0;
  }
}

- (uint64_t)dealloc
{
  uint64_t v3 = (_DWORD *)*((void *)this + 1);
  *(void *)this = &unk_1EE9D7860;
  *((void *)this + 1) = 0;
  if (v3)
  {
    if (v3[2] == 1) {
      (*(void (**)(_DWORD *))(*(void *)v3 + 8))(v3);
    }
    else {
      --v3[2];
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

  if (byte_1EB359C11)
  {
    if (qword_1EB359C20)
    {
      v1 = *((void *)result + 1);
      v2 = *(_DWORD *)(qword_1EB359C20 - 8);
      uint64_t v3 = (~(v1 << 32) + v1) ^ ((unint64_t)(~(v1 << 32) + v1) >> 22);
      int v4 = 9 * ((v3 + ~(v3 << 13)) ^ ((v3 + ~(v3 << 13)) >> 8));
      CFTypeRef v5 = (v4 ^ (v4 >> 15)) + ~((v4 ^ (v4 >> 15)) << 27);
      v6 = v2 & ((v5 >> 31) ^ v5);
      int v7 = *(void *)(qword_1EB359C20 + 16 * v6);
      if (v7 != v1)
      {
        int v8 = 1;
        while (v7)
        {
          v6 = (v6 + v8) & v2;
          int v7 = *(void *)(qword_1EB359C20 + 16 * v6);
          ++v8;
          if (v7 == v1) {
            goto LABEL_9;
          }
        }
        v6 = *(unsigned int *)(qword_1EB359C20 - 4);
      }
LABEL_9:
      if (v6 != *(_DWORD *)(qword_1EB359C20 - 4))
      {
        *(void *)(qword_1EB359C20 + 16 * v6) = -1;
        char v9 = qword_1EB359C20;
        ++*(_DWORD *)(qword_1EB359C20 - 16);
        uint64_t v10 = v9 ? *(_DWORD *)(v9 - 12) - 1 : -1;
        *(_DWORD *)(v9 - 12) = v10;
        if (qword_1EB359C20)
        {
          uint64_t v11 = *(_DWORD *)(qword_1EB359C20 - 4);
          if (6 * *(_DWORD *)(qword_1EB359C20 - 12) < v11 && v11 >= 9) {
            return WTF::HashTable<WebCore::Range *,WTF::KeyValuePair<WebCore::Range *,WKDOMRange *>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WebCore::Range *,WKDOMRange *>>,WTF::DefaultHash<WebCore::Range *>,WTF::HashMap<WebCore::Range *,WKDOMRange *,WTF::DefaultHash<WebCore::Range *>,WTF::HashTraits<WebCore::Range *>,WTF::HashTraits<WKDOMRange *>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WebCore::Range *>>::rehash(v11 >> 1);
          }
        }
      }
    }
  }
  else
  {
    qword_1EB359C20 = 0;
    byte_1EB359C11 = 1;
  }
  return result;
}

@end