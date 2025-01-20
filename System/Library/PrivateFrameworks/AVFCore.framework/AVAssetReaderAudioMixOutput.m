@interface AVAssetReaderAudioMixOutput
+ (AVAssetReaderAudioMixOutput)assetReaderAudioMixOutputWithAudioTracks:(NSArray *)audioTracks audioSettings:(NSDictionary *)audioSettings;
- (AVAssetReaderAudioMixOutput)init;
- (AVAssetReaderAudioMixOutput)initWithAudioTracks:(NSArray *)audioTracks audioSettings:(NSDictionary *)audioSettings;
- (AVAudioMix)audioMix;
- (AVAudioTimePitchAlgorithm)audioTimePitchAlgorithm;
- (BOOL)_enableTrackExtractionReturningError:(id *)a3;
- (NSArray)audioTracks;
- (NSDictionary)audioSettings;
- (id)_asset;
- (id)_audioCurvesForTrack:(id)a3;
- (id)_audioEffectsParametersForTrack:(id)a3;
- (id)_audioTimePitchAlgorithmForTrack:(id)a3;
- (id)description;
- (id)mediaType;
- (opaqueMTAudioProcessingTap)_audioTapProcessorForTrack:(id)a3;
- (void)_setAudioCurves:(id)a3 forTrack:(id)a4;
- (void)_setAudioEffectsParameters:(id)a3 forTrack:(id)a4;
- (void)_setAudioTapProcessor:(opaqueMTAudioProcessingTap *)a3 forTrack:(id)a4;
- (void)_setAudioTimePitchAlgorithm:(id)a3 forTrack:(id)a4;
- (void)dealloc;
- (void)setAudioMix:(AVAudioMix *)audioMix;
- (void)setAudioTimePitchAlgorithm:(AVAudioTimePitchAlgorithm)audioTimePitchAlgorithm;
@end

@implementation AVAssetReaderAudioMixOutput

+ (AVAssetReaderAudioMixOutput)assetReaderAudioMixOutputWithAudioTracks:(NSArray *)audioTracks audioSettings:(NSDictionary *)audioSettings
{
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithAudioTracks:audioTracks audioSettings:audioSettings];
  return (AVAssetReaderAudioMixOutput *)v4;
}

- (AVAssetReaderAudioMixOutput)init
{
  return [(AVAssetReaderAudioMixOutput *)self initWithAudioTracks:0 audioSettings:0];
}

- (AVAssetReaderAudioMixOutput)initWithAudioTracks:(NSArray *)audioTracks audioSettings:(NSDictionary *)audioSettings
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  v47.receiver = self;
  v47.super_class = (Class)AVAssetReaderAudioMixOutput;
  v7 = [(AVAssetReaderOutput *)&v47 init];
  v8 = v7;
  if (!audioTracks)
  {
    v31 = v7;
    v27 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v28 = *MEMORY[0x1E4F1C3C8];
    v37 = "audioTracks != nil";
LABEL_29:
    uint64_t v30 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v8, a2, @"invalid parameter not satisfying: %s", v32, v33, v34, v35, v36, (uint64_t)v37);
    goto LABEL_26;
  }
  if (![(NSArray *)audioTracks count])
  {
    v38 = v8;
    v27 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v28 = *MEMORY[0x1E4F1C3C8];
    v37 = "[audioTracks count] >= 1";
    goto LABEL_29;
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v9 = [(NSArray *)audioTracks countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (!v9) {
    goto LABEL_15;
  }
  uint64_t v10 = v9;
  uint64_t v11 = 0;
  uint64_t v12 = *(void *)v44;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v44 != v12) {
        objc_enumerationMutation(audioTracks);
      }
      v14 = *(void **)(*((void *)&v43 + 1) + 8 * i);
      if ((objc_msgSend((id)objc_msgSend(v14, "mediaType"), "isEqualToString:", @"soun") & 1) == 0)
      {
        v20 = v8;
        v27 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v28 = *MEMORY[0x1E4F1C3C8];
        v29 = @"tracks must all have media type AVMediaTypeAudio";
        goto LABEL_25;
      }
      uint64_t v15 = [v14 asset];
      if (v11)
      {
        if (v15 != v11)
        {
          v21 = v8;
          v27 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v28 = *MEMORY[0x1E4F1C3C8];
          v29 = @"tracks must all be part of the same AVAsset";
          goto LABEL_25;
        }
      }
      else
      {
        uint64_t v11 = v15;
      }
    }
    uint64_t v10 = [(NSArray *)audioTracks countByEnumeratingWithState:&v43 objects:v48 count:16];
  }
  while (v10);
