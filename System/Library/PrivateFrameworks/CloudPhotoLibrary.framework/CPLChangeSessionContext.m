@interface CPLChangeSessionContext
+ (BOOL)supportsSecureCoding;
- (CPLChangeSessionContext)initWithCoder:(id)a3;
- (CPLResetTracker)resetTracker;
- (unint64_t)estimatedInitialAssetCountForLocalLibrary;
- (unint64_t)estimatedInitialSizeForLocalLibrary;
- (void)encodeWithCoder:(id)a3;
- (void)setEstimatedInitialAssetCountForLocalLibrary:(unint64_t)a3;
- (void)setEstimatedInitialSizeForLocalLibrary:(unint64_t)a3;
- (void)setResetTracker:(id)a3;
@end

@implementation CPLChangeSessionContext

- (void).cxx_destruct
{
}

- (void)setResetTracker:(id)a3
{
}

- (CPLResetTracker)resetTracker
{
  return self->_resetTracker;
}

- (void)setEstimatedInitialAssetCountForLocalLibrary:(unint64_t)a3
{
  self->_estimatedInitialAssetCountForLocalLibrary = a3;
}

- (unint64_t)estimatedInitialAssetCountForLocalLibrary
{
  return self->_estimatedInitialAssetCountForLocalLibrary;
}

- (void)setEstimatedInitialSizeForLocalLibrary:(unint64_t)a3
{
  self->_estimatedInitialSizeForLocalLibrary = a3;
}

- (unint64_t)estimatedInitialSizeForLocalLibrary
{
  return self->_estimatedInitialSizeForLocalLibrary;
}

- (CPLChangeSessionContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPLChangeSessionContext;
  v5 = [(CPLChangeSessionContext *)&v9 init];
  if (v5)
  {
    v5->_estimatedInitialSizeForLocalLibrary = [v4 decodeIntegerForKey:@"estimatedSize"];
    v5->_estimatedInitialAssetCountForLocalLibrary = [v4 decodeIntegerForKey:@"estimatedCount"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"resetTracker"];
    resetTracker = v5->_resetTracker;
    v5->_resetTracker = (CPLResetTracker *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t estimatedInitialSizeForLocalLibrary = self->_estimatedInitialSizeForLocalLibrary;
  id v5 = a3;
  [v5 encodeInt64:estimatedInitialSizeForLocalLibrary forKey:@"estimatedSize"];
  [v5 encodeInteger:self->_estimatedInitialAssetCountForLocalLibrary forKey:@"estimatedCount"];
  [v5 encodeObject:self->_resetTracker forKey:@"resetTracker"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end