@interface AVMediaSelectionTrackOption
- (AVMediaSelectionTrackOption)initWithAsset:(id)a3 group:(id)a4 dictionary:(id)a5;
- (BOOL)displaysNonForcedSubtitles;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPlayable;
- (id)_audioCompositionPresetIndex;
- (id)_audioCompositionPresetIndexesForFallbackIDs;
- (id)_groupID;
- (id)_track;
- (id)associatedMediaSelectionOptionInMediaSelectionGroup:(id)a3;
- (id)availableMetadataFormats;
- (id)commonMetadata;
- (id)dictionary;
- (id)group;
- (id)locale;
- (id)mediaSubTypes;
- (id)mediaType;
- (id)metadataForFormat:(id)a3;
- (id)track;
- (int)trackID;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation AVMediaSelectionTrackOption

- (AVMediaSelectionTrackOption)initWithAsset:(id)a3 group:(id)a4 dictionary:(id)a5
{
  v13.receiver = self;
  v13.super_class = (Class)AVMediaSelectionTrackOption;
  v8 = [(AVMediaSelectionOption *)&v13 initWithGroup:a4];
  v9 = v8;
  if (v8)
  {
    if (a3 && a4 && a5)
    {
      v8->_dictionary = (NSDictionary *)[a5 copy];
      v9->_groupID = (id)[a4 _groupID];
      v9->_weakReferenceToGroup = (AVWeakReference *)(id)[a4 _weakReference];
      v10 = (void *)[a5 objectForKey:*MEMORY[0x1E4F347A0]];
      v11 = (void *)[a5 objectForKey:*MEMORY[0x1E4F34768]];
      if ([v11 count]) {
        v10 = (void *)[v11 objectAtIndex:0];
      }
      v9->_track = (AVAssetTrack *)(id)objc_msgSend(a3, "trackWithTrackID:", objc_msgSend(v10, "intValue"));
      v9->_displaysNonForcedSubtitles = objc_msgSend((id)objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E4F34758]), "BOOLValue");
      v9->_audioCompositionPresetIndex = (NSNumber *)objc_msgSend((id)objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E4F34740]), "copy");
      v9->_audioCompositionPresetIndexesForFallbackIDs = (NSArray *)objc_msgSend((id)objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E4F34748]), "copy");
    }
    else
    {

      return 0;
    }
  }
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVMediaSelectionTrackOption;
  [(AVMediaSelectionOption *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_6:
      LOBYTE(v5) = 0;
      return v5;
    }
    BOOL v5 = -[AVAssetTrack isEqual:](self->_track, "isEqual:", [a3 track]);
    if (v5)
    {
      int displaysNonForcedSubtitles = self->_displaysNonForcedSubtitles;
      if (displaysNonForcedSubtitles != [a3 displaysNonForcedSubtitles]) {
        goto LABEL_6;
      }
      audioCompositionPresetIndex = self->_audioCompositionPresetIndex;
      if (audioCompositionPresetIndex != (NSNumber *)[a3 _audioCompositionPresetIndex]) {
        goto LABEL_6;
      }
      int v8 = objc_msgSend(-[NSArray firstObject](self->_audioCompositionPresetIndexesForFallbackIDs, "firstObject"), "intValue");
      LOBYTE(v5) = v8 == objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "_audioCompositionPresetIndexesForFallbackIDs"), "firstObject"), "intValue");
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3 = [(AVAssetTrack *)self->_track hash] ^ self->_displaysNonForcedSubtitles;
  NSInteger v4 = [(NSNumber *)self->_audioCompositionPresetIndex integerValue];
  return v3 ^ v4 ^ [(NSArray *)self->_audioCompositionPresetIndexesForFallbackIDs hash];
}

- (id)dictionary
{
  return self->_dictionary;
}

- (id)group
{
  return [(AVWeakReference *)self->_weakReferenceToGroup referencedObject];
}

- (id)_groupID
{
  return self->_groupID;
}

- (BOOL)displaysNonForcedSubtitles
{
  return self->_displaysNonForcedSubtitles;
}

- (id)_audioCompositionPresetIndex
{
  return self->_audioCompositionPresetIndex;
}

