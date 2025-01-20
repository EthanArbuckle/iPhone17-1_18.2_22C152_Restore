@interface UARPSuperBinaryAssetPayload
- (BOOL)allowCompressionHeaders;
- (BOOL)appendCompressedPayloadToFile:(id)a3 error:(id *)a4;
- (BOOL)appendPayloadToFile:(id)a3 bytesWritten:(unint64_t *)a4 error:(id *)a5;
- (BOOL)compressPayloadURLToFileHandle:(id)a3 error:(id *)a4;
- (BOOL)expandDictionaryWithPayloadsFolder:(id)a3 metaDataTable:(id)a4 error:(id *)a5;
- (BOOL)expandPayloadToURL:(id)a3 payloadFilename:(id)a4 superbinary:(id)a5 offset:(unint64_t)a6 length:(unint64_t)a7 error:(id *)a8;
- (BOOL)expandPayloadToURL:(id)a3 superbinary:(id)a4 offset:(unint64_t)a5 length:(unint64_t)a6 error:(id *)a7;
- (BOOL)isValid;
- (BOOL)needsCompression;
- (BOOL)parseFromPlistPayloadMetaDataTLVs:(id)a3 payloadsURL:(id)a4 error:(id *)a5;
- (BOOL)parseFromPlistVersion:(id *)a3;
- (BOOL)prepareUarpVersion:(UARPVersion *)a3;
- (BOOL)setPayloadToContentsOfFile:(id)a3 friendlyName:(id)a4 error:(id *)a5;
- (BOOL)setPayloadToContentsOfURL:(id)a3 friendlyName:(id)a4;
- (BOOL)setPayloadToData:(id)a3;
- (BOOL)updateFormatVersion:(unint64_t)a3;
- (BOOL)writePayloadData:(id)a3 offset:(unint64_t)a4 error:(id *)a5;
- (NSArray)tlvs;
- (NSData)compressionHeaders;
- (NSData)metaData;
- (NSData)payload;
- (UARPAssetTag)payloadTag;
- (UARPSuperBinaryAssetPayload)init;
- (UARPSuperBinaryAssetPayload)initWithDictionary:(id)a3;
- (UARPSuperBinaryAssetPayload)initWithPayloadHeader:(UARPPayloadHeader *)a3;
- (UARPSuperBinaryAssetPayload)initWithPayloadTag:(id)a3 assetVersion:(id)a4;
- (UARPSuperBinaryAssetPayload)initWithPayloadTag:(id)a3 assetVersion:(id)a4 writable:(BOOL)a5;
- (UARPSuperBinaryAssetPayload)initWithPayloadTag:(id)a3 majorVersion:(unint64_t)a4 minorVersion:(unint64_t)a5 releaseVersion:(unint64_t)a6 buildVersion:(unint64_t)a7;
- (UARPSuperBinaryAssetPayload)initWithTag:(id)a3 majorVersion:(id)a4 minorVersion:(id)a5 releaseVersion:(id)a6 buildVersion:(id)a7;
- (_NSRange)rangeMetadata;
- (_NSRange)rangePayload;
- (id)compressPayloadChunk:(id)a3 offset:(unsigned int)a4 error:(id *)a5;
- (id)description;
- (id)hashMetaData;
- (id)hashMetaDataWithAlgorithm:(int)a3 error:(id *)a4;
- (id)hashPayloadWithAlgorithm:(int)a3 error:(id *)a4;
- (id)prepareData;
- (id)prepareMetaData;
- (unint64_t)compressionHeaderIndex;
- (unint64_t)formatVersion;
- (unint64_t)preparePackedTag;
- (unint64_t)preparedDataLength;
- (unint64_t)unpreparedDataLength;
- (void)addMetaDataTLV:(id)a3;
- (void)addMetaDataTLVs:(id)a3;
- (void)prepareData;
- (void)processBVERVersionString:(id)a3;
- (void)processVersionString:(id)a3;
- (void)setSuperBinaryURL:(id)a3;
@end

@implementation UARPSuperBinaryAssetPayload

- (UARPSuperBinaryAssetPayload)init
{
  v12.receiver = self;
  v12.super_class = (Class)UARPSuperBinaryAssetPayload;
  v2 = [(UARPSuperBinaryAssetPayload *)&v12 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.accessoryupdater.uarp", "superbinarypayload");
    v4 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v3;

    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    v6 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v5;

    id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
    v8 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v7;

    *(void *)(v2 + 92) = 4096;
    *((_DWORD *)v2 + 42) = -1;
    id v9 = objc_alloc_init(MEMORY[0x263EFF990]);
    v10 = (void *)*((void *)v2 + 20);
    *((void *)v2 + 20) = v9;

    *((void *)v2 + 25) = 3;
    v2[172] = 1;
  }
  return (UARPSuperBinaryAssetPayload *)v2;
}

- (UARPSuperBinaryAssetPayload)initWithPayloadTag:(id)a3 assetVersion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(UARPSuperBinaryAssetPayload *)self init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_payloadTag, a3);
    uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%c%c%c%c", -[UARPAssetTag char1](v10->_payloadTag, "char1"), -[UARPAssetTag char2](v10->_payloadTag, "char2"), -[UARPAssetTag char3](v10->_payloadTag, "char3"), -[UARPAssetTag char4](v10->_payloadTag, "char4"));
    tag = v10->_tag;
    v10->_tag = (NSString *)v11;

    objc_storeStrong((id *)&v10->_assetVersion, a4);
  }

  return v10;
}

- (UARPSuperBinaryAssetPayload)initWithPayloadTag:(id)a3 assetVersion:(id)a4 writable:(BOOL)a5
{
  id v5 = -[UARPSuperBinaryAssetPayload initWithPayloadTag:assetVersion:](self, "initWithPayloadTag:assetVersion:", a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    v5->_isWritable = 1;
    uint64_t v7 = UARPUtilsBuildURLForTemporaryFile();
    url = v6->_url;
    v6->_url = (NSURL *)v7;
  }
  return v6;
}

