@interface WKDragSessionContext
- (id).cxx_construct;
- (void)addTemporaryDirectory:(id)a3;
- (void)cleanUpTemporaryDirectories;
@end

@implementation WKDragSessionContext

- (void)addTemporaryDirectory:(id)a3
{
  m_ptr = self->_temporaryDirectories.m_ptr;
  if (!m_ptr)
  {
    m_ptr = objc_opt_new();
    v6 = self->_temporaryDirectories.m_ptr;
    self->_temporaryDirectories.m_ptr = m_ptr;
    if (v6)
    {
      CFRelease(v6);
      m_ptr = self->_temporaryDirectories.m_ptr;
    }
  }

  [m_ptr addObject:a3];
}

- (void)cleanUpTemporaryDirectories
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  m_ptr = self->_temporaryDirectories.m_ptr;
  uint64_t v3 = [m_ptr countByEnumeratingWithState:&v12 objects:v20 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(m_ptr);
        }
        uint64_t v7 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v11 = 0;
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "removeItemAtPath:error:", v7, &v11);
        v8 = qword_1EB357DA8;
        if (os_log_type_enabled((os_log_t)qword_1EB357DA8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v17 = v7;
          __int16 v18 = 2112;
          uint64_t v19 = v11;
          _os_log_impl(&dword_1985F2000, v8, OS_LOG_TYPE_DEFAULT, "Removed temporary download directory: %@ with error: %@", buf, 0x16u);
        }
      }
      uint64_t v4 = [m_ptr countByEnumeratingWithState:&v12 objects:v20 count:16];
    }
    while (v4);
  }
  v9 = self->_temporaryDirectories.m_ptr;
  self->_temporaryDirectories.m_ptr = 0;
  if (v9) {
    CFRelease(v9);
  }
}

- (void).cxx_destruct
{
  m_ptr = self->_temporaryDirectories.m_ptr;
  self->_temporaryDirectories.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end