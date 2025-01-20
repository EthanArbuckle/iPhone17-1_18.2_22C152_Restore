@interface HFCameraTimelapsePosterFrameGenerator
- (HFCameraTimelapseClipInfoProvider)timelapseClipInfoProvider;
- (HFCameraTimelapsePosterFrameGenerator)initWithTimelapseClipInfoProvider:(id)a3 andDelegate:(id)a4;
- (HFCameraTimelapsePosterFrameGeneratorDelegate)delegate;
- (NSMutableDictionary)posterFrameGenerationRequests;
- (OS_dispatch_queue)generationQueue;
- (id)_generateOffsetsForHighQualityClip:(id)a3 withStep:(unint64_t)a4;
- (id)_generateTimelapseOffsetsFromOffsets:(id)a3 forTimelapseDiff:(double)a4;
- (id)_generationRequestForImageGenerator:(id)a3 withKey:(id)a4;
- (id)generatePosterFramesForHighQualityClip:(id)a3 withStep:(unint64_t)a4 atSize:(CGSize)a5;
- (void)_generatePosterFramesForAsset:(id)a3 forOffsets:(id)a4 atSize:(CGSize)a5 withHighQualityClip:(id)a6 andTimelapseOffset:(double)a7;
- (void)_generatePosterFramesForTimelapseClip:(id)a3 withHighQualityClip:(id)a4 forOffsets:(id)a5 atSize:(CGSize)a6;
- (void)_removeGenerationRequestForImageGenerator:(id)a3 withKey:(id)a4;
- (void)dealloc;
- (void)imageGenerator:(id)a3 didGenerateImage:(id)a4 requestedTime:(id *)a5 actualTime:(id *)a6 forKey:(id)a7;
- (void)imageGenerator:(id)a3 failedToGenerateImageForRequestedTime:(id *)a4 actualTime:(id *)a5 forKey:(id)a6;
- (void)imageGenerator:(id)a3 finishedGeneratingImagesForKey:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setGenerationQueue:(id)a3;
- (void)setPosterFrameGenerationRequests:(id)a3;
- (void)setTimelapseClipInfoProvider:(id)a3;
@end

@implementation HFCameraTimelapsePosterFrameGenerator

- (HFCameraTimelapsePosterFrameGenerator)initWithTimelapseClipInfoProvider:(id)a3 andDelegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HFCameraTimelapsePosterFrameGenerator;
  v8 = [(HFCameraTimelapsePosterFrameGenerator *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_timelapseClipInfoProvider, v6);
    objc_storeWeak((id *)&v9->_delegate, v7);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.home.HFCameraTimelapsePosterFrameGenerator.generationQueue", MEMORY[0x263EF83A8]);
    generationQueue = v9->_generationQueue;
    v9->_generationQueue = (OS_dispatch_queue *)v10;

    uint64_t v12 = [MEMORY[0x263EFF9A0] dictionary];
    posterFrameGenerationRequests = v9->_posterFrameGenerationRequests;
    v9->_posterFrameGenerationRequests = (NSMutableDictionary *)v12;
  }
  return v9;
}

- (void)dealloc
{
  v3 = [(HFCameraTimelapsePosterFrameGenerator *)self posterFrameGenerationRequests];
  [v3 removeAllObjects];

  v4.receiver = self;
  v4.super_class = (Class)HFCameraTimelapsePosterFrameGenerator;
  [(HFCameraTimelapsePosterFrameGenerator *)&v4 dealloc];
}

