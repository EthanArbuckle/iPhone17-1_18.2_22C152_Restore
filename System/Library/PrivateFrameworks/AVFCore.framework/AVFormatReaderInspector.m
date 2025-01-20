@interface AVFormatReaderInspector
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumTimeOffsetFromLive;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)overallDurationHint;
- (AVFormatReaderInspector)initWithFormatReader:(OpaqueFigFormatReader *)a3;
- (BOOL)_hasQTSaveRestriction;
- (BOOL)canContainFragments;
- (BOOL)containsFragments;
- (BOOL)isComposable;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExportable;
- (BOOL)isReadable;
- (BOOL)providesPreciseDurationAndTiming;
- (CGAffineTransform)preferredTransform;
- (CGSize)naturalSize;
- (OpaqueFigFormatReader)_copyFormatReader;
- (float)preferredRate;
- (float)preferredSoundCheckVolumeNormalization;
- (float)preferredVolume;
- (id)alternateTrackGroups;
- (id)availableMetadataFormats;
- (id)commonMetadata;
- (id)lyrics;
- (id)metadataForFormat:(id)a3;
- (id)trackReferences;
- (int)naturalTimeScale;
- (int64_t)firstFragmentSequenceNumber;
- (int64_t)fragmentCount;
- (int64_t)trackCount;
- (unint64_t)hash;
- (void)_setFormatReader:(OpaqueFigFormatReader *)a3;
- (void)_valueAsCFTypeForProperty:(__CFString *)a3;
- (void)dealloc;
@end

@implementation AVFormatReaderInspector

- (AVFormatReaderInspector)initWithFormatReader:(OpaqueFigFormatReader *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AVFormatReaderInspector;
  v4 = [(AVFormatReaderInspector *)&v7 init];
  v5 = v4;
  if (v4)
  {
    if (a3)
    {
      [(AVFormatReaderInspector *)v4 _setFormatReader:a3];
    }
    else
    {

      return 0;
    }
  }
  return v5;
}

- (void)dealloc
{
  [(AVFormatReaderInspector *)self _setFormatReader:0];
  v3.receiver = self;
  v3.super_class = (Class)AVFormatReaderInspector;
  [(AVFormatReaderInspector *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  v5 = [(AVFormatReaderInspector *)self _copyFormatReader];
  v6 = (OpaqueFigFormatReader *)[a3 _copyFormatReader];
  objc_super v7 = v6;
  BOOL v8 = v5 == v6;
  if (v5 != v6 && v5 && v6)
  {
    BOOL v8 = CFEqual(v5, v6) != 0;
  }
  else if (!v5)
  {
    goto LABEL_9;
  }
  CFRelease(v5);
LABEL_9:
  if (v7) {
    CFRelease(v7);
  }
  return v8;
}

- (unint64_t)hash
{
  objc_super v3 = [(AVFormatReaderInspector *)self _copyFormatReader];
  if (v3)
  {
    v4 = v3;
    CFHashCode v5 = CFHash(v3);
    CFRelease(v4);
    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)AVFormatReaderInspector;
    return [(AVFormatReaderInspector *)&v7 hash];
  }
}

- (void)_setFormatReader:(OpaqueFigFormatReader *)a3
{
  if (a3) {
    CFRetain(a3);
  }
  formatReader = self->_formatReader;
  if (formatReader) {
    CFRelease(formatReader);
  }
  self->_formatReader = a3;
}

- (OpaqueFigFormatReader)_copyFormatReader
{
  result = self->_formatReader;
  if (result) {
    return (OpaqueFigFormatReader *)CFRetain(result);
  }
  return result;
}

- (void)_valueAsCFTypeForProperty:(__CFString *)a3
{
  v10 = 0;
  result = [(AVFormatReaderInspector *)self _copyFormatReader];
  if (result)
  {
    CFHashCode v5 = result;
    uint64_t FigBaseObject = FigFormatReaderGetFigBaseObject();
    uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v7) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    v9 = *(void (**)(uint64_t, __CFString *, void, void **))(v8 + 48);
    if (v9) {
      v9(FigBaseObject, a3, *MEMORY[0x1E4F1CF80], &v10);
    }
    CFRelease(v5);
    return v10;
  }
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[(AVFormatReaderInspector *)self providesPreciseDurationAndTiming];
  if (!result)
  {
    if (self)
    {
      v6 = (uint64_t *)MEMORY[0x1E4F32B38];
      goto LABEL_6;
    }
LABEL_9:
    retstr->var0 = 0;
    *(void *)&retstr->var1 = 0;
    retstr->var3 = 0;
    return result;
  }
  if (!self) {
    goto LABEL_9;
  }
  v6 = (uint64_t *)MEMORY[0x1E4F32B30];
LABEL_6:
  uint64_t v7 = *v6;
  return [(AVFigObjectInspector *)self _timeForProperty:v7];
}

- (float)preferredRate
{
  LODWORD(v2) = 1.0;
  [(AVFigObjectInspector *)self _floatForProperty:*MEMORY[0x1E4F32B78] defaultValue:v2];
  return result;
}

