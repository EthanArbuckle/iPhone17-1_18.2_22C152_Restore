@interface PADAVFrame
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timestamp;
- (id)pixelBuffer;
- (void)setPixelBuffer:(id)a3;
- (void)setTimestamp:(id *)a3;
@end

@implementation PADAVFrame

- (id)pixelBuffer
{
  id WeakRetained = objc_loadWeakRetained(&self->_pixelBuffer);
  return WeakRetained;
}

- (void)setPixelBuffer:(id)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timestamp
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)&self->var3;
  return self;
}

- (void)setTimestamp:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_timestamp.epoch = a3->var3;
  *(_OWORD *)&self->_timestamp.value = v3;
}

- (void).cxx_destruct
{
}

@end