- (id)generatePosterFramesForHighQualityClip:(id)a3 withStep:(unint64_t)a4 atSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  location[3] = *(id *)MEMORY[0x263EF8340];
  id v9 = a3;
  dispatch_queue_t v10 = [(HFCameraTimelapsePosterFrameGenerator *)self timelapseClipInfoProvider];
  v11 = [v9 startDate];
  uint64_t v12 = [v10 timelapseClipPositionForDate:v11 inHighQualityClip:v9];

  if (v12)
  {
    id v13 = [(HFCameraTimelapsePosterFrameGenerator *)self _generateOffsetsForHighQualityClip:v9 withStep:a4];
    if (+[HFUtilities isInternalTest])
    {
      v14 = [v12 clip];
      -[HFCameraTimelapsePosterFrameGenerator _generatePosterFramesForTimelapseClip:withHighQualityClip:forOffsets:atSize:](self, "_generatePosterFramesForTimelapseClip:withHighQualityClip:forOffsets:atSize:", v14, v9, v13, width, height);
    }
    else
    {
      objc_initWeak(location, self);
      v17 = [(HFCameraTimelapsePosterFrameGenerator *)self generationQueue];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __96__HFCameraTimelapsePosterFrameGenerator_generatePosterFramesForHighQualityClip_withStep_atSize___block_invoke;
      v21[3] = &unk_264098C58;
      objc_copyWeak(v25, location);
      id v22 = v12;
      id v23 = v9;
      id v18 = v13;
      id v24 = v18;
      v25[1] = *(id *)&width;
      v25[2] = *(id *)&height;
      dispatch_async(v17, v21);

      v19 = v24;
      id v13 = v18;

      objc_destroyWeak(v25);
      objc_destroyWeak(location);
    }
  }
  else
  {
    objc_super v15 = HFLogForCategory(0x19uLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v9;
      _os_log_error_impl(&dword_20B986000, v15, OS_LOG_TYPE_ERROR, "Error: Poster generator missing timelapse for clip %@", (uint8_t *)location, 0xCu);
    }

    v16 = [(HFCameraTimelapsePosterFrameGenerator *)self delegate];
    [v16 failedToFindTimelapseClipForHighQualityClip:v9];

    id v13 = (id)MEMORY[0x263EFFA68];
  }

  return v13;
}

void __96__HFCameraTimelapsePosterFrameGenerator_generatePosterFramesForHighQualityClip_withStep_atSize___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v2 = [*(id *)(a1 + 32) clip];
  objc_msgSend(WeakRetained, "_generatePosterFramesForTimelapseClip:withHighQualityClip:forOffsets:atSize:", v2, *(void *)(a1 + 40), *(void *)(a1 + 48), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

- (void)_generatePosterFramesForTimelapseClip:(id)a3 withHighQualityClip:(id)a4 forOffsets:(id)a5 atSize:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = [(HFCameraTimelapsePosterFrameGenerator *)self timelapseClipInfoProvider];
  objc_super v15 = [v14 timelapseURLForTimelapseClip:v11];

  v16 = [v11 startDate];
  v17 = [v12 startDate];
  [v16 timeIntervalSinceDate:v17];
  double v19 = v18;

  v20 = [MEMORY[0x263F08850] defaultManager];
  v21 = [v15 path];
  int v22 = [v20 fileExistsAtPath:v21];

  if (v22)
  {
    id v23 = [MEMORY[0x263EFA470] assetWithURL:v15];
    -[HFCameraTimelapsePosterFrameGenerator _generatePosterFramesForAsset:forOffsets:atSize:withHighQualityClip:andTimelapseOffset:](self, "_generatePosterFramesForAsset:forOffsets:atSize:withHighQualityClip:andTimelapseOffset:", v23, v13, v12, width, height, v19);
  }
  else
  {
    id v24 = HFLogForCategory(0x19uLL);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      int v26 = 138412546;
      id v27 = v11;
      __int16 v28 = 2112;
      id v29 = v12;
      _os_log_error_impl(&dword_20B986000, v24, OS_LOG_TYPE_ERROR, "Error: No file for timelapse clip %@ for clip %@", (uint8_t *)&v26, 0x16u);
    }

    v25 = [(HFCameraTimelapsePosterFrameGenerator *)self delegate];
    [v25 failedToFindTimelapseClipForHighQualityClip:v12];
  }
}

