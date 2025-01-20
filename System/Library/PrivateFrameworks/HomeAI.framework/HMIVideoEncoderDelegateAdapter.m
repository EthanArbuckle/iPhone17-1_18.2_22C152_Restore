@interface HMIVideoEncoderDelegateAdapter
- (id)encoderDidEncodeSampleBuffer;
- (id)encoderDidFailWithError;
- (void)encoder:(id)a3 didEncodeSampleBuffer:(opaqueCMSampleBuffer *)a4;
- (void)encoder:(id)a3 didFailWithError:(id)a4;
- (void)setEncoderDidEncodeSampleBuffer:(id)a3;
- (void)setEncoderDidFailWithError:(id)a3;
@end

@implementation HMIVideoEncoderDelegateAdapter

- (void)encoder:(id)a3 didEncodeSampleBuffer:(opaqueCMSampleBuffer *)a4
{
  id v8 = a3;
  v6 = [(HMIVideoEncoderDelegateAdapter *)self encoderDidEncodeSampleBuffer];

  if (v6)
  {
    v7 = [(HMIVideoEncoderDelegateAdapter *)self encoderDidEncodeSampleBuffer];
    ((void (**)(void, id, opaqueCMSampleBuffer *))v7)[2](v7, v8, a4);
  }
}

- (void)encoder:(id)a3 didFailWithError:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [(HMIVideoEncoderDelegateAdapter *)self encoderDidFailWithError];

  if (v7)
  {
    id v8 = [(HMIVideoEncoderDelegateAdapter *)self encoderDidFailWithError];
    ((void (**)(void, id, id))v8)[2](v8, v9, v6);
  }
}

- (id)encoderDidEncodeSampleBuffer
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setEncoderDidEncodeSampleBuffer:(id)a3
{
}

- (id)encoderDidFailWithError
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setEncoderDidFailWithError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_encoderDidFailWithError, 0);
  objc_storeStrong(&self->_encoderDidEncodeSampleBuffer, 0);
}

@end