@interface CAMMutableVideoCaptureRequest
- (BOOL)isCaptureMirrored;
- (CAMAnalyticsCaptureEvent)analyticsEvent;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)setAnalyticsEvent:(id)a3;
- (void)setAssertionIdentifier:(unsigned int)a3;
- (void)setAudioConfiguration:(unint64_t)a3;
- (void)setCaptureDevice:(int64_t)a3;
- (void)setCaptureMirrored:(BOOL)a3;
- (void)setCaptureMode:(int64_t)a3;
- (void)setCaptureOrientation:(int64_t)a3;
- (void)setCaptureVideoConfiguration:(int64_t)a3;
- (void)setContactIDsInProximity:(id)a3;
- (void)setDeferredPersistenceOptions:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setHeading:(id)a3;
- (void)setLocalDestinationURL:(id)a3;
- (void)setLocation:(id)a3;
- (void)setMaximumRecordedDuration:(double)a3;
- (void)setMaximumRecordedFileSize:(int64_t)a3;
- (void)setOrigin:(int64_t)a3;
- (void)setPersistenceOptions:(int64_t)a3;
- (void)setPersistenceUUID:(id)a3;
- (void)setPressType:(int64_t)a3;
- (void)setRemainingDiskUsageThreshold:(int64_t)a3;
- (void)setSessionIdentifier:(unsigned __int16)a3;
- (void)setSharedLibraryDiagnostics:(id)a3;
- (void)setSharedLibraryMode:(int64_t)a3;
- (void)setShouldDelayRemotePersistence:(BOOL)a3;
- (void)setShouldExtractDiagnosticsFromMetadata:(BOOL)a3;
- (void)setShouldGenerateVideoPreviewImage:(BOOL)a3;
- (void)setShouldPersistDiagnosticsToSidecar:(BOOL)a3;
- (void)setTemporaryPersistenceOptions:(int64_t)a3;
- (void)setTimelapse:(BOOL)a3;
- (void)setTorchMode:(int64_t)a3;
- (void)setTrueVideoEnabled:(BOOL)a3;
- (void)setUserInitationTimestamp:(double)a3;
- (void)setVideoEncodingBehavior:(int64_t)a3;
- (void)setWantsWhiteBalanceLocked:(BOOL)a3;
@end

@implementation CAMMutableVideoCaptureRequest

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [CAMVideoCaptureRequest alloc];
  return [(CAMVideoCaptureRequest *)v4 initWithRequest:self distinctPersistence:0 includeAnalytics:1];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  return (id)[v4 initWithRequest:self distinctPersistence:0 includeAnalytics:1];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  p_delegate = &self->super._delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_delegate, obj);
    v6 = obj;
  }
}

- (void)setCaptureOrientation:(int64_t)a3
{
  if (self->super.super._captureOrientation != a3) {
    self->super.super._captureOrientation = a3;
  }
}

- (BOOL)isCaptureMirrored
{
  return self->super.super._captureMirrored;
}

- (void)setCaptureMirrored:(BOOL)a3
{
  self->super.super._captureMirrored = a3;
}

- (CAMAnalyticsCaptureEvent)analyticsEvent
{
  return self->super.super._analyticsEvent;
}

- (void)setAnalyticsEvent:(id)a3
{
  id v8 = a3;
  p_analyticsEvent = &self->super.super._analyticsEvent;
  v6 = [(CAMAnalyticsEvent *)*p_analyticsEvent uuid];
  v7 = [v8 uuid];

  if (v6 != v7) {
    objc_storeStrong((id *)p_analyticsEvent, a3);
  }
}

- (void)setCaptureDevice:(int64_t)a3
{
  if (self->super.super._captureDevice != a3) {
    self->super.super._captureDevice = a3;
  }
}

- (void)setCaptureMode:(int64_t)a3
{
  if (self->super.super._captureMode != a3) {
    self->super.super._captureMode = a3;
  }
}

- (void)setCaptureVideoConfiguration:(int64_t)a3
{
  if (self->super._captureVideoConfiguration != a3) {
    self->super._captureVideoConfiguration = a3;
  }
}

- (void)setPressType:(int64_t)a3
{
  if (self->super.super._pressType != a3) {
    self->super.super._pressType = a3;
  }
}

- (void)setTorchMode:(int64_t)a3
{
  if (self->super._torchMode != a3) {
    self->super._torchMode = a3;
  }
}

- (void)setWantsWhiteBalanceLocked:(BOOL)a3
{
  self->super._wantsWhiteBalanceLocked = a3;
}

- (void)setSessionIdentifier:(unsigned __int16)a3
{
  if (self->super.super._sessionIdentifier != a3) {
    self->super.super._sessionIdentifier = a3;
  }
}

- (void)setTrueVideoEnabled:(BOOL)a3
{
  if (self->super._trueVideoEnabled != a3) {
    self->super._trueVideoEnabled = a3;
  }
}

- (void)setPersistenceUUID:(id)a3
{
  if (self->super.super._persistenceUUID != a3)
  {
    id v4 = (NSString *)[a3 copy];
    persistenceUUID = self->super.super._persistenceUUID;
    self->super.super._persistenceUUID = v4;
    MEMORY[0x270F9A758](v4, persistenceUUID);
  }
}