- (UARPSuperBinaryAssetPayload)initWithPayloadTag:(id)a3 majorVersion:(unint64_t)a4 minorVersion:(unint64_t)a5 releaseVersion:(unint64_t)a6 buildVersion:(unint64_t)a7
{
  id v11 = a3;
  objc_super v12 = [[UARPAssetVersion alloc] initWithMajorVersion:a4 minorVersion:a4 releaseVersion:a6 buildVersion:a7];
  v13 = [(UARPSuperBinaryAssetPayload *)self initWithPayloadTag:v11 assetVersion:v12];

  return v13;
}

- (UARPSuperBinaryAssetPayload)initWithTag:(id)a3 majorVersion:(id)a4 minorVersion:(id)a5 releaseVersion:(id)a6 buildVersion:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  if ((unint64_t)[v11 length] >= 4)
  {
    v16 = (char *)[v11 UTF8String];
    v17 = [[UARPAssetTag alloc] initWithChar1:*v16 char2:v16[1] char3:v16[2] char4:v16[3]];
    v18 = -[UARPAssetVersion initWithMajorVersion:minorVersion:releaseVersion:buildVersion:]([UARPAssetVersion alloc], "initWithMajorVersion:minorVersion:releaseVersion:buildVersion:", [v12 unsignedIntegerValue], objc_msgSend(v12, "unsignedIntegerValue"), objc_msgSend(v13, "unsignedIntegerValue"), objc_msgSend(v14, "unsignedIntegerValue"));
    self = [(UARPSuperBinaryAssetPayload *)self initWithPayloadTag:v17 assetVersion:v18];

    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (UARPSuperBinaryAssetPayload)initWithPayloadHeader:(UARPPayloadHeader *)a3
{
  v4 = [(UARPSuperBinaryAssetPayload *)self init];
  id v5 = v4;
  if (v4)
  {
    long long v6 = *(_OWORD *)&a3->payloadHeaderLength;
    long long v7 = *(_OWORD *)&a3->payloadVersion.release;
    *(void *)&v4->_payloadHeader.payloadOffset = *(void *)&a3->payloadOffset;
    *(_OWORD *)&v4->_payloadHeader.payloadVersion.release = v7;
    *(_OWORD *)&v4->_payloadHeader.payloadHeaderLength = v6;
    uarpPayloadTagUnpack(v4->_payloadHeader.payloadTag, v13);
    uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"%c%c%c%c", v13[0], v13[1], v13[2], v13[3]);
    tag = v5->_tag;
    v5->_tag = (NSString *)v8;

    v5->_uarpVersion = v5->_payloadHeader.payloadVersion;
    v10 = [[UARPAssetVersion alloc] initWithMajorVersion:v5->_uarpVersion.major minorVersion:v5->_uarpVersion.minor releaseVersion:v5->_uarpVersion.release buildVersion:v5->_uarpVersion.build];
    assetVersion = v5->_assetVersion;
    v5->_assetVersion = v10;
  }
  return v5;
}

- (BOOL)updateFormatVersion:(unint64_t)a3
{
  if (a3 <= 3) {
    self->_formatVersion = a3;
  }
  return a3 < 4;
}

- (UARPAssetTag)payloadTag
{
  tag = self->_tag;
  if (tag)
  {
    if ([(NSString *)tag length] == 4)
    {
      payloadTag = self->_payloadTag;
      if (!payloadTag)
      {
        id v5 = [(NSString *)self->_tag UTF8String];
        long long v6 = [[UARPAssetTag alloc] initWithChar1:*v5 char2:v5[1] char3:v5[2] char4:v5[3]];
        long long v7 = self->_payloadTag;
        self->_payloadTag = v6;

        payloadTag = self->_payloadTag;
      }
      tag = payloadTag;
    }
    else
    {
      tag = 0;
    }
  }
  return (UARPAssetTag *)tag;
}

- (NSArray)tlvs
{
  return (NSArray *)[MEMORY[0x263EFF8C0] arrayWithArray:self->_tlvs];
}

- (NSData)metaData
{
  return (NSData *)[MEMORY[0x263EFF8F8] dataWithData:self->_metaData];
}

- (void)addMetaDataTLV:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    if ([v4 type] == 3166200577
      || [v5 type] == 3166200578
      || [v5 type] == 3166200576
      || [v5 type] == 3166200579)
    {
      composeTLVs = self->_composeTLVs;
LABEL_7:
      [(NSMutableArray *)composeTLVs addObject:v5];
      goto LABEL_10;
    }
    if ([v5 type] == 3166200581)
    {
      [(UARPSuperBinaryAssetPayload *)self processVersionString:v5];
      goto LABEL_10;
    }
    if ([v5 type] == 3166200582)
    {
      [(UARPSuperBinaryAssetPayload *)self processBVERVersionString:v5];
      goto LABEL_10;
    }
    if ([v5 type] == 3436347660)
    {
      id v14 = [v5 valueAsNumber];
      self->_compression = [v14 unsignedLongValue];
    }
    else if ([v5 type] == 3436347659)
    {
      id v14 = [v5 valueAsNumber];
      self->_blockSize = [v14 unsignedShortValue];
    }
    else if ([v5 type] == 3436347663)
    {
      id v14 = [v5 valueAsNumber];
      self->_compressionHeaderIndex = [v14 unsignedLongValue];
    }
    else
    {
      if ([v5 type] != 3436347674)
      {
LABEL_24:
        composeTLVs = self->_tlvs;
        goto LABEL_7;
      }
      id v14 = [v5 valueAsNumber];
      self->_allowCompressionHeaders = [v14 BOOLValue];
    }

    goto LABEL_24;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[UARPSuperBinaryAssetPayload addMetaDataTLV:]((uint64_t)self, v7, v8, v9, v10, v11, v12, v13);
  }
LABEL_10:
}

