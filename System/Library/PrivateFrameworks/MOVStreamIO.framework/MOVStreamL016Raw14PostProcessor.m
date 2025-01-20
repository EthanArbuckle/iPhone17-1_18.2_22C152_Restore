@interface MOVStreamL016Raw14PostProcessor
- (BOOL)l010OutputFormatRAW14L016;
- (MOVStreamL016Raw14PostProcessor)initWithOriginalPixelFormat:(unsigned int)a3 bufferCacheMode:(int)a4 l010OutputFormatRAW14L016:(BOOL)a5;
- (MOVStreamL016Raw14PostProcessor)initWithOriginalPixelFormat:(unsigned int)a3 l010OutputFormatRAW14L016:(BOOL)a4;
- (__CVBuffer)processedPixelBufferFrom:(__CVBuffer *)a3 metadata:(id)a4 error:(id *)a5;
- (unsigned)processedPixelFormat;
- (void)setL010OutputFormatRAW14L016:(BOOL)a3;
@end

@implementation MOVStreamL016Raw14PostProcessor

- (MOVStreamL016Raw14PostProcessor)initWithOriginalPixelFormat:(unsigned int)a3 l010OutputFormatRAW14L016:(BOOL)a4
{
  v9.receiver = self;
  v9.super_class = (Class)MOVStreamL016Raw14PostProcessor;
  v5 = [(MOVStreamDefaultPostProcessor *)&v9 initWithOriginalPixelFormat:*(void *)&a3];
  v6 = v5;
  if (v5)
  {
    v5->_l010OutputFormatRAW14L016 = a4;
    v7 = v5;
  }

  return v6;
}

- (MOVStreamL016Raw14PostProcessor)initWithOriginalPixelFormat:(unsigned int)a3 bufferCacheMode:(int)a4 l010OutputFormatRAW14L016:(BOOL)a5
{
  v10.receiver = self;
  v10.super_class = (Class)MOVStreamL016Raw14PostProcessor;
  v6 = [(MOVStreamDefaultPostProcessor *)&v10 initWithOriginalPixelFormat:*(void *)&a3 bufferCacheMode:*(void *)&a4];
  v7 = v6;
  if (v6)
  {
    v6->_l010OutputFormatRAW14L016 = a5;
    v8 = v6;
  }

  return v7;
}

- (unsigned)processedPixelFormat
{
  if (self->_l010OutputFormatRAW14L016) {
    return 1278226742;
  }
  else {
    return [(MOVStreamDefaultPostProcessor *)self originalPixelFormat];
  }
}

- (__CVBuffer)processedPixelBufferFrom:(__CVBuffer *)a3 metadata:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if (self->_l010OutputFormatRAW14L016)
  {
    pool = self->_pool;
    if (pool) {
      goto LABEL_4;
    }
    int Width = CVPixelBufferGetWidth(a3);
    int Height = CVPixelBufferGetHeight(a3);
    v12 = +[MIOPixelBufferPool createMIOPixelBufferPoolWithWidth:Width height:Height pixelFormat:1278226742 extendedPixelsPerRow:(int)((CVPixelBufferGetBytesPerRow(a3) >> 1) - Width) minBufferCount:10 bufferCacheMode:[(MOVStreamDefaultPostProcessor *)self bufferCacheMode]];
    v13 = self->_pool;
    self->_pool = v12;

    pool = self->_pool;
    if (pool)
    {
LABEL_4:
      v14 = [(MIOPixelBufferPool *)pool getPixelBuffer];
      +[MIOPixelBufferUtility copyFromPixelBuffer:a3 toPixelBuffer:v14 andShiftBits:4294967294];
      if ([(MOVStreamDefaultPostProcessor *)self shouldRemovePaddingOfPixelBuffer:v14 metadata:v8])
      {
        v15 = [(MOVStreamDefaultPostProcessor *)self pixelBufferWithoutPaddingFromPixelBuffer:v14 error:a5];
        CVPixelBufferRelease(v14);
        v14 = v15;
      }
      else if ([(MOVStreamDefaultPostProcessor *)self shouldChangeBytesPerRowOfPixelBuffer:a3])
      {
        v16 = [(MOVStreamDefaultPostProcessor *)self exactBytesPerRow];
        v17 = [(MOVStreamDefaultPostProcessor *)self pixelBufferWithExactBytesPerRow:v16 fromPixelBuffer:v14 error:a5];

        CVPixelBufferRelease(v14);
        v14 = v17;
      }
    }
    else
    {
      v18 = [MEMORY[0x263F087E8] streamErrorWithMessage:@"Cannot create pixel buffer pool for Non-Planar stream." code:19];
      v19 = v18;
      if (a5) {
        *a5 = v18;
      }

      v14 = 0;
    }
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)MOVStreamL016Raw14PostProcessor;
    v14 = [(MOVStreamDefaultPostProcessor *)&v21 processedPixelBufferFrom:a3 metadata:v8 error:a5];
  }

  return v14;
}

- (BOOL)l010OutputFormatRAW14L016
{
  return self->_l010OutputFormatRAW14L016;
}

- (void)setL010OutputFormatRAW14L016:(BOOL)a3
{
  self->_l010OutputFormatRAW14L016 = a3;
}

- (void).cxx_destruct
{
}

@end