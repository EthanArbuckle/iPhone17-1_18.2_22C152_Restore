@interface ARQAHelper
+ (float)_meanDepthValueOfDepthBuffer:(__CVBuffer *)a3 consideringSegmentation:(BOOL)a4 ofSegmentationBuffer:(__CVBuffer *)a5;
+ (id)arrayFromRaycastResults:(id)a3;
+ (id)arrayOf2dPoints:(id)a1 count:(SEL)a2;
+ (id)arrayOf3dPoints:(id)a1 count:(SEL)a2;
+ (id)arrayOfUUIDSet:(id)a3;
+ (id)arrayWithMatrix3x3:(__n128)a3;
+ (id)arrayWithMatrix4x4:(__n128)a3;
+ (id)arrayWithVector2:(id)a1;
+ (id)arrayWithVector3:(id)a1;
+ (id)arrayWithVector4:(id)a1;
+ (id)dictionaryFromAnchor:(id)a3;
+ (id)dictionaryFromCLLocation:(id)a3;
+ (id)dictionaryFromMeshAnchor:(id)a3;
+ (id)dictionaryFromMeshGeometry:(id)a3;
+ (id)dictionaryFromPatchGrid:(id)a3;
+ (id)dictionaryFromPlaneAnchor:(id)a3;
+ (id)dictionaryFromPlaneExtent:(id)a3;
+ (id)dictionaryFromRawCLLocation:(id)a3;
+ (id)dictionaryFromRaycastQuery:(id)a3;
+ (id)dictionaryFromVertices:(id)a1 vertexCount:(SEL)a2 textureCoordinates:textureCoordinateCount:;
+ (id)extractAnchorDataForFrame:(id)a3;
+ (id)extractDetectedBodiesForFrame:(id)a3;
+ (id)formatDescriptionForAnchor;
+ (id)formatDescriptionForPlaneAnchor;
+ (id)generateTagsForConfiguration:(id)a3 replaySensor:(id)a4 technique:(id)a5;
+ (id)headerInformationWithConfiguration:(id)a3 technique:(id)a4;
+ (id)traceFrameData:(id)a3 withFrameIndex:(unint64_t)a4;
+ (id)traceFrameData:(id)a3 withFrameIndex:(unint64_t)a4 writeOBJ:(BOOL)a5;
+ (void)techniquesArray:(id)a3 array:(id)a4;
+ (void)traverseTechniques:(id)a3 withBlock:(id)a4;
@end

@implementation ARQAHelper

+ (id)arrayWithVector2:(id)a1
{
  v8[2] = *MEMORY[0x1E4F143B8];
  float v7 = *((float *)&v2 + 1);
  v3 = ARFloat(*(float *)&v2);
  v8[0] = v3;
  v4 = ARFloat(v7);
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];

  return v5;
}

+ (id)arrayWithVector3:(id)a1
{
  v9[3] = *MEMORY[0x1E4F143B8];
  long long v8 = v2;
  v3 = ARFloat(*(float *)&v2);
  v9[0] = v3;
  v4 = ARFloat(*((float *)&v8 + 1));
  v9[1] = v4;
  v5 = ARFloat(*((float *)&v8 + 2));
  v9[2] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:3];

  return v6;
}

+ (id)arrayWithVector4:(id)a1
{
  v10[4] = *MEMORY[0x1E4F143B8];
  long long v9 = v2;
  v3 = ARFloat(*(float *)&v2);
  v10[0] = v3;
  v4 = ARFloat(*((float *)&v9 + 1));
  v10[1] = v4;
  v5 = ARFloat(*((float *)&v9 + 2));
  v10[2] = v5;
  v6 = ARFloat(*((float *)&v9 + 3));
  v10[3] = v6;
  float v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:4];

  return v7;
}

+ (id)arrayWithMatrix4x4:(__n128)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  __n128 v21 = a1;
  v20 = ARFloat(a1.n128_f32[0]);
  v25 = v20;
  uint64_t v26 = ARFloat(v21.n128_f32[1]);
  v19 = (void *)v26;
  v18 = ARFloat(v21.n128_f32[2]);
  v27 = v18;
  v21.n128_u64[0] = ARFloat(v21.n128_f32[3]);
  unint64_t v28 = v21.n128_u64[0];
  v17 = ARFloat(a2.n128_f32[0]);
  v29 = v17;
  v16 = ARFloat(a2.n128_f32[1]);
  v30 = v16;
  v15 = ARFloat(a2.n128_f32[2]);
  v31 = v15;
  v4 = ARFloat(a2.n128_f32[3]);
  v32 = v4;
  v5 = ARFloat(a3.n128_f32[0]);
  v33 = v5;
  v6 = ARFloat(a3.n128_f32[1]);
  v34 = v6;
  float v7 = ARFloat(a3.n128_f32[2]);
  v35 = v7;
  long long v8 = ARFloat(a3.n128_f32[3]);
  v36 = v8;
  long long v9 = ARFloat(a4.n128_f32[0]);
  v37 = v9;
  v10 = ARFloat(a4.n128_f32[1]);
  v38 = v10;
  v11 = ARFloat(a4.n128_f32[2]);
  v39 = v11;
  v12 = ARFloat(a4.n128_f32[3]);
  v40 = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:16];

  return v13;
}

+ (id)arrayWithMatrix3x3:(__n128)a3
{
  v17[9] = *MEMORY[0x1E4F143B8];
  v3 = ARFloat(a1.n128_f32[0]);
  v17[0] = v3;
  v4 = ARFloat(a1.n128_f32[1]);
  v17[1] = v4;
  v5 = ARFloat(a1.n128_f32[2]);
  v17[2] = v5;
  v6 = ARFloat(a2.n128_f32[0]);
  v17[3] = v6;
  float v7 = ARFloat(a2.n128_f32[1]);
  v17[4] = v7;
  long long v8 = ARFloat(a2.n128_f32[2]);
  v17[5] = v8;
  long long v9 = ARFloat(a3.n128_f32[0]);
  v17[6] = v9;
  v10 = ARFloat(a3.n128_f32[1]);
  v17[7] = v10;
  v11 = ARFloat(a3.n128_f32[2]);
  v17[8] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:9];

  return v12;
}

+ (id)arrayOf2dPoints:(id)a1 count:(SEL)a2
{
  uint64_t v4 = v3;
  v5 = v2;
  for (i = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v3];
  {
    float v7 = +[ARQAHelper arrayWithVector2:*v5];
    [i addObject:v7];

    ++v5;
  }
  return i;
}

+ (id)arrayOf3dPoints:(id)a1 count:(SEL)a2
{
  uint64_t v4 = v3;
  v5 = v2;
  for (i = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v3];
  {
    float v7 = +[ARQAHelper arrayWithVector3:*v5];
    [i addObject:v7];

    v5 += 2;
  }
  return i;
}

+ (id)arrayOfUUIDSet:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        long long v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "UUIDString", (void)v11);
        [v4 addObject:v9];
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v4;
}

