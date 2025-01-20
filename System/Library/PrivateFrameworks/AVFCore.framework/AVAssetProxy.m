@interface AVAssetProxy
+ (id)assetProxyWithPropertyList:(id)a3;
+ (id)makePropertyListForMovieProxyHeader:(id)a3 name:(id)a4 prefersNominalDurations:(BOOL)a5;
- (AVAssetProxy)initWithPropertyList:(id)a3;
- (BOOL)isProxy;
- (Class)_classForTrackInspectors;
- (OpaqueFigAsset)_figAsset;
- (OpaqueFigFormatReader)_copyFormatReader;
- (OpaqueFigPlaybackItem)_playbackItem;
- (id)_assetInspector;
- (id)_assetInspectorLoader;
- (id)tracks;
- (void)dealloc;
@end

@implementation AVAssetProxy

+ (id)makePropertyListForMovieProxyHeader:(id)a3 name:(id)a4 prefersNominalDurations:(BOOL)a5
{
  id v5 = a3;
  if (a3)
  {
    BOOL v6 = a5;
    v8 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", a3, @"moop", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithShort:", 1), @"mpvr", 0);
    id v5 = v8;
    if (v6) {
      [v8 setObject:MEMORY[0x1E4F1CC38] forKey:@"prefers-nominal-durations"];
    }
    if (a4) {
      [v5 setObject:a4 forKey:@"name"];
    }
  }
  return v5;
}

+ (id)assetProxyWithPropertyList:(id)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithPropertyList:a3];
  return v3;
}

- (AVAssetProxy)initWithPropertyList:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)AVAssetProxy;
  v4 = [(AVAsset *)&v9 init];
  if (v4)
  {
    if (![a3 objectForKey:@"moop"]) {
      goto LABEL_13;
    }
    id v5 = objc_alloc_init(AVAssetProxyInternal);
    v4->_assetProxy = v5;
    if (!v5) {
      goto LABEL_13;
    }
    CFRetain(v5);
    v4->_assetProxy->makeTracksArrayOnce = objc_alloc_init(AVDispatchOnce);
    uint64_t v6 = [a3 objectForKey:@"name"];
    if (v6) {
      [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v6 forKey:*MEMORY[0x1E4F32038]];
    }
    figAssetCreationFlagsForAssetReferenceRestrictions(2);
    if (objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"mpvr"), "shortValue")) {
      objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"prefers-nominal-durations"), "BOOLValue");
    }
    uint64_t v7 = FigAssetRemoteCreateWithMovieProxyData();
    if (!v7) {
      v4->_assetProxy->loader = (AVAssetInspectorLoader *)[[AVFigAssetInspectorLoader alloc] initWithFigAsset:0 forAsset:v4];
    }
    if (!v4->_assetProxy->loader) {
      v4->_assetProxy->loader = (AVAssetInspectorLoader *)[[AVUnreachableAssetInspectorLoader alloc] initWithFigError:v7 userInfo:0];
    }
    if (!v4->_assetProxy->loader)
    {
LABEL_13:

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  assetProxy = self->_assetProxy;
  if (assetProxy)
  {

    CFRelease(self->_assetProxy);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVAssetProxy;
  [(AVAsset *)&v4 dealloc];
}

- (BOOL)isProxy
{
  return 1;
}

- (OpaqueFigAsset)_figAsset
{
  return [(AVAssetInspectorLoader *)self->_assetProxy->loader _figAsset];
}

- (OpaqueFigFormatReader)_copyFormatReader
{
  return [(AVAssetInspectorLoader *)self->_assetProxy->loader _copyFormatReader];
}

- (OpaqueFigPlaybackItem)_playbackItem
{
  return 0;
}

- (id)_assetInspectorLoader
{
  return self->_assetProxy->loader;
}

- (id)_assetInspector
{
  return [(AVAssetInspectorLoader *)self->_assetProxy->loader assetInspector];
}

- (Class)_classForTrackInspectors
{
  return [(AVAssetInspectorLoader *)self->_assetProxy->loader _classForTrackInspectors];
}

- (id)tracks
{
  makeTracksArrayOnce = self->_assetProxy->makeTracksArrayOnce;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __22__AVAssetProxy_tracks__block_invoke;
  v5[3] = &unk_1E57B1E80;
  v5[4] = self;
  [(AVDispatchOnce *)makeTracksArrayOnce runBlockOnce:v5];
  return self->_assetProxy->tracks;
}

uint64_t __22__AVAssetProxy_tracks__block_invoke(uint64_t a1)
{
  v2 = (void *)[MEMORY[0x1E4F1CA48] array];
  uint64_t v3 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_assetInspector"), "trackCount");
  if (v3 >= 1)
  {
    uint64_t v4 = v3;
    for (uint64_t i = 0; i != v4; ++i)
    {
      id v6 = [[AVAssetTrack alloc] _initWithAsset:*(void *)(a1 + 32) trackIndex:i];
      if (v6) {
        [v2 addObject:v6];
      }
    }
  }
  uint64_t result = [v2 copy];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 16) + 16) = result;
  return result;
}

@end