@interface VKMapSnapshotCreator
@end

@implementation VKMapSnapshotCreator

void __90__VKMapSnapshotCreator_MapKitAdditions___mapkit_configureWithOptions_configuration_scale___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v4 = objc_msgSend(*(id *)(a1 + 32), "_overlayRenderersForOverlayLevel:", a2, 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = (void *)MEMORY[0x1E4FB3A50];
        v11 = [v9 overlay];
        v12 = [v10 overlayWithDrawable:v9 forOverlay:v11 atLevel:a2];

        [v9 setContentScaleFactor:*(double *)(a1 + 48)];
        [*(id *)(a1 + 40) addOverlay:v12];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

@end