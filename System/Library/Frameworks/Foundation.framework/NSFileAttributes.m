@interface NSFileAttributes
+ (BOOL)_populateCatInfo:(id *)a3 forURL:(id)a4 statInfo:(stat *)a5 error:(id *)a6;
+ (id)_attributesAtPath:(id)a3 partialReturn:(BOOL)a4 filterResourceFork:(BOOL)a5 error:(id *)a6;
+ (id)_attributesAtURL:(id)a3 partialReturn:(BOOL)a4 filterResourceFork:(BOOL)a5 error:(id *)a6;
+ (id)attributesAtPath:(id)a3 traverseLink:(BOOL)a4;
+ (id)attributesWithStat:(stat *)a3;
- (BOOL)isDirectory;
- (BOOL)isEqual:(id)a3;
- (id)fileGroupOwnerAccountName;
- (id)fileModificationDate;
- (id)fileOwnerAccountName;
- (id)fileType;
- (id)keyEnumerator;
- (id)objectForKey:(id)a3;
- (int64_t)fileSystemNumber;
- (unint64_t)count;
- (unint64_t)fileGroupOwnerAccountNumber;
- (unint64_t)fileOwnerAccountNumber;
- (unint64_t)filePosixPermissions;
- (unint64_t)fileSize;
- (unint64_t)fileSystemFileNumber;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation NSFileAttributes

+ (id)_attributesAtPath:(id)a3 partialReturn:(BOOL)a4 filterResourceFork:(BOOL)a5 error:(id *)a6
{
  BOOL v8 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  memset(&v21, 0, sizeof(v21));
  if (![+[NSFileManager defaultManager] getFileSystemRepresentation:v20 maxLength:1024 withPath:a3])
  {
    if (a6)
    {
      v11 = _NSErrorWithFilePath(256, (uint64_t)a3);
      goto LABEL_7;
    }
    return 0;
  }
  if (lstat(v20, &v21))
  {
    if (a6)
    {
      v10 = __error();
      v11 = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(*v10, (uint64_t)a3, 1, 0, 0);
LABEL_7:
      v12 = v11;
      id result = 0;
      *a6 = v12;
      return result;
    }
    return 0;
  }
  v14 = +[NSFileAttributes attributesWithStat:&v21];
  uint64_t v15 = [MEMORY[0x1E4F1CB10] fileURLWithPath:a3 isDirectory:0];
  if (v8) {
    a6 = 0;
  }
  if (+[NSFileAttributes _populateCatInfo:&v14->catInfo forURL:v15 statInfo:&v21 error:a6]|| (id result = 0, v8))
  {
    v16 = _attributesAtPath(v20, a5, (NSError **)a6);
    v14->extendedAttrs = v16;
    if (!v16 && !v8) {
      return 0;
    }
    int v17 = v21.st_mode & 0xF000;
    if (v17 == 0x8000 || v17 == 0x4000)
    {
      uint64_t v18 = 0;
      v19[1] = 0;
      v19[2] = 0;
      v19[0] = 0x4000000000000005;
      if (getattrlist(v20, v19, &v18, 8uLL, 1u) || HIDWORD(v18) == -1) {
        v14->fileProtectionClass = 0;
      }
      else {
        v14->fileProtectionClass = HIDWORD(v18);
      }
    }
    return v14;
  }
  return result;
}