LABEL_15:
  if (v8)
  {
    v16 = objc_alloc_init(AVAssetReaderAudioMixOutputInternal);
    v8->_audioMixOutputInternal = v16;
    if (!v16)
    {

      return 0;
    }
    CFRetain(v16);
    v8->_audioMixOutputInternal->audioTracks = (NSArray *)[(NSArray *)audioTracks copyWithZone:[(AVAssetReaderAudioMixOutput *)v8 zone]];
    v8->_audioMixOutputInternal->audioCurvesForTracks = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSArray count](audioTracks, "count"));
    v8->_audioMixOutputInternal->audioTimePitchAlgorithmsForTracks = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSArray count](audioTracks, "count"));
    v8->_audioMixOutputInternal->audioTapProcessorsForTracks = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSArray count](audioTracks, "count"));
    v8->_audioMixOutputInternal->audioEffectsParametersForTracks = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSArray count](audioTracks, "count"));
    v8->_audioMixOutputInternal->audioTimePitchAlgorithm = (NSString *)@"Spectral";
    if (audioSettings)
    {
      v42 = 0;
      v8->_audioMixOutputInternal->audioOutputSettings = (AVAudioOutputSettings *)+[AVAudioOutputSettings _audioOutputSettingsWithAudioSettingsDictionary:audioSettings exceptionReason:&v42];
      audioOutputSettings = v8->_audioMixOutputInternal->audioOutputSettings;
      if (audioOutputSettings)
      {
        if (![(AVOutputSettings *)audioOutputSettings willYieldCompressedSamples])
        {
          if ([(NSDictionary *)audioSettings objectForKey:*MEMORY[0x1E4F15260]])
          {
            v18 = v8;
            v27 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v28 = *MEMORY[0x1E4F1C3C8];
            v29 = @"AVAssetReaderOutput does not support AVSampleRateConverterAudioQualityKey";
            goto LABEL_25;
          }
          return v8;
        }
        v40 = v8;
        v27 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v28 = *MEMORY[0x1E4F1C3C8];
        v29 = @"AVAssetReaderOutput does not currently support compressed output";
      }
      else
      {
        v39 = v8;
        v27 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v28 = *MEMORY[0x1E4F1C3C8];
        v29 = v42;
      }
LABEL_25:
      uint64_t v30 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v8, a2, (uint64_t)v29, v22, v23, v24, v25, v26, v41);
LABEL_26:
      objc_exception_throw((id)[v27 exceptionWithName:v28 reason:v30 userInfo:0]);
    }
  }
  return v8;
}

- (void)dealloc
{
  audioMixOutputInternal = self->_audioMixOutputInternal;
  if (audioMixOutputInternal)
  {

    CFRelease(self->_audioMixOutputInternal);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVAssetReaderAudioMixOutput;
  [(AVAssetReaderOutput *)&v4 dealloc];
}

- (id)description
{
  v3 = NSString;
  objc_super v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p, audioTracks = %@, audioSettings = %@>", NSStringFromClass(v4), self, -[AVAssetReaderAudioMixOutput audioTracks](self, "audioTracks"), -[AVAssetReaderAudioMixOutput audioSettings](self, "audioSettings")];
}

- (NSArray)audioTracks
{
  return self->_audioMixOutputInternal->audioTracks;
}

- (NSDictionary)audioSettings
{
  return [(AVAudioOutputSettings *)self->_audioMixOutputInternal->audioOutputSettings audioSettingsDictionary];
}

- (id)_audioCurvesForTrack:(id)a3
{
  if (![(NSArray *)[(AVAssetReaderAudioMixOutput *)self audioTracks] containsObject:a3])
  {
    v13 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"track must be one of the tracks used to create the receiver", v6, v7, v8, v9, v10, v14), 0 reason userInfo];
    objc_exception_throw(v13);
  }
  audioCurvesForTracks = self->_audioMixOutputInternal->audioCurvesForTracks;
  return (id)[(NSMutableDictionary *)audioCurvesForTracks objectForKey:a3];
}

