@interface JavaNetURL
+ (const)__metadata;
+ (void)initialize;
+ (void)setURLStreamHandlerFactoryWithJavaNetURLStreamHandlerFactory:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)sameFileWithJavaNetURL:(id)a3;
- (JavaNetURL)initWithJavaNetURL:(id)a3 withNSString:(id)a4;
- (JavaNetURL)initWithJavaNetURL:(id)a3 withNSString:(id)a4 withJavaNetURLStreamHandler:(id)a5;
- (JavaNetURL)initWithNSString:(id)a3;
- (JavaNetURL)initWithNSString:(id)a3 withNSString:(id)a4 withInt:(int)a5 withNSString:(id)a6;
- (JavaNetURL)initWithNSString:(id)a3 withNSString:(id)a4 withInt:(int)a5 withNSString:(id)a6 withJavaNetURLStreamHandler:(id)a7;
- (JavaNetURL)initWithNSString:(id)a3 withNSString:(id)a4 withNSString:(id)a5;
- (id)getAuthority;
- (id)getContent;
- (id)getContentWithIOSClassArray:(id)a3;
- (id)getFile;
- (id)getHost;
- (id)getPath;
- (id)getProtocol;
- (id)getQuery;
- (id)getRef;
- (id)getUserInfo;
- (id)openConnection;
- (id)openConnectionWithJavaNetProxy:(id)a3;
- (id)openStream;
- (id)toExternalForm;
- (id)toURI;
- (id)toURILenient;
- (int)getDefaultPort;
- (int)getEffectivePort;
- (int)getPort;
- (unint64_t)hash;
- (void)dealloc;
- (void)fixURLWithBoolean:(BOOL)a3;
- (void)readObjectWithJavaIoObjectInputStream:(id)a3;
- (void)setWithNSString:(id)a3 withNSString:(id)a4 withInt:(int)a5 withNSString:(id)a6 withNSString:(id)a7;
- (void)setWithNSString:(id)a3 withNSString:(id)a4 withInt:(int)a5 withNSString:(id)a6 withNSString:(id)a7 withNSString:(id)a8 withNSString:(id)a9 withNSString:(id)a10;
- (void)setupStreamHandler;
- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3;
@end

@implementation JavaNetURL

+ (void)setURLStreamHandlerFactoryWithJavaNetURLStreamHandlerFactory:(id)a3
{
}

- (JavaNetURL)initWithNSString:(id)a3
{
  return self;
}

- (JavaNetURL)initWithJavaNetURL:(id)a3 withNSString:(id)a4
{
  return self;
}

- (JavaNetURL)initWithJavaNetURL:(id)a3 withNSString:(id)a4 withJavaNetURLStreamHandler:(id)a5
{
  return self;
}

- (JavaNetURL)initWithNSString:(id)a3 withNSString:(id)a4 withNSString:(id)a5
{
  JavaNetURL_initWithNSString_withNSString_withInt_withNSString_withJavaNetURLStreamHandler_((uint64_t)self, a3, (__CFString *)a4, 0xFFFFFFFFLL, a5, 0, v5, v6);
  return self;
}

- (JavaNetURL)initWithNSString:(id)a3 withNSString:(id)a4 withInt:(int)a5 withNSString:(id)a6
{
  JavaNetURL_initWithNSString_withNSString_withInt_withNSString_withJavaNetURLStreamHandler_((uint64_t)self, a3, (__CFString *)a4, *(uint64_t *)&a5, a6, 0, v6, v7);
  return self;
}

- (JavaNetURL)initWithNSString:(id)a3 withNSString:(id)a4 withInt:(int)a5 withNSString:(id)a6 withJavaNetURLStreamHandler:(id)a7
{
  JavaNetURL_initWithNSString_withNSString_withInt_withNSString_withJavaNetURLStreamHandler_((uint64_t)self, a3, (__CFString *)a4, *(uint64_t *)&a5, a6, a7, (uint64_t)a7, v7);
  return self;
}