+ (id)_attributesAtURL:(id)a3 partialReturn:(BOOL)a4 filterResourceFork:(BOOL)a5 error:(id *)a6
{
  BOOL v8 = a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v10 = +[NSFileManager defaultManager];
  if (![a3 isFileURL])
  {
    if (a6)
    {
      uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:a3 forKey:@"NSURL"];
      uint64_t v16 = 262;
LABEL_11:
      v14 = +[NSError errorWithDomain:@"NSCocoaErrorDomain" code:v16 userInfo:v15];
      goto LABEL_12;
    }
    return 0;
  }
  uint64_t v11 = [a3 path];
  if (!v11)
  {
    if (a6)
    {
      uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:a3 forKey:@"NSURL"];
      uint64_t v16 = 260;
      goto LABEL_11;
    }
    return 0;
  }
  uint64_t v12 = v11;
  memset(&v24, 0, sizeof(v24));
  if (![(NSFileManager *)v10 getFileSystemRepresentation:v23 maxLength:1024 withPath:v11])
  {
    if (a6)
    {
      v14 = _NSErrorWithFilePath(256, v12);
      goto LABEL_12;
    }
    return 0;
  }
  if (lstat(v23, &v24))
  {
    if (a6)
    {
      v13 = __error();
      v14 = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(*v13, v12, 1, 0, 0);
LABEL_12:
      int v17 = v14;
      id result = 0;
      *a6 = v17;
      return result;
    }
    return 0;
  }
  v19 = +[NSFileAttributes attributesWithStat:&v24];
  if (v8) {
    a6 = 0;
  }
  if (+[NSFileAttributes _populateCatInfo:&v19->catInfo forURL:a3 statInfo:&v24 error:a6]|| (id result = 0, v8))
  {
    v20 = _attributesAtPath(v23, a5, (NSError **)a6);
    v19->extendedAttrs = v20;
    if (!v20 && !v8) {
      return 0;
    }
    int v21 = v24.st_mode & 0xF000;
    if (v21 == 0x8000 || v21 == 0x4000)
    {
      int v22 = _NSFileProtectionValueForPath(v23);
      if (v22 == -1) {
        v19->fileProtectionClass = 0;
      }
      else {
        v19->fileProtectionClass = v22;
      }
    }
    return v19;
  }
  return result;
}

+ (id)attributesWithStat:(stat *)a3
{
  v4 = (char *)objc_allocWithZone((Class)a1);
  memmove(v4 + 16, a3, 0x90uLL);

  return v4;
}