+ (id)generateTagsForConfiguration:(id)a3 replaySensor:(id)a4 technique:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = objc_opt_new();
  long long v11 = ARDeviceString();
  [v10 setObject:v11 forKeyedSubscript:@"device"];

  long long v12 = [(id)objc_opt_class() description];
  [v10 setObject:v12 forKeyedSubscript:@"configuration"];

  long long v13 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "isAutoFocusEnabled"));
  [v10 setObject:v13 forKeyedSubscript:@"isAutoFocusEnabled"];

  long long v14 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "isLightEstimationEnabled"));
  [v10 setObject:v14 forKeyedSubscript:@"isLightEstimationEnabled"];

  v15 = NSStringFromARWorldAlignment([v7 worldAlignment]);
  [v10 setObject:v15 forKeyedSubscript:@"worldAlignment"];

  uint64_t v16 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "providesAudioData"));
  [v10 setObject:v16 forKeyedSubscript:@"providesAudioData"];

  if ([v7 frameSemantics])
  {
    v17 = NSStringFromARFrameSemantics([v7 frameSemantics]);
    [v10 setObject:v17 forKeyedSubscript:@"frameSemantics"];
  }
  v18 = NSString;
  v19 = [v7 videoFormat];
  [v19 imageResolution];
  uint64_t v21 = v20;
  v22 = [v7 videoFormat];
  [v22 imageResolution];
  v24 = objc_msgSend(v18, "stringWithFormat:", @"%.0f,%.0f", v21, v23);
  [v10 setObject:v24 forKeyedSubscript:@"videoResolution"];

  v25 = NSNumber;
  uint64_t v26 = [v7 videoFormat];
  v27 = objc_msgSend(v25, "numberWithLong:", objc_msgSend(v26, "framesPerSecond"));
  [v10 setObject:v27 forKeyedSubscript:@"videoFramesPerSecond"];

  if (v8)
  {
    unint64_t v28 = [v8 sequenceURL];
    v29 = [v28 absoluteString];
    [v10 setObject:v29 forKeyedSubscript:@"replayURL"];

    v30 = [v8 deviceModel];
    [v10 setObject:v30 forKeyedSubscript:@"replayDeviceModel"];

    v31 = [v8 osVersion];
    [v10 setObject:v31 forKeyedSubscript:@"replayOSVersion"];

    v32 = [v8 arkitVersion];
    [v10 setObject:v32 forKeyedSubscript:@"replayARKitVersion"];

    v33 = NSString;
    [v8 imageResolution];
    uint64_t v35 = v34;
    [v8 imageResolution];
    v37 = objc_msgSend(v33, "stringWithFormat:", @"%.0fx%.0f", v35, v36);
    [v10 setObject:v37 forKeyedSubscript:@"replayVideoResolution"];

    v38 = NSString;
    [v8 nominalFrameRate];
    v40 = objc_msgSend(v38, "stringWithFormat:", @"%.02ffps", v39);
    [v10 setObject:v40 forKeyedSubscript:@"replayNominalFramerate"];

    uint64_t v41 = NSStringFromARReplayMode([v8 replayMode]);
    [v10 setObject:v41 forKeyedSubscript:@"replaySensorMode"];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v42 = v7;
    v43 = NSStringFromARPlaneDetection([v42 planeDetection]);
    [v10 setObject:v43 forKeyedSubscript:@"planeDetection"];

    v44 = NSNumber;
    v45 = [v42 initialWorldMap];
    v46 = [v44 numberWithBool:v45 != 0];
    [v10 setObject:v46 forKeyedSubscript:@"isInitialWorldMapSet"];

    v47 = NSNumber;
    v48 = [v42 detectionImages];
    v49 = objc_msgSend(v47, "numberWithUnsignedInteger:", objc_msgSend(v48, "count"));
    [v10 setObject:v49 forKeyedSubscript:@"numberOfDetectionImages"];

    v50 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v42, "maximumNumberOfTrackedImages"));
    [v10 setObject:v50 forKeyedSubscript:@"maximumNumberOfTrackedImages"];

    v51 = NSNumber;
    v52 = [v42 detectionObjects];
    v53 = objc_msgSend(v51, "numberWithUnsignedInteger:", objc_msgSend(v52, "count"));
    [v10 setObject:v53 forKeyedSubscript:@"numberOfDetectionObjects"];

    v54 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v42, "isMLModelEnabled"));
    [v10 setObject:v54 forKeyedSubscript:@"isMLModelEnabled"];

    v55 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v42, "isLowQosSchedulingEnabled"));
    [v10 setObject:v55 forKeyedSubscript:@"isLowQosSchedulingEnabled"];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_10;
    }
    id v56 = v7;
    v57 = NSNumber;
    v58 = [v56 trackingImages];
    v59 = objc_msgSend(v57, "numberWithUnsignedInteger:", objc_msgSend(v58, "count"));
    [v10 setObject:v59 forKeyedSubscript:@"numberOfTrackingImages"];

    v55 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v56, "maximumNumberOfTrackedImages"));
    [v10 setObject:v55 forKeyedSubscript:@"maximumNumberOfTrackedImages"];
  }

LABEL_10:
  v60 = objc_opt_new();
  +[ARQAHelper techniquesArray:v9 array:v60];
  [v10 setObject:v60 forKeyedSubscript:@"techniques"];
  v61 = objc_opt_new();
  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  v68[2] = __66__ARQAHelper_generateTagsForConfiguration_replaySensor_technique___block_invoke;
  v68[3] = &unk_1E6186E08;
  id v62 = v61;
  id v69 = v62;
  +[ARQAHelper traverseTechniques:v9 withBlock:v68];
  [v10 setObject:v62 forKeyedSubscript:@"networkVersion"];
  v63 = objc_opt_new();
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = __66__ARQAHelper_generateTagsForConfiguration_replaySensor_technique___block_invoke_2;
  v66[3] = &unk_1E6186E08;
  id v64 = v63;
  id v67 = v64;
  +[ARQAHelper traverseTechniques:v9 withBlock:v66];
  [v10 setObject:v64 forKeyedSubscript:@"activeRemoteTechniqueConnections"];

  return v10;
}

void __66__ARQAHelper_generateTagsForConfiguration_replaySensor_technique___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v7;
    uint64_t v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    if (v5)
    {
      uint64_t v6 = [v3 networkVersionString];
      if (v6) {
        [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
      }
    }
  }
}

void __66__ARQAHelper_generateTagsForConfiguration_replaySensor_technique___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v7;
    uint64_t v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    if (v5)
    {
      uint64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "numberOfActiveConnections"));
      [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
    }
  }
}

+ (void)traverseTechniques:(id)a3 withBlock:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  v7[2](v7, v6);
  id v8 = [v6 splitTechniques];

  if (v8)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v9 = [v6 splitTechniques];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v22;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v9);
          }
          [a1 traverseTechniques:*(void *)(*((void *)&v21 + 1) + 8 * v12++) withBlock:v7];
        }
        while (v10 != v12);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v10);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v13 = objc_msgSend(v6, "techniques", 0);
    uint64_t v14 = [v13 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v18;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(v13);
          }
          [a1 traverseTechniques:*(void *)(*((void *)&v17 + 1) + 8 * v16++) withBlock:v7];
        }
        while (v14 != v16);
        uint64_t v14 = [v13 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v14);
    }
  }
}

+ (void)techniquesArray:(id)a3 array:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = objc_msgSend(v6, "techniques", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v8);
          }
          [a1 techniquesArray:*(void *)(*((void *)&v14 + 1) + 8 * v11++) array:v7];
        }
        while (v9 != v11);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
  else
  {
    uint64_t v12 = (objc_class *)objc_opt_class();
    long long v13 = NSStringFromClass(v12);
    if (v13) {
      [v7 addObject:v13];
    }
  }
}

+ (id)headerInformationWithConfiguration:(id)a3 technique:(id)a4
{
  id v5 = a3;
  id v30 = a4;
  v29 = objc_opt_new();
  id v6 = ARFrameworkVersions();
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __59__ARQAHelper_headerInformationWithConfiguration_technique___block_invoke;
  v31[3] = &unk_1E6186E30;
  id v7 = v29;
  id v32 = v7;
  [v6 enumerateKeysAndObjectsUsingBlock:v31];
  id v8 = ARDeviceString();
  [v7 setObject:v8 forKeyedSubscript:@"device"];

  uint64_t v9 = AROSVersionString();
  [v7 setObject:v9 forKeyedSubscript:@"deviceOSVersion"];

  if ([v5 frameSemantics]) {
    [v7 setObject:@"segmentation.mov" forKeyedSubscript:@"segmentationFilename"];
  }
  uint64_t v10 = objc_opt_new();
  uint64_t v11 = [v5 replaySensor];
  id v12 = v5;
  objc_opt_class();
  id v13 = v12;
  if (objc_opt_isKindOfClass())
  {
    long long v14 = [v12 templateConfiguration];
    long long v15 = v14;
    id v13 = v12;
    if (v14)
    {
      id v13 = v14;
    }
  }
  long long v16 = [(id)objc_opt_class() description];
  [v7 setObject:v16 forKeyedSubscript:@"configuration"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v17 = v13;
    if ([v17 planeDetection])
    {
      long long v18 = [(id)objc_opt_class() description];
      [v10 addObject:v18];
    }
    uint64_t v19 = [v17 detectionImages];
    uint64_t v20 = [v19 count];

    if (v20)
    {
      long long v21 = [(id)objc_opt_class() description];
      [v10 addObject:v21];
    }
    long long v22 = [v17 detectionObjects];
    uint64_t v23 = [v22 count];

    if (v23)
    {
      long long v24 = [(id)objc_opt_class() description];
      [v10 addObject:v24];
    }
    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v17 = [(id)objc_opt_class() description];
    [v10 addObject:v17];
LABEL_17:
  }
  [v7 setObject:v10 forKeyedSubscript:@"expectedAnchors"];
  v25 = +[ARQAHelper generateTagsForConfiguration:v13 replaySensor:v11 technique:v30];
  [v7 setObject:v25 forKeyedSubscript:@"tags"];

  uint64_t v26 = [MEMORY[0x1E4F1CB18] appleGlobalDomainARKitDefaults];
  [v7 setObject:v26 forKeyedSubscript:@"userDefaults"];
  id v27 = v7;

  return v27;
}

void __59__ARQAHelper_headerInformationWithConfiguration_technique___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  id v5 = [a2 stringByAppendingString:@"Version"];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

+ (id)dictionaryFromPlaneExtent:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
  id v5 = NSNumber;
  [v3 rotationOnYAxis];
  id v6 = objc_msgSend(v5, "numberWithFloat:");
  [v4 setObject:v6 forKeyedSubscript:@"rotationOnYAxis"];

  id v7 = NSNumber;
  [v3 width];
  id v8 = objc_msgSend(v7, "numberWithFloat:");
  [v4 setObject:v8 forKeyedSubscript:@"width"];

  uint64_t v9 = NSNumber;
  [v3 height];
  uint64_t v10 = objc_msgSend(v9, "numberWithFloat:");
  [v4 setObject:v10 forKeyedSubscript:@"height"];

  return v4;
}

