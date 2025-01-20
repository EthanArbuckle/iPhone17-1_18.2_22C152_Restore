@interface _NSDataFileBackedFuture
+ (BOOL)supportsSecureCoding;
+ (Class)classForKeyedUnarchiver;
- (BOOL)_isCloudKitSupportOriginated;
- (BOOL)isEqual:(id)a3;
- (Class)classForCoder;
- (NSURL)fileURL;
- (NSUUID)UUID;
- (_NSDataFileBackedFuture)initWithCoder:(id)a3;
- (_NSDataFileBackedFuture)initWithStoreMetadata:(id)a3 directory:(id)a4;
- (_NSDataFileBackedFuture)initWithStoreMetadata:(id)a3 directory:(id)a4 originalFileURL:(id)a5;
- (const)bytes;
- (id)_storeMetadata;
- (id)description;
- (unint64_t)_bytesLengthForStore;
- (unint64_t)fileSize;
- (unint64_t)hash;
- (unint64_t)length;
- (void)_bytesPtrForStore;
- (void)_copyToInterimLocation;
- (void)_moveToPermanentLocation;
- (void)_underlyingData;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)initWithDirectoryURL:(void *)a3 UUID:(void *)a4 originalURL:;
- (void)initWithURL:(void *)a3 UUID:(unint64_t)a4 size:;
@end

@implementation _NSDataFileBackedFuture

- (_NSDataFileBackedFuture)initWithStoreMetadata:(id)a3 directory:(id)a4
{
  return [(_NSDataFileBackedFuture *)self initWithStoreMetadata:a3 directory:a4 originalFileURL:0];
}

- (void)dealloc
{
  self->_fileURL = 0;
  self->_uuid = 0;

  self->_realData = 0;
  self->_originalFileURL = 0;

  self->_bytes = 0;
  v3.receiver = self;
  v3.super_class = (Class)_NSDataFileBackedFuture;
  [(_NSDataFileBackedFuture *)&v3 dealloc];
}

- (NSUUID)UUID
{
  return self->_uuid;
}

- (_NSDataFileBackedFuture)initWithStoreMetadata:(id)a3 directory:(id)a4 originalFileURL:(id)a5
{
  uint64_t v9 = [a3 bytes];
  if (!strncmp((const char *)v9, "\x03###", 4uLL) && (!a5 || [a5 isFileURL]))
  {
    unint64_t v11 = *(void *)(v9 + 4);
    v12 = (_NSDataFileBackedFuture *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v9 + 12];
    v10 = (_NSDataFileBackedFuture *)-[_NSDataFileBackedFuture initWithURL:UUID:size:](self, objc_msgSend(a4, "URLByAppendingPathComponent:", -[_NSDataFileBackedFuture UUIDString](v12, "UUIDString")), v12, v11);
    if (v10)
    {
      v10->_bytes = (NSData *)a3;
      v10->_originalFileURL = (NSURL *)a5;
    }
    self = v12;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)initWithURL:(void *)a3 UUID:(unint64_t)a4 size:
{
  v4 = a1;
  if (a1)
  {
    if (!a2 || ([a2 isFileURL]) && a4 < 0x7FFFFFFFFFFFFFFFLL)
    {
      v9.receiver = v4;
      v9.super_class = (Class)_NSDataFileBackedFuture;
      v4 = objc_msgSendSuper2(&v9, sel_init);
      if (v4)
      {
        v4[1] = a2;
        v4[4] = a3;
        v4[3] = a4;
      }
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (void)initWithDirectoryURL:(void *)a3 UUID:(void *)a4 originalURL:
{
  v4 = a1;
  if (a1)
  {
    if (a4 && ([a4 isFileURL] & 1) == 0) {
      goto LABEL_10;
    }
    v14.receiver = v4;
    v14.super_class = (Class)_NSDataFileBackedFuture;
    v4 = objc_msgSendSuper2(&v14, sel_init);
    if (v4)
    {
      uint64_t v13 = 0;
      v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "attributesOfItemAtPath:error:", objc_msgSend(a4, "path"), &v13);
      if (!v8 || (objc_super v9 = v8, ![v8 valueForKey:@"NSFileSize"]))
      {

        objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"No file exists at URL '%@'", a2), 0 reason userInfo]);
      }
      if ((v4[3] = objc_msgSend((id)objc_msgSend(v9, "valueForKey:", @"NSFileSize"), "unsignedIntegerValue"),
            id v10 = a3,
            v4[4] = v10,
            v4[1] = (id)objc_msgSend(a2, "URLByAppendingPathComponent:isDirectory:", objc_msgSend(v10, "UUIDString"), 0), v4[2] = a4, (unint64_t v11 = (void *)v4[1]) != 0)&& (objc_msgSend(v11, "isFileURL") & 1) == 0|| v4[3] >= 0x7FFFFFFFFFFFFFFFuLL)
      {
LABEL_10:

        return 0;
      }
    }
  }
  return v4;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"_NSDataFileBackedFuture : <%@, %llu, %@ (%@)>", self->_uuid, self->_fileSize, self->_fileURL, self->_originalFileURL];
}

