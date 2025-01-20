@interface HMIFaceUtilities
+ (BOOL)isValidFaceCrop:(id)a3;
+ (BOOL)saveFaceClassifications:(id)a3 videoId:(id)a4 fragmentId:(unint64_t)a5 frameId:(id)a6 baseURL:(id)a7 error:(id *)a8;
+ (BOOL)serializeJSONObject:(id)a3 url:(id)a4 error:(id *)a5;
+ (CGRect)absoluteFaceBoxFromPhotosFaceCropImageData:(id)a3;
+ (CGRect)faceBoundingBoxFromPhotosFaceCropData:(id)a3;
+ (CGSize)faceCropDimensionsFromFaceCrop:(id)a3 error:(id *)a4;
+ (id)croppedJpegDataFromFaceCrop:(id)a3;
+ (id)faceObservationFromFaceprint:(id)a3;
+ (id)faceObservationFromTorsoprint:(id)a3;
+ (id)faceObservationsFromFaceprintsForClustering:(id)a3;
+ (id)imageCreationOptions;
+ (id)mergedPersonEventsFromEvents:(id)a3;
+ (id)newDictionaryPopulatedWithFaceCropDataFromImageData:(id)a3;
+ (unint64_t)faceprintAttributeDefaultRevision;
+ (unint64_t)faceprintDefaultRevision;
@end

@implementation HMIFaceUtilities

+ (unint64_t)faceprintDefaultRevision
{
  return 3737841670;
}

+ (unint64_t)faceprintAttributeDefaultRevision
{
  return 3737841670;
}

+ (id)faceObservationsFromFaceprintsForClustering:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263EFF980] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    int v7 = 0;
    uint64_t v8 = *(void *)v22;
    do
    {
      uint64_t v9 = 0;
      uint64_t v10 = v7;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v21 + 1) + 8 * v9);
        v12 = objc_msgSend(MEMORY[0x263F1EED0], "faceObservationWithRequestRevision:boundingBox:andAlignedBoundingBox:", 2, 0.0, 0.0, 1.0, 1.0, 0.0, 0.0, 1.0, 1.0);
        id v13 = objc_alloc(MEMORY[0x263F1EEE0]);
        id v14 = [v11 data];
        uint64_t v15 = [v14 bytes];
        unint64_t v16 = +[HMIFaceUtilities faceprintDefaultRevision];
        LODWORD(v17) = 1.0;
        v18 = (void *)[v13 initWithData:v15 elementCount:128 elementType:1 lengthInBytes:512 confidence:v16 requestRevision:v17];

        [v12 setFaceprint:v18];
        [v12 setFaceId:v10 + v9];
        [v4 addObject:v12];

        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      int v7 = v10 + v9;
    }
    while (v6);
  }

  return v4;
}

+ (id)faceObservationFromTorsoprint:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F1EEE0];
  id v4 = a3;
  id v5 = [v3 alloc];
  uint64_t v6 = [v4 data];

  id v7 = v6;
  uint64_t v8 = [v7 bytes];
  LODWORD(v9) = 1.0;
  uint64_t v10 = (void *)[v5 initWithData:v8 elementCount:128 elementType:1 lengthInBytes:512 confidence:3 requestRevision:v9];

  v11 = objc_msgSend(MEMORY[0x263F1EED0], "faceObservationWithRequestRevision:boundingBox:andAlignedBoundingBox:", 3, 0.0, 0.0, 1.0, 1.0, 0.0, 0.0, 1.0, 1.0);
  [v11 setFaceprint:v10];

  return v11;
}

+ (id)faceObservationFromFaceprint:(id)a3
{
  id v3 = (void *)MEMORY[0x263F1EED0];
  id v4 = a3;
  id v5 = objc_msgSend(v3, "faceObservationWithRequestRevision:boundingBox:andAlignedBoundingBox:", 2, 0.0, 0.0, 1.0, 1.0, 0.0, 0.0, 1.0, 1.0);
  id v6 = objc_alloc(MEMORY[0x263F1EEE0]);
  id v7 = [v4 data];

  id v8 = v7;
  uint64_t v9 = [v8 bytes];
  unint64_t v10 = +[HMIFaceUtilities faceprintDefaultRevision];
  LODWORD(v11) = 1.0;
  v12 = (void *)[v6 initWithData:v9 elementCount:128 elementType:1 lengthInBytes:512 confidence:v10 requestRevision:v11];

  [v5 setFaceprint:v12];
  return v5;
}