- (void)_generatePosterFramesForAsset:(id)a3 forOffsets:(id)a4 atSize:(CGSize)a5 withHighQualityClip:(id)a6 andTimelapseOffset:(double)a7
{
  double height = a5.height;
  double width = a5.width;
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  v16 = [v15 uniqueIdentifier];
  v17 = [v16 UUIDString];

  double v18 = [[HFCameraImageGenerator alloc] initWithDelegate:self];
  objc_initWeak(&location, self);
  double v19 = [(HFCameraTimelapsePosterFrameGenerator *)self generationQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __128__HFCameraTimelapsePosterFrameGenerator__generatePosterFramesForAsset_forOffsets_atSize_withHighQualityClip_andTimelapseOffset___block_invoke;
  block[3] = &unk_264098C80;
  objc_copyWeak(v37, &location);
  id v20 = v15;
  id v34 = v20;
  v37[1] = *(id *)&a7;
  v21 = v18;
  v35 = v21;
  id v22 = v17;
  id v36 = v22;
  dispatch_barrier_async(v19, block);

  if (+[HFUtilities isInternalTest])
  {
    id v23 = [(HFCameraTimelapsePosterFrameGenerator *)self _generateTimelapseOffsetsFromOffsets:v14 forTimelapseDiff:a7];
    -[HFCameraImageGenerator generateImagesFromAsset:forOffsets:atSize:withKey:](v21, "generateImagesFromAsset:forOffsets:atSize:withKey:", v13, v23, v22, width, height);
  }
  else
  {
    id v24 = [(HFCameraTimelapsePosterFrameGenerator *)self generationQueue];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __128__HFCameraTimelapsePosterFrameGenerator__generatePosterFramesForAsset_forOffsets_atSize_withHighQualityClip_andTimelapseOffset___block_invoke_2;
    id v25[3] = &unk_264098CA8;
    v25[4] = self;
    id v26 = v14;
    double v30 = a7;
    id v27 = v21;
    id v28 = v13;
    double v31 = width;
    double v32 = height;
    id v29 = v22;
    dispatch_async(v24, v25);
  }
  objc_destroyWeak(v37);
  objc_destroyWeak(&location);
}

void __128__HFCameraTimelapsePosterFrameGenerator__generatePosterFramesForAsset_forOffsets_atSize_withHighQualityClip_andTimelapseOffset___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v2 = objc_alloc_init(HFCameraTimelapsePosterFrameGenerationRequest);
  [(HFCameraTimelapsePosterFrameGenerationRequest *)v2 setClip:*(void *)(a1 + 32)];
  [(HFCameraTimelapsePosterFrameGenerationRequest *)v2 setTimelapseOffset:*(double *)(a1 + 64)];
  [(HFCameraTimelapsePosterFrameGenerationRequest *)v2 setImageGenerator:*(void *)(a1 + 40)];
  v3 = [WeakRetained posterFrameGenerationRequests];
  objc_super v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 48)];

  if (!v4)
  {
    objc_super v4 = [MEMORY[0x263EFF980] array];
  }
  [v4 addObject:v2];
  v5 = [WeakRetained posterFrameGenerationRequests];
  [v5 setObject:v4 forKeyedSubscript:*(void *)(a1 + 48)];
}

void __128__HFCameraTimelapsePosterFrameGenerator__generatePosterFramesForAsset_forOffsets_atSize_withHighQualityClip_andTimelapseOffset___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _generateTimelapseOffsetsFromOffsets:*(void *)(a1 + 40) forTimelapseDiff:*(double *)(a1 + 72)];
  objc_msgSend(*(id *)(a1 + 48), "generateImagesFromAsset:forOffsets:atSize:withKey:", *(void *)(a1 + 56), v2, *(void *)(a1 + 64), *(double *)(a1 + 80), *(double *)(a1 + 88));
}

- (id)_generateOffsetsForHighQualityClip:(id)a3 withStep:(unint64_t)a4
{
  id v5 = a3;
  id v6 = [MEMORY[0x263EFF980] array];
  if (a4)
  {
    [v5 duration];
    if (v7 > 0.0)
    {
      double v8 = 0.0;
      unint64_t v9 = a4;
      do
      {
        dispatch_queue_t v10 = [NSNumber numberWithDouble:v8];
        [v6 addObject:v10];

        double v8 = (double)v9;
        [v5 duration];
        v9 += a4;
      }
      while (v11 > v8);
    }
  }
  else
  {
    id v12 = [NSNumber numberWithDouble:0.0];
    [v6 addObject:v12];
  }
  return v6;
}

- (id)_generateTimelapseOffsetsFromOffsets:(id)a3 forTimelapseDiff:(double)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [MEMORY[0x263EFF980] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "doubleValue", (void)v15);
        id v13 = [NSNumber numberWithDouble:v12 - a4];
        [v6 addObject:v13];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  return v6;
}

- (void)imageGenerator:(id)a3 didGenerateImage:(id)a4 requestedTime:(id *)a5 actualTime:(id *)a6 forKey:(id)a7
{
  id v11 = a4;
  double v12 = [(HFCameraTimelapsePosterFrameGenerator *)self _generationRequestForImageGenerator:a3 withKey:a7];
  CMTime v18 = *(CMTime *)a5;
  double Seconds = CMTimeGetSeconds(&v18);
  [v12 timelapseOffset];
  *(float *)&double v14 = Seconds + v14;
  double v15 = roundf(*(float *)&v14);
  long long v16 = [(HFCameraTimelapsePosterFrameGenerator *)self delegate];
  long long v17 = [v12 clip];
  [v16 didGeneratePosterFrame:v11 forHighQualityClip:v17 atOffset:v15 withTimelapseOffset:Seconds];
}

