@interface WKProcessPoolWeakObserver
- (WKProcessPoolWeakObserver)initWithWeakPtr:(void *)a3;
- (id).cxx_construct;
@end

@implementation WKProcessPoolWeakObserver

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (WKProcessPoolWeakObserver)initWithWeakPtr:(void *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)WKProcessPoolWeakObserver;
  v4 = [(WKProcessPoolWeakObserver *)&v10 init];
  v6 = v4;
  if (v4)
  {
    v7 = *(DefaultWeakPtrImpl **)a3;
    *(void *)a3 = 0;
    m_ptr = (unsigned int *)v4->m_weakPtr.m_impl.m_ptr;
    v6->m_weakPtr.m_impl.m_ptr = v7;
    if (m_ptr)
    {
      if (atomic_fetch_add((atomic_uint *volatile)m_ptr, 0xFFFFFFFF) == 1)
      {
        atomic_store(1u, m_ptr);
        WTF::fastFree((WTF *)m_ptr, v5);
      }
    }
  }
  return v6;
}

- (void).cxx_destruct
{
  m_ptr = (unsigned int *)self->m_weakPtr.m_impl.m_ptr;
  self->m_weakPtr.m_impl.m_ptr = 0;
  if (m_ptr)
  {
    if (atomic_fetch_add((atomic_uint *volatile)m_ptr, 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, m_ptr);
      WTF::fastFree((WTF *)m_ptr, (void *)a2);
    }
  }
}

@end