- (void)_setAudioCurves:(id)a3 forTrack:(id)a4
{
  if ([(AVAssetReaderOutput *)self _status] >= 1)
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C3B8];
    v16 = @"cannot be called after reading has started";
    goto LABEL_12;
  }
  if (![(NSArray *)[(AVAssetReaderAudioMixOutput *)self audioTracks] containsObject:a4])
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C3C8];
    v16 = @"track must be one of the tracks used to create the receiver";
LABEL_12:
    v17 = objc_msgSend(v14, "exceptionWithName:reason:userInfo:", v15, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v16, v8, v9, v10, v11, v12, v18), 0);
    objc_exception_throw(v17);
  }
  audioCurvesForTracks = self->_audioMixOutputInternal->audioCurvesForTracks;
  if (a3)
  {
    [(NSMutableDictionary *)audioCurvesForTracks setObject:a3 forKey:a4];
  }
  else
  {
    [(NSMutableDictionary *)audioCurvesForTracks removeObjectForKey:a4];
  }
}

- (id)_audioEffectsParametersForTrack:(id)a3
{
  if (![(NSArray *)[(AVAssetReaderAudioMixOutput *)self audioTracks] containsObject:a3])
  {
    v13 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"track must be one of the tracks used to create the receiver", v6, v7, v8, v9, v10, v14), 0 reason userInfo];
    objc_exception_throw(v13);
  }
  audioEffectsParametersForTracks = self->_audioMixOutputInternal->audioEffectsParametersForTracks;
  return (id)[(NSMutableDictionary *)audioEffectsParametersForTracks objectForKey:a3];
}

- (void)_setAudioEffectsParameters:(id)a3 forTrack:(id)a4
{
  if ([(AVAssetReaderOutput *)self _status] >= 1)
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C3B8];
    v16 = @"cannot be called after reading has started";
    goto LABEL_12;
  }
  if (![(NSArray *)[(AVAssetReaderAudioMixOutput *)self audioTracks] containsObject:a4])
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C3C8];
    v16 = @"track must be one of the tracks used to create the receiver";
LABEL_12:
    v17 = objc_msgSend(v14, "exceptionWithName:reason:userInfo:", v15, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v16, v8, v9, v10, v11, v12, v18), 0);
    objc_exception_throw(v17);
  }
  audioEffectsParametersForTracks = self->_audioMixOutputInternal->audioEffectsParametersForTracks;
  if (a3)
  {
    [(NSMutableDictionary *)audioEffectsParametersForTracks setObject:a3 forKey:a4];
  }
  else
  {
    [(NSMutableDictionary *)audioEffectsParametersForTracks removeObjectForKey:a4];
  }
}

- (id)_audioTimePitchAlgorithmForTrack:(id)a3
{
  if (![(NSArray *)[(AVAssetReaderAudioMixOutput *)self audioTracks] containsObject:a3])
  {
    v13 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"track must be one of the tracks used to create the receiver", v6, v7, v8, v9, v10, v14), 0 reason userInfo];
    objc_exception_throw(v13);
  }
  audioTimePitchAlgorithmsForTracks = self->_audioMixOutputInternal->audioTimePitchAlgorithmsForTracks;
  return (id)[(NSMutableDictionary *)audioTimePitchAlgorithmsForTracks objectForKey:a3];
}

