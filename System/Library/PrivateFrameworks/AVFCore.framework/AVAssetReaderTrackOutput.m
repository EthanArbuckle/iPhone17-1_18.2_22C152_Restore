@interface AVAssetReaderTrackOutput
+ (AVAssetReaderTrackOutput)assetReaderTrackOutputWithTrack:(AVAssetTrack *)track outputSettings:(NSDictionary *)outputSettings;
- (AVAssetReaderTrackOutput)init;
- (AVAssetReaderTrackOutput)initWithTrack:(AVAssetTrack *)track outputSettings:(NSDictionary *)outputSettings;
- (AVAssetTrack)track;
- (AVAudioTimePitchAlgorithm)audioTimePitchAlgorithm;
- (BOOL)_enableTrackExtractionReturningError:(id *)a3;
- (BOOL)_isAttachedToAdaptor;
- (BOOL)_trimsSampleDurations;
- (BOOL)appliesPreferredTrackTransform;
- (BOOL)limitsImageQueueCapacityToOneFrame;
- (NSDictionary)outputSettings;
- (id)_asset;
- (id)_attachedAdaptor;
- (id)_figAssetReaderExtractionOptions;
- (id)_formatDescriptions;
- (id)description;
- (id)mediaType;
- (opaqueCMSampleBuffer)_copyNextSampleBufferForAdaptor;
- (opaqueCMSampleBuffer)copyNextSampleBuffer;
- (unsigned)_getUniformMediaSubtypeIfExists;
- (void)_setAttachedAdaptor:(id)a3;
- (void)dealloc;
- (void)setAppliesPreferredTrackTransform:(BOOL)a3;
- (void)setAudioTimePitchAlgorithm:(AVAudioTimePitchAlgorithm)audioTimePitchAlgorithm;
- (void)setLimitsImageQueueCapacityToOneFrame:(BOOL)a3;
@end

@implementation AVAssetReaderTrackOutput

+ (AVAssetReaderTrackOutput)assetReaderTrackOutputWithTrack:(AVAssetTrack *)track outputSettings:(NSDictionary *)outputSettings
{
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithTrack:track outputSettings:outputSettings];
  return (AVAssetReaderTrackOutput *)v4;
}

- (AVAssetReaderTrackOutput)init
{
  return [(AVAssetReaderTrackOutput *)self initWithTrack:0 outputSettings:0];
}