+ (id)croppedJpegDataFromFaceCrop:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(HMIFaceprinter);
  uint64_t v10 = 0;
  id v5 = [(HMIFaceprinter *)v4 createFacePixelBufferFromFaceCrop:v3 error:&v10];

  if (v5)
  {
    LODWORD(v6) = 1.0;
    LODWORD(v7) = 1.0;
    id v8 = +[HMIVisionUtilities createJPEGDataFromPixelBuffer:v5 scale:0 encodeQuality:v6 error:v7];
    CVPixelBufferRelease(v5);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)mergedPersonEventsFromEvents:(id)a3
{
  id v3 = a3;
  id v4 = [v3 allObjects];
  id v5 = objc_msgSend(v4, "na_filter:", &__block_literal_global_22);

  double v6 = [v3 allObjects];
  v49 = objc_msgSend(v6, "na_filter:", &__block_literal_global_58);

  double v7 = [v3 allObjects];
  id v8 = objc_msgSend(v7, "na_filter:", &__block_literal_global_61);

  uint64_t v9 = objc_msgSend(v3, "na_filter:", &__block_literal_global_64);

  v51 = (void *)[v9 mutableCopy];
  uint64_t v10 = [MEMORY[0x263EFF980] array];
  double v11 = [MEMORY[0x263EFF9A0] dictionary];
  v85[0] = MEMORY[0x263EF8330];
  v85[1] = 3221225472;
  v85[2] = __49__HMIFaceUtilities_mergedPersonEventsFromEvents___block_invoke_5;
  v85[3] = &unk_26477CA60;
  id v47 = v11;
  id v86 = v47;
  id v12 = v8;
  id v87 = v12;
  id v13 = v10;
  id v88 = v13;
  [v5 enumerateObjectsUsingBlock:v85];
  v45 = objc_msgSend(MEMORY[0x263F089C8], "indexSetWithIndexesInRange:", 0, objc_msgSend(v5, "count"));
  id v14 = objc_msgSend(MEMORY[0x263F089C8], "indexSetWithIndexesInRange:", 0, objc_msgSend(v12, "count"));
  uint64_t v15 = [MEMORY[0x263EFF9A0] dictionary];
  unint64_t v16 = [v13 sortedArrayUsingComparator:&__block_literal_global_2];
  v81[0] = MEMORY[0x263EF8330];
  v81[1] = 3221225472;
  v81[2] = __49__HMIFaceUtilities_mergedPersonEventsFromEvents___block_invoke_7;
  v81[3] = &unk_26477D6D0;
  id v82 = v14;
  id v17 = v15;
  id v83 = v17;
  id v18 = v12;
  id v84 = v18;
  id v52 = v14;
  objc_msgSend(v16, "na_each:", v81);

  v76[0] = MEMORY[0x263EF8330];
  v76[1] = 3221225472;
  v76[2] = __49__HMIFaceUtilities_mergedPersonEventsFromEvents___block_invoke_8;
  v76[3] = &unk_26477D6F8;
  id v19 = v17;
  id v77 = v19;
  id v20 = v5;
  id v78 = v20;
  id v21 = v18;
  id v79 = v21;
  id v22 = v45;
  id v80 = v22;
  [v52 enumerateIndexesUsingBlock:v76];
  [v13 removeAllObjects];
  v71[0] = MEMORY[0x263EF8330];
  v71[1] = 3221225472;
  v71[2] = __49__HMIFaceUtilities_mergedPersonEventsFromEvents___block_invoke_9;
  v71[3] = &unk_26477D6F8;
  id v43 = v19;
  id v72 = v43;
  id v42 = v47;
  id v73 = v42;
  id v23 = v49;
  id v74 = v23;
  id v75 = v13;
  id v50 = v13;
  [v22 enumerateIndexesUsingBlock:v71];
  long long v24 = [MEMORY[0x263EFF9A0] dictionary];
  v25 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v26 = objc_msgSend(MEMORY[0x263F089C8], "indexSetWithIndexesInRange:", 0, objc_msgSend(v23, "count"));
  v27 = [v50 sortedArrayUsingComparator:&__block_literal_global_2];
  v65[0] = MEMORY[0x263EF8330];
  v65[1] = 3221225472;
  v65[2] = __49__HMIFaceUtilities_mergedPersonEventsFromEvents___block_invoke_11;
  v65[3] = &unk_26477D720;
  id v28 = v22;
  id v66 = v28;
  id v67 = v26;
  id v29 = v24;
  id v68 = v29;
  id v30 = v23;
  id v69 = v30;
  id v31 = v25;
  id v70 = v31;
  id v32 = v26;
  objc_msgSend(v27, "na_each:", v65);

  v58[0] = MEMORY[0x263EF8330];
  v58[1] = 3221225472;
  v58[2] = __49__HMIFaceUtilities_mergedPersonEventsFromEvents___block_invoke_12;
  v58[3] = &unk_26477D748;
  id v59 = v31;
  id v60 = v30;
  id v33 = v29;
  id v61 = v33;
  id v62 = v20;
  id v63 = v21;
  id v64 = v28;
  id v34 = v28;
  id v48 = v21;
  id v46 = v20;
  id v44 = v30;
  id v35 = v31;
  [v32 enumerateIndexesUsingBlock:v58];
  v53[0] = MEMORY[0x263EF8330];
  v53[1] = 3221225472;
  v53[2] = __49__HMIFaceUtilities_mergedPersonEventsFromEvents___block_invoke_13;
  v53[3] = &unk_26477D6F8;
  id v54 = v42;
  id v55 = v43;
  id v56 = v33;
  id v57 = v51;
  id v36 = v51;
  id v37 = v33;
  id v38 = v43;
  id v39 = v42;
  [v34 enumerateIndexesUsingBlock:v53];
  v40 = (void *)[v36 copy];

  return v40;
}

