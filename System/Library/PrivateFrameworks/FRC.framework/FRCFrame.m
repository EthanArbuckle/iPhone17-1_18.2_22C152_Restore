@interface FRCFrame
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)presentationTimeStamp;
- (FRCFrame)initWithBuffer:(__CVBuffer *)a3 presentationTimeStamp:(id *)a4;
- (FRCFrame)initWithBuffer:(__CVBuffer *)a3 presentationTimeStamp:(id *)a4 info:(id)a5;
- (NSDictionary)info;
- (__CVBuffer)buffer;
- (void)dealloc;
- (void)setPresentationTimeStamp:(id *)a3;
@end

@implementation FRCFrame

- (FRCFrame)initWithBuffer:(__CVBuffer *)a3 presentationTimeStamp:(id *)a4
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a4;
  return [(FRCFrame *)self initWithBuffer:a3 presentationTimeStamp:&v5 info:0];
}

- (FRCFrame)initWithBuffer:(__CVBuffer *)a3 presentationTimeStamp:(id *)a4 info:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)FRCFrame;
  v10 = [(FRCFrame *)&v13 init];
  if (v10)
  {
    *((void *)v10 + 1) = CVPixelBufferRetain(a3);
    int64_t var3 = a4->var3;
    *(_OWORD *)(v10 + 24) = *(_OWORD *)&a4->var0;
    *((void *)v10 + 5) = var3;
    objc_storeStrong((id *)v10 + 2, a5);
  }

  return (FRCFrame *)v10;
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_buffer);
  v3.receiver = self;
  v3.super_class = (Class)FRCFrame;
  [(FRCFrame *)&v3 dealloc];
}

- (__CVBuffer)buffer
{
  return self->_buffer;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)presentationTimeStamp
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[1];
  return self;
}

- (void)setPresentationTimeStamp:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_presentationTimeStamp.epoch = a3->var3;
  *(_OWORD *)&self->_presentationTimeStamp.value = v3;
}

- (NSDictionary)info
{
  return self->_info;
}

- (void).cxx_destruct
{
}

@end