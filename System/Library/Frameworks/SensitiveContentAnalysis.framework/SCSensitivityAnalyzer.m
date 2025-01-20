@interface SCSensitivityAnalyzer
+ (BOOL)_isCommunicationSafetyEnabled:(id)a3;
+ (BOOL)_isSensitiveContentWarningEnabled:(id)a3;
+ (BOOL)_isSensitiveContentWarningEnabledForAnyOfServices:(id)a3 scanningPolicy:(id)a4;
+ (BOOL)_isSensitiveContentWarningEnabledForApplication:(id)a3 scanningPolicy:(id)a4;
+ (BOOL)_isSensitiveContentWarningEnabledForService:(id)a3 scanningPolicy:(id)a4;
+ (BOOL)isSensitiveContentWarningEnabledForAnyOfServices:(id)a3;
+ (BOOL)isSensitiveContentWarningEnabledForService:(id)a3;
+ (Class)entitlementsReaderClass;
+ (Class)settingsReaderClass;
+ (id)subscribeForAnalysisAvailabilityChanges:(id)a3;
+ (int64_t)_analysisPolicyFrom:(id)a3;
+ (int64_t)analysisFeatureEnablement;
- (BOOL)shouldAnalyzeMedia:(id *)a3;
- (BOOL)shouldAnalyzeMediaWithType:(id)a3 error:(id)a4;
- (NSProgress)analyzeVideoFile:(NSURL *)fileURL completionHandler:(void *)completionHandler;
- (SCMediaAnalysisService)madService;
- (SCSensitivityAnalysisPolicy)analysisPolicy;
- (SCSensitivityAnalyzer)init;
- (SCSensitivityAnalyzer)initWithQueue:(id)a3;
- (SCSensitivityAnalyzer)initWithQueue:(id)a3 madService:(id)a4;
- (int64_t)_mapMOScanningPolicyEnumValue:(id)a3;
- (void)_runBlockOnDispatchQueueIfSet:(id)a3;
- (void)analyzeCGImage:(CGImage *)a3 orientation:(unsigned int)a4 completionHandler:(id)a5;
- (void)analyzeCGImage:(CGImageRef)image completionHandler:(void *)completionHandler;
- (void)analyzeFile:(id)a3 options:(unint64_t)a4 progressHandler:(id)a5 completionHandler:(id)a6;
- (void)analyzeImageFile:(NSURL *)fileURL completionHandler:(void *)completionHandler;
- (void)analyzeImageWithLocalIdentifier:(id)a3 fromPhotoLibraryWithURL:(id)a4 completionHandler:(id)a5;
- (void)analyzePixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4 completionHandler:(id)a5;
- (void)analyzeVideoFile:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5;
- (void)analyzeVideoFile:(id)a3 useBlastdoor:(BOOL)a4 progressHandler:(id)a5 completionHandler:(id)a6;
- (void)analyzeVideoWithLocalIdentifier:(id)a3 fromPhotoLibraryWithURL:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6;
- (void)setMadService:(id)a3;
@end

@implementation SCSensitivityAnalyzer

+ (id)subscribeForAnalysisAvailabilityChanges:(id)a3
{
  id v4 = a3;
  v5 = [SCSensitivityAnalysisAvailabilityObserver alloc];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  v12 = __65__SCSensitivityAnalyzer_subscribeForAnalysisAvailabilityChanges___block_invoke;
  v13 = &unk_2651CA770;
  id v14 = v4;
  id v15 = a1;
  id v6 = v4;
  v7 = +[SCManagedSettingsReader subscribeForScanningPolicyChanges:&v10];
  v8 = -[SCSensitivityAnalysisAvailabilityObserver initWithSubscription:](v5, "initWithSubscription:", v7, v10, v11, v12, v13);

  return v8;
}

- (BOOL)shouldAnalyzeMedia:(id *)a3
{
  return 1;
}

- (BOOL)shouldAnalyzeMediaWithType:(id)a3 error:(id)a4
{
  return 1;
}

- (SCSensitivityAnalysisPolicy)analysisPolicy
{
  v3 = [(SCSensitivityAnalyzer *)self madService];
  id v4 = [v3 obtainCurrentPolicy];
  SCSensitivityAnalysisPolicy v5 = [(SCSensitivityAnalyzer *)self _mapMOScanningPolicyEnumValue:v4];

  return v5;
}

+ (int64_t)analysisFeatureEnablement
{
  v3 = objc_msgSend((id)objc_msgSend(a1, "settingsReaderClass"), "currentScanningPolicy");
  int64_t v4 = [a1 _analysisPolicyFrom:v3];

  return v4;
}

