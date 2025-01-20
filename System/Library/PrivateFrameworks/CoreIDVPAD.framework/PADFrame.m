@interface PADFrame
+ (id)cvPixelBufferFromData:(id)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time;
- (CGSize)size;
- (NSArray)faces;
- (NSNumber)gestureToDetect;
- (PADFrame)init;
- (__CVBuffer)buffer;
- (double)timestamp;
- (unsigned)orientation;
- (void)dealloc;
- (void)setBuffer:(__CVBuffer *)a3;
- (void)setFaces:(id)a3;
- (void)setGestureToDetect:(id)a3;
- (void)setOrientation:(unsigned int)a3;
- (void)setTime:(id *)a3;
@end

@implementation PADFrame

- (PADFrame)init
{
  v3.receiver = self;
  v3.super_class = (Class)PADFrame;
  result = [(PADFrame *)&v3 init];
  if (result) {
    ++_retainedFramesCount;
  }
  return result;
}

- (void)dealloc
{
  --_retainedFramesCount;
  v2.receiver = self;
  v2.super_class = (Class)PADFrame;
  [(PADFrame *)&v2 dealloc];
}

- (__CVBuffer)buffer
{
  return (__CVBuffer *)self->_buffer;
}

- (void)setBuffer:(__CVBuffer *)a3
{
}

- (CGSize)size
{
  double Width = (double)CVPixelBufferGetWidth([(PADFrame *)self buffer]);
  double Height = (double)CVPixelBufferGetHeight([(PADFrame *)self buffer]);
  double v5 = Width;
  result.height = Height;
  result.width = v5;
  return result;
}

- (double)timestamp
{
  return (double)self->_time.value;
}

+ (id)cvPixelBufferFromData:(id)a3
{
  v18[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F04090];
  v17[0] = *MEMORY[0x263F040A0];
  v17[1] = v3;
  v18[0] = MEMORY[0x263EFFA88];
  v18[1] = MEMORY[0x263EFFA88];
  v4 = NSDictionary;
  id v5 = a3;
  CFDictionaryRef v6 = [v4 dictionaryWithObjects:v18 forKeys:v17 count:2];
  v7 = [MEMORY[0x263F00650] imageWithData:v5];

  CVPixelBufferRef v16 = 0;
  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  [v7 extent];
  size_t v10 = (unint64_t)v9;
  [v7 extent];
  CVReturn v12 = CVPixelBufferCreate(v8, v10, (unint64_t)v11, 0x42475241u, v6, &v16);
  v13 = 0;
  if (!v12)
  {
    v14 = [MEMORY[0x263F00628] context];
    [v14 render:v7 toCVPixelBuffer:v16];
    v13 = v16;
  }
  return v13;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 40);
  return self;
}

- (void)setTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_time.epoch = a3->var3;
  *(_OWORD *)&self->_time.value = v3;
}

- (NSArray)faces
{
  return self->_faces;
}

- (void)setFaces:(id)a3
{
}

- (unsigned)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(unsigned int)a3
{
  self->_orientation = a3;
}

- (NSNumber)gestureToDetect
{
  return self->_gestureToDetect;
}

- (void)setGestureToDetect:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureToDetect, 0);
  objc_storeStrong((id *)&self->_faces, 0);
  objc_storeStrong(&self->_buffer, 0);
}

@end