- (void)addMetaDataTLVs:(id)a3
{
  id v10 = +[UARPSuperBinaryAssetTLV decomposeTLVs:a3];
  objc_storeStrong((id *)&self->_tlvs, v10);
  id v4 = +[UARPSuperBinaryAssetTLV findTLVWithType:3436347659 tlvs:self->_tlvs];
  uint64_t v5 = +[UARPSuperBinaryAssetTLV findTLVWithType:3436347660 tlvs:self->_tlvs];
  long long v6 = (void *)v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    uint64_t v8 = [v4 valueAsNumber];
    self->_blockSize = [v8 unsignedIntValue];

    uint64_t v9 = [v6 valueAsNumber];
    self->_compression = [v9 unsignedIntValue];
  }
}

- (BOOL)setPayloadToContentsOfFile:(id)a3 friendlyName:(id)a4 error:(id *)a5
{
  BOOL v7 = NSURL;
  id v8 = a4;
  uint64_t v9 = [a3 stringByExpandingTildeInPath];
  id v10 = [v7 fileURLWithPath:v9];
  LOBYTE(self) = [(UARPSuperBinaryAssetPayload *)self setPayloadToContentsOfURL:v10 friendlyName:v8];

  return (char)self;
}

- (BOOL)setPayloadToContentsOfURL:(id)a3 friendlyName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)&self->_url, a3);
  if (v8)
  {
    uint64_t v9 = (NSString *)[v8 copy];
    friendlyName = self->_friendlyName;
    self->_friendlyName = v9;
  }
  return 1;
}

- (BOOL)setPayloadToData:(id)a3
{
  id v4 = (NSData *)[a3 copy];
  payload = self->_payload;
  self->_payload = v4;

  return 1;
}

- (id)prepareMetaData
{
  os_log_t v3 = (NSMutableData *)objc_alloc_init(MEMORY[0x263EFF990]);
  metaData = self->_metaData;
  self->_metaData = v3;

  if ([(NSMutableArray *)self->_tlvs count])
  {
    unint64_t v5 = 0;
    do
    {
      long long v6 = [(NSMutableArray *)self->_tlvs objectAtIndex:v5];
      id v7 = [v6 generateTLV:0];
      [(NSMutableData *)self->_metaData appendData:v7];

      ++v5;
    }
    while (v5 < [(NSMutableArray *)self->_tlvs count]);
  }
  if (self->_compression)
  {
    if (self->_url)
    {
      uint64_t v8 = [(UARPSuperBinaryAssetPayload *)self unpreparedDataLength];
    }
    else
    {
      payload = self->_payload;
      if (!payload)
      {
        uint64_t v10 = 0;
        goto LABEL_10;
      }
      uint64_t v8 = [(NSData *)payload length];
    }
    uint64_t v10 = v8;
LABEL_10:
    uint64_t v11 = [[UARPSuperBinaryAssetTLV alloc] initWithType:3436347673 unsignedInt32:v10];
    uint64_t v12 = [(UARPSuperBinaryAssetTLV *)v11 generateTLV:0];
    [(NSMutableData *)self->_metaData appendData:v12];
  }
  uint64_t v13 = (void *)MEMORY[0x263EFF8F8];
  id v14 = self->_metaData;
  return (id)[v13 dataWithData:v14];
}

- (id)hashMetaData
{
  return (id)[MEMORY[0x263EFF8F8] dataWithData:self->_metaData];
}

- (id)compressPayloadChunk:(id)a3 offset:(unsigned int)a4 error:(id *)a5
{
  id v5 = a3;
  return v5;
}

- (BOOL)compressPayloadURLToFileHandle:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (NSMutableData *)objc_alloc_init(MEMORY[0x263EFF990]);
  compressionHeaders = self->_compressionHeaders;
  self->_compressionHeaders = v7;

  uint64_t v9 = [MEMORY[0x263F08840] fileHandleForReadingFromURL:self->_url error:a4];
  if (v9)
  {
    uint64_t v10 = 0;
    uint64_t blockSize = self->_blockSize;
    while (1)
    {
      uint64_t v12 = [v9 uarpReadDataUpToLength:blockSize error:a4];
      uint64_t v13 = v12;
      if (!v12 || ![v12 length])
      {

LABEL_9:
        [v9 uarpCloseAndReturnError:a4];
        BOOL v16 = 1;
        goto LABEL_12;
      }
      uint64_t v14 = [v13 length];
      v15 = [(UARPSuperBinaryAssetPayload *)self compressPayloadChunk:v13 offset:v10 error:a4];
      if (([v6 uarpWriteData:v15 error:a4] & 1) == 0) {
        break;
      }
      uint64_t v10 = (v10 + v14);

      uint64_t blockSize = self->_blockSize;
      if (v14 != blockSize) {
        goto LABEL_9;
      }
    }
    [v9 uarpCloseAndReturnError:a4];
  }
  BOOL v16 = 0;
LABEL_12:

  return v16;
}

- (id)prepareData
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  os_log_t v3 = (NSMutableData *)objc_alloc_init(MEMORY[0x263EFF990]);
  compressionHeaders = self->_compressionHeaders;
  self->_compressionHeaders = v3;

  UARPUtilsBuildURLForTemporaryFile();
  id v5 = (NSURL *)objc_claimAutoreleasedReturnValue();
  p_compressedPayloadURL = (id *)&self->_compressedPayloadURL;
  compressedPayloadURL = self->_compressedPayloadURL;
  self->_compressedPayloadURL = v5;

  if (!self->_compressedPayloadURL && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[UARPSuperBinaryAssetPayload prepareData].cold.6();
  }
  uint64_t v38 = 0;
  uint64_t v8 = objc_msgSend(MEMORY[0x263F08840], "fileHandleForWritingToURL:error:");
  id v9 = 0;
  if (v8)
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v10 = self->_tlvs;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v35;
LABEL_7:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v35 != v13) {
          objc_enumerationMutation(v10);
        }
        if ([*(id *)(*((void *)&v34 + 1) + 8 * v14) type] == 3166200583) {
          break;
        }
        if (v12 == ++v14)
        {
          uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v34 objects:v39 count:16];
          if (v12) {
            goto LABEL_7;
          }
          goto LABEL_13;
        }
      }
      v15 = [MEMORY[0x263EFF9A0] dictionaryWithContentsOfURL:self->_url];

      if (!v15) {
        goto LABEL_21;
      }
      id v33 = v9;
      BOOL v16 = [MEMORY[0x263F08910] archivedDataWithRootObject:v15 requiringSecureCoding:0 error:&v33];
      id v17 = v33;

      if (!v16
        || (id v32 = 0,
            char v18 = [v8 uarpWriteData:v16 error:&v32],
            id v19 = v32,
            v17,
            id v17 = v19,
            (v18 & 1) == 0))
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[UARPSuperBinaryAssetPayload prepareData].cold.5();
        }
        id v20 = *p_compressedPayloadURL;
        id *p_compressedPayloadURL = 0;
      }
      goto LABEL_38;
    }
