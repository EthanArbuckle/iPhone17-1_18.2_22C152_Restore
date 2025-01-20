@interface MOVStreamRawBayerPostProcessor
- (BOOL)rawBayerMSBReplication;
- (MOVStreamRawBayerPostProcessor)initWithOriginalPixelFormat:(unsigned int)a3 bufferCacheMode:(int)a4 rawBayerMSBReplication:(BOOL)a5;
- (MOVStreamRawBayerPostProcessor)initWithOriginalPixelFormat:(unsigned int)a3 rawBayerMSBReplication:(BOOL)a4;
- (__CVBuffer)processedPixelBufferFrom:(__CVBuffer *)a3 metadata:(id)a4 error:(id *)a5;
- (unsigned)processedPixelFormat;
- (void)setRawBayerMSBReplication:(BOOL)a3;
@end

@implementation MOVStreamRawBayerPostProcessor

- (MOVStreamRawBayerPostProcessor)initWithOriginalPixelFormat:(unsigned int)a3 rawBayerMSBReplication:(BOOL)a4
{
  v9.receiver = self;
  v9.super_class = (Class)MOVStreamRawBayerPostProcessor;
  v5 = [(MOVStreamDefaultPostProcessor *)&v9 initWithOriginalPixelFormat:*(void *)&a3];
  v6 = v5;
  if (v5)
  {
    v5->_rawBayerMSBReplication = a4;
    v7 = v5;
  }

  return v6;
}

- (MOVStreamRawBayerPostProcessor)initWithOriginalPixelFormat:(unsigned int)a3 bufferCacheMode:(int)a4 rawBayerMSBReplication:(BOOL)a5
{
  v10.receiver = self;
  v10.super_class = (Class)MOVStreamRawBayerPostProcessor;
  v6 = [(MOVStreamDefaultPostProcessor *)&v10 initWithOriginalPixelFormat:*(void *)&a3 bufferCacheMode:*(void *)&a4];
  v7 = v6;
  if (v6)
  {
    v6->_rawBayerMSBReplication = a5;
    v8 = v6;
  }

  return v7;
}

- (unsigned)processedPixelFormat
{
  if (![(MOVStreamDefaultPostProcessor *)self originalPixelFormat]) {
    return 1919379252;
  }

  return [(MOVStreamDefaultPostProcessor *)self originalPixelFormat];
}

- (__CVBuffer)processedPixelBufferFrom:(__CVBuffer *)a3 metadata:(id)a4 error:(id *)a5
{
  id v8 = a4;
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  uint64_t v11 = [(MOVStreamRawBayerPostProcessor *)self processedPixelFormat];
  LODWORD(v19) = 1;
  HIDWORD(v19) = [(MOVStreamDefaultPostProcessor *)self bufferCacheMode];
  v12 = +[MIOPixelBufferUtility createRawPixelBufferWithWidth:height:extendedRows:extendedPixelsPerRow:pixelFormat:bytesPerRowAlignment:planeAlignment:bufferCacheMode:](MIOPixelBufferUtility, "createRawPixelBufferWithWidth:height:extendedRows:extendedPixelsPerRow:pixelFormat:bytesPerRowAlignment:planeAlignment:bufferCacheMode:", Width, Height, 0, 0, v11, 1, v19);
  if (+[MIOPixelBufferUtility joinWarholBuffer:a3 intoBayerBuffer:v12 shiftBitsRightBy:2 msbReplication:self->_rawBayerMSBReplication])
  {
    if ([(MOVStreamDefaultPostProcessor *)self shouldRemovePaddingOfPixelBuffer:v12 metadata:v8])
    {
      v13 = [(MOVStreamDefaultPostProcessor *)self pixelBufferWithoutPaddingFromPixelBuffer:v12 error:a5];
      CVPixelBufferRelease(v12);
      v12 = v13;
    }
    else if ([(MOVStreamDefaultPostProcessor *)self shouldChangeBytesPerRowOfPixelBuffer:a3])
    {
      v17 = [(MOVStreamDefaultPostProcessor *)self exactBytesPerRow];
      v18 = [(MOVStreamDefaultPostProcessor *)self pixelBufferWithExactBytesPerRow:v17 fromPixelBuffer:a3 error:a5];

      CVPixelBufferRelease(v12);
      v12 = v18;
    }
  }
  else
  {
    v14 = [MEMORY[0x263F087E8] streamErrorWithMessage:@"Error joining Warhol-Buffer for RawBayer pixel buffer." code:2];
    v15 = v14;
    if (a5) {
      *a5 = v14;
    }

    v12 = 0;
  }

  return v12;
}

- (BOOL)rawBayerMSBReplication
{
  return self->_rawBayerMSBReplication;
}

- (void)setRawBayerMSBReplication:(BOOL)a3
{
  self->_rawBayerMSBReplication = a3;
}

@end