BOOL __49__HMIFaceUtilities_mergedPersonEventsFromEvents___block_invoke()
{
  uint64_t v0 = objc_opt_class();
  return v0 == objc_opt_class();
}

BOOL __49__HMIFaceUtilities_mergedPersonEventsFromEvents___block_invoke_2()
{
  uint64_t v0 = objc_opt_class();
  return v0 == objc_opt_class();
}

BOOL __49__HMIFaceUtilities_mergedPersonEventsFromEvents___block_invoke_3()
{
  uint64_t v0 = objc_opt_class();
  return v0 == objc_opt_class();
}

BOOL __49__HMIFaceUtilities_mergedPersonEventsFromEvents___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  if (v3 == objc_opt_class() || (uint64_t v4 = objc_opt_class(), v4 == objc_opt_class()))
  {
    BOOL v6 = 0;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    BOOL v6 = v5 != objc_opt_class();
  }

  return v6;
}

void __49__HMIFaceUtilities_mergedPersonEventsFromEvents___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  BOOL v6 = *(void **)(a1 + 32);
  double v7 = [NSNumber numberWithUnsignedInteger:a3];
  [v6 setObject:v5 forKeyedSubscript:v7];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __49__HMIFaceUtilities_mergedPersonEventsFromEvents___block_invoke_6;
  v10[3] = &unk_26477D6A8;
  id v11 = v5;
  id v8 = *(void **)(a1 + 40);
  id v12 = *(id *)(a1 + 48);
  uint64_t v13 = a3;
  id v9 = v5;
  [v8 enumerateObjectsUsingBlock:v10];
}

void __49__HMIFaceUtilities_mergedPersonEventsFromEvents___block_invoke_6(uint64_t a1, void *a2, uint64_t a3)
{
  id v35 = a2;
  [*(id *)(a1 + 32) boundingBox];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [v35 boundingBox];
  HMICGRectIntersectionOverArea(v6, v8, v10, v12, v13, v14, v15, v16);
  if (v17 > 0.7)
  {
    [*(id *)(a1 + 32) boundingBox];
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    [v35 boundingBox];
    HMICGRectIntersectionOverUnion(v19, v21, v23, v25, v26, v27, v28, v29);
    LODWORD(v19) = v30;
    id v31 = *(void **)(a1 + 40);
    id v32 = [HMIPairwiseMatch alloc];
    LODWORD(v33) = LODWORD(v19);
    id v34 = [(HMIPairwiseMatch *)v32 initWithFirstIndex:*(void *)(a1 + 48) secondIndex:a3 score:v33];
    [v31 addObject:v34];
  }
}

void __49__HMIFaceUtilities_mergedPersonEventsFromEvents___block_invoke_7(uint64_t a1, void *a2)
{
  id v9 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsIndex:", objc_msgSend(v9, "secondIndex")))
  {
    uint64_t v3 = *(void **)(a1 + 40);
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "firstIndex"));
    double v5 = [v3 objectForKeyedSubscript:v4];

    if (!v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "removeIndex:", objc_msgSend(v9, "secondIndex"));
      double v6 = objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", objc_msgSend(v9, "secondIndex"));
      double v7 = *(void **)(a1 + 40);
      double v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "firstIndex"));
      [v7 setObject:v6 forKeyedSubscript:v8];
    }
  }
}

uint64_t __49__HMIFaceUtilities_mergedPersonEventsFromEvents___block_invoke_8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 48) objectAtIndexedSubscript:a2];
  double v5 = *(void **)(a1 + 32);
  double v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "count") + a2);
  [v5 setObject:v4 forKeyedSubscript:v6];

  double v7 = *(void **)(a1 + 56);
  uint64_t v8 = [*(id *)(a1 + 40) count] + a2;
  return [v7 addIndex:v8];
}

void __49__HMIFaceUtilities_mergedPersonEventsFromEvents___block_invoke_9(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a1 + 32);
  double v5 = [NSNumber numberWithUnsignedInteger:a2];
  double v6 = [v4 objectForKeyedSubscript:v5];
  if (v6) {
    double v7 = *(void **)(a1 + 32);
  }
  else {
    double v7 = *(void **)(a1 + 40);
  }
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:a2];
  id v9 = [v7 objectForKeyedSubscript:v8];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __49__HMIFaceUtilities_mergedPersonEventsFromEvents___block_invoke_10;
  v12[3] = &unk_26477D6A8;
  id v13 = v9;
  double v10 = *(void **)(a1 + 48);
  id v14 = *(id *)(a1 + 56);
  uint64_t v15 = a2;
  id v11 = v9;
  [v10 enumerateObjectsUsingBlock:v12];
}