- (void)setPersistenceOptions:(int64_t)a3
{
  if (self->super.super._persistenceOptions != a3) {
    self->super.super._persistenceOptions = a3;
  }
}

- (void)setDeferredPersistenceOptions:(unint64_t)a3
{
  if (self->super.super._deferredPersistenceOptions != a3) {
    self->super.super._deferredPersistenceOptions = a3;
  }
}

- (void)setTemporaryPersistenceOptions:(int64_t)a3
{
  if (self->super.super._temporaryPersistenceOptions != a3) {
    self->super.super._temporaryPersistenceOptions = a3;
  }
}

- (void)setLocalDestinationURL:(id)a3
{
  p_localDestinationURL = &self->super.super._localDestinationURL;
  id v5 = a3;
  if ((-[NSURL isEqual:](*p_localDestinationURL, "isEqual:") & 1) == 0) {
    objc_storeStrong((id *)p_localDestinationURL, a3);
  }
}

- (void)setShouldExtractDiagnosticsFromMetadata:(BOOL)a3
{
  if (self->super.super._shouldExtractDiagnosticsFromMetadata != a3) {
    self->super.super._shouldExtractDiagnosticsFromMetadata = a3;
  }
}

- (void)setShouldPersistDiagnosticsToSidecar:(BOOL)a3
{
  if (self->super.super._shouldPersistDiagnosticsToSidecar != a3) {
    self->super.super._shouldPersistDiagnosticsToSidecar = a3;
  }
}

- (void)setShouldDelayRemotePersistence:(BOOL)a3
{
  if (self->super.super._shouldDelayRemotePersistence != a3) {
    self->super.super._shouldDelayRemotePersistence = a3;
  }
}

- (void)setVideoEncodingBehavior:(int64_t)a3
{
  if (self->super.super._videoEncodingBehavior != a3) {
    self->super.super._videoEncodingBehavior = a3;
  }
}

- (void)setLocation:(id)a3
{
  id v5 = (CLLocation *)a3;
  p_location = &self->super.super._location;
  if (self->super.super._location != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_location, a3);
    id v5 = v7;
  }
  MEMORY[0x270F9A758](p_location, v5);
}

- (void)setHeading:(id)a3
{
  id v5 = (CLHeading *)a3;
  p_heading = &self->super.super._heading;
  if (self->super.super._heading != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_heading, a3);
    id v5 = v7;
  }
  MEMORY[0x270F9A758](p_heading, v5);
}

- (void)setMaximumRecordedDuration:(double)a3
{
  if (self->super._maximumRecordedDuration != a3) {
    self->super._maximumRecordedDuration = a3;
  }
}

- (void)setMaximumRecordedFileSize:(int64_t)a3
{
  if (self->super._maximumRecordedFileSize != a3) {
    self->super._maximumRecordedFileSize = a3;
  }
}

- (void)setRemainingDiskUsageThreshold:(int64_t)a3
{
  if (self->super._remainingDiskUsageThreshold != a3) {
    self->super._remainingDiskUsageThreshold = a3;
  }
}

- (void)setShouldGenerateVideoPreviewImage:(BOOL)a3
{
  if (*(&self->super._shouldGenerateVideoPreviewImage + 3) != a3) {
    *(&self->super._shouldGenerateVideoPreviewImage + 3) = a3;
  }
}

- (void)setOrigin:(int64_t)a3
{
  if (self->super.super._origin != a3) {
    self->super.super._origin = a3;
  }
}

- (void)setAssertionIdentifier:(unsigned int)a3
{
  self->super.super._assertionIdentifier = a3;
}

- (void)setTimelapse:(BOOL)a3
{
  if (*(&self->super._shouldGenerateVideoPreviewImage + 2) != a3) {
    *(&self->super._shouldGenerateVideoPreviewImage + 2) = a3;
  }
}

- (void)setUserInitationTimestamp:(double)a3
{
  if (self->super._userInitationTimestamp != a3) {
    self->super._userInitationTimestamp = a3;
  }
}

- (void)setContactIDsInProximity:(id)a3
{
  if (self->super.super._contactIDsInProximity != a3)
  {
    id v4 = (NSArray *)[a3 copy];
    contactIDsInProximity = self->super.super._contactIDsInProximity;
    self->super.super._contactIDsInProximity = v4;
    MEMORY[0x270F9A758](v4, contactIDsInProximity);
  }
}

- (void)setSharedLibraryMode:(int64_t)a3
{
  if (self->super.super._sharedLibraryMode != a3) {
    self->super.super._sharedLibraryMode = a3;
  }
}

- (void)setSharedLibraryDiagnostics:(id)a3
{
  if (self->super.super._sharedLibraryDiagnostics != a3)
  {
    id v4 = (NSDictionary *)[a3 copy];
    sharedLibraryDiagnostics = self->super.super._sharedLibraryDiagnostics;
    self->super.super._sharedLibraryDiagnostics = v4;
    MEMORY[0x270F9A758](v4, sharedLibraryDiagnostics);
  }
}

- (void)setAudioConfiguration:(unint64_t)a3
{
  if (self->super.super._audioConfiguration != a3) {
    self->super.super._audioConfiguration = a3;
  }
}

@end