LABEL_13:

LABEL_21:
    if (self->_url)
    {
      id v31 = v9;
      BOOL v21 = [(UARPSuperBinaryAssetPayload *)self compressPayloadURLToFileHandle:v8 error:&v31];
      id v17 = v31;

      if (!v21)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[UARPSuperBinaryAssetPayload prepareData].cold.4();
        }
LABEL_32:
        id v26 = *p_compressedPayloadURL;
        id *p_compressedPayloadURL = 0;
      }
    }
    else
    {
      payload = self->_payload;
      if (!payload)
      {
        metaData = self->_metaData;
        if ((!metaData || ![(NSMutableData *)metaData length])
          && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          -[UARPSuperBinaryAssetPayload prepareData]();
        }
        id v17 = v9;
        goto LABEL_38;
      }
      id v30 = 0;
      char v25 = [v8 uarpWriteData:payload error:&v30];
      id v17 = v30;

      if ((v25 & 1) == 0)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[UARPSuperBinaryAssetPayload prepareData]();
        }
        goto LABEL_32;
      }
    }
LABEL_38:
    id v29 = 0;
    [v8 uarpCloseAndReturnError:&v29];
    id v9 = v29;

    v23 = (void *)[*p_compressedPayloadURL copy];
    goto LABEL_39;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[UARPSuperBinaryAssetPayload prepareData]();
  }
  id v22 = *p_compressedPayloadURL;
  id *p_compressedPayloadURL = 0;

  v23 = 0;
LABEL_39:

  return v23;
}

- (unint64_t)unpreparedDataLength
{
  if (!self->_url) {
    return 0;
  }
  os_log_t v3 = [MEMORY[0x263F08850] defaultManager];
  id v4 = [(NSURL *)self->_url path];
  id v5 = [v3 attributesOfItemAtPath:v4 error:0];

  unint64_t v6 = [v5 fileSize];
  return v6;
}

- (unint64_t)preparedDataLength
{
  if (!self->_compressedPayloadURL) {
    return 0;
  }
  os_log_t v3 = [MEMORY[0x263F08850] defaultManager];
  id v4 = [(NSURL *)self->_compressedPayloadURL path];
  id v5 = [v3 attributesOfItemAtPath:v4 error:0];

  unint64_t v6 = [v5 fileSize];
  return v6;
}

- (unint64_t)preparePackedTag
{
  os_log_t v3 = [(NSString *)self->_tag UTF8String];
  if ([(NSString *)self->_tag length] == 4) {
    return uarpPayloadTagPack((unsigned int *)v3);
  }
  else {
    return 0;
  }
}

- (BOOL)prepareUarpVersion:(UARPVersion *)a3
{
  a3->major = [(UARPAssetVersion *)self->_assetVersion majorVersion];
  a3->minor = [(UARPAssetVersion *)self->_assetVersion minorVersion];
  a3->release = [(UARPAssetVersion *)self->_assetVersion releaseVersion];
  a3->build = [(UARPAssetVersion *)self->_assetVersion buildVersion];
  return 1;
}

- (BOOL)appendPayloadToFile:(id)a3 bytesWritten:(unint64_t *)a4 error:(id *)a5
{
  return 0;
}

- (BOOL)appendCompressedPayloadToFile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [MEMORY[0x263F08840] fileHandleForReadingFromURL:self->_compressedPayloadURL error:a4];
  if (v7)
  {
    uint64_t blockSize = self->_blockSize;
    while (1)
    {
      id v9 = [v7 uarpReadDataUpToLength:blockSize error:a4];
      uint64_t v10 = [v9 length];
      if (([v6 uarpWriteData:v9 error:a4] & 1) == 0) {
        break;
      }

      uint64_t blockSize = self->_blockSize;
      if (v10 != blockSize)
      {
        [v7 uarpCloseAndReturnError:a4];
        BOOL v11 = 1;
        goto LABEL_12;
      }
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[UARPSuperBinaryAssetPayload appendCompressedPayloadToFile:error:]();
    }
    [v7 uarpCloseAndReturnError:a4];
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[UARPSuperBinaryAssetPayload appendCompressedPayloadToFile:error:]();
  }
  BOOL v11 = 0;
LABEL_12:

  return v11;
}