+ (BOOL)isSensitiveContentWarningEnabledForService:(id)a3
{
  id v4 = a3;
  SCSensitivityAnalysisPolicy v5 = objc_msgSend((id)objc_msgSend(a1, "settingsReaderClass"), "currentScanningPolicy");
  LOBYTE(a1) = [a1 _isSensitiveContentWarningEnabledForService:v4 scanningPolicy:v5];

  return (char)a1;
}

+ (BOOL)isSensitiveContentWarningEnabledForAnyOfServices:(id)a3
{
  id v4 = a3;
  SCSensitivityAnalysisPolicy v5 = objc_msgSend((id)objc_msgSend(a1, "settingsReaderClass"), "currentScanningPolicy");
  LOBYTE(a1) = [a1 _isSensitiveContentWarningEnabledForAnyOfServices:v4 scanningPolicy:v5];

  return (char)a1;
}

uint64_t __65__SCSensitivityAnalyzer_subscribeForAnalysisAvailabilityChanges___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) _analysisPolicyFrom:a2];
  id v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);

  return v4(v2, v3);
}

- (SCSensitivityAnalyzer)init
{
  return [(SCSensitivityAnalyzer *)self initWithQueue:0];
}

- (SCSensitivityAnalyzer)initWithQueue:(id)a3
{
  id v4 = a3;
  SCSensitivityAnalysisPolicy v5 = objc_opt_new();
  id v6 = [(SCSensitivityAnalyzer *)self initWithQueue:v4 madService:v5];

  return v6;
}

- (SCSensitivityAnalyzer)initWithQueue:(id)a3 madService:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SCSensitivityAnalyzer;
  v9 = [(SCSensitivityAnalyzer *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dispatchQueue, a3);
    objc_storeStrong((id *)&v10->_madService, a4);
  }

  return v10;
}

- (void)analyzeImageFile:(NSURL *)fileURL completionHandler:(void *)completionHandler
{
  id v6 = completionHandler;
  id v7 = fileURL;
  id v8 = [(SCSensitivityAnalyzer *)self madService];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __60__SCSensitivityAnalyzer_analyzeImageFile_completionHandler___block_invoke;
  v10[3] = &unk_2651CA7C0;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 isSensitiveImage:v7 completionHandler:v10];
}

void __60__SCSensitivityAnalyzer_analyzeImageFile_completionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __60__SCSensitivityAnalyzer_analyzeImageFile_completionHandler___block_invoke_2;
  v9[3] = &unk_2651CA798;
  id v6 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v10 = v5;
  id v11 = v7;
  char v12 = a2;
  id v8 = v5;
  [v6 _runBlockOnDispatchQueueIfSet:v9];
}

void __60__SCSensitivityAnalyzer_analyzeImageFile_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = *(void (**)(uint64_t, void))(v1 + 16);
    uint64_t v3 = *(void *)(a1 + 40);
    v2(v3, 0);
  }
  else
  {
    id v5 = [[SCSensitivityAnalysis alloc] initWithNudityDetectionValue:*(unsigned __int8 *)(a1 + 48)];
    (*(void (**)(uint64_t, SCSensitivityAnalysis *, void))(v1 + 16))(v1, v5, *(void *)(a1 + 32));
  }
}

- (void)analyzeCGImage:(CGImageRef)image completionHandler:(void *)completionHandler
{
}

- (void)analyzeCGImage:(CGImage *)a3 orientation:(unsigned int)a4 completionHandler:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  id v9 = [(SCSensitivityAnalyzer *)self madService];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __70__SCSensitivityAnalyzer_analyzeCGImage_orientation_completionHandler___block_invoke;
  v11[3] = &unk_2651CA7C0;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  [v9 isSensitiveCGImage:a3 withOrientation:v5 completionHandler:v11];
}

void __70__SCSensitivityAnalyzer_analyzeCGImage_orientation_completionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __70__SCSensitivityAnalyzer_analyzeCGImage_orientation_completionHandler___block_invoke_2;
  v9[3] = &unk_2651CA798;
  id v6 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v10 = v5;
  id v11 = v7;
  char v12 = a2;
  id v8 = v5;
  [v6 _runBlockOnDispatchQueueIfSet:v9];
}

void __70__SCSensitivityAnalyzer_analyzeCGImage_orientation_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = *(void (**)(uint64_t, void))(v1 + 16);
    uint64_t v3 = *(void *)(a1 + 40);
    v2(v3, 0);
  }
  else
  {
    id v5 = [[SCSensitivityAnalysis alloc] initWithNudityDetectionValue:*(unsigned __int8 *)(a1 + 48)];
    (*(void (**)(uint64_t, SCSensitivityAnalysis *, void))(v1 + 16))(v1, v5, *(void *)(a1 + 32));
  }
}

