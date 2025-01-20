@interface GTCaptureConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)disableHashResources;
- (BOOL)enableLogErrors;
- (BOOL)enablePresentDownload;
- (GTCaptureConfiguration)init;
- (GTCaptureConfiguration)initWithCoder:(id)a3;
- (unsigned)maxDownloadCommandBuffers;
- (unsigned)waitEventTimeout;
- (void)encodeWithCoder:(id)a3;
- (void)setDisableHashResources:(BOOL)a3;
- (void)setEnableLogErrors:(BOOL)a3;
- (void)setEnablePresentDownload:(BOOL)a3;
- (void)setMaxDownloadCommandBuffers:(unsigned int)a3;
- (void)setWaitEventTimeout:(unsigned int)a3;
@end

@implementation GTCaptureConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTCaptureConfiguration)init
{
  v6.receiver = self;
  v6.super_class = (Class)GTCaptureConfiguration;
  v2 = [(GTCaptureConfiguration *)&v6 init];
  v3 = (GTCaptureConfiguration *)v2;
  if (v2)
  {
    *((_WORD *)v2 + 4) = 0;
    v2[10] = 0;
    *(void *)(v2 + 12) = 0x2000000005ALL;
    v4 = v2;
  }

  return v3;
}

- (GTCaptureConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GTCaptureConfiguration;
  v5 = [(GTCaptureConfiguration *)&v8 init];
  if (v5)
  {
    v5->_enablePresentDownload = [v4 decodeBoolForKey:@"enablePresentDownload"];
    v5->_enableLogErrors = [v4 decodeBoolForKey:@"enableLogErrors"];
    v5->_disableHashResources = [v4 decodeBoolForKey:@"disableHashResources"];
    v5->_waitEventTimeout = [v4 decodeInt32ForKey:@"waitEventTimeout"];
    v5->_maxDownloadCommandBuffers = [v4 decodeInt32ForKey:@"maxDownloadCommandBuffers"];
    objc_super v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL enablePresentDownload = self->_enablePresentDownload;
  id v5 = a3;
  [v5 encodeBool:enablePresentDownload forKey:@"enablePresentDownload"];
  [v5 encodeBool:self->_enableLogErrors forKey:@"enableLogErrors"];
  [v5 encodeBool:self->_disableHashResources forKey:@"disableHashResources"];
  [v5 encodeInt32:self->_waitEventTimeout forKey:@"waitEventTimeout"];
  [v5 encodeInt32:self->_maxDownloadCommandBuffers forKey:@"maxDownloadCommandBuffers"];
}

- (BOOL)enablePresentDownload
{
  return self->_enablePresentDownload;
}

- (void)setEnablePresentDownload:(BOOL)a3
{
  self->_BOOL enablePresentDownload = a3;
}

- (BOOL)enableLogErrors
{
  return self->_enableLogErrors;
}

- (void)setEnableLogErrors:(BOOL)a3
{
  self->_enableLogErrors = a3;
}

- (BOOL)disableHashResources
{
  return self->_disableHashResources;
}

- (void)setDisableHashResources:(BOOL)a3
{
  self->_disableHashResources = a3;
}

- (unsigned)waitEventTimeout
{
  return self->_waitEventTimeout;
}

- (void)setWaitEventTimeout:(unsigned int)a3
{
  self->_waitEventTimeout = a3;
}

- (unsigned)maxDownloadCommandBuffers
{
  return self->_maxDownloadCommandBuffers;
}

- (void)setMaxDownloadCommandBuffers:(unsigned int)a3
{
  self->_maxDownloadCommandBuffers = a3;
}

@end