- (void)fixURLWithBoolean:(BOOL)a3
{
  BOOL v3 = a3;
  p_host = (id *)&self->host_;
  host = self->host_;
  if (host)
  {
    if ((int)[(NSString *)host length] >= 1)
    {
      JreStrongAssign((id *)&self->authority_, self->host_);
      if (self->port_ != -1)
      {
        v14 = (__CFString *)JreStrcat("$CI", v7, v8, v9, v10, v11, v12, v13, self->authority_);
        JreStrongAssign((id *)&self->authority_, v14);
      }
    }
  }
  if (v3)
  {
    if (!*p_host || (id v15 = [*p_host lastIndexOf:64], (v15 & 0x80000000) != 0))
    {
      p_userInfo = &self->userInfo_;
      id v17 = 0;
    }
    else
    {
      int v16 = (int)v15;
      JreStrongAssign((id *)&self->userInfo_, [(NSString *)self->host_ substring:0 endIndex:v15]);
      id v17 = [(NSString *)self->host_ substring:(v16 + 1)];
      p_userInfo = (NSString **)p_host;
    }
    JreStrongAssign((id *)p_userInfo, v17);
  }
  file = self->file_;
  if (!file || (id v20 = (id)[(NSString *)file indexOf:63], (v20 & 0x80000000) != 0))
  {
    JreStrongAssign((id *)&self->query_, 0);
    p_path = &self->path_;
    v22 = self->file_;
  }
  else
  {
    id v21 = v20;
    JreStrongAssign((id *)&self->query_, [(NSString *)self->file_ substring:(v20 + 1)]);
    v22 = [(NSString *)self->file_ substring:0 endIndex:v21];
    p_path = &self->path_;
  }
  JreStrongAssign((id *)p_path, v22);
}

- (void)setWithNSString:(id)a3 withNSString:(id)a4 withInt:(int)a5 withNSString:(id)a6 withNSString:(id)a7
{
  protocol = self->protocol_;
  p_protocol = &self->protocol_;
  if (!protocol) {
    JreStrongAssign((id *)p_protocol, a3);
  }
  JreStrongAssign((id *)&self->host_, a4);
  JreStrongAssign((id *)&self->file_, a6);
  self->port_ = a5;
  JreStrongAssign((id *)&self->ref_, a7);
  self->hashCode_ = 0;
  [(JavaNetURL *)self fixURLWithBoolean:1];
}

- (BOOL)isEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  if (self == a3) {
    return 1;
  }
  id v5 = [(JavaNetURL *)self getClass];
  if (v5 != [a3 getClass]) {
    return 0;
  }
  streamHandler = self->streamHandler_;
  if (!streamHandler) {
    JreThrowNullPointerException();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  return [(JavaNetURLStreamHandler *)streamHandler equalsWithJavaNetURL:self withJavaNetURL:a3];
}

- (BOOL)sameFileWithJavaNetURL:(id)a3
{
  streamHandler = self->streamHandler_;
  if (!streamHandler) {
    JreThrowNullPointerException();
  }
  return [(JavaNetURLStreamHandler *)streamHandler sameFileWithJavaNetURL:self withJavaNetURL:a3];
}

- (unint64_t)hash
{
  unint64_t v2 = self;
  LODWORD(self) = *(_DWORD *)(self + 88);
  if (!self)
  {
    BOOL v3 = *(void **)(v2 + 8);
    if (!v3) {
      JreThrowNullPointerException();
    }
    LODWORD(self) = [v3 hashCodeWithJavaNetURL:v2];
    *(_DWORD *)(v2 + 88) = self;
  }
  return (int)self;
}

