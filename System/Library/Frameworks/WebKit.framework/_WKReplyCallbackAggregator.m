@interface _WKReplyCallbackAggregator
- (_WKReplyCallbackAggregator)initWithAggregator:(void *)a3;
- (id).cxx_construct;
- (void)aggregator;
@end

@implementation _WKReplyCallbackAggregator

- (_WKReplyCallbackAggregator)initWithAggregator:(void *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_WKReplyCallbackAggregator;
  v4 = [(_WKReplyCallbackAggregator *)&v9 init];
  v5 = v4;
  if (v4)
  {
    ++*(_DWORD *)a3;
    m_ptr = v4->_aggregator.m_ptr;
    v5->_aggregator.m_ptr = a3;
    if (m_ptr) {
      WTF::RefCounted<WTF::EagerCallbackAggregator<void ()(objc_object *,WebKit::IsDefaultReply)>>::deref(m_ptr);
    }
    v7 = v5;
  }

  return v5;
}

- (void)aggregator
{
  return self->_aggregator.m_ptr;
}

- (void).cxx_destruct
{
  m_ptr = self->_aggregator.m_ptr;
  self->_aggregator.m_ptr = 0;
  if (m_ptr) {
    WTF::RefCounted<WTF::EagerCallbackAggregator<void ()(objc_object *,WebKit::IsDefaultReply)>>::deref(m_ptr);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end