void __49__HMIFaceUtilities_mergedPersonEventsFromEvents___block_invoke_10(uint64_t a1, void *a2, uint64_t a3)
{
  double v5 = *(void **)(a1 + 32);
  id v6 = a2;
  [v5 boundingBox];
  double MinX = CGRectGetMinX(v26);
  [*(id *)(a1 + 32) boundingBox];
  double MinY = CGRectGetMinY(v27);
  [*(id *)(a1 + 32) boundingBox];
  double Width = CGRectGetWidth(v28);
  [*(id *)(a1 + 32) boundingBox];
  double v10 = CGRectGetHeight(v29) * 0.4;
  [v6 boundingBox];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  HMICGRectIntersectionOverArea(v12, v14, v16, v18, MinX, MinY, Width, v10);
  if (v19 > 0.0)
  {
    float v20 = v19;
    double v21 = *(void **)(a1 + 40);
    double v22 = [HMIPairwiseMatch alloc];
    *(float *)&double v23 = v20;
    double v24 = [(HMIPairwiseMatch *)v22 initWithFirstIndex:*(void *)(a1 + 48) secondIndex:a3 score:v23];
    [v21 addObject:v24];
  }
}

uint64_t __49__HMIFaceUtilities_mergedPersonEventsFromEvents___block_invoke_11(uint64_t a1, void *a2)
{
  id v16 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsIndex:", objc_msgSend(v16, "firstIndex")))
  {
    if (objc_msgSend(*(id *)(a1 + 40), "containsIndex:", objc_msgSend(v16, "secondIndex")))
    {
      uint64_t v3 = *(void **)(a1 + 48);
      uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v16, "firstIndex"));
      double v5 = [v3 objectForKeyedSubscript:v4];

      if (!v5)
      {
        objc_msgSend(*(id *)(a1 + 40), "removeIndex:", objc_msgSend(v16, "secondIndex"));
        double v10 = objc_msgSend(*(id *)(a1 + 56), "objectAtIndexedSubscript:", objc_msgSend(v16, "secondIndex"));
        double v14 = *(void **)(a1 + 48);
        double v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v16, "firstIndex"));
        [v14 setObject:v10 forKeyedSubscript:v11];
        goto LABEL_8;
      }
    }
    if (objc_msgSend(*(id *)(a1 + 40), "containsIndex:", objc_msgSend(v16, "secondIndex")))
    {
      id v6 = *(void **)(a1 + 64);
      double v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v16, "secondIndex"));
      uint64_t v8 = [v6 objectForKeyedSubscript:v7];

      if (!v8)
      {
        id v9 = *(void **)(a1 + 48);
        double v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v16, "firstIndex"));
        double v11 = [v9 objectForKeyedSubscript:v10];
        double v12 = *(void **)(a1 + 64);
        double v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v16, "secondIndex"));
        [v12 setObject:v11 forKeyedSubscript:v13];

LABEL_8:
      }
    }
  }
  return MEMORY[0x270F9A758]();
}

void __49__HMIFaceUtilities_mergedPersonEventsFromEvents___block_invoke_12(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a1 + 32);
  double v5 = [NSNumber numberWithUnsignedInteger:a2];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (!v6) {
    goto LABEL_3;
  }
  double v7 = *(void **)(a1 + 32);
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:a2];
  id v9 = [v7 objectForKeyedSubscript:v8];
  [v9 boundingBox];
  double v14 = HMICGRectArea(v10, v11, v12, v13);

  double v15 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a2];
  [v15 boundingBox];
  double v20 = HMICGRectArea(v16, v17, v18, v19);

  if (v20 * 9.0 >= v14)
  {
LABEL_3:
    double v21 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a2];
    double v22 = *(void **)(a1 + 48);
    double v23 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 56), "count") + a2 + objc_msgSend(*(id *)(a1 + 64), "count"));
    [v22 setObject:v21 forKeyedSubscript:v23];

    double v24 = *(void **)(a1 + 72);
    uint64_t v25 = [*(id *)(a1 + 56) count];
    uint64_t v26 = v25 + a2 + [*(id *)(a1 + 64) count];
    [v24 addIndex:v26];
  }
}

