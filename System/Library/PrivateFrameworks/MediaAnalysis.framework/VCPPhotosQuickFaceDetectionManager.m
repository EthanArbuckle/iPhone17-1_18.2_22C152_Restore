@interface VCPPhotosQuickFaceDetectionManager
- (VCPPhotosQuickFaceDetectionManager)init;
- (VCPPhotosQuickFaceDetectionManager)initWithPhotoLibrary:(id)a3;
- (int)_persistFaces:(id)a3 forAsset:(id)a4;
- (int)processAsset:(id)a3;
@end

@implementation VCPPhotosQuickFaceDetectionManager

- (VCPPhotosQuickFaceDetectionManager)init
{
  return 0;
}

- (VCPPhotosQuickFaceDetectionManager)initWithPhotoLibrary:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VCPPhotosQuickFaceDetectionManager;
  v6 = [(VCPPhotosQuickFaceDetectionManager *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    v8 = +[VCPPhotosFaceProcessingContext contextWithPhotoLibrary:v5];
    v9 = [[VCPFaceAnalyzer alloc] initWithContext:v8];
    faceAnalyzer = v7->_faceAnalyzer;
    v7->_faceAnalyzer = v9;
  }
  return v7;
}

- (int)_persistFaces:(id)a3 forAsset:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __61__VCPPhotosQuickFaceDetectionManager__persistFaces_forAsset___block_invoke;
    aBlock[3] = &unk_1E62982E8;
    id v8 = v7;
    id v19 = v8;
    id v20 = v6;
    v9 = _Block_copy(aBlock);
    photoLibrary = self->_photoLibrary;
    id v17 = 0;
    BOOL v11 = [(PHPhotoLibrary *)photoLibrary performChangesAndWait:v9 error:&v17];
    id v12 = v17;
    if (v11)
    {
      int v13 = 0;
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v14 = VCPLogInstance();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v15 = [v8 localIdentifier];
          *(_DWORD *)buf = 138412546;
          v22 = v15;
          __int16 v23 = 2112;
          id v24 = v12;
          _os_log_impl(&dword_1BBEDA000, v14, OS_LOG_TYPE_ERROR, " [%@] QuickFaceDetect: failed to persist classification results: %@", buf, 0x16u);
        }
      }
      int v13 = [v12 code];
    }
  }
  else
  {
    int v13 = 0;
  }

  return v13;
}

void __61__VCPPhotosQuickFaceDetectionManager__persistFaces_forAsset___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F38ED8] changeRequestForAsset:*(void *)(a1 + 32)];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id obj = *(id *)(a1 + 40);
  uint64_t v3 = [obj countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v13;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v13 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v12 + 1) + 8 * v5);
        id v7 = [MEMORY[0x1E4F39058] creationRequestForFace];
        id v8 = [v7 placeholderForCreatedFace];
        +[VCPFaceUtils assignPropertiesOfVCPPhotosFace:v6 toPHFaceChangeRequest:v7];
        [v7 setNameSource:6];
        v16 = v8;
        v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
        [v2 addFaces:v9];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [obj countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v3);
  }

  v10 = [MEMORY[0x1E4F38EC0] quickClassificationFaceAdjustmentVersion];
  [v2 setFaceAdjustmentVersion:v10];
}

- (int)processAsset:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    uint64_t v5 = VCPLogInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = [v4 localIdentifier];
      *(_DWORD *)buf = 138412546;
      id v19 = v6;
      __int16 v20 = 1024;
      LODWORD(v21) = [v4 deferredProcessingNeeded];
      _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_INFO, " [%@] QuickFaceDetect: analyzing asset (deferType: %d)", buf, 0x12u);
    }
  }
  faceAnalyzer = self->_faceAnalyzer;
  id v17 = 0;
  int v8 = [(VCPFaceAnalyzer *)faceAnalyzer quickAnalyzeAsset:v4 results:&v17];
  id v9 = v17;
  v10 = v9;
  if (!v8)
  {
    BOOL v11 = [v9 objectForKeyedSubscript:@"FaceResults"];
    long long v12 = [v11 objectForKeyedSubscript:@"FacesToPersist"];

    int v8 = [(VCPPhotosQuickFaceDetectionManager *)self _persistFaces:v12 forAsset:v4];
    if (!v8 && (int)MediaAnalysisLogLevel() >= 6)
    {
      long long v13 = VCPLogInstance();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        long long v14 = [v4 localIdentifier];
        uint64_t v15 = [v12 count];
        *(_DWORD *)buf = 138412546;
        id v19 = v14;
        __int16 v20 = 2048;
        uint64_t v21 = v15;
        _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_INFO, " [%@] QuickFaceDetect: processed %lu faces", buf, 0x16u);
      }
    }
  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceAnalyzer, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

@end