@interface JFXEffectStaticPreviewOptions
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)renderTime;
- ($70930193D4F448A53BB9343C0237EB5F)renderRange;
- (BOOL)dontCache;
- (BOOL)dontCacheToDisk;
- (BOOL)dontUseThumbnailAssetWhenAvailable;
- (CGRect)renderedImageCropRect;
- (JTImage)renderBackgroundImage;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initStaticPreviewOptions;
- (id)renderPropertiesConfigurationBlock;
- (void)setDontCache:(BOOL)a3;
- (void)setDontCacheToDisk:(BOOL)a3;
- (void)setDontUseThumbnailAssetWhenAvailable:(BOOL)a3;
- (void)setRenderBackgroundImage:(id)a3;
- (void)setRenderPropertiesConfigurationBlock:(id)a3;
- (void)setRenderRange:(id *)a3;
- (void)setRenderTime:(id *)a3;
- (void)setRenderedImageCropRect:(CGRect)a3;
@end

@implementation JFXEffectStaticPreviewOptions

- (id)initStaticPreviewOptions
{
  v4.receiver = self;
  v4.super_class = (Class)JFXEffectStaticPreviewOptions;
  id result = [(JFXEffectPreviewOptions *)&v4 initPreviewOptions];
  if (result)
  {
    *(_OWORD *)((char *)result + 56) = kDefaultEffectPreviewRenderTime;
    *((void *)result + 9) = 0;
    *((_OWORD *)result + 7) = kDefaultEffectPreviewAnimationRange;
    *((_OWORD *)result + 8) = xmmword_234D62718;
    *((_OWORD *)result + 9) = xmmword_234D62728;
    long long v3 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
    *((_OWORD *)result + 5) = *MEMORY[0x263F001A8];
    *((_OWORD *)result + 6) = v3;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)JFXEffectStaticPreviewOptions;
  objc_super v4 = [(JFXEffectPreviewOptions *)&v12 copyWithZone:a3];
  objc_storeStrong((id *)v4 + 5, self->_renderBackgroundImage);
  v4[33] = self->_dontCache;
  v4[32] = self->_dontCacheToDisk;
  v4[34] = self->_dontUseThumbnailAssetWhenAvailable;
  CGSize size = self->_renderedImageCropRect.size;
  *((_OWORD *)v4 + 5) = self->_renderedImageCropRect.origin;
  *((CGSize *)v4 + 6) = size;
  int64_t epoch = self->_renderTime.epoch;
  *(_OWORD *)(v4 + 56) = *(_OWORD *)&self->_renderTime.value;
  *((void *)v4 + 9) = epoch;
  long long v8 = *(_OWORD *)&self->_renderRange.start.epoch;
  long long v7 = *(_OWORD *)&self->_renderRange.duration.timescale;
  *((_OWORD *)v4 + 7) = *(_OWORD *)&self->_renderRange.start.value;
  *((_OWORD *)v4 + 8) = v8;
  *((_OWORD *)v4 + 9) = v7;
  uint64_t v9 = MEMORY[0x237DD15A0](self->_renderPropertiesConfigurationBlock);
  v10 = (void *)*((void *)v4 + 6);
  *((void *)v4 + 6) = v9;

  return v4;
}

- (JTImage)renderBackgroundImage
{
  return self->_renderBackgroundImage;
}

- (void)setRenderBackgroundImage:(id)a3
{
}

- (BOOL)dontCacheToDisk
{
  return self->_dontCacheToDisk;
}

- (void)setDontCacheToDisk:(BOOL)a3
{
  self->_dontCacheToDisk = a3;
}

- (BOOL)dontCache
{
  return self->_dontCache;
}

- (void)setDontCache:(BOOL)a3
{
  self->_dontCache = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)renderTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 56);
  return self;
}

- (void)setRenderTime:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_renderTime.value = *(_OWORD *)&a3->var0;
  self->_renderTime.int64_t epoch = var3;
}

- ($70930193D4F448A53BB9343C0237EB5F)renderRange
{
  long long v3 = *(_OWORD *)&self[2].var1.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[2].var0.var3;
  *(_OWORD *)&retstr->var0.int64_t var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[3].var0.var0;
  return self;
}

- (void)setRenderRange:(id *)a3
{
  long long v4 = *(_OWORD *)&a3->var0.var3;
  long long v3 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_renderRange.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&self->_renderRange.start.int64_t epoch = v4;
  *(_OWORD *)&self->_renderRange.duration.timescale = v3;
}

- (BOOL)dontUseThumbnailAssetWhenAvailable
{
  return self->_dontUseThumbnailAssetWhenAvailable;
}

- (void)setDontUseThumbnailAssetWhenAvailable:(BOOL)a3
{
  self->_dontUseThumbnailAssetWhenAvailable = a3;
}

- (CGRect)renderedImageCropRect
{
  double x = self->_renderedImageCropRect.origin.x;
  double y = self->_renderedImageCropRect.origin.y;
  double width = self->_renderedImageCropRect.size.width;
  double height = self->_renderedImageCropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setRenderedImageCropRect:(CGRect)a3
{
  self->_renderedImageCropRect = a3;
}

- (id)renderPropertiesConfigurationBlock
{
  return self->_renderPropertiesConfigurationBlock;
}

- (void)setRenderPropertiesConfigurationBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_renderPropertiesConfigurationBlock, 0);
  objc_storeStrong((id *)&self->_renderBackgroundImage, 0);
}

@end