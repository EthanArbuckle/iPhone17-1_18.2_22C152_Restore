@interface AVStreamDataAsset
- (AVStreamDataAsset)initWithParser:(id)a3 tracks:(id)a4;
- (Class)_classForTrackInspectors;
- (OpaqueFigFormatReader)_copyFormatReader;
- (id)_assetInspector;
- (id)_assetInspectorLoader;
- (id)copyAssetRemovingTrackID:(int)a3;
- (id)copyAssetWithAdditionalTrackID:(int)a3 mediaType:(id)a4;
- (id)copyAssetWithReplacementFormatDescription:(opaqueCMFormatDescription *)a3 forTrackID:(int)a4;
- (id)formatDescriptionsForTrackID:(int)a3;
- (id)mediaTypeForTrackID:(int)a3;
- (id)parser;
- (id)tracks;
- (void)dealloc;
@end

@implementation AVStreamDataAsset

- (AVStreamDataAsset)initWithParser:(id)a3 tracks:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)AVStreamDataAsset;
  v6 = [(AVAsset *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_weakReferenceToParser, a3);
    v7->_inspector = -[AVStreamDataAssetInspector initWithTrackIDs:]([AVStreamDataAssetInspector alloc], "initWithTrackIDs:", [a4 allKeys]);
    v7->_inspectorLoader = [[AVAssetSynchronousInspectorLoader alloc] initWithAssetInspector:v7->_inspector];
    v7->_trackDictsByTrackID = (NSDictionary *)[a4 copy];
    v7->_tracksOnce = objc_alloc_init(AVDispatchOnce);
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVStreamDataAsset;
  [(AVAsset *)&v3 dealloc];
}

- (id)parser
{
  return objc_loadWeak((id *)&self->_weakReferenceToParser);
}

- (id)copyAssetWithAdditionalTrackID:(int)a3 mediaType:(id)a4
{
  uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithInt:*(void *)&a3];
  [(NSDictionary *)self->_trackDictsByTrackID objectForKey:v6];
  id v7 = (id)[(NSDictionary *)self->_trackDictsByTrackID mutableCopy];
  objc_msgSend(v7, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", a4, @"mediaType", 0), v6);
  v8 = [AVStreamDataAsset alloc];
  id v9 = [(AVStreamDataAsset *)self parser];
  return [(AVStreamDataAsset *)v8 initWithParser:v9 tracks:v7];
}

- (id)copyAssetWithReplacementFormatDescription:(opaqueCMFormatDescription *)a3 forTrackID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v7 = (id)[(NSDictionary *)self->_trackDictsByTrackID mutableCopy];
  uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithInt:v4];
  id v9 = (id)objc_msgSend((id)objc_msgSend(v7, "objectForKey:", v8), "mutableCopy");
  if (v9)
  {
    id v10 = v9;
    [v9 setObject:a3 forKey:@"formatDescription"];
    [v7 setObject:v10 forKey:v8];
  }
  v11 = [AVStreamDataAsset alloc];
  id v12 = [(AVStreamDataAsset *)self parser];
  return [(AVStreamDataAsset *)v11 initWithParser:v12 tracks:v7];
}

- (id)copyAssetRemovingTrackID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = (id)[(NSDictionary *)self->_trackDictsByTrackID mutableCopy];
  objc_msgSend(v5, "removeObjectForKey:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", v3));
  uint64_t v6 = [AVStreamDataAsset alloc];
  id v7 = [(AVStreamDataAsset *)self parser];
  return [(AVStreamDataAsset *)v6 initWithParser:v7 tracks:v5];
}

- (id)mediaTypeForTrackID:(int)a3
{
  id result = -[NSDictionary objectForKey:](self->_trackDictsByTrackID, "objectForKey:", [MEMORY[0x1E4F28ED0] numberWithInteger:a3]);
  if (result)
  {
    return (id)[result objectForKey:@"mediaType"];
  }
  return result;
}

- (id)formatDescriptionsForTrackID:(int)a3
{
  v4[1] = *MEMORY[0x1E4F143B8];
  id result = (id)objc_msgSend(-[NSDictionary objectForKey:](self->_trackDictsByTrackID, "objectForKey:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", *(void *)&a3)), "objectForKey:", @"formatDescription");
  if (result)
  {
    v4[0] = result;
    return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  }
  return result;
}

- (id)tracks
{
  tracksOnce = self->_tracksOnce;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__AVStreamDataAsset_tracks__block_invoke;
  v5[3] = &unk_1E57B1E80;
  v5[4] = self;
  [(AVDispatchOnce *)tracksOnce runBlockOnce:v5];
  return self->_tracks;
}

id __27__AVStreamDataAsset_tracks__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "allKeys", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(v2, "addObject:", -[AVAssetTrack _initWithAsset:trackID:]([AVAssetTrack alloc], "_initWithAsset:trackID:", *(void *)(a1 + 32), objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7++), "integerValue")));
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
  id result = v2;
  *(void *)(*(void *)(a1 + 32) + 48) = result;
  return result;
}

- (OpaqueFigFormatReader)_copyFormatReader
{
  return 0;
}

- (id)_assetInspector
{
  return self->_inspector;
}

- (id)_assetInspectorLoader
{
  return self->_inspectorLoader;
}

- (Class)_classForTrackInspectors
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
}

@end