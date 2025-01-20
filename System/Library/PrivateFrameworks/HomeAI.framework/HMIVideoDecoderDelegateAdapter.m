@interface HMIVideoDecoderDelegateAdapter
- (id)decoderDidDecodeSampleBuffer;
- (id)decoderDidFailWithError;
- (void)decoder:(id)a3 didDecodeSampleBuffer:(opaqueCMSampleBuffer *)a4;
- (void)decoder:(id)a3 didFailWithError:(id)a4;
- (void)setDecoderDidDecodeSampleBuffer:(id)a3;
- (void)setDecoderDidFailWithError:(id)a3;
@end

@implementation HMIVideoDecoderDelegateAdapter

- (void)decoder:(id)a3 didDecodeSampleBuffer:(opaqueCMSampleBuffer *)a4
{
  id v8 = a3;
  v6 = [(HMIVideoDecoderDelegateAdapter *)self decoderDidDecodeSampleBuffer];

  if (v6)
  {
    v7 = [(HMIVideoDecoderDelegateAdapter *)self decoderDidDecodeSampleBuffer];
    ((void (**)(void, id, opaqueCMSampleBuffer *))v7)[2](v7, v8, a4);
  }
}

- (void)decoder:(id)a3 didFailWithError:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [(HMIVideoDecoderDelegateAdapter *)self decoderDidFailWithError];

  if (v7)
  {
    id v8 = [(HMIVideoDecoderDelegateAdapter *)self decoderDidFailWithError];
    ((void (**)(void, id, id))v8)[2](v8, v9, v6);
  }
}

- (id)decoderDidDecodeSampleBuffer
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setDecoderDidDecodeSampleBuffer:(id)a3
{
}

- (id)decoderDidFailWithError
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setDecoderDidFailWithError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_decoderDidFailWithError, 0);
  objc_storeStrong(&self->_decoderDidDecodeSampleBuffer, 0);
}

@end