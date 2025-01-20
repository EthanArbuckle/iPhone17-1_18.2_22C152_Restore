@interface FSBlockDeviceBufferResource
+ (BOOL)supportsSecureCoding;
+ (id)bufferFromResource:(id)a3;
- (FSBlockDeviceBufferResource)initWithCoder:(id)a3;
- (NSMutableData)buffer;
- (id)delayedMetadataWriteFrom:(void *)a3 startingAt:(int64_t)a4 length:(unint64_t)a5;
- (id)initBufferFromResource:(id)a3;
- (id)metadataClear:(id)a3 wait:(BOOL)a4;
- (id)metadataFlush;
- (id)metadataPurge:(id)a3;
- (id)metadataReadInto:(void *)a3 startingAt:(int64_t)a4 length:(unint64_t)a5;
- (id)metadataReadInto:(void *)a3 startingAt:(int64_t)a4 length:(unint64_t)a5 readAheadExtents:(id *)a6 readAheadCount:(int64_t)a7;
- (id)metadataWriteFrom:(void *)a3 startingAt:(int64_t)a4 length:(unint64_t)a5;
- (int64_t)footerLength;
- (int64_t)headerLength;
- (int64_t)size;
- (unint64_t)readInto:(void *)a3 startingAt:(int64_t)a4 length:(unint64_t)a5 error:(id *)a6;
- (unint64_t)writeFrom:(void *)a3 startingAt:(int64_t)a4 length:(unint64_t)a5 error:(id *)a6;
- (void)encodeWithCoder:(id)a3;
- (void)metadataWriteFrom:(void *)a3 startingAt:(int64_t)a4 length:(unint64_t)a5 completionHandler:(id)a6;
- (void)readInto:(void *)a3 startingAt:(int64_t)a4 length:(unint64_t)a5 completionHandler:(id)a6;
- (void)writeFrom:(void *)a3 startingAt:(int64_t)a4 length:(unint64_t)a5 completionHandler:(id)a6;
@end

@implementation FSBlockDeviceBufferResource

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)FSBlockDeviceBufferResource;
  [(FSBlockDeviceResource *)&v6 encodeWithCoder:v4];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v5 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"This object may only be encoded by an NSXPCCoder." userInfo:0];
    objc_exception_throw(v5);
  }
  [v4 encodeObject:self->_buffer forKey:@"FSResource.buffer"];
  [v4 encodeInteger:self->_headerLength forKey:@"FSResource.headerLength"];
  [v4 encodeInteger:self->_footerLength forKey:@"FSResource.footerLength"];
  [v4 encodeInteger:self->_size forKey:@"FSResource.size"];
}

- (FSBlockDeviceBufferResource)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"This object may only be decoded by an NSXPCCoder." userInfo:0];
    objc_exception_throw(v9);
  }
  v10.receiver = self;
  v10.super_class = (Class)FSBlockDeviceBufferResource;
  id v5 = [(FSBlockDeviceResource *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"FSResource.buffer"];
    buffer = v5->_buffer;
    v5->_buffer = (NSMutableData *)v6;

    v5->_headerLength = [v4 decodeIntegerForKey:@"FSResource.headerLength"];
    v5->_footerLength = [v4 decodeIntegerForKey:@"FSResource.footerLength"];
    v5->_size = [v4 decodeIntegerForKey:@"FSResource.size"];
  }

  return v5;
}

- (id)initBufferFromResource:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)FSBlockDeviceBufferResource;
  id v5 = [(FSBlockDeviceResource *)&v27 initWithResource:v4];
  uint64_t v6 = v5;
  if (!v5) {
    goto LABEL_12;
  }
  unint64_t v7 = 0x100000 / [(FSBlockDeviceResource *)v5 blockSize];
  unint64_t v8 = [(FSBlockDeviceResource *)v6 blockSize] + v7;
  v6->_uint64_t headerLength = v8 * [(FSBlockDeviceResource *)v6 blockSize];
  v6->_int64_t footerLength = [(FSBlockDeviceResource *)v6 blockSize] * v8;
  uint64_t v9 = [objc_alloc(MEMORY[0x263EFF990]) initWithLength:v6->_footerLength + v6->_headerLength];
  buffer = v6->_buffer;
  v6->_buffer = (NSMutableData *)v9;

  uint64_t v11 = [(FSBlockDeviceResource *)v6 blockSize];
  uint64_t v12 = [(FSBlockDeviceResource *)v6 blockCount] * v11;
  v6->_size = v12;
  uint64_t headerLength = v6->_headerLength;
  if (headerLength > v12 || v6->_footerLength + headerLength > v12)
  {
    v6->_uint64_t headerLength = v12;
    v6->_int64_t footerLength = 0;
  }
  uint64_t v14 = [(NSMutableData *)v6->_buffer mutableBytes];
  int64_t v15 = v6->_headerLength;
  id v26 = 0;
  [v4 readInto:v14 startingAt:0 length:v15 error:&v26];
  id v16 = v26;
  if (!v16)
  {
    uint64_t v19 = (uint64_t)([(NSMutableData *)v6->_buffer mutableBytes] + v6->_headerLength);
    int64_t footerLength = v6->_footerLength;
    int64_t v21 = v6->_size - footerLength;
    id v25 = 0;
    [v4 readInto:v19 startingAt:v21 length:footerLength error:&v25];
    id v22 = v25;
    if (v22)
    {
      v17 = v22;
      v18 = fskit_std_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[FSBlockDeviceBufferResource initBufferFromResource:]();
      }
      goto LABEL_11;
    }
