@interface HMIVideoRetimerDelegateAdapter
- (id)retimerDidRetimeSampleBuffer;
- (void)retimer:(id)a3 didRetimeSampleBuffer:(opaqueCMSampleBuffer *)a4;
- (void)setRetimerDidRetimeSampleBuffer:(id)a3;
@end

@implementation HMIVideoRetimerDelegateAdapter

- (void)retimer:(id)a3 didRetimeSampleBuffer:(opaqueCMSampleBuffer *)a4
{
  id v8 = a3;
  v6 = [(HMIVideoRetimerDelegateAdapter *)self retimerDidRetimeSampleBuffer];

  if (v6)
  {
    v7 = [(HMIVideoRetimerDelegateAdapter *)self retimerDidRetimeSampleBuffer];
    ((void (**)(void, id, opaqueCMSampleBuffer *))v7)[2](v7, v8, a4);
  }
}

- (id)retimerDidRetimeSampleBuffer
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setRetimerDidRetimeSampleBuffer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end