@interface AVAssetVariantAudioRenditionSpecificAttributes
- (AVAssetVariantAudioRenditionSpecificAttributes)initWithFigAlternateObjC:(id)a3 mediaSelectionOption:(id)a4;
- (BOOL)isBinaural;
- (BOOL)isDownmix;
- (BOOL)isImmersive;
- (NSInteger)channelCount;
- (double)sampleRate;
- (void)dealloc;
@end

@implementation AVAssetVariantAudioRenditionSpecificAttributes

- (NSInteger)channelCount
{
  v2 = objc_msgSend((id)-[FigAlternateObjC audioAttributes](self->_figAlternateObjC, "audioAttributes"), "channelCountForMediaOption:", -[AVMediaSelectionOption dictionary](self->_mediaSelectionOption, "dictionary"));
  return [v2 integerValue];
}

- (BOOL)isBinaural
{
  v2 = objc_msgSend((id)-[FigAlternateObjC audioAttributes](self->_figAlternateObjC, "audioAttributes"), "isBinauralMediaOption:", -[AVMediaSelectionOption dictionary](self->_mediaSelectionOption, "dictionary"));
  return [v2 BOOLValue];
}

- (BOOL)isImmersive
{
  v2 = objc_msgSend((id)-[FigAlternateObjC audioAttributes](self->_figAlternateObjC, "audioAttributes"), "isImmersiveMediaOption:", -[AVMediaSelectionOption dictionary](self->_mediaSelectionOption, "dictionary"));
  return [v2 BOOLValue];
}

- (BOOL)isDownmix
{
  v2 = objc_msgSend((id)-[FigAlternateObjC audioAttributes](self->_figAlternateObjC, "audioAttributes"), "isDownmixMediaOption:", -[AVMediaSelectionOption dictionary](self->_mediaSelectionOption, "dictionary"));
  return [v2 BOOLValue];
}

- (double)sampleRate
{
  v2 = objc_msgSend((id)-[FigAlternateObjC audioAttributes](self->_figAlternateObjC, "audioAttributes"), "sampleRateForMediaOption:", -[AVMediaSelectionOption dictionary](self->_mediaSelectionOption, "dictionary"));
  [v2 doubleValue];
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVAssetVariantAudioRenditionSpecificAttributes;
  [(AVAssetVariantAudioRenditionSpecificAttributes *)&v3 dealloc];
}

- (AVAssetVariantAudioRenditionSpecificAttributes)initWithFigAlternateObjC:(id)a3 mediaSelectionOption:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)AVAssetVariantAudioRenditionSpecificAttributes;
  v6 = [(AVAssetVariantAudioRenditionSpecificAttributes *)&v8 init];
  if (v6)
  {
    v6->_figAlternateObjC = (FigAlternateObjC *)a3;
    v6->_mediaSelectionOption = (AVMediaSelectionOption *)a4;
  }
  return v6;
}

@end