@interface CFXFrame
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)latency;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)requestTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timestamp;
- (ARFrame)arFrame;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToFrame:(id)a3;
- (CFXFrame)initWithARFrame:(id)a3;
- (CFXFrame)initWithFrameSet:(id)a3;
- (CFXFrame)initWithPixelBuffer:(__CVBuffer *)a3 timestamp:(id *)a4;
- (PVFrameSet)pvFrameSet;
- (__CVBuffer)pixelBuffer;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setArFrame:(id)a3;
- (void)setLatency:(id *)a3;
- (void)setPixelBuffer:(__CVBuffer *)a3;
- (void)setPvFrameSet:(id)a3;
- (void)setRequestTime:(id *)a3;
- (void)setTimestamp:(id *)a3;
@end

@implementation CFXFrame

- (CFXFrame)initWithARFrame:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CFXFrame;
  v6 = [(CFXFrame *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_arFrame, a3);
    v7->_pixelBuffer = CVPixelBufferRetain((CVPixelBufferRef)[v5 capturedImage]);
    [v5 timestamp];
    CMTimeMakeWithSeconds(&v11, v8, 1000000000);
    v7->_timestamp = ($95D729B680665BEAEFA1D6FCA8238556)v11;
    uint64_t v9 = MEMORY[0x263F010E0];
    *(_OWORD *)&v7->_latency.value = *MEMORY[0x263F010E0];
    v7->_latency.epoch = *(void *)(v9 + 16);
  }

  return v7;
}

- (CFXFrame)initWithPixelBuffer:(__CVBuffer *)a3 timestamp:(id *)a4
{
  v10.receiver = self;
  v10.super_class = (Class)CFXFrame;
  v6 = [(CFXFrame *)&v10 init];
  if (v6)
  {
    *((void *)v6 + 1) = CVPixelBufferRetain(a3);
    int64_t var3 = a4->var3;
    *(_OWORD *)(v6 + 56) = *(_OWORD *)&a4->var0;
    *((void *)v6 + 9) = var3;
    uint64_t v8 = MEMORY[0x263F010E0];
    *((_OWORD *)v6 + 2) = *MEMORY[0x263F010E0];
    *((void *)v6 + 6) = *(void *)(v8 + 16);
  }
  return (CFXFrame *)v6;
}

- (CFXFrame)initWithFrameSet:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CFXFrame;
  v6 = [(CFXFrame *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_pvFrameSet, a3);
    uint64_t v8 = [v5 colorImageBuffer];
    v7->_pixelBuffer = CVPixelBufferRetain((CVPixelBufferRef)[v8 cvPixelBuffer]);

    if (v5)
    {
      [v5 presentationTimeStamp];
    }
    else
    {
      long long v11 = 0uLL;
      int64_t v12 = 0;
    }
    *(_OWORD *)&v7->_timestamp.value = v11;
    v7->_timestamp.epoch = v12;
    uint64_t v9 = MEMORY[0x263F010E0];
    *(_OWORD *)&v7->_latency.value = *MEMORY[0x263F010E0];
    v7->_latency.epoch = *(void *)(v9 + 16);
  }

  return v7;
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_pixelBuffer);
  v3.receiver = self;
  v3.super_class = (Class)CFXFrame;
  [(CFXFrame *)&v3 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(CFXFrame *)self timestamp];
  [v4 encodeCMTime:v5 forKey:@"timestamp"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CFXFrame *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(CFXFrame *)self isEqualToFrame:v4];
  }

  return v5;
}

- (BOOL)isEqualToFrame:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CFXFrame *)self pixelBuffer];
  if (v5 == (__CVBuffer *)[v4 pixelBuffer])
  {
    [(CFXFrame *)self timestamp];
    if (v4) {
      [v4 timestamp];
    }
    else {
      memset(&v8, 0, sizeof(v8));
    }
    BOOL v6 = CMTimeCompare(&time1, &v8) == 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)latency
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 32);
  return self;
}

- (void)setLatency:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_latency.epoch = a3->var3;
  *(_OWORD *)&self->_latency.value = v3;
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (void)setPixelBuffer:(__CVBuffer *)a3
{
  self->_pixelBuffer = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timestamp
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 56);
  return self;
}

- (void)setTimestamp:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_timestamp.epoch = a3->var3;
  *(_OWORD *)&self->_timestamp.value = v3;
}

- (PVFrameSet)pvFrameSet
{
  return self->_pvFrameSet;
}

- (void)setPvFrameSet:(id)a3
{
}

- (ARFrame)arFrame
{
  return self->_arFrame;
}

- (void)setArFrame:(id)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)requestTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 80);
  return self;
}

- (void)setRequestTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_requestTime.epoch = a3->var3;
  *(_OWORD *)&self->_requestTime.value = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arFrame, 0);
  objc_storeStrong((id *)&self->_pvFrameSet, 0);
}

@end