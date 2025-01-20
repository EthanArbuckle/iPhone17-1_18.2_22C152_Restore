@interface JavaNetHttpURLConnection
+ (BOOL)getFollowRedirects;
+ (const)__metadata;
+ (id)__annotations_HTTP_SERVER_ERROR_;
+ (void)initialize;
+ (void)setFollowRedirectsWithBoolean:(BOOL)a3;
- (BOOL)getInstanceFollowRedirects;
- (BOOL)usingProxy;
- (JavaNetHttpURLConnection)initWithJavaNetURL:(id)a3;
- (id)getContentEncoding;
- (id)getErrorStream;
- (id)getPermission;
- (id)getRequestMethod;
- (id)getResponseMessage;
- (int)getResponseCode;
- (int64_t)getHeaderFieldDateWithNSString:(id)a3 withLong:(int64_t)a4;
- (void)dealloc;
- (void)disconnect;
- (void)setChunkedStreamingModeWithInt:(int)a3;
- (void)setFixedLengthStreamingModeWithInt:(int)a3;
- (void)setFixedLengthStreamingModeWithLong:(int64_t)a3;
- (void)setInstanceFollowRedirectsWithBoolean:(BOOL)a3;
- (void)setRequestMethodWithNSString:(id)a3;
@end

@implementation JavaNetHttpURLConnection

- (JavaNetHttpURLConnection)initWithJavaNetURL:(id)a3
{
  return self;
}

- (void)disconnect
{
}

- (id)getErrorStream
{
  return 0;
}