- (id)hashPayloadWithAlgorithm:(int)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  if (self->_url)
  {
    uint64_t v5 = *(void *)&a3;
    uint64_t v35 = 0;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    memset(&c, 0, sizeof(c));
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    if (a3 == 1)
    {
      p_CC_SHA512_CTX c = (CC_SHA512_CTX *)&v29;
      uint64_t v9 = 32;
    }
    else if (a3 == 3)
    {
      p_CC_SHA512_CTX c = (CC_SHA512_CTX *)&v15;
      uint64_t v9 = 64;
    }
    else
    {
      id v7 = 0;
      if (a3 != 2) {
        goto LABEL_15;
      }
      p_CC_SHA512_CTX c = &c;
      uint64_t v9 = 48;
    }
    uarpPlatformDarwinHashInit(*(uint64_t *)&a3, p_c);
    objc_msgSend(MEMORY[0x263F08840], "fileHandleForReadingFromURL:error:", self->_url, a4, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, c.count[0], c.count[1],
      c.hash[0],
      c.hash[1],
      c.hash[2],
      c.hash[3],
      c.hash[4],
      c.hash[5],
      c.hash[6],
      c.hash[7],
      c.wbuf[0],
      c.wbuf[1],
      c.wbuf[2],
      c.wbuf[3],
      c.wbuf[4],
      c.wbuf[5],
      c.wbuf[6],
      c.wbuf[7],
      c.wbuf[8],
      c.wbuf[9],
      c.wbuf[10],
      c.wbuf[11],
      c.wbuf[12],
      c.wbuf[13],
      c.wbuf[14],
      c.wbuf[15],
      v29,
      v30,
      v31,
    id v7 = (void)v32);
    if (v7)
    {
      uint64_t v10 = v7;
      while (1)
      {
        BOOL v11 = [v10 uarpReadDataUpToLength:self->_blockSize error:0];
        if (!v11)
        {

          goto LABEL_14;
        }
        id v12 = v11;
        uarpPlatformDarwinHashUpdate(v5, p_c, (void *)[v12 bytes], objc_msgSend(v12, "length"));
        unint64_t blockSize = self->_blockSize;
        if ([v12 length] < blockSize) {
          break;
        }
      }
      [v10 uarpCloseAndReturnError:a4];

      uarpPlatformDarwinHashFinal(v5, p_c, md, v9);
      id v7 = [MEMORY[0x263EFF8F8] dataWithBytes:md length:v9];
    }
  }
  else
  {
LABEL_14:
    id v7 = 0;
  }
LABEL_15:
  return v7;
}

- (id)hashMetaDataWithAlgorithm:(int)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  if (self->_url)
  {
    uint64_t v4 = *(void *)&a3;
    uint64_t v30 = 0;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    memset(&c, 0, sizeof(c));
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    if (a3 == 1)
    {
      p_CC_SHA512_CTX c = (CC_SHA512_CTX *)&v24;
      uint64_t v8 = 32;
    }
    else if (a3 == 3)
    {
      p_CC_SHA512_CTX c = (CC_SHA512_CTX *)&v10;
      uint64_t v8 = 64;
    }
    else
    {
      id v6 = 0;
      if (a3 != 2) {
        goto LABEL_10;
      }
      p_CC_SHA512_CTX c = &c;
      uint64_t v8 = 48;
    }
    uarpPlatformDarwinHashInit(*(uint64_t *)&a3, p_c);
    uarpPlatformDarwinHashUpdate(v4, p_c, (void *)-[NSMutableData bytes](self->_metaData, "bytes", v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, c.count[0],
                c.count[1],
                c.hash[0],
                c.hash[1],
                c.hash[2],
                c.hash[3],
                c.hash[4],
                c.hash[5],
                c.hash[6],
                c.hash[7],
                c.wbuf[0],
                c.wbuf[1],
                c.wbuf[2],
                c.wbuf[3],
                c.wbuf[4],
                c.wbuf[5],
                c.wbuf[6],
                c.wbuf[7],
                c.wbuf[8],
                c.wbuf[9],
                c.wbuf[10],
                c.wbuf[11],
                c.wbuf[12],
                c.wbuf[13],
                c.wbuf[14],
                c.wbuf[15],
                v24,
                v25,
                v26,
                v27,
                (void)v28),
      [(NSMutableData *)self->_metaData length]);
    uarpPlatformDarwinHashFinal(v4, p_c, md, v8);
    id v6 = [MEMORY[0x263EFF8F8] dataWithBytes:md length:v8];
  }
  else
  {
    id v6 = 0;
  }
LABEL_10:
  return v6;
}

- (void)processVersionString:(id)a3
{
  uint64_t v4 = NSString;
  uint64_t v5 = [a3 valueAsURL];
  id v8 = [v4 stringWithContentsOfURL:v5 encoding:4 error:0];

  id v6 = [[UARPAssetVersion alloc] initWithVersionString:v8];
  assetVersion = self->_assetVersion;
  self->_assetVersion = v6;
}

- (void)processBVERVersionString:(id)a3
{
  uint64_t v4 = NSString;
  uint64_t v5 = [a3 valueAsURL];
  id v8 = [v4 stringWithContentsOfURL:v5 encoding:4 error:0];

  id v6 = [[UARPAssetVersion alloc] initWithBVERString:v8];
  assetVersion = self->_assetVersion;
  self->_assetVersion = v6;
}

- (UARPSuperBinaryAssetPayload)initWithDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UARPSuperBinaryAssetPayload *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    dict = v5->_dict;
    v5->_dict = (NSDictionary *)v6;
  }
  return v5;
}

