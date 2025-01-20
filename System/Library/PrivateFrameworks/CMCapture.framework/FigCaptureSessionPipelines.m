@interface FigCaptureSessionPipelines
- (FigCaptureCameraSourcePipeline)firstColorCameraSourcePipeline;
- (FigCaptureMicSourcePipeline)micSourcePipeline;
- (NSArray)audioDataSinkPipelines;
- (NSArray)audioFileSinkPipelines;
- (NSArray)cameraCalibrationDataSinkPipelines;
- (NSArray)cameraSourcePipelines;
- (NSArray)cinematographyPipelines;
- (NSArray)depthDataSinkPipelines;
- (NSArray)metadataSinkPipelines;
- (NSArray)metadataSourcePipelines;
- (NSArray)movieFileSinkPipelines;
- (NSArray)pointCloudDataSinkPipelines;
- (NSArray)previewSinkPipelines;
- (NSArray)stillImageSinkPipelineSessionStorages;
- (NSArray)videoDataSinkPipelines;
- (NSArray)videoThumbnailSinkPipelines;
- (NSArray)visionDataSinkPipelines;
- (id)audioDataSinkPipelineWithSinkID:(id)a3;
- (id)audioFileSinkPipelineWithFileSinkNode:(id)a3;
- (id)audioFileSinkPipelineWithSinkID:(id)a3;
- (id)cameraCalibrationDataSinkPipelineWithSinkID:(id)a3;
- (id)cameraSourcePipelineCompatibleWithCameraConfiguration:(id)a3;
- (id)cameraSourcePipelineWithSourceID:(id)a3;
- (id)cinematographyPipelineWithSourceID:(id)a3;
- (id)depthDataSinkPipelineWithSinkID:(id)a3;
- (id)depthDataSinkPipelineWithSourceID:(id)a3 sourceDeviceType:(int)a4;
- (id)lidarDepthPipelineWithRGBCameraSourceID:(id)a3;
- (id)metadataSinkPipelineWithSinkID:(id)a3;
- (id)metadataSinkPipelineWithSourceID:(id)a3 sourceDeviceType:(int)a4;
- (id)movieFileSinkPipelineWithFileCoordinatorNode:(id)a3;
- (id)movieFileSinkPipelineWithFileSinkNode:(id)a3;
- (id)movieFileSinkPipelineWithIrisStagingNode:(id)a3;
- (id)movieFileSinkPipelineWithSinkID:(id)a3;
- (id)movieFileSinkPipelineWithSourceID:(id)a3 sourceDeviceType:(int)a4;
- (id)movieFileSinkPipelineWithVideoConnectionID:(id)a3;
- (id)pointCloudDataSinkPipelineWithSinkID:(id)a3;
- (id)previewSinkPipelineWithSinkID:(id)a3;
- (id)previewSinkPipelineWithSourceID:(id)a3 sourceDeviceType:(int)a4;
- (id)stillImageSinkPipelineSessionStorageWithSinkID:(id)a3;
- (id)stillImageSinkPipelineSessionStorageWithStillImageCoordinator:(id)a3;
- (id)videoDataSinkPipelineForMetadataWithSourceID:(id)a3 sourceDeviceType:(int)a4;
- (id)videoDataSinkPipelineWithSinkID:(id)a3;
- (id)videoThumbnailSinkPipelineWithSinkID:(id)a3;
- (id)visionDataSinkPipelineWithSinkID:(id)a3;
- (void)addAudioDataSinkPipeline:(id)a3;
- (void)addAudioFileSinkPipeline:(id)a3;
- (void)addCameraCalibrationDataSinkPipeline:(id)a3;
- (void)addCameraSourcePipeline:(id)a3;
- (void)addCinematographyPipeline:(id)a3;
- (void)addDepthDataSinkPipeline:(id)a3;
- (void)addLiDARDepthPipeline:(id)a3;
- (void)addMetadataSinkPipeline:(id)a3;
- (void)addMetadataSourcePipeline:(id)a3;
- (void)addMovieFileSinkPipeline:(id)a3;
- (void)addPointCloudDataSinkPipeline:(id)a3;
- (void)addPreviewSinkPipeline:(id)a3;
- (void)addStillImageSinkPipelineSessionStorage:(id)a3;
- (void)addVideoDataSinkPipeline:(id)a3;
- (void)addVideoThumbnailSinkPipeline:(id)a3;
- (void)addVisionDataSinkPipeline:(id)a3;
- (void)dealloc;
- (void)setMicSourcePipeline:(id)a3;
- (void)updateClientAuditToken:(id *)a3;
@end

@implementation FigCaptureSessionPipelines

