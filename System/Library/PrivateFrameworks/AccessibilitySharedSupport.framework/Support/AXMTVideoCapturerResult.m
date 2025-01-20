@interface AXMTVideoCapturerResult
- (AXMTVideoCapturerResult)initWithBuffer:(opaqueCMSampleBuffer *)a3 metadataObjects:(id)a4;
- (NSArray)metadataObjects;
- (opaqueCMSampleBuffer)buffer;
- (void)setBuffer:(opaqueCMSampleBuffer *)a3;
- (void)setMetadataObjects:(id)a3;
@end

@implementation AXMTVideoCapturerResult

- (AXMTVideoCapturerResult)initWithBuffer:(opaqueCMSampleBuffer *)a3 metadataObjects:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)AXMTVideoCapturerResult;
  v7 = [(AXMTVideoCapturerResult *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(AXMTVideoCapturerResult *)v7 setBuffer:a3];
    [(AXMTVideoCapturerResult *)v8 setMetadataObjects:v6];
  }

  return v8;
}

- (opaqueCMSampleBuffer)buffer
{
  return self->_buffer;
}

- (void)setBuffer:(opaqueCMSampleBuffer *)a3
{
  self->_buffer = a3;
}

- (NSArray)metadataObjects
{
  return self->_metadataObjects;
}

- (void)setMetadataObjects:(id)a3
{
}

- (void).cxx_destruct
{
}

@end