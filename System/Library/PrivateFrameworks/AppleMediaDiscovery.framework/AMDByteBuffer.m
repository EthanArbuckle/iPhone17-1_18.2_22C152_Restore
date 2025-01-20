@interface AMDByteBuffer
- (AMDByteBuffer)initWithInputStream:(id)a3 withFileSize:(unint64_t)a4;
- (BOOL)hasRemaining;
- (NSInputStream)inputStream;
- (id)getDataOfLength:(int)a3 error:(id *)a4;
- (int)getIntWithError:(id *)a3;
- (int64_t)getLongWithError:(id *)a3;
- (signed)getShortWithError:(id *)a3;
- (unint64_t)fileSize;
- (unint64_t)readPosition;
- (unsigned)getByteWithError:(id *)a3;
- (void)copyDataOfLength:(unint64_t)a3 toFile:(id)a4 isCompressed:(BOOL)a5 error:(id *)a6;
- (void)setFileSize:(unint64_t)a3;
- (void)setInputStream:(id)a3;
- (void)setReadPosition:(unint64_t)a3;
@end

@implementation AMDByteBuffer

- (AMDByteBuffer)initWithInputStream:(id)a3 withFileSize:(unint64_t)a4
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unint64_t v9 = a4;
  v4 = v11;
  v11 = 0;
  v8.receiver = v4;
  v8.super_class = (Class)AMDByteBuffer;
  v11 = [(AMDByteBuffer *)&v8 init];
  objc_storeStrong((id *)&v11, v11);
  [(AMDByteBuffer *)v11 setInputStream:location[0]];
  [(AMDByteBuffer *)v11 setReadPosition:0];
  [(AMDByteBuffer *)v11 setFileSize:v9];
  v7 = v11;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v11, 0);
  return v7;
}

- (BOOL)hasRemaining
{
  v4 = [(AMDByteBuffer *)self inputStream];
  BOOL v5 = 0;
  if ([(NSInputStream *)v4 hasBytesAvailable])
  {
    unint64_t v3 = [(AMDByteBuffer *)self readPosition];
    BOOL v5 = v3 < [(AMDByteBuffer *)self fileSize];
  }

  return v5;
}

- (unsigned)getByteWithError:(id *)a3
{
  v11 = self;
  SEL v10 = a2;
  unint64_t v9 = a3;
  unint64_t v7 = [(AMDByteBuffer *)self readPosition] + 1;
  if (v7 <= [(AMDByteBuffer *)v11 fileSize])
  {
    BOOL v5 = [(AMDByteBuffer *)v11 inputStream];
    uint64_t v6 = [(NSInputStream *)v5 read:&v8 maxLength:1];

    if (v6 > 0)
    {
      [(AMDByteBuffer *)v11 setReadPosition:[(AMDByteBuffer *)v11 readPosition] + 1];
      return v8;
    }
    else
    {
      id v3 = +[AMDError allocError:6 withMessage:@"insufficient data to read byte"];
      *unint64_t v9 = v3;
      return 0;
    }
  }
  else
  {
    *unint64_t v9 = +[AMDError allocError:6 withMessage:@"insufficient data to read byte"];
    return 0;
  }
}

- (signed)getShortWithError:(id *)a3
{
  v14 = self;
  SEL v13 = a2;
  v12 = a3;
  unint64_t v7 = [(AMDByteBuffer *)self readPosition] + 2;
  if (v7 <= [(AMDByteBuffer *)v14 fileSize])
  {
    BOOL v5 = [(AMDByteBuffer *)v14 inputStream];
    uint64_t v6 = [(NSInputStream *)v5 read:v11 maxLength:2];

    if (v6 > 0)
    {
      [(AMDByteBuffer *)v14 setReadPosition:[(AMDByteBuffer *)v14 readPosition] + 2];
      signed __int16 v10 = 0;
      int v9 = 8;
      for (int i = 0; i != 2; ++i)
      {
        v10 |= v11[i] << v9;
        v9 -= 8;
      }
      return v10;
    }
    else
    {
      id v3 = +[AMDError allocError:6 withMessage:@"insufficient data to read short"];
      id *v12 = v3;
      return 0;
    }
  }
  else
  {
    id *v12 = +[AMDError allocError:6 withMessage:@"insufficient data to read short"];
    return 0;
  }
}

