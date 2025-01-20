@interface AVPlayerItemPhotosensitivityMetadataHandler
- (AVPlayerItemMediaDataCollector)metadataCollector;
- (AVPlayerItemPhotosensitivityMetadataHandler)initWithPlayerItem:(id)a3;
- (NSArray)photosensitivityRegions;
- (void)dealloc;
- (void)metadataCollector:(id)a3 didCollectDateRangeMetadataGroups:(id)a4 indexesOfNewGroups:(id)a5 indexesOfModifiedGroups:(id)a6;
- (void)setPhotosensitivityRegions:(id)a3;
@end

@implementation AVPlayerItemPhotosensitivityMetadataHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photosensitivityRegions, 0);
  objc_destroyWeak((id *)&self->_item);
  objc_storeStrong(&self->_handler, 0);

  objc_storeStrong((id *)&self->_metadataCollector, 0);
}

- (AVPlayerItemMediaDataCollector)metadataCollector
{
  return &self->_metadataCollector->super;
}

- (void)setPhotosensitivityRegions:(id)a3
{
}

- (NSArray)photosensitivityRegions
{
  return self->_photosensitivityRegions;
}

- (void)metadataCollector:(id)a3 didCollectDateRangeMetadataGroups:(id)a4 indexesOfNewGroups:(id)a5 indexesOfModifiedGroups:(id)a6
{
  [(AVPlayerItemPhotosensitivityMetadataHandler *)self setPhotosensitivityRegions:a4];
  v7 = (void *)MEMORY[0x1E4F28EA0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  id v10 = [v7 notificationWithName:@"AVPlayerItemPhotosensitiveRegionsChangedNotification" object:WeakRetained userInfo:0];

  v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 postNotification:v10];
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  [WeakRetained removeMediaDataCollector:self->_metadataCollector];

  v4.receiver = self;
  v4.super_class = (Class)AVPlayerItemPhotosensitivityMetadataHandler;
  [(AVPlayerItemPhotosensitivityMetadataHandler *)&v4 dealloc];
}

- (AVPlayerItemPhotosensitivityMetadataHandler)initWithPlayerItem:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AVPlayerItemPhotosensitivityMetadataHandler;
  v5 = [(AVPlayerItemPhotosensitivityMetadataHandler *)&v13 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_item, v4);
    id v7 = objc_alloc(MEMORY[0x1E4F16630]);
    v14[0] = @"com.apple.accessibility.video.strobing.general-flash";
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    uint64_t v9 = [v7 initWithIdentifiers:0 classifyingLabels:v8];
    metadataCollector = v6->_metadataCollector;
    v6->_metadataCollector = (AVPlayerItemMetadataCollector *)v9;

    [(AVPlayerItemMetadataCollector *)v6->_metadataCollector setDelegate:v6 queue:MEMORY[0x1E4F14428]];
    id WeakRetained = objc_loadWeakRetained((id *)&v6->_item);
    [WeakRetained addMediaDataCollector:v6->_metadataCollector];
  }
  return v6;
}

@end