@interface ENExposureDetectionHistoryFile
- (ENExposureDetectionHistoryFile)initWithXPCObject:(id)a3 error:(id *)a4;
- (ENRegion)sourceRegion;
- (NSData)fileHash;
- (NSDate)processDate;
- (NSDictionary)metadata;
- (NSNumber)keyCount;
- (NSNumber)matchCount;
- (NSString)sourceAppBundleIdentifier;
- (id)description;
- (void)encodeWithXPCObject:(id)a3;
- (void)setFileHash:(id)a3;
- (void)setKeyCount:(id)a3;
- (void)setMatchCount:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setProcessDate:(id)a3;
- (void)setSourceAppBundleIdentifier:(id)a3;
- (void)setSourceRegion:(id)a3;
@end

@implementation ENExposureDetectionHistoryFile

- (ENExposureDetectionHistoryFile)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ENExposureDetectionHistoryFile;
  v7 = [(ENExposureDetectionHistoryFile *)&v24 init];
  if (!v7)
  {
    if (a4)
    {
      ENErrorF(2);
      v22 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
LABEL_15:
    v22 = 0;
    goto LABEL_12;
  }
  if (!CUXPCDecodeNSData()) {
    goto LABEL_15;
  }
  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF910]), "initWithTimeIntervalSinceReferenceDate:", xpc_dictionary_get_double(v6, "date"));
  processDate = v7->_processDate;
  v7->_processDate = (NSDate *)v8;

  uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", xpc_dictionary_get_uint64(v6, "keyCt"));
  keyCount = v7->_keyCount;
  v7->_keyCount = (NSNumber *)v10;

  v12 = xpc_dictionary_get_value(v6, "mtKC");

  if (v12)
  {
    uint64_t v13 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", xpc_dictionary_get_uint64(v6, "mtKC"));
    matchCount = v7->_matchCount;
    v7->_matchCount = (NSNumber *)v13;
  }
  uint64_t v15 = xpc_dictionary_get_value(v6, "meta");
  v16 = (void *)v15;
  if (v15)
  {
    if (MEMORY[0x2166BCD00](v15) != MEMORY[0x263EF8708])
    {
      if (a4)
      {
        ENErrorF(2);
        v22 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
LABEL_21:
      v22 = 0;
      goto LABEL_11;
    }
    v17 = (NSDictionary *)_CFXPCCreateCFObjectFromXPCObject();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        ENErrorF(2);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_21;
    }
    metadata = v7->_metadata;
    v7->_metadata = v17;
  }
  if (!CUXPCDecodeNSString()) {
    goto LABEL_21;
  }
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = ENXPCDecodeSecureObjectIfPresent(v6, "regionData", v19, a4);
  sourceRegion = v7->_sourceRegion;
  v7->_sourceRegion = (ENRegion *)v20;

  v22 = v7;
LABEL_11:

LABEL_12:
  return v22;
}

- (void)encodeWithXPCObject:(id)a3
{
  id v4 = a3;
  fileHash = self->_fileHash;
  if (fileHash)
  {
    id v6 = fileHash;
    uint64_t v7 = [(NSData *)v6 bytes];
    if (v7) {
      uint64_t v8 = (const char *)v7;
    }
    else {
      uint64_t v8 = "";
    }
    size_t v9 = [(NSData *)v6 length];

    xpc_dictionary_set_data(v4, "fileHash", v8, v9);
  }
  [(NSDate *)self->_processDate timeIntervalSinceReferenceDate];
  xpc_dictionary_set_double(v4, "date", v10);
  xpc_dictionary_set_uint64(v4, "keyCt", [(NSNumber *)self->_keyCount unsignedLongLongValue]);
  matchCount = self->_matchCount;
  if (matchCount) {
    xpc_dictionary_set_uint64(v4, "mtKC", [(NSNumber *)matchCount unsignedLongLongValue]);
  }
  if (self->_metadata)
  {
    v12 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    xpc_dictionary_set_value(v4, "meta", v12);
  }
  sourceAppBundleIdentifier = self->_sourceAppBundleIdentifier;
  xpc_object_t xdict = v4;
  v14 = [(NSString *)sourceAppBundleIdentifier UTF8String];
  if (v14) {
    xpc_dictionary_set_string(xdict, "aBid", v14);
  }

  sourceRegion = self->_sourceRegion;
  if (sourceRegion) {
    ENXPCEncodeSecureObject(xdict, "regionData", sourceRegion, 0);
  }
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  uint64_t v13 = NSStringFromClass(v3);
  NSAppendPrintF_safe();
  id v4 = 0;

  [(NSData *)self->_fileHash bytes];
  [(NSData *)self->_fileHash length];
  [(NSData *)self->_fileHash length];
  NSAppendPrintF();
  id v5 = v4;

  if (self->_sourceAppBundleIdentifier)
  {
    NSAppendPrintF_safe();
    id v6 = v5;

    id v5 = v6;
  }
  if (self->_sourceRegion)
  {
    NSAppendPrintF_safe();
    id v7 = v5;

    id v5 = v7;
  }
  NSAppendPrintF_safe();
  id v8 = v5;

  NSAppendPrintF_safe();
  id v9 = v8;

  if (self->_matchCount)
  {
    NSAppendPrintF_safe();
    id v10 = v9;

    id v9 = v10;
  }
  if (self->_metadata)
  {
    NSAppendPrintF();
    id v11 = v9;

    id v9 = v11;
  }

  return v9;
}

- (NSData)fileHash
{
  return self->_fileHash;
}

- (void)setFileHash:(id)a3
{
}

- (NSDate)processDate
{
  return self->_processDate;
}

- (void)setProcessDate:(id)a3
{
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (NSNumber)keyCount
{
  return self->_keyCount;
}

- (void)setKeyCount:(id)a3
{
}

- (NSNumber)matchCount
{
  return self->_matchCount;
}

- (void)setMatchCount:(id)a3
{
}

- (NSString)sourceAppBundleIdentifier
{
  return self->_sourceAppBundleIdentifier;
}

- (void)setSourceAppBundleIdentifier:(id)a3
{
}

- (ENRegion)sourceRegion
{
  return self->_sourceRegion;
}

- (void)setSourceRegion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceRegion, 0);
  objc_storeStrong((id *)&self->_sourceAppBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_matchCount, 0);
  objc_storeStrong((id *)&self->_keyCount, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_processDate, 0);

  objc_storeStrong((id *)&self->_fileHash, 0);
}

@end