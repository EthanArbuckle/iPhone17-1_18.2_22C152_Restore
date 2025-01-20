@interface AVCaptureDeviceFakeBiasControlRequest
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)fakeBiasCompletionTime;
- (float)fakeBias;
- (void)setFakeBias:(float)a3;
- (void)setFakeBiasCompletionTime:(id *)a3;
@end

@implementation AVCaptureDeviceFakeBiasControlRequest

- (float)fakeBias
{
  return self->_fakeBias;
}

- (void)setFakeBias:(float)a3
{
  self->_fakeBias = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)fakeBiasCompletionTime
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)((char *)self + 28);
  return self;
}

- (void)setFakeBiasCompletionTime:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)(&self->_fakeBias + 1) = *(_OWORD *)&a3->var0;
  *(void *)&self->_fakeBiasCompletionTime.flags = var3;
}

@end