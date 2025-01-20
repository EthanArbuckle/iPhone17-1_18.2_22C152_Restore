@interface ASDProgress
+ (BOOL)supportsSecureCoding;
- (ASDProgress)initWithCoder:(id)a3;
- (BOOL)hasPostProcessing;
- (BOOL)reportRemotely;
- (NSString)bundleID;
- (double)throughput;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)completedUnitCount;
- (int64_t)downloadCompletedUnitCount;
- (int64_t)downloadTotalUnitCount;
- (int64_t)essentialBackgroundAssetDownloadEstimate;
- (int64_t)installCompletedUnitCount;
- (int64_t)installTotalUnitCount;
- (int64_t)phase;
- (int64_t)postProcessCompletedUnitCount;
- (int64_t)postProcessTotalUnitCount;
- (int64_t)secondsRemaining;
- (int64_t)totalUnitCount;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setCompletedUnitCount:(int64_t)a3;
- (void)setDownloadCompletedUnitCount:(int64_t)a3;
- (void)setDownloadTotalUnitCount:(int64_t)a3;
- (void)setEssentialBackgroundAssetDownloadEstimate:(int64_t)a3;
- (void)setHasPostProcessing:(BOOL)a3;
- (void)setInstallCompletedUnitCount:(int64_t)a3;
- (void)setInstallTotalUnitCount:(int64_t)a3;
- (void)setPhase:(int64_t)a3;
- (void)setPostProcessCompletedUnitCount:(int64_t)a3;
- (void)setPostProcessTotalUnitCount:(int64_t)a3;
- (void)setReportRemotely:(BOOL)a3;
- (void)setSecondsRemaining:(int64_t)a3;
- (void)setThroughput:(double)a3;
- (void)setTotalUnitCount:(int64_t)a3;
@end

@implementation ASDProgress

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[ASDProgress allocWithZone:](ASDProgress, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_bundleID copyWithZone:a3];
  bundleID = v5->_bundleID;
  v5->_bundleID = (NSString *)v6;

  v5->_completedUnitCount = self->_completedUnitCount;
  v5->_reportRemotely = self->_reportRemotely;
  v5->_totalUnitCount = self->_totalUnitCount;
  v5->_downloadCompletedUnitCount = self->_downloadCompletedUnitCount;
  v5->_downloadTotalUnitCount = self->_downloadTotalUnitCount;
  v5->_installCompletedUnitCount = self->_installCompletedUnitCount;
  v5->_installTotalUnitCount = self->_installTotalUnitCount;
  v5->_postProcessCompletedUnitCount = self->_postProcessCompletedUnitCount;
  v5->_postProcessTotalUnitCount = self->_postProcessTotalUnitCount;
  v5->_hasPostProcessing = self->_hasPostProcessing;
  v5->_essentialBackgroundAssetDownloadEstimate = self->_essentialBackgroundAssetDownloadEstimate;
  v5->_phase = self->_phase;
  v5->_secondsRemaining = self->_secondsRemaining;
  v5->_throughput = self->_throughput;
  return v5;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)ASDProgress;
  v4 = [(ASDProgress *)&v7 description];
  objc_msgSend(v3, "stringWithFormat:", @"%@: {bundleID = %@; fractionCompleted = %.2f; reportRemotely = %d}",
    v4,
    self->_bundleID,
    (double)self->_completedUnitCount / (double)self->_totalUnitCount,
  v5 = self->_reportRemotely);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  bundleID = self->_bundleID;
  id v5 = a3;
  [v5 encodeObject:bundleID forKey:@"A"];
  [v5 encodeInt64:self->_completedUnitCount forKey:@"B"];
  [v5 encodeBool:self->_reportRemotely forKey:@"C"];
  [v5 encodeInt64:self->_totalUnitCount forKey:@"D"];
  [v5 encodeInt64:self->_downloadCompletedUnitCount forKey:@"E"];
  [v5 encodeInt64:self->_downloadTotalUnitCount forKey:@"F"];
  [v5 encodeInt64:self->_installCompletedUnitCount forKey:@"G"];
  [v5 encodeInt64:self->_installTotalUnitCount forKey:@"H"];
  [v5 encodeInt64:self->_postProcessCompletedUnitCount forKey:@"K"];
  [v5 encodeInt64:self->_postProcessTotalUnitCount forKey:@"L"];
  [v5 encodeBool:self->_hasPostProcessing forKey:@"M"];
  [v5 encodeInt64:self->_essentialBackgroundAssetDownloadEstimate forKey:@"N"];
  [v5 encodeInteger:self->_phase forKey:@"I"];
  [v5 encodeInteger:self->_secondsRemaining forKey:@"O"];
  [v5 encodeDouble:@"J" forKey:self->_throughput];
}

