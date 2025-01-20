@interface HMIVideoFrameSamplerDelegateAdapter
- (id)frameSamplerDidDropFrame;
- (id)frameSamplerDidSampleFrame;
- (void)frameSampler:(id)a3 didDropFrame:(opaqueCMSampleBuffer *)a4;
- (void)frameSampler:(id)a3 didSampleFrame:(opaqueCMSampleBuffer *)a4;
- (void)setFrameSamplerDidDropFrame:(id)a3;
- (void)setFrameSamplerDidSampleFrame:(id)a3;
@end

@implementation HMIVideoFrameSamplerDelegateAdapter

- (void)frameSampler:(id)a3 didSampleFrame:(opaqueCMSampleBuffer *)a4
{
  id v8 = a3;
  v6 = [(HMIVideoFrameSamplerDelegateAdapter *)self frameSamplerDidSampleFrame];

  if (v6)
  {
    v7 = [(HMIVideoFrameSamplerDelegateAdapter *)self frameSamplerDidSampleFrame];
    ((void (**)(void, id, opaqueCMSampleBuffer *))v7)[2](v7, v8, a4);
  }
}

- (void)frameSampler:(id)a3 didDropFrame:(opaqueCMSampleBuffer *)a4
{
  id v8 = a3;
  v6 = [(HMIVideoFrameSamplerDelegateAdapter *)self frameSamplerDidDropFrame];

  if (v6)
  {
    v7 = [(HMIVideoFrameSamplerDelegateAdapter *)self frameSamplerDidDropFrame];
    ((void (**)(void, id, opaqueCMSampleBuffer *))v7)[2](v7, v8, a4);
  }
}

- (id)frameSamplerDidSampleFrame
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setFrameSamplerDidSampleFrame:(id)a3
{
}

- (id)frameSamplerDidDropFrame
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setFrameSamplerDidDropFrame:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_frameSamplerDidDropFrame, 0);
  objc_storeStrong(&self->_frameSamplerDidSampleFrame, 0);
}

@end