- (AVAssetReaderTrackOutput)initWithTrack:(AVAssetTrack *)track outputSettings:(NSDictionary *)outputSettings
{
  v61.receiver = self;
  v61.super_class = (Class)AVAssetReaderTrackOutput;
  v7 = [(AVAssetReaderOutput *)&v61 init];
  v8 = v7;
  if (!track)
  {
    v23 = v7;
    v19 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v20 = *MEMORY[0x1E4F1C3C8];
    uint64_t v29 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v8, a2, @"invalid parameter not satisfying: %s", v24, v25, v26, v27, v28, (uint64_t)"track != nil");
    goto LABEL_22;
  }
  if (v7)
  {
    v9 = objc_alloc_init(AVAssetReaderTrackOutputInternal);
    v8->_trackOutputInternal = v9;
    if (!v9)
    {

      return 0;
    }
    CFRetain(v9);
    v8->_trackOutputInternal->track = track;
    v8->_trackOutputInternal->audioTimePitchAlgorithm = (NSString *)@"Spectral";
    uint64_t v10 = [(AVAssetTrack *)v8->_trackOutputInternal->track mediaType];
    if (outputSettings)
    {
      uint64_t v11 = v10;
      if ([(NSDictionary *)outputSettings objectForKey:@"AVVideoCleanApertureKey"]
        || [(NSDictionary *)outputSettings objectForKey:@"AVVideoPixelAspectRatioKey"])
      {
        v30 = v8;
        v19 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v20 = *MEMORY[0x1E4F1C3C8];
        v31 = (objc_class *)objc_opt_class();
        v58 = NSStringFromClass(v31);
        uint64_t v29 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v8, a2, @"%@ does not currently support AVVideoCleanApertureKey or AVVideoPixelAspectRatioKey", v32, v33, v34, v35, v36, (uint64_t)v58);
      }
      else
      {
        if (![(NSDictionary *)outputSettings objectForKey:@"AVVideoScalingModeKey"])
        {
          v60 = 0;
          v8->_trackOutputInternal->outputSettings = (AVOutputSettings *)+[AVOutputSettings _outputSettingsWithOutputSettingsDictionary:outputSettings mediaType:v11 exceptionReason:&v60];
          v12 = v8->_trackOutputInternal->outputSettings;
          if (!v12)
          {
            v44 = v8;
            v19 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v20 = *MEMORY[0x1E4F1C3C8];
            v21 = v60;
            goto LABEL_21;
          }
          if (![(NSSet *)[(AVOutputSettings *)v12 compatibleMediaTypes] containsObject:v11])
          {
            v45 = v8;
            v46 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v47 = *MEMORY[0x1E4F1C3C8];
            uint64_t v53 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v8, a2, @"Output settings are not compatible with media type %@", v48, v49, v50, v51, v52, v11);
            v54 = v46;
            uint64_t v55 = v47;
            goto LABEL_23;
          }
          if ([(AVOutputSettings *)v8->_trackOutputInternal->outputSettings willYieldCompressedSamples])
          {
            v56 = v8;
            v19 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v20 = *MEMORY[0x1E4F1C3C8];
            v21 = @"AVAssetReaderOutput does not currently support compressed output";
            goto LABEL_21;
          }
          if ([(NSDictionary *)outputSettings objectForKey:*MEMORY[0x1E4F15260]])
          {
            v13 = v8;
            v19 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v20 = *MEMORY[0x1E4F1C3C8];
            v21 = @"AVAssetReaderOutput does not support AVSampleRateConverterAudioQualityKey";
LABEL_21:
            uint64_t v29 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v8, a2, (uint64_t)v21, v14, v15, v16, v17, v18, v57);
            goto LABEL_22;
          }
          return v8;
        }
        v37 = v8;
        v19 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v20 = *MEMORY[0x1E4F1C3C8];
        v38 = (objc_class *)objc_opt_class();
        v59 = NSStringFromClass(v38);
        uint64_t v29 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v8, a2, @"%@ does not currently support AVVideoScalingModeKey", v39, v40, v41, v42, v43, (uint64_t)v59);
      }
LABEL_22:
      uint64_t v53 = v29;
      v54 = v19;
      uint64_t v55 = v20;
LABEL_23:
      objc_exception_throw((id)[v54 exceptionWithName:v55 reason:v53 userInfo:0]);
    }
  }
  return v8;
}

