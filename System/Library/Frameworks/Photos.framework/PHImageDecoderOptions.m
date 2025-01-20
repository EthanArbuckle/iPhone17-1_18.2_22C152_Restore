@interface PHImageDecoderOptions
- (BOOL)allowFallbackDecoder;
- (BOOL)decodeAsHDR;
- (BOOL)highPriority;
- (BOOL)optimizeForDrawing;
- (BOOL)preferSWDecode;
- (BOOL)shouldCrop;
- (BOOL)shouldLoadGainMap;
- (BOOL)useLowMemoryMode;
- (BOOL)waitUntilComplete;
- (CGRect)normalizedCropRect;
- (CGSize)targetSize;
- (PHImageDecoderOptions)init;
- (float)hdrGain;
- (float)targetHDRHeadroom;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)contentMode;
- (int64_t)maximumLongSideLength;
- (int64_t)resizeMode;
- (void)setAllowFallbackDecoder:(BOOL)a3;
- (void)setContentMode:(int64_t)a3;
- (void)setDecodeAsHDR:(BOOL)a3;
- (void)setHdrGain:(float)a3;
- (void)setHighPriority:(BOOL)a3;
- (void)setNormalizedCropRect:(CGRect)a3;
- (void)setOptimizeForDrawing:(BOOL)a3;
- (void)setPreferSWDecode:(BOOL)a3;
- (void)setResizeMode:(int64_t)a3;
- (void)setShouldLoadGainMap:(BOOL)a3;
- (void)setTargetHDRHeadroom:(float)a3;
- (void)setTargetSize:(CGSize)a3;
- (void)setUseLowMemoryMode:(BOOL)a3;
- (void)setWaitUntilComplete:(BOOL)a3;
@end

@implementation PHImageDecoderOptions

- (void)setWaitUntilComplete:(BOOL)a3
{
  self->_waitUntilComplete = a3;
}

- (void)setTargetHDRHeadroom:(float)a3
{
  self->_targetHDRHeadroom = a3;
}

- (void)setShouldLoadGainMap:(BOOL)a3
{
  self->_shouldLoadGainMap = a3;
}

- (void)setResizeMode:(int64_t)a3
{
  self->_resizeMode = a3;
}

- (void)setOptimizeForDrawing:(BOOL)a3
{
  self->_optimizeForDrawing = a3;
}

- (void)setHdrGain:(float)a3
{
  self->_hdrGain = a3;
}

- (void)setDecodeAsHDR:(BOOL)a3
{
  self->_decodeAsHDR = a3;
}

- (void)setHighPriority:(BOOL)a3
{
  self->_highPriority = a3;
}

- (void)setTargetSize:(CGSize)a3
{
  self->_targetSize = a3;
}

- (void)setNormalizedCropRect:(CGRect)a3
{
  self->_normalizedCropRect = a3;
}

- (void)setContentMode:(int64_t)a3
{
  self->_contentMode = a3;
}

- (void)setAllowFallbackDecoder:(BOOL)a3
{
  self->_allowFallbackDecoder = a3;
}

- (PHImageDecoderOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)PHImageDecoderOptions;
  result = [(PHImageDecoderOptions *)&v3 init];
  if (result)
  {
    result->_allowFallbackDecoder = 1;
    result->_targetHDRHeadroom = 1.0;
  }
  return result;
}

- (BOOL)waitUntilComplete
{
  return self->_waitUntilComplete;
}

- (BOOL)shouldCrop
{
  if (!CGRectEqualToRect(self->_normalizedCropRect, *MEMORY[0x1E4F1DB28]))
  {
    v4.origin.x = 0.0;
    v4.origin.y = 0.0;
    v4.size.width = 1.0;
    v4.size.height = 1.0;
    if (!CGRectEqualToRect(self->_normalizedCropRect, v4)) {
      return 1;
    }
  }
  if (self->_resizeMode == 2) {
    return self->_contentMode == 1;
  }
  return 0;
}

- (BOOL)useLowMemoryMode
{
  return self->_useLowMemoryMode;
}

- (BOOL)shouldLoadGainMap
{
  return self->_shouldLoadGainMap;
}

- (int64_t)resizeMode
{
  return self->_resizeMode;
}

- (BOOL)preferSWDecode
{
  return self->_preferSWDecode;
}

- (BOOL)optimizeForDrawing
{
  return self->_optimizeForDrawing;
}

- (int64_t)maximumLongSideLength
{
  if (!self->_resizeMode) {
    return 0;
  }
  double width = self->_targetSize.width;
  if (width <= self->_targetSize.height) {
    return (uint64_t)self->_targetSize.height;
  }
  return (uint64_t)width;
}

- (BOOL)highPriority
{
  return self->_highPriority;
}

- (BOOL)allowFallbackDecoder
{
  return self->_allowFallbackDecoder;
}

- (CGSize)targetSize
{
  double width = self->_targetSize.width;
  double height = self->_targetSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGRect)normalizedCropRect
{
  double x = self->_normalizedCropRect.origin.x;
  double y = self->_normalizedCropRect.origin.y;
  double width = self->_normalizedCropRect.size.width;
  double height = self->_normalizedCropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (int64_t)contentMode
{
  return self->_contentMode;
}

- (float)hdrGain
{
  return self->_hdrGain;
}

- (float)targetHDRHeadroom
{
  return self->_targetHDRHeadroom;
}

- (BOOL)decodeAsHDR
{
  return self->_decodeAsHDR;
}

- (void)setUseLowMemoryMode:(BOOL)a3
{
  self->_useLowMemoryMode = a3;
}

- (void)setPreferSWDecode:(BOOL)a3
{
  self->_preferSWDecode = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((unsigned char *)result + 8) = self->_shouldLoadGainMap;
  *((void *)result + 4) = self->_resizeMode;
  *((unsigned char *)result + 9) = self->_optimizeForDrawing;
  *((unsigned char *)result + 10) = self->_highPriority;
  *((unsigned char *)result + 11) = self->_waitUntilComplete;
  CGPoint origin = self->_normalizedCropRect.origin;
  *(CGSize *)((char *)result + 72) = self->_normalizedCropRect.size;
  *(CGPoint *)((char *)result + 56) = origin;
  *((void *)result + 3) = self->_contentMode;
  *(CGSize *)((char *)result + 40) = self->_targetSize;
  *((unsigned char *)result + 12) = self->_allowFallbackDecoder;
  *((unsigned char *)result + 13) = self->_preferSWDecode;
  *((unsigned char *)result + 14) = self->_useLowMemoryMode;
  *((unsigned char *)result + 15) = self->_decodeAsHDR;
  *((_DWORD *)result + 4) = LODWORD(self->_targetHDRHeadroom);
  return result;
}

@end