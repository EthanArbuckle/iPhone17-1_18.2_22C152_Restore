@interface LibcoreIoPosix
+ (const)__metadata;
+ (int)throwIfMinusOneWithNSString:(id)a3 withInt:(int)a4;
+ (void)throwErrnoExceptionWithNSString:(id)a3 withInt:(int)a4;
+ (void)updateInetSocketAddressWithJavaNetInetSocketAddress:(id)a3 withJavaNetInetAddress:(id)a4 withInt:(int)a5;
- (BOOL)accessWithNSString:(id)a3 withInt:(int)a4;
- (BOOL)canAccessWithNSString:(id)a3 withInt:(int)a4;
- (BOOL)isattyWithJavaIoFileDescriptor:(id)a3;
- (id)acceptWithJavaIoFileDescriptor:(id)a3 withJavaNetInetSocketAddress:(id)a4;
- (id)dup2WithJavaIoFileDescriptor:(id)a3 withInt:(int)a4;
- (id)dupWithJavaIoFileDescriptor:(id)a3;
- (id)fstatWithJavaIoFileDescriptor:(id)a3;
- (id)gai_strerrorWithInt:(int)a3;
- (id)getaddrinfoWithNSString:(id)a3 withLibcoreIoStructAddrinfo:(id)a4;
- (id)getnameinfoWithJavaNetInetAddress:(id)a3 withInt:(int)a4;
- (id)getsocknameWithJavaIoFileDescriptor:(id)a3;
- (id)getsockoptInAddrWithJavaIoFileDescriptor:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (id)getsockoptLingerWithJavaIoFileDescriptor:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (id)getsockoptTimevalWithJavaIoFileDescriptor:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (id)if_indextonameWithInt:(int)a3;
- (id)inet_ptonWithInt:(int)a3 withNSString:(id)a4;
- (id)ioctlInetAddressWithJavaIoFileDescriptor:(id)a3 withInt:(int)a4 withNSString:(id)a5;
- (id)lstatWithNSString:(id)a3;
- (id)openWithNSString:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (id)pipe;
- (id)realpathWithNSString:(id)a3;
- (id)socketWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5;
- (id)statWithNSString:(id)a3;
- (id)statvfsWithNSString:(id)a3;
- (id)strerrorWithInt:(int)a3;
- (id)uname;
- (int)fcntlFlockWithJavaIoFileDescriptor:(id)a3 withInt:(int)a4 withLibcoreIoStructFlock:(id)a5;
- (int)fcntlLongWithJavaIoFileDescriptor:(id)a3 withInt:(int)a4 withLong:(int64_t)a5;
- (int)fcntlVoidWithJavaIoFileDescriptor:(id)a3 withInt:(int)a4;
- (int)getsockoptByteWithJavaIoFileDescriptor:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (int)getsockoptIntWithJavaIoFileDescriptor:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (int)ioctlIntWithJavaIoFileDescriptor:(id)a3 withInt:(int)a4 withLibcoreUtilMutableInt:(id)a5;
- (int)pollWithLibcoreIoStructPollfdArray:(id)a3 withInt:(int)a4;
- (int)preadBytesWithJavaIoFileDescriptor:(id)a3 withId:(id)a4 withInt:(int)a5 withInt:(int)a6 withLong:(int64_t)a7;
- (int)preadWithJavaIoFileDescriptor:(id)a3 withByteArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withLong:(int64_t)a7;
- (int)preadWithJavaIoFileDescriptor:(id)a3 withJavaNioByteBuffer:(id)a4 withLong:(int64_t)a5;
- (int)pwriteBytesWithJavaIoFileDescriptor:(id)a3 withId:(id)a4 withInt:(int)a5 withInt:(int)a6 withLong:(int64_t)a7;
- (int)pwriteWithJavaIoFileDescriptor:(id)a3 withByteArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withLong:(int64_t)a7;
- (int)pwriteWithJavaIoFileDescriptor:(id)a3 withJavaNioByteBuffer:(id)a4 withLong:(int64_t)a5;
- (int)readBytesWithJavaIoFileDescriptor:(id)a3 withId:(id)a4 withInt:(int)a5 withInt:(int)a6;
- (int)readWithJavaIoFileDescriptor:(id)a3 withByteArray:(id)a4 withInt:(int)a5 withInt:(int)a6;
- (int)readWithJavaIoFileDescriptor:(id)a3 withJavaNioByteBuffer:(id)a4;
- (int)readvWithJavaIoFileDescriptor:(id)a3 withNSObjectArray:(id)a4 withIntArray:(id)a5 withIntArray:(id)a6;
- (int)recvfromBytesWithJavaIoFileDescriptor:(id)a3 withId:(id)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7 withJavaNetInetSocketAddress:(id)a8;
- (int)recvfromWithJavaIoFileDescriptor:(id)a3 withByteArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7 withJavaNetInetSocketAddress:(id)a8;
- (int)recvfromWithJavaIoFileDescriptor:(id)a3 withJavaNioByteBuffer:(id)a4 withInt:(int)a5 withJavaNetInetSocketAddress:(id)a6;
- (int)sendtoBytesWithJavaIoFileDescriptor:(id)a3 withId:(id)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7 withJavaNetInetAddress:(id)a8 withInt:(int)a9;
- (int)sendtoWithJavaIoFileDescriptor:(id)a3 withByteArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7 withJavaNetInetAddress:(id)a8 withInt:(int)a9;
- (int)sendtoWithJavaIoFileDescriptor:(id)a3 withJavaNioByteBuffer:(id)a4 withInt:(int)a5 withJavaNetInetAddress:(id)a6 withInt:(int)a7;
- (int)writeBytesWithJavaIoFileDescriptor:(id)a3 withId:(id)a4 withInt:(int)a5 withInt:(int)a6;
- (int)writeWithJavaIoFileDescriptor:(id)a3 withByteArray:(id)a4 withInt:(int)a5 withInt:(int)a6;
- (int)writeWithJavaIoFileDescriptor:(id)a3 withJavaNioByteBuffer:(id)a4;
- (int)writevWithJavaIoFileDescriptor:(id)a3 withNSObjectArray:(id)a4 withIntArray:(id)a5 withIntArray:(id)a6;
- (int64_t)lseekWithJavaIoFileDescriptor:(id)a3 withLong:(int64_t)a4 withInt:(int)a5;
- (int64_t)mmapWithLong:(int64_t)a3 withLong:(int64_t)a4 withInt:(int)a5 withInt:(int)a6 withJavaIoFileDescriptor:(id)a7 withLong:(int64_t)a8;
- (int64_t)sendfileWithJavaIoFileDescriptor:(id)a3 withJavaIoFileDescriptor:(id)a4 withLibcoreUtilMutableLong:(id)a5 withLong:(int64_t)a6;
- (int64_t)sysconfWithInt:(int)a3;
- (void)bindWithJavaIoFileDescriptor:(id)a3 withJavaNetInetAddress:(id)a4 withInt:(int)a5;
- (void)chmodWithNSString:(id)a3 withInt:(int)a4;
- (void)chownWithNSString:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)closeWithJavaIoFileDescriptor:(id)a3;
- (void)connectWithJavaIoFileDescriptor:(id)a3 withJavaNetInetAddress:(id)a4 withInt:(int)a5;
- (void)fchmodWithJavaIoFileDescriptor:(id)a3 withInt:(int)a4;
- (void)fchownWithJavaIoFileDescriptor:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)fdatasyncWithJavaIoFileDescriptor:(id)a3;
- (void)fsyncWithJavaIoFileDescriptor:(id)a3;
- (void)ftruncateWithJavaIoFileDescriptor:(id)a3 withLong:(int64_t)a4;
- (void)listenWithJavaIoFileDescriptor:(id)a3 withInt:(int)a4;
- (void)mincoreWithLong:(int64_t)a3 withLong:(int64_t)a4 withByteArray:(id)a5;
- (void)mkdirWithNSString:(id)a3 withInt:(int)a4;
- (void)mlockWithLong:(int64_t)a3 withLong:(int64_t)a4;
- (void)msyncWithLong:(int64_t)a3 withLong:(int64_t)a4 withInt:(int)a5;
- (void)munlockWithLong:(int64_t)a3 withLong:(int64_t)a4;
- (void)munmapWithLong:(int64_t)a3 withLong:(int64_t)a4;
- (void)removeWithNSString:(id)a3;
- (void)renameWithNSString:(id)a3 withNSString:(id)a4;
- (void)setsockoptByteWithJavaIoFileDescriptor:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6;
- (void)setsockoptGroupReqWithJavaIoFileDescriptor:(id)a3 withInt:(int)a4 withInt:(int)a5 withLibcoreIoStructGroupReq:(id)a6;
- (void)setsockoptGroupSourceReqWithJavaIoFileDescriptor:(id)a3 withInt:(int)a4 withInt:(int)a5 withLibcoreIoStructGroupSourceReq:(id)a6;
- (void)setsockoptIfreqWithJavaIoFileDescriptor:(id)a3 withInt:(int)a4 withInt:(int)a5 withNSString:(id)a6;
- (void)setsockoptIntWithJavaIoFileDescriptor:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6;
- (void)setsockoptIpMreqnWithJavaIoFileDescriptor:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6;
- (void)setsockoptLingerWithJavaIoFileDescriptor:(id)a3 withInt:(int)a4 withInt:(int)a5 withLibcoreIoStructLinger:(id)a6;
- (void)setsockoptTimevalWithJavaIoFileDescriptor:(id)a3 withInt:(int)a4 withInt:(int)a5 withLibcoreIoStructTimeval:(id)a6;
- (void)shutdownWithJavaIoFileDescriptor:(id)a3 withInt:(int)a4;
- (void)socketpairWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withJavaIoFileDescriptor:(id)a6 withJavaIoFileDescriptor:(id)a7;
- (void)symlinkWithNSString:(id)a3 withNSString:(id)a4;
- (void)tcdrainWithJavaIoFileDescriptor:(id)a3;
@end

