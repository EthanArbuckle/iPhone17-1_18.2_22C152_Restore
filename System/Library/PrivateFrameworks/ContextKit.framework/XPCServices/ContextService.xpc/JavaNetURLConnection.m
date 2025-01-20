@interface JavaNetURLConnection
+ (BOOL)getDefaultAllowUserInteraction;
+ (const)__metadata;
+ (id)__annotations_getDefaultRequestPropertyWithNSString_;
+ (id)__annotations_setDefaultRequestPropertyWithNSString_withNSString_;
+ (id)getDefaultRequestPropertyWithNSString:(id)a3;
+ (id)guessContentTypeFromNameWithNSString:(id)a3;
+ (id)guessContentTypeFromStreamWithJavaIoInputStream:(id)a3;
+ (void)initialize;
+ (void)setContentHandlerFactoryWithJavaNetContentHandlerFactory:(id)a3;
+ (void)setDefaultAllowUserInteractionWithBoolean:(BOOL)a3;
+ (void)setDefaultRequestPropertyWithNSString:(id)a3 withNSString:(id)a4;
+ (void)setFileNameMapWithJavaNetFileNameMap:(id)a3;
- (BOOL)getAllowUserInteraction;
- (BOOL)getDefaultUseCaches;
- (BOOL)getDoInput;
- (BOOL)getDoOutput;
- (BOOL)getUseCaches;
- (JavaNetURLConnection)initWithJavaNetURL:(id)a3;
- (id)description;
- (id)getContent;
- (id)getContentEncoding;
- (id)getContentHandlerWithNSString:(id)a3;
- (id)getContentType;
- (id)getContentWithIOSClassArray:(id)a3;
- (id)getHeaderFieldKeyWithInt:(int)a3;
- (id)getHeaderFieldWithInt:(int)a3;
- (id)getHeaderFieldWithNSString:(id)a3;
- (id)getInputStream;
- (id)getOutputStream;
- (id)getPermission;
- (id)getRequestProperties;
- (id)getRequestPropertyWithNSString:(id)a3;
- (id)getURL;
- (id)parseTypeStringWithNSString:(id)a3;
- (int)getConnectTimeout;
- (int)getContentLength;
- (int)getHeaderFieldIntWithNSString:(id)a3 withInt:(int)a4;
- (int)getReadTimeout;
- (int64_t)getContentLengthLong;
- (int64_t)getDate;
- (int64_t)getExpiration;
- (int64_t)getHeaderFieldDateWithNSString:(id)a3 withLong:(int64_t)a4;
- (int64_t)getHeaderFieldLongWithNSString:(id)a3 withLong:(int64_t)a4;
- (int64_t)getIfModifiedSince;
- (int64_t)getLastModified;
- (uint64_t)checkNotConnected;
- (void)addRequestPropertyWithNSString:(id)a3 withNSString:(id)a4;
- (void)connect;
- (void)dealloc;
- (void)setAllowUserInteractionWithBoolean:(BOOL)a3;
- (void)setConnectTimeoutWithInt:(int)a3;
- (void)setDefaultUseCachesWithBoolean:(BOOL)a3;
- (void)setDoInputWithBoolean:(BOOL)a3;
- (void)setDoOutputWithBoolean:(BOOL)a3;
- (void)setIfModifiedSinceWithLong:(int64_t)a3;
- (void)setReadTimeoutWithInt:(int)a3;
- (void)setRequestPropertyWithNSString:(id)a3 withNSString:(id)a4;
- (void)setUseCachesWithBoolean:(BOOL)a3;
@end

@implementation JavaNetURLConnection

- (JavaNetURLConnection)initWithJavaNetURL:(id)a3
{
  return self;
}

- (void)connect
{
}

- (BOOL)getAllowUserInteraction
{
  return self->allowUserInteraction_;
}

- (id)getContent
{
  if (!self->connected_) {
    [(JavaNetURLConnection *)self connect];
  }
  p_contentType = (void **)&self->contentType_;
  if (!JreStrongAssign((id *)&self->contentType_, [(JavaNetURLConnection *)self getContentType]))
  {
    url = self->url_;
    if (!url) {
      goto LABEL_13;
    }
    id v5 = JavaNetURLConnection_guessContentTypeFromNameWithNSString_((uint64_t)[(JavaNetURL *)url getFile]);
    if (!JreStrongAssign((id *)&self->contentType_, v5))
    {
      v6 = (__CFString *)JavaNetURLConnection_guessContentTypeFromStreamWithJavaIoInputStream_([(JavaNetURLConnection *)self getInputStream]);
      JreStrongAssign((id *)&self->contentType_, v6);
    }
  }
  if (!*p_contentType) {
    return 0;
  }
  id v7 = sub_10021FA2C((uint64_t)self, *p_contentType);
  if (!v7) {
LABEL_13:
  }
    JreThrowNullPointerException();
  return [v7 getContentWithJavaNetURLConnection:self];
}

