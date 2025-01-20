@interface DSListenerDevice
- (DSClientMotionDataOptions)inOptions;
- (DSListenerDevice)initWithRapportDevice:(id)a3 queue:(id)a4;
- (id)responseHandler;
- (unsigned)version;
- (void)setInOptions:(id)a3;
- (void)setResponseHandler:(id)a3;
- (void)setVersion:(unsigned int)a3;
@end

@implementation DSListenerDevice

- (DSListenerDevice)initWithRapportDevice:(id)a3 queue:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)DSListenerDevice;
  v4 = [(DSRapportDevice *)&v8 initWithRapportDevice:a3 queue:a4];
  v5 = v4;
  if (v4)
  {
    id responseHandler = v4->_responseHandler;
    v4->_id responseHandler = 0;
  }
  return v5;
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  self->_version = a3;
}

- (DSClientMotionDataOptions)inOptions
{
  return self->_inOptions;
}

- (void)setInOptions:(id)a3
{
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_inOptions, 0);
}

@end