- (void)dealloc
{
  trackOutputInternal = self->_trackOutputInternal;
  if (trackOutputInternal)
  {

    CFRelease(self->_trackOutputInternal);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVAssetReaderTrackOutput;
  [(AVAssetReaderOutput *)&v4 dealloc];
}

- (id)description
{
  v3 = NSString;
  objc_super v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p, track = %@, outputSettings = %@>", NSStringFromClass(v4), self, -[AVAssetReaderTrackOutput track](self, "track"), -[AVAssetReaderTrackOutput outputSettings](self, "outputSettings")];
}

- (AVAssetTrack)track
{
  return self->_trackOutputInternal->track;
}

- (NSDictionary)outputSettings
{
  return [(AVOutputSettings *)self->_trackOutputInternal->outputSettings outputSettingsDictionary];
}

- (AVAudioTimePitchAlgorithm)audioTimePitchAlgorithm
{
  return self->_trackOutputInternal->audioTimePitchAlgorithm;
}

- (void)setAudioTimePitchAlgorithm:(AVAudioTimePitchAlgorithm)audioTimePitchAlgorithm
{
  if ([(AVAssetReaderOutput *)self _status] >= 1)
  {
    v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = *MEMORY[0x1E4F1C3B8];
    uint64_t v15 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"cannot be called after reading has started", v6, v7, v8, v9, v10, v26);
    uint64_t v16 = v13;
    uint64_t v17 = v14;
    goto LABEL_8;
  }
  valid = (void *)AVGetValidAudioTimePitchAlgorithms();
  if (([valid containsObject:audioTimePitchAlgorithm] & 1) == 0)
  {
    uint64_t v18 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v19 = *MEMORY[0x1E4F1C3C8];
    uint64_t v20 = objc_msgSend((id)objc_msgSend(valid, "allObjects"), "componentsJoinedByString:", @", ");
    uint64_t v15 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"audioTimePitchAlgorithm must be one of: %@", v21, v22, v23, v24, v25, v20);
    uint64_t v16 = v18;
    uint64_t v17 = v19;
LABEL_8:
    objc_exception_throw((id)[v16 exceptionWithName:v17 reason:v15 userInfo:0]);
  }
  v12 = self->_trackOutputInternal->audioTimePitchAlgorithm;
  if (v12 != audioTimePitchAlgorithm)
  {

    self->_trackOutputInternal->audioTimePitchAlgorithm = (NSString *)[(NSString *)audioTimePitchAlgorithm copy];
  }
}

- (void)_setAttachedAdaptor:(id)a3
{
  self->_trackOutputInternal->weakReferenceToAttachedAdaptor = [[AVWeakReference alloc] initWithReferencedObject:a3];
}

- (id)_attachedAdaptor
{
  return [(AVWeakReference *)self->_trackOutputInternal->weakReferenceToAttachedAdaptor referencedObject];
}

- (BOOL)_isAttachedToAdaptor
{
  return [(AVWeakReference *)self->_trackOutputInternal->weakReferenceToAttachedAdaptor referencedObject] != 0;
}

- (void)setAppliesPreferredTrackTransform:(BOOL)a3
{
  self->_trackOutputInternal->appliesPreferredTrackTransform = a3;
}

- (BOOL)appliesPreferredTrackTransform
{
  return self->_trackOutputInternal->appliesPreferredTrackTransform;
}

- (void)setLimitsImageQueueCapacityToOneFrame:(BOOL)a3
{
  if ((objc_msgSend(-[AVAssetReaderTrackOutput mediaType](self, "mediaType"), "isEqualToString:", @"vide") & 1) == 0)
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3C8];
    v13 = @"cannot use limitsImageQueueCapacityToOneFrame for non video media type";
    goto LABEL_6;
  }
  if ([(AVAssetReaderOutput *)self _status] >= 1)
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3C8];
    v13 = @"cannot be called after reading has started";
LABEL_6:
    uint64_t v14 = objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v13, v6, v7, v8, v9, v10, v15), 0);
    objc_exception_throw(v14);
  }
  self->_trackOutputInternal->limitsImageQueueCapacityToOneFrame = a3;
}

- (BOOL)limitsImageQueueCapacityToOneFrame
{
  return self->_trackOutputInternal->limitsImageQueueCapacityToOneFrame;
}

- (id)mediaType
{
  v2 = [(AVAssetReaderTrackOutput *)self track];
  return [(AVAssetTrack *)v2 mediaType];
}

- (opaqueCMSampleBuffer)copyNextSampleBuffer
{
  if ([(AVAssetReaderTrackOutput *)self _isAttachedToAdaptor])
  {
    uint64_t v10 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"cannot copy sample buffers when attached to an adaptor", v4, v5, v6, v7, v8, (uint64_t)v11.receiver), 0 reason userInfo];
    objc_exception_throw(v10);
  }
  v11.receiver = self;
  v11.super_class = (Class)AVAssetReaderTrackOutput;
  return [(AVAssetReaderOutput *)&v11 copyNextSampleBuffer];
}

