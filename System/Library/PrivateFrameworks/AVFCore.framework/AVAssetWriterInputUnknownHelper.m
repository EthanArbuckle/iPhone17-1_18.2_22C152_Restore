@interface AVAssetWriterInputUnknownHelper
+ (id)keyPathsForValuesAffectingCanPerformMultiplePasses;
- (AVAssetWriterInputUnknownHelper)initWithConfigurationState:(id)a3;
- (AVAssetWriterInputUnknownHelper)initWithMediaType:(id)a3 outputSettings:(id)a4 sourceFormatHint:(opaqueCMFormatDescription *)a5;
- (BOOL)_canAddTrackAssociationWithTrackOfInput:(id)a3 type:(id)a4 exceptionReason:(id *)a5;
- (BOOL)_validateLanguageCode:(id)a3;
- (BOOL)canAddTrackAssociationWithTrackOfInput:(id)a3 type:(id)a4;
- (BOOL)canStartRespondingToEachPassDescriptionReturningReason:(id *)a3;
- (int64_t)status;
- (void)addTrackAssociationWithTrackOfInput:(id)a3 type:(id)a4;
- (void)setAlternateGroupID:(signed __int16)a3;
- (void)setExpectsMediaDataInRealTime:(BOOL)a3;
- (void)setExtendedLanguageTag:(id)a3;
- (void)setLanguageCode:(id)a3;
- (void)setLayer:(int64_t)a3;
- (void)setMarksOutputTrackAsEnabled:(BOOL)a3;
- (void)setMaximizePowerEfficiency:(BOOL)a3;
- (void)setMediaDataLocation:(id)a3;
- (void)setMediaTimeScale:(int)a3;
- (void)setMetadata:(id)a3;
- (void)setNaturalSize:(CGSize)a3;
- (void)setPerformsMultiPassEncodingIfSupported:(BOOL)a3;
- (void)setPreferredMediaChunkAlignment:(int64_t)a3;
- (void)setPreferredMediaChunkDuration:(id *)a3;
- (void)setPreferredMediaChunkSize:(int64_t)a3;
- (void)setPreferredVolume:(float)a3;
- (void)setProvisionalAlternateGroupID:(signed __int16)a3;
- (void)setSampleReferenceBaseURL:(id)a3;
- (void)setSourcePixelBufferAttributes:(id)a3;
- (void)setTransform:(CGAffineTransform *)a3;
@end

@implementation AVAssetWriterInputUnknownHelper

- (AVAssetWriterInputUnknownHelper)initWithConfigurationState:(id)a3
{
  v19.receiver = self;
  v19.super_class = (Class)AVAssetWriterInputUnknownHelper;
  v5 = -[AVAssetWriterInputHelper initWithConfigurationState:](&v19, sel_initWithConfigurationState_);
  if (![a3 mediaType])
  {
    v7 = v5;
    v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = *MEMORY[0x1E4F1C3C8];
    v15 = "mediaType != nil";
    goto LABEL_8;
  }
  if (![a3 metadataItems])
  {
    v16 = v5;
    v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = *MEMORY[0x1E4F1C3C8];
    v15 = "[configurationState metadataItems] != nil";
    goto LABEL_8;
  }
  if (![a3 trackReferences])
  {
    v17 = v5;
    v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = *MEMORY[0x1E4F1C3C8];
    v15 = "[configurationState trackReferences] != nil";
LABEL_8:
    v18 = (void *)[v13 exceptionWithName:v14, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v5, a2, @"invalid parameter not satisfying: %s", v8, v9, v10, v11, v12, (uint64_t)v15), 0 reason userInfo];
    objc_exception_throw(v18);
  }
  return v5;
}

