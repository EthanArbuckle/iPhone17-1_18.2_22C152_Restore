@interface _WKAttachmentInfo
- (BOOL)shouldPreserveFidelity;
- (NSData)data;
- (NSFileWrapper)fileWrapper;
- (NSString)contentType;
- (NSString)filePath;
- (NSString)name;
- (_WKAttachmentInfo)initWithAttachment:(const void *)a3;
- (id).cxx_construct;
- (uint64_t)data;
- (uint64_t)fileWrapper;
- (uint64_t)name;
@end

@implementation _WKAttachmentInfo

- (_WKAttachmentInfo)initWithAttachment:(const void *)a3
{
  v21.receiver = self;
  v21.super_class = (Class)_WKAttachmentInfo;
  v4 = [(_WKAttachmentInfo *)&v21 init];
  if (!v4) {
    return v4;
  }
  CFRetain(*((CFTypeRef *)a3 + 1));
  m_ptr = v4->_attachment.m_ptr;
  v4->_attachment.m_ptr = (Attachment *)a3;
  if (m_ptr) {
    CFRelease(*((CFTypeRef *)m_ptr + 1));
  }
  if (*((void *)a3 + 5))
  {
    v6 = (__CFString *)WTF::StringImpl::operator NSString *();
    p_m_ptr = (const void **)&v4->_filePath.m_ptr;
    if (!v6) {
      goto LABEL_7;
    }
  }
  else
  {
    p_m_ptr = (const void **)&v4->_filePath.m_ptr;
    v6 = &stru_1EEA10550;
  }
  CFRetain(v6);
LABEL_7:
  v8 = *p_m_ptr;
  *p_m_ptr = v6;
  if (v8) {
    CFRelease(v8);
  }
  API::Attachment::mimeType((API::Attachment *)a3, &v20);
  if (v20)
  {
    v10 = (__CFString *)WTF::StringImpl::operator NSString *();
    v11 = (const void **)&v4->_mimeType.m_ptr;
    if (!v10) {
      goto LABEL_12;
    }
  }
  else
  {
    v11 = (const void **)&v4->_mimeType.m_ptr;
    v10 = &stru_1EEA10550;
  }
  CFRetain(v10);
LABEL_12:
  v12 = *v11;
  *v11 = v10;
  if (v12) {
    CFRelease(v12);
  }
  v13 = v20;
  v20 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2) {
      WTF::StringImpl::destroy(v13, v9);
    }
    else {
      *(_DWORD *)v13 -= 2;
    }
  }
  API::Attachment::utiType((API::Attachment *)a3, &v20);
  if (!v20)
  {
    v16 = (const void **)&v4->_utiType.m_ptr;
    v15 = &stru_1EEA10550;
    goto LABEL_20;
  }
  v15 = (__CFString *)WTF::StringImpl::operator NSString *();
  v16 = (const void **)&v4->_utiType.m_ptr;
  if (v15) {
LABEL_20:
  }
    CFRetain(v15);
  v17 = *v16;
  *v16 = v15;
  if (v17) {
    CFRelease(v17);
  }
  v18 = v20;
  v20 = 0;
  if (v18)
  {
    if (*(_DWORD *)v18 == 2) {
      WTF::StringImpl::destroy(v18, v14);
    }
    else {
      *(_DWORD *)v18 -= 2;
    }
  }
  return v4;
}

- (NSData)data
{
  v6 = 0;
  m_ptr = self->_attachment.m_ptr;
  v3 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v3 = &unk_1EE9C8F20;
  v3[1] = &v6;
  v5 = v3;
  API::Attachment::doWithFileWrapper((uint64_t)m_ptr, &v5);
  (*(void (**)(void *))(*v3 + 8))(v3);
  return v6;
}

- (NSString)name
{
  v6 = 0;
  m_ptr = self->_attachment.m_ptr;
  v3 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v3 = &unk_1EE9C8F48;
  v3[1] = &v6;
  v5 = v3;
  API::Attachment::doWithFileWrapper((uint64_t)m_ptr, &v5);
  (*(void (**)(void *))(*v3 + 8))(v3);
  return v6;
}

- (NSString)filePath
{
  return (NSString *)self->_filePath.m_ptr;
}

- (NSFileWrapper)fileWrapper
{
  v6 = 0;
  m_ptr = self->_attachment.m_ptr;
  v3 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v3 = &unk_1EE9C8F70;
  v3[1] = &v6;
  v5 = v3;
  API::Attachment::doWithFileWrapper((uint64_t)m_ptr, &v5);
  (*(void (**)(void *))(*v3 + 8))(v3);
  return v6;
}

- (NSString)contentType
{
  uint64_t v3 = [self->_mimeType.m_ptr length];
  uint64_t v4 = 16;
  if (!v3) {
    uint64_t v4 = 24;
  }
  return *(NSString **)((char *)&self->super.isa + v4);
}

- (BOOL)shouldPreserveFidelity
{
  return *((unsigned char *)self->_attachment.m_ptr + 65) == 2;
}

- (void).cxx_destruct
{
  m_ptr = self->_filePath.m_ptr;
  self->_filePath.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  uint64_t v4 = self->_utiType.m_ptr;
  self->_utiType.m_ptr = 0;
  if (v4) {
    CFRelease(v4);
  }
  v5 = self->_mimeType.m_ptr;
  self->_mimeType.m_ptr = 0;
  if (v5) {
    CFRelease(v5);
  }
  v6 = self->_attachment.m_ptr;
  self->_attachment.m_ptr = 0;
  if (v6)
  {
    v7 = (const void *)*((void *)v6 + 1);
    CFRelease(v7);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (uint64_t)data
{
  if ([a2 isRegularFile]) {
    uint64_t result = [a2 regularFileContents];
  }
  else {
    uint64_t result = 0;
  }
  **(void **)(a1 + 8) = result;
  return result;
}

- (uint64_t)name
{
  if (objc_msgSend((id)objc_msgSend(a2, "filename"), "length")) {
    uint64_t result = [a2 filename];
  }
  else {
    uint64_t result = [a2 preferredFilename];
  }
  **(void **)(a1 + 8) = result;
  return result;
}

- (uint64_t)fileWrapper
{
  **(void **)(result + 8) = a2;
  return result;
}

@end