- (void)analyzePixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4 completionHandler:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  id v9 = [(SCSensitivityAnalyzer *)self madService];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __74__SCSensitivityAnalyzer_analyzePixelBuffer_orientation_completionHandler___block_invoke;
  v11[3] = &unk_2651CA7C0;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  [v9 isSensitivePixelBuffer:a3 withOrientation:v5 completionHandler:v11];
}

void __74__SCSensitivityAnalyzer_analyzePixelBuffer_orientation_completionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __74__SCSensitivityAnalyzer_analyzePixelBuffer_orientation_completionHandler___block_invoke_2;
  v9[3] = &unk_2651CA798;
  id v6 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v10 = v5;
  id v11 = v7;
  char v12 = a2;
  id v8 = v5;
  [v6 _runBlockOnDispatchQueueIfSet:v9];
}

void __74__SCSensitivityAnalyzer_analyzePixelBuffer_orientation_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = *(void (**)(uint64_t, void))(v1 + 16);
    uint64_t v3 = *(void *)(a1 + 40);
    v2(v3, 0);
  }
  else
  {
    id v5 = [[SCSensitivityAnalysis alloc] initWithNudityDetectionValue:*(unsigned __int8 *)(a1 + 48)];
    (*(void (**)(uint64_t, SCSensitivityAnalysis *, void))(v1 + 16))(v1, v5, *(void *)(a1 + 32));
  }
}

- (NSProgress)analyzeVideoFile:(NSURL *)fileURL completionHandler:(void *)completionHandler
{
  id v6 = fileURL;
  id v7 = completionHandler;
  uint64_t v11 = 0;
  char v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy_;
  id v15 = __Block_byref_object_dispose_;
  id v16 = [MEMORY[0x263F08AB8] progressWithTotalUnitCount:100];
  [(id)v12[5] setCompletedUnitCount:0];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __60__SCSensitivityAnalyzer_analyzeVideoFile_completionHandler___block_invoke;
  v10[3] = &unk_2651CA7E8;
  v10[4] = &v11;
  [(SCSensitivityAnalyzer *)self analyzeVideoFile:v6 progressHandler:v10 completionHandler:v7];
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSProgress *)v8;
}

uint64_t __60__SCSensitivityAnalyzer_analyzeVideoFile_completionHandler___block_invoke(uint64_t a1, double a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setCompletedUnitCount:(uint64_t)a2];
}

- (void)analyzeVideoFile:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
}

- (void)analyzeVideoFile:(id)a3 useBlastdoor:(BOOL)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  BOOL v7 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = a3;
  uint64_t v13 = [(SCSensitivityAnalyzer *)self madService];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __89__SCSensitivityAnalyzer_analyzeVideoFile_useBlastdoor_progressHandler_completionHandler___block_invoke;
  v18[3] = &unk_2651CA838;
  v18[4] = self;
  id v19 = v10;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __89__SCSensitivityAnalyzer_analyzeVideoFile_useBlastdoor_progressHandler_completionHandler___block_invoke_3;
  v16[3] = &unk_2651CA7C0;
  v16[4] = self;
  id v17 = v11;
  id v14 = v11;
  id v15 = v10;
  [v13 isSensitiveVideoFile:v12 useBlastdoor:v7 progressHandler:v18 completionHandler:v16];
}

void __89__SCSensitivityAnalyzer_analyzeVideoFile_useBlastdoor_progressHandler_completionHandler___block_invoke(uint64_t a1, double a2)
{
  uint64_t v2 = *(void **)(a1 + 40);
  if (v2)
  {
    id v4 = *(void **)(a1 + 32);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __89__SCSensitivityAnalyzer_analyzeVideoFile_useBlastdoor_progressHandler_completionHandler___block_invoke_2;
    v5[3] = &unk_2651CA810;
    id v6 = v2;
    double v7 = a2;
    [v4 _runBlockOnDispatchQueueIfSet:v5];
  }
}

uint64_t __89__SCSensitivityAnalyzer_analyzeVideoFile_useBlastdoor_progressHandler_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, double))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(double *)(a1 + 40));
}

void __89__SCSensitivityAnalyzer_analyzeVideoFile_useBlastdoor_progressHandler_completionHandler___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __89__SCSensitivityAnalyzer_analyzeVideoFile_useBlastdoor_progressHandler_completionHandler___block_invoke_4;
  v9[3] = &unk_2651CA798;
  id v6 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v10 = v5;
  id v11 = v7;
  char v12 = a2;
  id v8 = v5;
  [v6 _runBlockOnDispatchQueueIfSet:v9];
}