- (BOOL)expandDictionaryWithPayloadsFolder:(id)a3 metaDataTable:(id)a4 error:(id *)a5
{
  id v8 = a3;
  dict = self->_dict;
  id v10 = a4;
  long long v11 = [(NSDictionary *)dict objectForKey:@"Payload 4CC"];
  long long v12 = (NSString *)[v11 copy];
  tag = self->_tag;
  self->_tag = v12;

  long long v14 = [(NSDictionary *)self->_dict objectForKey:@"Payload Filepath"];
  long long v15 = (void *)[v14 copy];

  if (v15)
  {
    long long v16 = [NSURL fileURLWithPath:v15 relativeToURL:v8];
    url = self->_url;
    self->_url = v16;
  }
  uint64_t v18 = [(NSDictionary *)self->_dict objectForKey:@"Payload Long Name"];
  long long v19 = (NSString *)[(id)v18 copy];
  friendlyName = self->_friendlyName;
  self->_friendlyName = v19;

  LOBYTE(v18) = [(UARPSuperBinaryAssetPayload *)self parseFromPlistPayloadMetaDataTLVs:v10 payloadsURL:v8 error:a5];
  if ((v18 & 1) == 0)
  {
    long long v22 = [NSString stringWithFormat:@"Failed to parse superbinary payload metadata tlvs"];
    long long v23 = objc_opt_new();
    [v23 setObject:v22 forKeyedSubscript:*MEMORY[0x263F08320]];
    long long v24 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"com.apple.uarp" code:5 userInfo:v23];
    long long v25 = v24;
    if (a5) {
      *a5 = v24;
    }
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
LABEL_10:
    -[UARPSuperBinaryAssetPayload expandDictionaryWithPayloadsFolder:metaDataTable:error:]((uint64_t)v22, v26, v27, v28, v29, v30, v31, v32);
LABEL_11:

    BOOL v21 = 0;
    goto LABEL_12;
  }
  if (!self->_assetVersion
    && ![(UARPSuperBinaryAssetPayload *)self parseFromPlistVersion:a5])
  {
    long long v22 = [NSString stringWithFormat:@"Failed to parse superbinary payload version"];
    long long v23 = objc_opt_new();
    [v23 setObject:v22 forKeyedSubscript:*MEMORY[0x263F08320]];
    long long v34 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"com.apple.uarp" code:5 userInfo:v23];
    long long v25 = v34;
    if (a5) {
      *a5 = v34;
    }
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  BOOL v21 = 1;
LABEL_12:

  return v21;
}

- (BOOL)parseFromPlistVersion:(id *)a3
{
  UARPVersion v9 = (UARPVersion)0;
  id v4 = [(NSDictionary *)self->_dict objectForKeyedSubscript:@"Payload Version"];
  if (v4
    && +[UARPSuperBinaryAsset versionFromString:v4 version:&v9])
  {
    self->_uarpVersion = v9;
    uint64_t v5 = [[UARPAssetVersion alloc] initWithMajorVersion:self->_uarpVersion.major minorVersion:self->_uarpVersion.minor releaseVersion:self->_uarpVersion.release buildVersion:self->_uarpVersion.build];
    assetVersion = self->_assetVersion;
    self->_assetVersion = v5;

    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)parseFromPlistPayloadMetaDataTLVs:(id)a3 payloadsURL:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x3032000000;
  long long v22 = __Block_byref_object_copy__1;
  long long v23 = __Block_byref_object_dispose__1;
  id v24 = 0;
  id v10 = [(NSDictionary *)self->_dict objectForKeyedSubscript:@"Payload MetaData"];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __83__UARPSuperBinaryAssetPayload_parseFromPlistPayloadMetaDataTLVs_payloadsURL_error___block_invoke;
  v14[3] = &unk_2644927F8;
  id v11 = v8;
  id v15 = v11;
  id v12 = v9;
  long long v17 = self;
  uint64_t v18 = &v19;
  id v16 = v12;
  [v10 enumerateKeysAndObjectsUsingBlock:v14];
  *a5 = (id) v20[5];

  _Block_object_dispose(&v19, 8);
  return 1;
}

void __83__UARPSuperBinaryAssetPayload_parseFromPlistPayloadMetaDataTLVs_payloadsURL_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = (id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  id obj = 0;
  BOOL v7 = [v4 tlvArrayWithKey:a2 keyValue:a3 payloadsURL:v5 error:&obj];
  objc_storeStrong(v6, obj);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(a1 + 48), "addMetaDataTLV:", *(void *)(*((void *)&v13 + 1) + 8 * v12++), (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v10);
  }
}

- (BOOL)expandPayloadToURL:(id)a3 superbinary:(id)a4 offset:(unint64_t)a5 length:(unint64_t)a6 error:(id *)a7
{
  return [(UARPSuperBinaryAssetPayload *)self expandPayloadToURL:a3 payloadFilename:0 superbinary:a4 offset:a5 length:a6 error:a7];
}

