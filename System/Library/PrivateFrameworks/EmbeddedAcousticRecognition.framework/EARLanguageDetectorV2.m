@interface EARLanguageDetectorV2
@end

@implementation EARLanguageDetectorV2

void __51___EARLanguageDetectorV2_languageDetectorV2Result___block_invoke(void *a1, void *a2, void *a3)
{
  id v12 = a2;
  id v6 = a3;
  [v6 floatValue];
  float v8 = v7;
  int v9 = [v12 hasPrefix:@"en"];
  double v10 = v8;
  if (v9) {
    *(double *)(*(void *)(a1[4] + 8) + 24) = *(double *)(*(void *)(a1[4] + 8) + 24) + v10;
  }
  uint64_t v11 = *(void *)(a1[5] + 8);
  if (*(double *)(v11 + 24) < v10)
  {
    *(double *)(v11 + 24) = v10;
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
  }
}

void __43___EARLanguageDetectorV2__startComputeTask__block_invoke(uint64_t a1)
{
  uint64_t v2 = (*(uint64_t (**)(void))(**(void **)(*(void *)(a1 + 48) + 16) + 8))(*(void *)(*(void *)(a1 + 48) + 16));
  int v3 = quasar::PSRAudioProcessor::frameDurationMs(*(quasar::PSRAudioProcessor **)(a1 + 48));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v20 = [WeakRetained lidDelegate];

  v26 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  kaldi::Vector<float>::Resize(&v26, v2, 0);
  int v5 = 0;
  id v6 = 0;
  int v7 = 0;
  while (1)
  {
    kaldi::Matrix<float>::Matrix((uint64_t)buf, 1, v2, 0, 0);
    char v8 = quasar::PSRAudioProcessor::compute(*(void *)(a1 + 48), (uint64_t)buf);
    if ((int)kaldi::MatrixBase<float>::NumRows((uint64_t)buf) >= 1) {
      break;
    }
LABEL_13:
    kaldi::Matrix<float>::~Matrix((uint64_t)buf);
    if ((v8 & 1) == 0) {
      goto LABEL_16;
    }
  }
  if ([*(id *)(*(void *)(a1 + 32) + 1608) useMaxpool])
  {
    if (!v7)
    {
      uint64_t v22 = 0;
      uint64_t v23 = 0;
      uint64_t v21 = *(void *)buf;
      uint64_t v9 = kaldi::MatrixBase<float>::NumCols((uint64_t)buf);
      LODWORD(v22) = v9;
      kaldi::Vector<float>::Resize(&v26, v9, 1);
      kaldi::VectorBase<float>::CopyFromVec((uint64_t)&v26, (const void **)&v21);
    }
    maxpool((uint64_t)buf, &v26);
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    uint64_t v23 = 0;
    kaldi::Vector<float>::Resize((void **)&v21, v27, 1);
    kaldi::VectorBase<float>::CopyFromVec((uint64_t)&v21, (const void **)&v26);
    uint64_t v10 = [*(id *)(a1 + 32) earLIDScores:&v21];

    kaldi::Vector<float>::Destroy((uint64_t)&v21);
  }
  else
  {
    int v11 = kaldi::MatrixBase<float>::NumRows((uint64_t)buf);
    uint64_t v22 = 0;
    uint64_t v23 = 0;
    uint64_t v21 = *(void *)buf + 4 * v25 * (v11 - 1);
    LODWORD(v22) = kaldi::MatrixBase<float>::NumCols((uint64_t)buf);
    uint64_t v10 = [*(id *)(a1 + 32) earLIDScores:&v21];
  }
  id v6 = (void *)v10;
  v7 += kaldi::MatrixBase<float>::NumRows((uint64_t)buf) * v3;
  if (v8)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "shouldReportResults:reportingFrequency:", v7 - v5, objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1608), "reportingFrequency")))
    {
      if (objc_opt_respondsToSelector())
      {
        id v12 = *(void **)(a1 + 32);
        v13 = [v12 languageDetectorV2Result:v10];
        [v20 languageDetector:v12 didProduceResult:v13 processedAudioDuration:(double)v7 / 1000.0];
      }
      int v5 = v7;
    }
    goto LABEL_13;
  }
  kaldi::Matrix<float>::~Matrix((uint64_t)buf);
LABEL_16:
  if (v5 < v7 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v14 = *(void **)(a1 + 32);
    v15 = [v14 languageDetectorV2Result:v6];
    [v20 languageDetector:v14 didProduceResult:v15 processedAudioDuration:(double)v7 / 1000.0];
  }
  uint64_t v16 = objc_opt_respondsToSelector();
  if (v16)
  {
    uint64_t v17 = *(void *)(a1 + 32);
    v18 = objc_alloc_init(_EARLanguageDetectorV2LoggingInfo);
    [v20 languageDetector:v17 didCompleteProcessingWithLoggingInfo:v18];
  }
  v19 = EARLogger::QuasarOSLogger((EARLogger *)v16);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B1A86000, v19, OS_LOG_TYPE_INFO, "ComputeTask done", buf, 2u);
  }

  kaldi::Vector<float>::Destroy((uint64_t)&v26);
}

@end