- (void)_setAudioTimePitchAlgorithm:(id)a3 forTrack:(id)a4
{
  if ([(AVAssetReaderOutput *)self _status] >= 1)
  {
    v17 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v18 = *MEMORY[0x1E4F1C3B8];
    v19 = @"cannot be called after reading has started";
    goto LABEL_14;
  }
  if (![(NSArray *)[(AVAssetReaderAudioMixOutput *)self audioTracks] containsObject:a4])
  {
    v17 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v18 = *MEMORY[0x1E4F1C3C8];
    v19 = @"track must be one of the tracks used to create the receiver";
    goto LABEL_14;
  }
  audioMixOutputInternal = self->_audioMixOutputInternal;
  audioTimePitchAlgorithmsForTracks = audioMixOutputInternal->audioTimePitchAlgorithmsForTracks;
  if (a3)
  {
    valid = (void *)AVGetValidAudioTimePitchAlgorithms();
    if ([valid containsObject:a3])
    {
      [(NSMutableDictionary *)audioTimePitchAlgorithmsForTracks setObject:a3 forKey:a4];
      return;
    }
    v17 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v18 = *MEMORY[0x1E4F1C3C8];
    uint64_t v21 = objc_msgSend((id)objc_msgSend(valid, "allObjects"), "componentsJoinedByString:", @", ");
    v19 = @"audioTimePitchAlgorithm must be one of: %@";
LABEL_14:
    v20 = objc_msgSend(v17, "exceptionWithName:reason:userInfo:", v18, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v19, v8, v9, v10, v11, v12, v21), 0);
    objc_exception_throw(v20);
  }
  v16 = audioMixOutputInternal->audioTimePitchAlgorithmsForTracks;
  [(NSMutableDictionary *)v16 removeObjectForKey:a4];
}

- (opaqueMTAudioProcessingTap)_audioTapProcessorForTrack:(id)a3
{
  if (![(NSArray *)[(AVAssetReaderAudioMixOutput *)self audioTracks] containsObject:a3])
  {
    v13 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"track must be one of the tracks used to create the receiver", v6, v7, v8, v9, v10, v14), 0 reason userInfo];
    objc_exception_throw(v13);
  }
  audioTapProcessorsForTracks = self->_audioMixOutputInternal->audioTapProcessorsForTracks;
  return (opaqueMTAudioProcessingTap *)[(NSMutableDictionary *)audioTapProcessorsForTracks objectForKey:a3];
}

- (void)_setAudioTapProcessor:(opaqueMTAudioProcessingTap *)a3 forTrack:(id)a4
{
  if ([(AVAssetReaderOutput *)self _status] >= 1)
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C3B8];
    v16 = @"cannot be called after reading has started";
    goto LABEL_12;
  }
  if (![(NSArray *)[(AVAssetReaderAudioMixOutput *)self audioTracks] containsObject:a4])
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C3C8];
    v16 = @"track must be one of the tracks used to create the receiver";
LABEL_12:
    v17 = objc_msgSend(v14, "exceptionWithName:reason:userInfo:", v15, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v16, v8, v9, v10, v11, v12, v18), 0);
    objc_exception_throw(v17);
  }
  audioTapProcessorsForTracks = self->_audioMixOutputInternal->audioTapProcessorsForTracks;
  if (a3)
  {
    [(NSMutableDictionary *)audioTapProcessorsForTracks setObject:a3 forKey:a4];
  }
  else
  {
    [(NSMutableDictionary *)audioTapProcessorsForTracks removeObjectForKey:a4];
  }
}

- (AVAudioMix)audioMix
{
  return self->_audioMixOutputInternal->audioMix;
}

- (void)setAudioMix:(AVAudioMix *)audioMix
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([(AVAssetReaderOutput *)self _status] >= 1)
  {
    v20 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"cannot be called after reading has started", v6, v7, v8, v9, v10, v21), 0 reason userInfo];
    objc_exception_throw(v20);
  }
  uint64_t v11 = self->_audioMixOutputInternal->audioMix;
  if (v11 != audioMix)
  {

    self->_audioMixOutputInternal->audioMix = (AVAudioMix *)[(AVAudioMix *)audioMix copyWithZone:[(AVAssetReaderAudioMixOutput *)self zone]];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v12 = [(AVAssetReaderAudioMixOutput *)self audioTracks];
    uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          id v18 = -[AVAudioMix audioMixInputParametersForTrackID:](self->_audioMixOutputInternal->audioMix, "audioMixInputParametersForTrackID:", [v17 trackID]);
          uint64_t v19 = [v18 audioTapProcessor];
          -[AVAssetReaderAudioMixOutput _setAudioCurves:forTrack:](self, "_setAudioCurves:forTrack:", [v18 _figAudioCurves], v17);
          -[AVAssetReaderAudioMixOutput _setAudioTimePitchAlgorithm:forTrack:](self, "_setAudioTimePitchAlgorithm:forTrack:", [v18 audioTimePitchAlgorithm], v17);
          [(AVAssetReaderAudioMixOutput *)self _setAudioTapProcessor:v19 forTrack:v17];
          -[AVAssetReaderAudioMixOutput _setAudioEffectsParameters:forTrack:](self, "_setAudioEffectsParameters:forTrack:", [v18 effects], v17);
        }
        uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v14);
    }
  }
}