- (BOOL)expandPayloadToURL:(id)a3 payloadFilename:(id)a4 superbinary:(id)a5 offset:(unint64_t)a6 length:(unint64_t)a7 error:(id *)a8
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v14 = a3;
  long long v15 = (NSString *)a4;
  id v16 = a5;
  id v17 = objc_alloc(NSURL);
  if (v15) {
    tag = v15;
  }
  else {
    tag = self->_tag;
  }
  uint64_t v19 = (void *)[v17 initFileURLWithPath:tag relativeToURL:v14];
  long long v20 = [v19 URLByDeletingLastPathComponent];
  if (v20
    && (unint64_t v62 = a6,
        unint64_t v63 = a7,
        [MEMORY[0x263F08850] defaultManager],
        uint64_t v21 = objc_claimAutoreleasedReturnValue(),
        int v22 = [v21 createDirectoryAtURL:v20 withIntermediateDirectories:1 attributes:0 error:a8],
        v21,
        v22)
    && [v16 uarpSeekToOffset:v62 error:a8])
  {
    v60 = v16;
    v61 = self;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v23 = self->_tlvs;
    uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v64 objects:v74 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v65;
      while (2)
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v65 != v26) {
            objc_enumerationMutation(v23);
          }
          if ([*(id *)(*((void *)&v64 + 1) + 8 * i) type] == 3166200583)
          {

            id v16 = v60;
            uint64_t v30 = [v60 uarpReadDataUpToLength:v63 error:0];
            v46 = (void *)MEMORY[0x263EFFA08];
            uint64_t v47 = objc_opt_class();
            uint64_t v48 = objc_opt_class();
            uint64_t v49 = objc_opt_class();
            long long v34 = objc_msgSend(v46, "setWithObjects:", v47, v48, v49, objc_opt_class(), 0);
            v50 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v34 fromData:v30 error:0];
            [v50 writeToURL:v19 error:0];

            BOOL v52 = 1;
            goto LABEL_36;
          }
        }
        uint64_t v25 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v64 objects:v74 count:16];
        if (v25) {
          continue;
        }
        break;
      }
    }

    uint64_t v28 = NSString;
    id v29 = v19;
    uint64_t v30 = objc_msgSend(v28, "stringWithUTF8String:", objc_msgSend(v29, "fileSystemRepresentation"));
    uint64_t v31 = [MEMORY[0x263F08850] defaultManager];
    char v32 = [v31 createFileAtPath:v30 contents:0 attributes:0];

    if (v32)
    {
      uint64_t v33 = [MEMORY[0x263F08840] fileHandleForWritingToURL:v29 error:a8];
      long long v34 = (void *)v33;
      if (v33)
      {
        v58 = (void *)v33;
        log = self->_log;
        id v16 = v60;
        if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          unint64_t v69 = v63;
          _os_log_impl(&dword_21E079000, log, OS_LOG_TYPE_INFO, "Decomposing Payload of length <%lu>", buf, 0xCu);
        }
        v57 = v30;
        unint64_t v36 = v63;
        if (v63)
        {
          unint64_t v37 = 0;
          unint64_t v59 = 0;
          int v38 = 0;
          while (1)
          {
            if (v36 - v37 >= 0x1000) {
              uint64_t v39 = 4096;
            }
            else {
              uint64_t v39 = v36 - v37;
            }
            uint64_t v40 = [v60 uarpReadDataUpToLength:v39 error:a8];
            v41 = v40;
            if (!v40 || ![v40 length])
            {
              v42 = v61->_log;
              if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218496;
                unint64_t v69 = v63;
                __int16 v70 = 2048;
                unint64_t v71 = v62;
                __int16 v72 = 2048;
                unint64_t v73 = v37;
                _os_log_error_impl(&dword_21E079000, v42, OS_LOG_TYPE_ERROR, "Could not read payload data; payload length is <%lu>, Payload Offset is <%lu>, Bytes Read is <%lu>",
                  buf,
                  0x20u);
              }
            }
            v38 += v39;
            unsigned int v43 = [v41 length];
            if (([v58 uarpWriteData:v41 error:a8] & 1) == 0) {
              break;
            }
            v59 += [v41 length];
            v44 = v61->_log;
            if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134217984;
              unint64_t v69 = v59;
              _os_log_impl(&dword_21E079000, v44, OS_LOG_TYPE_INFO, "Bytes Written <%lu>", buf, 0xCu);
            }
            v37 += v43;

            unint64_t v36 = v63;
            if (v37 >= v63)
            {
              BOOL v52 = 1;
              goto LABEL_44;
            }
          }
          v51 = v61->_log;
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
            -[UARPSuperBinaryAssetPayload expandPayloadToURL:payloadFilename:superbinary:offset:length:error:](v51);
          }

          BOOL v52 = 0;
LABEL_44:
          id v16 = v60;
        }
        else
        {
          int v38 = 0;
          BOOL v52 = 1;
        }
        [v58 uarpCloseAndReturnError:0];
        v53 = v61->_log;
        if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v69) = 0;
          _os_log_impl(&dword_21E079000, v53, OS_LOG_TYPE_INFO, "Total Headers <%u>\n", buf, 8u);
        }
        v54 = v61->_log;
        if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v69) = 0;
          _os_log_impl(&dword_21E079000, v54, OS_LOG_TYPE_INFO, "Total Header Bytes <%u>\n", buf, 8u);
        }
        v55 = v61->_log;
        if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v69) = 0;
          _os_log_impl(&dword_21E079000, v55, OS_LOG_TYPE_INFO, "Total Compressed Bytes <%u>\n", buf, 8u);
        }
        v56 = v61->_log;
        if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v69) = v38;
          _os_log_impl(&dword_21E079000, v56, OS_LOG_TYPE_INFO, "Total Uncompressed Bytes <%u>\n", buf, 8u);
        }
        uint64_t v30 = v57;
        long long v34 = v58;
      }
      else
      {
        BOOL v52 = 0;
        id v16 = v60;
      }
LABEL_36:
    }
    else
    {
      BOOL v52 = 0;
      id v16 = v60;
    }
  }
  else
  {
    BOOL v52 = 0;
  }

  return v52;
}

