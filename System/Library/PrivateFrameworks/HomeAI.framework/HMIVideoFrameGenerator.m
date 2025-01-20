@interface HMIVideoFrameGenerator
- (HMIVideoAssetReader)reader;
- (HMIVideoFrameGenerator)initWithVideoFragment:(id)a3;
- (void)generateVideoFramesForTimes:(id)a3 completionHandler:(id)a4;
@end

@implementation HMIVideoFrameGenerator

- (HMIVideoFrameGenerator)initWithVideoFragment:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HMIVideoFrameGenerator;
  v5 = [(HMIVideoFrameGenerator *)&v12 init];
  if (v5)
  {
    v6 = [HMIMemoryAVAsset alloc];
    v7 = [v4 data];
    v8 = [(HMIMemoryAVAsset *)v6 initWithData:v7];

    v9 = [[HMIVideoAssetReader alloc] initWithAsset:v8];
    reader = v5->_reader;
    v5->_reader = v9;
  }
  return v5;
}

- (void)generateVideoFramesForTimes:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, id))a4;
  v8 = objc_opt_new();
  v9 = objc_opt_new();
  [v8 setDelegate:v9];
  v10 = [MEMORY[0x263EFF980] array];
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  v18 = __72__HMIVideoFrameGenerator_generateVideoFramesForTimes_completionHandler___block_invoke;
  v19 = &unk_26477D238;
  id v11 = v6;
  id v20 = v11;
  id v12 = v10;
  id v21 = v12;
  [v9 setDecoderDidDecodeSampleBuffer:&v16];
  while (1)
  {
    v13 = [(HMIVideoFrameGenerator *)self reader];
    v14 = (opaqueCMSampleBuffer *)[v13 copyNextSampleBuffer];

    if (!v14) {
      break;
    }
    if (HMICMSampleBufferIsVideo(v14))
    {
      CopyWithoutEdits = (const void *)HMICMSampleBufferCreateCopyWithoutEdits(v14);
      [v8 handleSampleBuffer:CopyWithoutEdits outputFrame:1];
      CFRelease(CopyWithoutEdits);
    }
    CFRelease(v14);
  }
  [v8 flush];
  v7[2](v7, v12);
}

void __72__HMIVideoFrameGenerator_generateVideoFramesForTimes_completionHandler___block_invoke(uint64_t a1, uint64_t a2, opaqueCMSampleBuffer *a3)
{
  memset(&v10, 0, sizeof(v10));
  HMICMSampleBufferGetPresentationTimeRange(a3, &v10);
  v5 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __72__HMIVideoFrameGenerator_generateVideoFramesForTimes_completionHandler___block_invoke_2;
  v8[3] = &__block_descriptor_80_e17_B16__0__NSValue_8l;
  CMTimeRange v9 = v10;
  if (objc_msgSend(v5, "na_any:", v8))
  {
    id v6 = *(void **)(a1 + 40);
    v7 = [[HMIVideoFrame alloc] initWithSampleBuffer:a3];
    [v6 addObject:v7];
  }
}

BOOL __72__HMIVideoFrameGenerator_generateVideoFramesForTimes_completionHandler___block_invoke_2(_OWORD *a1, void *a2)
{
  if (a2) {
    [a2 CMTimeValue];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  long long v3 = a1[3];
  *(_OWORD *)&v5.start.value = a1[2];
  *(_OWORD *)&v5.start.epoch = v3;
  *(_OWORD *)&v5.duration.timescale = a1[4];
  return CMTimeRangeContainsTime(&v5, &time) != 0;
}

- (HMIVideoAssetReader)reader
{
  return (HMIVideoAssetReader *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end