- (void)setupStreamHandler
{
  if (!qword_100562F20) {
    goto LABEL_29;
  }
  p_streamHandler = &self->streamHandler_;
  JreStrongAssign((id *)&self->streamHandler_, [(id)qword_100562F20 getWithId:self->protocol_]);
  if (self->streamHandler_) {
    return;
  }
  if (qword_100562F28)
  {
    JreStrongAssign((id *)&self->streamHandler_, [(id)qword_100562F28 createURLStreamHandlerWithNSString:self->protocol_]);
    if (self->streamHandler_) {
      goto LABEL_26;
    }
  }
  id PropertyWithNSString = JavaLangSystem_getPropertyWithNSString_(@"java.protocol.handler.pkgs");
  id v5 = JavaLangThread_currentThread();
  if (!v5) {
    goto LABEL_29;
  }
  id v6 = [(JavaLangThread *)v5 getContextClassLoader];
  if (PropertyWithNSString)
  {
    uint64_t v7 = v6;
    if (v6)
    {
      uint64_t v8 = (id *)[PropertyWithNSString split:@"\\|"];
      if (!v8) {
        goto LABEL_29;
      }
      if (v8 + 3 < &v8[*((int *)v8 + 2) + 3])
      {
        id v16 = objc_msgSend(v7, "loadClassWithNSString:", JreStrcat("$C$$", v9, v10, v11, v12, v13, v14, v15, v8[3]));
        if (!v16) {
          JreThrowNullPointerException();
        }
        id v17 = [v16 newInstance];
        objc_opt_class();
        if (v17 && (objc_opt_isKindOfClass() & 1) == 0) {
          JreThrowClassCastException();
        }
        JreStrongAssign((id *)&self->streamHandler_, v17);
        if (*p_streamHandler) {
          objc_msgSend((id)qword_100562F20, "putWithId:withId:", self->protocol_);
        }
        return;
      }
    }
  }
  protocol = self->protocol_;
  if (!protocol) {
LABEL_29:
  }
    JreThrowNullPointerException();
  if ([(NSString *)protocol isEqual:@"file"])
  {
    v19 = new_LibcoreNetUrlFileHandler_init();
    JreStrongAssignAndConsume((id *)&self->streamHandler_, v19);
  }
  else if ([(NSString *)self->protocol_ isEqual:@"http"])
  {
    id v20 = new_ComGoogleJ2objcNetIosHttpHandler_init();
    JreStrongAssignAndConsume((id *)&self->streamHandler_, v20);
  }
  else if ([(NSString *)self->protocol_ isEqual:@"https"])
  {
    id v21 = new_ComGoogleJ2objcNetIosHttpsHandler_init();
    JreStrongAssignAndConsume((id *)&self->streamHandler_, v21);
  }
  if (*p_streamHandler)
  {
LABEL_26:
    v22 = (void *)qword_100562F20;
    v23 = self->protocol_;
    objc_msgSend(v22, "putWithId:withId:", v23);
  }
}

- (id)getContent
{
  id v2 = [(JavaNetURL *)self openConnection];
  if (!v2) {
    JreThrowNullPointerException();
  }
  return [v2 getContent];
}

- (id)getContentWithIOSClassArray:(id)a3
{
  id v4 = [(JavaNetURL *)self openConnection];
  if (!v4) {
    JreThrowNullPointerException();
  }
  return [v4 getContentWithIOSClassArray:a3];
}

- (id)openStream
{
  id v2 = [(JavaNetURL *)self openConnection];
  if (!v2) {
    JreThrowNullPointerException();
  }
  return [v2 getInputStream];
}

- (id)openConnection
{
  streamHandler = self->streamHandler_;
  if (!streamHandler) {
    JreThrowNullPointerException();
  }
  return [(JavaNetURLStreamHandler *)streamHandler openConnectionWithJavaNetURL:self];
}

- (id)openConnectionWithJavaNetProxy:(id)a3
{
  if (!a3)
  {
    id v6 = new_JavaLangIllegalArgumentException_initWithNSString_(@"proxy == null");
    objc_exception_throw(v6);
  }
  streamHandler = self->streamHandler_;
  if (!streamHandler) {
    JreThrowNullPointerException();
  }
  return [(JavaNetURLStreamHandler *)streamHandler openConnectionWithJavaNetURL:self withJavaNetProxy:a3];
}

- (id)toURI
{
  id v2 = new_JavaNetURI_initWithNSString_([(JavaNetURL *)self toExternalForm]);
  return v2;
}

- (id)toURILenient
{
  streamHandler = self->streamHandler_;
  if (!streamHandler)
  {
    id v6 = new_JavaLangIllegalStateException_initWithNSString_((uint64_t)self->protocol_);
    objc_exception_throw(v6);
  }
  id v4 = new_JavaNetURI_initWithNSString_([(JavaNetURLStreamHandler *)streamHandler toExternalFormWithJavaNetURL:self withBoolean:1]);
  return v4;
}

