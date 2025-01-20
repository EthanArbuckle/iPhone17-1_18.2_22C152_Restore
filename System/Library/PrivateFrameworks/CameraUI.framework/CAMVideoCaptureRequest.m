@interface CAMVideoCaptureRequest
- (BOOL)isTimelapse;
- (BOOL)shouldGenerateVideoPreviewImage;
- (BOOL)trueVideoEnabled;
- (BOOL)wantsWhiteBalanceLocked;
- (CAMVideoCaptureRequest)init;
- (CAMVideoCaptureRequest)initWithRequest:(id)a3 distinctPersistence:(BOOL)a4 includeAnalytics:(BOOL)a5;
- (CAMVideoCaptureRequestDelegate)delegate;
- (double)maximumRecordedDuration;
- (double)userInitationTimestamp;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)captureVideoConfiguration;
- (int64_t)maximumRecordedFileSize;
- (int64_t)remainingDiskUsageThreshold;
- (int64_t)torchMode;
@end

@implementation CAMVideoCaptureRequest

- (CAMVideoCaptureRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)CAMVideoCaptureRequest;
  v2 = [(CAMCaptureRequest *)&v6 initWithType:1];
  v3 = v2;
  if (v2)
  {
    *(&v2->_shouldGenerateVideoPreviewImage + 3) = 1;
    v2->_remainingDiskUsageThreshold = 0;
    v2->_userInitationTimestamp = 0.0;
    v4 = v2;
  }

  return v3;
}

- (CAMVideoCaptureRequest)initWithRequest:(id)a3 distinctPersistence:(BOOL)a4 includeAnalytics:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CAMVideoCaptureRequest;
  v9 = [(CAMCaptureRequest *)&v15 initWithRequest:v8 distinctPersistence:v6 includeAnalytics:v5];
  if (v9)
  {
    v10 = [v8 delegate];
    objc_storeWeak((id *)&v9->_delegate, v10);

    v9->_captureVideoConfiguration = [v8 captureVideoConfiguration];
    v9->_torchMode = [v8 torchMode];
    v9->_wantsWhiteBalanceLocked = [v8 wantsWhiteBalanceLocked];
    [v8 maximumRecordedDuration];
    v9->_maximumRecordedDuration = v11;
    v9->_maximumRecordedFileSize = [v8 maximumRecordedFileSize];
    v9->_remainingDiskUsageThreshold = [v8 remainingDiskUsageThreshold];
    *(&v9->_shouldGenerateVideoPreviewImage + 3) = [v8 shouldGenerateVideoPreviewImage];
    *(&v9->_shouldGenerateVideoPreviewImage + 2) = [v8 isTimelapse];
    [v8 userInitationTimestamp];
    v9->_userInitationTimestamp = v12;
    v9->_trueVideoEnabled = [v8 trueVideoEnabled];
    v13 = v9;
  }

  return v9;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [CAMMutableVideoCaptureRequest alloc];
  return [(CAMVideoCaptureRequest *)v4 initWithRequest:self distinctPersistence:0 includeAnalytics:1];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unsigned int v5 = [(CAMCaptureRequest *)self sessionIdentifier];
  BOOL v6 = [(CAMCaptureRequest *)self localDestinationURL];
  v7 = [v3 stringWithFormat:@"<%@: sessionIdentifier:%d, localDestinationURL:%@>", v4, v5, v6];

  return v7;
}

- (CAMVideoCaptureRequestDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMVideoCaptureRequestDelegate *)WeakRetained;
}

- (int64_t)captureVideoConfiguration
{
  return self->_captureVideoConfiguration;
}

- (int64_t)torchMode
{
  return self->_torchMode;
}

- (BOOL)wantsWhiteBalanceLocked
{
  return self->_wantsWhiteBalanceLocked;
}

- (BOOL)trueVideoEnabled
{
  return self->_trueVideoEnabled;
}

- (double)userInitationTimestamp
{
  return self->_userInitationTimestamp;
}

- (BOOL)isTimelapse
{
  return *(&self->_shouldGenerateVideoPreviewImage + 2);
}

- (BOOL)shouldGenerateVideoPreviewImage
{
  return *(&self->_shouldGenerateVideoPreviewImage + 3);
}

- (double)maximumRecordedDuration
{
  return self->_maximumRecordedDuration;
}

- (int64_t)maximumRecordedFileSize
{
  return self->_maximumRecordedFileSize;
}

- (int64_t)remainingDiskUsageThreshold
{
  return self->_remainingDiskUsageThreshold;
}

- (void).cxx_destruct
{
}

@end