+ (id)dictionaryFromVertices:(id)a1 vertexCount:(SEL)a2 textureCoordinates:textureCoordinateCount:
{
  uint64_t v6 = v5;
  uint64_t v7 = v4;
  uint64_t v8 = v3;
  uint64_t v9 = v2;
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
  uint64_t v11 = +[ARQAHelper arrayOf3dPoints:v9 count:v8];
  [v10 setObject:v11 forKeyedSubscript:@"vertices"];

  id v12 = +[ARQAHelper arrayOf2dPoints:v7 count:v6];
  [v10 setObject:v12 forKeyedSubscript:@"textureCoordinates"];

  return v10;
}

+ (id)dictionaryFromMeshGeometry:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
  uint64_t v5 = NSNumber;
  uint64_t v6 = [v3 vertices];
  uint64_t v7 = objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v6, "count"));
  [v4 setObject:v7 forKeyedSubscript:@"vertexCount"];

  uint64_t v8 = NSNumber;
  uint64_t v9 = [v3 faces];
  uint64_t v10 = objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v9, "count"));
  [v4 setObject:v10 forKeyedSubscript:@"faceCount"];

  uint64_t v11 = NSNumber;
  id v12 = [v3 normals];
  id v13 = objc_msgSend(v11, "numberWithInteger:", objc_msgSend(v12, "count"));
  [v4 setObject:v13 forKeyedSubscript:@"normalCount"];

  return v4;
}

+ (id)dictionaryFromPatchGrid:(id)a3
{
  v20[4] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v19 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "size"));
  uint64_t v4 = 0;
  for (unint64_t i = 0; i < objc_msgSend(v3, "size", v19); ++i)
  {
    uint64_t v6 = [v3 patches];
    uint64_t v7 = [NSNumber numberWithFloat:*(double *)(v6 + v4)];
    v20[0] = v7;
    LODWORD(v8) = *(_DWORD *)(v6 + v4 + 4);
    uint64_t v9 = [NSNumber numberWithFloat:v8];
    v20[1] = v9;
    uint64_t v10 = [NSNumber numberWithFloat:*(double *)(v6 + v4 + 8)];
    v20[2] = v10;
    LODWORD(v11) = *(_DWORD *)(v6 + v4 + 12);
    id v12 = [NSNumber numberWithFloat:v11];
    v20[3] = v12;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:4];
    [v19 setObject:v13 atIndexedSubscript:i];

    v4 += 16;
  }
  long long v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
  long long v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "size"));
  [v14 setObject:v15 forKeyedSubscript:@"size"];

  long long v16 = NSNumber;
  [v3 pivot];
  id v17 = objc_msgSend(v16, "numberWithFloat:");
  [v14 setObject:v17 forKeyedSubscript:@"pivot"];

  [v14 setObject:v19 forKeyedSubscript:@"patches"];
  return v14;
}

+ (id)extractAnchorDataForFrame:(id)a3
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v90 = a3;
  id v96 = (id)objc_opt_new();
  id v3 = [v90 anchors];
  uint64_t v4 = [v3 sortedArrayUsingComparator:&__block_literal_global_50];

  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  obunint64_t j = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v98 objects:v103 count:16];
  if (v5)
  {
    uint64_t v95 = *(void *)v99;
    do
    {
      uint64_t v6 = 0;
      uint64_t v97 = v5;
      do
      {
        if (*(void *)v99 != v95) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v98 + 1) + 8 * v6);
        double v8 = objc_opt_new();
        uint64_t v9 = [(id)objc_opt_class() description];
        [v8 setObject:v9 forKeyedSubscript:@"type"];

        [v7 transform];
        uint64_t v10 = +[ARQAHelper arrayWithMatrix4x4:](ARQAHelper, "arrayWithMatrix4x4:");
        [v8 setObject:v10 forKeyedSubscript:@"transform"];

        double v11 = [v7 name];
        LOBYTE(v10) = v11 == 0;

        if ((v10 & 1) == 0)
        {
          id v12 = [v7 name];
          [v8 setObject:v12 forKeyedSubscript:@"name"];
        }
        if (objc_opt_respondsToSelector())
        {
          id v13 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "isTracked"));
          [v8 setObject:v13 forKeyedSubscript:@"isTracked"];
        }
        long long v14 = NSString;
        long long v15 = [v7 identifier];
        long long v16 = [v15 UUIDString];
        id v17 = [v14 stringWithFormat:@"%@", v16, v90];
        [v8 setObject:v17 forKeyedSubscript:@"identifier"];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v18 = [(id)objc_opt_class() dictionaryFromPlaneAnchor:v7];
          [v8 addEntriesFromDictionary:v18];
          goto LABEL_21;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v19 = v7;
          uint64_t v20 = [v19 blendShapes];
          [v8 setObject:v20 forKeyedSubscript:@"blendShapes"];

          [v19 leftEyeTransform];
          long long v21 = +[ARQAHelper arrayWithMatrix4x4:](ARQAHelper, "arrayWithMatrix4x4:");
          [v8 setObject:v21 forKeyedSubscript:@"leftEyeTransform"];

          [v19 rightEyeTransform];
          long long v22 = +[ARQAHelper arrayWithMatrix4x4:](ARQAHelper, "arrayWithMatrix4x4:");
          [v8 setObject:v22 forKeyedSubscript:@"rightEyeTransform"];

          [v19 lookAtPoint];
          long long v18 = +[ARQAHelper arrayWithVector3:](ARQAHelper, "arrayWithVector3:");
          [v8 setObject:v18 forKeyedSubscript:@"lookAtPoint"];
          goto LABEL_21;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v23 = v7;
          long long v24 = [v23 referenceImage];
          v25 = [v24 name];
          [v8 setObject:v25 forKeyedSubscript:@"referenceImageName"];

          uint64_t v26 = NSNumber;
          id v27 = [v23 referenceImage];
          [v27 physicalSize];
          *(float *)&double v28 = v28;
          v29 = [v26 numberWithFloat:v28];
          v102[0] = v29;
          id v30 = NSNumber;
          v31 = [v23 referenceImage];
          [v31 physicalSize];
          *(float *)&double v33 = v32;
          uint64_t v34 = [v30 numberWithFloat:v33];
          v102[1] = v34;
          uint64_t v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v102 count:2];
          [v8 setObject:v35 forKeyedSubscript:@"referenceImageSize"];

          uint64_t v36 = NSNumber;
          [v23 estimatedScaleFactor];
          *(float *)&double v37 = v37;
          long long v18 = [v36 numberWithFloat:v37];
          [v8 setObject:v18 forKeyedSubscript:@"estimatedScaleFactor"];
          goto LABEL_21;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v38 = v7;
          uint64_t v39 = [v38 referenceObject];
          v40 = [v39 name];
          [v8 setObject:v40 forKeyedSubscript:@"referenceObjectName"];

          uint64_t v41 = [v38 referenceObject];
          [v41 center];
          id v42 = +[ARQAHelper arrayWithVector3:](ARQAHelper, "arrayWithVector3:");
          [v8 setObject:v42 forKeyedSubscript:@"referenceObjectCenter"];

          long long v18 = [v38 referenceObject];
          [v18 extent];
          v93 = +[ARQAHelper arrayWithVector3:](ARQAHelper, "arrayWithVector3:");
          objc_msgSend(v8, "setObject:forKeyedSubscript:");
          goto LABEL_18;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v43 = v7;
          v44 = [v43 url];
          v45 = [v44 absoluteString];
          [v8 setObject:v45 forKeyedSubscript:@"url"];

          v46 = [v43 instanceID];
          [v8 setObject:v46 forKeyedSubscript:@"instanceID"];

          v47 = NSNumber;
          [v43 radius];
          v48 = objc_msgSend(v47, "numberWithFloat:");
          [v8 setObject:v48 forKeyedSubscript:@"radius"];

          v49 = NSNumber;
          [v43 confidence];
          v50 = objc_msgSend(v49, "numberWithFloat:");
          [v8 setObject:v50 forKeyedSubscript:@"confidence"];

          v51 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v43, "urlDecodingState"));
          [v8 setObject:v51 forKeyedSubscript:@"urlDecodingState"];

          long long v18 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v43, "urlDecodingStateInternal"));
          [v8 setObject:v18 forKeyedSubscript:@"urlDecodingStateInternal"];
          goto LABEL_21;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v52 = v7;
          v53 = (void *)MEMORY[0x1E4F1CA48];
          v54 = [v52 skeleton];
          long long v18 = objc_msgSend(v53, "arrayWithCapacity:", objc_msgSend(v54, "jointCount"));

          uint64_t v55 = 0;
          for (unint64_t i = 0; ; ++i)
          {
            v57 = [v52 skeleton];
            BOOL v58 = [v57 jointCount] > i;

            if (!v58) {
              break;
            }
            v59 = [v52 skeleton];
            uint64_t v60 = [v59 jointModelTransforms];
            v61 = +[ARQAHelper arrayWithMatrix4x4:](ARQAHelper, "arrayWithMatrix4x4:", *(double *)(v60 + v55), *(double *)(v60 + v55 + 16), *(double *)(v60 + v55 + 32), *(double *)(v60 + v55 + 48));
            [v18 addObject:v61];

            v55 += 64;
          }
          id v64 = (void *)MEMORY[0x1E4F1CA48];
          v65 = [v52 referenceBody];
          v66 = [v65 skeleton];
          v93 = objc_msgSend(v64, "arrayWithCapacity:", objc_msgSend(v66, "jointCount"));

          for (unint64_t j = 0; ; ++j)
          {
            v68 = [v52 referenceBody];
            id v69 = [v68 skeleton];
            BOOL v70 = [v69 jointCount] > j;

            if (!v70) {
              break;
            }
            v71 = [v52 referenceBody];
            v72 = [v71 skeleton];
            v73 = +[ARQAHelper arrayWithVector2:](ARQAHelper, "arrayWithVector2:", *(double *)([v72 jointLandmarks] + 8 * j));
            [v93 addObject:v73];
          }
          v74 = (void *)MEMORY[0x1E4F1CA48];
          v75 = [v52 skeleton];
          v76 = [v75 coreRESkeleton];
          v77 = [v76 liftedSkeletonData];
          v91 = objc_msgSend(v74, "arrayWithCapacity:", objc_msgSend(v77, "jointCount"));

          for (unint64_t k = 0; ; ++k)
          {
            v79 = [v52 skeleton];
            v80 = [v79 coreRESkeleton];
            v81 = [v80 liftedSkeletonData];
            BOOL v82 = [v81 jointCount] > k;

            if (!v82) {
              break;
            }
            v83 = [v52 skeleton];
            v84 = [v83 coreRESkeleton];
            v85 = [v84 liftedSkeletonData];
            long long v94 = *(_OWORD *)([v85 joints] + 16 * k);

            v86 = +[ARQAHelper arrayWithVector3:*(double *)&v94];
            [v91 addObject:v86];
          }
          [v8 setObject:v18 forKeyedSubscript:@"jointModelTransforms"];
          [v8 setObject:v93 forKeyedSubscript:@"referenceBodyLandmarks"];
          v87 = NSNumber;
          [v52 estimatedScaleFactor];
          v88 = objc_msgSend(v87, "numberWithDouble:");
          [v8 setObject:v88 forKeyedSubscript:@"estimatedScaleFactor"];

          [v8 setObject:v91 forKeyedSubscript:@"liftedJoints"];
