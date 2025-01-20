@interface _WKSystemPreviewDataTaskDelegate
- (BOOL)isValidFileExtension:(id)a3;
- (BOOL)isValidMIMEType:(id)a3;
- (_WKSystemPreviewDataTaskDelegate)initWithSystemPreviewController:(void *)a3;
- (id).cxx_construct;
- (void)completeLoad;
- (void)dataTask:(id)a3 didCompleteWithError:(id)a4;
- (void)dataTask:(id)a3 didReceiveData:(id)a4;
- (void)dataTask:(id)a3 didReceiveResponse:(id)a4 decisionHandler:(id)a5;
@end

@implementation _WKSystemPreviewDataTaskDelegate

- (_WKSystemPreviewDataTaskDelegate)initWithSystemPreviewController:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_WKSystemPreviewDataTaskDelegate;
  result = [(_WKSystemPreviewDataTaskDelegate *)&v5 init];
  if (result)
  {
    result->_previewController = a3;
    result->_fileHandle = -1;
  }
  return result;
}

- (BOOL)isValidMIMEType:(id)a3
{
  MEMORY[0x19972EAD0](&v9, a3);
  if (WebCore::MIMETypeRegistry::isUSDMIMEType((WebCore::MIMETypeRegistry *)&v9, v4)) {
    char v6 = 1;
  }
  else {
    char v6 = [a3 isEqualToString:@"application/octet-stream"];
  }
  v7 = v9;
  v9 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2) {
      WTF::StringImpl::destroy(v7, v5);
    }
    else {
      *(_DWORD *)v7 -= 2;
    }
  }
  return v6;
}

- (BOOL)isValidFileExtension:(id)a3
{
  MEMORY[0x19972EAD0](&v9, a3);
  WebCore::MIMETypeRegistry::mimeTypeForExtension();
  char isUSDMIMEType = WebCore::MIMETypeRegistry::isUSDMIMEType((WebCore::MIMETypeRegistry *)&v10, v3);
  char v6 = v10;
  v10 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy(v6, v4);
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
  v7 = v9;
  v9 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2) {
      WTF::StringImpl::destroy(v7, v4);
    }
    else {
      *(_DWORD *)v7 -= 2;
    }
  }
  return isUSDMIMEType;
}