- (AVAssetWriterInputUnknownHelper)initWithMediaType:(id)a3 outputSettings:(id)a4 sourceFormatHint:(opaqueCMFormatDescription *)a5
{
  uint64_t v9 = objc_alloc_init(AVAssetWriterInputConfigurationState);
  [(AVAssetWriterInputConfigurationState *)v9 setMediaType:a3];
  [(AVAssetWriterInputConfigurationState *)v9 setOutputSettings:a4];
  [(AVAssetWriterInputConfigurationState *)v9 setSourceFormatHint:a5];
  long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  long long v16 = *MEMORY[0x1E4F1DAB8];
  long long v17 = v10;
  long long v18 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [(AVAssetWriterInputConfigurationState *)v9 setTransform:&v16];
  -[AVAssetWriterInputConfigurationState setMetadataItems:](v9, "setMetadataItems:", [MEMORY[0x1E4F1C978] array]);
  [(AVAssetWriterInputConfigurationState *)v9 setExpectsMediaDataInRealTime:0];
  -[AVAssetWriterInputConfigurationState setNaturalSize:](v9, "setNaturalSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  [(AVAssetWriterInputConfigurationState *)v9 setMarksOutputTrackAsEnabled:1];
  int v11 = [a3 isEqualToString:@"soun"];
  double v12 = 0.0;
  if (v11) {
    *(float *)&double v12 = 1.0;
  }
  [(AVAssetWriterInputConfigurationState *)v9 setPreferredVolume:v12];
  -[AVAssetWriterInputConfigurationState setLayer:](v9, "setLayer:", [a3 isEqualToString:@"clcp"] << 63 >> 63);
  [(AVAssetWriterInputConfigurationState *)v9 setAlternateGroupID:0];
  [(AVAssetWriterInputConfigurationState *)v9 setProvisionalAlternateGroupID:0];
  -[AVAssetWriterInputConfigurationState setTrackReferences:](v9, "setTrackReferences:", [MEMORY[0x1E4F1C9E8] dictionary]);
  long long v16 = *MEMORY[0x1E4F1F9F8];
  *(void *)&long long v17 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  [(AVAssetWriterInputConfigurationState *)v9 setPreferredMediaChunkDuration:&v16];
  [(AVAssetWriterInputConfigurationState *)v9 setPreferredMediaChunkAlignment:(int)FigGetCFPreferenceNumberWithDefault()];
  [(AVAssetWriterInputConfigurationState *)v9 setPreferredMediaChunkSize:0];
  if (([a3 isEqualToString:@"meta"] & 1) != 0
    || [a3 isEqualToString:@"auxv"])
  {
    v13 = @"AVAssetWriterInputMediaDataLocationSparselyInterleavedWithMainMediaData";
  }
  else
  {
    v13 = @"AVAssetWriterInputMediaDataLocationInterleavedWithMainMediaData";
  }
  [(AVAssetWriterInputConfigurationState *)v9 setMediaDataLocation:v13];
  [(AVAssetWriterInputConfigurationState *)v9 setMaximizePowerEfficiency:0];
  uint64_t v14 = [(AVAssetWriterInputUnknownHelper *)self initWithConfigurationState:v9];

  return v14;
}

- (int64_t)status
{
  return 0;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  v4 = [(AVAssetWriterInputHelper *)self configurationState];
  long long v5 = *(_OWORD *)&a3->c;
  v6[0] = *(_OWORD *)&a3->a;
  v6[1] = v5;
  v6[2] = *(_OWORD *)&a3->tx;
  [(AVAssetWriterInputConfigurationState *)v4 setTransform:v6];
}

- (void)setMetadata:(id)a3
{
  v4 = [(AVAssetWriterInputHelper *)self configurationState];
  [(AVAssetWriterInputConfigurationState *)v4 setMetadataItems:a3];
}

- (void)setMediaTimeScale:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  BOOL v6 = [(NSString *)[(AVAssetWriterInputHelper *)self mediaType] isEqualToString:@"soun"];
  if (v3 && v6)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    long long v10 = (objc_class *)objc_opt_class();
    long long v16 = (void *)[v8 exceptionWithName:v9, AVMethodExceptionReasonWithClassAndSelector(v10, a2, @"Cannot set a non-default media time scale on an asset writer input with media type AVMediaTypeAudio", v11, v12, v13, v14, v15, v17), 0 reason userInfo];
    objc_exception_throw(v16);
  }
  v7 = [(AVAssetWriterInputHelper *)self configurationState];
  [(AVAssetWriterInputConfigurationState *)v7 setMediaTimeScale:v3];
}