void __89__SCSensitivityAnalyzer_analyzeVideoFile_useBlastdoor_progressHandler_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = *(void (**)(uint64_t, void))(v1 + 16);
    uint64_t v3 = *(void *)(a1 + 40);
    v2(v3, 0);
  }
  else
  {
    id v5 = [[SCSensitivityAnalysis alloc] initWithNudityDetectionValue:*(unsigned __int8 *)(a1 + 48)];
    (*(void (**)(uint64_t, SCSensitivityAnalysis *, void))(v1 + 16))(v1, v5, *(void *)(a1 + 32));
  }
}

- (void)analyzeFile:(id)a3 options:(unint64_t)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  id v7 = (void *)MEMORY[0x263F087E8];
  uint64_t v8 = *MEMORY[0x263F08438];
  id v9 = a6;
  id v10 = [v7 errorWithDomain:v8 code:45 userInfo:0];
  (*((void (**)(id, void, id))a6 + 2))(v9, 0, v10);
}

- (void)analyzeImageWithLocalIdentifier:(id)a3 fromPhotoLibraryWithURL:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(SCSensitivityAnalyzer *)self madService];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __99__SCSensitivityAnalyzer_analyzeImageWithLocalIdentifier_fromPhotoLibraryWithURL_completionHandler___block_invoke;
  v13[3] = &unk_2651CA7C0;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 isSensitiveImageWithLocalIdentifier:v10 fromPhotoLibraryWithURL:v9 completionHandler:v13];
}

void __99__SCSensitivityAnalyzer_analyzeImageWithLocalIdentifier_fromPhotoLibraryWithURL_completionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __99__SCSensitivityAnalyzer_analyzeImageWithLocalIdentifier_fromPhotoLibraryWithURL_completionHandler___block_invoke_2;
  v9[3] = &unk_2651CA798;
  id v6 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v10 = v5;
  id v11 = v7;
  char v12 = a2;
  id v8 = v5;
  [v6 _runBlockOnDispatchQueueIfSet:v9];
}

void __99__SCSensitivityAnalyzer_analyzeImageWithLocalIdentifier_fromPhotoLibraryWithURL_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = *(void (**)(uint64_t, void))(v1 + 16);
    uint64_t v3 = *(void *)(a1 + 40);
    v2(v3, 0);
  }
  else
  {
    id v5 = [[SCSensitivityAnalysis alloc] initWithNudityDetectionValue:*(unsigned __int8 *)(a1 + 48)];
    (*(void (**)(uint64_t, SCSensitivityAnalysis *, void))(v1 + 16))(v1, v5, *(void *)(a1 + 32));
  }
}

- (void)analyzeVideoWithLocalIdentifier:(id)a3 fromPhotoLibraryWithURL:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(SCSensitivityAnalyzer *)self madService];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __115__SCSensitivityAnalyzer_analyzeVideoWithLocalIdentifier_fromPhotoLibraryWithURL_progressHandler_completionHandler___block_invoke;
  v19[3] = &unk_2651CA860;
  v19[4] = self;
  id v20 = v10;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __115__SCSensitivityAnalyzer_analyzeVideoWithLocalIdentifier_fromPhotoLibraryWithURL_progressHandler_completionHandler___block_invoke_3;
  v17[3] = &unk_2651CA7C0;
  v17[4] = self;
  id v18 = v11;
  id v15 = v11;
  id v16 = v10;
  [v14 isSensitiveVideoWithLocalIdentifier:v13 fromPhotoLibraryWithURL:v12 progressHandler:v19 completionHandler:v17];
}

void __115__SCSensitivityAnalyzer_analyzeVideoWithLocalIdentifier_fromPhotoLibraryWithURL_progressHandler_completionHandler___block_invoke(uint64_t a1, double a2)
{
  uint64_t v2 = *(void **)(a1 + 40);
  if (v2)
  {
    id v4 = *(void **)(a1 + 32);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __115__SCSensitivityAnalyzer_analyzeVideoWithLocalIdentifier_fromPhotoLibraryWithURL_progressHandler_completionHandler___block_invoke_2;
    v5[3] = &unk_2651CA810;
    id v6 = v2;
    double v7 = a2;
    [v4 _runBlockOnDispatchQueueIfSet:v5];
  }
}

uint64_t __115__SCSensitivityAnalyzer_analyzeVideoWithLocalIdentifier_fromPhotoLibraryWithURL_progressHandler_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, double))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(double *)(a1 + 40));
}

