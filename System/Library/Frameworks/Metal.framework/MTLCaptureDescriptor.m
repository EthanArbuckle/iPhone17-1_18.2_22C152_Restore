@interface MTLCaptureDescriptor
- (BOOL)isEqual:(id)a3;
- (MTLCaptureDescriptor)init;
- (MTLCaptureDestination)destination;
- (NSURL)outputURL;
- (id)captureObject;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)dealloc;
- (void)setCaptureObject:(id)captureObject;
- (void)setDestination:(MTLCaptureDestination)destination;
- (void)setOutputURL:(NSURL *)outputURL;
@end

@implementation MTLCaptureDescriptor

- (MTLCaptureDescriptor)init
{
  v3.receiver = self;
  v3.super_class = (Class)MTLCaptureDescriptor;
  result = [(MTLCaptureDescriptor *)&v3 init];
  if (result) {
    result->_destination = 1;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLCaptureDescriptor;
  [(MTLCaptureDescriptor *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTLCaptureDescriptor);
  [(MTLCaptureDescriptor *)v4 setCaptureObject:self->_captureObject];
  [(MTLCaptureDescriptor *)v4 setDestination:self->_destination];
  [(MTLCaptureDescriptor *)v4 setOutputURL:self->_outputURL];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  uint64_t v5 = objc_opt_class();
  BOOL result = 0;
  if (v5 == objc_opt_class())
  {
    id captureObject = self->_captureObject;
    if ((captureObject == *((id *)a3 + 1) || objc_msgSend(captureObject, "isEqual:"))
      && self->_destination == *((void *)a3 + 2))
    {
      outputURL = self->_outputURL;
      if (outputURL == *((NSURL **)a3 + 3) || (-[NSURL isEqual:](outputURL, "isEqual:") & 1) != 0) {
        return 1;
      }
    }
  }
  return result;
}

- (unint64_t)hash
{
  uint64_t v3 = [self->_captureObject hash];
  outputURL = self->_outputURL;
  int64_t v5 = self->_destination | v3;
  return v5 | [(NSURL *)outputURL hash];
}

- (id)captureObject
{
  return self->_captureObject;
}

- (void)setCaptureObject:(id)captureObject
{
}

- (MTLCaptureDestination)destination
{
  return self->_destination;
}

- (void)setDestination:(MTLCaptureDestination)destination
{
  self->_destination = destination;
}

- (NSURL)outputURL
{
  return self->_outputURL;
}

- (void)setOutputURL:(NSURL *)outputURL
{
}

@end