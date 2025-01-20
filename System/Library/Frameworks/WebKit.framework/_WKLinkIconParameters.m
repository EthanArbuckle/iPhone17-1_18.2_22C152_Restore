@interface _WKLinkIconParameters
- (NSDictionary)attributes;
- (NSNumber)size;
- (NSString)mimeType;
- (NSURL)url;
- (id).cxx_construct;
- (id)_initWithLinkIcon:(const void *)a3;
- (int64_t)iconType;
@end

@implementation _WKLinkIconParameters

- (id)_initWithLinkIcon:(const void *)a3
{
  v27.receiver = self;
  v27.super_class = (Class)_WKLinkIconParameters;
  v4 = [(_WKLinkIconParameters *)&v27 init];
  if (!v4) {
    return v4;
  }
  v5 = (void *)WTF::URL::operator NSURL *();
  v6 = v5;
  if (v5) {
    CFRetain(v5);
  }
  m_ptr = v4->_url.m_ptr;
  v4->_url.m_ptr = v6;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  if (*((void *)a3 + 6))
  {
    v8 = (__CFString *)WTF::StringImpl::operator NSString *();
    p_m_ptr = (const void **)&v4->_mimeType.m_ptr;
    if (!v8) {
      goto LABEL_9;
    }
  }
  else
  {
    p_m_ptr = (const void **)&v4->_mimeType.m_ptr;
    v8 = &stru_1EEA10550;
  }
  CFRetain(v8);
LABEL_9:
  v10 = *p_m_ptr;
  *p_m_ptr = v8;
  if (v10) {
    CFRelease(v10);
  }
  if (!*((unsigned char *)a3 + 60))
  {
LABEL_15:
    int v14 = *((unsigned __int8 *)a3 + 40);
    switch(v14)
    {
      case 1:
        uint64_t v15 = 0;
        break;
      case 4:
        uint64_t v15 = 2;
        break;
      case 2:
        uint64_t v15 = 1;
        break;
      default:
LABEL_22:
        uint64_t v16 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:*((unsigned int *)a3 + 19)];
        v17 = v4->_attributes.m_ptr;
        v4->_attributes.m_ptr = (void *)v16;
        if (v17) {
          CFRelease(v17);
        }
        uint64_t v18 = *((unsigned int *)a3 + 19);
        if (v18)
        {
          uint64_t v19 = 16 * v18;
          v20 = (void *)(*((void *)a3 + 8) + 8);
          do
          {
            if (*v20) {
              v21 = (__CFString *)WTF::StringImpl::operator NSString *();
            }
            else {
              v21 = &stru_1EEA10550;
            }
            v22 = v4->_attributes.m_ptr;
            if (*(v20 - 1)) {
              v23 = (__CFString *)WTF::StringImpl::operator NSString *();
            }
            else {
              v23 = &stru_1EEA10550;
            }
            [v22 setObject:v21 forKeyedSubscript:v23];
            v20 += 2;
            v19 -= 16;
          }
          while (v19);
        }
        return v4;
    }
    v4->_iconType = v15;
    goto LABEL_22;
  }
  id v11 = objc_alloc(NSNumber);
  if (*((unsigned char *)a3 + 60))
  {
    uint64_t v12 = [v11 initWithUnsignedInt:*((unsigned int *)a3 + 14)];
    v13 = v4->_size.m_ptr;
    v4->_size.m_ptr = (void *)v12;
    if (v13) {
      CFRelease(v13);
    }
    goto LABEL_15;
  }
  v25 = (_WKLinkIconParameters *)std::__throw_bad_optional_access[abi:sn180100]();
  return [(_WKLinkIconParameters *)v25 url];
}

- (NSURL)url
{
  return (NSURL *)self->_url.m_ptr;
}

- (NSString)mimeType
{
  return (NSString *)self->_mimeType.m_ptr;
}

- (NSNumber)size
{
  return (NSNumber *)self->_size.m_ptr;
}

- (int64_t)iconType
{
  return self->_iconType;
}

- (NSDictionary)attributes
{
  return (NSDictionary *)self->_attributes.m_ptr;
}

- (void).cxx_destruct
{
  m_ptr = self->_attributes.m_ptr;
  self->_attributes.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  v4 = self->_size.m_ptr;
  self->_size.m_ptr = 0;
  if (v4) {
    CFRelease(v4);
  }
  v5 = self->_mimeType.m_ptr;
  self->_mimeType.m_ptr = 0;
  if (v5) {
    CFRelease(v5);
  }
  v6 = self->_url.m_ptr;
  self->_url.m_ptr = 0;
  if (v6)
  {
    CFRelease(v6);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end