- (opaqueCMSampleBuffer)_copyNextSampleBufferForAdaptor
{
  v3.receiver = self;
  v3.super_class = (Class)AVAssetReaderTrackOutput;
  return [(AVAssetReaderOutput *)&v3 copyNextSampleBuffer];
}

- (id)_asset
{
  v2 = [(AVAssetReaderTrackOutput *)self track];
  return [(AVAssetTrack *)v2 asset];
}

- (BOOL)_trimsSampleDurations
{
  if (self->_trackOutputInternal->outputSettings) {
    return 1;
  }
  id v3 = [(AVAssetReaderTrackOutput *)self mediaType];
  return [v3 isEqual:@"soun"];
}

- (id)_formatDescriptions
{
  v2 = [(AVAssetReaderTrackOutput *)self track];
  return [(AVAssetTrack *)v2 formatDescriptions];
}

- (id)_figAssetReaderExtractionOptions
{
  v28.receiver = self;
  v28.super_class = (Class)AVAssetReaderTrackOutput;
  id v4 = (id)[(NSDictionary *)[(AVAssetReaderOutput *)&v28 _figAssetReaderExtractionOptions] mutableCopy];
  BOOL v5 = [(AVAssetReaderTrackOutput *)self appliesPreferredTrackTransform];
  uint64_t v6 = (void *)MEMORY[0x1E4F32380];
  if (!v5) {
    uint64_t v6 = (void *)MEMORY[0x1E4F32388];
  }
  [v4 setObject:*v6 forKey:*MEMORY[0x1E4F32368]];
  outputSettings = self->_trackOutputInternal->outputSettings;
  if ((objc_msgSend(-[AVAssetReaderTrackOutput mediaType](self, "mediaType"), "isEqualToString:", @"vide") & 1) == 0
    && (objc_msgSend(-[AVAssetReaderTrackOutput mediaType](self, "mediaType"), "isEqualToString:", @"auxv") & 1) == 0
    && !objc_msgSend(-[AVAssetReaderTrackOutput mediaType](self, "mediaType"), "isEqualToString:", @"scen"))
  {
    if (![(AVAssetReaderTrackOutput *)self limitsImageQueueCapacityToOneFrame]) {
      return v4;
    }
    goto LABEL_30;
  }
  int v8 = objc_msgSend((id)-[AVOutputSettings frameRateConversionAlgorithm](outputSettings, "frameRateConversionAlgorithm"), "isEqualToString:", @"AVVideoFrameRateConversionAlgorithmFast");
  uint64_t v9 = (void *)MEMORY[0x1E4F34518];
  if (!v8) {
    uint64_t v9 = (void *)MEMORY[0x1E4F34520];
  }
  [v4 setObject:*v9 forKey:*MEMORY[0x1E4F34540]];
  if ([(AVOutputSettings *)outputSettings conformsToProtocol:&unk_1EE60F618])
  {
    uint64_t v10 = [(AVOutputSettings *)outputSettings fieldMode];
    if (v10) {
      [v4 setObject:v10 forKey:*MEMORY[0x1E4F32358]];
    }
  }
  id v11 = [(NSDictionary *)[(AVAssetReaderTrackOutput *)self outputSettings] objectForKey:@"AVVideoEmitSequencesAtSyncFramesOnly"];
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v24 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v25 = *MEMORY[0x1E4F1C3C8];
      uint64_t v26 = @"AVVideoEmitSequencesAtSyncFramesOnly value must be NSNumber";
      goto LABEL_32;
    }
    [v4 setObject:v11 forKey:*MEMORY[0x1E4F34530]];
  }
  id v17 = [(NSDictionary *)[(AVAssetReaderTrackOutput *)self outputSettings] objectForKey:@"AVVideoMinimumIntervalForSyncFrames"];
  if (v17) {
    [v4 setObject:v17 forKey:*MEMORY[0x1E4F34538]];
  }
  id v18 = [(NSDictionary *)[(AVAssetReaderTrackOutput *)self outputSettings] objectForKey:@"AVVideoAverageIntervalForSyncFramesKey"];
  if (v18)
  {
    id v19 = v18;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v24 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v25 = *MEMORY[0x1E4F1C3C8];
      uint64_t v26 = @"AVVideoAverageIntervalForSyncFramesKey value must be NSDictionary";
      goto LABEL_32;
    }
    [v4 setObject:v19 forKey:*MEMORY[0x1E4F34528]];
    if (v17)
    {
      uint64_t v24 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v25 = *MEMORY[0x1E4F1C3C8];
      uint64_t v26 = @"cannot use AVVideoMinimumIntervalForSyncFrames and AVVideoAverageIntervalForSyncFramesKey at the same time";
      goto LABEL_32;
    }
  }
  id v20 = [(NSDictionary *)[(AVAssetReaderTrackOutput *)self outputSettings] objectForKey:@"AVVideoDecompressionPropertiesKey"];
  uint64_t v21 = *MEMORY[0x1E4F44CB8];
  uint64_t v22 = [v20 objectForKey:*MEMORY[0x1E4F44CB8]];
  if (v22) {
    [v4 setObject:v22 forKey:v21];
  }
  if ([(AVAssetReaderTrackOutput *)self limitsImageQueueCapacityToOneFrame])
  {
    if (v11)
    {
      if ([v11 integerValue] == 1)
      {
        [v4 setObject:*MEMORY[0x1E4F1CFD0] forKey:*MEMORY[0x1E4F32360]];
        return v4;
      }
      uint64_t v24 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v25 = *MEMORY[0x1E4F1C3C8];
      uint64_t v26 = @"cannot use limitsImageQueueCapacityToOneFrame without AVVideoEmitSequencesAtSyncFramesOnly set to 1";
LABEL_32:
      uint64_t v27 = objc_msgSend(v24, "exceptionWithName:reason:userInfo:", v25, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v26, v12, v13, v14, v15, v16, (uint64_t)v28.receiver), 0);
      objc_exception_throw(v27);
    }
