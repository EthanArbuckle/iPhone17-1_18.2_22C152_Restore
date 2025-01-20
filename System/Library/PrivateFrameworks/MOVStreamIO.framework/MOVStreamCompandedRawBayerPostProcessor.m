@interface MOVStreamCompandedRawBayerPostProcessor
- (__CVBuffer)processedPixelBufferFrom:(__CVBuffer *)a3 metadata:(id)a4 error:(id *)a5;
- (unsigned)processedPixelFormat;
@end

@implementation MOVStreamCompandedRawBayerPostProcessor

- (unsigned)processedPixelFormat
{
  if (![(MOVStreamDefaultPostProcessor *)self originalPixelFormat]) {
    return 1278226488;
  }

  return [(MOVStreamDefaultPostProcessor *)self originalPixelFormat];
}

- (__CVBuffer)processedPixelBufferFrom:(__CVBuffer *)a3 metadata:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v9 = [v8 objectForKeyedSubscript:@"RawBayerFormat"];
  uint64_t v10 = [v9 unsignedIntValue];

  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  LODWORD(v18) = 1;
  HIDWORD(v18) = [(MOVStreamDefaultPostProcessor *)self bufferCacheMode];
  v13 = +[MIOPixelBufferUtility createRawPixelBufferWithWidth:height:extendedRows:extendedPixelsPerRow:pixelFormat:bytesPerRowAlignment:planeAlignment:bufferCacheMode:](MIOPixelBufferUtility, "createRawPixelBufferWithWidth:height:extendedRows:extendedPixelsPerRow:pixelFormat:bytesPerRowAlignment:planeAlignment:bufferCacheMode:", Width, Height, 0, 0, v10, 1, v18);
  if (+[MIOPixelBufferUtility joinCompandedWarholBuffer:a3 intoCompandedBayerBuffer:v13])
  {
    if ([(MOVStreamDefaultPostProcessor *)self shouldRemovePaddingOfPixelBuffer:v13 metadata:v8])
    {
      v14 = [(MOVStreamDefaultPostProcessor *)self pixelBufferWithoutPaddingFromPixelBuffer:v13 error:a5];
      CVPixelBufferRelease(v13);
      v13 = v14;
    }
    else if ([(MOVStreamDefaultPostProcessor *)self shouldChangeBytesPerRowOfPixelBuffer:a3])
    {
      v16 = [(MOVStreamDefaultPostProcessor *)self exactBytesPerRow];
      v17 = [(MOVStreamDefaultPostProcessor *)self pixelBufferWithExactBytesPerRow:v16 fromPixelBuffer:a3 error:a5];

      CVPixelBufferRelease(v13);
      v13 = v17;
    }
  }
  else
  {
    [MEMORY[0x263F087E8] populateStreamError:a5 message:@"Error joining Warhol-Buffer for Companded-RawBayer pixel buffer." code:2];
    v13 = 0;
  }

  return v13;
}

@end