- (AVAudioTimePitchAlgorithm)audioTimePitchAlgorithm
{
  return self->_audioMixOutputInternal->audioTimePitchAlgorithm;
}

- (void)setAudioTimePitchAlgorithm:(AVAudioTimePitchAlgorithm)audioTimePitchAlgorithm
{
  if ([(AVAssetReaderOutput *)self _status] >= 1)
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = *MEMORY[0x1E4F1C3B8];
    uint64_t v15 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"cannot be called after reading has started", v6, v7, v8, v9, v10, v26);
    v16 = v13;
    uint64_t v17 = v14;
    goto LABEL_8;
  }
  valid = (void *)AVGetValidAudioTimePitchAlgorithms();
  if (([valid containsObject:audioTimePitchAlgorithm] & 1) == 0)
  {
    id v18 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v19 = *MEMORY[0x1E4F1C3C8];
    uint64_t v20 = objc_msgSend((id)objc_msgSend(valid, "allObjects"), "componentsJoinedByString:", @", ");
    uint64_t v15 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"audioTimePitchAlgorithm must be one of: %@", v21, v22, v23, v24, v25, v20);
    v16 = v18;
    uint64_t v17 = v19;
LABEL_8:
    objc_exception_throw((id)[v16 exceptionWithName:v17 reason:v15 userInfo:0]);
  }
  uint64_t v12 = self->_audioMixOutputInternal->audioTimePitchAlgorithm;
  if (v12 != audioTimePitchAlgorithm)
  {

    self->_audioMixOutputInternal->audioTimePitchAlgorithm = (NSString *)[(NSString *)audioTimePitchAlgorithm copy];
  }
}

- (id)mediaType
{
  id v2 = [(NSArray *)[(AVAssetReaderAudioMixOutput *)self audioTracks] objectAtIndex:0];
  return (id)[v2 mediaType];
}

- (id)_asset
{
  id v2 = [(NSArray *)[(AVAssetReaderAudioMixOutput *)self audioTracks] objectAtIndex:0];
  return (id)[v2 asset];
}