- (void)dataTask:(id)a3 didReceiveResponse:(id)a4 decisionHandler:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend(MEMORY[0x1E4F18D40], "isErrorStatusCode:", objc_msgSend(a4, "statusCode")))
  {
    v8 = qword_1EB358640;
    if (os_log_type_enabled((os_log_t)qword_1EB358640, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = [a4 statusCode];
      _os_log_impl(&dword_1985F2000, v8, OS_LOG_TYPE_DEFAULT, "cancelling subresource load due to error status code: %ld", buf, 0xCu);
    }
LABEL_5:
    (*((void (**)(id, void))a5 + 2))(a5, 0);
    WebKit::SystemPreviewController::loadFailed((WebKit::SystemPreviewController *)self->_previewController);
    return;
  }
  if (!-[_WKSystemPreviewDataTaskDelegate isValidMIMEType:](self, "isValidMIMEType:", [a4 MIMEType])
    && !-[_WKSystemPreviewDataTaskDelegate isValidFileExtension:](self, "isValidFileExtension:", objc_msgSend((id)objc_msgSend(a4, "URL"), "pathExtension")))
  {
    v20 = qword_1EB358640;
    if (os_log_type_enabled((os_log_t)qword_1EB358640, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = [a4 MIMEType];
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = objc_msgSend((id)objc_msgSend(a4, "URL"), "pathExtension");
      _os_log_impl(&dword_1985F2000, v20, OS_LOG_TYPE_DEFAULT, "cancelling subresource load due to unhandled MIME type: \"%@\" extension: \"%@\"", buf, 0x16u);
    }
    goto LABEL_5;
  }
  uint64_t v9 = [a4 expectedContentLength];
  if (v9 == -1) {
    int64_t v10 = 0;
  }
  else {
    int64_t v10 = v9;
  }
  self->_expectedContentLength = v10;
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:self->_expectedContentLength];
  m_ptr = self->_data.m_ptr;
  self->_data.m_ptr = v11;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  objc_msgSend((id)objc_msgSend(a4, "MIMEType"), "isEqualToString:", @"model/vnd.reality");
  WTF::FileSystemImpl::openTemporaryFile();
  WTF::String::operator=((uint64_t *)&self->_filePath, &v23);
  self->_fileHandle = v24;
  previewController = self->_previewController;
  WTF::URL::fileURLWithFileSystemPath();
  v14 = qword_1EB358640;
  if (os_log_type_enabled((os_log_t)qword_1EB358640, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = previewController[12];
    *(_DWORD *)v27 = 134217984;
    uint64_t v28 = v15;
    _os_log_impl(&dword_1985F2000, v14, OS_LOG_TYPE_DEFAULT, "SystemPreview load has started on %lld", v27, 0xCu);
  }
  WTF::String::operator=(previewController + 23, (WTF::StringImpl **)buf);
  long long v17 = v26;
  *((_OWORD *)previewController + 12) = *(_OWORD *)&buf[8];
  *((_OWORD *)previewController + 13) = v17;
  uint64_t v18 = previewController[28];
  if (v18 && *(_DWORD *)(v18 + 4)) {
    WTF::URL::setFragmentIdentifier();
  }
  *((unsigned char *)previewController + 8) = 2;
  v19 = *(WTF::StringImpl **)buf;
  *(void *)buf = 0;
  if (v19)
  {
    if (*(_DWORD *)v19 == 2) {
      WTF::StringImpl::destroy(v19, v16);
    }
    else {
      *(_DWORD *)v19 -= 2;
    }
  }
  (*((void (**)(id, uint64_t))a5 + 2))(a5, 1);
  v22 = v23;
  v23 = 0;
  if (v22)
  {
    if (*(_DWORD *)v22 == 2) {
      WTF::StringImpl::destroy(v22, v21);
    }
    else {
      *(_DWORD *)v22 -= 2;
    }
  }
}

- (void)dataTask:(id)a3 didReceiveData:(id)a4
{
  [self->_data.m_ptr appendData:a4];
  if (self->_expectedContentLength)
  {
    previewController = self->_previewController;
    unint64_t v6 = [self->_data.m_ptr length];
    v8 = (void *)previewController[31];
    if (v8)
    {
      *(float *)&double v7 = (float)v6 / (float)self->_expectedContentLength;
      [v8 setProgress:v7];
    }
  }
}

- (void)dataTask:(id)a3 didCompleteWithError:(id)a4
{
  if (a4)
  {
    WTF::FileSystemImpl::closeFile((WTF::FileSystemImpl *)&self->_fileHandle, (int *)a2);
    previewController = (WebKit::SystemPreviewController *)self->_previewController;
    WebKit::SystemPreviewController::loadFailed(previewController);
  }
  else
  {
    [(_WKSystemPreviewDataTaskDelegate *)self completeLoad];
  }
}

- (void)completeLoad
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  p_fileHandle = &self->_fileHandle;
  m_ptr = self->_data.m_ptr;
  if (m_ptr)
  {
    [self->_data.m_ptr bytes];
    [m_ptr length];
  }
  uint64_t v5 = WTF::FileSystemImpl::writeToFile();
  WTF::FileSystemImpl::closeFile((WTF::FileSystemImpl *)p_fileHandle, v6);
  uint64_t v7 = [self->_data.m_ptr length];
  previewController = self->_previewController;
  if (v5 == v7)
  {
    WTF::URL::fileURLWithFileSystemPath();
    uint64_t v9 = qword_1EB358640;
    if (os_log_type_enabled((os_log_t)qword_1EB358640, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = previewController[12];
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v10;
      _os_log_impl(&dword_1985F2000, v9, OS_LOG_TYPE_DEFAULT, "SystemPreview load has finished on %lld", buf, 0xCu);
    }
    v11 = (void *)previewController[31];
    if (v11)
    {
      v12 = (_DWORD *)previewController[23];
      if (v12) {
        *v12 += 2;
      }
      *(void *)buf = v12;
      long long v13 = *((_OWORD *)previewController + 13);
      *(_OWORD *)&buf[8] = *((_OWORD *)previewController + 12);
      long long v20 = v13;
      [v11 finish:buf];
      uint64_t v15 = *(WTF::StringImpl **)buf;
      *(void *)buf = 0;
      if (v15)
      {
        if (*(_DWORD *)v15 == 2) {
          WTF::StringImpl::destroy(v15, v14);
        }
        else {
          *(_DWORD *)v15 -= 2;
        }
      }
    }
    *((unsigned char *)previewController + 8) = 3;
    WebKit::SystemPreviewController::releaseActivityTokenIfNecessary((WebKit::ProcessThrottlerActivity *)previewController);
    if (previewController[34]) {
      WTF::CompletionHandler<void ()(BOOL)>::operator()(previewController + 34);
    }
    if (v18)
    {
      if (*(_DWORD *)v18 == 2) {
        WTF::StringImpl::destroy(v18, v17);
      }
      else {
        *(_DWORD *)v18 -= 2;
      }
    }
  }
  else
  {
    v16 = (WebKit::SystemPreviewController *)self->_previewController;
    WebKit::SystemPreviewController::loadFailed(v16);
  }
}

- (void).cxx_destruct
{
  m_ptr = self->_filePath.m_impl.m_ptr;
  self->_filePath.m_impl.m_ptr = 0;
  if (m_ptr)
  {
    if (*(_DWORD *)m_ptr == 2) {
      WTF::StringImpl::destroy((WTF::StringImpl *)m_ptr, (WTF::StringImpl *)a2);
    }
    else {
      *(_DWORD *)m_ptr -= 2;
    }
  }
  v4 = self->_data.m_ptr;
  self->_data.m_ptr = 0;
  if (v4)
  {
    CFRelease(v4);
  }
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 5) = 0;
  return self;
}

@end