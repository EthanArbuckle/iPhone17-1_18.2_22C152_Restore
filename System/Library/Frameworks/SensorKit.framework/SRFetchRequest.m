@interface SRFetchRequest
- (SRAbsoluteTime)from;
- (SRAbsoluteTime)to;
- (SRCursor)_cursor;
- (SRDevice)device;
- (SRFetchRequest)init;
- (void)dealloc;
- (void)setDevice:(SRDevice *)device;
- (void)setFrom:(SRAbsoluteTime)from;
- (void)setTo:(SRAbsoluteTime)to;
- (void)set_cursor:(id)a3;
@end

@implementation SRFetchRequest

- (SRFetchRequest)init
{
  v5.receiver = self;
  v5.super_class = (Class)SRFetchRequest;
  v2 = [(SRFetchRequest *)&v5 init];
  v3 = (SRFetchRequest *)v2;
  if (v2)
  {
    *(int64x2_t *)(v2 + 8) = vdupq_n_s64(0x7FF8000000000000uLL);
    *((void *)v2 + 3) = +[SRDevice currentDevice];
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SRFetchRequest;
  [(SRFetchRequest *)&v3 dealloc];
}

- (SRAbsoluteTime)from
{
  return self->_from;
}

- (void)setFrom:(SRAbsoluteTime)from
{
  self->_from = from;
}

- (SRAbsoluteTime)to
{
  return self->_to;
}

- (void)setTo:(SRAbsoluteTime)to
{
  self->_to = to;
}

- (SRDevice)device
{
  return (SRDevice *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDevice:(SRDevice *)device
{
}

- (SRCursor)_cursor
{
  return self->__cursor;
}

- (void)set_cursor:(id)a3
{
}

@end