LABEL_18:

LABEL_21:
          goto LABEL_22;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v62 = v7;
          v63 = [v62 geometry];
          long long v18 = +[ARQAHelper dictionaryFromMeshGeometry:v63];

          [v8 setObject:v18 forKeyedSubscript:@"geometry"];
          [v62 extent];
          v93 = +[ARQAHelper arrayWithVector3:](ARQAHelper, "arrayWithVector3:");
          objc_msgSend(v8, "setObject:forKeyedSubscript:");
          goto LABEL_18;
        }
LABEL_22:
        [v96 addObject:v8];

        ++v6;
      }
      while (v6 != v97);
      uint64_t v5 = [obj countByEnumeratingWithState:&v98 objects:v103 count:16];
    }
    while (v5);
  }

  return v96;
}

uint64_t __40__ARQAHelper_extractAnchorDataForFrame___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    uint64_t v6 = NSNumber;
    [v4 area];
    double v8 = [v6 numberWithDouble:v7];
    uint64_t v9 = NSNumber;
    [v5 area];
    double v11 = [v9 numberWithDouble:v10];
    uint64_t v12 = [v8 compare:v11];
  }
  else
  {
    double v8 = [v4 identifier];
    double v11 = [v8 UUIDString];
    id v13 = [v5 identifier];
    long long v14 = [v13 UUIDString];
    uint64_t v12 = [v11 caseInsensitiveCompare:v14];
  }
  return v12;
}

+ (id)extractDetectedBodiesForFrame:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v20 = (id)objc_opt_new();
  id v23 = objc_opt_new();
  long long v24 = objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v3 = [v18 detectedBodies];
  obunint64_t j = v3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v4)
  {
    uint64_t v22 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v26 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        float v7 = objc_opt_new();
        double v8 = objc_opt_new();
        for (unint64_t j = 0; ; ++j)
        {
          float v10 = objc_msgSend(v6, "skeleton", v18);
          BOOL v11 = [v10 jointCount] > j;

          if (!v11) {
            break;
          }
          uint64_t v12 = [v6 skeleton];
          id v13 = +[ARQAHelper arrayWithVector2:](ARQAHelper, "arrayWithVector2:", *(double *)([v12 jointLandmarks] + 8 * j));
          [v7 addObject:v13];

          long long v14 = NSNumber;
          long long v15 = [v6 skeleton];
          long long v16 = objc_msgSend(v14, "numberWithBool:", objc_msgSend(v15, "isJointTracked:", j));
          [v8 addObject:v16];
        }
        [v23 addObject:v7];
        [v24 addObject:v8];
      }
      id v3 = obj;
      uint64_t v4 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v4);
  }

  if ([v23 count]) {
    [v20 setObject:v23 forKeyedSubscript:@"bodies"];
  }
  if (objc_msgSend(v24, "count", v18)) {
    [v20 setObject:v24 forKeyedSubscript:@"trackingStates"];
  }

  return v20;
}

+ (id)traceFrameData:(id)a3 withFrameIndex:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v6 = [(id)objc_opt_class() traceFrameData:v5 withFrameIndex:a4 writeOBJ:0];

  return v6;
}

