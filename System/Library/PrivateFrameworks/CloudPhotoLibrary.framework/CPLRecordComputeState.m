@interface CPLRecordComputeState
+ (BOOL)supportsSecureCoding;
- (CPLRecordComputeState)initWithCoder:(id)a3;
- (CPLRecordComputeState)initWithItemScopedIdentifier:(id)a3 fileStorageIdentifier:(id)a4 version:(id)a5 fileURL:(id)a6 adjustmentFingerprint:(id)a7 lastUpdatedDate:(id)a8;
- (CPLRecordComputeState)initWithItemScopedIdentifier:(id)a3 version:(id)a4 fileURL:(id)a5 adjustmentFingerprint:(id)a6 lastUpdatedDate:(id)a7;
- (CPLScopedIdentifier)itemScopedIdentifier;
- (NSDate)lastUpdatedDate;
- (NSString)adjustmentFingerprint;
- (NSString)fileStorageIdentifier;
- (NSString)version;
- (NSURL)fileURL;
- (id)copyAddingFileURL:(id)a3;
- (id)description;
- (id)redactedDescription;
- (void)encodeWithCoder:(id)a3;
- (void)setFileStorageIdentifier:(id)a3;
- (void)setFileURL:(id)a3;
@end

@implementation CPLRecordComputeState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileStorageIdentifier, 0);
  objc_storeStrong((id *)&self->_lastUpdatedDate, 0);
  objc_storeStrong((id *)&self->_adjustmentFingerprint, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_itemScopedIdentifier, 0);
}

- (void)setFileStorageIdentifier:(id)a3
{
}

- (NSString)fileStorageIdentifier
{
  return self->_fileStorageIdentifier;
}

- (NSDate)lastUpdatedDate
{
  return self->_lastUpdatedDate;
}

- (NSString)adjustmentFingerprint
{
  return self->_adjustmentFingerprint;
}

- (void)setFileURL:(id)a3
{
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (NSString)version
{
  return self->_version;
}

- (CPLScopedIdentifier)itemScopedIdentifier
{
  return self->_itemScopedIdentifier;
}

- (id)redactedDescription
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  if (self->_fileURL) {
    v5 = @"has file";
  }
  else {
    v5 = @"no file";
  }
  v6 = (void *)[v3 initWithFormat:@"<%@ %@ %@ %@ %@ %@ %@>", v4, self->_itemScopedIdentifier, self->_fileStorageIdentifier, self->_version, self->_adjustmentFingerprint, self->_lastUpdatedDate, v5];
  return v6;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  itemScopedIdentifier = self->_itemScopedIdentifier;
  version = self->_version;
  lastUpdatedDate = self->_lastUpdatedDate;
  fileStorageIdentifier = self->_fileStorageIdentifier;
  fileURL = self->_fileURL;
  adjustmentFingerprint = self->_adjustmentFingerprint;
  if (fileURL)
  {
    v11 = [(NSURL *)fileURL path];
    v12 = (void *)[v3 initWithFormat:@"<%@ %@ %@ %@ %@ %@ %@>", v4, itemScopedIdentifier, fileStorageIdentifier, version, adjustmentFingerprint, lastUpdatedDate, v11];
  }
  else
  {
    v12 = (void *)[v3 initWithFormat:@"<%@ %@ %@ %@ %@ %@ %@>", v4, itemScopedIdentifier, fileStorageIdentifier, version, adjustmentFingerprint, self->_lastUpdatedDate, @"no file"];
  }
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  itemScopedIdentifier = self->_itemScopedIdentifier;
  id v5 = a3;
  [v5 encodeObject:itemScopedIdentifier forKey:@"itemScopedIdentifier"];
  [v5 encodeObject:self->_fileStorageIdentifier forKey:@"fileStorageIdentifier"];
  [v5 encodeObject:self->_version forKey:@"version"];
  [v5 encodeObject:self->_fileURL forKey:@"fileURL"];
  [v5 encodeObject:self->_adjustmentFingerprint forKey:@"adjustmentFingerprint"];
  [v5 encodeObject:self->_lastUpdatedDate forKey:@"lastUpdatedDate"];
}

- (CPLRecordComputeState)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"itemScopedIdentifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fileStorageIdentifier"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"version"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fileURL"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"adjustmentFingerprint"];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastUpdatedDate"];

  v11 = [(CPLRecordComputeState *)self initWithItemScopedIdentifier:v5 fileStorageIdentifier:v6 version:v7 fileURL:v8 adjustmentFingerprint:v9 lastUpdatedDate:v10];
  return v11;
}

- (id)copyAddingFileURL:(id)a3
{
  id v4 = a3;
  id v5 = [CPLRecordComputeState alloc];
  v6 = [(CPLRecordComputeState *)self itemScopedIdentifier];
  v7 = [(CPLRecordComputeState *)self fileStorageIdentifier];
  v8 = [(CPLRecordComputeState *)self version];
  v9 = [(CPLRecordComputeState *)self adjustmentFingerprint];
  v10 = [(CPLRecordComputeState *)self lastUpdatedDate];
  v11 = [(CPLRecordComputeState *)v5 initWithItemScopedIdentifier:v6 fileStorageIdentifier:v7 version:v8 fileURL:v4 adjustmentFingerprint:v9 lastUpdatedDate:v10];

  return v11;
}

- (CPLRecordComputeState)initWithItemScopedIdentifier:(id)a3 version:(id)a4 fileURL:(id)a5 adjustmentFingerprint:(id)a6 lastUpdatedDate:(id)a7
{
  return [(CPLRecordComputeState *)self initWithItemScopedIdentifier:a3 fileStorageIdentifier:0 version:a4 fileURL:a5 adjustmentFingerprint:a6 lastUpdatedDate:a7];
}

- (CPLRecordComputeState)initWithItemScopedIdentifier:(id)a3 fileStorageIdentifier:(id)a4 version:(id)a5 fileURL:(id)a6 adjustmentFingerprint:(id)a7 lastUpdatedDate:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v34.receiver = self;
  v34.super_class = (Class)CPLRecordComputeState;
  v20 = [(CPLRecordComputeState *)&v34 init];
  if (v20)
  {
    uint64_t v21 = [v14 copy];
    itemScopedIdentifier = v20->_itemScopedIdentifier;
    v20->_itemScopedIdentifier = (CPLScopedIdentifier *)v21;

    uint64_t v23 = [v15 copy];
    fileStorageIdentifier = v20->_fileStorageIdentifier;
    v20->_fileStorageIdentifier = (NSString *)v23;

    uint64_t v25 = [v16 copy];
    version = v20->_version;
    v20->_version = (NSString *)v25;

    uint64_t v27 = [v17 copy];
    fileURL = v20->_fileURL;
    v20->_fileURL = (NSURL *)v27;

    uint64_t v29 = [v18 copy];
    adjustmentFingerprint = v20->_adjustmentFingerprint;
    v20->_adjustmentFingerprint = (NSString *)v29;

    uint64_t v31 = [v19 copy];
    lastUpdatedDate = v20->_lastUpdatedDate;
    v20->_lastUpdatedDate = (NSDate *)v31;
  }
  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end