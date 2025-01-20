@interface AVComposition
+ (BOOL)expectsPropertyRevisedNotifications;
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (AVComposition)init;
- (AVComposition)initWithCoder:(id)a3;
- (AVCompositionTrack)trackWithTrackID:(CMPersistentTrackID)trackID;
- (BOOL)_clientProvidesNaturalSize;
- (BOOL)_setURLAssetInitializationOptions:(id)a3 error:(id *)a4;
- (BOOL)isDefunct;
- (CGSize)naturalSize;
- (Class)_classForTrackInspectors;
- (NSArray)tracks;
- (NSArray)tracksWithMediaCharacteristic:(AVMediaCharacteristic)mediaCharacteristic;
- (NSArray)tracksWithMediaType:(AVMediaType)mediaType;
- (NSDictionary)URLAssetInitializationOptions;
- (OpaqueFigAsset)_figAsset;
- (OpaqueFigFormatReader)_copyFormatReader;
- (OpaqueFigMutableComposition)_mutableComposition;
- (id)_assetInspector;
- (id)_assetInspectorLoader;
- (id)_initWithComposition:(id)a3;
- (id)_mediaSelectionGroupDictionaries;
- (id)_mutableTracks;
- (id)_newTrackForIndex:(int64_t)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int)_createEmptyMutableCompositionIfNeeded;
- (void)_loadAssetInspectorAndLoaderOnce;
- (void)_setNaturalSize:(CGSize)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AVComposition

+ (void)initialize
{
}

- (int)_createEmptyMutableCompositionIfNeeded
{
  priv = self->_priv;
  mutableComposition = priv->mutableComposition;
  p_mutableComposition = &priv->mutableComposition;
  if (mutableComposition) {
    return 0;
  }
  else {
    return MEMORY[0x1F40ED748](*MEMORY[0x1E4F1CF80], 0, p_mutableComposition);
  }
}

- (id)_initWithComposition:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)AVComposition;
  v4 = [(AVAsset *)&v14 init];
  if (!v4) {
    return v4;
  }
  v5 = objc_alloc_init(AVCompositionInternal);
  v4->_priv = v5;
  if (!v5)
  {
LABEL_15:

    return 0;
  }
  CFRetain(v5);
  v4->_priv->mutableComposition = 0;
  v4->_priv->formatReaderInitializationOnce = objc_alloc_init(AVDispatchOnce);
  v4->_priv->assetInspectorInitializationOnce = objc_alloc_init(AVDispatchOnce);
  v4->_priv->tracksInitializationOnce = objc_alloc_init(AVDispatchOnce);
  v4->_priv->figAssetInitializationOnce = objc_alloc_init(AVDispatchOnce);
  v4->_priv->assetInspector = 0;
  v4->_priv->formatReader = 0;
  v4->_priv->figAsset = 0;
  v4->_priv->naturalSize = (CGSize)*MEMORY[0x1E4F1DB30];
  if ([a3 _mutableComposition])
  {
    uint64_t v6 = [a3 _mutableComposition];
    priv = v4->_priv;
    uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v8) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
    v11 = *(uint64_t (**)(void, uint64_t, OpaqueFigMutableComposition **))(v9 + 8);
    if (!v11) {
      goto LABEL_15;
    }
    int v10 = v11(*MEMORY[0x1E4F1CF80], v6, &priv->mutableComposition);
    if (!a3) {
      goto LABEL_14;
    }
  }
  else
  {
    int v10 = [(AVComposition *)v4 _createEmptyMutableCompositionIfNeeded];
    if (!a3)
    {
LABEL_14:
      if (!v10) {
        return v4;
      }
      goto LABEL_15;
    }
  }
  if (v10) {
    goto LABEL_14;
  }
  v12 = (CGSize *)*((void *)a3 + 2);
  if (v12)
  {
    v4->_priv->naturalSize = v12[4];
    v4->_priv->URLAssetInitializationOptions = (NSDictionary *)[*(id *)(*((void *)a3 + 2) + 80) copy];
  }
  return v4;
}

- (AVComposition)init
{
  return (AVComposition *)[(AVComposition *)self _initWithComposition:0];
}

