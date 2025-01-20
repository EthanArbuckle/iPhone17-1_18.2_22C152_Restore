@interface AVAudioDeviceTestProcessingChain
+ (BOOL)supportsSecureCoding;
- (AVAudioDeviceTestProcessingChain)initWithCoder:(id)a3;
- (NSURL)graphURL;
- (NSURL)processingStripURL;
- (void)encodeWithCoder:(id)a3;
- (void)setGraphURL:(id)a3;
- (void)setProcessingStripURL:(id)a3;
@end

@implementation AVAudioDeviceTestProcessingChain

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processingStripURL, 0);

  objc_storeStrong((id *)&self->_graphURL, 0);
}

- (void)setProcessingStripURL:(id)a3
{
}

- (NSURL)processingStripURL
{
  return self->_processingStripURL;
}

- (void)setGraphURL:(id)a3
{
}

- (NSURL)graphURL
{
  return self->_graphURL;
}

- (AVAudioDeviceTestProcessingChain)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AVAudioDeviceTestProcessingChain;
  v5 = [(AVAudioDeviceTestProcessingChain *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"graphURL"];
    graphURL = v5->_graphURL;
    v5->_graphURL = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"processingStripURL"];
    processingStripURL = v5->_processingStripURL;
    v5->_processingStripURL = (NSURL *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  graphURL = self->_graphURL;
  id v5 = a3;
  [v5 encodeObject:graphURL forKey:@"graphURL"];
  [v5 encodeObject:self->_processingStripURL forKey:@"processingStripURL"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end