LABEL_30:
    uint64_t v24 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v25 = *MEMORY[0x1E4F1C3C8];
    uint64_t v26 = @"cannot use limitsImageQueueCapacityToOneFrame without AVVideoEmitSequencesAtSyncFramesOnly";
    goto LABEL_32;
  }
  return v4;
}

- (unsigned)_getUniformMediaSubtypeIfExists
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = [(AVAssetTrack *)[(AVAssetReaderTrackOutput *)self track] formatDescriptions];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unsigned int v5 = 0;
    uint64_t v6 = *(void *)v12;
LABEL_3:
    uint64_t v7 = 0;
    unsigned int v8 = v5;
    while (1)
    {
      if (*(void *)v12 != v6) {
        objc_enumerationMutation(v2);
      }
      FourCharCode MediaSubType = CMFormatDescriptionGetMediaSubType(*(CMFormatDescriptionRef *)(*((void *)&v11 + 1) + 8 * v7));
      unsigned int v5 = MediaSubType;
      if (v8)
      {
        if (v8 != MediaSubType) {
          break;
        }
      }
      ++v7;
      unsigned int v8 = MediaSubType;
      if (v4 == v7)
      {
        uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v4) {
          goto LABEL_3;
        }
        return v5;
      }
    }
  }
  return 0;
}

