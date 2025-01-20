@interface MOVStreamConvertL010Toq8q2PostProcessor
- (__CVBuffer)processedPixelBufferFrom:(__CVBuffer *)a3 metadata:(id)a4 error:(id *)a5;
@end

@implementation MOVStreamConvertL010Toq8q2PostProcessor

- (__CVBuffer)processedPixelBufferFrom:(__CVBuffer *)a3 metadata:(id)a4 error:(id *)a5
{
  id v8 = a4;
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  pool = self->_pool;
  if (pool
    || (+[MIOPixelBufferPool createMIOPixelBufferPoolWithWidth:Width height:Height pixelFormat:1899524402 extendedPixelsPerRow:0 minBufferCount:10], v12 = (MIOPixelBufferPool *)objc_claimAutoreleasedReturnValue(), v13 = self->_pool, self->_pool = v12, v13, (pool = self->_pool) != 0))
  {
    v14 = [(MIOPixelBufferPool *)pool getPixelBuffer];
    if (+[MIOPixelBufferUtility transferL010PixelBuffer:a3 toq8q2PixelBuffer:v14])
    {
      if ([(MOVStreamDefaultPostProcessor *)self shouldRemovePaddingOfPixelBuffer:v14 metadata:v8])
      {
        v15 = [(MOVStreamDefaultPostProcessor *)self pixelBufferWithoutPaddingFromPixelBuffer:v14 error:a5];
        CVPixelBufferRelease(v14);
        v14 = v15;
      }
      else if ([(MOVStreamDefaultPostProcessor *)self shouldChangeBytesPerRowOfPixelBuffer:a3])
      {
        v17 = [(MOVStreamDefaultPostProcessor *)self exactBytesPerRow];
        v18 = [(MOVStreamDefaultPostProcessor *)self pixelBufferWithExactBytesPerRow:v17 fromPixelBuffer:v14 error:a5];

        CVPixelBufferRelease(v14);
        v14 = v18;
      }
      goto LABEL_13;
    }
    CVPixelBufferRelease(v14);
    CVPixelBufferRelease(a3);
    id v16 = [MEMORY[0x263F087E8] streamErrorWithMessage:@"Cannot convert L010 to q8q2 buffer." code:20];
  }
  else
  {
    id v16 = [MEMORY[0x263F087E8] streamErrorWithMessage:@"Cannot create pixel buffer pool for q8q2 stream." code:19];
  }
  if (a5)
  {
    id v16 = v16;
    *a5 = v16;
  }

  v14 = 0;
LABEL_13:

  return v14;
}

- (void).cxx_destruct
{
}

@end