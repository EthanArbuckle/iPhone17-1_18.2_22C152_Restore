@interface PHVideoResult
- (BOOL)containsValidData;
- (NSData)videoMediaItemMakerData;
- (NSString)fingerPrint;
- (NSString)uniformTypeIdentifier;
- (NSURL)videoURL;
- (PFSlowMotionTimeRangeMapper)timeRangeMapper;
- (id)allowedInfoKeys;
- (id)videoAdjustmentData;
- (void)setFingerPrint:(id)a3;
- (void)setTimeRangeMapper:(id)a3;
- (void)setUniformTypeIdentifier:(id)a3;
- (void)setVideoAdjustmentData:(id)a3;
- (void)setVideoMediaItemMakerData:(id)a3;
- (void)setVideoURL:(id)a3;
@end

@implementation PHVideoResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeRangeMapper, 0);
  objc_storeStrong((id *)&self->_uniformTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_fingerPrint, 0);
  objc_storeStrong((id *)&self->_videoMediaItemMakerData, 0);

  objc_storeStrong((id *)&self->_videoURL, 0);
}

- (void)setTimeRangeMapper:(id)a3
{
}

- (PFSlowMotionTimeRangeMapper)timeRangeMapper
{
  return self->_timeRangeMapper;
}

- (void)setUniformTypeIdentifier:(id)a3
{
}

- (NSString)uniformTypeIdentifier
{
  return self->_uniformTypeIdentifier;
}

- (void)setFingerPrint:(id)a3
{
}

- (NSString)fingerPrint
{
  return self->_fingerPrint;
}

- (void)setVideoMediaItemMakerData:(id)a3
{
}

- (NSData)videoMediaItemMakerData
{
  return self->_videoMediaItemMakerData;
}

- (void)setVideoURL:(id)a3
{
}

- (NSURL)videoURL
{
  return self->_videoURL;
}

- (id)videoAdjustmentData
{
  v2 = [(PHCompositeMediaResult *)self info];
  v3 = [v2 objectForKeyedSubscript:@"PHAdjustmentDataKey"];

  return v3;
}

- (void)setVideoAdjustmentData:(id)a3
{
}

- (id)allowedInfoKeys
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__PHVideoResult_allowedInfoKeys__block_invoke;
  block[3] = &unk_1E5848578;
  block[4] = self;
  if (allowedInfoKeys_onceToken_1629 != -1) {
    dispatch_once(&allowedInfoKeys_onceToken_1629, block);
  }
  return (id)allowedInfoKeys_allowedKeys_1630;
}

void __32__PHVideoResult_allowedInfoKeys__block_invoke(uint64_t a1)
{
  v8[2] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F1CA80]);
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)PHVideoResult;
  v3 = objc_msgSendSuper2(&v7, sel_allowedInfoKeys);
  v4 = (void *)[v2 initWithSet:v3];

  v8[0] = @"PHAdjustmentDataKey";
  v8[1] = @"PHImageResultTimeRangeMapperKey";
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  [v4 addObjectsFromArray:v5];

  v6 = (void *)allowedInfoKeys_allowedKeys_1630;
  allowedInfoKeys_allowedKeys_1630 = (uint64_t)v4;
}

- (BOOL)containsValidData
{
  return self->_videoURL || self->_videoMediaItemMakerData != 0;
}

@end