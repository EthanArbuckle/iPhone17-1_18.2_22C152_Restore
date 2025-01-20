@interface HMIVideoFrameSampler
- (HMIVideoFrameSamplerDelegate)delegate;
- (void)handleSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)setDelegate:(id)a3;
@end

@implementation HMIVideoFrameSampler

- (void)handleSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  v5 = NSString;
  v6 = NSStringFromSelector(a2);
  v7 = [v5 stringWithFormat:@"You must override %@ in a subclass", v6];
  id v8 = [v3 exceptionWithName:v4 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (HMIVideoFrameSamplerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMIVideoFrameSamplerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end