+ (id)traceFrameData:(id)a3 withFrameIndex:(unint64_t)a4 writeOBJ:(BOOL)a5
{
  BOOL v243 = a5;
  v264[2] = *MEMORY[0x1E4F143B8];
  id v241 = a3;
  id v240 = (id)objc_opt_new();
  unint64_t v245 = a4;
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:a4];
  [v240 setObject:v6 forKeyedSubscript:@"frame"];

  float v7 = NSNumber;
  [v241 timestamp];
  double v8 = objc_msgSend(v7, "numberWithDouble:");
  [v240 setObject:v8 forKeyedSubscript:@"timestamp"];

  uint64_t v9 = [v241 camera];
  [v9 transform];
  float v10 = +[ARQAHelper arrayWithMatrix4x4:](ARQAHelper, "arrayWithMatrix4x4:");
  [v240 setObject:v10 forKeyedSubscript:@"cameraTransform"];

  [v241 referenceOriginTransform];
  BOOL v11 = +[ARQAHelper arrayWithMatrix4x4:](ARQAHelper, "arrayWithMatrix4x4:");
  [v240 setObject:v11 forKeyedSubscript:@"referenceOriginTransform"];

  uint64_t v12 = NSNumber;
  id v13 = [v241 camera];
  long long v14 = objc_msgSend(v12, "numberWithInteger:", objc_msgSend(v13, "trackingState"));
  [v240 setObject:v14 forKeyedSubscript:@"trackingState"];

  long long v15 = NSNumber;
  long long v16 = [v241 camera];
  id v17 = objc_msgSend(v15, "numberWithInteger:", objc_msgSend(v16, "trackingStateReason"));
  [v240 setObject:v17 forKeyedSubscript:@"trackingStateReason"];

  id v18 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v241, "worldMappingStatus"));
  [v240 setObject:v18 forKeyedSubscript:@"worldMappingStatus"];

  id v19 = NSNumber;
  [v241 cameraGrainIntensity];
  id v20 = objc_msgSend(v19, "numberWithFloat:");
  [v240 setObject:v20 forKeyedSubscript:@"cameraGrainIntensity"];

  long long v21 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v241, "deviceOrientation"));
  [v240 setObject:v21 forKeyedSubscript:@"deviceOrientation"];

  uint64_t v22 = [v241 resultDatas];
  id v23 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"class == %@", objc_opt_class()];
  long long v24 = [v22 filteredArrayUsingPredicate:v23];

  v233 = v24;
  long long v25 = [v24 firstObject];

  if (v25)
  {
    long long v26 = [v24 firstObject];
    [v26 visionCameraTransform];
    long long v27 = +[ARQAHelper arrayWithMatrix4x4:](ARQAHelper, "arrayWithMatrix4x4:");
    [v240 setObject:v27 forKeyedSubscript:@"visionCameraTransform"];
  }
  long long v28 = [v241 worldTrackingState];
  int v29 = [v28 majorRelocalization];

  if (v29)
  {
    uint64_t v30 = [NSNumber numberWithBool:1];
    [v240 setObject:v30 forKeyedSubscript:@"majorRelocalization"];
  }
  v31 = [v241 worldTrackingState];
  int v32 = [v31 minorRelocalization];

  if (v32)
  {
    double v33 = [NSNumber numberWithBool:1];
    [v240 setObject:v33 forKeyedSubscript:@"minorRelocalization"];
  }
  uint64_t v34 = [v241 worldTrackingState];
  int v35 = [v34 poseGraphUpdated];

  if (v35)
  {
    uint64_t v36 = [NSNumber numberWithBool:1];
    [v240 setObject:v36 forKeyedSubscript:@"poseGraphUpdated"];
  }
  double v37 = NSNumber;
  id v38 = [v241 worldTrackingState];
  uint64_t v39 = objc_msgSend(v37, "numberWithInteger:", objc_msgSend(v38, "vioTrackingState"));
  [v240 setObject:v39 forKeyedSubscript:@"vioTrackingState"];

  v40 = [v241 worldTrackingErrorData];

  if (v40)
  {
    v263[0] = @"Timestamp";
    uint64_t v41 = NSNumber;
    id v42 = [v241 worldTrackingErrorData];
    [v42 timestamp];
    id v43 = objc_msgSend(v41, "numberWithDouble:");
    v263[1] = @"ErrorCode";
    v264[0] = v43;
    v44 = NSNumber;
    v45 = [v241 worldTrackingErrorData];
    v46 = objc_msgSend(v44, "numberWithInteger:", objc_msgSend(v45, "errorCode"));
    v264[1] = v46;
    v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v264 forKeys:v263 count:2];
    [v240 setObject:v47 forKeyedSubscript:@"worldTrackingError"];
  }
  if ([v241 segmentationBuffer])
  {
    v48 = (__CVBuffer *)[v241 segmentationBuffer];
    CVPixelBufferLockBaseAddress(v48, 0);
    size_t Width = CVPixelBufferGetWidth(v48);
    size_t Height = CVPixelBufferGetHeight(v48);
    size_t BytesPerRow = CVPixelBufferGetBytesPerRow(v48);
    BaseAddress = (unsigned __int8 *)CVPixelBufferGetBaseAddress(v48);
    if (Height)
    {
      uint64_t v53 = 0;
      int v54 = 0;
      do
      {
        size_t v55 = Width;
        for (uint64_t i = BaseAddress; v55; --v55)
        {
          if (!*i++) {
            ++v54;
          }
        }
        ++v53;
        BaseAddress += BytesPerRow;
      }
      while (v53 != Height);
    }
    else
    {
      int v54 = 0;
    }
    CVPixelBufferUnlockBaseAddress(v48, 0);
    double v58 = 100.0 - (float)v54 * 100.0 / (float)(Height * Width);
    *(float *)&double v58 = v58;
    v59 = [NSNumber numberWithFloat:v58];
    [v240 setObject:v59 forKeyedSubscript:@"segmentationPixelsPercentage"];
  }
  v234 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"class == %@", objc_opt_class()];
  uint64_t v60 = [v241 resultDatas];
  v236 = [v60 filteredArrayUsingPredicate:v234];

  v61 = [v236 firstObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v63 = [v236 firstObject];
    id v64 = objc_opt_new();
    long long v257 = 0u;
    long long v258 = 0u;
    long long v255 = 0u;
    long long v256 = 0u;
    v65 = [v63 detectedObjects];
    uint64_t v66 = [v65 countByEnumeratingWithState:&v255 objects:v262 count:16];
    if (v66)
    {
      uint64_t v67 = *(void *)v256;
      do
      {
        for (uint64_t j = 0; j != v66; ++j)
        {
          if (*(void *)v256 != v67) {
            objc_enumerationMutation(v65);
          }
          id v69 = *(void **)(*((void *)&v255 + 1) + 8 * j);
          BOOL v70 = NSString;
          [v69 boundingBox];
          uint64_t v72 = v71;
          [v69 boundingBox];
          uint64_t v74 = v73;
          [v69 boundingBox];
          uint64_t v76 = v75;
          [v69 boundingBox];
          v78 = [v70 stringWithFormat:@"{x:%f, y:%f, width: %f, height: %f}", v72, v74, v76, v77];
          [v64 addObject:v78];
        }
        uint64_t v66 = [v65 countByEnumeratingWithState:&v255 objects:v262 count:16];
      }
      while (v66);
    }

    [v240 setObject:v64 forKeyedSubscript:@"personDetectionBoundingBoxes"];
  }
  if ([v241 segmentationBuffer] && objc_msgSend(v241, "estimatedDepthData"))
  {
    objc_msgSend((id)objc_opt_class(), "_meanDepthValueOfDepthBuffer:consideringSegmentation:ofSegmentationBuffer:", objc_msgSend(v241, "estimatedDepthData"), 1, objc_msgSend(v241, "segmentationBuffer"));
    v80 = objc_msgSend(NSString, "stringWithFormat:", @"%.4f", v79);
    [v240 setObject:v80 forKeyedSubscript:@"averageDepth"];
  }
  v81 = [v241 capturedDepthData];
  BOOL v82 = v81 == 0;

  if (!v82)
  {
    v83 = objc_opt_class();
    id v84 = [v241 capturedDepthData];
    objc_msgSend(v83, "_meanDepthValueOfDepthBuffer:consideringSegmentation:ofSegmentationBuffer:", objc_msgSend(v84, "depthDataMap"), 0, 0);
    float v86 = v85;

    v87 = objc_msgSend(NSString, "stringWithFormat:", @"%.4f", v86);
    [v240 setObject:v87 forKeyedSubscript:@"averageCapturedDepth"];
  }
  v88 = [v241 featurePoints];
  BOOL v89 = [v88 count] == 0;

  if (!v89)
  {
    id v90 = [v241 featurePoints];
    uint64_t v91 = [v90 points];
    v92 = [v241 featurePoints];
    v93 = +[ARQAHelper arrayOf3dPoints:count:](ARQAHelper, "arrayOf3dPoints:count:", v91, [v92 count]);
    [v240 setObject:v93 forKeyedSubscript:@"featurePoints"];
  }
  long long v94 = [v241 location];
  BOOL v95 = v94 == 0;

  if (!v95)
  {
    id v96 = [v241 location];
    uint64_t v97 = +[ARQAHelper dictionaryFromCLLocation:v96];
    [v240 setObject:v97 forKeyedSubscript:@"location"];
  }
  long long v98 = [v241 rawLocation];
  BOOL v99 = v98 == 0;

  if (!v99)
  {
    long long v100 = [v241 rawLocation];
    long long v101 = +[ARQAHelper dictionaryFromRawCLLocation:v100];
    [v240 setObject:v101 forKeyedSubscript:@"rawLocation"];
  }
  v102 = NSNumber;
  [v241 heading];
  v103 = objc_msgSend(v102, "numberWithDouble:");
  [v240 setObject:v103 forKeyedSubscript:@"heading"];

  uint64_t v104 = NSNumber;
  [v241 rawHeading];
  v105 = objc_msgSend(v104, "numberWithDouble:");
  [v240 setObject:v105 forKeyedSubscript:@"rawHeading"];

  v106 = NSNumber;
  v107 = [v241 vlState];
  [v107 fusedReplayHeading];
  v108 = objc_msgSend(v106, "numberWithDouble:");
  [v240 setObject:v108 forKeyedSubscript:@"fusedHeading"];

  v109 = NSNumber;
  v110 = [v241 vlState];
  [v110 fusedReplayHeadingTimestamp];
  v111 = objc_msgSend(v109, "numberWithDouble:");
  [v240 setObject:v111 forKeyedSubscript:@"fusedHeadingTimestamp"];

  v112 = NSNumber;
  [v241 rawLocationTimestamp];
  v113 = objc_msgSend(v112, "numberWithDouble:");
  [v240 setObject:v113 forKeyedSubscript:@"rawLocationTimestamp"];

  [v241 undulation];
  v114 = NSNumber;
  [v241 undulation];
  v115 = objc_msgSend(v114, "numberWithDouble:");
  [v240 setObject:v115 forKeyedSubscript:@"undulation"];

  v116 = [v241 resultDatas];
  v117 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_376];
  v118 = [v116 filteredArrayUsingPredicate:v117];
  v239 = [v118 firstObject];

  if (v239)
  {
    uint64_t v119 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v239, "errorCode"));
    [v240 setObject:v119 forKeyedSubscript:@"vlErrorCode"];

    v120 = [v239 localizationResult];
    LOBYTE(v119) = v120 == 0;

    if ((v119 & 1) == 0)
    {
      v121 = NSNumber;
      v122 = [v239 localizationResult];
      [v122 inputTimestamp];
      v123 = objc_msgSend(v121, "numberWithDouble:");
      [v240 setObject:v123 forKeyedSubscript:@"vlInputTimestamp"];

      v124 = [v239 localizationResult];
      v125 = v124;
      if (v124) {
        [v124 transform];
      }
      else {
        memset(v254, 0, sizeof(v254));
      }
      v126 = +[ARQAHelper arrayWithMatrix4x4:ARMatrix4x4DoubleToFloat(v254)];
      [v240 setObject:v126 forKeyedSubscript:@"vlTransform"];

      v127 = [v239 location];
      v128 = +[ARQAHelper dictionaryFromCLLocation:v127];
      [v240 setObject:v128 forKeyedSubscript:@"vlLocation"];

      v129 = NSNumber;
      [v239 heading];
      v130 = objc_msgSend(v129, "numberWithDouble:");
      [v240 setObject:v130 forKeyedSubscript:@"vlHeading"];
    }
    v131 = [v239 debugInfo];
    v132 = [v131 inputParameters];
    [v240 setObject:v132 forKeyedSubscript:@"vlDebugInputParameters"];

    v133 = [v239 debugInfo];
    v134 = [v133 results];
    [v240 setObject:v134 forKeyedSubscript:@"vlDebugResults"];

    v135 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v239, "algorithmVersion"));
    [v240 setObject:v135 forKeyedSubscript:@"vlAlgorithmVersion"];
  }
  v136 = [v241 geoTrackingStatus];
  BOOL v137 = v136 == 0;

  if (!v137)
  {
    v138 = [v241 geoTrackingStatus];
    v139 = NSStringFromARGeoTrackingState([v138 state]);
    [v240 setObject:v139 forKeyedSubscript:@"geoTrackingStatus.state"];

    v140 = [v241 geoTrackingStatus];
    v141 = NSStringFromARGeoTrackingAccuracy([v140 accuracy]);
    [v240 setObject:v141 forKeyedSubscript:@"geoTrackingStatus.accuracy"];

    v142 = [v241 geoTrackingStatus];
    v143 = NSStringFromARGeoTrackingStateReason([v142 stateReason]);
    [v240 setObject:v143 forKeyedSubscript:@"geoTrackingStatus.stateReason"];

    v144 = NSNumber;
    v145 = [v241 geoTrackingStatus];
    v146 = objc_msgSend(v144, "numberWithInteger:", objc_msgSend(v145, "failureReasons"));
    [v240 setObject:v146 forKeyedSubscript:@"geoTrackingStatus.failureReasons"];
  }
  v232 = +[ARQAHelper extractAnchorDataForFrame:v241];
  if ([v232 count]) {
    [v240 setObject:v232 forKeyedSubscript:@"anchors"];
  }
  v235 = +[ARQAHelper extractDetectedBodiesForFrame:v241];
  if ([v235 count])
  {
    v147 = [v235 objectForKeyedSubscript:@"bodies"];
    [v240 setObject:v147 forKeyedSubscript:@"detectedBodies"];

    v148 = [v235 objectForKeyedSubscript:@"trackingStates"];
    [v240 setObject:v148 forKeyedSubscript:@"detectedBodiesTrackingStates"];
  }
  v149 = [v241 currentlyActiveVideoFormat];
  BOOL v150 = v149 == 0;

  if (!v150)
  {
    v151 = [v241 currentlyActiveVideoFormat];
    v152 = [v151 captureDeviceType];
    [v240 setObject:v152 forKeyedSubscript:@"currentlyActiveCameraForVIO"];
  }
  if (v243)
  {
    v153 = [v241 anchors];
    v154 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"class == %@", objc_opt_class()];
    v155 = [v153 filteredArrayUsingPredicate:v154];

    if ([v155 count])
    {
      id v253 = 0;
      v156 = ARCreateOBJStringForMeshAnchors(v155, &v253, 1.0);
      id v157 = v253;
      if (v157)
      {
        id v158 = v157;
        v159 = _ARLogGeneral();
        if (os_log_type_enabled(v159, OS_LOG_TYPE_ERROR))
        {
          v160 = (objc_class *)objc_opt_class();
          NSStringFromClass(v160);
          id v161 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(void *)&buf[4] = v161;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = a1;
          *(_WORD *)&buf[22] = 2112;
          id v261 = v158;
          _os_log_impl(&dword_1B88A2000, v159, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not create obj for mesh anchors due to error: %@", buf, 0x20u);
        }
      }
      else
      {
        v162 = +[ARQATracer traceOutputDirectory];
        v163 = objc_msgSend(NSString, "stringWithFormat:", @"meshAnchors_%lu.obj", v245);
        v159 = [v162 stringByAppendingPathComponent:v163];

        id v252 = 0;
        [v156 writeToFile:v159 atomically:1 encoding:4 error:&v252];
        id v158 = v252;
        if (v158)
        {
          v164 = _ARLogGeneral();
          if (os_log_type_enabled(v164, OS_LOG_TYPE_ERROR))
          {
            v165 = (objc_class *)objc_opt_class();
            NSStringFromClass(v165);
            id v166 = (id)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            *(void *)&buf[4] = v166;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = a1;
            *(_WORD *)&buf[22] = 2112;
            id v261 = v158;
            _os_log_impl(&dword_1B88A2000, v164, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not save obj for mesh anchors due to error: %@", buf, 0x20u);
          }
          [v240 setObject:v158 forKeyedSubscript:@"meshAnchorsObjFileError"];
        }
        else
        {
          [v240 setObject:v159 forKeyedSubscript:@"meshAnchorsObjFile"];
        }
      }
    }
    v167 = [v241 anchors];
    v168 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"class == %@", objc_opt_class()];
    v169 = [v167 filteredArrayUsingPredicate:v168];

    if ([v169 count])
    {
      id v251 = 0;
      v170 = ARCreateOBJStringForPlaneAnchors(v169, &v251, 1.0);
      id v171 = v251;
      if (v171)
      {
        id v172 = v171;
        v173 = _ARLogGeneral();
        if (os_log_type_enabled(v173, OS_LOG_TYPE_ERROR))
        {
          v174 = (objc_class *)objc_opt_class();
          NSStringFromClass(v174);
          id v175 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(void *)&buf[4] = v175;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = a1;
          *(_WORD *)&buf[22] = 2112;
          id v261 = v172;
          _os_log_impl(&dword_1B88A2000, v173, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not create obj for mesh anchors due to error: %@", buf, 0x20u);
        }
      }
      else
      {
        v176 = +[ARQATracer traceOutputDirectory];
        v177 = objc_msgSend(NSString, "stringWithFormat:", @"planeAnchors_%lu.obj", v245);
        v173 = [v176 stringByAppendingPathComponent:v177];

        id v250 = 0;
        [v170 writeToFile:v173 atomically:1 encoding:4 error:&v250];
        id v172 = v250;
        if (v172)
        {
          v178 = _ARLogGeneral();
          if (os_log_type_enabled(v178, OS_LOG_TYPE_ERROR))
          {
            v179 = (objc_class *)objc_opt_class();
            NSStringFromClass(v179);
            id v180 = (id)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            *(void *)&buf[4] = v180;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = a1;
            *(_WORD *)&buf[22] = 2112;
            id v261 = v172;
            _os_log_impl(&dword_1B88A2000, v178, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not save obj for mesh anchors due to error: %@", buf, 0x20u);
          }
          [v240 setObject:v172 forKeyedSubscript:@"planeAnchorsObjFileError"];
        }
        else
        {
          [v240 setObject:v173 forKeyedSubscript:@"planeAnchorsObjFile"];
        }
      }
    }
  }
  v181 = [v241 resultDatas];
  v182 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_447];
  v183 = [v181 filteredArrayUsingPredicate:v182];
  v237 = [v183 firstObject];

  v184 = [v237 resultDataOfClass:objc_opt_class()];
  v238 = [v184 firstObject];

  v185 = [v237 resultDataOfClass:objc_opt_class()];
  v244 = [v185 firstObject];

  BOOL v186 = +[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.session.qatracing.dumpSemanticSegmantationData"];
  if (v238) {
    BOOL v187 = v186;
  }
  else {
    BOOL v187 = 0;
  }
  if (v187 && [v238 source] == 2)
  {
    v188 = [v238 sourceImageData];
    v189 = [v188 cameraType];
    int v190 = [v189 isEqualToString:*MEMORY[0x1E4F15828]];

    if (v190)
    {
      uint64_t v191 = +[ARQATracer traceOutputDirectory];
      v192 = objc_msgSend(NSString, "stringWithFormat:", @"ultraWideImage_%lu.png", v245);
      v193 = [(id)v191 stringByAppendingPathComponent:v192];

      v194 = [v238 sourceImageData];
      LOBYTE(v191) = ARSavePixelBufferPNG((__CVBuffer *)[v194 pixelBuffer], v193) == 0;

      if ((v191 & 1) == 0)
      {
        v195 = _ARLogGeneral();
        if (os_log_type_enabled(v195, OS_LOG_TYPE_ERROR))
        {
          v196 = (objc_class *)objc_opt_class();
          NSStringFromClass(v196);
          id v197 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v197;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = a1;
          _os_log_impl(&dword_1B88A2000, v195, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not save ultrawide image to file", buf, 0x16u);
        }
      }
      [v240 setObject:v193 forKeyedSubscript:@"semanticSegmentationUndistoredUltraWideImage"];
    }
    if (v244)
    {
      long long v248 = 0u;
      long long v249 = 0u;
      long long v246 = 0u;
      long long v247 = 0u;
      v198 = [v244 downScalingResults];
      uint64_t v199 = [v198 countByEnumeratingWithState:&v246 objects:v259 count:16];
      if (v199)
      {
        uint64_t v200 = *(void *)v247;
        do
        {
          for (uint64_t k = 0; k != v199; ++k)
          {
            if (*(void *)v247 != v200) {
              objc_enumerationMutation(v198);
            }
            v202 = *(void **)(*((void *)&v246 + 1) + 8 * k);
            if ([v202 pixelBuffer])
            {
              v203 = NSString;
              [v202 imageResolution];
              double v205 = v204;
              [v202 imageResolution];
              v207 = objc_msgSend(v203, "stringWithFormat:", @"mlImage%dx%d_%lu.png", (int)v205, (int)v206, v245);
              v208 = +[ARQATracer traceOutputDirectory];
              v209 = [v208 stringByAppendingPathComponent:v207];

              if (ARSavePixelBufferPNG((__CVBuffer *)[v202 pixelBuffer], v209))
              {
                v210 = _ARLogGeneral();
                if (os_log_type_enabled(v210, OS_LOG_TYPE_ERROR))
                {
                  v211 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v211);
                  id v212 = (id)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  *(void *)&buf[4] = v212;
                  *(_WORD *)&buf[12] = 2048;
                  *(void *)&buf[14] = a1;
                  _os_log_impl(&dword_1B88A2000, v210, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not save ml image to file", buf, 0x16u);
                }
              }
            }
            v213 = [v244 latestResizedUltraWideImageData];
            v214 = [v213 downScalingResults];
            v215 = [v214 firstObject];

            if ([v215 undistortedPixelBuffer])
            {
              v216 = NSString;
              size_t v217 = CVPixelBufferGetWidth((CVPixelBufferRef)[v215 undistortedPixelBuffer]);
              v218 = objc_msgSend(v216, "stringWithFormat:", @"undistortedPixelBuffer%dx%d_%lu.png", v217, CVPixelBufferGetHeight((CVPixelBufferRef)objc_msgSend(v215, "undistortedPixelBuffer")), v245);
              v219 = +[ARQATracer traceOutputDirectory];
              v220 = [v219 stringByAppendingPathComponent:v218];

              if (ARSavePixelBufferPNG((__CVBuffer *)[v215 undistortedPixelBuffer], v220))
              {
                v221 = _ARLogGeneral();
                if (os_log_type_enabled(v221, OS_LOG_TYPE_ERROR))
                {
                  v222 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v222);
                  id v223 = (id)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  *(void *)&buf[4] = v223;
                  *(_WORD *)&buf[12] = 2048;
                  *(void *)&buf[14] = a1;
                  _os_log_impl(&dword_1B88A2000, v221, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not save undistored image to file", buf, 0x16u);
                }
              }
            }
          }
          uint64_t v199 = [v198 countByEnumeratingWithState:&v246 objects:v259 count:16];
        }
        while (v199);
      }
    }
    CVPixelBufferLockBaseAddress((CVPixelBufferRef)[v238 segmentationBuffer], 0);
    v224 = +[ARQATracer traceOutputDirectory];
    v225 = objc_msgSend(NSString, "stringWithFormat:", @"semanticSegmentation_%lu.png", v245);
    v226 = [v224 stringByAppendingPathComponent:v225];

    LODWORD(v224) = CVPixelBufferGetWidth((CVPixelBufferRef)[v238 segmentationBuffer]);
    LODWORD(v225) = CVPixelBufferGetHeight((CVPixelBufferRef)[v238 segmentationBuffer]);
    size_t v227 = CVPixelBufferGetBytesPerRow((CVPixelBufferRef)[v238 segmentationBuffer]);
    v228 = CVPixelBufferGetBaseAddress((CVPixelBufferRef)[v238 segmentationBuffer]);
    *(void *)buf = 0;
    *(void *)&buf[8] = v224 | ((unint64_t)v225 << 32);
    *(void *)&buf[16] = (v227 << 32) | 1;
    id v261 = v228;
    id v229 = v226;
    [v229 UTF8String];
    cva::imwrite<unsigned char>();
    [v240 setObject:v229 forKeyedSubscript:@"semanticSegmentationLabelsFile"];
    CVPixelBufferUnlockBaseAddress((CVPixelBufferRef)[v238 segmentationBuffer], 0);
  }
  id v230 = v240;

  return v230;
}

uint64_t __53__ARQAHelper_traceFrameData_withFrameIndex_writeOBJ___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __53__ARQAHelper_traceFrameData_withFrameIndex_writeOBJ___block_invoke_445(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (id)dictionaryFromCLLocation:(id)a3
{
  v18[5] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v17[0] = @"latitude";
  uint64_t v4 = NSNumber;
  [v3 coordinate];
  id v5 = objc_msgSend(v4, "numberWithDouble:");
  v18[0] = v5;
  v17[1] = @"longitude";
  uint64_t v6 = NSNumber;
  [v3 coordinate];
  double v8 = [v6 numberWithDouble:v7];
  v18[1] = v8;
  v17[2] = @"altitude";
  uint64_t v9 = NSNumber;
  [v3 altitude];
  float v10 = objc_msgSend(v9, "numberWithDouble:");
  v18[2] = v10;
  v17[3] = @"horizontalAccuracy";
  BOOL v11 = NSNumber;
  [v3 horizontalAccuracy];
  uint64_t v12 = objc_msgSend(v11, "numberWithDouble:");
  v18[3] = v12;
  v17[4] = @"verticalAccuracy";
  id v13 = NSNumber;
  [v3 verticalAccuracy];
  long long v14 = objc_msgSend(v13, "numberWithDouble:");
  v18[4] = v14;
  long long v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:5];

  return v15;
}

+ (id)dictionaryFromRawCLLocation:(id)a3
{
  v53[20] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 _groundAltitude];
  id v5 = v4;
  v51 = v4;
  if (!v4 || [v4 undulationModel] == -1)
  {
    BOOL v7 = 0;
  }
  else
  {
    [v5 uncertainty];
    [v5 uncertainty];
    BOOL v7 = v6 > 0.0;
  }
  if ([v3 isAltitudeWgs84Available])
  {
    [v3 altitudeWgs84];
    double v9 = v8;
    [v3 altitude];
    double v11 = v9 - v10;
  }
  else
  {
    double v11 = NAN;
  }
  v52[0] = @"latitude";
  uint64_t v12 = NSNumber;
  [v3 coordinate];
  v50 = objc_msgSend(v12, "numberWithDouble:");
  v53[0] = v50;
  v52[1] = @"longitude";
  id v13 = NSNumber;
  [v3 coordinate];
  v49 = [v13 numberWithDouble:v14];
  v53[1] = v49;
  v52[2] = @"altitude";
  long long v15 = NSNumber;
  [v3 altitude];
  v48 = objc_msgSend(v15, "numberWithDouble:");
  v53[2] = v48;
  v52[3] = @"course";
  long long v16 = NSNumber;
  [v3 course];
  v47 = objc_msgSend(v16, "numberWithDouble:");
  v53[3] = v47;
  v52[4] = @"horizontalAccuracy";
  id v17 = NSNumber;
  [v3 horizontalAccuracy];
  v46 = objc_msgSend(v17, "numberWithDouble:");
  v53[4] = v46;
  v52[5] = @"verticalAccuracy";
  id v18 = NSNumber;
  [v3 verticalAccuracy];
  v45 = objc_msgSend(v18, "numberWithDouble:");
  v53[5] = v45;
  v52[6] = @"courseAccuracy";
  id v19 = NSNumber;
  [v3 courseAccuracy];
  v44 = objc_msgSend(v19, "numberWithDouble:");
  v53[6] = v44;
  v52[7] = @"rawLatitude";
  id v20 = NSNumber;
  [v3 rawCoordinate];
  id v43 = objc_msgSend(v20, "numberWithDouble:");
  v53[7] = v43;
  v52[8] = @"rawLongitude";
  long long v21 = NSNumber;
  [v3 rawCoordinate];
  id v42 = [v21 numberWithDouble:v22];
  v53[8] = v42;
  v52[9] = @"rawAltitude";
  id v23 = NSNumber;
  [v3 rawAltitude];
  uint64_t v41 = objc_msgSend(v23, "numberWithDouble:");
  v53[9] = v41;
  v52[10] = @"rawCourse";
  long long v24 = NSNumber;
  [v3 rawCourse];
  v40 = objc_msgSend(v24, "numberWithDouble:");
  v53[10] = v40;
  v52[11] = @"rawHorizontalAccuracy";
  long long v25 = NSNumber;
  [v3 rawHorizontalAccuracy];
  uint64_t v39 = objc_msgSend(v25, "numberWithDouble:");
  v53[11] = v39;
  v52[12] = @"rawVerticalAccuracy";
  long long v26 = NSNumber;
  [v3 rawVerticalAccuracy];
  long long v27 = objc_msgSend(v26, "numberWithDouble:");
  v53[12] = v27;
  v52[13] = @"rawCourseAccuracy";
  long long v28 = NSNumber;
  [v3 rawCourseAccuracy];
  int v29 = objc_msgSend(v28, "numberWithDouble:");
  v53[13] = v29;
  v52[14] = @"undulation";
  uint64_t v30 = [NSNumber numberWithDouble:v11];
  v53[14] = v30;
  v52[15] = @"isGroundAltitudeValid";
  v31 = [NSNumber numberWithBool:v7];
  v53[15] = v31;
  v52[16] = @"isAltitudeWgs84Available";
  int v32 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "isAltitudeWgs84Available"));
  v53[16] = v32;
  v52[17] = @"isCoordinateFused";
  double v33 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "isCoordinateFused"));
  v53[17] = v33;
  v52[18] = @"isCoordinateFusedWithVL";
  uint64_t v34 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "isCoordinateFusedWithVL"));
  v53[18] = v34;
  v52[19] = @"ellipsoidalAltitude";
  [v3 ellipsoidalAltitude];
  int v35 = NSNumber;
  [v3 ellipsoidalAltitude];
  uint64_t v36 = objc_msgSend(v35, "numberWithDouble:");
  v53[19] = v36;
  double v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:20];

  return v37;
}

