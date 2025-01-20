@interface JavaIoFile
+ (BOOL)isCaseSensitiveImpl;
+ (BOOL)setLastModifiedImplWithNSString:(id)a3 withLong:(int64_t)a4;
+ (const)__metadata;
+ (id)__annotations_toURL;
+ (id)createTempFileWithNSString:(id)a3 withNSString:(id)a4;
+ (id)createTempFileWithNSString:(id)a3 withNSString:(id)a4 withJavaIoFile:(id)a5;
+ (id)fixSlashesWithNSString:(id)a3;
+ (id)joinWithNSString:(id)a3 withNSString:(id)a4;
+ (id)listImplWithNSString:(id)a3;
+ (void)checkURIWithJavaNetURI:(id)a3;
+ (void)initialize;
- (BOOL)canExecute;
- (BOOL)canRead;
- (BOOL)canWrite;
- (BOOL)createNewFile;
- (BOOL)delete__;
- (BOOL)doAccessWithInt:(int)a3;
- (BOOL)doChmodWithInt:(int)a3 withBoolean:(BOOL)a4;
- (BOOL)exists;
- (BOOL)isAbsolute;
- (BOOL)isDirectory;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFile;
- (BOOL)isHidden;
- (BOOL)mkdir;
- (BOOL)mkdirImplWithNSString:(id)a3;
- (BOOL)renameToWithJavaIoFile:(id)a3;
- (BOOL)setExecutableWithBoolean:(BOOL)a3;
- (BOOL)setExecutableWithBoolean:(BOOL)a3 withBoolean:(BOOL)a4;
- (BOOL)setLastModifiedWithLong:(int64_t)a3;
- (BOOL)setReadOnly;
- (BOOL)setReadableWithBoolean:(BOOL)a3;
- (BOOL)setReadableWithBoolean:(BOOL)a3 withBoolean:(BOOL)a4;
- (BOOL)setWritableWithBoolean:(BOOL)a3;
- (BOOL)setWritableWithBoolean:(BOOL)a3 withBoolean:(BOOL)a4;
- (JavaIoFile)initWithJavaIoFile:(id)a3 withNSString:(id)a4;
- (JavaIoFile)initWithJavaNetURI:(id)a3;
- (JavaIoFile)initWithNSString:(id)a3;
- (JavaIoFile)initWithNSString:(id)a3 withNSString:(id)a4;
- (NSString)description;
- (__CFString)getAbsoluteName;
- (id)filenamesToFilesWithNSStringArray:(id)a3;
- (id)getAbsoluteFile;
- (id)getAbsolutePath;
- (id)getCanonicalFile;
- (id)getCanonicalPath;
- (id)getName;
- (id)getParent;
- (id)getParentFile;
- (id)getPath;
- (id)list;
- (id)listFiles;
- (id)listFilesWithJavaIoFileFilter:(id)a3;
- (id)listFilesWithJavaIoFilenameFilter:(id)a3;
- (id)listWithJavaIoFilenameFilter:(id)a3;
- (id)toURI;
- (id)toURL;
- (int)compareToWithId:(id)a3;
- (int64_t)getFreeSpace;
- (int64_t)getTotalSpace;
- (int64_t)getUsableSpace;
- (int64_t)lastModified;
- (int64_t)length;
- (uint64_t)mkdirsWithBoolean:(void *)a1;
- (unint64_t)hash;
- (void)dealloc;
- (void)deleteOnExit;
- (void)readObjectWithJavaIoObjectInputStream:(id)a3;
- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3;
@end

@implementation JavaIoFile

- (JavaIoFile)initWithJavaIoFile:(id)a3 withNSString:(id)a4
{
  if (a3) {
    v6 = (__CFString *)[a3 getPath];
  }
  else {
    v6 = 0;
  }
  JavaIoFile_initWithNSString_withNSString_((uint64_t)self, v6, a4);
  return self;
}

- (JavaIoFile)initWithNSString:(id)a3
{
  p_path = &self->path_;
  v5 = sub_1001B47FC(a3);
  JreStrongAssign((id *)p_path, v5);
  return self;
}

