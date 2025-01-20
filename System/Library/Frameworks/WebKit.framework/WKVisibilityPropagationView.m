@interface WKVisibilityPropagationView
- (BOOL)_containsInteractionForProcess:(void *)a3;
- (id).cxx_construct;
- (void)propagateVisibilityToProcess:(void *)a3;
- (void)stopPropagatingVisibilityToProcess:(void *)a3;
@end

@implementation WKVisibilityPropagationView

- (id).cxx_construct
{
  *((void *)self + 51) = 0;
  *((void *)self + 52) = 0;
  return self;
}

- (void)propagateVisibilityToProcess:(void *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (!-[WKVisibilityPropagationView _containsInteractionForProcess:](self, "_containsInteractionForProcess:"))
  {
    uint64_t v5 = *((void *)a3 + 17);
    if (v5)
    {
      std::__optional_copy_base<WebKit::ExtensionProcess,false>::__optional_copy_base[abi:sn180100](v24, v5 + 40);
      if (v26)
      {
        WebKit::ExtensionProcess::createVisibilityPropagationInteraction((WebKit::ExtensionProcess *)v24, &v23);
        v6 = v23;
        if (v23)
        {
          [(WKVisibilityPropagationView *)self addInteraction:v23];
          v7 = qword_1EB358960;
          if (os_log_type_enabled((os_log_t)qword_1EB358960, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v8 = *((void *)a3 + 17);
            if (v8) {
              LODWORD(v8) = *(_DWORD *)(v8 + 108);
            }
            *(_DWORD *)buf = 138412546;
            v28 = v6;
            __int16 v29 = 1024;
            int v30 = v8;
            _os_log_impl(&dword_1985F2000, v7, OS_LOG_TYPE_DEFAULT, "Created visibility propagation interaction %@ for process with PID=%d", buf, 0x12u);
          }
          WTF::WeakPtrFactory<WebPushD::PushServiceConnection,WTF::DefaultWeakPtrImpl>::initializeIfNeeded((unsigned int *)a3 + 2, (uint64_t)a3);
          v9 = (atomic_uint *)*((void *)a3 + 1);
          if (!v9 || (char v10 = 1, atomic_fetch_add(v9, 1u), (v6 = v23) != 0))
          {
            CFRetain(v6);
            char v10 = 0;
          }
          p_processesAndInteractions = &self->_processesAndInteractions;
          unint64_t m_size = self->_processesAndInteractions.m_size;
          if (m_size == self->_processesAndInteractions.m_capacity)
          {
            unint64_t v13 = m_size + (m_size >> 2);
            if (v13 >= 0x10) {
              unint64_t v14 = v13 + 1;
            }
            else {
              unint64_t v14 = 16;
            }
            if (v14 <= m_size + 1) {
              unint64_t v15 = m_size + 1;
            }
            else {
              unint64_t v15 = v14;
            }
            if (v15 >> 28)
            {
              __break(0xC471u);
              return;
            }
            m_buffer = (unsigned int *)p_processesAndInteractions->m_buffer;
            v17 = (unsigned int **)WTF::fastMalloc((WTF *)(16 * v15));
            p_processesAndInteractions->m_capacity = v15;
            p_processesAndInteractions->m_buffer = v17;
            WTF::VectorMover<false,std::pair<WTF::WeakPtr<WebKit::AuxiliaryProcessProxy,WTF::DefaultWeakPtrImpl,WTF::RawPtrTraits<WTF::DefaultWeakPtrImpl>>,WTF::RetainPtr<objc_object  {objcproto13UIInteraction}*>>>::move(m_buffer, &m_buffer[4 * m_size], v17);
            if (m_buffer)
            {
              if (p_processesAndInteractions->m_buffer == m_buffer)
              {
                p_processesAndInteractions->m_buffer = 0;
                p_processesAndInteractions->m_capacity = 0;
              }
              WTF::fastFree((WTF *)m_buffer, v18);
            }
            uint64_t v19 = p_processesAndInteractions->m_size;
            v20 = (atomic_uint **)((char *)p_processesAndInteractions->m_buffer + 16 * v19);
            *v20 = v9;
            v20[1] = (atomic_uint *)v6;
            unsigned int v21 = v19 + 1;
          }
          else
          {
            v22 = (atomic_uint **)((char *)p_processesAndInteractions->m_buffer + 16 * m_size);
            *v22 = v9;
            v22[1] = (atomic_uint *)v6;
            unsigned int v21 = m_size + 1;
          }
          p_processesAndInteractions->unint64_t m_size = v21;
          v23 = 0;
          if ((v10 & 1) == 0) {
            CFRelease(v6);
          }
        }
        if (v26)
        {
          if (v25 != -1) {
            ((void (*)(uint8_t *, unsigned char *))off_1EE9D46A8[v25])(buf, v24);
          }
        }
      }
    }
  }
}

- (BOOL)_containsInteractionForProcess:(void *)a3
{
  uint64_t m_size = self->_processesAndInteractions.m_size;
  if (!m_size) {
    return 0;
  }
  for (i = (char *)self->_processesAndInteractions.m_buffer; !*(void *)i || *(void **)(*(void *)i + 8) != a3; i += 16)
  {
    if (!--m_size) {
      return 0;
    }
  }
  return 1;
}

- (void)stopPropagatingVisibilityToProcess:(void *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  p_processesAndInteractions = &self->_processesAndInteractions;
  m_buffer = (unsigned int *)self->_processesAndInteractions.m_buffer;
  uint64_t m_size = self->_processesAndInteractions.m_size;
  v7 = (unsigned int **)&m_buffer[4 * m_size];
  if (m_size)
  {
    int v10 = 0;
    *(void *)&long long v3 = 134217984;
    long long v23 = v3;
    v11 = (char *)self->_processesAndInteractions.m_buffer;
    v12 = &m_buffer[4 * m_size];
    unint64_t v13 = (unsigned int **)v12;
    do
    {
      if (!*(void *)m_buffer
        || ((unint64_t v14 = *(void **)(*(void *)m_buffer + 8)) != 0 ? (v15 = v14 == a3) : (v15 = 1), v15))
      {
        v16 = qword_1EB358960;
        if (os_log_type_enabled((os_log_t)qword_1EB358960, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v17 = *((void *)m_buffer + 1);
          *(_DWORD *)buf = v23;
          uint64_t v25 = v17;
          _os_log_impl(&dword_1985F2000, v16, OS_LOG_TYPE_DEFAULT, "Removing visibility propagation interaction %p", buf, 0xCu);
        }
        -[WKVisibilityPropagationView removeInteraction:](self, "removeInteraction:", *((void *)m_buffer + 1), v23);
        uint64_t v19 = (unsigned int **)m_buffer;
        if (v13 != (unsigned int **)p_processesAndInteractions->m_buffer + 2 * p_processesAndInteractions->m_size)
        {
          if (m_buffer == v12)
          {
            uint64_t v19 = v13;
          }
          else
          {
            WTF::VectorMover<false,std::pair<WTF::WeakPtr<WebKit::AuxiliaryProcessProxy,WTF::DefaultWeakPtrImpl,WTF::RawPtrTraits<WTF::DefaultWeakPtrImpl>>,WTF::RetainPtr<objc_object  {objcproto13UIInteraction}*>>>::moveOverlapping(v12, m_buffer, v13);
            uint64_t v19 = (unsigned int **)((char *)v13 + v11 - (char *)v12);
          }
        }
        v20 = (const void *)*((void *)m_buffer + 1);
        *((void *)m_buffer + 1) = 0;
        if (v20) {
          CFRelease(v20);
        }
        unsigned int v21 = *(unsigned int **)m_buffer;
        *(void *)m_buffer = 0;
        if (v21 && atomic_fetch_add((atomic_uint *volatile)v21, 0xFFFFFFFF) == 1)
        {
          atomic_store(1u, v21);
          WTF::fastFree((WTF *)v21, v18);
        }
        v12 = m_buffer + 4;
        ++v10;
        unint64_t v13 = v19;
      }
      else
      {
        uint64_t v19 = v13;
      }
      m_buffer += 4;
      v11 += 16;
    }
    while (m_buffer < (unsigned int *)v7);
    m_buffer = (unsigned int *)p_processesAndInteractions->m_buffer;
    LODWORD(m_size) = p_processesAndInteractions->m_size;
    v7 = v19;
  }
  else
  {
    int v10 = 0;
    v12 = &m_buffer[4 * m_size];
  }
  v22 = &m_buffer[4 * m_size];
  if (v12 != v22)
  {
    WTF::VectorMover<false,std::pair<WTF::WeakPtr<WebKit::AuxiliaryProcessProxy,WTF::DefaultWeakPtrImpl,WTF::RawPtrTraits<WTF::DefaultWeakPtrImpl>>,WTF::RetainPtr<objc_object  {objcproto13UIInteraction}*>>>::moveOverlapping(v12, v22, v7);
    LODWORD(m_size) = p_processesAndInteractions->m_size;
  }
  p_processesAndInteractions->uint64_t m_size = m_size - v10;
}

- (void).cxx_destruct
{
  p_processesAndInteractions = &self->_processesAndInteractions;
  uint64_t m_size = self->_processesAndInteractions.m_size;
  if (m_size)
  {
    uint64_t v4 = 16 * m_size;
    uint64_t v5 = (const void **)((char *)p_processesAndInteractions->m_buffer + 8);
    do
    {
      v6 = *v5;
      *uint64_t v5 = 0;
      if (v6) {
        CFRelease(v6);
      }
      v7 = (unsigned int *)*(v5 - 1);
      *(v5 - 1) = 0;
      if (v7 && atomic_fetch_add((atomic_uint *volatile)v7, 0xFFFFFFFF) == 1)
      {
        atomic_store(1u, v7);
        WTF::fastFree((WTF *)v7, (void *)a2);
      }
      v5 += 2;
      v4 -= 16;
    }
    while (v4);
  }
  m_buffer = (WTF *)p_processesAndInteractions->m_buffer;
  if (p_processesAndInteractions->m_buffer)
  {
    p_processesAndInteractions->m_buffer = 0;
    p_processesAndInteractions->m_capacity = 0;
    WTF::fastFree(m_buffer, (void *)a2);
  }
}

@end