- (id)description
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  [v3 appendFormat:@"--------------\n"];
  [v3 appendFormat:@"Payload Header\n"];
  [v3 appendFormat:@"---------------\n"];
  objc_msgSend(v3, "appendFormat:", @"Header Length   - %u\n", self->_payloadHeader.payloadHeaderLength);
  [v3 appendFormat:@"Tag             - "];
  uarpPayloadTagUnpack(self->_payloadHeader.payloadTag, v31);
  objc_msgSend(v3, "appendFormat:", @"%c%c%c%c\n", v31[0], v31[1], v31[2], v31[3]);
  [v3 appendFormat:@"Version         - <"];
  objc_msgSend(v3, "appendFormat:", @"%u.", self->_payloadHeader.payloadVersion.major);
  objc_msgSend(v3, "appendFormat:", @"%u.", self->_payloadHeader.payloadVersion.minor);
  objc_msgSend(v3, "appendFormat:", @"%u.", self->_payloadHeader.payloadVersion.release);
  objc_msgSend(v3, "appendFormat:", @"%u", self->_payloadHeader.payloadVersion.build);
  [v3 appendFormat:@">\n"];
  objc_msgSend(v3, "appendFormat:", @"MetaData Offset - %u\n", self->_payloadHeader.payloadMetadataOffset);
  objc_msgSend(v3, "appendFormat:", @"MetaData Length - %u\n", self->_payloadHeader.payloadMetadataLength);
  objc_msgSend(v3, "appendFormat:", @"Payload Offset  - %u\n", self->_payloadHeader.payloadOffset);
  objc_msgSend(v3, "appendFormat:", @"Payload Length  - %u\n", self->_payloadHeader.payloadLength);
  [v3 appendFormat:@"\n"];
  [v3 appendFormat:@"---------------------\n"];
  [v3 appendFormat:@"Payload MetaData TLVs\n"];
  [v3 appendFormat:@"---------------------\n"];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = self->_tlvs;
  uint64_t v22 = [(NSMutableArray *)obj countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v22)
  {
    uint64_t v21 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        [v3 appendFormat:@"%@\n", v5];
        if ([v5 type] == 3436347667)
        {
          id v6 = [v5 valueAsData];
          BOOL v7 = (unsigned __int16 *)[v6 bytes];
          unint64_t v8 = [v6 length];
          [v3 appendFormat:@"<Compression Header>\n"];
          if (v8 >= 0xA)
          {
            do
            {
              unsigned int v9 = uarpHtons(*v7);
              uint64_t v10 = uarpHtonl(*(_DWORD *)(v7 + 1));
              unsigned int v11 = uarpHtons(v7[3]);
              [v3 appendFormat:@"    Algorithm <%u>, Actual Offset <%u>, Compressed Length <%u>, Uncompressed Length <%u>\n", v9, v10, v11, uarpHtons(v7[4])];
              v8 -= 10;
              v7 += 5;
            }
            while (v8 > 9);
          }
          [v3 appendFormat:@"</Compression Header>\n"];
        }
        if ([v5 type] == 2293403920 || objc_msgSend(v5, "type") == 2293403932)
        {
          uint64_t v12 = [v5 valueAsData];
          long long v13 = +[UARPSuperBinaryAssetTLV decomposeTLVs:v12];
          [v3 appendFormat:@"<Nested TLVs>\n"];
          long long v25 = 0u;
          long long v26 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          id v14 = v13;
          uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v32 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v24;
            do
            {
              for (uint64_t j = 0; j != v16; ++j)
              {
                if (*(void *)v24 != v17) {
                  objc_enumerationMutation(v14);
                }
                [v3 appendFormat:@"    %@\n", *(void *)(*((void *)&v23 + 1) + 8 * j)];
              }
              uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v32 count:16];
            }
            while (v16);
          }

          [v3 appendFormat:@"</Nested TLVs>\n"];
        }
      }
      uint64_t v22 = [(NSMutableArray *)obj countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v22);
  }

  return v3;
}

- (_NSRange)rangeMetadata
{
  NSUInteger payloadMetadataLength = self->_payloadHeader.payloadMetadataLength;
  NSUInteger payloadMetadataOffset = self->_payloadHeader.payloadMetadataOffset;
  result.length = payloadMetadataLength;
  result.location = payloadMetadataOffset;
  return result;
}

- (_NSRange)rangePayload
{
  NSUInteger payloadLength = self->_payloadHeader.payloadLength;
  NSUInteger payloadOffset = self->_payloadHeader.payloadOffset;
  result.length = payloadLength;
  result.location = payloadOffset;
  return result;
}

- (void)setSuperBinaryURL:(id)a3
{
}

- (BOOL)needsCompression
{
  return self->_compression != 0;
}

- (BOOL)allowCompressionHeaders
{
  return self->_allowCompressionHeaders;
}

- (NSData)compressionHeaders
{
  return (NSData *)[MEMORY[0x263EFF8F8] dataWithData:self->_compressionHeaders];
}

- (unint64_t)compressionHeaderIndex
{
  return self->_compressionHeaderIndex;
}

- (BOOL)writePayloadData:(id)a3 offset:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  if (self->_isWritable && (url = self->_url) != 0)
  {
    uint64_t v10 = [MEMORY[0x263F08840] fileHandleForUpdatingURL:url error:a5];
    if ([v10 uarpSeekToOffset:a4 error:a5]
      && [v10 uarpWriteData:v8 error:a5])
    {
      char v11 = [v10 uarpCloseAndReturnError:a5];
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (BOOL)isValid
{
  if (self->_url)
  {
    id v3 = [MEMORY[0x263F08850] defaultManager];
    id v4 = [(NSURL *)self->_url path];
    char v5 = [v3 fileExistsAtPath:v4];

    return v5;
  }
  payload = self->_payload;
  if (payload)
  {
    BOOL v8 = [(NSData *)payload length] == 0;
  }
  else
  {
    if (self->_tlvs) {
      return 1;
    }
    BOOL v8 = self->_composeTLVs == 0;
  }
  return !v8;
}

- (NSData)payload
{
  return (NSData *)objc_getProperty(self, a2, 192, 1);
}

- (unint64_t)formatVersion
{
  return self->_formatVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_compressedPayloadURL, 0);
  objc_storeStrong((id *)&self->_metaData, 0);
  objc_storeStrong((id *)&self->_compressionHeaders, 0);
  objc_storeStrong((id *)&self->_dict, 0);
  objc_storeStrong((id *)&self->_friendlyName, 0);
  objc_storeStrong((id *)&self->_superBinaryURL, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_composeTLVs, 0);
  objc_storeStrong((id *)&self->_tlvs, 0);
  objc_storeStrong((id *)&self->_assetVersion, 0);
  objc_storeStrong((id *)&self->_payloadTag, 0);
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)addMetaDataTLV:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)prepareData
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_21E079000, &_os_log_internal, OS_LOG_TYPE_ERROR, "UARPUtilsBuildURLForTemporaryFile() returned nil", v0, 2u);
}

- (void)appendCompressedPayloadToFile:error:.cold.1()
{
  OUTLINED_FUNCTION_2_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_21E079000, &_os_log_internal, v0, "Could not open file handle for reading %@", v1, v2, v3, v4, v5);
}

- (void)appendCompressedPayloadToFile:error:.cold.2()
{
  OUTLINED_FUNCTION_2_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_21E079000, &_os_log_internal, v0, "Could not write data to %@", v1, v2, v3, v4, v5);
}

- (void)expandDictionaryWithPayloadsFolder:(uint64_t)a3 metaDataTable:(uint64_t)a4 error:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)expandPayloadToURL:(os_log_t)log payloadFilename:superbinary:offset:length:error:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21E079000, log, OS_LOG_TYPE_ERROR, "Error writing decomposed payload", v1, 2u);
}

@end