@interface NSGZipDecoder
- (BOOL)decodeDownloadData:(id)a3 dataForkData:(id *)a4 resourceForkData:(id *)a5;
- (BOOL)isFinishedDecoding;
- (NSGZipDecoder)init;
- (id)decodeData:(id)a3;
- (id)fileAttributes;
- (id)filenameWithOriginalFilename:(id)a3;
- (void)dealloc;
@end

@implementation NSGZipDecoder

- (id)filenameWithOriginalFilename:(id)a3
{
  if (!self->_decodedHeader) {
    __assert_rtn("-[NSGZipDecoder filenameWithOriginalFilename:]", "NSURLDownload.mm", 1032, "_decodedHeader");
  }
  id v4 = (id)[(NSString *)self->_filename copy];
  if ([v4 length]) {
    return v4;
  }
  v6 = objc_msgSend((id)objc_msgSend(a3, "pathExtension"), "lowercaseString");
  if (([v6 isEqualToString:@"gz"] & 1) != 0
    || [v6 isEqualToString:@"gzip"])
  {
    return (id)[a3 stringByDeletingPathExtension];
  }
  else
  {
    if ([v6 isEqualToString:@"tgz"])
    {
      v7 = @"tar";
    }
    else
    {
      if (![v6 isEqualToString:@"cpgz"]) {
        return a3;
      }
      v7 = @"cpio";
    }
    v8 = (void *)[a3 stringByDeletingPathExtension];
    return (id)[v8 stringByAppendingPathExtension:v7];
  }
}

- (id)fileAttributes
{
  if (!self->_decodedHeader) {
    __assert_rtn("-[NSGZipDecoder fileAttributes]", "NSURLDownload.mm", 1022, "_decodedHeader");
  }
  unint64_t modificationTime = self->_modificationTime;
  if (!modificationTime) {
    return 0;
  }
  v3 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)modificationTime];
  uint64_t v5 = *MEMORY[0x1E4F28310];

  return (id)[v3 dictionaryWithObject:v4 forKey:v5];
}

- (BOOL)isFinishedDecoding
{
  if (!self->_streamInitialized) {
    __assert_rtn("-[NSGZipDecoder isFinishedDecoding]", "NSURLDownload.mm", 1005, "_streamInitialized");
  }
  BOOL finishedInflating = self->_finishedInflating;
  if (self->_stream.src_size)
  {
    BOOL v3 = self->_finishedInflating;
LABEL_5:
    LOBYTE(v3) = v3;
    return v3;
  }
  BOOL v3 = 1;
  if (finishedInflating) {
    goto LABEL_5;
  }
  return v3;
}

- (BOOL)decodeDownloadData:(id)a3 dataForkData:(id *)a4 resourceForkData:(id *)a5
{
  if (!a3) {
    __assert_rtn("-[NSGZipDecoder decodeDownloadData:dataForkData:resourceForkData:]", "NSURLDownload.mm", 995, "data");
  }
  if (!a4) {
    __assert_rtn("-[NSGZipDecoder decodeDownloadData:dataForkData:resourceForkData:]", "NSURLDownload.mm", 996, "dataForkData");
  }
  if (!a5) {
    __assert_rtn("-[NSGZipDecoder decodeDownloadData:dataForkData:resourceForkData:]", "NSURLDownload.mm", 997, "resourceForkData");
  }
  *a5 = 0;
  id v6 = -[NSGZipDecoder decodeData:](self, "decodeData:");
  *a4 = v6;
  return v6 != 0;
}

- (id)decodeData:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    __assert_rtn("-[NSGZipDecoder decodeData:]", "NSURLDownload.mm", 922, "data");
  }
  if (![a3 length]) {
    __assert_rtn("-[NSGZipDecoder decodeData:]", "NSURLDownload.mm", 923, "[data length]");
  }
  if (!self->_streamInitialized) {
    __assert_rtn("-[NSGZipDecoder decodeData:]", "NSURLDownload.mm", 924, "_streamInitialized");
  }
  if (self->_decodedHeader)
  {
    signed int v5 = 0;
    goto LABEL_6;
  }
  self;
  int v7 = [a3 length];
  if (v7 < 10) {
    return 0;
  }
  uint64_t v8 = [a3 bytes];
  if (*(unsigned char *)v8 != 31) {
    return 0;
  }
  uint64_t v9 = v8;
  if (*(unsigned __int8 *)(v8 + 1) != 139) {
    return 0;
  }
  if (*(unsigned char *)(v8 + 2) != 8) {
    return 0;
  }
  unsigned int v10 = *(unsigned __int8 *)(v8 + 3);
  if (v10 > 0x1F) {
    return 0;
  }
  if ((v10 & 4) != 0)
  {
    if (v7 < 0xC) {
      return 0;
    }
    signed int v5 = *(unsigned __int16 *)(v8 + 10) + 12;
    if (v5 > v7) {
      return 0;
    }
  }
  else
  {
    signed int v5 = 10;
  }
  if ((v10 & 8) != 0)
  {
    uint64_t v16 = v5;
    uint64_t v15 = v8 + v5;
    if (v5 <= v7) {
      uint64_t v17 = v7;
    }
    else {
      uint64_t v17 = v5;
    }
    while (v17 != v16)
    {
      signed int v5 = v16 + 1;
      if (!*(unsigned __int8 *)(v8 + v16++)) {
        goto LABEL_35;
      }
    }
    return 0;
  }
  uint64_t v15 = 0;