+ (BOOL)_populateCatInfo:(id *)a3 forURL:(id)a4 statInfo:(stat *)a5 error:(id *)a6
{
  v13[2] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = *MEMORY[0x1E4F1C608];
  uint64_t v8 = *MEMORY[0x1E4F1C540];
  v13[0] = *MEMORY[0x1E4F1C608];
  v13[1] = v8;
  v9 = objc_msgSend(a4, "resourceValuesForKeys:error:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v13, 2, a5), a6);
  v10 = v9;
  if (v9)
  {
    a3->var0 = objc_msgSend((id)objc_msgSend(v9, "objectForKey:", v7), "BOOLValue");
    *(_DWORD *)&a3->var2 |= 1u;
    uint64_t v11 = (void *)[v10 objectForKey:v8];
    if (v11)
    {
      a3->var1 = (id)[v11 copy];
      *(_DWORD *)&a3->var2 |= 2u;
    }
  }
  return v10 != 0;
}

+ (id)attributesAtPath:(id)a3 traverseLink:(BOOL)a4
{
  id v4 = a3;
  if (a4)
  {
    v5 = [+[NSFileManager defaultManager] destinationOfSymbolicLinkAtPath:a3 error:0];
    v6 = v5;
    if (v5 && ![(NSString *)v5 isAbsolutePath]) {
      v6 = (NSString *)objc_msgSend((id)objc_msgSend(v4, "stringByDeletingLastPathComponent"), "stringByAppendingPathComponent:", v6);
    }
    if (v6) {
      a3 = v6;
    }
    else {
      a3 = v4;
    }
  }

  return +[NSFileAttributes _attributesAtPath:a3 partialReturn:1 filterResourceFork:1 error:0];
}

- (unint64_t)count
{
  dict = self->dict;
  if (!dict)
  {
    dict = (NSMutableDictionary *)_fillDictionary(&self->statInfo.st_dev, (unsigned __int8 *)&self->catInfo, (uint64_t)self->extendedAttrs, self->fileProtectionClass);
    self->dict = dict;
  }

  return [(NSMutableDictionary *)dict count];
}

- (id)objectForKey:(id)a3
{
  dict = self->dict;
  if (dict)
  {
    return (id)-[NSMutableDictionary objectForKey:](dict, "objectForKey:");
  }
  if ([a3 isEqual:@"NSFileModificationDate"])
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1C9C8];
    double v8 = (double)self->statInfo.st_mtimespec.tv_sec
       - *MEMORY[0x1E4F1CF78]
       + (double)self->statInfo.st_mtimespec.tv_nsec * 0.000000001;
    return (id)[v7 dateWithTimeIntervalSinceReferenceDate:v8];
  }
  if ([a3 isEqual:@"NSFileSize"])
  {
    off_t st_size = self->statInfo.st_size;
    return +[NSNumber numberWithUnsignedLongLong:st_size];
  }
  if ([a3 isEqual:@"NSFilePosixPermissions"])
  {
    __darwin_ino64_t st_nlink = self->statInfo.st_mode & 0xFFF;
LABEL_15:
    return +[NSNumber numberWithUnsignedLong:st_nlink];
  }
  if ([a3 isEqual:@"NSFileType"])
  {
    unsigned int st_mode = self->statInfo.st_mode;
    if ((st_mode & 0x1000) != 0) {
      return @"NSFileTypeUnknown";
    }
    uint64_t v12 = (st_mode >> 13) - 1;
    if (v12 >= 6) {
      return @"NSFileTypeUnknown";
    }
    else {
      return off_1E51F80B0[v12];
    }
  }
  if ([a3 isEqual:@"NSFileReferenceCount"])
  {
    __darwin_ino64_t st_nlink = self->statInfo.st_nlink;
    goto LABEL_15;
  }
  if ([a3 isEqual:@"NSFileSystemNumber"])
  {
    __darwin_ino64_t st_nlink = self->statInfo.st_dev;
    goto LABEL_15;
  }
  if ([a3 isEqual:@"NSFileSystemFileNumber"])
  {
    __darwin_ino64_t st_nlink = self->statInfo.st_ino;
    goto LABEL_15;
  }
  if ([a3 isEqual:@"NSFileOwnerAccountName"])
  {
    uid_t st_uid = self->statInfo.st_uid;
    return __NSUserAccountNumberToName(st_uid);
  }
  if ([a3 isEqual:@"NSFileGroupOwnerAccountName"])
  {
    gid_t st_gid = self->statInfo.st_gid;
    return __NSGroupAccountNumberToName(st_gid);
  }
  if ([a3 isEqual:@"NSFileDeviceIdentifier"])
  {
    if ((self->statInfo.st_mode & 0xB000 | 0x4000) == 0x6000)
    {
      __darwin_ino64_t st_nlink = self->statInfo.st_rdev;
      goto LABEL_15;
    }
    return 0;
  }
  if ([a3 isEqual:@"NSFileExtensionHidden"])
  {
    if ((*(unsigned char *)&self->catInfo.validFields & 1) == 0) {
      return 0;
    }
    BOOL extensionHidden = self->catInfo.extensionHidden;
    goto LABEL_54;
  }
  if ([a3 isEqual:@"NSFileCreationDate"])
  {
    if ((*(unsigned char *)&self->catInfo.validFields & 2) != 0) {
      return self->catInfo.creationDate;
    }
    return 0;
  }
  if ([a3 isEqual:@"NSFileImmutable"])
  {
    BOOL v16 = (self->statInfo.st_flags & 0x20002) == 0;
    goto LABEL_51;
  }
  if ([a3 isEqual:@"NSFileAppendOnly"])
  {
    BOOL v16 = (self->statInfo.st_flags & 0x40004) == 0;
LABEL_51:
    BOOL extensionHidden = !v16;
LABEL_54:
    return +[NSNumber numberWithBool:extensionHidden];
  }
  if ([a3 isEqual:@"NSFileOwnerAccountID"])
  {
    uint64_t v17 = self->statInfo.st_uid;
  }
  else
  {
    if (![a3 isEqual:@"NSFileGroupOwnerAccountID"])
    {
      if ([a3 isEqual:@"NSFileExtendedAttributes"]) {
        return self->extendedAttrs;
      }
      if ([a3 isEqual:@"NSFileProtectionKey"])
      {
        unsigned int v18 = self->fileProtectionClass - 1;
        if (v18 < 7) {
          return off_1E51F8078[v18];
        }
      }
      return 0;
    }
    uint64_t v17 = self->statInfo.st_gid;
  }

  return +[NSNumber numberWithUnsignedInteger:v17];
}