+ (id)dictionaryFromRaycastQuery:(id)a3
{
  v11[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v10[0] = @"origin";
  [v4 origin];
  id v5 = objc_msgSend(a1, "arrayWithVector3:");
  v11[0] = v5;
  v10[1] = @"direction";
  [v4 direction];
  double v6 = objc_msgSend(a1, "arrayWithVector3:");
  v11[1] = v6;
  v10[2] = @"description";
  BOOL v7 = [v4 description];
  v11[2] = v7;
  double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  return v8;
}

+ (id)arrayFromRaycastResults:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v4 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  obuint64_t j = v13;
  uint64_t v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v21, 16, v13);
  if (v5)
  {
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(obj);
        }
        double v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v19[0] = @"transform";
        [v8 worldTransform];
        double v9 = objc_msgSend(a1, "arrayWithMatrix4x4:");
        v19[1] = @"description";
        v20[0] = v9;
        double v10 = [v8 description];
        v20[1] = v10;
        double v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];

        [v4 addObject:v11];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v5);
  }

  return v4;
}

+ (float)_meanDepthValueOfDepthBuffer:(__CVBuffer *)a3 consideringSegmentation:(BOOL)a4 ofSegmentationBuffer:(__CVBuffer *)a5
{
  if (!a3) {
    return NAN;
  }
  BOOL v6 = a4;
  if (!a5 && a4) {
    return NAN;
  }
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  if (v6)
  {
    size_t v12 = CVPixelBufferGetBytesPerRow(a5);
    size_t v13 = CVPixelBufferGetWidth(a5);
    size_t v14 = CVPixelBufferGetHeight(a5);
    float result = NAN;
    if (Width != v13 || Height != v14) {
      return result;
    }
  }
  else
  {
    size_t v12 = 0;
  }
  CVPixelBufferLockBaseAddress(a3, 0);
  BaseAddress = (float *)CVPixelBufferGetBaseAddress(a3);
  long long v16 = 0;
  if (v6)
  {
    CVPixelBufferLockBaseAddress(a5, 0);
    long long v16 = CVPixelBufferGetBaseAddress(a5);
  }
  if (Height)
  {
    uint64_t v17 = 0;
    int v18 = 0;
    float v19 = 0.0;
    do
    {
      size_t v20 = Width;
      long long v21 = v16;
      for (uint64_t i = BaseAddress; v20; --v20)
      {
        if (!v6 || *v21)
        {
          float v19 = v19 + *i;
          ++v18;
        }
        ++i;
        ++v21;
      }
      ++v17;
      BaseAddress = (float *)((char *)BaseAddress + BytesPerRow);
      v16 += v12;
    }
    while (v17 != Height);
  }
  else
  {
    int v18 = 0;
    float v19 = 0.0;
  }
  CVPixelBufferUnlockBaseAddress(a3, 0);
  if (a5) {
    CVPixelBufferUnlockBaseAddress(a5, 0);
  }
  return v19 / (float)v18;
}