LABEL_35:
  if ((v10 & 0x10) != 0)
  {
    uint64_t v19 = v5;
    if (v5 <= v7) {
      uint64_t v20 = v7;
    }
    else {
      uint64_t v20 = v5;
    }
    while (v20 != v19)
    {
      signed int v5 = v19 + 1;
      if (!*(unsigned __int8 *)(v8 + v19++)) {
        goto LABEL_41;
      }
    }
    return 0;
  }
LABEL_41:
  if ((v10 & 2) != 0)
  {
    if (v5 + 2 <= v7)
    {
      unsigned __int16 v22 = crc32(0, (const Bytef *)v8, v5);
      id v6 = 0;
      int v23 = *(unsigned __int16 *)(v9 + v5);
      v5 += 2;
      if (v23 != v22) {
        return v6;
      }
      goto LABEL_44;
    }
    return 0;
  }
LABEL_44:
  self->_unint64_t modificationTime = *(int *)(v9 + 4);
  if (v15) {
    v24 = (void *)[NSString stringWithCString:v15 encoding:CFStringConvertEncodingToNSStringEncoding(0x500u)];
  }
  else {
    v24 = 0;
  }
  if (self->_filename) {
    __assert_rtn("-[NSGZipDecoder decodeData:]", "NSURLDownload.mm", 939, "!_filename");
  }
  self->_filename = (NSString *)[v24 copy];
  self->_decodedHeader = 1;
LABEL_6:
  id v6 = (void *)[MEMORY[0x1E4F1CA58] data];
  if (self->_finishedInflating)
  {
    if ((unint64_t)[a3 length] >= 9) {
      NSLog(&cfstr_GotMoreThan8By.isa, [a3 length]);
    }
  }
  else
  {
    self->_stream.src_ptr = (char *)([a3 bytes] + v5);
    uint64_t v11 = [a3 length];
    self->_stream.src_size = v11 - v5;
    if (v11 != v5)
    {
      while (1)
      {
        self->_stream.dst_ptr = v25;
        self->_stream.unint64_t dst_size = 0x4000;
        compression_status v12 = compression_stream_process((compression_stream *)&self->_stream, 0);
        unint64_t dst_size = self->_stream.dst_size;
        [v6 appendBytes:v25 length:0x4000 - dst_size];
        if (v12 == COMPRESSION_STATUS_ERROR)
        {
          NSLog(&cfstr_GotErrorFromIn.isa, -1);
          return 0;
        }
        if (v12 == COMPRESSION_STATUS_END) {
          break;
        }
        if (dst_size && !self->_stream.src_size) {
          return v6;
        }
      }
      self->_BOOL finishedInflating = 1;
    }
  }
  return v6;
}

- (void)dealloc
{
  if (self->_streamInitialized) {
    compression_stream_destroy((compression_stream *)&self->_stream);
  }

  v3.receiver = self;
  v3.super_class = (Class)NSGZipDecoder;
  [(NSGZipDecoder *)&v3 dealloc];
}

- (NSGZipDecoder)init
{
  v5.receiver = self;
  v5.super_class = (Class)NSGZipDecoder;
  v2 = [(NSGZipDecoder *)&v5 init];
  compression_status v3 = compression_stream_init((compression_stream *)(v2 + 8), COMPRESSION_STREAM_DECODE, COMPRESSION_ZLIB);
  if (v3)
  {
    NSLog(&cfstr_FailedToInitia.isa, v3);

    return 0;
  }
  else
  {
    v2[67] = 0;
    v2[64] = 1;
  }
  return (NSGZipDecoder *)v2;
}

@end