- (id)getContentWithIOSClassArray:(id)a3
{
  if (!self->connected_) {
    [(JavaNetURLConnection *)self connect];
  }
  p_contentType = (void **)&self->contentType_;
  if (!JreStrongAssign((id *)&self->contentType_, [(JavaNetURLConnection *)self getContentType]))
  {
    url = self->url_;
    if (!url) {
      goto LABEL_13;
    }
    id v7 = JavaNetURLConnection_guessContentTypeFromNameWithNSString_((uint64_t)[(JavaNetURL *)url getFile]);
    if (!JreStrongAssign((id *)&self->contentType_, v7))
    {
      v8 = (__CFString *)JavaNetURLConnection_guessContentTypeFromStreamWithJavaIoInputStream_([(JavaNetURLConnection *)self getInputStream]);
      JreStrongAssign((id *)&self->contentType_, v8);
    }
  }
  if (!*p_contentType) {
    return 0;
  }
  id v9 = sub_10021FA2C((uint64_t)self, *p_contentType);
  if (!v9) {
LABEL_13:
  }
    JreThrowNullPointerException();
  return [v9 getContentWithJavaNetURLConnection:self withIOSClassArray:a3];
}

- (id)getContentEncoding
{
  return [(JavaNetURLConnection *)self getHeaderFieldWithNSString:@"Content-Encoding"];
}

- (id)getContentHandlerWithNSString:(id)a3
{
  return sub_10021FA2C((uint64_t)self, a3);
}

- (int)getContentLength
{
  return [(JavaNetURLConnection *)self getHeaderFieldIntWithNSString:@"Content-Length" withInt:0xFFFFFFFFLL];
}

- (int64_t)getContentLengthLong
{
  return [(JavaNetURLConnection *)self getHeaderFieldLongWithNSString:@"Content-Length" withLong:-1];
}

- (id)getContentType
{
  return [(JavaNetURLConnection *)self getHeaderFieldWithNSString:@"Content-Type"];
}

- (int64_t)getDate
{
  return [(JavaNetURLConnection *)self getHeaderFieldDateWithNSString:@"Date" withLong:0];
}