- (void)imageGenerator:(id)a3 failedToGenerateImageForRequestedTime:(id *)a4 actualTime:(id *)a5 forKey:(id)a6
{
  uint64_t v8 = -[HFCameraTimelapsePosterFrameGenerator _generationRequestForImageGenerator:withKey:](self, "_generationRequestForImageGenerator:withKey:", a3, a6, a5);
  CMTime v14 = *(CMTime *)a4;
  double Seconds = CMTimeGetSeconds(&v14);
  [v8 timelapseOffset];
  double v11 = Seconds + v10;
  double v12 = [(HFCameraTimelapsePosterFrameGenerator *)self delegate];
  id v13 = [v8 clip];
  [v12 failedToGeneratePosterFrameForHighQualityClip:v13 atOffset:v11];
}

- (void)imageGenerator:(id)a3 finishedGeneratingImagesForKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v8 = [(HFCameraTimelapsePosterFrameGenerator *)self generationQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __87__HFCameraTimelapsePosterFrameGenerator_imageGenerator_finishedGeneratingImagesForKey___block_invoke;
  v11[3] = &unk_2640905E0;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_barrier_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __87__HFCameraTimelapsePosterFrameGenerator_imageGenerator_finishedGeneratingImagesForKey___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _removeGenerationRequestForImageGenerator:*(void *)(a1 + 32) withKey:*(void *)(a1 + 40)];
}

- (id)_generationRequestForImageGenerator:(id)a3 withKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HFCameraTimelapsePosterFrameGenerator *)self posterFrameGenerationRequests];
  id v9 = [v8 objectForKeyedSubscript:v7];

  if (v9)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __85__HFCameraTimelapsePosterFrameGenerator__generationRequestForImageGenerator_withKey___block_invoke;
    v12[3] = &unk_264098CD0;
    id v13 = v6;
    id v10 = objc_msgSend(v9, "na_firstObjectPassingTest:", v12);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

uint64_t __85__HFCameraTimelapsePosterFrameGenerator__generationRequestForImageGenerator_withKey___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 imageGenerator];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (void)_removeGenerationRequestForImageGenerator:(id)a3 withKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HFCameraTimelapsePosterFrameGenerator *)self posterFrameGenerationRequests];
  id v9 = [v8 objectForKeyedSubscript:v7];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __91__HFCameraTimelapsePosterFrameGenerator__removeGenerationRequestForImageGenerator_withKey___block_invoke;
  v13[3] = &unk_264098CD0;
  id v14 = v6;
  id v10 = v6;
  double v11 = objc_msgSend(v9, "na_firstObjectPassingTest:", v13);
  if (v11) {
    [v9 removeObject:v11];
  }
  if (![v9 count])
  {
    id v12 = [(HFCameraTimelapsePosterFrameGenerator *)self posterFrameGenerationRequests];
    [v12 setObject:0 forKeyedSubscript:v7];
  }
}

uint64_t __91__HFCameraTimelapsePosterFrameGenerator__removeGenerationRequestForImageGenerator_withKey___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 imageGenerator];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (HFCameraTimelapsePosterFrameGeneratorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HFCameraTimelapsePosterFrameGeneratorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HFCameraTimelapseClipInfoProvider)timelapseClipInfoProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_timelapseClipInfoProvider);
  return (HFCameraTimelapseClipInfoProvider *)WeakRetained;
}

- (void)setTimelapseClipInfoProvider:(id)a3
{
}

- (OS_dispatch_queue)generationQueue
{
  return self->_generationQueue;
}

- (void)setGenerationQueue:(id)a3
{
}

- (NSMutableDictionary)posterFrameGenerationRequests
{
  return self->_posterFrameGenerationRequests;
}

- (void)setPosterFrameGenerationRequests:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_posterFrameGenerationRequests, 0);
  objc_storeStrong((id *)&self->_generationQueue, 0);
  objc_destroyWeak((id *)&self->_timelapseClipInfoProvider);
  objc_destroyWeak((id *)&self->_delegate);
}

@end