- (NSURL)fileURL
{
  objc_super v3 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  fileURL = self->_fileURL;
  if (!fileURL
    || ![(NSURL *)fileURL isFileURL]
    || !objc_msgSend(v3, "fileExistsAtPath:", -[NSURL path](self->_fileURL, "path")))
  {
    return 0;
  }
  v5 = self->_fileURL;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

- (void)encodeWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    uint64_t v5 = [a3 delegate];
    if (v5
      && (v6 = (void *)v5, (objc_opt_respondsToSelector() & 1) != 0)
      && ([v6 _allowCoreDataFutures] & 1) != 0
      || (objc_msgSend((id)objc_msgSend(a3, "allowedClasses"), "containsObject:", objc_opt_class()) & 1) != 0)
    {
      [a3 encodeObject:self->_uuid forKey:@"NSUUID"];
      [a3 encodeInt64:self->_fileSize forKey:@"NSFileSize"];
      [a3 encodeObject:self->_fileURL forKey:@"NSFileURL"];
      originalFileURL = self->_originalFileURL;
      [a3 encodeObject:originalFileURL forKey:@"NSOriginalFileURL"];
      return;
    }
    v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = *MEMORY[0x1E4F281F8];
    id v10 = &unk_1ED7E25F0;
  }
  else
  {
    v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = *MEMORY[0x1E4F281F8];
    id v10 = &unk_1ED7E25C8;
  }
  uint64_t v11 = [v8 errorWithDomain:v9 code:4866 userInfo:v10];

  [a3 failWithError:v11];
}

- (_NSDataFileBackedFuture)initWithCoder:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)_NSDataFileBackedFuture;
  v4 = [(_NSDataFileBackedFuture *)&v13 init];
  if (v4)
  {
    if (![a3 allowsKeyedCoding])
    {
      uint64_t v11 = &unk_1ED7E2618;
      goto LABEL_19;
    }
    uint64_t v5 = [a3 delegate];
    if (!v5
      || (v6 = (void *)v5, (objc_opt_respondsToSelector() & 1) == 0)
      || ([v6 _allowCoreDataFutures] & 1) == 0)
    {
      if (!objc_msgSend((id)objc_msgSend(a3, "allowedClasses"), "containsObject:", objc_opt_class()))
      {
        uint64_t v11 = &unk_1ED7E2640;
        goto LABEL_19;
      }
    }
    v4->_uuid = (NSUUID *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSUUID"];
    v4->_fileSize = [a3 decodeInt64ForKey:@"NSFileSize"];
    v7 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSFileURL"];
    if (v7)
    {
      v8 = v7;
      if (![v7 isFileURL])
      {
        uint64_t v11 = &unk_1ED7E2668;
        goto LABEL_19;
      }
      v4->_fileURL = (NSURL *)v8;
    }
    uint64_t v9 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSOriginalFileURL"];
    if (v9)
    {
      id v10 = v9;
      if (![v9 isFileURL])
      {
        uint64_t v11 = &unk_1ED7E2690;
        goto LABEL_19;
      }
      v4->_originalFileURL = (NSURL *)v10;
    }
    if (v4->_fileSize >= 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v11 = &unk_1ED7E26B8;
LABEL_19:
      objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 4864, v11));

      return 0;
    }
  }
  return v4;
}

