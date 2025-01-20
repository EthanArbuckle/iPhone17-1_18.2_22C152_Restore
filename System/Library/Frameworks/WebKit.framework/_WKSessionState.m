@interface _WKSessionState
- (NSData)data;
- (_WKSessionState)initWithData:(id)a3;
- (id).cxx_construct;
- (id)_initWithSessionState:(SessionState *)a3;
@end

@implementation _WKSessionState

- (_WKSessionState)initWithData:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_WKSessionState;
  id v4 = [(_WKSessionState *)&v8 init];
  v6 = (_WKSessionState *)v4;
  if (v4 && (WebKit::decodeSessionState((WebKit *)a3, (NSData *)v4 + 1, v5) & 1) == 0)
  {

    return 0;
  }
  return v6;
}

- (id)_initWithSessionState:(SessionState *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_WKSessionState;
  id v4 = [(_WKSessionState *)&v9 init];
  v5 = v4;
  if (v4)
  {
    unsigned int v6 = *((_DWORD *)v4 + 5);
    if (v6) {
      WTF::VectorDestructor<true,WebKit::BackForwardListItemState>::destruct(*((WTF::StringImpl **)v4 + 1), (WTF::StringImpl *)(*((void *)v4 + 1) + 312 * v6));
    }
    WTF::VectorBuffer<WebCore::TextList,0ul,WTF::FastMalloc>::adopt((uint64_t)(v5 + 8), a3);
    unsigned int val = a3->backForwardListState.currentIndex.var0.__val_;
    v5[28] = a3->backForwardListState.currentIndex.__engaged_;
    *((_DWORD *)v5 + 6) = val;
    *((void *)v5 + 4) = a3->renderTreeSize;
    WTF::URL::operator=((uint64_t)(v5 + 40), (uint64_t)&a3->provisionalURL);
    v5[80] = a3->isAppInitiated;
  }
  return v5;
}

- (NSData)data
{
  WebKit::encodeSessionState((WebKit *)&self->_sessionState, &cf);
  v2 = (void *)CFMakeCollectable(cf);

  return (NSData *)v2;
}

- (void).cxx_destruct
{
  m_ptr = self->_sessionState.provisionalURL.m_string.m_impl.m_ptr;
  self->_sessionState.provisionalURL.m_string.m_impl.m_ptr = 0;
  if (m_ptr)
  {
    if (*(_DWORD *)m_ptr == 2) {
      WTF::StringImpl::destroy((WTF::StringImpl *)m_ptr, (WTF::StringImpl *)a2);
    }
    else {
      *(_DWORD *)m_ptr -= 2;
    }
  }

  WTF::Vector<WebKit::BackForwardListItemState,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&self->_sessionState, (void *)a2);
}

- (id).cxx_construct
{
  self->_sessionState.backForwardListState.items.m_buffer = 0;
  self->_sessionState.backForwardListState.currentIndex.__engaged_ = 0;
  *(void *)&self->_sessionState.backForwardListState.items.m_capacity = 0;
  self->_sessionState.backForwardListState.currentIndex.var0.__null_state_ = 0;
  WTF::URL::URL((WTF::URL *)&self->_sessionState.provisionalURL);
  self->_sessionState.isAppInitiated = 1;
  return self;
}

@end