@interface LibcoreNetUrlFileURLConnection
+ (const)__metadata;
- (LibcoreNetUrlFileURLConnection)initWithJavaNetURL:(id)a3;
- (id)getContentType;
- (id)getDirectoryListingWithJavaIoFile:(id)a3;
- (id)getInputStream;
- (id)getPermission;
- (int)getContentLength;
- (int64_t)getContentLengthLong;
- (void)connect;
- (void)dealloc;
@end

@implementation LibcoreNetUrlFileURLConnection

- (LibcoreNetUrlFileURLConnection)initWithJavaNetURL:(id)a3
{
  return self;
}

- (void)connect
{
  v3 = new_JavaIoFile_initWithNSString_(self->filename_);
  if ([(JavaIoFile *)v3 isDirectory])
  {
    self->isDir_ = 1;
    v4 = sub_1001B3A18(v3);
    JreStrongAssign((id *)&self->is_, v4);
  }
  else
  {
    v5 = new_JavaIoFileInputStream_initWithJavaIoFile_(v3);
    v6 = new_JavaIoBufferedInputStream_initWithJavaIoInputStream_(v5);
    JreStrongAssignAndConsume((id *)&self->is_, v6);
    self->length_ = [(JavaIoFile *)v3 length];
  }
  self->super.connected_ = 1;
}

- (int)getContentLength
{
  uint64_t v2 = [(LibcoreNetUrlFileURLConnection *)self getContentLengthLong];
  if (v2 >= 0x80000000) {
    LODWORD(v2) = -1;
  }
  return v2;
}

- (int64_t)getContentLengthLong
{
  if (!self->super.connected_) {
    [(LibcoreNetUrlFileURLConnection *)self connect];
  }
  return self->length_;
}

- (id)getContentType
{
  if (!self->super.connected_) {
    [(LibcoreNetUrlFileURLConnection *)self connect];
  }
  if (self->isDir_) {
    return @"text/plain";
  }
  url = self->super.url_;
  if (!url) {
    JreThrowNullPointerException();
  }
  id result = JavaNetURLConnection_guessContentTypeFromNameWithNSString_((uint64_t)[(JavaNetURL *)url getFile]);
  if (!result)
  {
    id result = (id)JavaNetURLConnection_guessContentTypeFromStreamWithJavaIoInputStream_(self->is_);
    if (!result) {
      return @"content/unknown";
    }
  }
  return result;
}

- (id)getDirectoryListingWithJavaIoFile:(id)a3
{
  return sub_1001B3A18(a3);
}

- (id)getInputStream
{
  if (!self->super.connected_) {
    [(LibcoreNetUrlFileURLConnection *)self connect];
  }
  return self->is_;
}

- (id)getPermission
{
  p_permission = &self->permission_;
  permission = self->permission_;
  if (!permission)
  {
    filename = self->filename_;
    if ((atomic_load_explicit(JavaIoFile__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    if (JavaIoFile_separatorChar_ != 47)
    {
      if (!filename) {
        JreThrowNullPointerException();
      }
      if ((atomic_load_explicit(JavaIoFile__initialized, memory_order_acquire) & 1) == 0) {
        objc_opt_class();
      }
      [(NSString *)filename replace:47 withChar:(unsigned __int16)JavaIoFile_separatorChar_];
    }
    v5 = new_JavaIoFilePermission_initWithNSString_withNSString_();
    JreStrongAssignAndConsume((id *)p_permission, v5);
    return *p_permission;
  }
  return permission;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)LibcoreNetUrlFileURLConnection;
  [(JavaNetURLConnection *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10041ADC8;
}

@end