@implementation LibcoreIoPosix

+ (void)throwErrnoExceptionWithNSString:(id)a3 withInt:(int)a4
{
  v4 = new_LibcoreIoErrnoException_initWithNSString_withInt_(a3, a4);
  objc_exception_throw(v4);
}

+ (int)throwIfMinusOneWithNSString:(id)a3 withInt:(int)a4
{
  return sub_100206E80(a3, *(uint64_t *)&a4);
}

- (id)acceptWithJavaIoFileDescriptor:(id)a3 withJavaNetInetSocketAddress:(id)a4
{
  int v17 = 128;
  memset(v18, 0, sizeof(v18));
  if (a4) {
    v6 = (sockaddr *)v18;
  }
  else {
    v6 = 0;
  }
  if (a4) {
    v7 = (socklen_t *)&v17;
  }
  else {
    v7 = 0;
  }
  while (1)
  {
    id v8 = [a3 getInt$];
    int v9 = (int)v8;
    LibcoreIoAsynchronousCloseMonitor_newAsynchronousSocketCloseMonitorWithInt_((uint64_t)v8);
    uint64_t v10 = accept(v9, v6, v7);
    int v11 = [a3 getInt$];
    if (v10 != -1) {
      break;
    }
    if (v11 == -1)
    {
      v14 = [[JavaNetSocketException alloc] initWithNSString:@"Socket closed"];
LABEL_16:
      objc_exception_throw(v14);
    }
    if (*__error() != 4)
    {
      v12 = +[NSString stringWithFormat:@"%s", "accept"];
      v13 = __error();
      v14 = (JavaNetSocketException *)new_LibcoreIoErrnoException_initWithNSString_withInt_(v12, *v13);
      goto LABEL_16;
    }
  }
  if (sub_100207038(v11, (uint64_t)a4, (uint64_t)v18))
  {
    v15 = objc_alloc_init(JavaIoFileDescriptor);
    [(JavaIoFileDescriptor *)v15 setInt$WithInt:v10];
  }
  else
  {
    close(v10);
    return 0;
  }
  return v15;
}

- (BOOL)accessWithNSString:(id)a3 withInt:(int)a4
{
  if (!a3) {
    return 0;
  }
  v5 = absolutePath(a3);
  while (1)
  {
    int v6 = access(v5, a4);
    if (v6 != -1) {
      break;
    }
    if (*__error() != 4)
    {
      v7 = __error();
      id v8 = new_LibcoreIoErrnoException_initWithNSString_withInt_(@"access", *v7);
      objc_exception_throw(v8);
    }
  }
  return v6 == 0;
}

- (void)bindWithJavaIoFileDescriptor:(id)a3 withJavaNetInetAddress:(id)a4 withInt:(int)a5
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  sockaddr v13 = (sockaddr)0;
  long long v14 = 0u;
  socklen_t v12 = 0;
  sub_100206BC0((id *)a4, a5, (uint64_t)&v13, (int *)&v12, 1);
  socklen_t v6 = v12;
  while (1)
  {
    id v7 = [a3 getInt$];
    int v8 = (int)v7;
    LibcoreIoAsynchronousCloseMonitor_newAsynchronousSocketCloseMonitorWithInt_((uint64_t)v7);
    if (bind(v8, &v13, v6) != -1) {
      break;
    }
    if ([a3 getInt$] == -1)
    {
      int v11 = [[JavaNetSocketException alloc] initWithNSString:@"Socket closed"];
LABEL_8:
      objc_exception_throw(v11);
    }
    if (*__error() != 4)
    {
      int v9 = +[NSString stringWithFormat:@"%s", "bind"];
      uint64_t v10 = __error();
      int v11 = (JavaNetSocketException *)new_LibcoreIoErrnoException_initWithNSString_withInt_(v9, *v10);
      goto LABEL_8;
    }
  }
}

- (BOOL)canAccessWithNSString:(id)a3 withInt:(int)a4
{
  if (!a3) {
    return 0;
  }
  v5 = absolutePath(a3);
  do
    int v6 = access(v5, a4);
  while (v6 == -1 && *__error() == 4);
  return v6 == 0;
}

- (void)chmodWithNSString:(id)a3 withInt:(int)a4
{
  if (a3)
  {
    mode_t v4 = a4;
    v5 = absolutePath(a3);
    do
      uint64_t v6 = chmod(v5, v4);
    while (v6 == -1 && *__error() == 4);
    sub_100206E80(@"chmod", v6);
  }
}

- (void)chownWithNSString:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  if (a3)
  {
    id v7 = absolutePath(a3);
    do
      uint64_t v8 = chown(v7, a4, a5);
    while (v8 == -1 && *__error() == 4);
    sub_100206E80(@"chown", v8);
  }
}

- (void)closeWithJavaIoFileDescriptor:(id)a3
{
  int v4 = [a3 getInt$];
  [a3 setInt$WithInt:0xFFFFFFFFLL];
  uint64_t v5 = close(v4);
  sub_100206E80(@"close", v5);
}

- (void)connectWithJavaIoFileDescriptor:(id)a3 withJavaNetInetAddress:(id)a4 withInt:(int)a5
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  sockaddr v13 = (sockaddr)0;
  long long v14 = 0u;
  socklen_t v12 = 0;
  sub_100206BC0((id *)a4, a5, (uint64_t)&v13, (int *)&v12, 1);
  socklen_t v6 = v12;
  while (1)
  {
    id v7 = [a3 getInt$];
    int v8 = (int)v7;
    LibcoreIoAsynchronousCloseMonitor_newAsynchronousSocketCloseMonitorWithInt_((uint64_t)v7);
    if (connect(v8, &v13, v6) != -1) {
      break;
    }
    if ([a3 getInt$] == -1)
    {
      int v11 = [[JavaNetSocketException alloc] initWithNSString:@"Socket closed"];
LABEL_8:
      objc_exception_throw(v11);
    }
    if (*__error() != 4)
    {
      int v9 = +[NSString stringWithFormat:@"%s", "connect"];
      uint64_t v10 = __error();
      int v11 = (JavaNetSocketException *)new_LibcoreIoErrnoException_initWithNSString_withInt_(v9, *v10);
      goto LABEL_8;
    }
  }
}

- (id)dupWithJavaIoFileDescriptor:(id)a3
{
  do
    uint64_t v4 = dup((int)[a3 getInt$]);
  while (v4 == -1 && *__error() == 4);
  sub_100206E80(@"dup", v4);
  uint64_t v5 = objc_alloc_init(JavaIoFileDescriptor);
  [(JavaIoFileDescriptor *)v5 setInt$WithInt:v4];
  return v5;
}

