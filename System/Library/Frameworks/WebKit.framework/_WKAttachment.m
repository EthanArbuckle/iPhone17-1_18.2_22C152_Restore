@interface _WKAttachment
- (BOOL)isConnected;
- (NSString)description;
- (NSString)uniqueIdentifier;
- (Object)_apiObject;
- (_WKAttachmentInfo)info;
- (uint64_t)setFileWrapper:(const void *)a1 contentType:completion:;
- (uint64_t)setFileWrapper:(uint64_t)a1 contentType:completion:;
- (void)dealloc;
- (void)requestInfo:(id)a3;
- (void)setData:(id)a3 newContentType:(id)a4;
- (void)setData:(id)a3 newContentType:(id)a4 newFilename:(id)a5 completion:(id)a6;
- (void)setFileWrapper:(id)a3 contentType:(id)a4 completion:(id)a5;
@end

@implementation _WKAttachment

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    API::Attachment::~Attachment((API::Attachment *)&self->_attachment, v4);
    v5.receiver = self;
    v5.super_class = (Class)_WKAttachment;
    [(_WKAttachment *)&v5 dealloc];
  }
}

- (Object)_apiObject
{
  return (Object *)&self->_attachment;
}

- (_WKAttachmentInfo)info
{
  uint64_t v2 = *(void *)self[1]._attachment.data.__lx;
  if (!v2 || !*(void *)(v2 + 8)) {
    return 0;
  }
  v3 = (void *)CFMakeCollectable([[_WKAttachmentInfo alloc] initWithAttachment:&self->_attachment]);

  return (_WKAttachmentInfo *)v3;
}

- (void)requestInfo:(id)a3
{
  v4 = [(_WKAttachment *)self info];
  objc_super v5 = (void (*)(id, _WKAttachmentInfo *, void))*((void *)a3 + 2);

  v5(a3, v4, 0);
}

- (void)setFileWrapper:(id)a3 contentType:(id)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)self[1]._attachment.data.__lx;
  if (v6 && *(void *)(v6 + 8))
  {
    v18 = 0;
    WTF::String::operator=((uint64_t *)&self->_attachment.data.__lx[40], &v18);
    p_attachment = &self->_attachment;
    v12 = v18;
    v18 = 0;
    if (v12)
    {
      if (*(_DWORD *)v12 == 2) {
        WTF::StringImpl::destroy(v12, v10);
      }
      else {
        *(_DWORD *)v12 -= 2;
      }
    }
    API::Attachment::setFileWrapperAndUpdateContentType((API::Attachment *)p_attachment, (NSFileWrapper *)a3, (__CFString *)a4);
    v15 = _Block_copy(a5);
    v16 = (WTF::StringImpl *)WTF::fastMalloc((WTF *)0x10);
    *(void *)v16 = &unk_1EE9C8F98;
    *((void *)v16 + 1) = v15;
    v18 = v16;
    API::Attachment::updateAttributes((API::Attachment *)p_attachment, (uint64_t *)&v18);
    v17 = v18;
    v18 = 0;
    if (v17) {
      (*(void (**)(WTF::StringImpl *))(*(void *)v17 + 8))(v17);
    }
    _Block_release(0);
  }
  else if (a5)
  {
    uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WKErrorDomain" code:2 userInfo:0];
    v14 = (void (*)(id, uint64_t))*((void *)a5 + 2);
    v14(a5, v13);
  }
}

- (void)setData:(id)a3 newContentType:(id)a4
{
  uint64_t v6 = (const void *)[objc_alloc(MEMORY[0x1E4F28CF0]) initRegularFileWithContents:a3];
  [(_WKAttachment *)self setFileWrapper:v6 contentType:a4 completion:0];
  if (v6)
  {
    CFRelease(v6);
  }
}

- (void)setData:(id)a3 newContentType:(id)a4 newFilename:(id)a5 completion:(id)a6
{
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F28CF0]) initRegularFileWithContents:a3];
  v11 = v10;
  if (a5) {
    [v10 setPreferredFilename:a5];
  }
  [(_WKAttachment *)self setFileWrapper:v11 contentType:a4 completion:a6];
  if (v11)
  {
    CFRelease(v11);
  }
}

- (NSString)uniqueIdentifier
{
  if (*(void *)&self->_attachment.data.__lx[32]) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  else {
    return (NSString *)&stru_1EEA10550;
  }
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@ %p id='%@'>", objc_opt_class(), self, -[_WKAttachment uniqueIdentifier](self, "uniqueIdentifier")];
}

- (BOOL)isConnected
{
  return self[1]._attachment.data.__lx[8] == 1;
}

- (uint64_t)setFileWrapper:(uint64_t)a1 contentType:completion:
{
  uint64_t result = *(void *)(a1 + 8);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (uint64_t)setFileWrapper:(const void *)a1 contentType:completion:
{
  *a1 = &unk_1EE9C8F98;
  _Block_release(a1[1]);

  return WTF::fastFree((WTF *)a1, v2);
}

@end