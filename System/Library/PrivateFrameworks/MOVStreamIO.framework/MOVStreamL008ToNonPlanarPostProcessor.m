@interface MOVStreamL008ToNonPlanarPostProcessor
- (__CVBuffer)processedPixelBufferFrom:(__CVBuffer *)a3 metadata:(id)a4 error:(id *)a5;
- (unint64_t)adjustedWidthForWidth:(unint64_t)a3;
@end

@implementation MOVStreamL008ToNonPlanarPostProcessor

- (unint64_t)adjustedWidthForWidth:(unint64_t)a3
{
  +[MOVStreamIOUtility bytesPerPixelForFormat:[(MOVStreamDefaultPostProcessor *)self originalPixelFormat]];
  unint64_t v5 = (unint64_t)v4;
  if (!(unint64_t)v4) {
    unint64_t v5 = 2;
  }
  return a3 / v5;
}

- (__CVBuffer)processedPixelBufferFrom:(__CVBuffer *)a3 metadata:(id)a4 error:(id *)a5
{
  id v8 = a4;
  pool = self->_pool;
  if (pool
    || (size_t Width = CVPixelBufferGetWidth(a3),
        +[MIOPixelBufferPool createMIOPixelBufferPoolWithWidth:[(MOVStreamL008ToNonPlanarPostProcessor *)self adjustedWidthForWidth:Width] height:CVPixelBufferGetHeight(a3) pixelFormat:[(MOVStreamDefaultPostProcessor *)self originalPixelFormat] extendedPixelsPerRow:0 minBufferCount:10 bufferCacheMode:[(MOVStreamDefaultPostProcessor *)self bufferCacheMode]], v11 = (MIOPixelBufferPool *)objc_claimAutoreleasedReturnValue(), v12 = self->_pool, self->_pool = v11, v12, (pool = self->_pool) != 0))
  {
    v13 = [(MIOPixelBufferPool *)pool getPixelBuffer];
    +[MIOPixelBufferUtility copyPixelBuffer:a3 toPixelBuffer:v13];
    if ([(MOVStreamDefaultPostProcessor *)self shouldRemovePaddingOfPixelBuffer:v13 metadata:v8])
    {
      v14 = [(MOVStreamDefaultPostProcessor *)self pixelBufferWithoutPaddingFromPixelBuffer:v13 error:a5];
      CVPixelBufferRelease(v13);
      v13 = v14;
    }
    else if ([(MOVStreamDefaultPostProcessor *)self shouldChangeBytesPerRowOfPixelBuffer:a3])
    {
      v15 = [(MOVStreamDefaultPostProcessor *)self exactBytesPerRow];
      v16 = [(MOVStreamDefaultPostProcessor *)self pixelBufferWithExactBytesPerRow:v15 fromPixelBuffer:v13 error:a5];

      CVPixelBufferRelease(v13);
      v13 = v16;
    }
  }
  else
  {
    v17 = [MEMORY[0x263F087E8] streamErrorWithMessage:@"Cannot create pixel buffer pool for Non-Planar stream." code:19];
    v18 = v17;
    if (a5) {
      *a5 = v17;
    }

    v13 = 0;
  }

  return v13;
}

- (void).cxx_destruct
{
}

@end