- (unint64_t)hash
{
  return [(NSURL *)self->_fileURL hash];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || self->_fileSize != *((void *)a3 + 3))
  {
LABEL_16:
    LOBYTE(v8) = 0;
    return v8;
  }
  uuid = self->_uuid;
  v6 = (NSUUID *)*((void *)a3 + 4);
  if (uuid != v6)
  {
    if (uuid) {
      BOOL v7 = v6 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7) {
      goto LABEL_16;
    }
    int v8 = -[NSUUID isEqual:](uuid, "isEqual:");
    if (!v8) {
      return v8;
    }
  }
  fileURL = self->_fileURL;
  id v10 = (NSURL *)*((void *)a3 + 1);
  if (fileURL == v10)
  {
LABEL_17:
    LOBYTE(v8) = 1;
    return v8;
  }
  if (fileURL) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11) {
    goto LABEL_16;
  }

  LOBYTE(v8) = -[NSURL isEqual:](fileURL, "isEqual:");
  return v8;
}

- (void)_underlyingData
{
  v19[1] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v1 = result;
    result = (void *)result[5];
    if (!result)
    {
      v2 = (void *)[v1 fileURL];
      if (!v2)
      {
        uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
        v18 = @"URL";
        v19[0] = @"<null url>";
        uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
        objc_exception_throw((id)[v5 exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Underlying file for this file backed future has not been downloaded." userInfo:v6]);
      }
      objc_super v3 = v2;
      if (([v2 isFileURL] & 1) == 0)
      {
        BOOL v7 = (void *)MEMORY[0x1E4F1CA00];
        v16 = @"URL";
        v17 = v3;
        uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
        objc_exception_throw((id)[v7 exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Underlying url for this file backed future is not a file url." userInfo:v8]);
      }
      objc_super v13 = 0;
      v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v3 options:0 error:&v13];
      v1[5] = v4;
      if (!v4)
      {
        uint64_t v9 = *MEMORY[0x1E4F28A50];
        v14[0] = @"URL";
        v14[1] = v9;
        id v10 = v13;
        if (!v13) {
          id v10 = @"<no error>";
        }
        BOOL v11 = (void *)MEMORY[0x1E4F1CA00];
        v15[0] = v3;
        v15[1] = v10;
        uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
        objc_exception_throw((id)[v11 exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Underlying file for this file backed future has not been downloaded." userInfo:v12]);
      }
      v1[3] = [v4 length];
      return (void *)v1[5];
    }
  }
  return result;
}

- (id)_storeMetadata
{
  v5[2] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  id v2 = *(id *)(a1 + 48);
  if (!v2)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
    [v2 appendBytes:"\x03###" length:4];
    [v2 appendBytes:a1 + 24 length:8];
    v5[0] = 0;
    v5[1] = 0;
    [*(id *)(a1 + 32) getUUIDBytes:v5];
    [v2 appendBytes:v5 length:16];
    objc_super v3 = (const char *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "lastPathComponent"), "fileSystemRepresentation");
    [v2 appendBytes:v3 length:strlen(v3)];
    *(void *)(a1 + 48) = v2;
  }
  return v2;
}

- (void)_bytesPtrForStore
{
  id v2 = -[_NSDataFileBackedFuture _storeMetadata]((uint64_t)self);

  return (void *)[v2 bytes];
}

- (unint64_t)_bytesLengthForStore
{
  id v2 = -[_NSDataFileBackedFuture _storeMetadata]((uint64_t)self);

  return [v2 length];
}

- (void)_copyToInterimLocation
{
  v16[1] = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  if (self) {
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:", -[NSString stringByAppendingString:](-[NSURL path](self->_fileURL, "path"), "stringByAppendingString:", @".interim"));
  }
  else {
    uint64_t v4 = 0;
  }
  id v14 = 0;
  if (([v3 copyItemAtURL:self->_originalFileURL toURL:v4 error:&v14] & 1) == 0)
  {
    _NSCoreDataLog(2, @"%@: First attempt at moving file to interim location failed: %@", v5, v6, v7, v8, v9, v10, (uint64_t)self);
    if ([v14 code] != 516
      || (id v14 = 0, ![v3 removeItemAtURL:v4 error:&v14])
      || ([v3 copyItemAtURL:self->_originalFileURL toURL:v4 error:&v14] & 1) == 0)
    {
      BOOL v11 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v12 = *MEMORY[0x1E4F1C3B8];
      uint64_t v13 = [NSString stringWithFormat:@"Failed to copy file from %@ to %@ (%@)", self->_originalFileURL, v4, v14];
      uint64_t v15 = *MEMORY[0x1E4F28A50];
      v16[0] = v14;
      objc_exception_throw((id)objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, v13, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1)));
    }
  }
}