void __115__SCSensitivityAnalyzer_analyzeVideoWithLocalIdentifier_fromPhotoLibraryWithURL_progressHandler_completionHandler___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __115__SCSensitivityAnalyzer_analyzeVideoWithLocalIdentifier_fromPhotoLibraryWithURL_progressHandler_completionHandler___block_invoke_4;
  v9[3] = &unk_2651CA798;
  id v6 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v10 = v5;
  id v11 = v7;
  char v12 = a2;
  id v8 = v5;
  [v6 _runBlockOnDispatchQueueIfSet:v9];
}

void __115__SCSensitivityAnalyzer_analyzeVideoWithLocalIdentifier_fromPhotoLibraryWithURL_progressHandler_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = *(void (**)(uint64_t, void))(v1 + 16);
    uint64_t v3 = *(void *)(a1 + 40);
    v2(v3, 0);
  }
  else
  {
    id v5 = [[SCSensitivityAnalysis alloc] initWithNudityDetectionValue:*(unsigned __int8 *)(a1 + 48)];
    (*(void (**)(uint64_t, SCSensitivityAnalysis *, void))(v1 + 16))(v1, v5, *(void *)(a1 + 32));
  }
}

+ (int64_t)_analysisPolicyFrom:(id)a3
{
  id v4 = a3;
  if ([a1 _isCommunicationSafetyEnabled:v4]) {
    int64_t v5 = 2;
  }
  else {
    int64_t v5 = [a1 _isSensitiveContentWarningEnabled:v4];
  }

  return v5;
}

+ (BOOL)_isCommunicationSafetyEnabled:(id)a3
{
  return [a3 policy] == 2;
}

+ (BOOL)_isSensitiveContentWarningEnabled:(id)a3
{
  id v4 = a3;
  int64_t v5 = objc_msgSend((id)objc_msgSend(a1, "entitlementsReaderClass"), "readCurrentServices");
  if (v5)
  {
    char v6 = [a1 _isSensitiveContentWarningEnabledForAnyOfServices:v5 scanningPolicy:v4];
  }
  else
  {
    id v7 = objc_msgSend((id)objc_msgSend(a1, "entitlementsReaderClass"), "readCurrentBundleIdentifier");
    char v6 = [a1 _isSensitiveContentWarningEnabledForApplication:v7 scanningPolicy:v4];
  }
  return v6;
}

+ (BOOL)_isSensitiveContentWarningEnabledForAnyOfServices:(id)a3 scanningPolicy:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        if (objc_msgSend(a1, "_isSensitiveContentWarningEnabledForService:scanningPolicy:", *(void *)(*((void *)&v15 + 1) + 8 * i), v7, (void)v15))
        {
          BOOL v13 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 0;
LABEL_11:

  return v13;
}

+ (BOOL)_isSensitiveContentWarningEnabledForService:(id)a3 scanningPolicy:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 policy] == 1)
  {
    id v7 = [v6 services];
    char v8 = [v7 containsObject:v5];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

+ (BOOL)_isSensitiveContentWarningEnabledForApplication:(id)a3 scanningPolicy:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 policy] == 1)
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x263F53EB8]) initWithBundleIdentifier:v5];
    char v8 = [v6 applications];
    char v9 = [v8 containsObject:v7];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (int64_t)_mapMOScanningPolicyEnumValue:(id)a3
{
  int64_t result = [a3 integerValue];
  if ((unint64_t)result >= 3)
  {
    id v4 = +[SCLog client];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[SCSensitivityAnalyzer _mapMOScanningPolicyEnumValue:](v4);
    }

    return 0;
  }
  return result;
}

- (void)_runBlockOnDispatchQueueIfSet:(id)a3
{
  id v4 = (void (**)(void))a3;
  id v5 = v4;
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__SCSensitivityAnalyzer__runBlockOnDispatchQueueIfSet___block_invoke;
    block[3] = &unk_2651CA888;
    char v8 = v4;
    dispatch_async(dispatchQueue, block);
  }
  else
  {
    v4[2](v4);
  }
}

uint64_t __55__SCSensitivityAnalyzer__runBlockOnDispatchQueueIfSet___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (Class)settingsReaderClass
{
  return (Class)objc_opt_class();
}

+ (Class)entitlementsReaderClass
{
  return (Class)objc_opt_class();
}

- (SCMediaAnalysisService)madService
{
  return self->_madService;
}

- (void)setMadService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_madService, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

- (void)_mapMOScanningPolicyEnumValue:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_2451C6000, log, OS_LOG_TYPE_ERROR, "MAD returns unrecognized MOScanningPolicy, if you see this error - please file a radar!", v1, 2u);
}

@end