- (void)dealloc
{
  priv = self->_priv;
  if (priv)
  {

    v4 = self->_priv;
    formatReader = v4->formatReader;
    if (formatReader)
    {
      CFRelease(formatReader);
      self->_priv->formatReader = 0;
      v4 = self->_priv;
    }
    figAsset = v4->figAsset;
    if (figAsset)
    {
      CFRelease(figAsset);
      self->_priv->figAsset = 0;
      v4 = self->_priv;
    }
    mutableComposition = v4->mutableComposition;
    if (mutableComposition)
    {
      CFRelease(mutableComposition);
      self->_priv->mutableComposition = 0;
      v4 = self->_priv;
    }

    uint64_t v8 = self->_priv;
    if (v8)
    {
      CFRelease(v8);
      self->_priv = 0;
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)AVComposition;
  [(AVAsset *)&v9 dealloc];
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p tracks = %@>", NSStringFromClass(v4), self, -[AVComposition tracks](self, "tracks")];
}

- (OpaqueFigMutableComposition)_mutableComposition
{
  return self->_priv->mutableComposition;
}

- (void)_loadAssetInspectorAndLoaderOnce
{
  assetInspectorInitializationOnce = self->_priv->assetInspectorInitializationOnce;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __49__AVComposition__loadAssetInspectorAndLoaderOnce__block_invoke;
  v3[3] = &unk_1E57B1E80;
  v3[4] = self;
  [(AVDispatchOnce *)assetInspectorInitializationOnce runBlockOnce:v3];
}

void __49__AVComposition__loadAssetInspectorAndLoaderOnce__block_invoke(uint64_t a1)
{
  v2 = (const void *)[*(id *)(a1 + 32) _copyFormatReader];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 16) + 56) = [(AVFormatReaderInspector *)[AVCompositionFormatReaderInspector alloc] initWithFormatReader:v2];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 16) + 48) = [[AVAssetSynchronousInspectorLoader alloc] initWithAssetInspector:*(void *)(*(void *)(*(void *)(a1 + 32) + 16)+ 56)];
  if (v2)
  {
    CFRelease(v2);
  }
}

- (id)_assetInspectorLoader
{
  return self->_priv->assetInspectorLoader;
}

- (id)_assetInspector
{
  return self->_priv->assetInspector;
}

- (OpaqueFigFormatReader)_copyFormatReader
{
  if ([(AVComposition *)self _mutableComposition])
  {
    formatReaderInitializationOnce = self->_priv->formatReaderInitializationOnce;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __34__AVComposition__copyFormatReader__block_invoke;
    v5[3] = &unk_1E57B1E80;
    v5[4] = self;
    [(AVDispatchOnce *)formatReaderInitializationOnce runBlockOnce:v5];
  }
  result = self->_priv->formatReader;
  if (result) {
    return (OpaqueFigFormatReader *)CFRetain(result);
  }
  return result;
}

uint64_t __34__AVComposition__copyFormatReader__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _mutableComposition];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 16);
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v7 = *(void *)(VTable + 16);
  uint64_t result = VTable + 16;
  uint64_t v6 = v7;
  if (v7) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = 0;
  }
  objc_super v9 = *(uint64_t (**)(uint64_t, void, void, uint64_t))(v8 + 16);
  if (v9)
  {
    return v9(v2, 0, 0, v3 + 40);
  }
  return result;
}

- (OpaqueFigAsset)_figAsset
{
  if ([(AVComposition *)self _mutableComposition])
  {
    figAssetInitializationOnce = self->_priv->figAssetInitializationOnce;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __26__AVComposition__figAsset__block_invoke;
    v5[3] = &unk_1E57B1E80;
    v5[4] = self;
    [(AVDispatchOnce *)figAssetInitializationOnce runBlockOnce:v5];
  }
  return self->_priv->figAsset;
}

uint64_t __26__AVComposition__figAsset__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _mutableComposition];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 16);
  uint64_t VTable = CMBaseObjectGetVTable();
  uint64_t v7 = *(void *)(VTable + 16);
  uint64_t result = VTable + 16;
  uint64_t v6 = v7;
  if (v7) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = 0;
  }
  objc_super v9 = *(uint64_t (**)(uint64_t, void, void, uint64_t))(v8 + 208);
  if (v9)
  {
    return v9(v2, 0, 0, v3 + 104);
  }
  return result;
}