- (void)_moveToPermanentLocation
{
  v19[1] = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  if (self) {
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:", -[NSString stringByAppendingString:](-[NSURL path](self->_fileURL, "path"), "stringByAppendingString:", @".interim"));
  }
  else {
    uint64_t v4 = 0;
  }
  id v15 = 0;
  if (([v3 moveItemAtURL:v4 toURL:self->_fileURL error:&v15] & 1) == 0)
  {
    _NSCoreDataLog(2, @"%@: First attempt at moving in to place failed with error: %@", v5, v6, v7, v8, v9, v10, (uint64_t)self);
    if ([v15 code] != 516
      || (id v15 = 0,
          (BOOL v11 = objc_msgSend(v3, "attributesOfItemAtPath:error:", -[NSURL path](self->_fileURL, "path"), &v15)) == 0)
      || objc_msgSend((id)objc_msgSend(v11, "objectForKey:", *MEMORY[0x1E4F28390]), "unsignedLongValue") != self->_fileSize
      && (![v3 removeItemAtURL:self->_fileURL error:&v15]
       || ([v3 moveItemAtURL:v4 toURL:self->_fileURL error:&v15] & 1) == 0))
    {
      uint64_t v12 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v13 = *MEMORY[0x1E4F1C3B8];
      uint64_t v14 = [NSString stringWithFormat:@"Failed to copy file from %@ to %@ (%@)", v4, self->_fileURL, v15];
      uint64_t v18 = *MEMORY[0x1E4F28A50];
      v19[0] = v15;
      objc_exception_throw((id)objc_msgSend(v12, "exceptionWithName:reason:userInfo:", v13, v14, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1)));
    }
  }
  uint64_t v16 = *MEMORY[0x1E4F28330];
  uint64_t v17 = [NSNumber numberWithInteger:292];
  objc_msgSend(v3, "setAttributes:ofItemAtPath:error:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1), -[NSURL path](self->_fileURL, "path"), &v15);

  self->_originalFileURL = 0;
}

- (unint64_t)length
{
  id v2 = -[_NSDataFileBackedFuture _underlyingData](self);

  return [v2 length];
}

- (const)bytes
{
  id v2 = -[_NSDataFileBackedFuture _underlyingData](self);

  return (const void *)[v2 bytes];
}

- (BOOL)_isCloudKitSupportOriginated
{
  return 0;
}

- (unint64_t)fileSize
{
  return self->_fileSize;
}

@end