void __49__HMIFaceUtilities_mergedPersonEventsFromEvents___block_invoke_13(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a1 + 32);
  double v5 = [NSNumber numberWithUnsignedInteger:a2];
  id v16 = [v4 objectForKeyedSubscript:v5];

  id v6 = *(void **)(a1 + 40);
  double v7 = [NSNumber numberWithUnsignedInteger:a2];
  uint64_t v8 = [v6 objectForKeyedSubscript:v7];

  id v9 = *(void **)(a1 + 48);
  double v10 = [NSNumber numberWithUnsignedInteger:a2];
  double v11 = [v9 objectForKeyedSubscript:v10];

  if (v16)
  {
    double v12 = [HMIVideoAnalyzerEventPerson alloc];
    double v13 = [v16 confidence];
    [v16 boundingBox];
    double v14 = -[HMIVideoAnalyzerEventPerson initWithConfidence:boundingBox:face:torso:](v12, "initWithConfidence:boundingBox:face:torso:", v13, v11, v8);

    if (!v14) {
      goto LABEL_15;
    }
LABEL_14:
    [*(id *)(a1 + 56) addObject:v14];

    goto LABEL_15;
  }
  if (v11 && v8)
  {
    double v15 = [[HMIVideoAnalyzerEventPerson alloc] initWithFaceEvent:v11 torso:v8];
    goto LABEL_13;
  }
  if (v11 && !v8)
  {
    double v15 = [[HMIVideoAnalyzerEventPerson alloc] initWithFaceEvent:v11];
    goto LABEL_13;
  }
  if (!v11 && v8)
  {
    double v15 = [[HMIVideoAnalyzerEventPerson alloc] initWithTorsoEvent:v8];
LABEL_13:
    double v14 = v15;
    if (!v15) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_15:
}

+ (BOOL)saveFaceClassifications:(id)a3 videoId:(id)a4 fragmentId:(unint64_t)a5 frameId:(id)a6 baseURL:(id)a7 error:(id *)a8
{
  uint64_t v99 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v76 = a4;
  id v75 = a6;
  id v13 = a7;
  double v14 = [MEMORY[0x263F08850] defaultManager];
  double v15 = [v13 path];
  id v91 = 0;
  LOBYTE(a4) = [v14 createDirectoryAtPath:v15 withIntermediateDirectories:1 attributes:0 error:&v91];
  id v16 = v91;

  if (a4)
  {
    id v64 = a8;
    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    id obj = v12;
    uint64_t v68 = [obj countByEnumeratingWithState:&v87 objects:v98 count:16];
    if (!v68)
    {
      BOOL v55 = 1;
      goto LABEL_37;
    }
    uint64_t v66 = *(void *)v88;
    id v67 = v12;
    id v84 = v13;
LABEL_4:
    uint64_t v17 = 0;
    id v18 = v16;
    while (1)
    {
      id v82 = v18;
      if (*(void *)v88 != v66) {
        objc_enumerationMutation(obj);
      }
      double v19 = *(void **)(*((void *)&v87 + 1) + 8 * v17);
      v97[0] = @"0.1";
      v96[0] = @"version";
      v96[1] = @"personUUID";
      id v80 = [v19 personUUID];
      if (v80)
      {
        id v72 = [v19 personUUID];
        uint64_t v20 = [v72 UUIDString];
        id v70 = (void *)v20;
      }
      else
      {
        uint64_t v20 = [MEMORY[0x263EFF9D0] null];
        id v74 = (void *)v20;
      }
      v97[1] = v20;
      v96[2] = @"sourceUUID";
      double v21 = [v19 sourceUUID];
      uint64_t v78 = v17;
      if (v21)
      {
        id v73 = [v19 sourceUUID];
        uint64_t v22 = [v73 UUIDString];
        v71 = (void *)v22;
        double v23 = v77;
      }
      else
      {
        uint64_t v22 = [MEMORY[0x263EFF9D0] null];
        double v23 = (void *)v22;
      }
      v97[2] = v22;
      v96[3] = @"faceCropUUID";
      double v24 = [v19 faceCrop];
      uint64_t v25 = [v24 UUID];
      uint64_t v26 = [v25 UUIDString];
      v97[3] = v26;
      v96[4] = @"faceprintUUID";
      CGRect v27 = [v19 faceprint];
      CGRect v28 = [v27 UUID];
      CGRect v29 = [v28 UUIDString];
      v97[4] = v29;
      v96[5] = @"confidence";
      int v30 = NSNumber;
      v85 = v19;
      [v19 confidence];
      id v31 = objc_msgSend(v30, "numberWithDouble:");
      v97[5] = v31;
      id v83 = [NSDictionary dictionaryWithObjects:v97 forKeys:v96 count:6];

      id v32 = v23;
      if (v21)
      {

        id v32 = v73;
      }
      id v77 = v23;

      double v33 = v74;
      if (v80)
      {

        double v33 = v72;
      }

      v81 = NSString;
      uint64_t v79 = [v75 intValue];
      id v34 = [v19 UUID];
      id v35 = v34 ? @"known" : @"unknown";
      id v36 = [v19 faceCrop];
      id v37 = [v36 UUID];
      id v38 = [v37 UUIDString];
      id v39 = [v38 substringToIndex:8];
      v40 = [v85 sourceUUID];
      v41 = [v40 UUIDString];
      uint64_t v42 = [v41 substringToIndex:8];
      id v43 = [v81 stringWithFormat:@"%@-%03lu-%03u-%@-%@-%@", v76, a5, v79, v35, v39, v42];

      id v44 = [v84 URLByAppendingPathComponent:v43];
      v45 = [v44 URLByAppendingPathExtension:@"json"];
      id v46 = v83;
      id v86 = v82;
      LOBYTE(v42) = +[HMIFaceUtilities serializeJSONObject:v83 url:v45 error:&v86];
      id v47 = v86;

      if ((v42 & 1) == 0) {
        break;
      }
      id v16 = v47;
      id v48 = [v85 faceCrop];
      v49 = [v48 dataRepresentation];
      id v50 = [v44 URLByAppendingPathExtension:@"jpg"];
      char v51 = [v49 writeToURL:v50 atomically:0];

      if ((v51 & 1) == 0)
      {
        id v60 = [NSString stringWithFormat:@"Error saving face crop image to disk for face classification:%@", v85];
        id v61 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1000 description:v60];
        goto LABEL_33;
      }
      id v52 = (void *)MEMORY[0x22A641C70]();
      v53 = HMFGetOSLogHandle();
      id v12 = v67;
      if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
      {
        id v54 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v93 = v54;
        __int16 v94 = 2112;
        v95 = v85;
        _os_log_impl(&dword_225DC6000, v53, OS_LOG_TYPE_INFO, "%{public}@Saved face classification:%@ to disk", buf, 0x16u);
      }

      uint64_t v17 = v78 + 1;
      id v18 = v16;
      id v13 = v84;
      if (v68 == v78 + 1)
      {
        BOOL v55 = 1;
        uint64_t v68 = [obj countByEnumeratingWithState:&v87 objects:v98 count:16];
        if (v68) {
          goto LABEL_4;
        }
        goto LABEL_37;
      }
    }
    id v60 = [NSString stringWithFormat:@"Error saving metadata to disk for face classification:%@", v85];
    id v16 = v47;
    id v61 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1000 description:v60 underlyingError:v47];