- (void)setExpectsMediaDataInRealTime:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [(AVAssetWriterInputHelper *)self configurationState];
  [(AVAssetWriterInputConfigurationState *)v4 setExpectsMediaDataInRealTime:v3];
}

- (void)setMaximizePowerEfficiency:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [(AVAssetWriterInputHelper *)self configurationState];
  [(AVAssetWriterInputConfigurationState *)v4 setMaximizePowerEfficiency:v3];
}

- (void)setNaturalSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  long long v5 = [(AVAssetWriterInputHelper *)self configurationState];
  -[AVAssetWriterInputConfigurationState setNaturalSize:](v5, "setNaturalSize:", width, height);
}

- (BOOL)_validateLanguageCode:(id)a3
{
  BOOL v3 = (void *)[MEMORY[0x1E4F1CA20] componentsFromLocaleIdentifier:a3];
  v4 = (void *)[v3 objectForKey:*MEMORY[0x1E4F1C438]];
  return [v4 length] == 2 || objc_msgSend(v4, "length") == 3;
}

- (void)setLanguageCode:(id)a3
{
  if (a3
    && [a3 length]
    && ![(AVAssetWriterInputUnknownHelper *)self _validateLanguageCode:a3])
  {
    v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3C8];
    uint64_t v9 = (objc_class *)objc_opt_class();
    uint64_t v15 = (void *)[v7 exceptionWithName:v8, AVMethodExceptionReasonWithClassAndSelector(v9, a2, @"languageCode %@ does not conform to the ISO 639-2/T language code", v10, v11, v12, v13, v14, (uint64_t)a3), 0 reason userInfo];
    objc_exception_throw(v15);
  }
  BOOL v6 = [(AVAssetWriterInputHelper *)self configurationState];
  [(AVAssetWriterInputConfigurationState *)v6 setLanguageCode:a3];
}

- (void)setExtendedLanguageTag:(id)a3
{
  if (a3
    && [a3 length]
    && ![(AVAssetWriterInputUnknownHelper *)self _validateLanguageCode:a3])
  {
    v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3C8];
    uint64_t v9 = (objc_class *)objc_opt_class();
    uint64_t v15 = (void *)[v7 exceptionWithName:v8, AVMethodExceptionReasonWithClassAndSelector(v9, a2, @"extendedLanguageTag %@ does not conform to the IETF BCP 47 (RFC 4646) language identifier", v10, v11, v12, v13, v14, (uint64_t)a3), 0 reason userInfo];
    objc_exception_throw(v15);
  }
  BOOL v6 = [(AVAssetWriterInputHelper *)self configurationState];
  [(AVAssetWriterInputConfigurationState *)v6 setExtendedLanguageTag:a3];
}

- (void)setMarksOutputTrackAsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [(AVAssetWriterInputHelper *)self configurationState];
  [(AVAssetWriterInputConfigurationState *)v4 setMarksOutputTrackAsEnabled:v3];
}

- (void)setPreferredVolume:(float)a3
{
  v4 = [(AVAssetWriterInputHelper *)self configurationState];
  *(float *)&double v5 = a3;
  [(AVAssetWriterInputConfigurationState *)v4 setPreferredVolume:v5];
}

- (void)setLayer:(int64_t)a3
{
  v4 = [(AVAssetWriterInputHelper *)self configurationState];
  [(AVAssetWriterInputConfigurationState *)v4 setLayer:a3];
}

- (void)setAlternateGroupID:(signed __int16)a3
{
  uint64_t v3 = a3;
  v4 = [(AVAssetWriterInputHelper *)self configurationState];
  [(AVAssetWriterInputConfigurationState *)v4 setAlternateGroupID:v3];
}