- (Class)_classForTrackInspectors
{
  return (Class)objc_opt_class();
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = +[AVMutableComposition allocWithZone:a3];
  return [(AVMutableComposition *)v4 _initWithComposition:self];
}

- (id)_newTrackForIndex:(int64_t)a3
{
  v5 = [AVCompositionTrack alloc];
  return [(AVAssetTrack *)v5 _initWithAsset:self trackIndex:a3];
}

- (id)_mutableTracks
{
  tracksInitializationOnce = self->_priv->tracksInitializationOnce;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31__AVComposition__mutableTracks__block_invoke;
  v5[3] = &unk_1E57B1E80;
  v5[4] = self;
  [(AVDispatchOnce *)tracksInitializationOnce runBlockOnce:v5];
  return self->_priv->tracks;
}

void __31__AVComposition__mutableTracks__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[MEMORY[0x1E4F1CA48] array];
  uint64_t v10 = 0;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 16) + 88) = v2;
  uint64_t v3 = [*(id *)(a1 + 32) _copyFormatReader];
  if (v3)
  {
    v4 = (const void *)v3;
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    uint64_t v7 = *(unsigned int (**)(const void *, uint64_t *))(v6 + 8);
    if (v7 && !v7(v4, &v10) && v10 >= 1)
    {
      uint64_t v8 = 0;
      while (1)
      {
        id v9 = (id)[*(id *)(a1 + 32) _newTrackForIndex:v8];
        if (!v9) {
          break;
        }
        [v2 addObject:v9];
        if (++v8 >= v10) {
          goto LABEL_13;
        }
      }
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 16) + 88) removeAllObjects];
    }
LABEL_13:
    CFRelease(v4);
  }
}

- (NSArray)tracks
{
  uint64_t v2 = objc_msgSend(-[AVComposition _mutableTracks](self, "_mutableTracks"), "copy");
  return (NSArray *)v2;
}

- (AVCompositionTrack)trackWithTrackID:(CMPersistentTrackID)trackID
{
  v4.receiver = self;
  v4.super_class = (Class)AVComposition;
  return (AVCompositionTrack *)[(AVAsset *)&v4 trackWithTrackID:*(void *)&trackID];
}

- (NSArray)tracksWithMediaType:(AVMediaType)mediaType
{
  v4.receiver = self;
  v4.super_class = (Class)AVComposition;
  return [(AVAsset *)&v4 tracksWithMediaType:mediaType];
}

- (NSArray)tracksWithMediaCharacteristic:(AVMediaCharacteristic)mediaCharacteristic
{
  v4.receiver = self;
  v4.super_class = (Class)AVComposition;
  return [(AVAsset *)&v4 tracksWithMediaCharacteristic:mediaCharacteristic];
}

- (BOOL)_clientProvidesNaturalSize
{
  priv = self->_priv;
  double height = priv->naturalSize.height;
  BOOL v4 = priv->naturalSize.width != *MEMORY[0x1E4F1DB30];
  return height != *(double *)(MEMORY[0x1E4F1DB30] + 8) || v4;
}