- (BOOL)_enableTrackExtractionReturningError:(id *)a3
{
  unsigned int v53 = -1;
  unsigned int v5 = [(AVAssetReaderOutput *)self _figAssetReader];
  uint64_t v6 = [(AVAssetTrack *)[(AVAssetReaderTrackOutput *)self track] trackID];
  id v7 = [(AVAssetReaderTrackOutput *)self _figAssetReaderExtractionOptions];
  outputSettings = self->_trackOutputInternal->outputSettings;
  if (!outputSettings)
  {
    id v17 = [(AVAssetReaderTrackOutput *)self _attachedAdaptor];
    if (!v17)
    {
      uint64_t v23 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v23) {
        uint64_t v24 = v23;
      }
      else {
        uint64_t v24 = 0;
      }
      v30 = *(uint64_t (**)(OpaqueFigAssetReader *, uint64_t, id, unsigned int *))(v24 + 24);
      if (!v30) {
        goto LABEL_31;
      }
      uint64_t v18 = v30(v5, v6, v7, &v53);
      goto LABEL_28;
    }
    goto LABEL_11;
  }
  if ((objc_msgSend(-[AVAssetReaderTrackOutput mediaType](self, "mediaType"), "isEqualToString:", @"vide") & 1) != 0
    || (objc_msgSend(-[AVAssetReaderTrackOutput mediaType](self, "mediaType"), "isEqualToString:", @"auxv") & 1) != 0
    || objc_msgSend(-[AVAssetReaderTrackOutput mediaType](self, "mediaType"), "isEqualToString:", @"scen"))
  {
    if ([(AVOutputSettings *)outputSettings willYieldCompressedSamples])
    {
      unsigned int v44 = v6;
      id v9 = v7;
      unsigned int v43 = [(AVOutputSettings *)outputSettings videoCodecType];
      uint64_t v10 = [(AVOutputSettings *)outputSettings width];
      uint64_t v11 = [(AVOutputSettings *)outputSettings height];
      uint64_t v12 = [(AVOutputSettings *)outputSettings videoEncoderSpecification];
      uint64_t v13 = [(AVOutputSettings *)outputSettings pixelTransferProperties];
      long long v14 = (void *)[(AVOutputSettings *)outputSettings videoCompressionProperties];
      if (v13)
      {
        long long v14 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v14];
        [v14 setObject:v13 forKey:*MEMORY[0x1E4F44A68]];
      }
      [(AVOutputSettings *)outputSettings minimumFrameDuration];
      uint64_t v15 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v15) {
        uint64_t v16 = v15;
      }
      else {
        uint64_t v16 = 0;
      }
      uint64_t v25 = *(uint64_t (**)(OpaqueFigAssetReader *, void, uint64_t, uint64_t, void, void, uint64_t, void *, void, long long *, id, unsigned int *))(v16 + 72);
      if (v25)
      {
        long long v46 = v51;
        *(void *)&long long v47 = v52;
        uint64_t v18 = v25(v5, v44, v10, v11, 0, v43, v12, v14, 0, &v46, v9, &v53);
        goto LABEL_28;
      }
LABEL_31:
      uint64_t v31 = 4294954514;
      if (a3) {
        goto LABEL_30;
      }
      return 0;
    }
    uint64_t v19 = [(AVOutputSettings *)outputSettings pixelBufferAttributes];
    id v20 = +[AVAssetReaderOutput _figAssetReaderVideoScalingPropertiesFromVideoSettings:outputSettings withFormatDescription:[(AVAssetReaderTrackOutput *)self _formatDescriptions]];
    [(AVOutputSettings *)outputSettings minimumFrameDuration];
    uint64_t v21 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v21) {
      uint64_t v22 = v21;
    }
    else {
      uint64_t v22 = 0;
    }
    uint64_t v26 = *(uint64_t (**)(OpaqueFigAssetReader *, uint64_t, uint64_t, id, long long *, id, unsigned int *))(v22 + 48);
    if (!v26) {
      goto LABEL_31;
    }
    long long v46 = v49;
    *(void *)&long long v47 = v50;
    uint64_t v18 = v26(v5, v6, v19, v20, &v46, v7, &v53);
LABEL_28:
    uint64_t v31 = v18;
    if (v18) {
      goto LABEL_29;
    }