- (id)dup2WithJavaIoFileDescriptor:(id)a3 withInt:(int)a4
{
  do
    uint64_t v6 = dup2((int)[a3 getInt$], a4);
  while (v6 == -1 && *__error() == 4);
  sub_100206E80(@"dup2", v6);
  id v7 = objc_alloc_init(JavaIoFileDescriptor);
  [(JavaIoFileDescriptor *)v7 setInt$WithInt:v6];
  return v7;
}

- (void)fchmodWithJavaIoFileDescriptor:(id)a3 withInt:(int)a4
{
  mode_t v5 = a4;
  do
    uint64_t v6 = fchmod((int)[a3 getInt$], v5);
  while (v6 == -1 && *__error() == 4);
  sub_100206E80(@"fchmod", v6);
}

- (void)fchownWithJavaIoFileDescriptor:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  do
    uint64_t v8 = fchown((int)[a3 getInt$], a4, a5);
  while (v8 == -1 && *__error() == 4);
  sub_100206E80(@"fchown", v8);
}

- (int)fcntlFlockWithJavaIoFileDescriptor:(id)a3 withInt:(int)a4 withLibcoreIoStructFlock:(id)a5
{
  __int16 v16 = *((_WORD *)a5 + 4);
  __int16 v17 = *((_WORD *)a5 + 5);
  uint64_t v8 = *((void *)a5 + 3);
  uint64_t v13 = *((void *)a5 + 2);
  uint64_t v14 = v8;
  int v15 = *((_DWORD *)a5 + 8);
  while (1)
  {
    int result = fcntl((int)[a3 getInt$], a4, &v13);
    if (result != -1) {
      break;
    }
    if (*__error() != 4)
    {
      uint64_t v10 = __error();
      int v11 = new_LibcoreIoErrnoException_initWithNSString_withInt_(@"fcntl", *v10);
      objc_exception_throw(v11);
    }
  }
  *((_WORD *)a5 + 4) = v16;
  *((_WORD *)a5 + 5) = v17;
  uint64_t v12 = v14;
  *((void *)a5 + 2) = v13;
  *((void *)a5 + 3) = v12;
  *((_DWORD *)a5 + 8) = v15;
  return result;
}

- (int)fcntlLongWithJavaIoFileDescriptor:(id)a3 withInt:(int)a4 withLong:(int64_t)a5
{
  do
    uint64_t v8 = fcntl((int)[a3 getInt$], a4, a5);
  while (v8 == -1 && *__error() == 4);
  return sub_100206E80(@"fcntl", v8);
}

- (int)fcntlVoidWithJavaIoFileDescriptor:(id)a3 withInt:(int)a4
{
  do
    uint64_t v6 = fcntl((int)[a3 getInt$], a4);
  while (v6 == -1 && *__error() == 4);
  return sub_100206E80(@"fcntl", v6);
}

- (void)fdatasyncWithJavaIoFileDescriptor:(id)a3
{
  do
    uint64_t v4 = fsync((int)[a3 getInt$]);
  while (v4 == -1 && *__error() == 4);
  sub_100206E80(@"fdatasync", v4);
}

- (id)fstatWithJavaIoFileDescriptor:(id)a3
{
  memset(&v6, 0, sizeof(v6));
  while (fstat((int)objc_msgSend(a3, "getInt$", *(_OWORD *)&v6.st_dev, *(_OWORD *)&v6.st_uid, *(_OWORD *)&v6.st_atimespec, *(_OWORD *)&v6.st_mtimespec, *(_OWORD *)&v6.st_ctimespec, *(_OWORD *)&v6.st_birthtimespec, *(_OWORD *)&v6.st_size, *(_OWORD *)&v6.st_blksize, *(_OWORD *)v6.st_qspare), &v6) == -1)
  {
    if (*__error() != 4)
    {
      uint64_t v4 = new_LibcoreIoErrnoException_initWithNSString_withInt_(@"fstat", 0xFFFFFFFF);
      objc_exception_throw(v4);
    }
  }
  return sub_100207A80(&v6.st_dev);
}

- (void)fsyncWithJavaIoFileDescriptor:(id)a3
{
  do
    uint64_t v4 = fsync((int)[a3 getInt$]);
  while (v4 == -1 && *__error() == 4);
  sub_100206E80(@"fsync", v4);
}

- (void)ftruncateWithJavaIoFileDescriptor:(id)a3 withLong:(int64_t)a4
{
  do
    uint64_t v6 = ftruncate((int)[a3 getInt$], a4);
  while (v6 == -1 && *__error() == 4);
  sub_100206E80(@"ftruncate", v6);
}

- (id)gai_strerrorWithInt:(int)a3
{
  v3 = gai_strerror(a3);
  return +[NSString stringWithUTF8String:v3];
}

- (id)getaddrinfoWithNSString:(id)a3 withLibcoreIoStructAddrinfo:(id)a4
{
  uint64_t v4 = (IOSObjectArray *)a3;
  if (a3)
  {
    int v5 = *((_DWORD *)a4 + 3);
    int v6 = *((_DWORD *)a4 + 4);
    v28.ai_flags = *((_DWORD *)a4 + 2);
    v28.int ai_family = v5;
    int v7 = *((_DWORD *)a4 + 5);
    memset(&v28.ai_addrlen, 0, 32);
    v28.ai_socktype = v6;
    v28.ai_protocol = v7;
    v27 = 0;
    *__error() = 0;
    uint64_t v8 = getaddrinfo((const char *)[(IOSObjectArray *)v4 UTF8String], 0, &v28, &v27);
    if (v8) {
      objc_exception_throw([[LibcoreIoGaiException alloc] initWithNSString:@"getaddrinfo" withInt:v8]);
    }
    int v9 = v27;
    if (!v27) {
      goto LABEL_24;
    }
    int v10 = 0;
    do
    {
      int ai_family = v9->ai_family;
      if (ai_family == 30 || ai_family == 2) {
        ++v10;
      }
      else {
        JavaLangSystem_logEWithNSString_((uint64_t)+[NSString stringWithFormat:@"getaddrinfo unexpected ai_family %i", v9->ai_family]);
      }
      int v9 = v9->ai_next;
    }
    while (v9);
    if (v10)
    {
      uint64_t v4 = +[IOSObjectArray arrayWithLength:v10 type:JavaNetInetAddress_class_()];
      uint64_t v13 = v27;
      if (v27)
      {
        int v14 = 0;
        do
        {
          int v15 = v13->ai_family;
          if (v15 == 2 || v15 == 30)
          {
            sockaddr v35 = (sockaddr)0;
            sockaddr v36 = (sockaddr)0;
            sockaddr v34 = (sockaddr)0;
            sockaddr v32 = (sockaddr)0;
            sockaddr v33 = (sockaddr)0;
            sockaddr v30 = (sockaddr)0;
            sockaddr v31 = (sockaddr)0;
            sockaddr v29 = (sockaddr)0;
            ai_addr = v13->ai_addr;
            sockaddr v19 = *ai_addr;
            sockaddr v18 = ai_addr[1];
            sockaddr v20 = ai_addr[3];
            sockaddr v31 = ai_addr[2];
            sockaddr v21 = ai_addr[4];
            sockaddr v22 = ai_addr[5];
            sockaddr v23 = ai_addr[7];
            sockaddr v35 = ai_addr[6];
            sockaddr v36 = v23;
            sockaddr v34 = v22;
            sockaddr v29 = v19;
            sockaddr v30 = v18;
            sockaddr v32 = v20;
            sockaddr v33 = v21;
            v24 = sockaddrToInetAddress((uint64_t)&v29, 0);
            if (!v24) {
              goto LABEL_24;
            }
            [(IOSObjectArray *)v4 replaceObjectAtIndex:v14++ withObject:v24];
          }
          else
          {
            JavaLangSystem_logEWithNSString_((uint64_t)+[NSString stringWithFormat:@"getaddrinfo unexpected ai_family %i", v13->ai_family]);
          }
          uint64_t v13 = v13->ai_next;
        }
        while (v13);
        v25 = v27;
      }
      else
      {
        v25 = 0;
      }
      freeaddrinfo(v25);
    }
    else
    {
LABEL_24:
      freeaddrinfo(v27);
      return 0;
    }
  }
  return v4;
}

- (id)getnameinfoWithJavaNetInetAddress:(id)a3 withInt:(int)a4
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  sockaddr v9 = (sockaddr)0;
  long long v10 = 0u;
  socklen_t v7 = 0;
  sub_100206BC0((id *)a3, 0, (uint64_t)&v9, (int *)&v7, 0);
  *__error() = 0;
  uint64_t v5 = getnameinfo(&v9, v7, v8, 0x401u, 0, 0, a4);
  if (v5) {
    objc_exception_throw([[LibcoreIoGaiException alloc] initWithNSString:@"getnameinfo" withInt:v5]);
  }
  return +[NSString stringWithUTF8String:v8];
}

