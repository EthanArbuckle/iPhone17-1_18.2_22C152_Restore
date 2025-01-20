@interface NSData
- (BOOL)dbg_isGzipped;
- (id)dbg_gzipDeflate;
- (id)dbg_gzipDeflateRaw;
- (id)dbg_gzipDeflateWithLevel:(int)a3 windowBits:(int)a4 memLevel:(int)a5;
- (id)dbg_gzipInflate;
- (id)dbg_gzipInflateIfCompressed;
- (id)dbg_gzipInflateRaw;
- (id)dbg_gzipInflateWithWindowBits:(int)a3;
@end

@implementation NSData

- (BOOL)dbg_isGzipped
{
  v2 = self;
  v3 = [(NSData *)v2 bytes];
  return [(NSData *)v2 length] >= 2 && *v3 == 31 && v3[1] == 139;
}

- (id)dbg_gzipInflateIfCompressed
{
  if ([(NSData *)self dbg_isGzipped])
  {
    v3 = [(NSData *)self dbg_gzipInflate];
  }
  else
  {
    v3 = self;
  }
  return v3;
}

- (id)dbg_gzipInflate
{
  v3 = DebugHierarchyGzipOSLog();
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);
  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v9 = 134217984;
    NSUInteger v10 = [(NSData *)self length];
    _os_signpost_emit_with_name_impl(&dword_0, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "Inflate", "Begin with size: %{xcode:size-in-bytes}lu", (uint8_t *)&v9, 0xCu);
  }

  v7 = [(NSData *)self dbg_gzipInflateWithWindowBits:47];
  return v7;
}

- (id)dbg_gzipInflateRaw
{
  return [(NSData *)self dbg_gzipInflateWithWindowBits:4294967281];
}

- (id)dbg_gzipInflateWithWindowBits:(int)a3
{
  if (![(NSData *)self length])
  {
    v13 = self;
    goto LABEL_26;
  }
  NSUInteger v5 = [(NSData *)self length];
  NSUInteger v6 = [(NSData *)self length];
  v7 = +[NSMutableData dataWithLength:v5 + (v6 >> 1)];
  v8 = self;
  v29.avail_in = [(NSData *)v8 length];
  v29.zalloc = 0;
  v29.zfree = 0;
  v29.uLong total_out = 0;
  if (!inflateInit2_(&v29, a3, "1.2.12", 112))
  {
    NSUInteger v14 = v6 >> 1;
    do
    {
      uLong total_out = v29.total_out;
      if (total_out >= (unint64_t)[v7 length]) {
        [v7 increaseLengthBy:v14];
      }
      id v16 = v7;
      v17 = (char *)[v16 mutableBytes];
      v29.next_out = (Bytef *)&v17[v29.total_out];
      unsigned int v18 = [v16 length];
      v29.avail_out = v18 - LODWORD(v29.total_out);
      int v19 = inflate(&v29, 2);
    }
    while (!v19);
    if (v19 == 1)
    {
      if (!inflateEnd(&v29))
      {
        [v16 setLength:v29.total_out];
        v13 = +[NSData dataWithData:v16];
        v20 = DebugHierarchyGzipOSLog();
        os_signpost_id_t v21 = os_signpost_id_make_with_pointer(v20, v8);
        v22 = v20;
        v12 = v22;
        if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
        {
          NSUInteger v23 = [(NSData *)v13 length];
          *(_DWORD *)buf = 134217984;
          *(void *)&buf[4] = v23;
          _os_signpost_emit_with_name_impl(&dword_0, v12, OS_SIGNPOST_INTERVAL_END, v21, "Inflate", "Completed with size: %{xcode:size-in-bytes}lu", buf, 0xCu);
        }
        goto LABEL_25;
      }
    }
    else if (!inflateEnd(&v29))
    {
      v26 = DebugHierarchyGzipOSLog();
      os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v26, v8);
      v27 = v26;
      v12 = v27;
      if (v10 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v27)) {
        goto LABEL_24;
      }
      *(void *)buf = 67109120;
      goto LABEL_23;
    }
    v24 = DebugHierarchyGzipOSLog();
    os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v24, v8);
    v25 = v24;
    v12 = v25;
    if (v10 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v25)) {
      goto LABEL_24;
    }
    *(void *)buf = 67109120;
    goto LABEL_23;
  }
  int v9 = DebugHierarchyGzipOSLog();
  os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v9, v8);
  v11 = v9;
  v12 = v11;
  if (v10 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v11)) {
    goto LABEL_24;
  }
  *(void *)buf = 67109120;