- (ASDProgress)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASDProgress;
  id v5 = [(ASDProgress *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"A"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v6;

    v5->_completedUnitCount = [v4 decodeInt64ForKey:@"B"];
    v5->_reportRemotely = [v4 decodeBoolForKey:@"C"];
    v5->_totalUnitCount = [v4 decodeInt64ForKey:@"D"];
    v5->_downloadCompletedUnitCount = [v4 decodeInt64ForKey:@"E"];
    v5->_downloadTotalUnitCount = [v4 decodeInt64ForKey:@"F"];
    v5->_installCompletedUnitCount = [v4 decodeInt64ForKey:@"G"];
    v5->_installTotalUnitCount = [v4 decodeInt64ForKey:@"H"];
    v5->_postProcessCompletedUnitCount = [v4 decodeInt64ForKey:@"K"];
    v5->_postProcessTotalUnitCount = [v4 decodeInt64ForKey:@"L"];
    v5->_hasPostProcessing = [v4 decodeBoolForKey:@"M"];
    v5->_essentialBackgroundAssetDownloadEstimate = [v4 decodeInt64ForKey:@"N"];
    v5->_phase = [v4 decodeIntegerForKey:@"I"];
    v5->_secondsRemaining = [v4 decodeIntegerForKey:@"O"];
    [v4 decodeDoubleForKey:@"J"];
    v5->_throughput = v8;
  }

  return v5;
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBundleID:(id)a3
{
}

- (int64_t)completedUnitCount
{
  return self->_completedUnitCount;
}

- (void)setCompletedUnitCount:(int64_t)a3
{
  self->_completedUnitCount = a3;
}

- (BOOL)reportRemotely
{
  return self->_reportRemotely;
}

- (void)setReportRemotely:(BOOL)a3
{
  self->_reportRemotely = a3;
}

- (int64_t)totalUnitCount
{
  return self->_totalUnitCount;
}

- (void)setTotalUnitCount:(int64_t)a3
{
  self->_totalUnitCount = a3;
}

- (int64_t)downloadCompletedUnitCount
{
  return self->_downloadCompletedUnitCount;
}

- (void)setDownloadCompletedUnitCount:(int64_t)a3
{
  self->_downloadCompletedUnitCount = a3;
}

- (int64_t)downloadTotalUnitCount
{
  return self->_downloadTotalUnitCount;
}

- (void)setDownloadTotalUnitCount:(int64_t)a3
{
  self->_downloadTotalUnitCount = a3;
}

- (int64_t)installCompletedUnitCount
{
  return self->_installCompletedUnitCount;
}

- (void)setInstallCompletedUnitCount:(int64_t)a3
{
  self->_installCompletedUnitCount = a3;
}

- (int64_t)installTotalUnitCount
{
  return self->_installTotalUnitCount;
}

- (void)setInstallTotalUnitCount:(int64_t)a3
{
  self->_installTotalUnitCount = a3;
}

- (int64_t)postProcessCompletedUnitCount
{
  return self->_postProcessCompletedUnitCount;
}

- (void)setPostProcessCompletedUnitCount:(int64_t)a3
{
  self->_postProcessCompletedUnitCount = a3;
}

- (int64_t)postProcessTotalUnitCount
{
  return self->_postProcessTotalUnitCount;
}

- (void)setPostProcessTotalUnitCount:(int64_t)a3
{
  self->_postProcessTotalUnitCount = a3;
}

- (BOOL)hasPostProcessing
{
  return self->_hasPostProcessing;
}

- (void)setHasPostProcessing:(BOOL)a3
{
  self->_hasPostProcessing = a3;
}

- (int64_t)essentialBackgroundAssetDownloadEstimate
{
  return self->_essentialBackgroundAssetDownloadEstimate;
}

- (void)setEssentialBackgroundAssetDownloadEstimate:(int64_t)a3
{
  self->_essentialBackgroundAssetDownloadEstimate = a3;
}

- (int64_t)phase
{
  return self->_phase;
}

- (void)setPhase:(int64_t)a3
{
  self->_phase = a3;
}

- (int64_t)secondsRemaining
{
  return self->_secondsRemaining;
}

- (void)setSecondsRemaining:(int64_t)a3
{
  self->_secondsRemaining = a3;
}

- (double)throughput
{
  return self->_throughput;
}

- (void)setThroughput:(double)a3
{
  self->_throughput = a3;
}

- (void).cxx_destruct
{
}

@end