- (JavaIoFile)initWithNSString:(id)a3 withNSString:(id)a4
{
  return self;
}

- (JavaIoFile)initWithJavaNetURI:(id)a3
{
  return self;
}

+ (id)fixSlashesWithNSString:(id)a3
{
  return sub_1001B47FC(a3);
}

+ (id)joinWithNSString:(id)a3 withNSString:(id)a4
{
  return (id)sub_1001B49C4(a3, a4);
}

+ (void)checkURIWithJavaNetURI:(id)a3
{
}

- (BOOL)canExecute
{
  return sub_1001B4BEC((uint64_t)self, 1);
}

- (BOOL)canRead
{
  return sub_1001B4BEC((uint64_t)self, 4);
}

- (BOOL)canWrite
{
  return sub_1001B4BEC((uint64_t)self, 2);
}

- (BOOL)doAccessWithInt:(int)a3
{
  return sub_1001B4BEC((uint64_t)self, *(uint64_t *)&a3);
}

- (int)compareToWithId:(id)a3
{
  objc_opt_class();
  if (a3 && (objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  id v5 = [(JavaIoFile *)self getPath];
  if (!v5 || !a3) {
    JreThrowNullPointerException();
  }
  id v6 = [a3 getPath];
  return [v5 compareToWithId:v6];
}

- (BOOL)delete__
{
  if ((atomic_load_explicit(LibcoreIoLibcore__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (!LibcoreIoLibcore_os_) {
    JreThrowNullPointerException();
  }
  [(id)LibcoreIoLibcore_os_ removeWithNSString:self->path_];
  return 1;
}

- (void)deleteOnExit
{
  uint64_t v3 = LibcoreIoDeleteOnExit_getInstance();
  if (!v3) {
    JreThrowNullPointerException();
  }
  v4 = (void *)v3;
  id v5 = [(JavaIoFile *)self getAbsolutePath];
  [v4 addFileWithNSString:v5];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  path = self->path_;
  if (byte_100560AE0)
  {
    if (path)
    {
      objc_opt_class();
      if (a3)
      {
        if (objc_opt_isKindOfClass())
        {
          id v6 = [a3 getPath];
          return [(NSString *)path isEqual:v6];
        }
LABEL_17:
        JreThrowClassCastException();
      }
    }
LABEL_16:
    JreThrowNullPointerException();
  }
  if (!path) {
    goto LABEL_16;
  }
  objc_opt_class();
  if (!a3) {
    goto LABEL_16;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_17;
  }
  id v8 = [a3 getPath];
  return [(NSString *)path equalsIgnoreCase:v8];
}

- (BOOL)exists
{
  return sub_1001B4BEC((uint64_t)self, 0);
}

- (id)getAbsolutePath
{
  if ([(JavaIoFile *)self isAbsolute]) {
    return self->path_;
  }
  id PropertyWithNSString = JavaLangSystem_getPropertyWithNSString_(@"user.dir");
  path = self->path_;
  if (!path) {
    JreThrowNullPointerException();
  }
  if ([(NSString *)path isEmpty]) {
    return PropertyWithNSString;
  }
  id v6 = self->path_;
  return (id)sub_1001B49C4(PropertyWithNSString, v6);
}

- (id)getAbsoluteFile
{
  v2 = new_JavaIoFile_initWithNSString_([(JavaIoFile *)self getAbsolutePath]);
  return v2;
}

- (id)getCanonicalPath
{
  if ((atomic_load_explicit(LibcoreIoLibcore__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  uint64_t v3 = (void *)LibcoreIoLibcore_os_;
  if (!LibcoreIoLibcore_os_) {
    JreThrowNullPointerException();
  }
  id v4 = [(JavaIoFile *)self getAbsolutePath];
  return [v3 realpathWithNSString:v4];
}

- (id)getCanonicalFile
{
  v2 = new_JavaIoFile_initWithNSString_([(JavaIoFile *)self getCanonicalPath]);
  return v2;
}

- (id)getName
{
  path = self->path_;
  if (!path) {
    JreThrowNullPointerException();
  }
  unsigned int v4 = [(NSString *)path lastIndexOfString:JavaIoFile_separator_];
  id v5 = self->path_;
  if ((v4 & 0x80000000) != 0) {
    return v5;
  }
  uint64_t v6 = v4 + 1;
  id v7 = [(NSString *)v5 length];
  return [(NSString *)v5 substring:v6 endIndex:v7];
}

- (id)getParent
{
  path = self->path_;
  if (!path) {
    JreThrowNullPointerException();
  }
  signed int v4 = [(NSString *)path length];
  signed int v5 = v4;
  if (JavaIoFile_separatorChar_ != 92 || v4 < 3)
  {
    LOBYTE(v7) = 0;
    uint64_t v8 = 0;
  }
  else
  {
    BOOL v7 = [(NSString *)self->path_ charAtWithInt:1] == 58;
    uint64_t v8 = (2 * v7);
  }
  unsigned int v9 = -[NSString lastIndexOf:](self->path_, "lastIndexOf:");
  if (v7 && v9 == -1) {
    uint64_t v10 = 2;
  }
  else {
    uint64_t v10 = v9;
  }
  if (v10 == -1) {
    return 0;
  }
  unsigned int v11 = [(NSString *)self->path_ charAtWithInt:(v5 - 1)];
  if (v11 == (unsigned __int16)JavaIoFile_separatorChar_) {
    return 0;
  }
  if (-[NSString indexOf:](self->path_, "indexOf:") == v10
    && (unsigned int v13 = [(NSString *)self->path_ charAtWithInt:v8],
        v13 == (unsigned __int16)JavaIoFile_separatorChar_))
  {
    v14 = self->path_;
    uint64_t v15 = (v10 + 1);
  }
  else
  {
    v14 = self->path_;
    uint64_t v15 = v10;
  }
  return [(NSString *)v14 substring:0 endIndex:v15];
}

- (id)getParentFile
{
  id result = [(JavaIoFile *)self getParent];
  if (result)
  {
    uint64_t v3 = new_JavaIoFile_initWithNSString_(result);
    return v3;
  }
  return result;
}

- (id)getPath
{
  return self->path_;
}

- (unint64_t)hash
{
  path = self->path_;
  if (byte_100560AE0)
  {
    if (!path) {
      goto LABEL_9;
    }
  }
  else
  {
    if (!path) {
      goto LABEL_9;
    }
    if ((atomic_load_explicit(JavaUtilLocale__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    path = [(NSString *)path lowercaseStringWithJRELocale:JavaUtilLocale_ENGLISH_];
    if (!path) {
LABEL_9:
    }
      JreThrowNullPointerException();
  }
  return (int)[(NSString *)path hash] ^ 0x12D591;
}

- (BOOL)isAbsolute
{
  path = self->path_;
  if (!path) {
    JreThrowNullPointerException();
  }
  if ((int)[(NSString *)path length] < 1) {
    return 0;
  }
  unsigned int v4 = [(NSString *)self->path_ charAtWithInt:0];
  return v4 == (unsigned __int16)JavaIoFile_separatorChar_;
}

- (BOOL)isDirectory
{
  path = self->path_;
  if (!path) {
    return 0;
  }
  uint64_t v3 = [+[NSFileManager defaultManager] attributesOfItemAtPath:path error:0];
  if (!v3) {
    return 0;
  }
  unsigned int v4 = [(NSDictionary *)v3 fileType];
  if (!v4) {
    return 0;
  }
  return [(NSString *)v4 isEqualToString:NSFileTypeDirectory];
}

- (BOOL)isFile
{
  path = self->path_;
  if (!path) {
    return 0;
  }
  uint64_t v3 = [+[NSFileManager defaultManager] attributesOfItemAtPath:path error:0];
  if (!v3) {
    return 0;
  }
  unsigned int v4 = [(NSDictionary *)v3 fileType];
  if (!v4) {
    return 0;
  }
  return [(NSString *)v4 isEqualToString:NSFileTypeRegular];
}

- (BOOL)isHidden
{
  path = self->path_;
  if (!path) {
    goto LABEL_8;
  }
  if ([(NSString *)path isEmpty]) {
    return 0;
  }
  id v5 = [(JavaIoFile *)self getName];
  if (!v5) {
LABEL_8:
  }
    JreThrowNullPointerException();
  return [v5 hasPrefix:@"."];
}

- (int64_t)lastModified
{
  if (!self->path_) {
    return 0;
  }
  int64_t result = [+[NSFileManager defaultManager] attributesOfItemAtPath:self->path_ error:0];
  if (result)
  {
    int64_t result = (int64_t)[(id)result fileModificationDate];
    if (result)
    {
      [(id)result timeIntervalSince1970];
      return 1000 * (uint64_t)v3;
    }
  }
  return result;
}

- (BOOL)setLastModifiedWithLong:(int64_t)a3
{
  if (a3 < 0)
  {
    id v5 = new_JavaLangIllegalArgumentException_initWithNSString_(@"time < 0");
    objc_exception_throw(v5);
  }
  path = self->path_;
  return sub_1001B5534((uint64_t)path, a3);
}

+ (BOOL)setLastModifiedImplWithNSString:(id)a3 withLong:(int64_t)a4
{
  return sub_1001B5534((uint64_t)a3, a4);
}

- (BOOL)setReadOnly
{
  return [(JavaIoFile *)self setWritableWithBoolean:0 withBoolean:0];
}

- (BOOL)setExecutableWithBoolean:(BOOL)a3 withBoolean:(BOOL)a4
{
  if (a4) {
    int v4 = 64;
  }
  else {
    int v4 = 73;
  }
  return sub_1001B5634((uint64_t)self, v4, a3);
}

- (BOOL)setExecutableWithBoolean:(BOOL)a3
{
  return [(JavaIoFile *)self setExecutableWithBoolean:a3 withBoolean:1];
}

- (BOOL)setReadableWithBoolean:(BOOL)a3 withBoolean:(BOOL)a4
{
  if (a4) {
    int v4 = 256;
  }
  else {
    int v4 = 292;
  }
  return sub_1001B5634((uint64_t)self, v4, a3);
}

- (BOOL)setReadableWithBoolean:(BOOL)a3
{
  return [(JavaIoFile *)self setReadableWithBoolean:a3 withBoolean:1];
}

- (BOOL)setWritableWithBoolean:(BOOL)a3 withBoolean:(BOOL)a4
{
  if (a4) {
    int v4 = 128;
  }
  else {
    int v4 = 146;
  }
  return sub_1001B5634((uint64_t)self, v4, a3);
}

- (BOOL)setWritableWithBoolean:(BOOL)a3
{
  return [(JavaIoFile *)self setWritableWithBoolean:a3 withBoolean:1];
}

- (BOOL)doChmodWithInt:(int)a3 withBoolean:(BOOL)a4
{
  return sub_1001B5634((uint64_t)self, a3, a4);
}

- (int64_t)length
{
  if (!self->path_) {
    return 0;
  }
  v2 = [+[NSFileManager defaultManager] attributesOfItemAtPath:self->path_ error:0];
  if (!v2) {
    return 0;
  }
  return [(NSDictionary *)v2 fileSize];
}

- (id)list
{
  return sub_1001B57CC(self->path_);
}

+ (id)listImplWithNSString:(id)a3
{
  return sub_1001B57CC(a3);
}

- (id)listWithJavaIoFilenameFilter:(id)a3
{
  id result = [(JavaIoFile *)self list];
  uint64_t v6 = (char *)result;
  if (a3 && result)
  {
    BOOL v7 = new_JavaUtilArrayList_initWithInt_(*((unsigned int *)result + 2));
    uint64_t v8 = (uint64_t *)(v6 + 24);
    unint64_t v9 = (unint64_t)&v6[8 * *((int *)v6 + 2) + 24];
    while ((unint64_t)v8 < v9)
    {
      uint64_t v11 = *v8++;
      uint64_t v10 = v11;
      if ([a3 acceptWithJavaIoFile:self withNSString:v11]) {
        [(JavaUtilArrayList *)v7 addWithId:v10];
      }
    }
    v12 = +[IOSObjectArray arrayWithLength:[(JavaUtilArrayList *)v7 size] type:NSString_class_()];
    return [(JavaUtilArrayList *)v7 toArrayWithNSObjectArray:v12];
  }
  return result;
}

- (id)listFiles
{
  id v3 = [(JavaIoFile *)self list];
  return sub_1001B59B8(self, (uint64_t)v3);
}

- (id)listFilesWithJavaIoFilenameFilter:(id)a3
{
  id v4 = [(JavaIoFile *)self listWithJavaIoFilenameFilter:a3];
  return sub_1001B59B8(self, (uint64_t)v4);
}

- (id)listFilesWithJavaIoFileFilter:(id)a3
{
  id result = [(JavaIoFile *)self listFiles];
  id v5 = (char *)result;
  if (a3 && result)
  {
    uint64_t v6 = new_JavaUtilArrayList_initWithInt_(*((unsigned int *)result + 2));
    BOOL v7 = (uint64_t *)(v5 + 24);
    unint64_t v8 = (unint64_t)&v5[8 * *((int *)v5 + 2) + 24];
    while ((unint64_t)v7 < v8)
    {
      uint64_t v10 = *v7++;
      uint64_t v9 = v10;
      if ([a3 acceptWithJavaIoFile:v10]) {
        [(JavaUtilArrayList *)v6 addWithId:v9];
      }
    }
    uint64_t v11 = +[IOSObjectArray arrayWithLength:[(JavaUtilArrayList *)v6 size] type:JavaIoFile_class_()];
    return [(JavaUtilArrayList *)v6 toArrayWithNSObjectArray:v11];
  }
  return result;
}

- (id)filenamesToFilesWithNSStringArray:(id)a3
{
  return sub_1001B59B8(self, (uint64_t)a3);
}

- (BOOL)mkdir
{
  return [+[NSFileManager defaultManager] createDirectoryAtPath:[(JavaIoFile *)self getCanonicalPath] withIntermediateDirectories:0 attributes:0 error:0];
}

- (BOOL)mkdirImplWithNSString:(id)a3
{
  id v4 = +[NSFileManager defaultManager];
  return [(NSFileManager *)v4 createDirectoryAtPath:a3 withIntermediateDirectories:0 attributes:0 error:0];
}

- (uint64_t)mkdirsWithBoolean:(void *)a1
{
  if ([a1 exists]) {
    return 0;
  }
  if ([a1 mkdir]) {
    return 1;
  }
  uint64_t result = (uint64_t)[a1 getParent];
  if (result)
  {
    uint64_t result = [new_JavaIoFile_initWithNSString_((void *)result) mkdirs];
    if (result)
    {
      return (uint64_t)[a1 mkdir];
    }
  }
  return result;
}

- (BOOL)createNewFile
{
  path = self->path_;
  if (!path) {
    JreThrowNullPointerException();
  }
  if (![(NSString *)path length])
  {
    CFStringRef v12 = @"No such file or directory";
    goto LABEL_12;
  }
  if ([(JavaIoFile *)self isDirectory])
  {
    CFStringRef v12 = JreStrcat("$$", v4, v5, v6, v7, v8, v9, v10, @"Cannot create: ");
LABEL_12:
    unsigned int v13 = new_JavaIoIOException_initWithNSString_((uint64_t)v12);
    objc_exception_throw(v13);
  }
  if ((atomic_load_explicit(LibcoreIoLibcore__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (!LibcoreIoLibcore_os_) {
    JreThrowNullPointerException();
  }
  LibcoreIoIoUtils_closeWithJavaIoFileDescriptor_([(id)LibcoreIoLibcore_os_ openWithNSString:self->path_ withInt:2562 withInt:384]);
  return 1;
}

+ (id)createTempFileWithNSString:(id)a3 withNSString:(id)a4
{
  return JavaIoFile_createTempFileWithNSString_withNSString_(a3, (uint64_t)a4);
}

+ (id)createTempFileWithNSString:(id)a3 withNSString:(id)a4 withJavaIoFile:(id)a5
{
  return JavaIoFile_createTempFileWithNSString_withNSString_withJavaIoFile_(a3, (uint64_t)a4, (JavaIoFile *)a5);
}

- (BOOL)renameToWithJavaIoFile:(id)a3
{
  if ((atomic_load_explicit(LibcoreIoLibcore__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (LibcoreIoLibcore_os_) {
    BOOL v5 = a3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5) {
    JreThrowNullPointerException();
  }
  [(id)LibcoreIoLibcore_os_ renameWithNSString:self->path_ withNSString:*((void *)a3 + 1)];
  return 1;
}

- (NSString)description
{
  return self->path_;
}

- (id)toURI
{
  v2 = -[JavaIoFile getAbsoluteName]_0(self);
  if (!v2) {
    JreThrowNullPointerException();
  }
  id v3 = v2;
  if ([(__CFString *)v2 hasPrefix:@"/"])
  {
    if ([(__CFString *)v3 hasPrefix:@"//"]) {
      uint64_t v11 = new_JavaNetURI_initWithNSString_withNSString_withNSString_withNSString_(@"file", &stru_10048C1F8, v3, 0);
    }
    else {
      uint64_t v11 = new_JavaNetURI_initWithNSString_withNSString_withNSString_withNSString_withNSString_(@"file", 0, v3, 0, 0);
    }
  }
  else
  {
    CFStringRef v12 = (__CFString *)JreStrcat("C$", v4, v5, v6, v7, v8, v9, v10, (id)0x2F);
    uint64_t v11 = new_JavaNetURI_initWithNSString_withNSString_withNSString_withNSString_withNSString_(@"file", 0, v12, 0, 0);
  }
  return v11;
}

- (__CFString)getAbsoluteName
{
  id v1 = [a1 getAbsoluteFile];
  if (!v1) {
    goto LABEL_14;
  }
  v2 = v1;
  id v3 = (__CFString *)[v1 getPath];
  if ([v2 isDirectory])
  {
    if (!v3) {
      goto LABEL_14;
    }
    unsigned int v4 = [(__CFString *)v3 charAtWithInt:[(__CFString *)v3 length] - 1];
    if (v4 == (unsigned __int16)JavaIoFile_separatorChar_)
    {
      unsigned int v12 = v4;
      goto LABEL_8;
    }
    id v3 = (__CFString *)JreStrcat("$C", v5, v6, v7, v8, v9, v10, v11, v3);
  }
  unsigned int v12 = (unsigned __int16)JavaIoFile_separatorChar_;
LABEL_8:
  if (v12 == 47) {
    return v3;
  }
  if (!v3) {
LABEL_14:
  }
    JreThrowNullPointerException();
  return (__CFString *)-[__CFString replace:withChar:](v3, "replace:withChar:");
}

- (id)toURL
{
  v2 = -[JavaIoFile getAbsoluteName]_0(self);
  if (!v2) {
    JreThrowNullPointerException();
  }
  id v3 = v2;
  if ([(__CFString *)v2 hasPrefix:@"/"])
  {
    if ([(__CFString *)v3 hasPrefix:@"//"])
    {
      v18 = (__CFString *)JreStrcat("$$", v11, v12, v13, v14, v15, v16, v17, @"file:");
      v19 = new_JavaNetURL_initWithNSString_(v18);
      goto LABEL_8;
    }
    v20 = v3;
  }
  else
  {
    v20 = (__CFString *)JreStrcat("C$", v4, v5, v6, v7, v8, v9, v10, (id)0x2F);
  }
  v19 = new_JavaNetURL_initWithNSString_withNSString_withInt_withNSString_withJavaNetURLStreamHandler_(@"file", &stru_10048C1F8, 0xFFFFFFFFLL, v20, 0);
LABEL_8:
  return v19;
}

- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  [a3 defaultWriteObject];
  uint64_t v4 = (unsigned __int16)JavaIoFile_separatorChar_;
  [a3 writeCharWithInt:v4];
}

- (void)readObjectWithJavaIoObjectInputStream:(id)a3
{
  if (!a3
    || ([a3 defaultReadObject],
        id v5 = [a3 readChar],
        path = self->path_,
        p_path = &self->path_,
        (uint64_t v6 = path) == 0))
  {
    JreThrowNullPointerException();
  }
  uint64_t v9 = sub_1001B47FC([(NSString *)v6 replace:v5 withChar:(unsigned __int16)JavaIoFile_separatorChar_]);
  JreStrongAssign((id *)p_path, v9);
}

- (int64_t)getTotalSpace
{
  if ((atomic_load_explicit(LibcoreIoLibcore__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (!LibcoreIoLibcore_os_
    || (id v3 = [(id)LibcoreIoLibcore_os_ statvfsWithNSString:self->path_]) == 0)
  {
    JreThrowNullPointerException();
  }
  return v3[1] * v3[3];
}

- (int64_t)getUsableSpace
{
  if ((atomic_load_explicit(LibcoreIoLibcore__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (!LibcoreIoLibcore_os_
    || (id v3 = [(id)LibcoreIoLibcore_os_ statvfsWithNSString:self->path_]) == 0)
  {
    JreThrowNullPointerException();
  }
  return v3[1] * v3[5];
}

- (int64_t)getFreeSpace
{
  if ((atomic_load_explicit(LibcoreIoLibcore__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (!LibcoreIoLibcore_os_
    || (id v3 = [(id)LibcoreIoLibcore_os_ statvfsWithNSString:self->path_]) == 0)
  {
    JreThrowNullPointerException();
  }
  return v3[1] * v3[4];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaIoFile;
  [(JavaIoFile *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = new_JavaUtilRandom_init();
    JreStrongAssignAndConsume((id *)&qword_100560AE8, v2);
    id PropertyWithNSString_withNSString = JavaLangSystem_getPropertyWithNSString_withNSString_(@"file.separator", @"/");
    if (!PropertyWithNSString_withNSString
      || (JavaIoFile_separatorChar_ = (unsigned __int16)[PropertyWithNSString_withNSString charAtWithInt:0], (id v4 = JavaLangSystem_getPropertyWithNSString_withNSString_(@"path.separator", @":")) == 0))
    {
      JreThrowNullPointerException();
    }
    JavaIoFile_pathSeparatorChar_ = (unsigned __int16)[v4 charAtWithInt:0];
    id v5 = NSString_valueOfChar_(JavaIoFile_separatorChar_);
    JreStrongAssign((id *)&JavaIoFile_separator_, v5);
    uint64_t v6 = NSString_valueOfChar_(JavaIoFile_pathSeparatorChar_);
    JreStrongAssign(&JavaIoFile_pathSeparator_, v6);
    byte_100560AE0 = +[JavaIoFile isCaseSensitiveImpl]_0();
    atomic_store(1u, (unsigned __int8 *)JavaIoFile__initialized);
  }
}

+ (id)__annotations_toURL
{
  objc_super v3 = objc_alloc_init(JavaLangDeprecated);
  return +[IOSObjectArray arrayWithObjects:&v3 count:1 type:JavaLangAnnotationAnnotation_class_()];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10041BC88;
}

+ (BOOL)isCaseSensitiveImpl
{
  if ((atomic_load_explicit(JavaIoFile__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  memset(&v2, 0, 512);
  uname(&v2);
  if (!(*(_DWORD *)v2.machine ^ 0x36383369 | v2.machine[4])) {
    return 0;
  }
  return *(unsigned __int16 *)v2.machine != 14456 || v2.machine[2] != 54;
}

@end