- (id)getsocknameWithJavaIoFileDescriptor:(id)a3
{
  int v3 = [a3 getInt$];
  socklen_t v8 = 128;
  sockaddr v10 = (sockaddr)0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  while (getsockname(v3, &v10, &v8) == -1)
  {
    if (*__error() != 4)
    {
      uint64_t v4 = new_LibcoreIoErrnoException_initWithNSString_withInt_(@"getsockname", 0xFFFFFFFF);
      objc_exception_throw(v4);
    }
  }
  unsigned int v9 = 0;
  id result = sockaddrToInetAddress((uint64_t)&v10, &v9);
  if (result)
  {
    id v6 = result;
    socklen_t v7 = [JavaNetInetSocketAddress alloc];
    return [(JavaNetInetSocketAddress *)v7 initWithJavaNetInetAddress:v6 withInt:v9];
  }
  return result;
}

- (int)getsockoptByteWithJavaIoFileDescriptor:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  unsigned __int8 v11 = 0;
  socklen_t v10 = 1;
  while (getsockopt((int)[a3 getInt$], a4, a5, &v11, &v10) == -1)
  {
    if (*__error() != 4)
    {
      socklen_t v8 = new_LibcoreIoErrnoException_initWithNSString_withInt_(@"getsockopt", 0xFFFFFFFF);
      objc_exception_throw(v8);
    }
  }
  return v11;
}

- (id)getsockoptInAddrWithJavaIoFileDescriptor:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  memset(v11, 0, sizeof(v11));
  BYTE1(v11[0]) = 2;
  socklen_t v10 = 4;
  while (getsockopt((int)[a3 getInt$], a4, a5, (char *)v11 + 4, &v10) == -1)
  {
    if (*__error() != 4)
    {
      socklen_t v8 = new_LibcoreIoErrnoException_initWithNSString_withInt_(@"getsockopt", 0xFFFFFFFF);
      objc_exception_throw(v8);
    }
  }
  return sockaddrToInetAddress((uint64_t)v11, 0);
}

- (int)getsockoptIntWithJavaIoFileDescriptor:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  socklen_t v10 = 4;
  int v11 = 0;
  while (getsockopt((int)[a3 getInt$], a4, a5, &v11, &v10) == -1)
  {
    if (*__error() != 4)
    {
      socklen_t v8 = new_LibcoreIoErrnoException_initWithNSString_withInt_(@"getsockopt", 0xFFFFFFFF);
      objc_exception_throw(v8);
    }
  }
  return v11;
}

- (id)getsockoptLingerWithJavaIoFileDescriptor:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  socklen_t v11 = 8;
  uint64_t v12 = 0;
  while (getsockopt((int)[a3 getInt$], a4, a5, &v12, &v11) == -1)
  {
    if (*__error() != 4)
    {
      socklen_t v8 = new_LibcoreIoErrnoException_initWithNSString_withInt_(@"getsockopt", 0xFFFFFFFF);
      objc_exception_throw(v8);
    }
  }
  unsigned int v9 = [LibcoreIoStructLinger alloc];
  return [(LibcoreIoStructLinger *)v9 initWithInt:v12 withInt:HIDWORD(v12)];
}

- (id)getsockoptTimevalWithJavaIoFileDescriptor:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  socklen_t v11 = 16;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  while (getsockopt((int)[a3 getInt$], a4, a5, &v12, &v11) == -1)
  {
    if (*__error() != 4)
    {
      socklen_t v8 = new_LibcoreIoErrnoException_initWithNSString_withInt_(@"getsockopt", 0xFFFFFFFF);
      objc_exception_throw(v8);
    }
  }
  unsigned int v9 = [LibcoreIoStructTimeval alloc];
  return [(LibcoreIoStructTimeval *)v9 initWithLong:v12 withLong:(int)v13];
}

- (id)if_indextonameWithInt:(int)a3
{
  id result = if_indextoname(a3, v4);
  if (result) {
    return +[NSString stringWithUTF8String:result];
  }
  return result;
}

- (id)inet_ptonWithInt:(int)a3 withNSString:(id)a4
{
  if (!a4) {
    return 0;
  }
  char v4 = a3;
  if (inet_pton(a3, (const char *)objc_msgSend(a4, "UTF8String", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                         0),
         &v7) != 1)
    return 0;
  v6[1] = v4;
  return sockaddrToInetAddress((uint64_t)v6, 0);
}

- (id)ioctlInetAddressWithJavaIoFileDescriptor:(id)a3 withInt:(int)a4 withNSString:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  long long v20 = 0u;
  long long v21 = 0u;
  if (!sub_10020868C(a5, (uint64_t)&v20)) {
    return 0;
  }
  while (1)
  {
    int v8 = ioctl((int)[a3 getInt$], (int)v6, &v20);
    if (v8 != -1) {
      break;
    }
    if (*__error() != 4) {
      goto LABEL_8;
    }
  }
  if (!v8) {
    return sockaddrToInetAddress((uint64_t)&v21, 0);
  }
LABEL_8:
  unsigned int v10 = *__error();
  socklen_t v11 = +[NSString stringWithFormat:@"ioctl (%d, %@)", v6, a5];
  if (v10 != 45 && v10 != 102)
  {
LABEL_21:
    sockaddr v18 = new_LibcoreIoErrnoException_initWithNSString_withInt_(v11, v10);
    objc_exception_throw(v18);
  }
  sockaddr v19 = 0;
  if (getifaddrs(&v19))
  {
    uint64_t v13 = v19;
    goto LABEL_20;
  }
  uint64_t v12 = (const char *)[a5 UTF8String];
  uint64_t v13 = v19;
  if (!v19)
  {
LABEL_20:
    freeifaddrs(v13);
    goto LABEL_21;
  }
  long long v14 = v12;
  long long v15 = 0;
  long long v16 = v19;
  do
  {
    ifa_addr = v16->ifa_addr;
    if (ifa_addr->sa_family == 2 && !strcmp(v16->ifa_name, v14)) {
      long long v15 = &ifa_addr->sa_data[2];
    }
    long long v16 = v16->ifa_next;
  }
  while (v16);
  freeifaddrs(v13);
  if (!v15) {
    goto LABEL_21;
  }
  return JavaNetInetAddress_getByAddressWithNSString_withByteArray_withInt_(0, +[IOSByteArray arrayWithBytes:v15 count:4], 0);
}

- (int)ioctlIntWithJavaIoFileDescriptor:(id)a3 withInt:(int)a4 withLibcoreUtilMutableInt:(id)a5
{
  int v10 = *((_DWORD *)a5 + 2);
  unint64_t v7 = a4;
  while (1)
  {
    int result = ioctl((int)[a3 getInt$], v7, &v10);
    if (result != -1) {
      break;
    }
    if (*__error() != 4)
    {
      unsigned int v9 = new_LibcoreIoErrnoException_initWithNSString_withInt_(@"ioctl", 0xFFFFFFFF);
      objc_exception_throw(v9);
    }
  }
  *((_DWORD *)a5 + 2) = v10;
  return result;
}

- (BOOL)isattyWithJavaIoFileDescriptor:(id)a3
{
  do
    int v4 = isatty((int)[a3 getInt$]);
  while (v4 == -1 && *__error() == 4);
  return v4 == 1;
}

- (int64_t)lseekWithJavaIoFileDescriptor:(id)a3 withLong:(int64_t)a4 withInt:(int)a5
{
  do
    off_t v8 = lseek((int)[a3 getInt$], a4, a5);
  while (v8 == -1 && *__error() == 4);
  if (v8 << 32 == 0xFFFFFFFF00000000)
  {
    int v10 = __error();
    socklen_t v11 = new_LibcoreIoErrnoException_initWithNSString_withInt_(@"lseek", *v10);
    objc_exception_throw(v11);
  }
  return (int)v8;
}

- (id)lstatWithNSString:(id)a3
{
  return sub_100208874((LibcoreIoStructStat *)a3, 1);
}

- (void)listenWithJavaIoFileDescriptor:(id)a3 withInt:(int)a4
{
  do
    uint64_t v6 = listen((int)[a3 getInt$], a4);
  while (v6 == -1 && *__error() == 4);
  sub_100206E80(@"listen", v6);
}

