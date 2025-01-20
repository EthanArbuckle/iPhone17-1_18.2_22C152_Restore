@interface AVTStickerSheetModel
+ (id)sheetModelForAvatarRecord:(id)a3 withConfigurations:(id)a4 cache:(id)a5 taskScheduler:(id)a6 renderingQueue:(id)a7 encodingQueue:(id)a8 stickerGeneratorPool:(id)a9 imageProvider:(id)a10 environment:(id)a11;
- (AVTAvatarRecord)avatarRecord;
- (AVTStickerSheetModel)initWithAvatarRecord:(id)a3 stickerItems:(id)a4 stickerRenderer:(id)a5 taskScheduler:(id)a6 placeholderProviderFactory:(id)a7 environment:(id)a8;
- (AVTTaskScheduler)taskScheduler;
- (AVTUIEnvironment)environment;
- (AVTUIStickerPlaceholderProviderFactory)placeholderProviderFactory;
- (AVTUIStickerRenderer)stickerRenderer;
- (NSArray)stickerItems;
@end

@implementation AVTStickerSheetModel

+ (id)sheetModelForAvatarRecord:(id)a3 withConfigurations:(id)a4 cache:(id)a5 taskScheduler:(id)a6 renderingQueue:(id)a7 encodingQueue:(id)a8 stickerGeneratorPool:(id)a9 imageProvider:(id)a10 environment:(id)a11
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v45 = a10;
  id v44 = a11;
  v23 = v16;
  v50 = v19;
  v51 = v18;
  v48 = v21;
  v49 = v20;
  v46 = v22;
  v53 = [[AVTUIStickerRenderer alloc] initWithAvatarRecord:v16 cache:v18 renderingScheduler:v19 renderingQueue:v20 encodingQueue:v21 stickerGeneratorPool:v22 environment:v44];
  v24 = [MEMORY[0x263EFF980] array];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id obj = v17;
  uint64_t v25 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v55 != v27) {
          objc_enumerationMutation(obj);
        }
        v29 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        v30 = [(AVTUIStickerRenderer *)v53 scheduledStickerResourceProviderForStickerConfiguration:v29];
        v31 = NSString;
        v32 = [v23 identifier];
        v33 = [v29 name];
        v34 = [v31 stringWithFormat:@"%@_%@", v32, v33];

        v35 = [AVTUIStickerItem alloc];
        v36 = [v29 localizedName];
        v37 = [(AVTUIStickerItem *)v35 initWithIdentifier:v34 localizedName:v36 resourceProvider:v30];

        [v24 addObject:v37];
      }
      uint64_t v26 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
    }
    while (v26);
  }

  v38 = +[AVTRenderingScope gridThumbnailScope];
  v39 = [v45 providerForRecord:v23 scope:v38];
  v40 = (void *)[v39 copy];

  v41 = [[AVTUIStickerPlaceholderProviderFactory alloc] initWithImageProvider:v40];
  v42 = (void *)[objc_alloc((Class)a1) initWithAvatarRecord:v23 stickerItems:v24 stickerRenderer:v53 taskScheduler:v50 placeholderProviderFactory:v41 environment:v44];

  return v42;
}

- (AVTStickerSheetModel)initWithAvatarRecord:(id)a3 stickerItems:(id)a4 stickerRenderer:(id)a5 taskScheduler:(id)a6 placeholderProviderFactory:(id)a7 environment:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)AVTStickerSheetModel;
  id v18 = [(AVTStickerSheetModel *)&v24 init];
  id v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_avatarRecord, a3);
    objc_storeStrong((id *)&v19->_stickerItems, a4);
    objc_storeStrong((id *)&v19->_stickerRenderer, a5);
    objc_storeStrong((id *)&v19->_placeholderProviderFactory, a7);
    objc_storeStrong((id *)&v19->_environment, a8);
    objc_storeStrong((id *)&v19->_taskScheduler, a6);
  }

  return v19;
}

- (AVTAvatarRecord)avatarRecord
{
  return self->_avatarRecord;
}

- (AVTTaskScheduler)taskScheduler
{
  return self->_taskScheduler;
}

- (AVTUIStickerRenderer)stickerRenderer
{
  return self->_stickerRenderer;
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (AVTUIStickerPlaceholderProviderFactory)placeholderProviderFactory
{
  return self->_placeholderProviderFactory;
}

- (NSArray)stickerItems
{
  return self->_stickerItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stickerItems, 0);
  objc_storeStrong((id *)&self->_placeholderProviderFactory, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_stickerRenderer, 0);
  objc_storeStrong((id *)&self->_taskScheduler, 0);
  objc_storeStrong((id *)&self->_avatarRecord, 0);
}

@end