- (id)toExternalForm
{
  streamHandler = self->streamHandler_;
  if (!streamHandler) {
    return (id)JreStrcat("$$$$$", (uint64_t)a2, (uint64_t)self, v2, v3, v4, v5, v6, @"unknown protocol(");
  }
  return [(JavaNetURLStreamHandler *)streamHandler toExternalFormWithJavaNetURL:self];
}

- (void)readObjectWithJavaIoObjectInputStream:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  [a3 defaultReadObject];
  authority = self->authority_;
  if (self->host_)
  {
    if (!authority)
    {
      [(JavaNetURL *)self fixURLWithBoolean:1];
      goto LABEL_13;
    }
  }
  else if (!authority)
  {
    goto LABEL_13;
  }
  id v5 = (id)[(NSString *)authority lastIndexOf:64];
  if ((v5 & 0x80000000) == 0) {
    JreStrongAssign((id *)&self->userInfo_, [(NSString *)self->authority_ substring:0 endIndex:v5]);
  }
  file = self->file_;
  if (file)
  {
    id v7 = (id)-[NSString indexOf:](file, "indexOf:", 63, v5);
    id v8 = v7;
    uint64_t v9 = self->file_;
    if ((v7 & 0x80000000) == 0)
    {
      JreStrongAssign((id *)&self->query_, [(NSString *)self->file_ substring:(v7 + 1)]);
      uint64_t v9 = [(NSString *)self->file_ substring:0 endIndex:v8];
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  JreStrongAssign((id *)&self->path_, v9);
LABEL_13:
  [(JavaNetURL *)self setupStreamHandler];
  if (!self->streamHandler_)
  {
    CFStringRef v17 = JreStrcat("$$", v10, v11, v12, v13, v14, v15, v16, @"Unknown protocol: ");
    v18 = new_JavaIoIOException_initWithNSString_((uint64_t)v17);
    objc_exception_throw(v18);
  }
  self->hashCode_ = 0;
}

- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  [a3 defaultWriteObject];
}

- (int)getEffectivePort
{
  return JavaNetURI_getEffectivePortWithNSString_withInt_((uint64_t)self->protocol_, self->port_);
}

- (id)getProtocol
{
  return self->protocol_;
}

- (id)getAuthority
{
  return self->authority_;
}

- (id)getUserInfo
{
  return self->userInfo_;
}

- (id)getHost
{
  return self->host_;
}

- (int)getPort
{
  return self->port_;
}

- (int)getDefaultPort
{
  streamHandler = self->streamHandler_;
  if (!streamHandler) {
    JreThrowNullPointerException();
  }
  return [(JavaNetURLStreamHandler *)streamHandler getDefaultPort];
}

- (id)getFile
{
  return self->file_;
}

- (id)getPath
{
  return self->path_;
}

- (id)getQuery
{
  return self->query_;
}

- (id)getRef
{
  return self->ref_;
}

- (void)setWithNSString:(id)a3 withNSString:(id)a4 withInt:(int)a5 withNSString:(id)a6 withNSString:(id)a7 withNSString:(id)a8 withNSString:(id)a9 withNSString:(id)a10
{
  uint64_t v13 = *(void *)&a5;
  v24 = (__CFString *)a8;
  CFStringRef v17 = (__CFString *)a8;
  if (a9)
  {
    unsigned __int8 v18 = objc_msgSend(a9, "isEmpty", a3, a4, *(void *)&a5, a8);
    CFStringRef v17 = (__CFString *)a8;
    if ((v18 & 1) == 0)
    {
      JreStrAppendStrong(&v24, "C$", v19, v20, v21, (uint64_t)a8, v22, v23, (id)0x3F);
      CFStringRef v17 = v24;
    }
  }
  [(JavaNetURL *)self setWithNSString:a3 withNSString:a4 withInt:v13 withNSString:v17 withNSString:a10];
  JreStrongAssign((id *)&self->authority_, a6);
  JreStrongAssign((id *)&self->userInfo_, a7);
  JreStrongAssign((id *)&self->path_, a8);
  JreStrongAssign((id *)&self->query_, a9);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNetURL;
  [(JavaNetURL *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v2 = new_JavaUtilHashtable_init();
    JreStrongAssignAndConsume((id *)&qword_100562F20, v2);
    atomic_store(1u, (unsigned __int8 *)&JavaNetURL__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100487AE0;
}

@end