- (int)getIntWithError:(id *)a3
{
  v14 = self;
  SEL v13 = a2;
  v12 = a3;
  unint64_t v7 = [(AMDByteBuffer *)self readPosition] + 4;
  if (v7 <= [(AMDByteBuffer *)v14 fileSize])
  {
    BOOL v5 = [(AMDByteBuffer *)v14 inputStream];
    uint64_t v6 = [(NSInputStream *)v5 read:v11 maxLength:4];

    if (v6 > 0)
    {
      [(AMDByteBuffer *)v14 setReadPosition:[(AMDByteBuffer *)v14 readPosition] + 4];
      int v10 = 0;
      int v9 = 24;
      for (int i = 0; i != 4; ++i)
      {
        v10 |= v11[i] << v9;
        v9 -= 8;
      }
      return v10;
    }
    else
    {
      id v3 = +[AMDError allocError:6 withMessage:@"insufficient data to read int"];
      id *v12 = v3;
      return 0;
    }
  }
  else
  {
    id *v12 = +[AMDError allocError:6 withMessage:@"insufficient data to read int"];
    return 0;
  }
}

- (int64_t)getLongWithError:(id *)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  unint64_t v6 = [(AMDByteBuffer *)self readPosition] + 8;
  if (v6 <= [(AMDByteBuffer *)self fileSize])
  {
    v4 = [(AMDByteBuffer *)self inputStream];
    uint64_t v5 = [(NSInputStream *)v4 read:v13 maxLength:8];

    if (v5 > 0)
    {
      [(AMDByteBuffer *)self setReadPosition:[(AMDByteBuffer *)self readPosition] + 8];
      int64_t v9 = 0;
      int v8 = 56;
      for (int i = 0; i != 8; ++i)
      {
        v9 |= (unint64_t)v13[i] << v8;
        v8 -= 8;
      }
      return v9;
    }
    else
    {
      *a3 = +[AMDError allocError:6 withMessage:@"insufficient data to read long"];
      return 0;
    }
  }
  else
  {
    *a3 = +[AMDError allocError:6 withMessage:@"insufficient data to read long"];
    return 0;
  }
}

- (id)getDataOfLength:(int)a3 error:(id *)a4
{
  v18 = self;
  SEL v17 = a2;
  int v16 = a3;
  v15 = a4;
  unint64_t v10 = [(AMDByteBuffer *)self readPosition] + a3;
  if (v10 <= [(AMDByteBuffer *)v18 fileSize])
  {
    SEL v13 = malloc_type_malloc(v16, 0xA79BE973uLL);
    id v12 = (id)[MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v13 length:v16];
    int v8 = [(AMDByteBuffer *)v18 inputStream];
    int64_t v9 = [(NSInputStream *)v8 read:v13 maxLength:v16];

    v11[1] = v9;
    if ((uint64_t)v9 > 0)
    {
      [(AMDByteBuffer *)v18 setReadPosition:[(AMDByteBuffer *)v18 readPosition] + v16];
      id v19 = v12;
    }
    else
    {
      v11[0] = (id)objc_msgSend(NSString, "stringWithFormat:", @"insufficient data to read %d bytes", v16);
      id v5 = +[AMDError allocError:6 withMessage:v11[0]];
      id *v15 = v5;
      id v19 = 0;
      objc_storeStrong(v11, 0);
    }
    objc_storeStrong(&v12, 0);
  }
  else
  {
    id v14 = (id)objc_msgSend(NSString, "stringWithFormat:", @"insufficient data to read %d bytes", v16);
    id v4 = +[AMDError allocError:6 withMessage:v14];
    id *v15 = v4;
    id v19 = 0;
    objc_storeStrong(&v14, 0);
  }
  unint64_t v6 = v19;

  return v6;
}

