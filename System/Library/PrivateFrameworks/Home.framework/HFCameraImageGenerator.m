@interface HFCameraImageGenerator
- (HFCameraImageGenerator)initWithDelegate:(id)a3;
- (HFCameraImageGeneratorDelegate)delegate;
- (NSString)key;
- (unint64_t)imagesExpected;
- (void)generateImagesFromAsset:(id)a3 forOffsets:(id)a4 atSize:(CGSize)a5 withKey:(id)a6;
- (void)setDelegate:(id)a3;
- (void)setImagesExpected:(unint64_t)a3;
- (void)setKey:(id)a3;
@end

@implementation HFCameraImageGenerator

- (HFCameraImageGenerator)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HFCameraImageGenerator;
  v5 = [(HFCameraImageGenerator *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_imagesExpected = 0;
  }

  return v6;
}

- (void)generateImagesFromAsset:(id)a3 forOffsets:(id)a4 atSize:(CGSize)a5 withKey:(id)a6
{
  double height = a5.height;
  double width = a5.width;
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  [(HFCameraImageGenerator *)self setKey:v13];
  v23 = v11;
  v14 = [MEMORY[0x263EFA4B0] assetImageGeneratorWithAsset:v11];
  long long v35 = *MEMORY[0x263F010E0];
  long long v24 = v35;
  uint64_t v36 = *(void *)(MEMORY[0x263F010E0] + 16);
  uint64_t v15 = v36;
  [v14 setRequestedTimeToleranceBefore:&v35];
  long long v33 = v24;
  uint64_t v34 = v15;
  [v14 setRequestedTimeToleranceAfter:&v33];
  objc_msgSend(v14, "setMaximumSize:", width, height);
  -[HFCameraImageGenerator setImagesExpected:](self, "setImagesExpected:", [v12 count]);
  id v16 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v32 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v29 = 0u;
  id v17 = v12;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v30;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v30 != v19) {
          objc_enumerationMutation(v17);
        }
        [*(id *)(*((void *)&v29 + 1) + 8 * v20) doubleValue];
        memset(&v28, 0, sizeof(v28));
        CMTimeMakeWithSeconds(&v28, v21, 1);
        CMTime v27 = v28;
        v22 = [MEMORY[0x263F08D40] valueWithCMTime:&v27];
        [v16 addObject:v22];

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v18);
  }

  objc_initWeak((id *)&v28, self);
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __76__HFCameraImageGenerator_generateImagesFromAsset_forOffsets_atSize_withKey___block_invoke;
  v25[3] = &unk_264097540;
  objc_copyWeak(&v26, (id *)&v28);
  [v14 generateCGImagesAsynchronouslyForTimes:v16 completionHandler:v25];
  objc_destroyWeak(&v26);
  objc_destroyWeak((id *)&v28);
}

void __76__HFCameraImageGenerator_generateImagesFromAsset_forOffsets_atSize_withKey___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, long long *a4, uint64_t a5, void *a6)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v11 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!a3 || a5 || v11)
  {
    id v16 = HFLogForCategory(0x19uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v11;
      _os_log_error_impl(&dword_20B986000, v16, OS_LOG_TYPE_ERROR, "Error: Trying to generate image %@", buf, 0xCu);
    }

    id v13 = [WeakRetained delegate];
    v14 = [WeakRetained key];
    *(_OWORD *)buf = *(_OWORD *)a2;
    uint64_t v22 = *(void *)(a2 + 16);
    long long v19 = *a4;
    uint64_t v20 = *((void *)a4 + 2);
    [v13 imageGenerator:WeakRetained failedToGenerateImageForRequestedTime:buf actualTime:&v19 forKey:v14];
  }
  else
  {
    id v13 = [MEMORY[0x263F1C6B0] imageWithCGImage:a3];
    v14 = [WeakRetained delegate];
    uint64_t v15 = [WeakRetained key];
    *(_OWORD *)buf = *(_OWORD *)a2;
    uint64_t v22 = *(void *)(a2 + 16);
    long long v19 = *a4;
    uint64_t v20 = *((void *)a4 + 2);
    [v14 imageGenerator:WeakRetained didGenerateImage:v13 requestedTime:buf actualTime:&v19 forKey:v15];
  }
  objc_msgSend(WeakRetained, "setImagesExpected:", objc_msgSend(WeakRetained, "imagesExpected") - 1);
  if (![WeakRetained imagesExpected])
  {
    id v17 = [WeakRetained delegate];
    uint64_t v18 = [WeakRetained key];
    [v17 imageGenerator:WeakRetained finishedGeneratingImagesForKey:v18];
  }
}

- (HFCameraImageGeneratorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HFCameraImageGeneratorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (unint64_t)imagesExpected
{
  return self->_imagesExpected;
}

- (void)setImagesExpected:(unint64_t)a3
{
  self->_imagesExpected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end