- (CGSize)naturalSize
{
  if ([(AVComposition *)self _clientProvidesNaturalSize])
  {
    priv = self->_priv;
    double width = priv->naturalSize.width;
    double height = priv->naturalSize.height;
  }
  else
  {
    uint64_t v6 = [(AVComposition *)self tracksWithMediaType:@"vide"];
    if ([(NSArray *)v6 count])
    {
      objc_msgSend(-[NSArray objectAtIndex:](v6, "objectAtIndex:", 0), "naturalSize");
    }
    else
    {
      double width = 0.0;
      double height = 0.0;
    }
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_setNaturalSize:(CGSize)a3
{
  self->_priv->naturalSize = a3;
}

- (id)_mediaSelectionGroupDictionaries
{
  uint64_t v8 = 0;
  mutableComposition = self->_priv->mutableComposition;
  if (mutableComposition)
  {
    uint64_t FigBaseObject = FigMutableCompositionGetFigBaseObject();
    uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v4) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
    uint64_t v6 = *(void (**)(uint64_t, void, void, OpaqueFigMutableComposition **))(v5 + 48);
    if (v6)
    {
      v6(FigBaseObject, *MEMORY[0x1E4F347F8], *MEMORY[0x1E4F1CF80], &v8);
      mutableComposition = v8;
    }
    else
    {
      mutableComposition = 0;
    }
  }
  return mutableComposition;
}

- (BOOL)_setURLAssetInitializationOptions:(id)a3 error:(id *)a4
{
  uint64_t v6 = (NSDictionary *)[a3 copy];

  self->_priv->URLAssetInitializationOptions = v6;
  uint64_t v18 = 0;
  id v7 = +[AVURLAsset _getFigAssetCreationOptionsFromURLAssetInitializationOptions:v6 assetLoggingIdentifier:0 figAssetCreationFlags:&v18 error:a4];
  if (v7)
  {
    [(AVComposition *)self _mutableComposition];
    uint64_t FigBaseObject = FigMutableCompositionGetFigBaseObject();
    uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v9) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0;
    }
    v11 = *(void (**)(uint64_t, void, id))(v10 + 56);
    if (v11) {
      v11(FigBaseObject, *MEMORY[0x1E4F330A0], v7);
    }
    uint64_t v12 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v18];
    uint64_t v13 = FigMutableCompositionGetFigBaseObject();
    uint64_t v14 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v14) {
      uint64_t v15 = v14;
    }
    else {
      uint64_t v15 = 0;
    }
    v16 = *(void (**)(uint64_t, void, uint64_t))(v15 + 56);
    if (v16) {
      v16(v13, *MEMORY[0x1E4F33098], v12);
    }
  }
  return v7 != 0;
}

- (NSDictionary)URLAssetInitializationOptions
{
  CGSize result = self->_priv->URLAssetInitializationOptions;
  if (!result) {
    return (NSDictionary *)[MEMORY[0x1E4F1C9E8] dictionary];
  }
  return result;
}

- (BOOL)isDefunct
{
  unsigned __int8 v9 = 0;
  mutableComposition = self->_priv->mutableComposition;
  uint64_t v3 = *(void **)(CMBaseObjectGetVTable() + 8);
  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  if (*v4 < 5uLL)
  {
    int v6 = 0;
    LOBYTE(v5) = 0;
  }
  else
  {
    uint64_t v5 = (unsigned int (*)(OpaqueFigMutableComposition *, unsigned __int8 *))v4[11];
    if (v5)
    {
      LOBYTE(v5) = v5(mutableComposition, &v9) == 0;
      int v6 = v9;
    }
    else
    {
      int v6 = 0;
    }
  }
  if (v5) {
    int v7 = v6;
  }
  else {
    int v7 = 1;
  }
  if (!v6) {
    int v6 = v7;
  }
  return v6 == 1;
}