- (void)mincoreWithLong:(int64_t)a3 withLong:(int64_t)a4 withByteArray:(id)a5
{
  do
    uint64_t v8 = mincore((const void *)a3, a4, (char *)a5 + 12);
  while (v8 == -1 && *__error() == 4);
  sub_100206E80(@"mincore", v8);
}

- (void)mkdirWithNSString:(id)a3 withInt:(int)a4
{
  if (a3)
  {
    mode_t v4 = a4;
    uint64_t v5 = absolutePath(a3);
    do
      uint64_t v6 = mkdir(v5, v4);
    while (v6 == -1 && *__error() == 4);
    sub_100206E80(@"mkdir", v6);
  }
}

- (void)mlockWithLong:(int64_t)a3 withLong:(int64_t)a4
{
  do
    uint64_t v6 = mlock((const void *)a3, a4);
  while (v6 == -1 && *__error() == 4);
  sub_100206E80(@"mlock", v6);
}

- (int64_t)mmapWithLong:(int64_t)a3 withLong:(int64_t)a4 withInt:(int)a5 withInt:(int)a6 withJavaIoFileDescriptor:(id)a7 withLong:(int64_t)a8
{
  int64_t result = (int64_t)mmap((void *)a3, a4, a5, a6, (int)[a7 getInt$], a8);
  if (result == -1)
  {
    unsigned int v9 = __error();
    int v10 = new_LibcoreIoErrnoException_initWithNSString_withInt_(@"mmap", *v9);
    objc_exception_throw(v10);
  }
  return result;
}

- (void)msyncWithLong:(int64_t)a3 withLong:(int64_t)a4 withInt:(int)a5
{
  do
    uint64_t v8 = msync((void *)a3, a4, a5);
  while (v8 == -1 && *__error() == 4);
  sub_100206E80(@"msync", v8);
}

- (void)munlockWithLong:(int64_t)a3 withLong:(int64_t)a4
{
  do
    uint64_t v6 = munlock((const void *)a3, a4);
  while (v6 == -1 && *__error() == 4);
  sub_100206E80(@"munlock", v6);
}

- (void)munmapWithLong:(int64_t)a3 withLong:(int64_t)a4
{
  do
    uint64_t v6 = munmap((void *)a3, a4);
  while (v6 == -1 && *__error() == 4);
  sub_100206E80(@"munmap", v6);
}

- (id)openWithNSString:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  if (!a3) {
    return 0;
  }
  uint64_t v5 = *(void *)&a5;
  unint64_t v7 = absolutePath(a3);
  do
    uint64_t v8 = open(v7, a4, v5);
  while (v8 == -1 && *__error() == 4);
  sub_100206E80(@"open", v8);
  unsigned int v9 = objc_alloc_init(JavaIoFileDescriptor);
  [(JavaIoFileDescriptor *)v9 setInt$WithInt:v8];
  return v9;
}

- (id)pipe
{
  do
    uint64_t v2 = pipe(v7);
  while (v2 == -1 && *__error() == 4);
  sub_100206E80(@"pipe", v2);
  int v3 = +[IOSObjectArray arrayWithLength:2 type:JavaIoFileDescriptor_class_()];
  mode_t v4 = objc_alloc_init(JavaIoFileDescriptor);
  [(JavaIoFileDescriptor *)v4 setInt$WithInt:v7[0]];
  [(IOSObjectArray *)v3 replaceObjectAtIndex:0 withObject:v4];
  uint64_t v5 = objc_alloc_init(JavaIoFileDescriptor);
  [(JavaIoFileDescriptor *)v5 setInt$WithInt:v7[1]];
  [(IOSObjectArray *)v3 replaceObjectAtIndex:1 withObject:v5];
  return v3;
}

- (int)pollWithLibcoreIoStructPollfdArray:(id)a3 withInt:(int)a4
{
  signed int v6 = *((_DWORD *)a3 + 2);
  uint64_t v7 = v6;
  uint64_t v8 = (pollfd *)malloc_type_calloc(v6, 8uLL, 0x100004000313F17uLL);
  unsigned int v9 = v8;
  if (v6 < 1)
  {
    int v15 = poll(v8, v6, a4);
    if (v15 != -1) {
      goto LABEL_13;
    }
LABEL_14:
    free(v9);
    long long v20 = new_LibcoreIoErrnoException_initWithNSString_withInt_(@"poll", 0xFFFFFFFF);
    objc_exception_throw(v20);
  }
  uint64_t v10 = 0;
  p_events = &v8->events;
  do
  {
    uint64_t v12 = (id *)[a3 objectAtIndex:v10];
    if (v12)
    {
      uint64_t v13 = v12;
      *((_DWORD *)p_events - 1) = [v12[1] getInt$];
      __int16 *p_events = *((_WORD *)v13 + 8);
    }
    ++v10;
    p_events += 4;
  }
  while (v7 != v10);
  int v14 = poll(v9, v7, a4);
  if (v14 == -1) {
    goto LABEL_14;
  }
  int v15 = v14;
  uint64_t v16 = 0;
  p_revents = &v9->revents;
  do
  {
    sockaddr v18 = [a3 objectAtIndex:v16];
    if (v18) {
      v18[9] = *p_revents;
    }
    ++v16;
    p_revents += 4;
  }
  while (v7 != v16);
LABEL_13:
  free(v9);
  return v15;
}

- (int)preadWithJavaIoFileDescriptor:(id)a3 withJavaNioByteBuffer:(id)a4 withLong:(int64_t)a5
{
  if (!a4) {
    JreThrowNullPointerException();
  }
  if ([a4 isDirect])
  {
    unsigned int v8 = [a4 position];
    int v9 = [a4 remaining];
    id v10 = a3;
    uint64_t v11 = (uint64_t)a4;
    int v12 = v8;
  }
  else
  {
    uint64_t v13 = JavaNioNioUtils_unsafeArrayWithJavaNioByteBuffer_((uint64_t)a4);
    int v14 = JavaNioNioUtils_unsafeArrayOffsetWithJavaNioByteBuffer_((uint64_t)a4);
    int v15 = [a4 position] + v14;
    int v9 = [a4 remaining];
    id v10 = a3;
    uint64_t v11 = v13;
    int v12 = v15;
  }
  return sub_10020910C(v10, v11, v12, v9, a5);
}

- (int)preadWithJavaIoFileDescriptor:(id)a3 withByteArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withLong:(int64_t)a7
{
  return sub_10020910C(a3, (uint64_t)a4, a5, a6, a7);
}

- (int)preadBytesWithJavaIoFileDescriptor:(id)a3 withId:(id)a4 withInt:(int)a5 withInt:(int)a6 withLong:(int64_t)a7
{
  return sub_10020910C(a3, (uint64_t)a4, a5, a6, a7);
}

- (int)pwriteWithJavaIoFileDescriptor:(id)a3 withJavaNioByteBuffer:(id)a4 withLong:(int64_t)a5
{
  if (!a4) {
    JreThrowNullPointerException();
  }
  if ([a4 isDirect])
  {
    unsigned int v8 = [a4 position];
    int v9 = [a4 remaining];
    id v10 = a3;
    uint64_t v11 = (uint64_t)a4;
    int v12 = v8;
  }
  else
  {
    uint64_t v13 = JavaNioNioUtils_unsafeArrayWithJavaNioByteBuffer_((uint64_t)a4);
    int v14 = JavaNioNioUtils_unsafeArrayOffsetWithJavaNioByteBuffer_((uint64_t)a4);
    int v15 = [a4 position] + v14;
    int v9 = [a4 remaining];
    id v10 = a3;
    uint64_t v11 = v13;
    int v12 = v15;
  }
  return sub_100209328(v10, v11, v12, v9, a5);
}

- (int)pwriteWithJavaIoFileDescriptor:(id)a3 withByteArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withLong:(int64_t)a7
{
  return sub_100209328(a3, (uint64_t)a4, a5, a6, a7);
}

- (int)pwriteBytesWithJavaIoFileDescriptor:(id)a3 withId:(id)a4 withInt:(int)a5 withInt:(int)a6 withLong:(int64_t)a7
{
  return sub_100209328(a3, (uint64_t)a4, a5, a6, a7);
}