- (void)setProvisionalAlternateGroupID:(signed __int16)a3
{
  uint64_t v3 = a3;
  v4 = [(AVAssetWriterInputHelper *)self configurationState];
  [(AVAssetWriterInputConfigurationState *)v4 setProvisionalAlternateGroupID:v3];
}

- (void)setPerformsMultiPassEncodingIfSupported:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [(AVAssetWriterInputHelper *)self configurationState];
  [(AVAssetWriterInputConfigurationState *)v4 setPerformsMultiPassEncodingIfSupported:v3];
}

+ (id)keyPathsForValuesAffectingCanPerformMultiplePasses
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"performsMultiPassEncodingIfSupported"];
}

- (void)setSourcePixelBufferAttributes:(id)a3
{
  v4 = [(AVAssetWriterInputHelper *)self configurationState];
  [(AVAssetWriterInputConfigurationState *)v4 setSourcePixelBufferAttributes:a3];
}

- (void)setPreferredMediaChunkDuration:(id *)a3
{
  v4 = [(AVAssetWriterInputHelper *)self configurationState];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a3;
  [(AVAssetWriterInputConfigurationState *)v4 setPreferredMediaChunkDuration:&v5];
}

- (void)setPreferredMediaChunkAlignment:(int64_t)a3
{
  v4 = [(AVAssetWriterInputHelper *)self configurationState];
  [(AVAssetWriterInputConfigurationState *)v4 setPreferredMediaChunkAlignment:a3];
}

- (void)setPreferredMediaChunkSize:(int64_t)a3
{
  v4 = [(AVAssetWriterInputHelper *)self configurationState];
  [(AVAssetWriterInputConfigurationState *)v4 setPreferredMediaChunkSize:a3];
}

- (void)setMediaDataLocation:(id)a3
{
  v4 = [(AVAssetWriterInputHelper *)self configurationState];
  [(AVAssetWriterInputConfigurationState *)v4 setMediaDataLocation:a3];
}

- (void)setSampleReferenceBaseURL:(id)a3
{
  v4 = [(AVAssetWriterInputHelper *)self configurationState];
  [(AVAssetWriterInputConfigurationState *)v4 setSampleReferenceBaseURL:a3];
}