+ (id)formatDescriptionForAnchor
{
  id v2 = objc_opt_new();
  [v2 setObject:@"Anchor identifier" forKeyedSubscript:@"identifier"];
  [v2 setObject:@"Anchor transformation" forKeyedSubscript:@"transform"];
  return v2;
}

+ (id)dictionaryFromAnchor:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  uint64_t v5 = [v3 identifier];
  BOOL v6 = [v5 UUIDString];
  [v4 setObject:v6 forKeyedSubscript:@"identifier"];

  [v3 transform];
  BOOL v7 = +[ARQAHelper arrayWithMatrix4x4:](ARQAHelper, "arrayWithMatrix4x4:");
  [v4 setObject:v7 forKeyedSubscript:@"transform"];

  return v4;
}

+ (id)formatDescriptionForPlaneAnchor
{
  id v2 = [a1 formatDescriptionForAnchor];
  id v3 = (void *)[v2 mutableCopy];

  [v3 setObject:@"Alignment. horizontal or vertical" forKeyedSubscript:@"alignment"];
  [v3 setObject:@"Center of plane" forKeyedSubscript:@"center"];
  [v3 setObject:@"Plane's extent" forKeyedSubscript:@"extent"];
  [v3 setObject:@"The plane's geometry" forKeyedSubscript:@"geometry"];
  [v3 setObject:@"The plane's area" forKeyedSubscript:@"area"];
  [v3 setObject:@"The plane's classification" forKeyedSubscript:@"planeClassification"];
  [v3 setObject:@"Classification status" forKeyedSubscript:@"planeClassificationStatus"];
  [v3 setObject:@"Classification label" forKeyedSubscript:@"classificationLabel"];
  [v3 setObject:@"Extend of plane's grid" forKeyedSubscript:@"gridExtent"];
  return v3;
}

