@interface ENExposureDetectionHistorySession
- (ENExposureDetectionHistorySession)init;
- (ENExposureDetectionHistorySession)initWithUUID:(id)a3;
- (ENExposureDetectionHistorySession)initWithXPCObject:(id)a3 error:(id *)a4;
- (ENRegion)region;
- (NSDate)date;
- (NSString)appBundleIdentifier;
- (NSString)exposureClassificationIdentifier;
- (NSString)systemBuildVersion;
- (NSUUID)UUID;
- (id)description;
- (unint64_t)fileCount;
- (unint64_t)matchCount;
- (void)encodeWithXPCObject:(id)a3;
- (void)setAppBundleIdentifier:(id)a3;
- (void)setDate:(id)a3;
- (void)setExposureClassificationIdentifier:(id)a3;
- (void)setFileCount:(unint64_t)a3;
- (void)setMatchCount:(unint64_t)a3;
- (void)setRegion:(id)a3;
- (void)setSystemBuildVersion:(id)a3;
- (void)setUUID:(id)a3;
@end

@implementation ENExposureDetectionHistorySession

- (ENExposureDetectionHistorySession)init
{
  v3 = [MEMORY[0x263F08C38] UUID];
  v4 = [(ENExposureDetectionHistorySession *)self initWithUUID:v3];

  return v4;
}

- (ENExposureDetectionHistorySession)initWithUUID:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ENExposureDetectionHistorySession;
  v5 = [(ENExposureDetectionHistorySession *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v6;

    v8 = v5;
  }

  return v5;
}

- (ENExposureDetectionHistorySession)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!CUXPCDecodeNSUUID()) {
    goto LABEL_14;
  }
  v7 = [(ENExposureDetectionHistorySession *)self initWithUUID:0];
  if (!v7)
  {
    if (a4)
    {
      ENErrorF(2);
      self = 0;
      v14 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    self = 0;
    goto LABEL_14;
  }
  self = v7;
  if (!CUXPCDecodeNSString()) {
    goto LABEL_14;
  }
  v8 = (NSDate *)objc_msgSend(objc_alloc(MEMORY[0x263EFF910]), "initWithTimeIntervalSinceReferenceDate:", xpc_dictionary_get_double(v6, "date"));
  date = self->_date;
  self->_date = v8;

  if (!CUXPCDecodeNSString()) {
    goto LABEL_14;
  }
  int v10 = CUXPCDecodeUInt64RangedEx();
  if (v10 == 6)
  {
    self->_fileCount = 0;
    goto LABEL_8;
  }
  if (v10 == 5)
  {
LABEL_14:
    v14 = 0;
    goto LABEL_10;
  }
LABEL_8:
  self->_matchCount = xpc_dictionary_get_uint64(v6, "mtKC");
  uint64_t v11 = objc_opt_class();
  ENXPCDecodeSecureObjectIfPresent(v6, "regionData", v11, a4);
  v12 = (ENRegion *)objc_claimAutoreleasedReturnValue();
  region = self->_region;
  self->_region = v12;

  if (!CUXPCDecodeNSString()) {
    goto LABEL_14;
  }
  self = self;
  v14 = self;
LABEL_10:

  return v14;
}

- (void)encodeWithXPCObject:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(NSString *)self->_appBundleIdentifier UTF8String];
  if (v5) {
    xpc_dictionary_set_string(v4, "aBid", v5);
  }
  [(NSDate *)self->_date timeIntervalSinceReferenceDate];
  xpc_dictionary_set_double(v4, "date", v6);
  exposureClassificationIdentifier = self->_exposureClassificationIdentifier;
  id v8 = v4;
  v9 = [(NSString *)exposureClassificationIdentifier UTF8String];
  if (v9) {
    xpc_dictionary_set_string(v8, "expCID", v9);
  }

  uint64_t fileCount = self->_fileCount;
  if (fileCount) {
    xpc_dictionary_set_uint64(v8, "fileCt", fileCount);
  }
  xpc_dictionary_set_uint64(v8, "mtKC", self->_matchCount);
  region = self->_region;
  if (region) {
    ENXPCEncodeSecureObject(v8, "regionData", region, 0);
  }
  systemBuildVersion = self->_systemBuildVersion;
  id v13 = v8;
  v14 = [(NSString *)systemBuildVersion UTF8String];
  if (v14) {
    xpc_dictionary_set_string(v13, "sysBV", v14);
  }

  v15 = self->_UUID;
  if (v15)
  {
    *(void *)uuid = 0;
    uint64_t v18 = 0;
    id v16 = v13;
    [(NSUUID *)v15 getUUIDBytes:uuid];
    xpc_dictionary_set_uuid(v16, "sessID", uuid);
  }
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  id v13 = NSStringFromClass(v3);
  NSAppendPrintF_safe();
  id v4 = 0;

  if (self->_appBundleIdentifier)
  {
    NSAppendPrintF_safe();
    id v5 = v4;

    id v4 = v5;
  }
  if (self->_region)
  {
    NSAppendPrintF_safe();
    id v6 = v4;

    id v4 = v6;
  }
  NSAppendPrintF_safe();
  id v7 = v4;

  NSAppendPrintF_safe();
  id v8 = v7;

  NSAppendPrintF_safe();
  id v9 = v8;

  NSAppendPrintF_safe();
  id v10 = v9;

  if (self->_exposureClassificationIdentifier)
  {
    NSAppendPrintF_safe();
    id v11 = v10;

    id v10 = v11;
  }

  return v10;
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (void)setAppBundleIdentifier:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (NSString)exposureClassificationIdentifier
{
  return self->_exposureClassificationIdentifier;
}

- (void)setExposureClassificationIdentifier:(id)a3
{
}

- (unint64_t)fileCount
{
  return self->_fileCount;
}

- (void)setFileCount:(unint64_t)a3
{
  self->_uint64_t fileCount = a3;
}

- (unint64_t)matchCount
{
  return self->_matchCount;
}

- (void)setMatchCount:(unint64_t)a3
{
  self->_matchCount = a3;
}

- (ENRegion)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
}

- (NSString)systemBuildVersion
{
  return self->_systemBuildVersion;
}

- (void)setSystemBuildVersion:(id)a3
{
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_systemBuildVersion, 0);
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_exposureClassificationIdentifier, 0);
  objc_storeStrong((id *)&self->_date, 0);

  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
}

@end