- (id)keyEnumerator
{
  dict = self->dict;
  if (!dict)
  {
    dict = (NSMutableDictionary *)_fillDictionary(&self->statInfo.st_dev, (unsigned __int8 *)&self->catInfo, (uint64_t)self->extendedAttrs, self->fileProtectionClass);
    self->dict = dict;
  }

  return (id)[(NSMutableDictionary *)dict keyEnumerator];
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSFileAttributes;
  [(NSFileAttributes *)&v3 dealloc];
}

- (unint64_t)hash
{
  dict = self->dict;
  if (!dict)
  {
    dict = (NSMutableDictionary *)_fillDictionary(&self->statInfo.st_dev, (unsigned __int8 *)&self->catInfo, (uint64_t)self->extendedAttrs, self->fileProtectionClass);
    self->dict = dict;
  }

  return [(NSMutableDictionary *)dict hash];
}

- (BOOL)isEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    if (self->statInfo.st_ino == *((void *)a3 + 3)
      && self->statInfo.st_dev == *((_DWORD *)a3 + 4)
      && self->statInfo.st_mtimespec.tv_sec == *((void *)a3 + 8)
      && self->statInfo.st_mtimespec.tv_nsec == *((void *)a3 + 9)
      && self->statInfo.st_mode == *((unsigned __int16 *)a3 + 10)
      && self->statInfo.st_size == *((void *)a3 + 14)
      && self->statInfo.st_nlink == *((unsigned __int16 *)a3 + 11)
      && self->statInfo.st_uid == *((_DWORD *)a3 + 8)
      && self->statInfo.st_gid == *((_DWORD *)a3 + 9))
    {
      return self->statInfo.st_flags == *((_DWORD *)a3 + 33);
    }
    return 0;
  }
  dict = self->dict;
  if (!dict)
  {
    dict = (NSMutableDictionary *)_fillDictionary(&self->statInfo.st_dev, (unsigned __int8 *)&self->catInfo, (uint64_t)self->extendedAttrs, self->fileProtectionClass);
    self->dict = dict;
  }

  return [a3 isEqual:dict];
}

- (unint64_t)fileSize
{
  return self->statInfo.st_size;
}

- (id)fileModificationDate
{
  return (id)[MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)self->statInfo.st_mtimespec.tv_sec- *MEMORY[0x1E4F1CF78]+ (double)self->statInfo.st_mtimespec.tv_nsec * 0.000000001];
}

- (id)fileType
{
  unsigned int st_mode = self->statInfo.st_mode;
  if ((st_mode & 0x1000) != 0) {
    return @"NSFileTypeUnknown";
  }
  uint64_t v3 = (st_mode >> 13) - 1;
  if (v3 > 5) {
    return @"NSFileTypeUnknown";
  }
  else {
    return off_1E51F80B0[v3];
  }
}

- (unint64_t)filePosixPermissions
{
  return self->statInfo.st_mode & 0xFFF;
}

- (id)fileOwnerAccountName
{
  return __NSUserAccountNumberToName(self->statInfo.st_uid);
}

- (unint64_t)fileOwnerAccountNumber
{
  return self->statInfo.st_uid;
}

- (id)fileGroupOwnerAccountName
{
  return __NSGroupAccountNumberToName(self->statInfo.st_gid);
}

- (unint64_t)fileGroupOwnerAccountNumber
{
  return self->statInfo.st_gid;
}

- (int64_t)fileSystemNumber
{
  return self->statInfo.st_dev;
}

- (unint64_t)fileSystemFileNumber
{
  return self->statInfo.st_ino;
}

- (BOOL)isDirectory
{
  return (self->statInfo.st_mode & 0xF000) == 0x4000;
}

@end