+ (id)dictionaryFromPlaneAnchor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 dictionaryFromAnchor:v4];
  BOOL v6 = (void *)[v5 mutableCopy];

  BOOL v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "alignment"));
  [v6 setObject:v7 forKeyedSubscript:@"alignment"];

  [v4 center];
  double v8 = +[ARQAHelper arrayWithVector3:](ARQAHelper, "arrayWithVector3:");
  [v6 setObject:v8 forKeyedSubscript:@"center"];

  [v4 extent];
  double v9 = +[ARQAHelper arrayWithVector3:](ARQAHelper, "arrayWithVector3:");
  [v6 setObject:v9 forKeyedSubscript:@"extent"];

  double v10 = [v4 planeExtent];
  double v11 = +[ARQAHelper dictionaryFromPlaneExtent:v10];
  [v6 setObject:v11 forKeyedSubscript:@"planeExtent"];

  size_t v12 = [v4 geometry];
  uint64_t v13 = [v12 vertices];
  size_t v14 = [v4 geometry];
  uint64_t v15 = [v14 vertexCount];
  long long v16 = [v4 geometry];
  uint64_t v17 = [v16 textureCoordinates];
  int v18 = [v4 geometry];
  float v19 = +[ARQAHelper dictionaryFromVertices:vertexCount:textureCoordinates:textureCoordinateCount:](ARQAHelper, "dictionaryFromVertices:vertexCount:textureCoordinates:textureCoordinateCount:", v13, v15, v17, [v18 textureCoordinateCount]);

  [v6 setObject:v19 forKeyedSubscript:@"geometry"];
  size_t v20 = NSNumber;
  [v4 area];
  long long v21 = objc_msgSend(v20, "numberWithFloat:");
  [v6 setObject:v21 forKeyedSubscript:@"area"];

  uint64_t v22 = NSStringFromARPlaneClassification([v4 classification]);
  [v6 setObject:v22 forKeyedSubscript:@"planeClassification"];

  id v23 = NSStringFromARPlaneClassificationStatus([v4 classificationStatus]);
  [v6 setObject:v23 forKeyedSubscript:@"planeClassificationStatus"];

  long long v24 = [v4 classificationLabel];
  [v6 setObject:v24 forKeyedSubscript:@"classificationLabel"];

  long long v25 = [v4 gridExtent];

  if (v25)
  {
    long long v26 = [v4 gridExtent];
    long long v27 = +[ARQAHelper dictionaryFromPatchGrid:v26];
    [v6 setObject:v27 forKeyedSubscript:@"gridExtent"];
  }
  return v6;
}

+ (id)dictionaryFromMeshAnchor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 dictionaryFromAnchor:v4];
  BOOL v6 = (void *)[v5 mutableCopy];

  BOOL v7 = [v4 geometry];
  double v8 = +[ARQAHelper dictionaryFromMeshGeometry:v7];

  [v6 setObject:v8 forKeyedSubscript:@"geometry"];
  return v6;
}

@end