- (BOOL)_canAddTrackAssociationWithTrackOfInput:(id)a3 type:(id)a4 exceptionReason:(id *)a5
{
  if (![a4 isEqualToString:@"forc"])
  {
    if ([a4 isEqualToString:@"folw"]
      && (!-[NSString isEqualToString:](-[AVAssetWriterInputHelper mediaType](self, "mediaType"), "isEqualToString:", @"soun")|| (objc_msgSend((id)objc_msgSend(a3, "mediaType"), "isEqualToString:", @"sbtl") & 1) == 0))
    {
      uint64_t v11 = NSString;
      uint64_t v12 = @"Associations of type AVTrackAssociationTypeSelectionFollower are supported only between AVMediaTypeAudio and AVMediaTypeSubtitle tracks.";
      goto LABEL_26;
    }
    if ([a4 isEqualToString:@"chap"])
    {
      if ([(NSString *)[(AVAssetWriterInputHelper *)self mediaType] isEqualToString:@"vide"])
      {
        int v13 = 0;
      }
      else
      {
        int v13 = ![(NSString *)[(AVAssetWriterInputHelper *)self mediaType] isEqualToString:@"soun"];
      }
      if ((objc_msgSend((id)objc_msgSend(a3, "mediaType"), "isEqualToString:", @"vide") & 1) != 0
        || (objc_msgSend((id)objc_msgSend(a3, "mediaType"), "isEqualToString:", @"text") & 1) != 0)
      {
        int v15 = 0;
      }
      else
      {
        int v15 = objc_msgSend((id)objc_msgSend(a3, "mediaType"), "isEqualToString:", @"meta") ^ 1;
      }
      if ((v13 | v15) == 1)
      {
        uint64_t v11 = NSString;
        uint64_t v12 = @"Associations of type AVTrackAssociationTypeChapterList are supported only between (AVMediaTypeVideo/AVMediaTypeAudio) and (AVMediaTypeVideo/AVMediaTypeMetadata/AVMediaTypeText) tracks.";
        goto LABEL_26;
      }
    }
    else
    {
      if ([a4 isEqualToString:@"cdsc"]
        && ![(NSString *)[(AVAssetWriterInputHelper *)self mediaType] isEqualToString:@"meta"])
      {
        uint64_t v11 = NSString;
        uint64_t v12 = @"Associations of type AVTrackAssociationTypeMetadataReferent are supported only between tracks of mediaType AVMediaTypeMetadata and other tracks.";
        goto LABEL_26;
      }
      if ([a4 length] != 4)
      {
        uint64_t v14 = (void *)[NSString stringWithFormat:@"trackAssociationType %@ must be 4 characters long.", a4];
        goto LABEL_27;
      }
    }
LABEL_30:
    uint64_t v14 = 0;
    BOOL v16 = 1;
    if (!a5) {
      return v16;
    }
    goto LABEL_28;
  }
  uint64_t v9 = [(AVAssetWriterInputHelper *)self mediaType];
  uint64_t v10 = (void *)[a3 mediaType];
  if (([(NSString *)v9 isEqualToString:@"sbtl"]
     || [(NSString *)v9 isEqualToString:@"text"])
    && (([v10 isEqualToString:@"sbtl"] & 1) != 0
     || ([v10 isEqualToString:@"text"] & 1) != 0))
  {
    goto LABEL_30;
  }
  uint64_t v11 = NSString;
  uint64_t v12 = @"Associations of type AVTrackAssociationTypeForcedSubtitlesOnly are supported only between tracks with media type AVMediaTypeSubtitle or AVMediaTypeText.";
LABEL_26:
  uint64_t v14 = objc_msgSend(v11, "stringWithFormat:", v12, v18);
LABEL_27:
  BOOL v16 = 0;
  if (a5) {
LABEL_28:
  }
    *a5 = v14;
  return v16;
}

- (BOOL)canAddTrackAssociationWithTrackOfInput:(id)a3 type:(id)a4
{
  return [(AVAssetWriterInputUnknownHelper *)self _canAddTrackAssociationWithTrackOfInput:a3 type:a4 exceptionReason:0];
}

- (void)addTrackAssociationWithTrackOfInput:(id)a3 type:(id)a4
{
  uint64_t v22 = 0;
  if (![(AVAssetWriterInputUnknownHelper *)self _canAddTrackAssociationWithTrackOfInput:a3 type:a4 exceptionReason:&v22])
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v13 = *MEMORY[0x1E4F1C3C8];
    uint64_t v14 = (objc_class *)objc_opt_class();
    v20 = objc_msgSend(v12, "exceptionWithName:reason:userInfo:", v13, AVMethodExceptionReasonWithClassAndSelector(v14, a2, v22, v15, v16, v17, v18, v19, v21), 0);
    objc_exception_throw(v20);
  }
  uint64_t v8 = [(AVAssetWriterInputHelper *)self configurationState];
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", -[AVAssetWriterInputConfigurationState trackReferences](v8, "trackReferences"));
  uint64_t v10 = [v9 objectForKey:a4];
  if (v10)
  {
    uint64_t v11 = (void *)[MEMORY[0x1E4F1CA48] arrayWithArray:v10];
    [v11 addObject:a3];
  }
  else
  {
    uint64_t v11 = (void *)[MEMORY[0x1E4F1C978] arrayWithObject:a3];
  }
  [v9 setObject:v11 forKey:a4];
  [(AVAssetWriterInputConfigurationState *)v8 setTrackReferences:v9];
}

- (BOOL)canStartRespondingToEachPassDescriptionReturningReason:(id *)a3
{
  if (a3) {
    *a3 = @"cannot be called before attaching to an instance of AVAssetWriter and calling -startWriting on this attached asset writer";
  }
  return 0;
}

@end