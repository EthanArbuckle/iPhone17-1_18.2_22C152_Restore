@interface DTXBlockCompressorLibCompression
- (BOOL)uncompressBuffer:(const char *)a3 ofLength:(unint64_t)a4 toBuffer:(char *)a5 withKnownUncompressedLength:(unint64_t)a6 usingCompressionType:(int)a7;
- (unint64_t)compressBuffer:(const char *)a3 ofLength:(unint64_t)a4 toBuffer:(char *)a5 ofLength:(unint64_t)a6 usingCompressionType:(int)a7 withFinalCompressionType:(int *)a8;
- (void)dealloc;
@end

@implementation DTXBlockCompressorLibCompression

- (void)dealloc
{
  p_lz4ScratchBuffer = &self->_lz4ScratchBuffer;
  v4 = (void *)atomic_load(&self->_lz4ScratchBuffer);
  if (v4)
  {
    free(v4);
    atomic_store(0, p_lz4ScratchBuffer);
  }
  v5 = (void *)atomic_load(&self->_lzfseScratchBuffer);
  if (v5)
  {
    free(v5);
    atomic_store(0, &self->_lzfseScratchBuffer);
  }
  v6.receiver = self;
  v6.super_class = (Class)DTXBlockCompressorLibCompression;
  [(DTXBlockCompressorLibCompression *)&v6 dealloc];
}

- (unint64_t)compressBuffer:(const char *)a3 ofLength:(unint64_t)a4 toBuffer:(char *)a5 ofLength:(unint64_t)a6 usingCompressionType:(int)a7 withFinalCompressionType:(int *)a8
{
  if (!a8 || !a4 || !a3 || !a5 || !a6)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      LOWORD(strm.next_in) = 0;
      _os_log_impl(&_dtx_internal_logger, &_os_log_internal, OS_LOG_TYPE_ERROR, "invalid args", (uint8_t *)&strm, 2u);
    }
    return 0;
  }
  if ((a7 - 5) > 1)
  {
    int v19 = a7 - 3;
    if (a7 - 3) <= 7 && ((0xF3u >> v19))
    {
      compression_algorithm v22 = dword_22AF55100[v19];
      int v23 = dword_22AF550E0[v19];
      v24 = sub_22AF3756C(self, v22);
      *a8 = v23;
      size_t total_out_low = compression_encode_buffer((uint8_t *)a5, a6, (const uint8_t *)a3, a4, v24, v22);
      sub_22AF37600(self, v22, v24);
      return total_out_low;
    }
    return 0;
  }
  if ((a6 | a4) >> 32) {
    return 0;
  }
  *a8 = a7;
  memset(&strm.opaque, 0, 32);
  if (a7 == 5) {
    int v13 = 1;
  }
  else {
    int v13 = -1;
  }
  memset(&strm, 0, 80);
  uint64_t v14 = deflateInit_(&strm, v13, "1.2.12", 112);
  if (v14) {
    [MEMORY[0x263EFF940] defaultInit:v15 format:@"DTXMessageCompressionException" format:@"defaultInit() failed with error %d" arguments:v14];
  }
  strm.avail_in = a4;
  strm.next_in = (Bytef *)a3;
  strm.avail_out = a6;
  strm.next_out = (Bytef *)a5;
  uint64_t v16 = deflate(&strm, 4);
  if (v16 == 1)
  {
    size_t total_out_low = LODWORD(strm.total_out);
  }
  else
  {
    [MEMORY[0x263EFF940] raise:@"DTXMessageCompressionException" format:@"deflate() returned unexpected result %d", v16];
    size_t total_out_low = 0;
  }
  deflateEnd(&strm);
  return total_out_low;
}

- (BOOL)uncompressBuffer:(const char *)a3 ofLength:(unint64_t)a4 toBuffer:(char *)a5 withKnownUncompressedLength:(unint64_t)a6 usingCompressionType:(int)a7
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  if (!a6 || !a4 || !a3 || !a5)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    LOWORD(strm.next_in) = 0;
    uint64_t v16 = &_os_log_internal;
    v17 = "invalid args";
    uint32_t v18 = 2;
LABEL_14:
    _os_log_impl(&_dtx_internal_logger, v16, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&strm, v18);
    return 0;
  }
  if ((a7 - 5) <= 1)
  {
    if (!((a6 | a4) >> 32))
    {
      memset(&strm, 0, sizeof(strm));
      uint64_t v11 = inflateInit_(&strm, "1.2.12", 112);
      if (v11) {
        [MEMORY[0x263EFF940] raise:@"DTXMessageCompressionException" format:@"inflateInit() failed with error %d", v11];
      }
      strm.avail_in = a4;
      strm.next_in = (Bytef *)a3;
      strm.avail_out = a6;
      strm.next_out = (Bytef *)a5;
      int v13 = inflate(&strm, 4);
      if (v13 == 1)
      {
        uLong total_out = strm.total_out;
        if (strm.total_out == a6)
        {
          BOOL v15 = 1;
LABEL_25:
          inflateEnd(&strm);
          return v15;
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109376;
          int v30 = a6;
          __int16 v31 = 2048;
          uLong v32 = total_out;
          v25 = &_os_log_internal;
          v26 = "inflate() returned unexpected uncompressed size, expected %u but was %lu";
          uint32_t v27 = 18;
          goto LABEL_23;
        }
      }
      else
      {
        int v24 = v13;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          int v30 = v24;
          v25 = &_os_log_internal;
          v26 = "inflate() returned unexpected result %d";
          uint32_t v27 = 8;
LABEL_23:
          _os_log_impl(&_dtx_internal_logger, v25, OS_LOG_TYPE_ERROR, v26, buf, v27);
        }
      }
      BOOL v15 = 0;
      goto LABEL_25;
    }
    return 0;
  }
  int v19 = a7 - 3;
  if ((a7 - 3) > 7 || ((0xF3u >> v19) & 1) == 0) {
    return 0;
  }
  compression_algorithm v21 = dword_22AF55100[v19];
  compression_algorithm v22 = sub_22AF3756C(self, v21);
  size_t v23 = compression_decode_buffer((uint8_t *)a5, a6, (const uint8_t *)a3, a4, v22, v21);
  sub_22AF37600(self, v21, v22);
  if (v23 != a6)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    LODWORD(strm.next_in) = 134218240;
    *(Bytef **)((char *)&strm.next_in + 4) = (Bytef *)a6;
    *((_WORD *)&strm.avail_in + 2) = 2048;
    *(void *)((char *)&strm.avail_in + 6) = v23;
    uint64_t v16 = &_os_log_internal;
    v17 = "decompression: expected decompressed size to be %zu bytes in length but was %zu instead, probable data corrupt"
          "ion - please file a bug report";
    uint32_t v18 = 22;
    goto LABEL_14;
  }
  return 1;
}

@end