@interface EspressoDataFrameImageAttachment
+ (__CVBuffer)createCVPixelBufferFromvImage:(vImage_Buffer *)a3 withPixelFormat:(unsigned int)a4;
- (int)nChannels;
- (vImage_Buffer)copyAsImageGrayscaleOrBGRA;
- (void)loadFromDict:(id)a3 frameStorage:(id)a4;
- (void)setNChannels:(int)a3;
@end

@implementation EspressoDataFrameImageAttachment

- (void)setNChannels:(int)a3
{
  self->_nChannels = a3;
}

- (int)nChannels
{
  return self->_nChannels;
}

- (void)loadFromDict:(id)a3 frameStorage:(id)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)EspressoDataFrameImageAttachment;
  [(EspressoDataFrameAttachment *)&v14 loadFromDict:v6 frameStorage:a4];
  v7 = [v6 objectForKeyedSubscript:@"shape"];
  v8 = [v6 objectForKeyedSubscript:@"row_bytes"];
  int v9 = [v8 intValue];

  p_buffer = &self->buffer;
  self->buffer.data = [(EspressoDataFrameAttachment *)self rawPointer];
  v11 = [v7 objectAtIndexedSubscript:2];
  self->_nChannels = [v11 intValue];

  v12 = [v7 objectAtIndexedSubscript:1];
  p_buffer->width = (int)[v12 intValue];

  v13 = [v7 objectAtIndexedSubscript:0];
  p_buffer->height = (int)[v13 intValue];

  p_buffer->rowBytes = v9;
}

- (vImage_Buffer)copyAsImageGrayscaleOrBGRA
{
  p_buffer = &self->buffer;
  vImagePixelCount height = self->buffer.height;
  vImagePixelCount width = self->buffer.width;
  uint64_t nChannels = self->_nChannels;
  switch(nChannels)
  {
    case 1:
      result = (vImage_Buffer *)MEMORY[0x192FF2B50](retstr, height, width, 8, 0);
      if (height)
      {
        for (uint64_t i = 0; i != height; ++i)
          result = (vImage_Buffer *)memcpy((char *)retstr->data + retstr->rowBytes * i, (char *)p_buffer->data + p_buffer->rowBytes * i, width);
      }
      break;
    case 4:
      MEMORY[0x192FF2B50](retstr, height, width, 32, 0);
      *(_DWORD *)permuteMap = 50331906;
      return (vImage_Buffer *)vImagePermuteChannels_ARGB8888(p_buffer, retstr, permuteMap, 0);
    case 3:
      MEMORY[0x192FF2B50](retstr, height, width, 32, 0);
      return (vImage_Buffer *)vImageConvert_RGB888toBGRA8888(p_buffer, 0, 0, retstr, 0, 0);
    default:
      Espresso::throw_exception_selector<Espresso::invalid_state_error,int &>("Unsupported number of channels: %d", nChannels);
  }
  return result;
}

+ (__CVBuffer)createCVPixelBufferFromvImage:(vImage_Buffer *)a3 withPixelFormat:(unsigned int)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  if (a4 != 1278226488 && a4 != 1111970369) {
    return 0;
  }
  CVPixelBufferRef pixelBuffer = 0;
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  vImagePixelCount width = a3->width;
  size_t rowBytes = a3->rowBytes;
  data = (char *)a3->data;
  vImagePixelCount height = a3->height;
  uint64_t v20 = *MEMORY[0x1E4F24D20];
  v21[0] = MEMORY[0x1E4F1CC08];
  CVReturn v12 = CVPixelBufferCreate(v7, width, height, a4, (CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1], &pixelBuffer);
  result = 0;
  if (!v12)
  {
    CVPixelBufferLockBaseAddress(pixelBuffer, 0);
    BaseAddress = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
    size_t BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
    if (a3->height)
    {
      size_t v15 = BytesPerRow;
      vImagePixelCount v16 = 0;
      char v17 = 2 * (a4 != 1278226488);
      do
      {
        memcpy(BaseAddress, data, a3->width << v17);
        ++v16;
        data += rowBytes;
        BaseAddress += v15;
      }
      while (v16 < a3->height);
    }
    CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
    return pixelBuffer;
  }
  return result;
}

@end