- (float)preferredVolume
{
  LODWORD(v2) = 1.0;
  [(AVFigObjectInspector *)self _floatForProperty:*MEMORY[0x1E4F32B80] defaultValue:v2];
  return result;
}

- (float)preferredSoundCheckVolumeNormalization
{
  [(AVFigObjectInspector *)self _floatForProperty:*MEMORY[0x1E4F32BB8] defaultValue:0.0];
  return result;
}

- (CGAffineTransform)preferredTransform
{
  if (self) {
    return (CGAffineTransform *)[(CGAffineTransform *)self _affineTransformForProperty:*MEMORY[0x1E4F32B60]];
  }
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return self;
}

- (CGSize)naturalSize
{
  v4.receiver = self;
  v4.super_class = (Class)AVFormatReaderInspector;
  [(AVAssetInspector *)&v4 naturalSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (int)naturalTimeScale
{
  return [(AVFigObjectInspector *)self _SInt32ForProperty:*MEMORY[0x1E4F32BA0]];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumTimeOffsetFromLive
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1F9F8];
  return self;
}

- (BOOL)providesPreciseDurationAndTiming
{
  return [(AVFigObjectInspector *)self _BOOLeanForProperty:*MEMORY[0x1E4F32B90]] != 0;
}

- (int64_t)trackCount
{
  int64_t v7 = 0;
  int64_t result = [(AVFormatReaderInspector *)self _copyFormatReader];
  if (result)
  {
    double v3 = (const void *)result;
    uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v4) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
    v6 = *(void (**)(const void *, int64_t *))(v5 + 8);
    if (v6) {
      v6(v3, &v7);
    }
    CFRelease(v3);
    return v7;
  }
  return result;
}

- (id)alternateTrackGroups
{
  return [(AVFigObjectInspector *)self _nonNilArrayForProperty:*MEMORY[0x1E4F32B18]];
}

- (id)trackReferences
{
  return [(AVFigObjectInspector *)self _dictionaryForProperty:*MEMORY[0x1E4F32BA8]];
}

- (id)lyrics
{
  return [(AVFigObjectInspector *)self _stringForProperty:*MEMORY[0x1E4F32B40]];
}

- (id)commonMetadata
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  double v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  CFTypeRef cf = 0;
  uint64_t v4 = [(AVFormatReaderInspector *)self _copyFormatReader];
  if (v4)
  {
    uint64_t v5 = v4;
    if (!FigMetadataCopyMovieCommonMetadata())
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      v6 = (void *)cf;
      uint64_t v7 = [(id)cf countByEnumeratingWithState:&v13 objects:v18 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v14;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v14 != v9) {
              objc_enumerationMutation(v6);
            }
            id v11 = +[AVMetadataItem _metadataItemWithFigMetadataDictionary:*(void *)(*((void *)&v13 + 1) + 8 * i)];
            if (v11) {
              [v3 addObject:v11];
            }
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
        }
        while (v8);
      }
    }
    CFRelease(v5);
    if (cf) {
      CFRelease(cf);
    }
  }
  return v3;
}

- (id)availableMetadataFormats
{
  double v2 = [(AVFormatReaderInspector *)self _copyFormatReader];
  CFTypeRef cf = 0;
  CFArrayRef theArray = 0;
  if (!v2) {
    goto LABEL_22;
  }
  uint64_t FigBaseObject = FigFormatReaderGetFigBaseObject();
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  v6 = *(unsigned int (**)(uint64_t, void, void, CFArrayRef *))(v5 + 48);
  if (!v6) {
    goto LABEL_25;
  }
  uint64_t v7 = *MEMORY[0x1E4F1CF80];
  if (v6(FigBaseObject, *MEMORY[0x1E4F32B50], *MEMORY[0x1E4F1CF80], &theArray)) {
    goto LABEL_25;
  }
  if (!theArray)
  {
    id v11 = 0;
    goto LABEL_28;
  }
  CFIndex Count = CFArrayGetCount(theArray);
  if (Count >= 1)
  {
    CFIndex v9 = Count;
    CFIndex v10 = 0;
    id v11 = 0;
    uint64_t v12 = *MEMORY[0x1E4F33078];
    do
    {
      CFArrayGetValueAtIndex(theArray, v10);
      uint64_t v13 = FigMetadataReaderGetFigBaseObject();
      uint64_t v14 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v14) {
        uint64_t v15 = v14;
      }
      else {
        uint64_t v15 = 0;
      }
      long long v16 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t, CFTypeRef *))(v15 + 48);
      if (v16 && !v16(v13, v12, v7, &cf))
      {
        if (!v11) {
          id v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v9];
        }
        objc_msgSend(v11, "addObject:", cf, cf);
      }
      if (cf)
      {
        CFRelease(cf);
        CFTypeRef cf = 0;
      }
      ++v10;
    }
    while (v9 != v10);
  }
  else
  {
LABEL_22:
    id v11 = 0;
  }
  if (objc_msgSend(v11, "count", cf)) {
    goto LABEL_26;
  }

LABEL_25:
  id v11 = 0;
LABEL_26:
  if (theArray) {
    CFRelease(theArray);
  }