LABEL_33:
    id v62 = v61;
    id v12 = v67;
    if (v64)
    {
      id v62 = v61;
      *id v64 = v62;
    }
    HMIErrorLogC(v62);

    id v13 = v84;
    goto LABEL_36;
  }
  id v56 = NSString;
  id v57 = [v13 path];
  uint64_t v58 = [v56 stringWithFormat:@"Error creating directory:%@ to save face classifications", v57];

  id obj = (id)v58;
  id v59 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1000 description:v58 underlyingError:v16];
  id v46 = v59;
  if (a8) {
    *a8 = v59;
  }
  HMIErrorLogC(v46);
LABEL_36:

  BOOL v55 = 0;
LABEL_37:

  return v55;
}

+ (BOOL)serializeJSONObject:(id)a3 url:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v16 = 0;
  uint64_t v8 = [MEMORY[0x263F08900] dataWithJSONObject:a3 options:3 error:&v16];
  id v9 = v16;
  double v10 = v9;
  if (v8)
  {
    double v11 = (void *)[[NSString alloc] initWithData:v8 encoding:4];
    id v15 = v10;
    char v12 = [v11 writeToURL:v7 atomically:1 encoding:4 error:&v15];
    id v13 = v15;

    if ((v12 & 1) == 0)
    {
      if (a5) {
        *a5 = v13;
      }
      HMIErrorLogC(v13);
    }

    double v10 = v13;
  }
  else
  {
    if (a5) {
      *a5 = v9;
    }
    HMIErrorLogC(v10);
    char v12 = 0;
  }

  return v12;
}