- (int)readWithJavaIoFileDescriptor:(id)a3 withJavaNioByteBuffer:(id)a4
{
  if (!a4) {
    JreThrowNullPointerException();
  }
  if ([a4 isDirect])
  {
    unsigned int v6 = [a4 position];
    int v7 = [a4 remaining];
    id v8 = a3;
    uint64_t v9 = (uint64_t)a4;
    int v10 = v6;
  }
  else
  {
    uint64_t v11 = JavaNioNioUtils_unsafeArrayWithJavaNioByteBuffer_((uint64_t)a4);
    int v12 = JavaNioNioUtils_unsafeArrayOffsetWithJavaNioByteBuffer_((uint64_t)a4);
    int v13 = [a4 position] + v12;
    int v7 = [a4 remaining];
    id v8 = a3;
    uint64_t v9 = v11;
    int v10 = v13;
  }
  return sub_100209554(v8, v9, v10, v7);
}

- (int)readWithJavaIoFileDescriptor:(id)a3 withByteArray:(id)a4 withInt:(int)a5 withInt:(int)a6
{
  return sub_100209554(a3, (uint64_t)a4, a5, a6);
}

- (int)readBytesWithJavaIoFileDescriptor:(id)a3 withId:(id)a4 withInt:(int)a5 withInt:(int)a6
{
  return sub_100209554(a3, (uint64_t)a4, a5, a6);
}

- (int)readvWithJavaIoFileDescriptor:(id)a3 withNSObjectArray:(id)a4 withIntArray:(id)a5 withIntArray:(id)a6
{
  uint64_t v9 = *((int *)a4 + 2);
  uint64_t v10 = *((unsigned int *)a4 + 2);
  uint64_t v11 = (iovec *)malloc_type_malloc(16 * v9, 0x1080040FC6463CFuLL);
  int v12 = v11;
  if ((int)v9 > 0)
  {
    uint64_t v13 = 0;
    p_iov_len = &v11->iov_len;
    int v15 = &OBJC_IVAR___IOSIntArray_buffer_;
    while (1)
    {
      uint64_t v16 = v15;
      long long v17 = [a4 objectAtIndex:v13];
      if (!v17) {
        JreThrowNullPointerException();
      }
      sockaddr v18 = v17;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v19 = *((unsigned int *)v18 + 2);
        int v15 = v16;
        if ((int)v19 <= 0) {
          IOSArray_throwOutOfBoundsWithMsg(v19, 0);
        }
        long long v20 = (char *)v18 + 12;
        if (!v20)
        {
LABEL_20:
          free(v12);
          LODWORD(v23) = -1;
          return v23;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_20;
        }
        int v15 = v16;
        long long v20 = (char *)v18[4];
        if (!v20) {
          goto LABEL_20;
        }
      }
      uint64_t v21 = *((int *)a5 + 2);
      if (v13 >= v21) {
        IOSArray_throwOutOfBoundsWithMsg(v21, v13);
      }
      *(p_iov_len - 1) = (size_t)&v20[*(int *)((char *)a5 + 4 * v13 + *v15)];
      uint64_t v22 = *((int *)a6 + 2);
      if (v13 >= v22) {
        IOSArray_throwOutOfBoundsWithMsg(v22, v13);
      }
      size_t *p_iov_len = *(int *)((char *)a6 + 4 * v13 + *v15);
      p_iov_len += 2;
      if (v10 == ++v13) {
        goto LABEL_18;
      }
    }
  }
  do
LABEL_18:
    ssize_t v23 = readv((int)[a3 getInt$], v12, v10);
  while (v23 == -1 && *__error() == 4);
  free(v12);
  sub_100206E80(@"readv", v23);
  return v23;
}

- (id)realpathWithNSString:(id)a3
{
  if (!a3) {
    return 0;
  }
  mode_t v4 = +[NSFileManager defaultManager];
  uint64_t v5 = (NSString *)[a3 stringByStandardizingPath];
  if ([(NSFileManager *)v4 fileExistsAtPath:v5])
  {
    unsigned int v6 = realpath_DARWIN_EXTSN((const char *)[a3 UTF8String], 0);
    if (!v6)
    {
      uint64_t v9 = __error();
      uint64_t v10 = new_LibcoreIoErrnoException_initWithNSString_withInt_(@"realpath", *v9);
      objc_exception_throw(v10);
    }
    int v7 = v6;
    uint64_t v5 = [+[NSFileManager defaultManager] stringWithFileSystemRepresentation:v7 length:strlen(v7)];
    free(v7);
  }
  return v5;
}

- (int)recvfromWithJavaIoFileDescriptor:(id)a3 withJavaNioByteBuffer:(id)a4 withInt:(int)a5 withJavaNetInetSocketAddress:(id)a6
{
  if (!a4) {
    JreThrowNullPointerException();
  }
  if ([a4 isDirect])
  {
    unsigned int v10 = [a4 position];
    int v11 = [a4 remaining];
    id v12 = a3;
    uint64_t v13 = (uint64_t)a4;
    int v14 = v10;
  }
  else
  {
    uint64_t v15 = JavaNioNioUtils_unsafeArrayWithJavaNioByteBuffer_((uint64_t)a4);
    int v16 = JavaNioNioUtils_unsafeArrayOffsetWithJavaNioByteBuffer_((uint64_t)a4);
    int v17 = [a4 position] + v16;
    int v11 = [a4 remaining];
    id v12 = a3;
    uint64_t v13 = v15;
    int v14 = v17;
  }
  return sub_100209A3C(v12, v13, v14, v11, a5, (uint64_t)a6);
}

- (int)recvfromWithJavaIoFileDescriptor:(id)a3 withByteArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7 withJavaNetInetSocketAddress:(id)a8
{
  return sub_100209A3C(a3, (uint64_t)a4, a5, a6, a7, (uint64_t)a8);
}

- (int)recvfromBytesWithJavaIoFileDescriptor:(id)a3 withId:(id)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7 withJavaNetInetSocketAddress:(id)a8
{
  return sub_100209A3C(a3, (uint64_t)a4, a5, a6, a7, (uint64_t)a8);
}

- (void)removeWithNSString:(id)a3
{
  if (a3)
  {
    mode_t v4 = (const std::__fs::filesystem::path *)absolutePath(a3);
    do
      BOOL v5 = remove(v4, v3);
    while (v5 == -1 && *__error() == 4);
    sub_100206E80(@"remove", v5);
  }
}

- (void)renameWithNSString:(id)a3 withNSString:(id)a4
{
  if (a3 && a4)
  {
    BOOL v5 = (const std::__fs::filesystem::path *)absolutePath(a3);
    int v7 = (const std::__fs::filesystem::path *)absolutePath(a4);
    do
    {
      rename(v5, v7, v6);
      uint64_t v9 = v8;
    }
    while (v8 == -1 && *__error() == 4);
    sub_100206E80(@"rename", v9);
  }
}

- (int64_t)sendfileWithJavaIoFileDescriptor:(id)a3 withJavaIoFileDescriptor:(id)a4 withLibcoreUtilMutableLong:(id)a5 withLong:(int64_t)a6
{
  uint64_t v17 = 0;
  if (a5)
  {
    uint64_t v17 = *((void *)a5 + 1);
    unsigned int v10 = &v17;
  }
  else
  {
    unsigned int v10 = 0;
  }
  while (1)
  {
    int v11 = objc_msgSend(a3, "getInt$", v17);
    int v12 = [a4 getInt$];
    off_t v18 = a6;
    if (v10)
    {
      int v13 = sendfile(v12, v11, *v10, &v18, 0, 0);
      uint64_t v14 = v18;
      if (v13 != -1 && v18 != -1) {
        break;
      }
    }
    if (*__error() != 4)
    {
      uint64_t v14 = 0xFFFFFFFFLL;
      break;
    }
  }
  if (a5) {
    *((void *)a5 + 1) = v17;
  }
  sub_100206E80(@"sendfile", v14);
  return (int)v14;
}

- (int)sendtoWithJavaIoFileDescriptor:(id)a3 withJavaNioByteBuffer:(id)a4 withInt:(int)a5 withJavaNetInetAddress:(id)a6 withInt:(int)a7
{
  if (!a4) {
    JreThrowNullPointerException();
  }
  if ([a4 isDirect])
  {
    unsigned int v12 = [a4 position];
    int v13 = [a4 remaining];
    id v14 = a3;
    uint64_t v15 = (uint64_t)a4;
    int v16 = v12;
  }
  else
  {
    uint64_t v17 = JavaNioNioUtils_unsafeArrayWithJavaNioByteBuffer_((uint64_t)a4);
    int v18 = JavaNioNioUtils_unsafeArrayOffsetWithJavaNioByteBuffer_((uint64_t)a4);
    int v19 = [a4 position] + v18;
    int v13 = [a4 remaining];
    id v14 = a3;
    uint64_t v15 = v17;
    int v16 = v19;
  }
  return sub_100209F64(v14, v15, v16, v13, a5, (id *)a6, a7);
}