+ (BOOL)getFollowRedirects
{
  if ((atomic_load_explicit(JavaNetHttpURLConnection__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return byte_10055E0C8;
}

- (id)getPermission
{
  url = self->super.url_;
  if (!url) {
    JreThrowNullPointerException();
  }
  [(JavaNetURL *)url getPort];
  id v4 = [(JavaNetURL *)self->super.url_ getHost];
  JreStrcat("$CI", v5, v6, v7, v8, v9, v10, v11, v4);
  v12 = new_JavaNetSocketPermission_initWithNSString_withNSString_();
  return v12;
}

- (id)getRequestMethod
{
  return self->method_;
}

- (int)getResponseCode
{
  [(JavaNetURLConnection *)self getInputStream];
  id v3 = [(JavaNetURLConnection *)self getHeaderFieldWithInt:0];
  if (!v3) {
    return -1;
  }
  id v4 = [v3 trim];
  if (!v4) {
    JreThrowNullPointerException();
  }
  uint64_t v5 = v4;
  unsigned int v6 = [v4 indexOfString:@" "];
  uint64_t v7 = v6 + 1;
  if (v6 == -1) {
    return -1;
  }
  id v9 = (id)(v6 + 4);
  if ((int)v9 > (int)[v5 length]) {
    id v9 = [v5 length];
  }
  id v10 = [v5 substring:v7 endIndex:v9];
  self->responseCode_ = JavaLangInteger_parseIntWithNSString_(v10, v11, v12, v13, v14, v15, v16, v17);
  uint64_t v18 = (v9 + 1);
  if ((int)v18 <= (int)[v5 length]) {
    JreStrongAssign((id *)&self->responseMessage_, [v5 substring:v18]);
  }
  return self->responseCode_;
}

- (id)getResponseMessage
{
  id result = self->responseMessage_;
  if (!result)
  {
    [(JavaNetHttpURLConnection *)self getResponseCode];
    return self->responseMessage_;
  }
  return result;
}

+ (void)setFollowRedirectsWithBoolean:(BOOL)a3
{
  if ((atomic_load_explicit(JavaNetHttpURLConnection__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  byte_10055E0C8 = a3;
}

- (void)setRequestMethodWithNSString:(id)a3
{
  if (self->super.connected_)
  {
    CFStringRef v15 = @"Connection already established";
LABEL_12:
    uint64_t v16 = new_JavaNetProtocolException_initWithNSString_((uint64_t)v15);
    objc_exception_throw(v16);
  }
  if (!qword_1005611E8) {
LABEL_10:
  }
    JreThrowNullPointerException();
  uint64_t v5 = (void **)(qword_1005611E8 + 24);
  unint64_t v6 = qword_1005611E8 + 24 + 8 * *(int *)(qword_1005611E8 + 8);
  do
  {
    if ((unint64_t)v5 >= v6)
    {
      JavaUtilArrays_toStringWithNSObjectArray_(qword_1005611E8);
      CFStringRef v15 = JreStrcat("$$$$", v8, v9, v10, v11, v12, v13, v14, @"Unknown method '");
      goto LABEL_12;
    }
    uint64_t v7 = *v5;
    if (!*v5) {
      goto LABEL_10;
    }
    ++v5;
  }
  while (([v7 isEqual:a3] & 1) == 0);
  JreStrongAssign((id *)&self->method_, v7);
}

- (BOOL)usingProxy
{
  return 0;
}

- (id)getContentEncoding
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNetHttpURLConnection;
  return [(JavaNetURLConnection *)&v3 getContentEncoding];
}

- (BOOL)getInstanceFollowRedirects
{
  return self->instanceFollowRedirects_;
}

- (void)setInstanceFollowRedirectsWithBoolean:(BOOL)a3
{
  self->instanceFollowRedirects_ = a3;
}

- (int64_t)getHeaderFieldDateWithNSString:(id)a3 withLong:(int64_t)a4
{
  v5.receiver = self;
  v5.super_class = (Class)JavaNetHttpURLConnection;
  return [(JavaNetURLConnection *)&v5 getHeaderFieldDateWithNSString:a3 withLong:a4];
}

- (void)setFixedLengthStreamingModeWithLong:(int64_t)a3
{
  if (self->super.connected_)
  {
    CFStringRef v5 = @"Already connected";
LABEL_7:
    unint64_t v6 = new_JavaLangIllegalStateException_initWithNSString_((uint64_t)v5);
    goto LABEL_9;
  }
  if (self->chunkLength_ >= 1)
  {
    CFStringRef v5 = @"Already in chunked mode";
    goto LABEL_7;
  }
  if (a3 < 0)
  {
    unint64_t v6 = new_JavaLangIllegalArgumentException_initWithNSString_(@"contentLength < 0");
LABEL_9:
    objc_exception_throw(v6);
  }
  self->fixedContentLength_ = JavaLangMath_minWithLong_withLong_(a3, 0x7FFFFFFFLL);
  self->fixedContentLengthLong_ = a3;
}

- (void)setFixedLengthStreamingModeWithInt:(int)a3
{
}

- (void)setChunkedStreamingModeWithInt:(int)a3
{
  if (self->super.connected_)
  {
    CFStringRef v4 = @"Already connected";
    goto LABEL_9;
  }
  if ((self->fixedContentLength_ & 0x80000000) == 0)
  {
    CFStringRef v4 = @"Already in fixed-length mode";
LABEL_9:
    CFStringRef v5 = new_JavaLangIllegalStateException_initWithNSString_((uint64_t)v4);
    objc_exception_throw(v5);
  }
  if (a3 >= 1) {
    int v3 = a3;
  }
  else {
    int v3 = 1024;
  }
  self->chunkLength_ = v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNetHttpURLConnection;
  [(JavaNetURLConnection *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v3[0] = off_100463F08;
    v3[1] = off_100463F18;
    v3[2] = off_100463F28;
    CFStringRef v4 = @"TRACE";
    id v2 = +[IOSObjectArray newArrayWithObjects:v3 count:7 type:NSString_class_()];
    JreStrongAssignAndConsume((id *)&qword_1005611E8, v2);
    atomic_store(1u, (unsigned __int8 *)JavaNetHttpURLConnection__initialized);
  }
}

+ (id)__annotations_HTTP_SERVER_ERROR_
{
  objc_super v3 = objc_alloc_init(JavaLangDeprecated);
  return +[IOSObjectArray arrayWithObjects:&v3 count:1 type:JavaLangAnnotationAnnotation_class_()];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100464CB0;
}

@end