+ (CGRect)faceBoundingBoxFromPhotosFaceCropData:(id)a3
{
  id v3 = a3;
  [(id)objc_opt_class() absoluteFaceBoxFromPhotosFaceCropImageData:v3];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [(id)objc_opt_class() faceCropDimensionsFromFaceCrop:v3 error:0];
  double v13 = v12;
  double v15 = v14;

  v26.origin.CGFloat x = v5;
  v26.origin.CGFloat y = v7;
  v26.size.CGFloat width = v9;
  v26.size.CGFloat height = v11;
  if (CGRectIsNull(v26)) {
    return *(CGRect *)*(void *)&MEMORY[0x263F001A0];
  }
  if (v13 == *MEMORY[0x263F001B0] && v15 == *(double *)(MEMORY[0x263F001B0] + 8))
  {
    return *(CGRect *)*(void *)&MEMORY[0x263F001A0];
  }
  else
  {
    v33.origin.CGFloat x = HMICGRectMakeWithSize();
    v33.origin.CGFloat y = v17;
    v33.size.CGFloat width = v18;
    v33.size.CGFloat height = v19;
    v27.origin.CGFloat x = v5;
    v27.origin.CGFloat y = v7;
    v27.size.CGFloat width = v9;
    v27.size.CGFloat height = v11;
    CGRect v28 = CGRectIntersection(v27, v33);
    HMICGRectNormalizedFromPixel((unint64_t)v13, (unint64_t)v15, v28.origin.x, v28.origin.y, v28.size.width, v28.size.height);
    CGFloat x = v29.origin.x;
    CGFloat y = v29.origin.y;
    CGFloat width = v29.size.width;
    CGFloat height = v29.size.height;
    CGFloat v24 = CGRectGetWidth(v29) * 0.150000006 * 0.5;
    v30.origin.CGFloat x = x;
    v30.origin.CGFloat y = y;
    v30.size.CGFloat width = width;
    v30.size.CGFloat height = height;
    CGFloat v25 = CGRectGetHeight(v30) * 0.150000006 * 0.5;
    v31.origin.CGFloat x = x;
    v31.origin.CGFloat y = y;
    v31.size.CGFloat width = width;
    v31.size.CGFloat height = height;
    return CGRectInset(v31, v24, v25);
  }
}

+ (BOOL)isValidFaceCrop:(id)a3
{
  id v5 = a3;
  double v6 = (void *)MEMORY[0x22A641C70]();
  CGFloat v7 = (void *)[a1 newDictionaryPopulatedWithFaceCropDataFromImageData:v5];
  double v8 = v7;
  if (v7)
  {
    CGFloat v9 = [v7 objectForKeyedSubscript:@"PVFC_VER"];
    char v10 = [v9 isEqualToNumber:&unk_26D9A92E8];
    if ((v10 & 1) != 0
      || ([v8 objectForKeyedSubscript:@"PVFC_VER"],
          id v3 = objc_claimAutoreleasedReturnValue(),
          [v3 isEqualToNumber:&unk_26D9A9300]))
    {
      CGFloat v11 = [v8 objectForKeyedSubscript:@"PVFC_FB"];
      if (v11)
      {
        double v12 = [v8 objectForKeyedSubscript:@"PVFC_CB"];
        BOOL v13 = v12 != 0;
      }
      else
      {
        BOOL v13 = 0;
      }

      if (v10) {
        goto LABEL_12;
      }
    }
    else
    {
      BOOL v13 = 0;
    }

LABEL_12:
    goto LABEL_13;
  }
  BOOL v13 = 0;
LABEL_13:

  return v13;
}

+ (CGRect)absoluteFaceBoxFromPhotosFaceCropImageData:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a3;
  double v4 = (void *)[(id)objc_opt_class() newDictionaryPopulatedWithFaceCropDataFromImageData:v3];
  id v5 = v4;
  if (v4)
  {
    CFDictionaryRef v6 = [v4 objectForKeyedSubscript:@"PVFC_FB"];
    CFDictionaryRef v7 = v6;
    if (v6)
    {
      memset(&rect, 0, sizeof(rect));
      if (CGRectMakeWithDictionaryRepresentation(v6, &rect))
      {
        p_CGRect rect = &rect;
        long long v9 = *(_OWORD *)&rect.origin.y;
      }
      else
      {
        double v15 = (void *)MEMORY[0x22A641C70]();
        id v16 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          CGFloat v17 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          CGFloat v24 = v17;
          _os_log_impl(&dword_225DC6000, v16, OS_LOG_TYPE_ERROR, "%{public}@Couldn't convert face box dict to rect", buf, 0xCu);
        }
        p_CGRect rect = (CGRect *)MEMORY[0x263F001A0];
        long long v9 = *(_OWORD *)(MEMORY[0x263F001A0] + 8);
      }
      long long v22 = v9;
      CGFloat height = p_rect->size.height;
      CGFloat x = p_rect->origin.x;
    }
    else
    {
      double v12 = (void *)MEMORY[0x22A641C70]();
      BOOL v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        double v14 = HMFGetLogIdentifier();
        LODWORD(rect.origin.x) = 138543362;
        *(void *)((char *)&rect.origin.x + 4) = v14;
        _os_log_impl(&dword_225DC6000, v13, OS_LOG_TYPE_ERROR, "%{public}@Face Box dict is null in photos metadata", (uint8_t *)&rect, 0xCu);
      }
      CGFloat x = *MEMORY[0x263F001A0];
      long long v22 = *(_OWORD *)(MEMORY[0x263F001A0] + 8);
      CGFloat height = *(double *)(MEMORY[0x263F001A0] + 24);
    }
  }
  else
  {
    CGFloat x = *MEMORY[0x263F001A0];
    long long v22 = *(_OWORD *)(MEMORY[0x263F001A0] + 8);
    CGFloat height = *(double *)(MEMORY[0x263F001A0] + 24);
  }

  double v19 = *((double *)&v22 + 1);
  double v18 = *(double *)&v22;
  double v20 = x;
  double v21 = height;
  result.size.CGFloat height = v21;
  result.size.CGFloat width = v19;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v20;
  return result;
}