LABEL_28:
  if (cf) {
    CFRelease(cf);
  }
  if (v2) {
    CFRelease(v2);
  }
  if (v11) {
    return v11;
  }
  else {
    return (id)[MEMORY[0x1E4F1C978] array];
  }
}

- (id)metadataForFormat:(id)a3
{
  uint64_t v4 = [(AVFormatReaderInspector *)self _copyFormatReader];
  uint64_t v5 = v4;
  v6 = 0;
  CFTypeRef cf = 0;
  CFArrayRef theArray = 0;
  if (a3 && v4)
  {
    uint64_t FigBaseObject = FigFormatReaderGetFigBaseObject();
    uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v8) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
    CFIndex v10 = *(unsigned int (**)(uint64_t, void, void, CFArrayRef *))(v9 + 48);
    if (!v10) {
      goto LABEL_20;
    }
    uint64_t v11 = *MEMORY[0x1E4F1CF80];
    if (v10(FigBaseObject, *MEMORY[0x1E4F32B50], *MEMORY[0x1E4F1CF80], &theArray)) {
      goto LABEL_20;
    }
    if (!theArray)
    {
      v6 = 0;
      goto LABEL_23;
    }
    CFIndex Count = CFArrayGetCount(theArray);
    if (Count < 1)
    {
LABEL_20:
      v6 = 0;
    }
    else
    {
      CFIndex v13 = Count;
      CFIndex v14 = 0;
      uint64_t v15 = *MEMORY[0x1E4F33078];
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(theArray, v14);
        uint64_t v17 = FigMetadataReaderGetFigBaseObject();
        uint64_t v18 = *(void *)(CMBaseObjectGetVTable() + 8);
        uint64_t v19 = v18 ? v18 : 0;
        v20 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t, CFTypeRef *))(v19 + 48);
        if (v20)
        {
          if (!v20(v17, v15, v11, &cf) && [a3 isEqualToString:cf]) {
            break;
          }
        }
        if (cf)
        {
          CFRelease(cf);
          CFTypeRef cf = 0;
        }
        if (v13 == ++v14) {
          goto LABEL_20;
        }
      }
      v6 = (void *)[+[AVMetadataEnumerator metadataEnumeratorWithMetadataReader:ValueAtIndex] allObjects];
    }
  }
  if (theArray) {
    CFRelease(theArray);
  }
LABEL_23:
  if (cf) {
    CFRelease(cf);
  }
  if (v5) {
    CFRelease(v5);
  }
  if (!v6) {
    return (id)[MEMORY[0x1E4F1C978] array];
  }
  return v6;
}

- (BOOL)_hasQTSaveRestriction
{
  if (!self->didCheckForSaveRestriction)
  {
    if (objc_msgSend(-[AVFormatReaderInspector availableMetadataFormats](self, "availableMetadataFormats"), "containsObject:", @"com.apple.quicktime.udta"))
    {
      id v3 = [(AVFormatReaderInspector *)self metadataForFormat:@"com.apple.quicktime.udta"];
      uint64_t v4 = +[AVMetadataItem metadataItemsFromArray:withKey:keySpace:](AVMetadataItem, "metadataItemsFromArray:withKey:keySpace:", v3, [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:1853055350], @"udta");
      if ([(NSArray *)v4 count])
      {
        int v6 = 0;
        objc_msgSend((id)objc_msgSend(-[NSArray objectAtIndex:](v4, "objectAtIndex:", 0), "dataValue"), "getBytes:length:", &v6, 4);
        if ((v6 & 0x1000000) != 0) {
          self->hasSaveRestriction = 1;
        }
      }
    }
    self->didCheckForSaveRestriction = 1;
  }
  return self->hasSaveRestriction;
}

- (BOOL)isExportable
{
  return ![(AVFormatReaderInspector *)self _hasQTSaveRestriction];
}

- (BOOL)isReadable
{
  return ![(AVFormatReaderInspector *)self _hasQTSaveRestriction];
}

- (BOOL)isComposable
{
  return ![(AVFormatReaderInspector *)self _hasQTSaveRestriction];
}

- (BOOL)canContainFragments
{
  return [(AVFigObjectInspector *)self _BOOLeanForProperty:*MEMORY[0x1E4F32B28]] != 0;
}

- (BOOL)containsFragments
{
  return [(AVFigObjectInspector *)self _BOOLeanForProperty:*MEMORY[0x1E4F32B20]] != 0;
}

- (int64_t)firstFragmentSequenceNumber
{
  return [(AVFigObjectInspector *)self _SInt32ForProperty:*MEMORY[0x1E4F32228]];
}

- (int64_t)fragmentCount
{
  return [(AVFigObjectInspector *)self _SInt32ForProperty:*MEMORY[0x1E4F32240]];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)overallDurationHint
{
  if (self) {
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[($3CC8671D27C23BF42ADDB32F2B5E48AE *)self _timeForProperty:*MEMORY[0x1E4F32B58]];
  }
  retstr->var0 = 0;
  *(void *)&retstr->var1 = 0;
  retstr->var3 = 0;
  return self;
}

@end