- (id)_audioCompositionPresetIndexesForFallbackIDs
{
  return self->_audioCompositionPresetIndexesForFallbackIDs;
}

- (id)mediaType
{
  return [(AVAssetTrack *)self->_track mediaType];
}

- (id)_track
{
  return self->_track;
}

- (id)mediaSubTypes
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = [(AVMediaSelectionOption *)self fallbackIDs];
  if (v3)
  {
    NSInteger v4 = v3;
    BOOL v5 = (NSArray *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v25 != v8) {
            objc_enumerationMutation(v4);
          }
          v10 = -[AVAssetTrack formatDescriptions](-[AVAsset trackWithTrackID:](-[AVAssetTrack asset](self->_track, "asset"), "trackWithTrackID:", [*(id *)(*((void *)&v24 + 1) + 8 * i) unsignedIntValue]), "formatDescriptions");
          if (v10) {
            [(NSArray *)v5 addObjectsFromArray:v10];
          }
        }
        uint64_t v7 = [v4 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v7);
    }
  }
  else
  {
    BOOL v5 = [(AVAssetTrack *)self->_track formatDescriptions];
  }
  v11 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v12 = [(NSArray *)v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v5);
        }
        v16 = *(const void **)(*((void *)&v20 + 1) + 8 * j);
        CFTypeID v17 = CFGetTypeID(v16);
        if (v17 == CMFormatDescriptionGetTypeID())
        {
          uint64_t v18 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)v16)];
          if (([v11 containsObject:v18] & 1) == 0) {
            [v11 addObject:v18];
          }
        }
      }
      uint64_t v13 = [(NSArray *)v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v13);
  }
  return v11;
}

- (BOOL)isPlayable
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend(-[AVMediaSelectionOption fallbackIDs](self, "fallbackIDs"), "reverseObjectEnumerator");
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        if (-[AVAssetTrack isPlayable](-[AVAsset trackWithTrackID:](-[AVAssetTrack asset](self->_track, "asset"), "trackWithTrackID:", [*(id *)(*((void *)&v9 + 1) + 8 * i) unsignedIntValue]), "isPlayable"))
        {
          return 1;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  return [(AVAssetTrack *)self->_track isPlayable];
}

- (id)locale
{
  return [(AVAssetTrack *)self->_track locale];
}

- (id)commonMetadata
{
  return [(AVAssetTrack *)self->_track commonMetadata];
}

- (id)availableMetadataFormats
{
  return [(AVAssetTrack *)self->_track availableMetadataFormats];
}

- (id)metadataForFormat:(id)a3
{
  return [(AVAssetTrack *)self->_track metadataForFormat:a3];
}

- (id)associatedMediaSelectionOptionInMediaSelectionGroup:(id)a3
{
  if (!objc_msgSend(a3, "isEqual:", -[AVMediaSelectionTrackOption group](self, "group")))
  {
    v8.receiver = self;
    v8.super_class = (Class)AVMediaSelectionTrackOption;
    return [(AVMediaSelectionOption *)&v8 associatedMediaSelectionOptionInMediaSelectionGroup:a3];
  }
  uint64_t v5 = [(AVAssetTrack *)self->_track mediaType];
  if ([(NSString *)v5 isEqualToString:@"sbtl"])
  {
    if ([(AVMediaSelectionTrackOption *)self displaysNonForcedSubtitles])
    {
      id result = [(AVAssetTrack *)self->_track _pairedForcedOnlySubtitlesTrack];
      if (!result)
      {
        id result = self->_track;
        if (!result) {
          return result;
        }
      }
      goto LABEL_10;
    }
    return 0;
  }
  if (![(NSString *)v5 isEqualToString:@"soun"]) {
    return 0;
  }
  id result = [(AVAssetTrack *)self->_track _fallbackTrack];
  if (!result) {
    return result;
  }
LABEL_10:
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(result, "trackID"));
  return (id)[a3 _optionWithID:v7 displaysNonForcedSubtitles:0 audioCompositionPresetIndex:0];
}

- (id)track
{
  return self->_track;
}

- (int)trackID
{
  return [(AVAssetTrack *)self->_track trackID];
}

@end