LABEL_12:
    v23 = v6;
    goto LABEL_13;
  }
  v17 = v16;
  v18 = fskit_std_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    -[FSBlockDeviceBufferResource initBufferFromResource:]();
  }
LABEL_11:

  v23 = 0;
LABEL_13:

  return v23;
}

+ (id)bufferFromResource:(id)a3
{
  id v3 = a3;
  id v4 = [[FSBlockDeviceBufferResource alloc] initBufferFromResource:v3];

  return v4;
}

- (void)readInto:(void *)a3 startingAt:(int64_t)a4 length:(unint64_t)a5 completionHandler:(id)a6
{
  id v10 = a6;
  uint64_t v11 = [(FSBlockDeviceResource *)self fsExecQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __76__FSBlockDeviceBufferResource_readInto_startingAt_length_completionHandler___block_invoke;
  v13[3] = &unk_26530B7E8;
  int64_t v15 = a3;
  int64_t v16 = a4;
  unint64_t v17 = a5;
  v13[4] = self;
  id v14 = v10;
  id v12 = v10;
  [v11 enqueue:v13];
}

void __76__FSBlockDeviceBufferResource_readInto_startingAt_length_completionHandler___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[6];
  uint64_t v4 = a1[7];
  uint64_t v5 = a1[8];
  id v7 = 0;
  [v2 readInto:v3 startingAt:v4 length:v5 error:&v7];
  id v6 = v7;
  (*(void (**)(void))(a1[5] + 16))();
}

- (unint64_t)readInto:(void *)a3 startingAt:(int64_t)a4 length:(unint64_t)a5 error:(id *)a6
{
  id v10 = self;
  objc_sync_enter(v10);
  if (![(FSBlockDeviceResource *)v10 isTerminated])
  {
    objc_sync_exit(v10);

    if (a3)
    {
      unint64_t headerLength = v10->_headerLength;
      if ((uint64_t)headerLength <= a4)
      {
        unint64_t size = v10->_size;
        int64_t v14 = size - v10->_footerLength;
        if (v14 < a4 && a5 + a4 <= size)
        {
          a4 = headerLength + a4 - v14;
LABEL_13:
          memcpy(a3, [(NSMutableData *)v10->_buffer mutableBytes] + a4, a5);
          *a6 = 0;
          return a5;
        }
      }
      else if (a5 + a4 <= headerLength)
      {
        goto LABEL_13;
      }
      int v12 = 22;
    }
    else
    {
      int v12 = 14;
    }
    fs_errorForPOSIXError(v12);
    a5 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    return a5;
  }
  fs_errorForPOSIXError(5);
  *a6 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v10);

  return 0;
}

- (void)writeFrom:(void *)a3 startingAt:(int64_t)a4 length:(unint64_t)a5 completionHandler:(id)a6
{
  id v7 = a6;
  fs_errorForPOSIXError(45);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, id))a6 + 2))(v7, 0, v8);
}

- (unint64_t)writeFrom:(void *)a3 startingAt:(int64_t)a4 length:(unint64_t)a5 error:(id *)a6
{
  *a6 = (id)objc_claimAutoreleasedReturnValue();
  return 0;
}

- (id)metadataReadInto:(void *)a3 startingAt:(int64_t)a4 length:(unint64_t)a5
{
  return (id)fs_errorForPOSIXError(45);
}

- (id)metadataReadInto:(void *)a3 startingAt:(int64_t)a4 length:(unint64_t)a5 readAheadExtents:(id *)a6 readAheadCount:(int64_t)a7
{
  return (id)fs_errorForPOSIXError(45);
}

- (void)metadataWriteFrom:(void *)a3 startingAt:(int64_t)a4 length:(unint64_t)a5 completionHandler:(id)a6
{
  id v7 = a6;
  fs_errorForPOSIXError(45);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a6 + 2))(v7, v8);
}

- (id)metadataWriteFrom:(void *)a3 startingAt:(int64_t)a4 length:(unint64_t)a5
{
  return (id)fs_errorForPOSIXError(45);
}

- (id)delayedMetadataWriteFrom:(void *)a3 startingAt:(int64_t)a4 length:(unint64_t)a5
{
  return (id)fs_errorForPOSIXError(45);
}

- (id)metadataFlush
{
  return (id)fs_errorForPOSIXError(45);
}

- (id)metadataClear:(id)a3 wait:(BOOL)a4
{
  return (id)fs_errorForPOSIXError(45);
}

- (id)metadataPurge:(id)a3
{
  return (id)fs_errorForPOSIXError(45);
}

- (NSMutableData)buffer
{
  return (NSMutableData *)objc_getProperty(self, a2, 128, 1);
}

- (int64_t)headerLength
{
  return self->_headerLength;
}

- (int64_t)footerLength
{
  return self->_footerLength;
}

- (int64_t)size
{
  return self->_size;
}

- (void).cxx_destruct
{
}

- (void)initBufferFromResource:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_24DDB2000, v0, v1, "%s: Can't read the footer of the resource (%@)", v2, v3, v4, v5, 2u);
}

- (void)initBufferFromResource:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_24DDB2000, v0, v1, "%s: Can't read the header of the resource (%@)", v2, v3, v4, v5, 2u);
}

@end