- (AVComposition)initWithCoder:(id)a3
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  obuint64_t j = (id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v4, "setWithObjects:", v5, v6, v7, v8, v9, objc_opt_class(), 0), @"tracks");
  uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  CFDictionaryRef v13 = (const __CFDictionary *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v10, "setWithObjects:", v11, v12, objc_opt_class(), 0), @"naturalSize");
  v63 = +[AVMutableComposition compositionWithURLAssetInitializationOptions:](AVMutableComposition, "compositionWithURLAssetInitializationOptions:", objc_msgSend(a3, "decodeObjectOfClasses:forKey:", +[AVURLAsset _initializationOptionsClasses](AVURLAsset, "_initializationOptionsClasses"), @"URLAssetInitializationOptions"));
  if (v13)
  {
    CGSize size = (CGSize)*MEMORY[0x1E4F1DB30];
    if (CGSizeMakeWithDictionaryRepresentation(v13, &size)) {
      -[AVMutableComposition setNaturalSize:](v63, "setNaturalSize:", size.width, size.height);
    }
  }
  uint64_t v14 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v14, "setWithObjects:", v15, v16, v17, objc_opt_class(), 0), @"compositionMetadataArray");
  v19 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v18, "count"));
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  uint64_t v20 = [v18 countByEnumeratingWithState:&v80 objects:v88 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v81;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v81 != v22) {
          objc_enumerationMutation(v18);
        }
        id v24 = +[AVMetadataItem _metadataItemWithFigMetadataDictionary:*(void *)(*((void *)&v80 + 1) + 8 * i)];
        if (v24) {
          [v19 addObject:v24];
        }
      }
      uint64_t v21 = [v18 countByEnumeratingWithState:&v80 objects:v88 count:16];
    }
    while (v21);
  }
  if (v19) {
    [(AVMutableComposition *)v63 setMetadata:v19];
  }
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  uint64_t v64 = [obj countByEnumeratingWithState:&v76 objects:v87 count:16];
  if (v64)
  {
    uint64_t v62 = *(void *)v77;
    do
    {
      for (uint64_t j = 0; j != v64; ++j)
      {
        if (*(void *)v77 != v62) {
          objc_enumerationMutation(obj);
        }
        v26 = *(void **)(*((void *)&v76 + 1) + 8 * j);
        uint64_t v27 = [v26 objectForKey:@"mediaType"];
        uint64_t v28 = objc_msgSend((id)objc_msgSend(v26, "objectForKey:", @"trackID"), "integerValue");
        uint64_t v29 = [v26 objectForKey:@"segments"];
        v30 = [(AVMutableComposition *)v63 addMutableTrackWithMediaType:v27 preferredTrackID:v28];
        if (v30)
        {
          v31 = v30;
          [(AVMutableCompositionTrack *)v30 setSegments:v29];
          v32 = (void *)[v26 objectForKey:@"naturalTimeScale"];
          if (v32) {
            -[AVMutableCompositionTrack setNaturalTimeScale:](v31, "setNaturalTimeScale:", [v32 integerValue]);
          }
          uint64_t v33 = [v26 objectForKey:@"languageCode"];
          if (v33) {
            [(AVMutableCompositionTrack *)v31 setLanguageCode:v33];
          }
          uint64_t v34 = [v26 objectForKey:@"extendedLanguageTag"];
          if (v34) {
            [(AVMutableCompositionTrack *)v31 setExtendedLanguageTag:v34];
          }
          if ([v26 objectForKey:@"preferredTransform"])
          {
            CGAffineTransformFromNSArray(v75);
            [(AVMutableCompositionTrack *)v31 setPreferredTransform:v75];
          }
          v35 = (void *)[v26 objectForKey:@"preferredVolume"];
          if (v35)
          {
            [v35 floatValue];
            -[AVMutableCompositionTrack setPreferredVolume:](v31, "setPreferredVolume:");
          }
          v36 = (void *)[v26 objectForKey:@"alternateGroupID"];
          if (v36) {
            -[AVMutableCompositionTrack setAlternateGroupID:](v31, "setAlternateGroupID:", (int)[v36 intValue]);
          }
          v65 = v26;
          uint64_t v66 = j;
          v37 = (void *)[v26 objectForKey:@"formatDescriptionReplacements"];
          long long v71 = 0u;
          long long v72 = 0u;
          long long v73 = 0u;
          long long v74 = 0u;
          uint64_t v38 = [v37 countByEnumeratingWithState:&v71 objects:v86 count:16];
          if (v38)
          {
            uint64_t v39 = v38;
            uint64_t v40 = *(void *)v72;
            do
            {
              uint64_t v41 = 0;
              do
              {
                if (*(void *)v72 != v40) {
                  objc_enumerationMutation(v37);
                }
                v42 = *(void **)(*((void *)&v71 + 1) + 8 * v41);
                v43 = (void *)[v42 objectForKey:@"originalFormatDescription"];
                uint64_t v44 = [v42 objectForKey:@"replacementFormatDescription"];
                if (v43) {
                  BOOL v45 = v44 == 0;
                }
                else {
                  BOOL v45 = 1;
                }
                if (!v45)
                {
                  v46 = (void *)v44;
                  v47 = AVFormatDescriptionFromSerializedAtomData(v43);
                  v48 = AVFormatDescriptionFromSerializedAtomData(v46);
                  v49 = v48;
                  if (v47) {
                    BOOL v50 = v48 == 0;
                  }
                  else {
                    BOOL v50 = 1;
                  }
                  if (v50)
                  {
                    if (!v47)
                    {
                      if (!v48) {
                        goto LABEL_50;
                      }
LABEL_49:
                      CFRelease(v49);
                      goto LABEL_50;
                    }
                  }
                  else
                  {
                    [(AVMutableCompositionTrack *)v31 replaceFormatDescription:v47 withFormatDescription:v48];
                  }
                  CFRelease(v47);
                  if (v49) {
                    goto LABEL_49;
                  }
                }
LABEL_50:
                ++v41;
              }
              while (v39 != v41);
              uint64_t v51 = [v37 countByEnumeratingWithState:&v71 objects:v86 count:16];
              uint64_t v39 = v51;
            }
            while (v51);
          }
          v52 = (void *)[v65 objectForKey:@"trackMetadataArray"];
          v53 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v52, "count"));
          long long v67 = 0u;
          long long v68 = 0u;
          long long v69 = 0u;
          long long v70 = 0u;
          uint64_t v54 = [v52 countByEnumeratingWithState:&v67 objects:v85 count:16];
          if (v54)
          {
            uint64_t v55 = v54;
            uint64_t v56 = *(void *)v68;
            do
            {
              for (uint64_t k = 0; k != v55; ++k)
              {
                if (*(void *)v68 != v56) {
                  objc_enumerationMutation(v52);
                }
                id v58 = +[AVMetadataItem _metadataItemWithFigMetadataDictionary:*(void *)(*((void *)&v67 + 1) + 8 * k)];
                if (v58) {
                  [v53 addObject:v58];
                }
              }
              uint64_t v55 = [v52 countByEnumeratingWithState:&v67 objects:v85 count:16];
            }
            while (v55);
          }
          uint64_t j = v66;
          if (v53) {
            [(AVMutableCompositionTrack *)v31 setMetadata:v53];
          }
        }
      }
      uint64_t v64 = [obj countByEnumeratingWithState:&v76 objects:v87 count:16];
    }
    while (v64);
  }
  return (AVComposition *)[(AVComposition *)self _initWithComposition:v63];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(AVComposition *)self tracks];
  v46 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](v3, "count"));
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  obuint64_t j = v3;
  uint64_t v47 = [(NSArray *)v3 countByEnumeratingWithState:&v66 objects:v75 count:16];
  if (v47)
  {
    uint64_t v45 = *(void *)v67;
    unint64_t v4 = 0x1E4F28000uLL;
    long long v43 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    long long v44 = *MEMORY[0x1E4F1DAB8];
    long long v42 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v67 != v45) {
          objc_enumerationMutation(obj);
        }
        uint64_t v50 = v5;
        uint64_t v6 = *(void **)(*((void *)&v66 + 1) + 8 * v5);
        uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", objc_msgSend(v6, "mediaType"), @"mediaType", objc_msgSend(*(id *)(v4 + 3792), "numberWithInteger:", (int)objc_msgSend(v6, "trackID")), @"trackID", objc_msgSend(v6, "segments"), @"segments", 0);
        int v8 = [v6 naturalTimeScale];
        if (v8) {
          objc_msgSend(v7, "setObject:forKey:", objc_msgSend(*(id *)(v4 + 3792), "numberWithInteger:", v8), @"naturalTimeScale");
        }
        uint64_t v9 = [v6 languageCode];
        if (v9) {
          [v7 setObject:v9 forKey:@"languageCode"];
        }
        uint64_t v10 = [v6 extendedLanguageTag];
        if (v10) {
          [v7 setObject:v10 forKey:@"extendedLanguageTag"];
        }
        memset(&v65, 0, sizeof(v65));
        if (v6) {
          [v6 preferredTransform];
        }
        CGAffineTransform t1 = v65;
        *(_OWORD *)&t2.a = v44;
        *(_OWORD *)&t2.c = v43;
        *(_OWORD *)&t2.tx = v42;
        if (!CGAffineTransformEqualToTransform(&t1, &t2))
        {
          CGAffineTransform t1 = v65;
          [v7 setObject:NSArrayFromCGAffineTransform() forKey:@"preferredTransform"];
        }
        [v6 preferredVolume];
        if (v11 != 1.0) {
          objc_msgSend(v7, "setObject:forKey:", objc_msgSend(*(id *)(v4 + 3792), "numberWithFloat:"), @"preferredVolume");
        }
        uint64_t v12 = [v6 alternateGroupID];
        if (v12) {
          objc_msgSend(v7, "setObject:forKey:", objc_msgSend(*(id *)(v4 + 3792), "numberWithInteger:", v12), @"alternateGroupID");
        }
        v48 = v6;
        v49 = v7;
        CFDictionaryRef v13 = (void *)[v6 formatDescriptionReplacements];
        uint64_t v14 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v13, "count"));
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        uint64_t v15 = [v13 countByEnumeratingWithState:&v59 objects:v74 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v60;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v60 != v17) {
                objc_enumerationMutation(v13);
              }
              v19 = *(void **)(*((void *)&v59 + 1) + 8 * i);
              uint64_t v20 = (void *)AVSerializedAtomDataFromFormatDescription((void *)[v19 originalFormatDescription]);
              uint64_t v21 = AVSerializedAtomDataFromFormatDescription((void *)[v19 replacementFormatDescription]);
              uint64_t v22 = (void *)v21;
              if (v20) {
                BOOL v23 = v21 == 0;
              }
              else {
                BOOL v23 = 1;
              }
              if (!v23)
              {
                v72[0] = @"originalFormatDescription";
                v72[1] = @"replacementFormatDescription";
                v73[0] = v20;
                v73[1] = v21;
                objc_msgSend(v14, "addObject:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v73, v72, 2));
              }
            }
            uint64_t v16 = [v13 countByEnumeratingWithState:&v59 objects:v74 count:16];
          }
          while (v16);
        }
        if ([v14 count]) {
          [v49 setObject:v14 forKey:@"formatDescriptionReplacements"];
        }
        id v24 = (void *)[v48 metadata];
        v25 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v24, "count"));
        long long v55 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        uint64_t v26 = [v24 countByEnumeratingWithState:&v55 objects:v71 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = *(void *)v56;
          do
          {
            for (uint64_t j = 0; j != v27; ++j)
            {
              if (*(void *)v56 != v28) {
                objc_enumerationMutation(v24);
              }
              uint64_t v30 = [*(id *)(*((void *)&v55 + 1) + 8 * j) _figMetadataDictionary];
              if (v30) {
                [v25 addObject:v30];
              }
            }
            uint64_t v27 = [v24 countByEnumeratingWithState:&v55 objects:v71 count:16];
          }
          while (v27);
        }
        if ([v25 count]) {
          [v49 setObject:v25 forKey:@"trackMetadataArray"];
        }
        [v46 addObject:v49];
        uint64_t v5 = v50 + 1;
        unint64_t v4 = 0x1E4F28000;
      }
      while (v50 + 1 != v47);
      uint64_t v47 = [(NSArray *)obj countByEnumeratingWithState:&v66 objects:v75 count:16];
    }
    while (v47);
  }
  [a3 encodeObject:v46 forKey:@"tracks"];
  if ([(AVComposition *)self _clientProvidesNaturalSize])
  {
    [(AVComposition *)self naturalSize];
    [a3 encodeObject:CGSizeCreateDictionaryRepresentation(v77) forKey:@"naturalSize"];
  }
  v31 = [(AVComposition *)self URLAssetInitializationOptions];
  if ([(NSDictionary *)v31 count]) {
    [a3 encodeObject:v31 forKey:@"URLAssetInitializationOptions"];
  }
  v32 = [(AVAsset *)self metadata];
  uint64_t v33 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](v32, "count"));
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  uint64_t v34 = [(NSArray *)v32 countByEnumeratingWithState:&v51 objects:v70 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v52;
    do
    {
      for (uint64_t k = 0; k != v35; ++k)
      {
        if (*(void *)v52 != v36) {
          objc_enumerationMutation(v32);
        }
        uint64_t v38 = [*(id *)(*((void *)&v51 + 1) + 8 * k) _figMetadataDictionary];
        if (v38) {
          [v33 addObject:v38];
        }
      }
      uint64_t v35 = [(NSArray *)v32 countByEnumeratingWithState:&v51 objects:v70 count:16];
    }
    while (v35);
  }
  if ([v33 count]) {
    [a3 encodeObject:v33 forKey:@"compositionMetadataArray"];
  }
}

+ (BOOL)expectsPropertyRevisedNotifications
{
  return 0;
}

@end