- (BOOL)_enableTrackExtractionReturningError:(id *)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  unsigned int v59 = -1;
  objc_super v4 = [(AVAssetReaderAudioMixOutput *)self audioTracks];
  long long v45 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](v4, "count"));
  uint64_t v58 = 0;
  long long v56 = 0u;
  long long v57 = 0u;
  size_t v55 = 0;
  uint64_t v41 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", AVAssetReaderGetFigAssetReaderAudioTimePitchAlgorithmForAudioTimePitchAlgorithm(self->_audioMixOutputInternal->audioTimePitchAlgorithm), *MEMORY[0x1E4F32328], 0);
  v40 = [(AVAssetReaderOutput *)self _figAssetReaderExtractionOptions];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  obuint64_t j = v4;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v51 objects:v61 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v52;
    uint64_t v8 = *MEMORY[0x1E4F323D8];
    uint64_t v44 = *MEMORY[0x1E4F323C0];
    uint64_t v9 = *MEMORY[0x1E4F323D0];
    uint64_t v10 = *MEMORY[0x1E4F323C8];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v52 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", (int)objc_msgSend(v12, "trackID")), v8);
        id v14 = [(AVAssetReaderAudioMixOutput *)self _audioCurvesForTrack:v12];
        if (v14) {
          [v13 setObject:v14 forKey:v44];
        }
        id v15 = [(AVAssetReaderAudioMixOutput *)self _audioTimePitchAlgorithmForTrack:v12];
        if (v15) {
          [v13 setObject:AVAssetReaderGetFigAssetReaderAudioTimePitchAlgorithmForAudioTimePitchAlgorithm(v15) forKey:v9];
        }
        v16 = [(AVAssetReaderAudioMixOutput *)self _audioTapProcessorForTrack:v12];
        if (v16) {
          [v13 setObject:v16 forKey:v10];
        }
        id v17 = [(AVAssetReaderAudioMixOutput *)self _audioEffectsParametersForTrack:v12];
        if (v17)
        {
          id v18 = v17;
          uint64_t v19 = [v17 indexOfObjectPassingTest:&__block_literal_global_8];
          if (v19 != 0x7FFFFFFFFFFFFFFFLL) {
            objc_msgSend(v13, "setObject:forKey:", objc_msgSend((id)objc_msgSend(v18, "objectAtIndexedSubscript:", v19), "data"), @"AssetReaderSource_CinematicAudioParameters");
          }
        }
        [v45 addObject:v13];
      }
      uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v51 objects:v61 count:16];
    }
    while (v6);
  }
  audioOutputSettings = self->_audioMixOutputInternal->audioOutputSettings;
  uint64_t v21 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v22 = [(AVAssetReaderAudioMixOutput *)self audioTracks];
  uint64_t v23 = [(NSArray *)v22 countByEnumeratingWithState:&v47 objects:v60 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v48;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v48 != v25) {
          objc_enumerationMutation(v22);
        }
        objc_msgSend(v21, "addObjectsFromArray:", objc_msgSend(*(id *)(*((void *)&v47 + 1) + 8 * j), "formatDescriptions"));
      }
      uint64_t v24 = [(NSArray *)v22 countByEnumeratingWithState:&v47 objects:v60 count:16];
    }
    while (v24);
  }
  CMAudioFormatDescriptionRef formatDescriptionOut = 0;
  uint64_t v27 = CMAudioFormatDescriptionCreateSummary((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFArrayRef)v21, 0, &formatDescriptionOut);
  uint64_t v28 = formatDescriptionOut;
  if (v27)
  {
    v29 = 0;
LABEL_36:
    free(v29);
    goto LABEL_37;
  }
  if (audioOutputSettings)
  {
    [(AVOutputSettings *)audioOutputSettings willYieldCompressedSamples];
    [(AVAudioOutputSettings *)audioOutputSettings getAudioStreamBasicDescription:&v56 forAudioFileTypeID:0 sourceFormatDescription:formatDescriptionOut];
    v29 = (_DWORD *)[(AVAudioOutputSettings *)audioOutputSettings copyAudioChannelLayoutForSourceFormatDescription:formatDescriptionOut audioChannelLayoutSize:&v55];
    audioOutputSettings = (AVAudioOutputSettings *)[(AVAudioOutputSettings *)audioOutputSettings audioOptions];
  }
  else
  {
    StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(formatDescriptionOut);
    uint64_t v31 = *(void *)&StreamBasicDescription->mBitsPerChannel;
    long long v32 = *(_OWORD *)&StreamBasicDescription->mBytesPerPacket;
    long long v56 = *(_OWORD *)&StreamBasicDescription->mSampleRate;
    long long v57 = v32;
    uint64_t v58 = v31;
    v29 = AVCopyBestAudioChannelLayoutFromFormatDescription(formatDescriptionOut, &v55);
  }
  uint64_t v33 = [(AVAssetReaderOutput *)self _figAssetReader];
  size_t v34 = v55;
  uint64_t v35 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v35) {
    uint64_t v36 = v35;
  }
  else {
    uint64_t v36 = 0;
  }
  v37 = *(uint64_t (**)(OpaqueFigAssetReader *, void *, long long *, size_t, _DWORD *, AVAudioOutputSettings *, uint64_t, NSDictionary *, unsigned int *))(v36 + 88);
  if (!v37)
  {
    uint64_t v27 = 4294954514;
    goto LABEL_36;
  }
  uint64_t v27 = v37(v33, v45, &v56, v34, v29, audioOutputSettings, v41, v40, &v59);
  free(v29);
  if (!v27)
  {
    [(AVAssetReaderOutput *)self _setExtractionID:v59];
    return 1;
  }
LABEL_37:
  if (!a3) {
    return 0;
  }
  id v39 = +[AVAssetReader _errorForOSStatus:v27];
  BOOL result = 0;
  *a3 = v39;
  return result;
}

uint64_t __68__AVAssetReaderAudioMixOutput__enableTrackExtractionReturningError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_opt_class();
  return [a2 isMemberOfClass:v3];
}

@end