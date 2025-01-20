@interface _WKMockTKSmartCard
- (_WKMockTKSmartCard)initWithService:(void *)a3;
- (id).cxx_construct;
- (void)beginSessionWithReply:(id)a3;
- (void)transmitRequest:(id)a3 reply:(id)a4;
@end

@implementation _WKMockTKSmartCard

- (_WKMockTKSmartCard)initWithService:(void *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_WKMockTKSmartCard;
  v4 = [(_WKMockTKSmartCard *)&v10 init];
  v6 = v4;
  if (v4)
  {
    v7 = *(DefaultWeakPtrImpl **)a3;
    *(void *)a3 = 0;
    m_ptr = (unsigned int *)v4->m_service.m_impl.m_ptr;
    v6->m_service.m_impl.m_ptr = v7;
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

- (void)beginSessionWithReply:(id)a3
{
}

- (void)transmitRequest:(id)a3 reply:(id)a4
{
  m_ptr = self->m_service.m_impl.m_ptr;
  if (m_ptr) {
    uint64_t v7 = *((void *)m_ptr + 1);
  }
  else {
    uint64_t v7 = 0;
  }
  if (!*(unsigned char *)(v7 + 240)) {
    goto LABEL_22;
  }
  if (*(_DWORD *)(v7 + 236))
  {
    id v8 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    if (!*(unsigned char *)(v7 + 240)) {
      goto LABEL_22;
    }
    if (!*(_DWORD *)(v7 + 236))
    {
      __break(0xC471u);
      return;
    }
    v4 = v8;
    if (!**(void **)(v7 + 224)) {
      goto LABEL_23;
    }
    for (i = (__CFString *)WTF::StringImpl::operator NSString *(); ; i = &stru_1EEA10550)
    {
      uint64_t v10 = [v4 initWithBase64EncodedString:i options:1];
      if (*(unsigned char *)(v7 + 240)) {
        break;
      }
LABEL_22:
      __break(1u);
LABEL_23:
      ;
    }
    v12 = (const void *)v10;
    v13 = *(WTF::StringImpl ***)(v7 + 224);
    v14 = *v13;
    *v13 = 0;
    if (v14)
    {
      if (*(_DWORD *)v14 == 2) {
        WTF::StringImpl::destroy(v14, v11);
      }
      else {
        *(_DWORD *)v14 -= 2;
      }
    }
    memmove(v13, v13 + 1, *(void *)(v7 + 224) + 8 * *(unsigned int *)(v7 + 236) - (void)(v13 + 1));
    --*(_DWORD *)(v7 + 236);
  }
  else
  {
    v12 = 0;
  }
  (*((void (**)(id, const void *, void))a4 + 2))(a4, v12, 0);
  if (v12)
  {
    CFRelease(v12);
  }
}

- (void).cxx_destruct
{
  m_ptr = (unsigned int *)self->m_service.m_impl.m_ptr;
  self->m_service.m_impl.m_ptr = 0;
  if (m_ptr)
  {
    if (atomic_fetch_add((atomic_uint *volatile)m_ptr, 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, m_ptr);
      WTF::fastFree((WTF *)m_ptr, (void *)a2);
    }
  }
}

- (id).cxx_construct
{
  *((void *)self + 15) = 0;
  return self;
}

@end