@interface AVAssetVariantAudioAttributes
- (AVAssetVariantAudioAttributes)initWithFigAlternateObjC:(id)a3;
- (AVAssetVariantAudioRenditionSpecificAttributes)renditionSpecificAttributesForMediaOption:(AVMediaSelectionOption *)mediaSelectionOption;
- (NSArray)formatIDs;
- (id)description;
- (void)dealloc;
@end

@implementation AVAssetVariantAudioAttributes

- (NSArray)formatIDs
{
  v2 = (void *)[(FigAlternateObjC *)self->_figAlternateObjC audioAttributes];
  return (NSArray *)[v2 formatIDs];
}

- (AVAssetVariantAudioRenditionSpecificAttributes)renditionSpecificAttributesForMediaOption:(AVMediaSelectionOption *)mediaSelectionOption
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v6, v7, v8, v9, v10, (uint64_t)"[mediaSelectionOption isKindOfClass:[AVMediaSelectionOption class]]"), 0 reason userInfo];
    objc_exception_throw(v13);
  }
  v11 = [[AVAssetVariantAudioRenditionSpecificAttributes alloc] initWithFigAlternateObjC:self->_figAlternateObjC mediaSelectionOption:mediaSelectionOption];
  return v11;
}

- (void)dealloc
{
  FigSimpleMutexDestroy();
  v3.receiver = self;
  v3.super_class = (Class)AVAssetVariantAudioAttributes;
  [(AVAssetVariantAudioAttributes *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p, formatIDs:%@>", NSStringFromClass(v4), self, -[AVAssetVariantAudioAttributes formatIDs](self, "formatIDs")];
}

- (AVAssetVariantAudioAttributes)initWithFigAlternateObjC:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVAssetVariantAudioAttributes;
  v4 = [(AVAssetVariantAudioAttributes *)&v6 init];
  if (v4)
  {
    v4->_figAlternateObjC = (FigAlternateObjC *)a3;
    v4->_mutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
  }
  return v4;
}

@end