- (FigCaptureCameraSourcePipeline)firstColorCameraSourcePipeline
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  cameraSourcePipelines = self->_cameraSourcePipelines;
  uint64_t v3 = [(NSMutableArray *)cameraSourcePipelines countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)v12;
LABEL_3:
  uint64_t v6 = 0;
  while (1)
  {
    if (*(void *)v12 != v5) {
      objc_enumerationMutation(cameraSourcePipelines);
    }
    v7 = *(FigCaptureCameraSourcePipeline **)(*((void *)&v11 + 1) + 8 * v6);
    unsigned int v8 = [(id)-[FigCaptureCameraSourcePipeline captureDevice]((uint64_t)v7) deviceType];
    BOOL v9 = v8 > 0x14 || ((1 << v8) & 0x100420) == 0;
    if (v9 && v8 - 21 < 0xFFFFFFFC) {
      return v7;
    }
    if (v4 == ++v6)
    {
      uint64_t v4 = [(NSMutableArray *)cameraSourcePipelines countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (NSArray)previewSinkPipelines
{
  return &self->_previewSinkPipelines->super;
}

- (FigCaptureMicSourcePipeline)micSourcePipeline
{
  return self->_micSourcePipeline;
}

- (NSArray)cameraSourcePipelines
{
  return &self->_cameraSourcePipelines->super;
}

- (id)cameraSourcePipelineWithSourceID:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  cameraSourcePipelines = self->_cameraSourcePipelines;
  uint64_t v5 = [(NSMutableArray *)cameraSourcePipelines countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(cameraSourcePipelines);
    }
    BOOL v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if (objc_msgSend((id)objc_msgSend(v9, "sourceID"), "isEqualToString:", a3)) {
      return v9;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [(NSMutableArray *)cameraSourcePipelines countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (id)metadataSinkPipelineWithSinkID:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  metadataSinkPipelines = self->_metadataSinkPipelines;
  uint64_t v5 = [(NSMutableArray *)metadataSinkPipelines countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(metadataSinkPipelines);
    }
    BOOL v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if (objc_msgSend((id)objc_msgSend(v9, "sinkID"), "isEqualToString:", a3)) {
      return v9;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [(NSMutableArray *)metadataSinkPipelines countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (id)videoThumbnailSinkPipelineWithSinkID:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  videoThumbnailSinkPipelines = self->_videoThumbnailSinkPipelines;
  uint64_t v5 = [(NSMutableArray *)videoThumbnailSinkPipelines countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(videoThumbnailSinkPipelines);
    }
    BOOL v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if (objc_msgSend((id)objc_msgSend(v9, "sinkID"), "isEqualToString:", a3)) {
      return v9;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [(NSMutableArray *)videoThumbnailSinkPipelines countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (id)videoDataSinkPipelineWithSinkID:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  videoDataSinkPipelines = self->_videoDataSinkPipelines;
  uint64_t v5 = [(NSMutableArray *)videoDataSinkPipelines countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(videoDataSinkPipelines);
    }
    BOOL v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if (objc_msgSend((id)objc_msgSend(v9, "sinkID"), "isEqualToString:", a3)) {
      return v9;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [(NSMutableArray *)videoDataSinkPipelines countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (id)depthDataSinkPipelineWithSinkID:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  depthDataSinkPipelines = self->_depthDataSinkPipelines;
  uint64_t v5 = [(NSMutableArray *)depthDataSinkPipelines countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(depthDataSinkPipelines);
    }
    BOOL v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if (objc_msgSend((id)objc_msgSend(v9, "sinkID"), "isEqualToString:", a3)) {
      return v9;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [(NSMutableArray *)depthDataSinkPipelines countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (NSArray)movieFileSinkPipelines
{
  return &self->_movieFileSinkPipelines->super;
}

- (id)movieFileSinkPipelineWithSourceID:(id)a3 sourceDeviceType:(int)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  movieFileSinkPipelines = self->_movieFileSinkPipelines;
  uint64_t v7 = [(NSMutableArray *)movieFileSinkPipelines countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (!v7) {
    return 0;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v14;
LABEL_3:
  uint64_t v10 = 0;
  while (1)
  {
    if (*(void *)v14 != v9) {
      objc_enumerationMutation(movieFileSinkPipelines);
    }
    long long v11 = *(void **)(*((void *)&v13 + 1) + 8 * v10);
    if (-[FigCaptureMovieFileSinkPipeline videoSourceDeviceType]((uint64_t)v11) == a4
      && ([(id)-[FigCaptureMovieFileSinkPipeline videoSourceID]((uint64_t)v11) isEqualToString:a3] & 1) != 0)
    {
      return v11;
    }
    if (v8 == ++v10)
    {
      uint64_t v8 = [(NSMutableArray *)movieFileSinkPipelines countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (id)videoDataSinkPipelineForMetadataWithSourceID:(id)a3 sourceDeviceType:(int)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  videoDataSinkPipelines = self->_videoDataSinkPipelines;
  uint64_t v7 = [(NSMutableArray *)videoDataSinkPipelines countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (!v7) {
    return 0;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v14;
LABEL_3:
  uint64_t v10 = 0;
  while (1)
  {
    if (*(void *)v14 != v9) {
      objc_enumerationMutation(videoDataSinkPipelines);
    }
    long long v11 = *(void **)(*((void *)&v13 + 1) + 8 * v10);
    if (-[FigCaptureVideoDataSinkPipeline sourceDeviceType]((uint64_t)v11) == a4
      && [(id)-[FigCaptureVideoDataSinkPipeline sourceID]((uint64_t)v11) isEqualToString:a3]&& (-[FigCaptureVideoDataSinkPipeline faceTrackingVideoCaptureOutput]((uint64_t)v11)|| -[FigCaptureVideoDataSinkPipeline offlineVISMotionDataCaptureOutput]((uint64_t)v11)))
    {
      return v11;
    }
    if (v8 == ++v10)
    {
      uint64_t v8 = [(NSMutableArray *)videoDataSinkPipelines countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (id)previewSinkPipelineWithSinkID:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  previewSinkPipelines = self->_previewSinkPipelines;
  uint64_t v5 = [(NSMutableArray *)previewSinkPipelines countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(previewSinkPipelines);
    }
    uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if (objc_msgSend((id)objc_msgSend(v9, "sinkID"), "isEqualToString:", a3)) {
      return v9;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [(NSMutableArray *)previewSinkPipelines countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (id)stillImageSinkPipelineSessionStorageWithSinkID:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  stillImageSinkPipelineStorages = self->_stillImageSinkPipelineStorages;
  uint64_t v5 = [(NSMutableArray *)stillImageSinkPipelineStorages countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(stillImageSinkPipelineStorages);
    }
    uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "stillImageSinkPipeline"), "sinkID"), "isEqualToString:", a3))return v9; {
    if (v6 == ++v8)
    }
    {
      uint64_t v6 = [(NSMutableArray *)stillImageSinkPipelineStorages countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (id)movieFileSinkPipelineWithIrisStagingNode:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  movieFileSinkPipelines = self->_movieFileSinkPipelines;
  uint64_t v5 = [(NSMutableArray *)movieFileSinkPipelines countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(movieFileSinkPipelines);
    }
    uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if ((id)-[FigCaptureMovieFileSinkPipeline irisStagingNode]((uint64_t)v9) == a3) {
      return v9;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [(NSMutableArray *)movieFileSinkPipelines countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (NSArray)videoDataSinkPipelines
{
  return &self->_videoDataSinkPipelines->super;
}

- (NSArray)videoThumbnailSinkPipelines
{
  return &self->_videoThumbnailSinkPipelines->super;
}

- (id)cinematographyPipelineWithSourceID:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  cinematographyPipelines = self->_cinematographyPipelines;
  uint64_t v5 = [(NSMutableArray *)cinematographyPipelines countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(cinematographyPipelines);
    }
    uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if ([(id)-[FigCaptureCinematographyPipeline sourceID]((uint64_t)v9) isEqualToString:a3]) {
      return v9;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [(NSMutableArray *)cinematographyPipelines countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (id)previewSinkPipelineWithSourceID:(id)a3 sourceDeviceType:(int)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  previewSinkPipelines = self->_previewSinkPipelines;
  uint64_t v7 = [(NSMutableArray *)previewSinkPipelines countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (!v7) {
    return 0;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v14;
LABEL_3:
  uint64_t v10 = 0;
  while (1)
  {
    if (*(void *)v14 != v9) {
      objc_enumerationMutation(previewSinkPipelines);
    }
    long long v11 = *(void **)(*((void *)&v13 + 1) + 8 * v10);
    if ([v11 sourceDeviceType] == a4
      && (objc_msgSend((id)objc_msgSend(v11, "sourceID"), "isEqualToString:", a3) & 1) != 0)
    {
      return v11;
    }
    if (v8 == ++v10)
    {
      uint64_t v8 = [(NSMutableArray *)previewSinkPipelines countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (NSArray)metadataSourcePipelines
{
  return &self->_metadataSourcePipelines->super;
}

- (void)addCameraSourcePipeline:(id)a3
{
  cameraSourcePipelines = self->_cameraSourcePipelines;
  if (!cameraSourcePipelines)
  {
    cameraSourcePipelines = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    self->_cameraSourcePipelines = cameraSourcePipelines;
  }
  [(NSMutableArray *)cameraSourcePipelines addObject:a3];
}

- (id)depthDataSinkPipelineWithSourceID:(id)a3 sourceDeviceType:(int)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  depthDataSinkPipelines = self->_depthDataSinkPipelines;
  uint64_t v7 = [(NSMutableArray *)depthDataSinkPipelines countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (!v7) {
    return 0;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v14;
LABEL_3:
  uint64_t v10 = 0;
  while (1)
  {
    if (*(void *)v14 != v9) {
      objc_enumerationMutation(depthDataSinkPipelines);
    }
    long long v11 = *(void **)(*((void *)&v13 + 1) + 8 * v10);
    if ([v11 sourceDeviceType] == a4
      && (objc_msgSend((id)objc_msgSend(v11, "sourceID"), "isEqualToString:", a3) & 1) != 0)
    {
      return v11;
    }
    if (v8 == ++v10)
    {
      uint64_t v8 = [(NSMutableArray *)depthDataSinkPipelines countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (void)addMetadataSinkPipeline:(id)a3
{
  metadataSinkPipelines = self->_metadataSinkPipelines;
  if (!metadataSinkPipelines)
  {
    metadataSinkPipelines = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    self->_metadataSinkPipelines = metadataSinkPipelines;
  }
  [(NSMutableArray *)metadataSinkPipelines addObject:a3];
}

- (void)setMicSourcePipeline:(id)a3
{
}

- (id)metadataSinkPipelineWithSourceID:(id)a3 sourceDeviceType:(int)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  metadataSinkPipelines = self->_metadataSinkPipelines;
  uint64_t v7 = [(NSMutableArray *)metadataSinkPipelines countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (!v7) {
    return 0;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v14;
LABEL_3:
  uint64_t v10 = 0;
  while (1)
  {
    if (*(void *)v14 != v9) {
      objc_enumerationMutation(metadataSinkPipelines);
    }
    long long v11 = *(void **)(*((void *)&v13 + 1) + 8 * v10);
    if (-[FigCaptureMetadataSinkPipeline sourceDeviceType]((uint64_t)v11) == a4
      && ([(id)-[FigCaptureMetadataSinkPipeline sourceID]((uint64_t)v11) isEqualToString:a3] & 1) != 0)
    {
      return v11;
    }
    if (v8 == ++v10)
    {
      uint64_t v8 = [(NSMutableArray *)metadataSinkPipelines countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (id)lidarDepthPipelineWithRGBCameraSourceID:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  lidarDepthPipelines = self->_lidarDepthPipelines;
  uint64_t v5 = [(NSMutableArray *)lidarDepthPipelines countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(lidarDepthPipelines);
    }
    uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if (objc_msgSend((id)objc_msgSend(v9, "rgbCameraSourceID"), "isEqualToString:", a3)) {
      return v9;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [(NSMutableArray *)lidarDepthPipelines countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (void)addVideoThumbnailSinkPipeline:(id)a3
{
  videoThumbnailSinkPipelines = self->_videoThumbnailSinkPipelines;
  if (!videoThumbnailSinkPipelines)
  {
    videoThumbnailSinkPipelines = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    self->_videoThumbnailSinkPipelines = videoThumbnailSinkPipelines;
  }
  [(NSMutableArray *)videoThumbnailSinkPipelines addObject:a3];
}

- (void)addVideoDataSinkPipeline:(id)a3
{
  videoDataSinkPipelines = self->_videoDataSinkPipelines;
  if (!videoDataSinkPipelines)
  {
    videoDataSinkPipelines = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    self->_videoDataSinkPipelines = videoDataSinkPipelines;
  }
  [(NSMutableArray *)videoDataSinkPipelines addObject:a3];
}

- (void)addStillImageSinkPipelineSessionStorage:(id)a3
{
  stillImageSinkPipelineStorages = self->_stillImageSinkPipelineStorages;
  if (!stillImageSinkPipelineStorages)
  {
    stillImageSinkPipelineStorages = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    self->_stillImageSinkPipelineStorages = stillImageSinkPipelineStorages;
  }
  if (!a3)
  {
    uint64_t v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], objc_msgSend(NSString, "stringWithFormat:", @"Failure to create still image sink pipeline! This is a fatal error. Please file a radar against %s", FigCaptureGetFrameworkRadarComponentName()), 0 reason userInfo];
    objc_exception_throw(v6);
  }
  [(NSMutableArray *)stillImageSinkPipelineStorages addObject:a3];
}

- (void)addPreviewSinkPipeline:(id)a3
{
  previewSinkPipelines = self->_previewSinkPipelines;
  if (!previewSinkPipelines)
  {
    previewSinkPipelines = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    self->_previewSinkPipelines = previewSinkPipelines;
  }
  [(NSMutableArray *)previewSinkPipelines addObject:a3];
}

- (void)addMovieFileSinkPipeline:(id)a3
{
  movieFileSinkPipelines = self->_movieFileSinkPipelines;
  if (!movieFileSinkPipelines)
  {
    movieFileSinkPipelines = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    self->_movieFileSinkPipelines = movieFileSinkPipelines;
  }
  [(NSMutableArray *)movieFileSinkPipelines addObject:a3];
}

- (void)addDepthDataSinkPipeline:(id)a3
{
  depthDataSinkPipelines = self->_depthDataSinkPipelines;
  if (!depthDataSinkPipelines)
  {
    depthDataSinkPipelines = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    self->_depthDataSinkPipelines = depthDataSinkPipelines;
  }
  [(NSMutableArray *)depthDataSinkPipelines addObject:a3];
}

- (id)movieFileSinkPipelineWithSinkID:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  movieFileSinkPipelines = self->_movieFileSinkPipelines;
  uint64_t v5 = [(NSMutableArray *)movieFileSinkPipelines countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(movieFileSinkPipelines);
    }
    uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if (objc_msgSend((id)objc_msgSend(v9, "sinkID"), "isEqualToString:", a3)) {
      return v9;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [(NSMutableArray *)movieFileSinkPipelines countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (id)visionDataSinkPipelineWithSinkID:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  visionDataSinkPipelines = self->_visionDataSinkPipelines;
  uint64_t v5 = [(NSMutableArray *)visionDataSinkPipelines countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(visionDataSinkPipelines);
    }
    uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if (objc_msgSend((id)objc_msgSend(v9, "sinkID"), "isEqualToString:", a3)) {
      return v9;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [(NSMutableArray *)visionDataSinkPipelines countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (void)updateClientAuditToken:(id *)a3
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  long long v102 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  uint64_t v5 = [(FigCaptureSessionPipelines *)self previewSinkPipelines];
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v102 objects:v114 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v103;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v103 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v102 + 1) + 8 * v9);
        long long v11 = *(_OWORD *)&a3->var0[4];
        long long v100 = *(_OWORD *)a3->var0;
        long long v101 = v11;
        [v10 updateClientAuditToken:&v100];
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v102 objects:v114 count:16];
    }
    while (v7);
  }
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v12 = [(FigCaptureSessionPipelines *)self videoDataSinkPipelines];
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v96 objects:v113 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v97;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v97 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v96 + 1) + 8 * v16);
        long long v18 = *(_OWORD *)&a3->var0[4];
        long long v100 = *(_OWORD *)a3->var0;
        long long v101 = v18;
        [v17 updateClientAuditToken:&v100];
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v96 objects:v113 count:16];
    }
    while (v14);
  }
  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  v19 = [(FigCaptureSessionPipelines *)self depthDataSinkPipelines];
  uint64_t v20 = [(NSArray *)v19 countByEnumeratingWithState:&v92 objects:v112 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v93;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v93 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = *(void **)(*((void *)&v92 + 1) + 8 * v23);
        long long v25 = *(_OWORD *)&a3->var0[4];
        long long v100 = *(_OWORD *)a3->var0;
        long long v101 = v25;
        [v24 updateClientAuditToken:&v100];
        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [(NSArray *)v19 countByEnumeratingWithState:&v92 objects:v112 count:16];
    }
    while (v21);
  }
  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  v26 = [(FigCaptureSessionPipelines *)self videoThumbnailSinkPipelines];
  uint64_t v27 = [(NSArray *)v26 countByEnumeratingWithState:&v88 objects:v111 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v89;
    do
    {
      uint64_t v30 = 0;
      do
      {
        if (*(void *)v89 != v29) {
          objc_enumerationMutation(v26);
        }
        uint64_t v31 = *(void *)(*((void *)&v88 + 1) + 8 * v30);
        long long v32 = *(_OWORD *)&a3->var0[4];
        long long v100 = *(_OWORD *)a3->var0;
        long long v101 = v32;
        -[FigCaptureVideoThumbnailSinkPipeline updateClientAuditToken:](v31, &v100);
        ++v30;
      }
      while (v28 != v30);
      uint64_t v28 = [(NSArray *)v26 countByEnumeratingWithState:&v88 objects:v111 count:16];
    }
    while (v28);
  }
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  v33 = [(FigCaptureSessionPipelines *)self metadataSinkPipelines];
  uint64_t v34 = [(NSArray *)v33 countByEnumeratingWithState:&v84 objects:v110 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v85;
    do
    {
      uint64_t v37 = 0;
      do
      {
        if (*(void *)v85 != v36) {
          objc_enumerationMutation(v33);
        }
        v38 = *(void **)(*((void *)&v84 + 1) + 8 * v37);
        long long v39 = *(_OWORD *)&a3->var0[4];
        long long v100 = *(_OWORD *)a3->var0;
        long long v101 = v39;
        [v38 updateClientAuditToken:&v100];
        ++v37;
      }
      while (v35 != v37);
      uint64_t v35 = [(NSArray *)v33 countByEnumeratingWithState:&v84 objects:v110 count:16];
    }
    while (v35);
  }
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  v40 = [(FigCaptureSessionPipelines *)self visionDataSinkPipelines];
  uint64_t v41 = [(NSArray *)v40 countByEnumeratingWithState:&v80 objects:v109 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v81;
    do
    {
      uint64_t v44 = 0;
      do
      {
        if (*(void *)v81 != v43) {
          objc_enumerationMutation(v40);
        }
        v45 = *(void **)(*((void *)&v80 + 1) + 8 * v44);
        long long v46 = *(_OWORD *)&a3->var0[4];
        long long v100 = *(_OWORD *)a3->var0;
        long long v101 = v46;
        [v45 updateClientAuditToken:&v100];
        ++v44;
      }
      while (v42 != v44);
      uint64_t v42 = [(NSArray *)v40 countByEnumeratingWithState:&v80 objects:v109 count:16];
    }
    while (v42);
  }
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  v47 = [(FigCaptureSessionPipelines *)self audioDataSinkPipelines];
  uint64_t v48 = [(NSArray *)v47 countByEnumeratingWithState:&v76 objects:v108 count:16];
  if (v48)
  {
    uint64_t v49 = v48;
    uint64_t v50 = *(void *)v77;
    do
    {
      uint64_t v51 = 0;
      do
      {
        if (*(void *)v77 != v50) {
          objc_enumerationMutation(v47);
        }
        v52 = *(void **)(*((void *)&v76 + 1) + 8 * v51);
        long long v53 = *(_OWORD *)&a3->var0[4];
        long long v100 = *(_OWORD *)a3->var0;
        long long v101 = v53;
        [v52 updateClientAuditToken:&v100];
        ++v51;
      }
      while (v49 != v51);
      uint64_t v49 = [(NSArray *)v47 countByEnumeratingWithState:&v76 objects:v108 count:16];
    }
    while (v49);
  }
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  v54 = [(FigCaptureSessionPipelines *)self pointCloudDataSinkPipelines];
  uint64_t v55 = [(NSArray *)v54 countByEnumeratingWithState:&v72 objects:v107 count:16];
  if (v55)
  {
    uint64_t v56 = v55;
    uint64_t v57 = *(void *)v73;
    do
    {
      uint64_t v58 = 0;
      do
      {
        if (*(void *)v73 != v57) {
          objc_enumerationMutation(v54);
        }
        v59 = *(void **)(*((void *)&v72 + 1) + 8 * v58);
        long long v60 = *(_OWORD *)&a3->var0[4];
        long long v100 = *(_OWORD *)a3->var0;
        long long v101 = v60;
        [v59 updateClientAuditToken:&v100];
        ++v58;
      }
      while (v56 != v58);
      uint64_t v56 = [(NSArray *)v54 countByEnumeratingWithState:&v72 objects:v107 count:16];
    }
    while (v56);
  }
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  v61 = [(FigCaptureSessionPipelines *)self cameraCalibrationDataSinkPipelines];
  uint64_t v62 = [(NSArray *)v61 countByEnumeratingWithState:&v68 objects:v106 count:16];
  if (v62)
  {
    uint64_t v63 = v62;
    uint64_t v64 = *(void *)v69;
    do
    {
      uint64_t v65 = 0;
      do
      {
        if (*(void *)v69 != v64) {
          objc_enumerationMutation(v61);
        }
        v66 = *(void **)(*((void *)&v68 + 1) + 8 * v65);
        long long v67 = *(_OWORD *)&a3->var0[4];
        long long v100 = *(_OWORD *)a3->var0;
        long long v101 = v67;
        [v66 updateClientAuditToken:&v100];
        ++v65;
      }
      while (v63 != v65);
      uint64_t v63 = [(NSArray *)v61 countByEnumeratingWithState:&v68 objects:v106 count:16];
    }
    while (v63);
  }
}

- (NSArray)visionDataSinkPipelines
{
  return &self->_visionDataSinkPipelines->super;
}

- (NSArray)pointCloudDataSinkPipelines
{
  return &self->_pointCloudDataSinkPipelines->super;
}

- (NSArray)metadataSinkPipelines
{
  return &self->_metadataSinkPipelines->super;
}

- (NSArray)depthDataSinkPipelines
{
  return &self->_depthDataSinkPipelines->super;
}

- (NSArray)cameraCalibrationDataSinkPipelines
{
  return &self->_cameraCalibrationDataSinkPipelines->super;
}

- (NSArray)audioDataSinkPipelines
{
  return &self->_audioDataSinkPipelines->super;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureSessionPipelines;
  [(FigCaptureSessionPipelines *)&v3 dealloc];
}

- (id)cameraSourcePipelineCompatibleWithCameraConfiguration:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v5 = [a3 sourceDeviceType];
  int v6 = [a3 sourcePosition];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  cameraSourcePipelines = self->_cameraSourcePipelines;
  uint64_t v8 = [(NSMutableArray *)cameraSourcePipelines countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (!v8) {
    return 0;
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)v16;
LABEL_3:
  uint64_t v11 = 0;
  while (1)
  {
    if (*(void *)v16 != v10) {
      objc_enumerationMutation(cameraSourcePipelines);
    }
    long long v12 = *(void **)(*((void *)&v15 + 1) + 8 * v11);
    if ([(id)-[FigCaptureCameraSourcePipeline captureDevice]((uint64_t)v12) position] == v6)
    {
      int v13 = [(id)-[FigCaptureCameraSourcePipeline captureDevice]((uint64_t)v12) deviceType];
      if (FigCaptureSourceDeviceTypeIsSubsetOfDeviceType(v5, v13, v6)) {
        return v12;
      }
    }
    if (v9 == ++v11)
    {
      uint64_t v9 = [(NSMutableArray *)cameraSourcePipelines countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (void)addMetadataSourcePipeline:(id)a3
{
  metadataSourcePipelines = self->_metadataSourcePipelines;
  if (!metadataSourcePipelines)
  {
    metadataSourcePipelines = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    self->_metadataSourcePipelines = metadataSourcePipelines;
  }
  [(NSMutableArray *)metadataSourcePipelines addObject:a3];
}

- (id)movieFileSinkPipelineWithFileSinkNode:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  movieFileSinkPipelines = self->_movieFileSinkPipelines;
  uint64_t v5 = [(NSMutableArray *)movieFileSinkPipelines countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(movieFileSinkPipelines);
    }
    uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if ([(id)-[FigCaptureMovieFileSinkPipeline movieFileSinkNodes]((uint64_t)v9) indexOfObjectIdenticalTo:a3] != 0x7FFFFFFFFFFFFFFFLL)return v9; {
    if (v6 == ++v8)
    }
    {
      uint64_t v6 = [(NSMutableArray *)movieFileSinkPipelines countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (id)movieFileSinkPipelineWithVideoConnectionID:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  movieFileSinkPipelines = self->_movieFileSinkPipelines;
  uint64_t v5 = [(NSMutableArray *)movieFileSinkPipelines countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(movieFileSinkPipelines);
    }
    uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if ([(id)-[FigCaptureMovieFileSinkPipeline videoConnectionID]((uint64_t)v9) isEqual:a3]) {
      return v9;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [(NSMutableArray *)movieFileSinkPipelines countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (id)movieFileSinkPipelineWithFileCoordinatorNode:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  movieFileSinkPipelines = self->_movieFileSinkPipelines;
  uint64_t v5 = [(NSMutableArray *)movieFileSinkPipelines countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(movieFileSinkPipelines);
    }
    uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if ((id)-[FigCaptureMovieFileSinkPipeline fileCoordinatorNode]((uint64_t)v9) == a3) {
      return v9;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [(NSMutableArray *)movieFileSinkPipelines countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (id)stillImageSinkPipelineSessionStorageWithStillImageCoordinator:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  stillImageSinkPipelineStorages = self->_stillImageSinkPipelineStorages;
  uint64_t v5 = [(NSMutableArray *)stillImageSinkPipelineStorages countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(stillImageSinkPipelineStorages);
    }
    uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if ((id)objc_msgSend((id)objc_msgSend(v9, "stillImageSinkPipeline"), "stillImageCoordinatorNode") == a3) {
      return v9;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [(NSMutableArray *)stillImageSinkPipelineStorages countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (void)addVisionDataSinkPipeline:(id)a3
{
  visionDataSinkPipelines = self->_visionDataSinkPipelines;
  if (!visionDataSinkPipelines)
  {
    visionDataSinkPipelines = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    self->_visionDataSinkPipelines = visionDataSinkPipelines;
  }
  [(NSMutableArray *)visionDataSinkPipelines addObject:a3];
}

- (void)addAudioDataSinkPipeline:(id)a3
{
  audioDataSinkPipelines = self->_audioDataSinkPipelines;
  if (!audioDataSinkPipelines)
  {
    audioDataSinkPipelines = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    self->_audioDataSinkPipelines = audioDataSinkPipelines;
  }
  [(NSMutableArray *)audioDataSinkPipelines addObject:a3];
}

- (id)audioDataSinkPipelineWithSinkID:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  audioDataSinkPipelines = self->_audioDataSinkPipelines;
  uint64_t v5 = [(NSMutableArray *)audioDataSinkPipelines countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(audioDataSinkPipelines);
    }
    uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if (objc_msgSend((id)objc_msgSend(v9, "sinkID"), "isEqualToString:", a3)) {
      return v9;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [(NSMutableArray *)audioDataSinkPipelines countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (void)addAudioFileSinkPipeline:(id)a3
{
  audioFileSinkPipelines = self->_audioFileSinkPipelines;
  if (!audioFileSinkPipelines)
  {
    audioFileSinkPipelines = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    self->_audioFileSinkPipelines = audioFileSinkPipelines;
  }
  [(NSMutableArray *)audioFileSinkPipelines addObject:a3];
}

- (id)audioFileSinkPipelineWithSinkID:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  audioFileSinkPipelines = self->_audioFileSinkPipelines;
  uint64_t v5 = [(NSMutableArray *)audioFileSinkPipelines countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(audioFileSinkPipelines);
    }
    uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if (objc_msgSend((id)objc_msgSend(v9, "sinkID"), "isEqualToString:", a3)) {
      return v9;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [(NSMutableArray *)audioFileSinkPipelines countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (id)audioFileSinkPipelineWithFileSinkNode:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  audioFileSinkPipelines = self->_audioFileSinkPipelines;
  uint64_t v5 = [(NSMutableArray *)audioFileSinkPipelines countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(audioFileSinkPipelines);
    }
    uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if ((id)-[FigCaptureAudioFileSinkPipeline audioFileSinkNode]((uint64_t)v9) == a3) {
      return v9;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [(NSMutableArray *)audioFileSinkPipelines countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (void)addPointCloudDataSinkPipeline:(id)a3
{
  pointCloudDataSinkPipelines = self->_pointCloudDataSinkPipelines;
  if (!pointCloudDataSinkPipelines)
  {
    pointCloudDataSinkPipelines = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    self->_pointCloudDataSinkPipelines = pointCloudDataSinkPipelines;
  }
  [(NSMutableArray *)pointCloudDataSinkPipelines addObject:a3];
}

- (id)pointCloudDataSinkPipelineWithSinkID:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  pointCloudDataSinkPipelines = self->_pointCloudDataSinkPipelines;
  uint64_t v5 = [(NSMutableArray *)pointCloudDataSinkPipelines countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(pointCloudDataSinkPipelines);
    }
    uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if (objc_msgSend((id)objc_msgSend(v9, "sinkID"), "isEqualToString:", a3)) {
      return v9;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [(NSMutableArray *)pointCloudDataSinkPipelines countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (void)addCameraCalibrationDataSinkPipeline:(id)a3
{
  cameraCalibrationDataSinkPipelines = self->_cameraCalibrationDataSinkPipelines;
  if (!cameraCalibrationDataSinkPipelines)
  {
    cameraCalibrationDataSinkPipelines = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    self->_cameraCalibrationDataSinkPipelines = cameraCalibrationDataSinkPipelines;
  }
  [(NSMutableArray *)cameraCalibrationDataSinkPipelines addObject:a3];
}

- (id)cameraCalibrationDataSinkPipelineWithSinkID:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  cameraCalibrationDataSinkPipelines = self->_cameraCalibrationDataSinkPipelines;
  uint64_t v5 = [(NSMutableArray *)cameraCalibrationDataSinkPipelines countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(cameraCalibrationDataSinkPipelines);
    }
    uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if (objc_msgSend((id)objc_msgSend(v9, "sinkID"), "isEqualToString:", a3)) {
      return v9;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [(NSMutableArray *)cameraCalibrationDataSinkPipelines countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (void)addCinematographyPipeline:(id)a3
{
  cinematographyPipelines = self->_cinematographyPipelines;
  if (!cinematographyPipelines)
  {
    cinematographyPipelines = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    self->_cinematographyPipelines = cinematographyPipelines;
  }
  [(NSMutableArray *)cinematographyPipelines addObject:a3];
}

- (void)addLiDARDepthPipeline:(id)a3
{
  lidarDepthPipelines = self->_lidarDepthPipelines;
  if (!lidarDepthPipelines)
  {
    lidarDepthPipelines = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    self->_lidarDepthPipelines = lidarDepthPipelines;
  }
  [(NSMutableArray *)lidarDepthPipelines addObject:a3];
}

- (NSArray)stillImageSinkPipelineSessionStorages
{
  return &self->_stillImageSinkPipelineStorages->super;
}

- (NSArray)audioFileSinkPipelines
{
  return &self->_audioFileSinkPipelines->super;
}

- (NSArray)cinematographyPipelines
{
  return &self->_cinematographyPipelines->super;
}

@end