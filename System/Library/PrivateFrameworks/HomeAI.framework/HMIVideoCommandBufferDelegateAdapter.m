@interface HMIVideoCommandBufferDelegateAdapter
- (id)bufferWillFlush;
- (id)bufferWillHandleSampleBuffer;
- (void)buffer:(id)a3 willHandleSampleBuffer:(opaqueCMSampleBuffer *)a4;
- (void)bufferWillFlush:(id)a3;
- (void)setBufferWillFlush:(id)a3;
- (void)setBufferWillHandleSampleBuffer:(id)a3;
@end

@implementation HMIVideoCommandBufferDelegateAdapter

- (void)buffer:(id)a3 willHandleSampleBuffer:(opaqueCMSampleBuffer *)a4
{
  id v8 = a3;
  v6 = [(HMIVideoCommandBufferDelegateAdapter *)self bufferWillHandleSampleBuffer];

  if (v6)
  {
    v7 = [(HMIVideoCommandBufferDelegateAdapter *)self bufferWillHandleSampleBuffer];
    ((void (**)(void, id, opaqueCMSampleBuffer *))v7)[2](v7, v8, a4);
  }
}

- (void)bufferWillFlush:(id)a3
{
  id v6 = a3;
  v4 = [(HMIVideoCommandBufferDelegateAdapter *)self bufferWillFlush];

  if (v4)
  {
    v5 = [(HMIVideoCommandBufferDelegateAdapter *)self bufferWillFlush];
    ((void (**)(void, id))v5)[2](v5, v6);
  }
}

- (id)bufferWillHandleSampleBuffer
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setBufferWillHandleSampleBuffer:(id)a3
{
}

- (id)bufferWillFlush
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setBufferWillFlush:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_bufferWillFlush, 0);
  objc_storeStrong(&self->_bufferWillHandleSampleBuffer, 0);
}

@end