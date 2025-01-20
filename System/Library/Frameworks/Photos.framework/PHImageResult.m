@interface PHImageResult
- (BOOL)containsValidData;
- (BOOL)isDegraded;
- (BOOL)isDerivedFromDeferredPreview;
- (BOOL)isPlaceholder;
- (CGImage)imageRef;
- (NSNumber)exifOrientation;
- (NSString)uniformTypeIdentifier;
- (id)allowedInfoKeys;
- (id)imageData;
- (id)imageURL;
- (id)sanitizedInfoDictionary;
- (int64_t)uiOrientation;
- (void)dealloc;
- (void)setDegraded:(BOOL)a3;
- (void)setExifOrientation:(id)a3;
- (void)setHighDynamicRangeGainMap:(__CVBuffer *)a3 orientation:(unsigned int)a4 averagePixelLuminance:(id)a5;
- (void)setImageData:(id)a3;
- (void)setImageRef:(CGImage *)a3;
- (void)setImageURL:(id)a3;
- (void)setIsDerivedFromDeferredPreview:(BOOL)a3;
- (void)setIsPlaceholder:(BOOL)a3;
- (void)setUniformTypeIdentifier:(id)a3;
@end

@implementation PHImageResult

- (CGImage)imageRef
{
  return self->_imageRef;
}

- (BOOL)containsValidData
{
  if (self->_imageRef) {
    return 1;
  }
  v4 = [(PHImageResult *)self imageURL];
  if (v4)
  {
    BOOL v2 = 1;
  }
  else
  {
    v5 = [(PHImageResult *)self imageData];
    BOOL v2 = v5 != 0;
  }
  return v2;
}

- (id)imageURL
{
  return (id)[(NSMutableDictionary *)self->super._mutableInfo objectForKeyedSubscript:@"PHImageFileURLKey"];
}

- (id)imageData
{
  return (id)[(NSMutableDictionary *)self->super._mutableInfo objectForKeyedSubscript:@"PHImageFileDataKey"];
}

- (BOOL)isDegraded
{
  return self->_degraded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniformTypeIdentifier, 0);

  objc_storeStrong((id *)&self->_exifOrientation, 0);
}

- (void)dealloc
{
  CGImageRelease(self->_imageRef);
  v3.receiver = self;
  v3.super_class = (Class)PHImageResult;
  [(PHImageResult *)&v3 dealloc];
}

- (void)setImageRef:(CGImage *)a3
{
  self->_imageRef = a3;
}

- (id)sanitizedInfoDictionary
{
  v7.receiver = self;
  v7.super_class = (Class)PHImageResult;
  objc_super v3 = [(PHCompositeMediaResult *)&v7 sanitizedInfoDictionary];
  v4 = objc_msgSend(NSNumber, "numberWithBool:", -[PHImageResult isDegraded](self, "isDegraded"));
  [v3 setObject:v4 forKeyedSubscript:@"PHImageResultIsDegradedKey"];

  if ([(PHImageResult *)self isPlaceholder]) {
    [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"PHImageResultIsPlaceholderKey"];
  }
  if ([(PHImageResult *)self isDerivedFromDeferredPreview]) {
    [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"PHImageResultIsDerivedFromDeferredPreviewKey"];
  }
  v5 = [(PHImageResult *)self uniformTypeIdentifier];
  [v3 setObject:v5 forKeyedSubscript:@"PHImageFileUTIKey"];

  return v3;
}

- (BOOL)isPlaceholder
{
  return self->_isPlaceholder;
}

- (NSString)uniformTypeIdentifier
{
  return self->_uniformTypeIdentifier;
}

- (BOOL)isDerivedFromDeferredPreview
{
  return self->_isDerivedFromDeferredPreview;
}

- (void)setUniformTypeIdentifier:(id)a3
{
}

- (void)setExifOrientation:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_exifOrientation, a3);
  if (v6)
  {
    [(NSNumber *)self->_exifOrientation intValue];
    v5 = [NSNumber numberWithInteger:PLImageOrientationFromExifOrientation()];
    [(NSMutableDictionary *)self->super._mutableInfo setObject:v5 forKeyedSubscript:@"PHImageFileOrientationKey"];
  }
  else
  {
    [(NSMutableDictionary *)self->super._mutableInfo removeObjectForKey:@"PHImageFileOrientationKey"];
  }
}

- (id)allowedInfoKeys
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__PHImageResult_allowedInfoKeys__block_invoke;
  block[3] = &unk_1E5848578;
  block[4] = self;
  if (allowedInfoKeys_onceToken_17431 != -1) {
    dispatch_once(&allowedInfoKeys_onceToken_17431, block);
  }
  return (id)allowedInfoKeys_allowedKeys_17432;
}

- (void)setDegraded:(BOOL)a3
{
  self->_degraded = a3;
}

void __32__PHImageResult_allowedInfoKeys__block_invoke(uint64_t a1)
{
  v8[9] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F1CA80]);
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)PHImageResult;
  objc_super v3 = objc_msgSendSuper2(&v7, sel_allowedInfoKeys);
  v4 = (void *)[v2 initWithSet:v3];

  v8[0] = @"PHImageResultIsDegradedKey";
  v8[1] = @"PHImageResultIsPlaceholderKey";
  v8[2] = @"PHImageFileURLKey";
  v8[3] = @"PHImageFileDataKey";
  v8[4] = @"PHImageFileOrientationKey";
  v8[5] = @"PHImageFileUTIKey";
  v8[6] = @"PHImageFileHighDynamicRangeGainMapKey";
  v8[7] = @"PHImageFileHighDynamicRangeGainMapOrientationKey";
  v8[8] = @"PHImageFileHighDynamicRangeGainMapValueKey";
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:9];
  [v4 addObjectsFromArray:v5];

  id v6 = (void *)allowedInfoKeys_allowedKeys_17432;
  allowedInfoKeys_allowedKeys_17432 = (uint64_t)v4;
}

- (NSNumber)exifOrientation
{
  return self->_exifOrientation;
}

- (void)setIsPlaceholder:(BOOL)a3
{
  self->_isPlaceholder = a3;
}

- (void)setIsDerivedFromDeferredPreview:(BOOL)a3
{
  self->_isDerivedFromDeferredPreview = a3;
}

- (int64_t)uiOrientation
{
  id v2 = [(NSMutableDictionary *)self->super._mutableInfo objectForKeyedSubscript:@"PHImageFileOrientationKey"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setImageData:(id)a3
{
}

- (void)setImageURL:(id)a3
{
}

- (void)setHighDynamicRangeGainMap:(__CVBuffer *)a3 orientation:(unsigned int)a4 averagePixelLuminance:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  v8 = NSNumber;
  id v11 = a5;
  v9 = [v8 numberWithUnsignedInt:v5];
  [(NSMutableDictionary *)self->super._mutableInfo setObject:v9 forKeyedSubscript:@"PHImageFileHighDynamicRangeGainMapOrientationKey"];

  v10 = (void *)[MEMORY[0x1E4F8CC38] createImageRefFromAuxiliaryImagePixelBuffer:a3 applyingOrientation:v5 scaleFactor:1.0];
  [(NSMutableDictionary *)self->super._mutableInfo setObject:v10 forKeyedSubscript:@"PHImageFileHighDynamicRangeGainMapKey"];

  [(NSMutableDictionary *)self->super._mutableInfo setObject:v11 forKeyedSubscript:@"PHImageFileHighDynamicRangeGainMapValueKey"];
}

@end