LABEL_46:
    uint64_t v38 = v53;
    goto LABEL_47;
  }
  if (objc_msgSend(-[AVAssetReaderTrackOutput mediaType](self, "mediaType"), "isEqualToString:", @"soun"))
  {
    BOOL v27 = [(AVOutputSettings *)outputSettings willYieldCompressedSamples];
    objc_super v28 = [(AVAssetTrack *)[(AVAssetReaderTrackOutput *)self track] formatDescriptions];
    if ([(NSArray *)v28 count]) {
      uint64_t v29 = [(NSArray *)v28 objectAtIndex:0];
    }
    else {
      uint64_t v29 = 0;
    }
    uint64_t v48 = 0;
    long long v46 = 0u;
    long long v47 = 0u;
    uint64_t v45 = 0;
    uint64_t v39 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", AVAssetReaderGetFigAssetReaderAudioTimePitchAlgorithmForAudioTimePitchAlgorithm(self->_trackOutputInternal->audioTimePitchAlgorithm), *MEMORY[0x1E4F32328], 0);
    [(AVOutputSettings *)outputSettings getAudioStreamBasicDescription:&v46 forAudioFileTypeID:0 sourceFormatDescription:v29];
    uint64_t v40 = (void *)[(AVOutputSettings *)outputSettings copyAudioChannelLayoutForSourceFormatDescription:v29 audioChannelLayoutSize:&v45];
    uint64_t v41 = [(AVOutputSettings *)outputSettings audioOptions];
    if (v27) {
      uint64_t v42 = FigAssetReaderEnableReencodedAudioExtractionFromTrack((uint64_t)v5, v6, (uint64_t)&v46, v45, (uint64_t)v40, v41, v39, (uint64_t)v7, (uint64_t)&v53);
    }
    else {
      uint64_t v42 = FigAssetReaderEnableDecodedAudioExtractionFromTrackWithAudioOptions((uint64_t)v5, v6, (uint64_t)&v46, v45, (uint64_t)v40, v41, v39, (uint64_t)v7, (uint64_t)&v53);
    }
    uint64_t v31 = v42;
    free(v40);
    if (v31)
    {
LABEL_29:
      if (a3)
      {
LABEL_30:
        id v32 = +[AVAssetReader _errorForOSStatus:v31];
        BOOL result = 0;
        *a3 = v32;
        return result;
      }
      return 0;
    }
    goto LABEL_46;
  }
  if (objc_msgSend(-[AVAssetReaderTrackOutput mediaType](self, "mediaType"), "isEqualToString:", @"text"))
  {
    unsigned int v34 = [(AVAssetReaderTrackOutput *)self _getUniformMediaSubtypeIfExists];
    int v35 = 1634301044;
    goto LABEL_37;
  }
  if (objc_msgSend(-[AVAssetReaderTrackOutput mediaType](self, "mediaType"), "isEqualToString:", @"clcp"))
  {
    unsigned int v34 = [(AVAssetReaderTrackOutput *)self _getUniformMediaSubtypeIfExists];
    int v35 = 1664495672;
LABEL_37:
    if (v34 != v35) {
      goto LABEL_40;
    }
    id v36 = [(AVAssetReaderTrackOutput *)self _attachedAdaptor];
    if (!v36) {
      goto LABEL_40;
    }
    id v37 = v36;
    if ([(NSDictionary *)[(AVOutputSettings *)outputSettings outputSettingsDictionary] count])
    {
      goto LABEL_40;
    }
    id v17 = v37;
LABEL_11:
    uint64_t v18 = [v17 addExtractionForOutput:self figAssetReader:v5 options:v7 withOutputExtactionID:&v53];
    goto LABEL_28;
  }
LABEL_40:
  uint64_t v38 = 0xFFFFFFFFLL;
LABEL_47:
  [(AVAssetReaderOutput *)self _setExtractionID:v38];
  return 1;
}

@end