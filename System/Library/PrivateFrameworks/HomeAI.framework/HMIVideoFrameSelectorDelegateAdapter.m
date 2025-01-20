@interface HMIVideoFrameSelectorDelegateAdapter
- (id)frameSelectorDidSelectFrame;
- (id)frameSelectorDidSkipFrame;
- (id)frameSelectorPrepareFrame;
- (opaqueCMSampleBuffer)frameSelector:(id)a3 prepareFrame:(opaqueCMSampleBuffer *)a4;
- (void)frameSelector:(id)a3 didSelectFrame:(opaqueCMSampleBuffer *)a4 reference:(opaqueCMSampleBuffer *)a5;
- (void)frameSelector:(id)a3 didSkipFrame:(opaqueCMSampleBuffer *)a4;
- (void)setFrameSelectorDidSelectFrame:(id)a3;
- (void)setFrameSelectorDidSkipFrame:(id)a3;
- (void)setFrameSelectorPrepareFrame:(id)a3;
@end

@implementation HMIVideoFrameSelectorDelegateAdapter

- (void)frameSelector:(id)a3 didSelectFrame:(opaqueCMSampleBuffer *)a4 reference:(opaqueCMSampleBuffer *)a5
{
  id v10 = a3;
  v8 = [(HMIVideoFrameSelectorDelegateAdapter *)self frameSelectorDidSelectFrame];

  if (v8)
  {
    v9 = [(HMIVideoFrameSelectorDelegateAdapter *)self frameSelectorDidSelectFrame];
    ((void (**)(void, id, opaqueCMSampleBuffer *, opaqueCMSampleBuffer *))v9)[2](v9, v10, a4, a5);
  }
}

- (void)frameSelector:(id)a3 didSkipFrame:(opaqueCMSampleBuffer *)a4
{
  id v8 = a3;
  v6 = [(HMIVideoFrameSelectorDelegateAdapter *)self frameSelectorDidSkipFrame];

  if (v6)
  {
    v7 = [(HMIVideoFrameSelectorDelegateAdapter *)self frameSelectorDidSkipFrame];
    ((void (**)(void, id, opaqueCMSampleBuffer *))v7)[2](v7, v8, a4);
  }
}

- (opaqueCMSampleBuffer)frameSelector:(id)a3 prepareFrame:(opaqueCMSampleBuffer *)a4
{
  id v6 = a3;
  v7 = [(HMIVideoFrameSelectorDelegateAdapter *)self frameSelectorPrepareFrame];

  if (v7)
  {
    id v8 = [(HMIVideoFrameSelectorDelegateAdapter *)self frameSelectorPrepareFrame];
    v9 = (opaqueCMSampleBuffer *)((uint64_t (**)(void, id, opaqueCMSampleBuffer *))v8)[2](v8, v6, a4);
  }
  else
  {
    v9 = (opaqueCMSampleBuffer *)CFRetain(a4);
  }

  return v9;
}

- (id)frameSelectorDidSelectFrame
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setFrameSelectorDidSelectFrame:(id)a3
{
}

- (id)frameSelectorDidSkipFrame
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setFrameSelectorDidSkipFrame:(id)a3
{
}

- (id)frameSelectorPrepareFrame
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setFrameSelectorPrepareFrame:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_frameSelectorPrepareFrame, 0);
  objc_storeStrong(&self->_frameSelectorDidSkipFrame, 0);
  objc_storeStrong(&self->_frameSelectorDidSelectFrame, 0);
}

@end