- (void)copyDataOfLength:(unint64_t)a3 toFile:(id)a4 isCompressed:(BOOL)a5 error:(id *)a6
{
  v49 = self;
  SEL v48 = a2;
  unint64_t v47 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  BOOL v45 = a5;
  v44 = a6;
  uint64_t v6 = [(AMDByteBuffer *)v49 readPosition];
  unint64_t v23 = v6 + v47;
  if (v23 > [(AMDByteBuffer *)v49 fileSize])
  {
    id v43 = (id)objc_msgSend(NSString, "stringWithFormat:", @"insufficient data to read %lu bytes", v47);
    id v7 = +[AMDError allocError:6 withMessage:v43];
    id *v44 = v7;
    int v42 = 1;
    objc_storeStrong(&v43, 0);
LABEL_40:
    objc_storeStrong(&location, 0);
    return;
  }
  unint64_t v41 = v47;
  id v40 = 0;
  memset(&__b, 0, sizeof(__b));
  uint64_t v38 = 4096;
  uint64_t v37 = 0x4000;
  v36 = (uint8_t *)malloc_type_malloc(0x1000uLL, 0x649E63DFuLL);
  memset((char *)&v35[3] + 7, 0, 9);
  v20 = (void *)MEMORY[0x263EFF9E0];
  id v19 = (id)[location path];
  id v8 = (id)objc_msgSend(v20, "outputStreamToFileAtPath:append:");
  id v9 = v40;
  id v40 = v8;

  if (v40)
  {
    [v40 open];
    if (!v45) {
      goto LABEL_9;
    }
    if (compression_stream_init(&__b, COMPRESSION_STREAM_DECODE, COMPRESSION_ZLIB))
    {
      id v11 = +[AMDError allocError:4 withMessage:@"could not initialize the compression stream"];
      id *v44 = v11;
      int v42 = 1;
    }
    else
    {
      v35[4] = malloc_type_malloc(0x4000uLL, 0x80AC762DuLL);
LABEL_9:
      while (v41)
      {
        uint64_t v34 = 4096;
        if (v41 < 0x1000) {
          uint64_t v34 = v41;
        }
        SEL v17 = [(AMDByteBuffer *)v49 inputStream];
        uint64_t v18 = [(NSInputStream *)v17 read:v36 maxLength:v34];

        size_t v33 = v18;
        if (v18 <= 0)
        {
          id v32 = (id)[NSString stringWithFormat:@"error while reading from stream, remaining %lu", v41];
          id v12 = +[AMDError allocError:8 withMessage:v32];
          id *v44 = v12;
          int v42 = 1;
          objc_storeStrong(&v32, 0);
          goto LABEL_29;
        }
        v41 -= v33;
        [(AMDByteBuffer *)v49 setReadPosition:[(AMDByteBuffer *)v49 readPosition] + v33];
        if (v45)
        {
          char v31 = 0;
          BOOL v30 = v41 == 0;
          __b.src_ptr = v36;
          __b.src_size = v33;
          while ((v31 & 1) == 0)
          {
            __b.dst_ptr = (uint8_t *)v35[4];
            __b.dst_size = 0x4000;
            compression_status v29 = compression_stream_process(&__b, v30);
            if (v29 == COMPRESSION_STATUS_ERROR)
            {
              id v13 = +[AMDError allocError:5 withMessage:@"error while decompressing the stream"];
              id *v44 = v13;
              int v42 = 1;
              goto LABEL_29;
            }
            size_t v28 = 0x4000 - __b.dst_size;
            uint64_t v27 = [v40 write:v35[4] maxLength:0x4000 - __b.dst_size];
            if (v27 <= 0)
            {
              id v26 = (id)[NSString stringWithFormat:@"error while writing to %@", location];
              id v14 = +[AMDError allocError:7 withMessage:v26];
              id *v44 = v14;
              int v42 = 1;
              objc_storeStrong(&v26, 0);
              goto LABEL_29;
            }
            if (v41 || v29 == COMPRESSION_STATUS_END) {
              char v31 = 1;
            }
          }
        }
        else
        {
          uint64_t v25 = [v40 write:v36 maxLength:v33];
          if (v25 <= 0)
          {
            id v24 = (id)[NSString stringWithFormat:@"error while writing to %@", location];
            id v15 = +[AMDError allocError:7 withMessage:v24];
            id *v44 = v15;
            int v42 = 1;
            objc_storeStrong(&v24, 0);
            goto LABEL_29;
          }
        }
      }
      int v42 = 0;
    }
  }
  else
  {
    v35[0] = (id)[NSString stringWithFormat:@"could not open output stream to file %@", location];
    id v10 = +[AMDError allocError:7 withMessage:v35[0]];
    id *v44 = v10;
    int v42 = 1;
    objc_storeStrong(v35, 0);
  }
LABEL_29:
  int v16 = v42;
  free(v36);
  if (v40) {
    [v40 close];
  }
  if (v45)
  {
    free(v35[4]);
    compression_stream_destroy(&__b);
  }
  if (HIBYTE(v35[3])) {
    objc_exception_rethrow();
  }
  int v42 = v16;
  if (!v16)
  {
    int v42 = 0;
LABEL_39:
    objc_storeStrong(&v40, 0);
    goto LABEL_40;
  }
  if (v16 != 2) {
    goto LABEL_39;
  }
  __break(1u);
}

- (NSInputStream)inputStream
{
  return self->_inputStream;
}

- (void)setInputStream:(id)a3
{
}

- (unint64_t)readPosition
{
  return self->_readPosition;
}

- (void)setReadPosition:(unint64_t)a3
{
  self->_readPosition = a3;
}

- (unint64_t)fileSize
{
  return self->_fileSize;
}

- (void)setFileSize:(unint64_t)a3
{
  self->_fileSize = a3;
}

- (void).cxx_destruct
{
}

@end