+ (BOOL)getDefaultAllowUserInteraction
{
  if ((atomic_load_explicit(JavaNetURLConnection__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return byte_100560F48;
}

+ (id)getDefaultRequestPropertyWithNSString:(id)a3
{
  if ((atomic_load_explicit(JavaNetURLConnection__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return 0;
}

- (BOOL)getDefaultUseCaches
{
  return byte_10055D2A0;
}

- (BOOL)getDoInput
{
  return self->doInput_;
}

- (BOOL)getDoOutput
{
  return self->doOutput_;
}

- (int64_t)getExpiration
{
  return [(JavaNetURLConnection *)self getHeaderFieldDateWithNSString:@"Expires" withLong:0];
}

- (id)getHeaderFieldWithInt:(int)a3
{
  return 0;
}

- (id)getRequestProperties
{
  -[JavaNetURLConnection checkNotConnected]_0((uint64_t)self);
  return (id)JavaUtilCollections_emptyMap();
}

- (uint64_t)checkNotConnected
{
  if (*(unsigned char *)(result + 33))
  {
    v1 = new_JavaLangIllegalStateException_initWithNSString_(@"Already connected");
    objc_exception_throw(v1);
  }
  return result;
}

- (void)addRequestPropertyWithNSString:(id)a3 withNSString:(id)a4
{
  -[JavaNetURLConnection checkNotConnected]_0((uint64_t)self);
  if (!a3)
  {
    id v5 = new_JavaLangNullPointerException_initWithNSString_(@"field == null");
    objc_exception_throw(v5);
  }
}

- (id)getHeaderFieldWithNSString:(id)a3
{
  return 0;
}

- (int64_t)getHeaderFieldDateWithNSString:(id)a3 withLong:(int64_t)a4
{
  id v5 = [(JavaNetURLConnection *)self getHeaderFieldWithNSString:a3];
  if (v5) {
    return JavaUtilDate_parseWithNSString_(v5);
  }
  return a4;
}

- (int)getHeaderFieldIntWithNSString:(id)a3 withInt:(int)a4
{
  id v4 = [(JavaNetURLConnection *)self getHeaderFieldWithNSString:a3];
  return JavaLangInteger_parseIntWithNSString_(v4, v5, v6, v7, v8, v9, v10, v11);
}

- (int64_t)getHeaderFieldLongWithNSString:(id)a3 withLong:(int64_t)a4
{
  id v4 = [(JavaNetURLConnection *)self getHeaderFieldWithNSString:a3];
  return JavaLangLong_parseLongWithNSString_(v4, v5, v6, v7, v8, v9, v10, v11);
}

- (id)getHeaderFieldKeyWithInt:(int)a3
{
  return 0;
}

- (int64_t)getIfModifiedSince
{
  return self->ifModifiedSince_;
}

- (id)getInputStream
{
  v2 = new_JavaNetUnknownServiceException_initWithNSString_(@"Does not support writing to the input stream");
  objc_exception_throw(v2);
}

- (int64_t)getLastModified
{
  int64_t result = self->lastModified_;
  if (result == -1)
  {
    int64_t result = [(JavaNetURLConnection *)self getHeaderFieldDateWithNSString:@"Last-Modified" withLong:0];
    self->lastModified_ = result;
  }
  return result;
}

- (id)getOutputStream
{
  v2 = new_JavaNetUnknownServiceException_initWithNSString_(@"Does not support writing to the output stream");
  objc_exception_throw(v2);
}

- (id)getPermission
{
  v2 = new_JavaSecurityAllPermission_init();
  return v2;
}

- (id)getRequestPropertyWithNSString:(id)a3
{
  return 0;
}

- (id)getURL
{
  return self->url_;
}

- (BOOL)getUseCaches
{
  return self->useCaches_;
}

+ (id)guessContentTypeFromNameWithNSString:(id)a3
{
  return JavaNetURLConnection_guessContentTypeFromNameWithNSString_((uint64_t)a3);
}

+ (id)guessContentTypeFromStreamWithJavaIoInputStream:(id)a3
{
  return (id)JavaNetURLConnection_guessContentTypeFromStreamWithJavaIoInputStream_(a3);
}

- (id)parseTypeStringWithNSString:(id)a3
{
  return sub_1002200BC(a3);
}

- (void)setAllowUserInteractionWithBoolean:(BOOL)a3
{
  self->allowUserInteraction_ = a3;
}

+ (void)setContentHandlerFactoryWithJavaNetContentHandlerFactory:(id)a3
{
}

+ (void)setDefaultAllowUserInteractionWithBoolean:(BOOL)a3
{
  if ((atomic_load_explicit(JavaNetURLConnection__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  byte_100560F48 = a3;
}

+ (void)setDefaultRequestPropertyWithNSString:(id)a3 withNSString:(id)a4
{
  if ((atomic_load_explicit(JavaNetURLConnection__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
}

- (void)setDefaultUseCachesWithBoolean:(BOOL)a3
{
  byte_10055D2A0 = a3;
}

- (void)setDoInputWithBoolean:(BOOL)a3
{
  self->doInput_ = a3;
}

- (void)setDoOutputWithBoolean:(BOOL)a3
{
  self->doOutput_ = a3;
}

+ (void)setFileNameMapWithJavaNetFileNameMap:(id)a3
{
}

- (void)setIfModifiedSinceWithLong:(int64_t)a3
{
  self->ifModifiedSince_ = a3;
}

- (void)setRequestPropertyWithNSString:(id)a3 withNSString:(id)a4
{
  -[JavaNetURLConnection checkNotConnected]_0((uint64_t)self);
  if (!a3)
  {
    uint64_t v5 = new_JavaLangNullPointerException_initWithNSString_(@"field == null");
    objc_exception_throw(v5);
  }
}

- (void)setUseCachesWithBoolean:(BOOL)a3
{
  self->useCaches_ = a3;
}

- (void)setConnectTimeoutWithInt:(int)a3
{
  if (a3 < 0)
  {
    v3 = new_JavaLangIllegalArgumentException_initWithNSString_(@"timeoutMillis < 0");
    objc_exception_throw(v3);
  }
  self->connectTimeout_ = a3;
}

- (int)getConnectTimeout
{
  return self->connectTimeout_;
}

- (void)setReadTimeoutWithInt:(int)a3
{
  if (a3 < 0)
  {
    v3 = new_JavaLangIllegalArgumentException_initWithNSString_(@"timeoutMillis < 0");
    objc_exception_throw(v3);
  }
  self->readTimeout_ = a3;
}

- (int)getReadTimeout
{
  return self->readTimeout_;
}

- (id)description
{
  id v3 = objc_msgSend(-[JavaNetURLConnection getClass](self, "getClass"), "getName");
  url = self->url_;
  if (!url) {
    JreThrowNullPointerException();
  }
  [(JavaNetURL *)url description];
  return (id)JreStrcat("$C$", v5, v6, v7, v8, v9, v10, v11, v3);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNetURLConnection;
  [(JavaNetURLConnection *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = new_JavaUtilHashtable_init();
    JreStrongAssignAndConsume((id *)&JavaNetURLConnection_contentHandlers_, v2);
    atomic_store(1u, (unsigned __int8 *)JavaNetURLConnection__initialized);
  }
}

+ (id)__annotations_getDefaultRequestPropertyWithNSString_
{
  objc_super v3 = objc_alloc_init(JavaLangDeprecated);
  return +[IOSObjectArray arrayWithObjects:&v3 count:1 type:JavaLangAnnotationAnnotation_class_()];
}

+ (id)__annotations_setDefaultRequestPropertyWithNSString_withNSString_
{
  objc_super v3 = objc_alloc_init(JavaLangDeprecated);
  return +[IOSObjectArray arrayWithObjects:&v3 count:1 type:JavaLangAnnotationAnnotation_class_()];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10044E720;
}

@end