LABEL_23:
  _os_signpost_emit_with_name_impl(&dword_0, v12, OS_SIGNPOST_INTERVAL_END, v10, "Inflate", "Completed with size: %{xcode:size-in-bytes}d", buf, 8u);
LABEL_24:
  v13 = 0;
LABEL_25:

LABEL_26:
  return v13;
}

- (id)dbg_gzipDeflate
{
  v3 = DebugHierarchyGzipOSLog();
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);
  NSUInteger v5 = v3;
  NSUInteger v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v9 = 134217984;
    NSUInteger v10 = [(NSData *)self length];
    _os_signpost_emit_with_name_impl(&dword_0, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "Deflate", "Begin with size: %{xcode:size-in-bytes}lu", (uint8_t *)&v9, 0xCu);
  }

  v7 = [(NSData *)self dbg_gzipDeflateWithLevel:2 windowBits:31 memLevel:9];
  return v7;
}

- (id)dbg_gzipDeflateRaw
{
  return [(NSData *)self dbg_gzipDeflateWithLevel:2 windowBits:4294967281 memLevel:9];
}

- (id)dbg_gzipDeflateWithLevel:(int)a3 windowBits:(int)a4 memLevel:(int)a5
{
  if ([(NSData *)self length])
  {
    memset(&strm.avail_in, 0, 104);
    int v9 = self;
    strm.next_in = (Bytef *)[(NSData *)v9 bytes];
    strm.avail_in = [(NSData *)v9 length];
    if (deflateInit2_(&strm, a3, 8, a4, a5, 0, "1.2.12", 112))
    {
      NSUInteger v10 = DebugHierarchyGzipOSLog();
      os_signpost_id_t v11 = os_signpost_id_make_with_pointer(v10, v9);
      v12 = v10;
      v13 = v12;
      if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
      {
        int v28 = 67109120;
        LODWORD(v29) = 0;
        _os_signpost_emit_with_name_impl(&dword_0, v13, OS_SIGNPOST_INTERVAL_END, v11, "Deflate", "Completed with size: %{xcode:size-in-bytes}d", (uint8_t *)&v28, 8u);
      }
      NSUInteger v14 = 0;
      v15 = v13;
    }
    else
    {
      v20 = +[NSMutableData dataWithLength:0x4000];
      do
      {
        uLong total_out = strm.total_out;
        if (total_out >= (unint64_t)[v20 length]) {
          [v20 increaseLengthBy:0x4000];
        }
        v15 = v20;
        v22 = (char *)[v15 mutableBytes];
        strm.next_out = (Bytef *)&v22[strm.total_out];
        unsigned int v23 = [v15 length];
        strm.avail_out = v23 - LODWORD(strm.total_out);
        deflate(&strm, 4);
      }
      while (!strm.avail_out);
      deflateEnd(&strm);
      [v15 setLength:strm.total_out];
      NSUInteger v14 = +[NSData dataWithData:v15];
      v24 = DebugHierarchyGzipOSLog();
      os_signpost_id_t v25 = os_signpost_id_make_with_pointer(v24, v9);
      v26 = v24;
      v13 = v26;
      if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        int v28 = 134217984;
        NSUInteger v29 = [(NSData *)v14 length];
        _os_signpost_emit_with_name_impl(&dword_0, v13, OS_SIGNPOST_INTERVAL_END, v25, "Deflate", "Completed with size: %{xcode:size-in-bytes}lu", (uint8_t *)&v28, 0xCu);
      }
    }
  }
  else
  {
    id v16 = DebugHierarchyGzipOSLog();
    os_signpost_id_t v17 = os_signpost_id_make_with_pointer(v16, self);
    unsigned int v18 = v16;
    int v19 = v18;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      strm.next_in = (Bytef *)67109120;
      _os_signpost_emit_with_name_impl(&dword_0, v19, OS_SIGNPOST_INTERVAL_END, v17, "Deflate", "Completed with size: %{xcode:size-in-bytes}d", (uint8_t *)&strm, 8u);
    }

    NSUInteger v14 = self;
  }
  return v14;
}

@end