- (int)sendtoWithJavaIoFileDescriptor:(id)a3 withByteArray:(id)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7 withJavaNetInetAddress:(id)a8 withInt:(int)a9
{
  return sub_100209F64(a3, (uint64_t)a4, a5, a6, a7, (id *)a8, a9);
}

- (int)sendtoBytesWithJavaIoFileDescriptor:(id)a3 withId:(id)a4 withInt:(int)a5 withInt:(int)a6 withInt:(int)a7 withJavaNetInetAddress:(id)a8 withInt:(int)a9
{
  return sub_100209F64(a3, (uint64_t)a4, a5, a6, a7, (id *)a8, a9);
}

- (void)setsockoptByteWithJavaIoFileDescriptor:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6
{
  char v10 = a6;
  do
    uint64_t v9 = setsockopt((int)[a3 getInt$], a4, a5, &v10, 1u);
  while (v9 == -1 && *__error() == 4);
  sub_100206E80(@"setsockopt", v9);
}

- (void)setsockoptGroupReqWithJavaIoFileDescriptor:(id)a3 withInt:(int)a4 withInt:(int)a5 withLibcoreIoStructGroupReq:(id)a6
{
  long long v29 = 0u;
  long long v28 = 0u;
  long long v27 = 0u;
  long long v26 = 0u;
  long long v25 = 0u;
  long long v24 = 0u;
  long long v23 = 0u;
  long long v22 = 0u;
  unsigned int v21 = *((_DWORD *)a6 + 2);
  sub_100206BC0(*((id **)a6 + 2), 0, (uint64_t)&v22, &v11, 0);
  do
  {
    uint64_t v9 = setsockopt((int)[a3 getInt$], a4, a5, &v21, 0x84u);
    if (v9 != -1)
    {
      uint64_t v10 = v9;
      goto LABEL_11;
    }
  }
  while (*__error() == 4);
  if (*__error() == 22)
  {
    long long v17 = v26;
    long long v18 = v27;
    long long v19 = v28;
    long long v20 = v29;
    long long v13 = v22;
    long long v14 = v23;
    long long v15 = v24;
    long long v16 = v25;
    uint64_t v12 = v21;
    do
      uint64_t v10 = setsockopt((int)[a3 getInt$], a4, a5, &v12, 0x88u);
    while (v10 == -1 && *__error() == 4);
  }
  else
  {
    uint64_t v10 = 0xFFFFFFFFLL;
  }
LABEL_11:
  sub_100206E80(@"setsockopt", v10);
}

- (void)setsockoptGroupSourceReqWithJavaIoFileDescriptor:(id)a3 withInt:(int)a4 withInt:(int)a5 withLibcoreIoStructGroupSourceReq:(id)a6
{
  long long v46 = 0u;
  long long v45 = 0u;
  long long v44 = 0u;
  long long v43 = 0u;
  long long v42 = 0u;
  long long v41 = 0u;
  long long v40 = 0u;
  long long v39 = 0u;
  long long v38 = 0u;
  long long v37 = 0u;
  long long v36 = 0u;
  long long v35 = 0u;
  long long v34 = 0u;
  long long v33 = 0u;
  long long v32 = 0u;
  long long v31 = 0u;
  unsigned int v30 = *((_DWORD *)a6 + 2);
  sub_100206BC0(*((id **)a6 + 2), 0, (uint64_t)&v31, &v12, 0);
  sub_100206BC0(*((id **)a6 + 3), 0, (uint64_t)&v39, &v12, 0);
  do
  {
    uint64_t v10 = setsockopt((int)[a3 getInt$], a4, a5, &v30, 0x104u);
    if (v10 != -1)
    {
      uint64_t v11 = v10;
      goto LABEL_11;
    }
  }
  while (*__error() == 4);
  if (*__error() == 22)
  {
    long long v18 = v35;
    long long v19 = v36;
    long long v20 = v37;
    long long v21 = v38;
    long long v14 = v31;
    long long v15 = v32;
    long long v16 = v33;
    long long v17 = v34;
    long long v25 = v42;
    long long v24 = v41;
    long long v23 = v40;
    long long v22 = v39;
    long long v29 = v46;
    long long v28 = v45;
    long long v27 = v44;
    uint64_t v13 = v30;
    long long v26 = v43;
    do
      uint64_t v11 = setsockopt((int)[a3 getInt$], a4, a5, &v13, 0x108u);
    while (v11 == -1 && *__error() == 4);
  }
  else
  {
    uint64_t v11 = 0xFFFFFFFFLL;
  }
LABEL_11:
  sub_100206E80(@"setsockopt", v11);
}

- (void)setsockoptIfreqWithJavaIoFileDescriptor:(id)a3 withInt:(int)a4 withInt:(int)a5 withNSString:(id)a6
{
  memset(v10, 0, sizeof(v10));
  if (sub_10020868C(a6, (uint64_t)v10))
  {
    do
      uint64_t v9 = setsockopt((int)[a3 getInt$], a4, a5, v10, 0x20u);
    while (v9 == -1 && *__error() == 4);
    sub_100206E80(@"setsockopt", v9);
  }
}

- (void)setsockoptIntWithJavaIoFileDescriptor:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6
{
  int v10 = a6;
  do
    uint64_t v9 = setsockopt((int)[a3 getInt$], a4, a5, &v10, 4u);
  while (v9 == -1 && *__error() == 4);
  sub_100206E80(@"setsockopt", v9);
}

- (void)setsockoptIpMreqnWithJavaIoFileDescriptor:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6
{
  uint64_t v10 = 0;
  LODWORD(v11) = a6;
  do
    uint64_t v9 = setsockopt((int)objc_msgSend(a3, "getInt$", v10, v11), a4, a5, &v10, 0xCu);
  while (v9 == -1 && *__error() == 4);
  sub_100206E80(@"setsockopt", v9);
}

- (void)setsockoptLingerWithJavaIoFileDescriptor:(id)a3 withInt:(int)a4 withInt:(int)a5 withLibcoreIoStructLinger:(id)a6
{
  int v9 = *((_DWORD *)a6 + 3);
  v11[0] = *((_DWORD *)a6 + 2);
  v11[1] = v9;
  do
    uint64_t v10 = setsockopt((int)[a3 getInt$], a4, a5, v11, 8u);
  while (v10 == -1 && *__error() == 4);
  sub_100206E80(@"setsockopt", v10);
}

- (void)setsockoptTimevalWithJavaIoFileDescriptor:(id)a3 withInt:(int)a4 withInt:(int)a5 withLibcoreIoStructTimeval:(id)a6
{
  uint64_t v10 = *((void *)a6 + 1);
  uint64_t v11 = 0;
  LODWORD(v11) = *((void *)a6 + 2);
  do
    uint64_t v9 = setsockopt((int)objc_msgSend(a3, "getInt$", v10, v11), a4, a5, &v10, 0x10u);
  while (v9 == -1 && *__error() == 4);
  sub_100206E80(@"setsockopt", v9);
}

- (void)shutdownWithJavaIoFileDescriptor:(id)a3 withInt:(int)a4
{
  do
    uint64_t v6 = shutdown((int)[a3 getInt$], a4);
  while (v6 == -1 && *__error() == 4);
  sub_100206E80(@"shutdown", v6);
}

- (id)socketWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5
{
  do
    uint64_t v8 = socket(a3, a4, a5);
  while (v8 == -1 && *__error() == 4);
  sub_100206E80(@"socket", v8);
  uint64_t v9 = objc_alloc_init(JavaIoFileDescriptor);
  [(JavaIoFileDescriptor *)v9 setInt$WithInt:v8];
  return v9;
}

- (void)socketpairWithInt:(int)a3 withInt:(int)a4 withInt:(int)a5 withJavaIoFileDescriptor:(id)a6 withJavaIoFileDescriptor:(id)a7
{
  while (1)
  {
    uint64_t v12 = socketpair(a3, a4, a5, v13);
    if (v12 != -1) {
      break;
    }
    if (*__error() != 4) {
      goto LABEL_5;
    }
  }
  [a6 setInt$WithInt:v13[0]];
  [a7 setInt$WithInt:v13[1]];
LABEL_5:
  sub_100206E80(@"socketpair", v12);
}