+ (CGSize)faceCropDimensionsFromFaceCrop:(id)a3 error:(id *)a4
{
  v18[3] = *MEMORY[0x263EF8340];
  CFDataRef v5 = (const __CFData *)a3;
  CFDictionaryRef v6 = (void *)MEMORY[0x22A641C70]();
  if (([a1 isValidFaceCrop:v5] & 1) == 0)
  {
    BOOL v13 = @"the supplied data is not a facecrop";
    goto LABEL_7;
  }
  CFDictionaryRef v7 = CGImageSourceCreateWithData(v5, (CFDictionaryRef)[a1 imageCreationOptions]);
  double v8 = v7;
  if (!v7)
  {
    BOOL v13 = @"could not create an image source";
LABEL_7:
    id v14 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF488] reason:v13 userInfo:0];
    objc_exception_throw(v14);
  }
  int v17 = -1;
  v18[0] = 0;
  size_t v16 = 0;
  if ((getImagePropertiesFromCGImageSource(v7, &v17, v18, &v16) & 1) == 0)
  {
    id v15 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF488] reason:@"Could not retrieve image properties" userInfo:0];
    objc_exception_throw(v15);
  }
  double v9 = (double)v18[0];
  double v10 = (double)v16;
  CFRelease(v8);

  double v11 = v9;
  double v12 = v10;
  result.CGFloat height = v12;
  result.CGFloat width = v11;
  return result;
}

+ (id)imageCreationOptions
{
  if (imageCreationOptions_onceToken != -1) {
    dispatch_once(&imageCreationOptions_onceToken, &__block_literal_global_141);
  }
  id v2 = (void *)imageCreationOptions_kImageCreationOptions;
  return v2;
}

void __40__HMIFaceUtilities_imageCreationOptions__block_invoke()
{
  v5[4] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F0F648];
  v4[0] = *MEMORY[0x263F0F600];
  v4[1] = v0;
  v5[0] = MEMORY[0x263EFFA80];
  v5[1] = MEMORY[0x263EFFA88];
  uint64_t v1 = *MEMORY[0x263F0F620];
  v4[2] = *MEMORY[0x263F0F650];
  v4[3] = v1;
  v5[2] = MEMORY[0x263EFFA80];
  v5[3] = MEMORY[0x263EFFA88];
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:4];
  id v3 = (void *)imageCreationOptions_kImageCreationOptions;
  imageCreationOptions_kImageCreationOptions = v2;
}

+ (id)newDictionaryPopulatedWithFaceCropDataFromImageData:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  CFDataRef v3 = (const __CFData *)a3;
  double v4 = (void *)MEMORY[0x22A641C70]();
  if (v3)
  {
    CFDataRef v5 = CGImageSourceCreateWithData(v3, 0);
    CFDictionaryRef v6 = v5;
    if (!v5)
    {
      id v22 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF488] reason:@"Could not create image source" userInfo:0];
      objc_exception_throw(v22);
    }
    CFDictionaryRef v7 = CGImageSourceCopyMetadataAtIndex(v5, 0, 0);
    double v8 = v7;
    if (!v7)
    {
      id v23 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF488] reason:@"No meta data exists on image" userInfo:0];
      objc_exception_throw(v23);
    }
    double v9 = (__CFString *)CGImageMetadataCopyStringValueWithPath(v7, 0, @"PVFC:PVFC");
    double v10 = v9;
    if (v9)
    {
      double v11 = (void *)MEMORY[0x263F08900];
      double v12 = [(__CFString *)v9 dataUsingEncoding:4];
      uint64_t v13 = [v11 JSONObjectWithData:v12 options:1 error:0];
    }
    else
    {
      int v17 = (void *)MEMORY[0x22A641C70]();
      HMFGetOSLogHandle();
      double v18 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        double v19 = HMFGetLogIdentifier();
        int v24 = 138543362;
        CGFloat v25 = v19;
        _os_log_impl(&dword_225DC6000, v18, OS_LOG_TYPE_ERROR, "%{public}@Metadata string is nil in photos face crop data", (uint8_t *)&v24, 0xCu);
      }
      uint64_t v13 = 0;
    }

    double v20 = v6;
    CFRelease(v8);
    size_t v16 = (void *)v13;
    if (v20) {
      CFRelease(v20);
    }
  }
  else
  {
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = HMFGetLogIdentifier();
      int v24 = 138543362;
      CGFloat v25 = v15;
      _os_log_impl(&dword_225DC6000, v14, OS_LOG_TYPE_ERROR, "%{public}@imageData is nil", (uint8_t *)&v24, 0xCu);
    }
    size_t v16 = 0;
  }

  return v16;
}

@end