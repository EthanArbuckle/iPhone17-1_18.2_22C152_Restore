@interface CPLChangeSessionUpdate
+ (BOOL)supportsSecureCoding;
- (BOOL)applyToStore:(id)a3 error:(id *)a4;
- (BOOL)discardFromStore:(id)a3 error:(id *)a4;
- (CPLChangeSessionUpdate)initWithCoder:(id)a3;
- (CPLChangeSessionUpdate)initWithStore:(id)a3;
- (NSDate)queuedDate;
- (NSString)libraryVersion;
- (id)pendingRecordChangeForClientCacheWithLocalScopedIdentifier:(id)a3;
- (id)storageForStatusInStore:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CPLChangeSessionUpdate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queuedDate, 0);
  objc_storeStrong((id *)&self->_libraryVersion, 0);
}

- (NSDate)queuedDate
{
  return self->_queuedDate;
}

- (NSString)libraryVersion
{
  return self->_libraryVersion;
}

- (id)pendingRecordChangeForClientCacheWithLocalScopedIdentifier:(id)a3
{
  return 0;
}

- (id)storageForStatusInStore:(id)a3
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  libraryVersion = self->_libraryVersion;
  id v5 = a3;
  [v5 encodeObject:libraryVersion forKey:@"libraryVersion"];
  [v5 encodeObject:self->_queuedDate forKey:@"date"];
}

- (CPLChangeSessionUpdate)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CPLChangeSessionUpdate;
  id v5 = [(CPLChangeSessionUpdate *)&v12 init];
  if (!v5) {
    goto LABEL_3;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"libraryVersion"];
  libraryVersion = v5->_libraryVersion;
  v5->_libraryVersion = (NSString *)v6;

  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
  queuedDate = v5->_queuedDate;
  v5->_queuedDate = (NSDate *)v8;

  if (!v5->_libraryVersion) {
    v10 = 0;
  }
  else {
LABEL_3:
  }
    v10 = v5;

  return v10;
}

- (BOOL)discardFromStore:(id)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)applyToStore:(id)a3 error:(id *)a4
{
  return [a3 storeLibraryVersion:self->_libraryVersion withError:a4];
}

- (CPLChangeSessionUpdate)initWithStore:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CPLChangeSessionUpdate;
  id v5 = [(CPLChangeSessionUpdate *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 createNewLibraryVersion];
    libraryVersion = v5->_libraryVersion;
    v5->_libraryVersion = (NSString *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
    queuedDate = v5->_queuedDate;
    v5->_queuedDate = (NSDate *)v8;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end