- (id)statWithNSString:(id)a3
{
  return sub_100208874((LibcoreIoStructStat *)a3, 0);
}

- (id)statvfsWithNSString:(id)a3
{
  if (!a3) {
    return 0;
  }
  int v3 = absolutePath(a3);
  memset(&v9, 0, sizeof(v9));
  while (statvfs(v3, &v9) == -1)
  {
    if (*__error() != 4)
    {
      mode_t v4 = __error();
      BOOL v5 = new_LibcoreIoErrnoException_initWithNSString_withInt_(@"statvfs", *v4);
      objc_exception_throw(v5);
    }
  }
  uint64_t v6 = [LibcoreIoStructStatVfs alloc];
  int v7 = [(LibcoreIoStructStatVfs *)v6 initWithLong:v9.f_bsize withLong:v9.f_frsize withLong:v9.f_blocks withLong:v9.f_bfree withLong:v9.f_bavail withLong:v9.f_files withLong:v9.f_ffree withLong:v9.f_favail withLong:v9.f_fsid withLong:v9.f_flag withLong:255];
  return v7;
}

- (id)strerrorWithInt:(int)a3
{
  if (strerror_r(a3, __strerrbuf, 0x400uLL)) {
    snprintf(__strerrbuf, 0x400uLL, "errno %d", a3);
  }
  return +[NSString stringWithUTF8String:__strerrbuf];
}

- (int64_t)sysconfWithInt:(int)a3
{
  *__error() = 0;
  int64_t v4 = sysconf(a3);
  if (v4 == -1 && *__error() == 22)
  {
    uint64_t v6 = __error();
    int v7 = new_LibcoreIoErrnoException_initWithNSString_withInt_(@"sysconf", *v6);
    objc_exception_throw(v7);
  }
  return v4;
}

- (void)symlinkWithNSString:(id)a3 withNSString:(id)a4
{
  if (a3 && a4)
  {
    BOOL v5 = (const char *)[a3 UTF8String];
    uint64_t v6 = (const char *)[a4 UTF8String];
    do
      uint64_t v7 = symlink(v5, v6);
    while (v7 == -1 && *__error() == 4);
    sub_100206E80(@"symlink", v7);
  }
}

- (void)tcdrainWithJavaIoFileDescriptor:(id)a3
{
  do
    uint64_t v4 = tcdrain((int)[a3 getInt$]);
  while (v4 == -1 && *__error() == 4);
  sub_100206E80(@"fcntl", v4);
}

- (id)uname
{
  memset(&v4, 0, 512);
  while (uname(&v4) == -1)
  {
    if (*__error() != 4) {
      return 0;
    }
  }
  int v3 = +[NSString stringWithUTF8String:&v4];
  return objc_autorelease(-[LibcoreIoStructUtsname initWithNSString:withNSString:withNSString:withNSString:withNSString:]([LibcoreIoStructUtsname alloc], "initWithNSString:withNSString:withNSString:withNSString:withNSString:", v3, +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v4.nodename, *(_OWORD *)v4.sysname, *(_OWORD *)&v4.sysname[16], *(_OWORD *)&v4.sysname[32], *(_OWORD *)&v4.sysname[48], *(_OWORD *)&v4.sysname[64], *(_OWORD *)&v4.sysname[80], *(_OWORD *)&v4.sysname[96], *(_OWORD *)&v4.sysname[112], *(_OWORD *)&v4.sysname[128], *(_OWORD *)&v4.sysname[144], *(_OWORD *)&v4.sysname[160],
               *(_OWORD *)&v4.sysname[176],
               *(_OWORD *)&v4.sysname[192],
               *(_OWORD *)&v4.sysname[208],
               *(_OWORD *)&v4.sysname[224],
               *(_OWORD *)&v4.sysname[240]),
             +[NSString stringWithUTF8String:v4.release],
             +[NSString stringWithUTF8String:v4.version],
             +[NSString stringWithUTF8String:v4.machine]));
}

- (int)writeWithJavaIoFileDescriptor:(id)a3 withJavaNioByteBuffer:(id)a4
{
  if (!a4) {
    JreThrowNullPointerException();
  }
  if ([a4 isDirect])
  {
    unsigned int v6 = [a4 position];
    int v7 = [a4 remaining];
    id v8 = a3;
    uint64_t v9 = (uint64_t)a4;
    int v10 = v6;
  }
  else
  {
    uint64_t v11 = JavaNioNioUtils_unsafeArrayWithJavaNioByteBuffer_((uint64_t)a4);
    int v12 = JavaNioNioUtils_unsafeArrayOffsetWithJavaNioByteBuffer_((uint64_t)a4);
    int v13 = [a4 position] + v12;
    int v7 = [a4 remaining];
    id v8 = a3;
    uint64_t v9 = v11;
    int v10 = v13;
  }
  return sub_10020AFC8(v8, v9, v10, v7);
}

- (int)writeWithJavaIoFileDescriptor:(id)a3 withByteArray:(id)a4 withInt:(int)a5 withInt:(int)a6
{
  if (a4)
  {
    if ((a6 | a5) < 0 || a6 + a5 > *((_DWORD *)a4 + 2)) {
      IOSArray_throwOutOfBounds();
    }
    id v8 = (char *)a4 + a5;
    do
      ssize_t v9 = write((int)[a3 getInt$], v8 + 12, a6);
    while (v9 == -1 && *__error() == 4);
    sub_100206E80(@"write", v9);
  }
  else
  {
    LODWORD(v9) = -1;
  }
  return v9;
}

- (int)writeBytesWithJavaIoFileDescriptor:(id)a3 withId:(id)a4 withInt:(int)a5 withInt:(int)a6
{
  return sub_10020AFC8(a3, (uint64_t)a4, a5, a6);
}

- (int)writevWithJavaIoFileDescriptor:(id)a3 withNSObjectArray:(id)a4 withIntArray:(id)a5 withIntArray:(id)a6
{
  uint64_t v9 = *((int *)a4 + 2);
  uint64_t v10 = *((unsigned int *)a4 + 2);
  uint64_t v11 = (iovec *)malloc_type_malloc(16 * v9, 0x1080040FC6463CFuLL);
  int v12 = v11;
  if ((int)v9 > 0)
  {
    uint64_t v13 = 0;
    p_iov_len = &v11->iov_len;
    long long v15 = &OBJC_IVAR___IOSIntArray_buffer_;
    while (1)
    {
      long long v16 = v15;
      long long v17 = [a4 objectAtIndex:v13];
      if (!v17) {
        JreThrowNullPointerException();
      }
      long long v18 = v17;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v19 = *((unsigned int *)v18 + 2);
        long long v15 = v16;
        if ((int)v19 <= 0) {
          IOSArray_throwOutOfBoundsWithMsg(v19, 0);
        }
        long long v20 = (char *)v18 + 12;
        if (!v20)
        {
LABEL_20:
          free(v12);
          LODWORD(v23) = -1;
          return v23;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_20;
        }
        long long v15 = v16;
        long long v20 = (char *)v18[4];
        if (!v20) {
          goto LABEL_20;
        }
      }
      uint64_t v21 = *((int *)a5 + 2);
      if (v13 >= v21) {
        IOSArray_throwOutOfBoundsWithMsg(v21, v13);
      }
      *(p_iov_len - 1) = (size_t)&v20[*(int *)((char *)a5 + 4 * v13 + *v15)];
      uint64_t v22 = *((int *)a6 + 2);
      if (v13 >= v22) {
        IOSArray_throwOutOfBoundsWithMsg(v22, v13);
      }
      size_t *p_iov_len = *(int *)((char *)a6 + 4 * v13 + *v15);
      p_iov_len += 2;
      if (v10 == ++v13) {
        goto LABEL_18;
      }
    }
  }
  do
LABEL_18:
    ssize_t v23 = writev((int)[a3 getInt$], v12, v10);
  while (v23 == -1 && *__error() == 4);
  free(v12);
  sub_100206E80(@"writev", v23);
  return v23;
}

+ (void)updateInetSocketAddressWithJavaNetInetSocketAddress:(id)a3 withJavaNetInetAddress:(id)a4 withInt:(int)a5
{
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100444750;
}

@end