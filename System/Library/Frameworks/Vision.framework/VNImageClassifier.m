@interface VNImageClassifier
+ (BOOL)_dumpIntermediatesFullImage:(id)a3 imageURL:(id)a4 requiredImageSource:(const __CVBuffer *)a5 imageProcessingType:(int)a6 error:(id *)a7;
+ (BOOL)_dumpIntermediatesTiles:(id)a3 imageURL:(id)a4 requiredImageSource:(const __CVBuffer *)a5 imageProcessingType:(int)a6 allocatedTileCount:(unsigned int)a7 imageTiles:(const void *)a8 bytesPerPixel:(int)a9 numTiles:(unsigned int)a10 scaleFactor:(float)a11 augmentationMode:(unsigned int)a12 scalingImage:(BOOL)a13 error:(id *)a14;
+ (BOOL)computeImageCropWithImage:(id)a3 regionOfInterest:(CGRect)a4 usingDescriptorProcessor:(ImageDescriptorProcessorAbstract *)a5 scalingImage:(BOOL)a6 options:(id)a7 pixelBuffer:(__CVBuffer *)a8 error:(id *)a9;
+ (BOOL)computeImageDescriptorsWithImage:(id)a3 pixelBuffer:(const __CVBuffer *)a4 regionOfInterest:(CGRect)a5 usingDescriptorProcessor:(ImageDescriptorProcessorAbstract *)a6 tileCount:(int)a7 augmentationMode:(unsigned int)a8 resultantDescriptorBuffer:(void *)a9 options:(id)a10 metalContext:(id)a11 canceller:(id)a12 tileColumns:(unint64_t *)a13 tileRows:(unint64_t *)a14 error:(id *)a15;
+ (BOOL)computeLabelsAndConfidence:(void *)a3 usingDescriptorBuffer:(void *)a4 populateLabelsAndConfidence:(void *)a5 options:(id)a6 metalContext:(id)a7 error:(id *)a8;
+ (id)classifyImageHierarchicallyWithDescriptors:(const void *)a3 usingImageClassifier:(void *)a4 hierarchicalClassifier:(ImageClassifier_HierarchicalModel *)a5 minimumClassificationConfidence:(float)a6 minimumClassificationConfidenceRatio:(float)a7 maximumLeafLabels:(unint64_t)a8 maximumHierarchicalLabels:(unint64_t)a9 options:(id)a10 metalContext:(id)a11 error:(id *)a12;
+ (id)classifyImageWithDescriptors:(const void *)a3 usingImageClassifier:(void *)a4 andMinConfidenceForClassification:(float)a5 options:(id)a6 metalContext:(id)a7 error:(id *)a8;
@end

@implementation VNImageClassifier

+ (BOOL)_dumpIntermediatesTiles:(id)a3 imageURL:(id)a4 requiredImageSource:(const __CVBuffer *)a5 imageProcessingType:(int)a6 allocatedTileCount:(unsigned int)a7 imageTiles:(const void *)a8 bytesPerPixel:(int)a9 numTiles:(unsigned int)a10 scaleFactor:(float)a11 augmentationMode:(unsigned int)a12 scalingImage:(BOOL)a13 error:(id *)a14
{
  id v18 = a3;
  id v62 = a4;
  v63 = [v18 objectForKeyedSubscript:@"VNImageClassifierProcessingOption_DebugIntermediatesDumpPath"];
  uint64_t v19 = [v18 objectForKeyedSubscript:@"VNImageClassifierProcessingOption_DebugInfo"];
  v20 = (void *)v19;
  char v21 = 1;
  if (a5 && v63)
  {
    v64 = (void *)v19;
    id v59 = v18;
    if (v19)
    {
      v22 = [v62 path];
      v24 = v22;
      if (v22)
      {
        uint64_t v25 = [v22 lastPathComponent];

        v26 = (__CFString *)v25;
      }
      else
      {
        v26 = @"<binary-data>";
      }
      *(float *)&double v23 = a11;
      v27 = [NSNumber numberWithFloat:v23];
      [v20 setObject:v27 forKey:@"scalingFactor"];

      v28 = [NSNumber numberWithUnsignedInt:a12];
      [v20 setObject:v28 forKey:@"augmentationMode"];

      v29 = [NSNumber numberWithUnsignedInt:a10];
      [v20 setObject:v29 forKey:@"numTiles"];

      [v20 setObject:v26 forKey:@"imageID"];
    }
    v61 = [v63 stringByAppendingString:@"/"];
    v60 = [MEMORY[0x1E4F28CB8] defaultManager];
    v30 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v61];
    char v21 = [v60 createDirectoryAtURL:v30 withIntermediateDirectories:1 attributes:0 error:a14];

    if (v21)
    {
      v56 = [v62 path];
      ++image_name_offset;
      v31 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
      v57 = [v31 stringValue];

      if (v56)
      {
        v32 = [v56 lastPathComponent];
        uint64_t v33 = [v32 stringByDeletingPathExtension];

        v34 = (void *)v33;
      }
      else
      {
        v34 = v57;
      }
      v58 = v34;
      v35 = objc_msgSend(v61, "stringByAppendingString:");
      v36 = [v35 stringByAppendingString:@"_tile_"];

      if (a7)
      {
        uint64_t v37 = 0;
        uint64_t v38 = a7;
        do
        {
          v39 = (void *)MEMORY[0x1A6257080]();
          v40 = [NSNumber numberWithUnsignedInt:v37];
          v41 = [v40 stringValue];
          v42 = [v36 stringByAppendingString:v41];

          id v43 = [v42 stringByAppendingString:@".png"];
          v44 = (const char *)[v43 UTF8String];
          v45 = (_OWORD *)(*(void *)a8 + 32 * v37);
          long long v46 = v45[1];
          v71[0] = *v45;
          v71[1] = v46;
          OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a5);
          saveVImage(v44, (unsigned __int8 **)v71, PixelFormatType);

          uint64_t v48 = *(void *)a8 + 32 * v37;
          unint64_t v68 = *(void *)(v48 + 8);
          uint64_t v69 = *(void *)(v48 + 16);
          size_t __n = v69 * a9;
          v49 = (char *)malloc_type_calloc(__n * v68, 1uLL, 0x7B0B3673uLL);
          v67 = v49;
          if (v68)
          {
            unint64_t v50 = 0;
            v51 = *(char **)(*(void *)a8 + 32 * v37);
            size_t v52 = __n;
            do
            {
              memcpy(v49, v51, v52);
              ++v50;
              v51 += *(void *)(*(void *)a8 + 32 * v37 + 24);
              size_t v52 = __n;
              v49 += __n;
            }
            while (v50 < v68);
          }
          id v53 = [v42 stringByAppendingString:@".vdump"];
          v20 = v64;
          ImageProcessing_save((FILE *)[v53 UTF8String], &v67, a6);

          free(v67);
          ++v37;
        }
        while (v37 != v38);
      }
      id v18 = v59;
      if (v20)
      {
        v54 = [NSNumber numberWithUnsignedLongLong:image_name_offset];
        [v20 setObject:v54 forKey:@"debugID"];
      }
    }
  }
  return v21;
}

+ (BOOL)_dumpIntermediatesFullImage:(id)a3 imageURL:(id)a4 requiredImageSource:(const __CVBuffer *)a5 imageProcessingType:(int)a6 error:(id *)a7
{
  id v11 = a4;
  v12 = [a3 objectForKeyedSubscript:@"VNImageClassifierProcessingOption_DebugIntermediatesDumpPath"];
  v13 = v12;
  char v14 = 1;
  if (a5 && v12)
  {
    v15 = [v12 stringByAppendingString:@"/"];
    v16 = [MEMORY[0x1E4F28CB8] defaultManager];
    v17 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v15];
    char v14 = [v16 createDirectoryAtURL:v17 withIntermediateDirectories:1 attributes:0 error:a7];

    if (v14)
    {
      ++image_name_offset;
      v29 = v16;
      id v18 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
      uint64_t v19 = [v18 stringValue];

      if (v11)
      {
        v20 = [v11 lastPathComponent];
        uint64_t v21 = [v20 stringByDeletingPathExtension];

        uint64_t v19 = (void *)v21;
      }
      v28 = v19;
      v22 = [v15 stringByAppendingString:v19];
      uint64_t v23 = MEMORY[0x1A6257080]();
      id v24 = [v22 stringByAppendingString:@"_source_scaled.png"];
      saveCVPixelBuffer((const char *)[v24 UTF8String], a5);
      CVPixelBufferLockBaseAddress(a5, 1uLL);
      v30[0] = CVPixelBufferGetBaseAddress(a5);
      v30[1] = CVPixelBufferGetHeight(a5);
      v30[2] = CVPixelBufferGetWidth(a5);
      uint64_t v25 = (void *)v23;
      v30[3] = CVPixelBufferGetBytesPerRow(a5);
      id v26 = [v22 stringByAppendingString:@"_source_scaled.vdump"];
      ImageProcessing_save((FILE *)[v26 UTF8String], v30, a6);
      CVPixelBufferUnlockBaseAddress(a5, 1uLL);
      NSLog(&cfstr_VnImageClassif.isa, v15);

      v16 = v29;
    }
  }
  return v14;
}

+ (id)classifyImageHierarchicallyWithDescriptors:(const void *)a3 usingImageClassifier:(void *)a4 hierarchicalClassifier:(ImageClassifier_HierarchicalModel *)a5 minimumClassificationConfidence:(float)a6 minimumClassificationConfidenceRatio:(float)a7 maximumLeafLabels:(unint64_t)a8 maximumHierarchicalLabels:(unint64_t)a9 options:(id)a10 metalContext:(id)a11 error:(id *)a12
{
  id v19 = a10;
  v20 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v19 error:a12];
  if (v20)
  {
    unint64_t v34 = a9;
    uint64_t v55 = 0;
    v56 = &v55;
    uint64_t v57 = 0x5812000000;
    v58 = __Block_byref_object_copy__23565;
    long long v60 = 0u;
    long long v61 = 0u;
    id v59 = __Block_byref_object_dispose__23566;
    uint64_t v62 = 0;
    int v63 = 1065353216;
    v50[0] = 0;
    v50[1] = v50;
    v50[2] = 0x5812000000;
    v50[3] = __Block_byref_object_copy__23565;
    long long v51 = 0u;
    long long v52 = 0u;
    v50[4] = __Block_byref_object_dispose__23566;
    uint64_t v53 = 0;
    int v54 = 1065353216;
    uint64_t v21 = [v19 objectForKeyedSubscript:@"VNDetectorOption_PreferBackgroundProcessing"];
    char v22 = [v21 BOOLValue];

    uint64_t v49 = 1;
    if (!+[VNValidationUtilities getMTLGPUPriority:&v49 forKey:@"VNDetectorOption_MetalContextPriority" inOptions:v19 withDefaultValue:1 error:a12])goto LABEL_7; {
    if (!a8)
    }
      goto LABEL_5;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __248__VNImageClassifier_classifyImageHierarchicallyWithDescriptors_usingImageClassifier_hierarchicalClassifier_minimumClassificationConfidence_minimumClassificationConfidenceRatio_maximumLeafLabels_maximumHierarchicalLabels_options_metalContext_error___block_invoke;
    aBlock[3] = &unk_1E5B1E318;
    char v48 = v22;
    aBlock[6] = a4;
    aBlock[7] = v49;
    float v46 = a7;
    float v47 = a6;
    aBlock[8] = a8;
    aBlock[9] = a3;
    aBlock[4] = &v55;
    aBlock[5] = v50;
    uint64_t v23 = _Block_copy(aBlock);
    int v24 = VNExecuteBlock(v23, (uint64_t)a12);

    if (v24)
    {
LABEL_5:
      uint64_t v25 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v56[9]];
      id v26 = [v19 objectForKeyedSubscript:@"VNImageClassifierProcessingOption_DebugInfo"];
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __248__VNImageClassifier_classifyImageHierarchicallyWithDescriptors_usingImageClassifier_hierarchicalClassifier_minimumClassificationConfidence_minimumClassificationConfidenceRatio_maximumLeafLabels_maximumHierarchicalLabels_options_metalContext_error___block_invoke_2;
      v35[3] = &unk_1E5B1E340;
      v39 = &v55;
      id v36 = v20;
      id v27 = v25;
      id v37 = v27;
      id v38 = v26;
      unint64_t v41 = v34;
      v42 = a5;
      v40 = v50;
      float v43 = a6;
      float v44 = a7;
      id v28 = v26;
      v29 = _Block_copy(v35);
      if (VNExecuteBlock(v29, (uint64_t)a12)) {
        id v30 = v27;
      }
      else {
        id v30 = 0;
      }
    }
    else
    {
LABEL_7:
      id v30 = 0;
    }
    _Block_object_dispose(v50, 8);
    std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__deallocate_node(*((void ***)&v52 + 1));
    v31 = (void *)*((void *)&v51 + 1);
    *((void *)&v51 + 1) = 0;
    if (v31) {
      operator delete(v31);
    }
    _Block_object_dispose(&v55, 8);
    std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__deallocate_node(*((void ***)&v61 + 1));
    v32 = (void *)*((void *)&v60 + 1);
    *((void *)&v60 + 1) = 0;
    if (v32) {
      operator delete(v32);
    }
  }
  else
  {
    id v30 = 0;
  }

  return v30;
}

uint64_t __248__VNImageClassifier_classifyImageHierarchicallyWithDescriptors_usingImageClassifier_hierarchicalClassifier_minimumClassificationConfidence_minimumClassificationConfidenceRatio_maximumLeafLabels_maximumHierarchicalLabels_options_metalContext_error___block_invoke(uint64_t a1)
{
  (*(void (**)(void, void, void))(**(void **)(a1 + 48) + 48))(*(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 88), *(unsigned int *)(a1 + 56));
  uint64_t v2 = *(void *)(a1 + 48);
  float v3 = *(float *)(a1 + 80);
  *(float *)(v2 + 104) = v3;
  if (v3 < 0.0) {
    goto LABEL_11;
  }
  float v4 = *(float *)(a1 + 84);
  *(float *)(v2 + 100) = v4;
  if (v4 < 0.0) {
    goto LABEL_11;
  }
  unint64_t v5 = *(void *)(a1 + 64);
  if (v5 > 0x7FFFFFFE) {
    LODWORD(v5) = 0x7FFFFFFF;
  }
  *(_DWORD *)(v2 + 108) = v5;
  if ((int)v5 <= 0)
  {
LABEL_11:
    exception = __cxa_allocate_exception(8uLL);
    void *exception = 3964;
    __cxa_throw(exception, MEMORY[0x1E4FBA3E0], 0);
  }
  *(_DWORD *)(v2 + 96) = 1;
  vision::mod::ImageClassifierAbstract::classifyDescriptors((vision::mod::ImageClassifierAbstract *)__p, (const vision::mod::ImageDescriptorBufferAbstract *)v2, *(void **)(a1 + 72), 1);
  std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__move_assign(*(void *)(*(void *)(a1 + 32) + 8) + 48, (uint64_t *)__p);
  std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__deallocate_node((void **)v12);
  v6 = __p[0];
  __p[0] = 0;
  if (v6) {
    operator delete(v6);
  }
  uint64_t v7 = *(void *)(a1 + 48);
  *(void *)(v7 + 100) = 0x3400000000000000;
  *(_DWORD *)(v7 + 108) = 0x7FFFFFFF;
  *(_DWORD *)(v7 + 96) = 0;
  vision::mod::ImageClassifierAbstract::classifyDescriptors((vision::mod::ImageClassifierAbstract *)__p, (const vision::mod::ImageDescriptorBufferAbstract *)v7, *(void **)(a1 + 72), 0);
  std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__move_assign(*(void *)(*(void *)(a1 + 40) + 8) + 48, (uint64_t *)__p);
  std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__deallocate_node((void **)v12);
  v8 = __p[0];
  __p[0] = 0;
  if (v8) {
    operator delete(v8);
  }
  return 1;
}

uint64_t __248__VNImageClassifier_classifyImageHierarchicallyWithDescriptors_usingImageClassifier_hierarchicalClassifier_minimumClassificationConfidence_minimumClassificationConfidenceRatio_maximumLeafLabels_maximumHierarchicalLabels_options_metalContext_error___block_invoke_2(uint64_t a1)
{
  for (i = *(uint64_t **)(*(void *)(*(void *)(a1 + 56) + 8) + 64); i; i = (uint64_t *)*i)
  {
    float v3 = i + 2;
    id v4 = [NSString alloc];
    if (*((char *)i + 39) < 0) {
      float v3 = (void *)*v3;
    }
    unint64_t v5 = (void *)[v4 initWithUTF8String:v3];
    v6 = [VNClassificationObservation alloc];
    LODWORD(v7) = *((_DWORD *)i + 10);
    v8 = [(VNClassificationObservation *)v6 initWithOriginatingRequestSpecifier:*(void *)(a1 + 32) identifier:v5 confidence:v7];
    [*(id *)(a1 + 40) addObject:v8];
  }
  if (*(void *)(a1 + 48))
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    for (j = *(uint64_t **)(*(void *)(*(void *)(a1 + 56) + 8) + 64); j; j = (uint64_t *)*j)
    {
      LODWORD(v10) = *((_DWORD *)j + 10);
      v12 = [NSNumber numberWithFloat:v10];
      v13 = j + 2;
      if (*((char *)j + 39) < 0) {
        v13 = (void *)*v13;
      }
      char v14 = [NSString stringWithUTF8String:v13];
      [v9 setObject:v12 forKey:v14];
    }
    [*(id *)(a1 + 48) setObject:v9 forKey:@"labelsAndConfidence"];
    v15 = *(void **)(a1 + 48);
    LODWORD(v16) = *(_DWORD *)(a1 + 88);
    v17 = [NSNumber numberWithFloat:v16];
    [v15 setObject:v17 forKey:@"MinConfidenceForClassificationRaw"];
  }
  if (*(void *)(a1 + 72))
  {
    vision::mod::ImageClassifier_HierarchicalModel::infer((uint64_t)__p, *(uint64_t ***)(a1 + 80), (void *)(*(void *)(*(void *)(a1 + 64) + 8) + 48), 1);
    ImageClassifier_getLabelsAuto(&v43, (uint64_t *)v42, *(float *)(a1 + 88), *(float *)(a1 + 92));
    std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__deallocate_node((void **)v42);
    id v18 = __p[0];
    __p[0] = 0;
    if (v18) {
      operator delete(v18);
    }
    unint64_t v19 = *(void *)(a1 + 72);
    if ((v19 | 0x8000000000000000) != 0xFFFFFFFFFFFFFFFFLL)
    {
      uint64_t v39 = v44;
      if (v19 < (v44 - v43) >> 5)
      {
        uint64_t v40 = v43 + 32 * v19;
        while (v39 != v40)
        {
          if (*(char *)(v39 - 9) < 0) {
            operator delete(*(void **)(v39 - 32));
          }
          v39 -= 32;
        }
        uint64_t v44 = v40;
      }
    }
    if (*(void *)(a1 + 48))
    {
      id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v22 = v43;
      for (uint64_t k = v44; v22 != k; v22 += 32)
      {
        LODWORD(v21) = *(_DWORD *)(v22 + 24);
        int v24 = objc_msgSend(NSNumber, "numberWithFloat:", v21, __p[0]);
        uint64_t v25 = v22;
        if (*(char *)(v22 + 23) < 0) {
          uint64_t v25 = *(void *)v22;
        }
        id v26 = [NSString stringWithUTF8String:v25];
        [v20 setObject:v24 forKey:v26];
      }
      objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v20, @"hierarchicalLabelsAndConfidence", __p[0]);
      id v27 = *(void **)(a1 + 48);
      LODWORD(v28) = *(_DWORD *)(a1 + 88);
      v29 = [NSNumber numberWithFloat:v28];
      [v27 setObject:v29 forKey:@"MinConfidenceForHierarchical"];
    }
    uint64_t v30 = v43;
    for (uint64_t m = v44; v30 != m; v30 += 32)
    {
      id v32 = [NSString alloc];
      uint64_t v33 = v30;
      if (*(char *)(v30 + 23) < 0) {
        uint64_t v33 = *(void *)v30;
      }
      unint64_t v34 = objc_msgSend(v32, "initWithUTF8String:", v33, __p[0]);
      v35 = [VNClassificationObservation alloc];
      LODWORD(v36) = *(_DWORD *)(v30 + 24);
      id v37 = [(VNClassificationObservation *)v35 initWithOriginatingRequestSpecifier:*(void *)(a1 + 32) identifier:v34 confidence:v36];
      [*(id *)(a1 + 40) addObject:v37];
    }
    __p[0] = &v43;
    std::vector<std::pair<std::string,float>>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
  }
  return 1;
}

+ (id)classifyImageWithDescriptors:(const void *)a3 usingImageClassifier:(void *)a4 andMinConfidenceForClassification:(float)a5 options:(id)a6 metalContext:(id)a7 error:(id *)a8
{
  id v13 = a6;
  id v14 = a7;
  v15 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v13 error:a8];
  if (v15)
  {
    uint64_t v46 = 0;
    float v47 = &v46;
    uint64_t v48 = 0x5812000000;
    uint64_t v49 = __Block_byref_object_copy__23565;
    long long v51 = 0u;
    long long v52 = 0u;
    unint64_t v50 = __Block_byref_object_dispose__23566;
    uint64_t v53 = 0;
    int v54 = 1065353216;
    double v16 = [v13 objectForKeyedSubscript:@"VNDetectorOption_PreferBackgroundProcessing"];
    char v17 = [v16 BOOLValue];

    uint64_t v45 = 1;
    if (+[VNValidationUtilities getMTLGPUPriority:&v45 forKey:@"VNDetectorOption_MetalContextPriority" inOptions:v13 withDefaultValue:1 error:a8])
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __132__VNImageClassifier_classifyImageWithDescriptors_usingImageClassifier_andMinConfidenceForClassification_options_metalContext_error___block_invoke;
      aBlock[3] = &unk_1E5B1E2F0;
      char v44 = v17;
      aBlock[4] = &v46;
      aBlock[5] = a4;
      aBlock[6] = v45;
      aBlock[7] = a3;
      id v18 = _Block_copy(aBlock);
      if (VNExecuteBlock(v18, (uint64_t)a8))
      {
        uint64_t v39 = v18;
        id v40 = v14;
        ImageClassifier_getLabelsAuto(&v41, (uint64_t *)v47[8], a5, 0.1);
        unint64_t v19 = [v13 objectForKeyedSubscript:@"VNImageClassifierProcessingOption_DebugInfo"];
        if (v19)
        {
          id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          uint64_t v22 = v41;
          for (uint64_t i = v42; v22 != i; v22 += 32)
          {
            LODWORD(v21) = *(_DWORD *)(v22 + 24);
            int v24 = [NSNumber numberWithFloat:v21];
            uint64_t v25 = v22;
            if (*(char *)(v22 + 23) < 0) {
              uint64_t v25 = *(void *)v22;
            }
            id v26 = [NSString stringWithUTF8String:v25];
            [v20 setObject:v24 forKey:v26];
          }
          [v19 setObject:v20 forKey:@"labelsAndConfidence"];
          *(float *)&double v27 = a5;
          double v28 = [NSNumber numberWithFloat:v27];
          [v19 setObject:v28 forKey:@"MinConfidenceForClassificationRaw"];
        }
        v29 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:(v42 - v41) >> 5];
        uint64_t v31 = v41;
        for (uint64_t j = v42; v31 != j; v31 += 32)
        {
          id v32 = [VNClassificationObservation alloc];
          uint64_t v33 = v31;
          if (*(char *)(v31 + 23) < 0) {
            uint64_t v33 = *(void *)v31;
          }
          unint64_t v34 = [NSString stringWithUTF8String:v33];
          LODWORD(v35) = *(_DWORD *)(v31 + 24);
          double v36 = [(VNClassificationObservation *)v32 initWithOriginatingRequestSpecifier:v15 identifier:v34 confidence:v35];

          if (v36) {
            [v29 addObject:v36];
          }
        }
        uint64_t v55 = (void **)&v41;
        std::vector<std::pair<std::string,float>>::__destroy_vector::operator()[abi:ne180100](&v55);
        id v18 = v39;
        id v14 = v40;
      }
      else
      {
        v29 = 0;
      }
    }
    else
    {
      v29 = 0;
    }
    _Block_object_dispose(&v46, 8);
    std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__deallocate_node(*((void ***)&v52 + 1));
    id v37 = (void *)*((void *)&v51 + 1);
    *((void *)&v51 + 1) = 0;
    if (v37) {
      operator delete(v37);
    }
  }
  else
  {
    v29 = 0;
  }

  return v29;
}

uint64_t __132__VNImageClassifier_classifyImageWithDescriptors_usingImageClassifier_andMinConfidenceForClassification_options_metalContext_error___block_invoke(uint64_t a1)
{
  (*(void (**)(void, void, void))(**(void **)(a1 + 40) + 48))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(unsigned int *)(a1 + 48));
  vision::mod::ImageClassifierAbstract::classifyDescriptors((vision::mod::ImageClassifierAbstract *)__p, *(const vision::mod::ImageDescriptorBufferAbstract **)(a1 + 40), *(void **)(a1 + 56), 1);
  std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__move_assign(*(void *)(*(void *)(a1 + 32) + 8) + 48, (uint64_t *)__p);
  std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__deallocate_node((void **)__p[2]);
  uint64_t v2 = __p[0];
  __p[0] = 0;
  if (v2) {
    operator delete(v2);
  }
  return 1;
}

+ (BOOL)computeLabelsAndConfidence:(void *)a3 usingDescriptorBuffer:(void *)a4 populateLabelsAndConfidence:(void *)a5 options:(id)a6 metalContext:(id)a7 error:(id *)a8
{
  id v12 = a6;
  id v13 = [v12 objectForKeyedSubscript:@"VNDetectorOption_PreferBackgroundProcessing"];
  char v14 = [v13 BOOLValue];

  uint64_t v20 = 1;
  if (+[VNValidationUtilities getMTLGPUPriority:&v20 forKey:@"VNDetectorOption_MetalContextPriority" inOptions:v12 withDefaultValue:1 error:a8])
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __125__VNImageClassifier_computeLabelsAndConfidence_usingDescriptorBuffer_populateLabelsAndConfidence_options_metalContext_error___block_invoke;
    v18[3] = &__block_descriptor_65_e9_B16__0__8l;
    char v19 = v14;
    v18[4] = a3;
    v18[5] = v20;
    v18[6] = a5;
    v18[7] = a4;
    v15 = _Block_copy(v18);
    char v16 = VNExecuteBlock(v15, (uint64_t)a8);
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

uint64_t __125__VNImageClassifier_computeLabelsAndConfidence_usingDescriptorBuffer_populateLabelsAndConfidence_options_metalContext_error___block_invoke(uint64_t a1)
{
  (*(void (**)(void, void, void))(**(void **)(a1 + 32) + 48))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 64), *(unsigned int *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 32);
  *(void *)(v2 + 100) = 0x3400000000000000;
  *(_DWORD *)(v2 + 108) = 0x7FFFFFFF;
  vision::mod::ImageClassifierAbstract::classifyDescriptorsNoComulative(&v8, (const vision::mod::ImageDescriptorBufferAbstract *)v2, *(void **)(a1 + 56), 0);
  float v3 = *(void ***)(a1 + 48);
  id v4 = *v3;
  if (*v3)
  {
    uint64_t v5 = (uint64_t)v3[1];
    v6 = *v3;
    if ((void *)v5 != v4)
    {
      do
        uint64_t v5 = std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::~__hash_table(v5 - 40);
      while ((void *)v5 != v4);
      v6 = *v3;
    }
    v3[1] = v4;
    operator delete(v6);
    *float v3 = 0;
    v3[1] = 0;
    v3[2] = 0;
  }
  *(int64x2_t *)float v3 = v8;
  v3[2] = v9;
  int64x2_t v8 = 0uLL;
  id v9 = 0;
  double v10 = &v8;
  std::vector<std::unordered_map<std::string,float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v10);
  return 1;
}

+ (BOOL)computeImageDescriptorsWithImage:(id)a3 pixelBuffer:(const __CVBuffer *)a4 regionOfInterest:(CGRect)a5 usingDescriptorProcessor:(ImageDescriptorProcessorAbstract *)a6 tileCount:(int)a7 augmentationMode:(unsigned int)a8 resultantDescriptorBuffer:(void *)a9 options:(id)a10 metalContext:(id)a11 canceller:(id)a12 tileColumns:(unint64_t *)a13 tileRows:(unint64_t *)a14 error:(id *)a15
{
  id v20 = a3;
  id v21 = a10;
  id v22 = a12;
  uint64_t v49 = 0;
  unint64_t v50 = &v49;
  uint64_t v51 = 0x2020000000;
  uint64_t v52 = 0;
  uint64_t v45 = 0;
  uint64_t v46 = &v45;
  uint64_t v47 = 0x2020000000;
  int v48 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __219__VNImageClassifier_computeImageDescriptorsWithImage_pixelBuffer_regionOfInterest_usingDescriptorProcessor_tileCount_augmentationMode_resultantDescriptorBuffer_options_metalContext_canceller_tileColumns_tileRows_error___block_invoke;
  aBlock[3] = &unk_1E5B1E2A8;
  id v37 = a4;
  id v23 = v21;
  int v43 = a7;
  id v32 = v23;
  double v35 = &v49;
  double v36 = &v45;
  id v38 = a6;
  id v24 = v22;
  unsigned int v44 = a8;
  id v33 = v24;
  uint64_t v39 = a9;
  id v40 = a1;
  id v25 = v20;
  id v34 = v25;
  uint64_t v41 = a13;
  uint64_t v42 = a14;
  id v26 = _Block_copy(aBlock);
  char v27 = VNExecuteBlock(v26, (uint64_t)a15);
  if (*((_DWORD *)v46 + 6))
  {
    unint64_t v28 = 0;
    do
      free(*(void **)(v50[3] + 8 * v28++));
    while (v28 < *((unsigned int *)v46 + 6));
  }
  free((void *)v50[3]);

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v49, 8);

  return v27;
}

uint64_t __219__VNImageClassifier_computeImageDescriptorsWithImage_pixelBuffer_regionOfInterest_usingDescriptorProcessor_tileCount_augmentationMode_resultantDescriptorBuffer_options_metalContext_canceller_tileColumns_tileRows_error___block_invoke(uint64_t a1, void *a2)
{
  size_t Width = CVPixelBufferGetWidth(*(CVPixelBufferRef *)(a1 + 72));
  size_t Height = CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1 + 72));
  v6 = [*(id *)(a1 + 32) objectForKey:@"VNImageClassifierProcessingOption_ImageProcessingType"];
  uint64_t v7 = [v6 unsignedIntegerValue];

  int64x2_t v8 = *(__CVBuffer **)(a1 + 72);
  if (v7 == 1)
  {
    BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(v8, 0);
    size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(*(CVPixelBufferRef *)(a1 + 72), 0);
    unsigned int v10 = 1;
  }
  else
  {
    BaseAddressOfPlane = CVPixelBufferGetBaseAddress(v8);
    size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRow(*(CVPixelBufferRef *)(a1 + 72));
    unsigned int v10 = 4;
  }
  id v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"VNImageClassifierProcessingOption_AveragedSideLength"];
  unint64_t v12 = [v11 unsignedIntegerValue];
  v13.i64[0] = Height;
  v13.i64[1] = Width;
  int64x2_t v95 = v13;

  if (Width <= Height) {
    size_t v14 = Height;
  }
  else {
    size_t v14 = Width;
  }
  int v15 = (v14 / v12) | 1;
  if (*(_DWORD *)(a1 + 120)) {
    int v16 = *(_DWORD *)(a1 + 120);
  }
  else {
    int v16 = v15;
  }
  int v17 = vcvtms_s32_f32((float)((float)Width / (float)Height) * (float)v16);
  int v18 = vcvtms_s32_f32((float)((float)Height / (float)Width) * (float)v16);
  if (Width <= Height) {
    int v18 = v16;
  }
  else {
    int v17 = v16;
  }
  if (Width < v12
    || (v17 >= 2
      ? (uint64_t v21 = (v17 - 1),
         unint64_t v19 = vcvtms_u32_f32((float)((float)(Width - v12) / (float)(v12 * v21)) * (float)v12),
         unint64_t v20 = v12 + v19 * v21)
      : (unint64_t v19 = 0, v20 = v12),
        Height < v12))
  {
    if (a2)
    {
      VNErrorForCVMLStatus((id)0x107C);
      uint64_t v22 = 0;
      *a2 = (id)objc_claimAutoreleasedReturnValue();
      return v22;
    }
    return 0;
  }
  uint64_t v99 = v10;
  unint64_t v23 = (Width - v20) >> 1;
  if (v18 >= 2)
  {
    uint64_t v26 = (v18 - 1);
    unint64_t v24 = vcvtms_u32_f32((float)((float)(Height - v12) / (float)(v12 * v26)) * (float)v12);
    unint64_t v25 = v12 + v24 * v26;
  }
  else
  {
    unint64_t v24 = 0;
    unint64_t v25 = v12;
  }
  unint64_t v27 = (Height - v25) >> 1;
  if ((float)((float)Width + -1.0) >= (float)v23 && (float)((float)Height + -1.0) >= (float)v27) {
    unint64_t v93 = (unint64_t)BaseAddressOfPlane
  }
        + BytesPerRowOfPlane * (unint64_t)(float)v27
        + (unint64_t)(float)v23 * v10;
  else {
    unint64_t v93 = 0;
  }
  v28.i64[0] = v27;
  v28.i64[1] = v23;
  int64x2_t v29 = vsubq_s64(v95, vaddq_s64(v28, v28));
  uint64_t v30 = *(void *)(*(void *)(a1 + 56) + 8);
  unsigned int v94 = v10;
  unint64_t v91 = v29.u64[1];
  if (v19) {
    uint64_t v31 = ((v29.i64[1] - v12) / v19) + 1;
  }
  else {
    uint64_t v31 = 1;
  }
  uint64_t v32 = v7;
  unint64_t v96 = v29.i64[0];
  if (v24)
  {
    id v33 = a2;
    unint64_t v34 = v24;
    uint64_t v35 = ((v29.i64[0] - v12) / v24) + 1;
  }
  else
  {
    unint64_t v34 = 0;
    id v33 = a2;
    uint64_t v35 = 1;
  }
  uint64_t v36 = v31;
  int v90 = v31 * v35;
  id v37 = malloc_type_calloc((int)v31 * (int)v35, 8uLL, 0x2004093837F09uLL);
  *(void *)(v30 + 24) = v37;
  if (!v37)
  {
LABEL_60:
    uint64_t v67 = 4219;
    if (v33)
    {
LABEL_61:
      VNErrorForCVMLStatus((id)v67);
      uint64_t v22 = 0;
      *id v33 = (id)objc_claimAutoreleasedReturnValue();
      return v22;
    }
    return 0;
  }
  BOOL v38 = (int)v35 < 1;
  uint64_t v39 = v36;
  uint64_t v40 = v35;
  uint64_t v41 = (uint64_t)v33;
  uint64_t v42 = v32;
  unsigned int v43 = v94;
  if (!v38)
  {
    int v44 = 0;
    unint64_t v45 = 0;
    int v46 = 0;
    float v47 = (float)v91 + -1.0;
    float v48 = (float)v96 + -1.0;
    if ((int)v39 <= 1) {
      int v49 = 1;
    }
    else {
      int v49 = v39;
    }
    v89 = (void *)v41;
    unint64_t v87 = v34;
    int v86 = v49;
    while ((int)v39 < 1)
    {
LABEL_51:
      v45 += v34;
      if (++v44 >= (int)v40) {
        goto LABEL_52;
      }
    }
    int v88 = v44;
    uint64_t v92 = v40;
    uint64_t v97 = v39;
    unint64_t v50 = 0;
    uint64_t v51 = v46;
    int v52 = v49;
    while (1)
    {
      uint64_t v53 = malloc_type_malloc(0x20uLL, 0x1080040ABB4582EuLL);
      if (!v53)
      {
        id v33 = v89;
        goto LABEL_60;
      }
      BOOL v54 = v47 < (float)v50 || v48 < (float)v45;
      unint64_t v55 = v93 + BytesPerRowOfPlane * (unint64_t)(float)v45 + (unint64_t)(float)v50 * v99;
      if (v54 || v55 == 0) {
        break;
      }
      *uint64_t v53 = v55;
      v53[1] = v12;
      v53[2] = v12;
      v53[3] = BytesPerRowOfPlane;
      *(void *)(*(void *)(v30 + 24) + 8 * v51) = v53;
      v50 += v19;
      ++v51;
      if (!--v52)
      {
        int v46 = v51;
        uint64_t v41 = (uint64_t)v89;
        unint64_t v34 = v87;
        uint64_t v42 = v32;
        unsigned int v43 = v94;
        uint64_t v39 = v97;
        uint64_t v40 = v92;
        int v44 = v88;
        int v49 = v86;
        goto LABEL_51;
      }
    }
    free(v53);
    uint64_t v67 = 4221;
    id v33 = v89;
    if (v89) {
      goto LABEL_61;
    }
    return 0;
  }
LABEL_52:
  int v98 = v39;
  int v57 = v40;
  unsigned int v58 = v43;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v90;
  unint64_t v59 = *(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  v115 = 0;
  v116 = 0;
  v114 = 0;
  if (v59)
  {
    long long v60 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<vImage_Buffer>>(v59);
    v114 = v60;
    v116 = &v60[32 * v61];
    bzero(v60, 32 * v59);
    uint64_t v62 = (uint64_t)&v60[32 * v59];
    v115 = (char *)v62;
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
    {
      unint64_t v63 = 0;
      v64 = v60;
      do
      {
        uint64_t v65 = *(void *)(*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) + 8 * v63);
        uint64_t v66 = *(void *)(v65 + 24);
        *(void *)v64 = *(void *)v65;
        *(_OWORD *)(v64 + 8) = *(_OWORD *)(v65 + 8);
        *((void *)v64 + 3) = v66;
        ++v63;
        v64 += 32;
      }
      while (v63 < *(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24));
    }
  }
  else
  {
    long long v60 = 0;
    uint64_t v62 = 0;
  }
  unint64_t v68 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"VNDetectorOption_PreferBackgroundProcessing"];
  char v69 = [v68 BOOLValue];

  uint64_t v113 = 1;
  if (+[VNValidationUtilities getMTLGPUPriority:&v113 forKey:@"VNDetectorOption_MetalContextPriority" inOptions:*(void *)(a1 + 32) withDefaultValue:1 error:v41])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3321888768;
    aBlock[2] = __219__VNImageClassifier_computeImageDescriptorsWithImage_pixelBuffer_regionOfInterest_usingDescriptorProcessor_tileCount_augmentationMode_resultantDescriptorBuffer_options_metalContext_canceller_tileColumns_tileRows_error___block_invoke_2;
    aBlock[3] = &unk_1EF7542C8;
    uint64_t v70 = *(void *)(a1 + 80);
    char v112 = v69;
    uint64_t v104 = v70;
    uint64_t v105 = v113;
    int v110 = v42;
    id v71 = *(id *)(a1 + 40);
    int v111 = *(_DWORD *)(a1 + 124);
    id v103 = v71;
    __p = 0;
    v107 = 0;
    uint64_t v108 = 0;
    std::vector<vImage_Buffer>::__init_with_size[abi:ne180100]<vImage_Buffer*,vImage_Buffer*>(&__p, v60, v62, (v62 - (uint64_t)v60) >> 5);
    uint64_t v109 = *(void *)(a1 + 88);
    v72 = _Block_copy(aBlock);
    if ((VNExecuteBlock(v72, v41) & 1) == 0) {
      goto LABEL_72;
    }
    v73 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"VNImageClassifierProcessingOption_ScaleImage"];
    char v101 = [v73 BOOLValue];

    v74 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"VNImageClassifierProcessingOption_ScaleFactor"];
    [v74 floatValue];
    int v76 = v75;

    v77 = *(void **)(a1 + 96);
    uint64_t v78 = *(void *)(a1 + 32);
    v79 = [*(id *)(a1 + 48) fileURL];
    BYTE4(v85) = v101;
    LODWORD(v85) = *(_DWORD *)(a1 + 124);
    LODWORD(v80) = v76;
    char v81 = objc_msgSend(v77, "_dumpIntermediatesTiles:imageURL:requiredImageSource:imageProcessingType:allocatedTileCount:imageTiles:bytesPerPixel:numTiles:scaleFactor:augmentationMode:scalingImage:error:", v78, v79, *(void *)(a1 + 72), v42, *(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24), &v114, v80, __PAIR64__(v16, v58), v85, v41);

    if (v81)
    {
      v82 = *(void **)(a1 + 104);
      if (v82) {
        void *v82 = v98;
      }
      v83 = *(void **)(a1 + 112);
      if (v83) {
        void *v83 = v57;
      }
      uint64_t v22 = 1;
    }
    else
    {
LABEL_72:
      uint64_t v22 = 0;
    }

    if (__p)
    {
      v107 = __p;
      operator delete(__p);
    }

    long long v60 = v114;
  }
  else
  {
    uint64_t v22 = 0;
  }
  if (v60)
  {
    v115 = v60;
    operator delete(v60);
  }
  return v22;
}

BOOL __219__VNImageClassifier_computeImageDescriptorsWithImage_pixelBuffer_regionOfInterest_usingDescriptorProcessor_tileCount_augmentationMode_resultantDescriptorBuffer_options_metalContext_canceller_tileColumns_tileRows_error___block_invoke_2(uint64_t a1, void *a2)
{
  (*(void (**)(void, void, void))(**(void **)(a1 + 40) + 120))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 96), *(unsigned int *)(a1 + 48));
  if ((*(_DWORD *)(a1 + 88) & 4) != 0) {
    uint64_t v4 = 4;
  }
  else {
    uint64_t v4 = *(_DWORD *)(a1 + 88) & 1;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __219__VNImageClassifier_computeImageDescriptorsWithImage_pixelBuffer_regionOfInterest_usingDescriptorProcessor_tileCount_augmentationMode_resultantDescriptorBuffer_options_metalContext_canceller_tileColumns_tileRows_error___block_invoke_3;
  aBlock[3] = &unk_1E5B1E280;
  id v15 = *(id *)(a1 + 32);
  uint64_t v5 = _Block_copy(aBlock);
  int v6 = *(_DWORD *)(a1 + 92);
  if (v6)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    int v13 = v6;
    uint64_t v7 = 1;
    if (v6) {
      uint64_t v7 = 2;
    }
    v10[0] = &unk_1EF7528B8;
    v10[1] = v7 << ((v6 & 2) != 0);
    int64x2_t v8 = (void *)(*(uint64_t (**)(void, uint64_t, uint64_t, void *, void *, void))(**(void **)(a1 + 40)
                                                                                               + 104))(*(void *)(a1 + 40), a1 + 56, v4, v10, v5, *(void *)(a1 + 80));
    vision::mod::ImageDescriptorAugmenterAbstract::~ImageDescriptorAugmenterAbstract((vision::mod::ImageDescriptorAugmenterAbstract *)v10);
  }
  else
  {
    int64x2_t v8 = (void *)(*(uint64_t (**)(void, uint64_t, uint64_t, void *, void))(**(void **)(a1 + 40) + 96))(*(void *)(a1 + 40), a1 + 56, v4, v5, *(void *)(a1 + 80));
  }
  if (a2 && v8 != 128)
  {
    VNErrorForCVMLStatus(v8);
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8 == 128;
}

uint64_t __219__VNImageClassifier_computeImageDescriptorsWithImage_pixelBuffer_regionOfInterest_usingDescriptorProcessor_tileCount_augmentationMode_resultantDescriptorBuffer_options_metalContext_canceller_tileColumns_tileRows_error___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) wasSignalled];
}

+ (BOOL)computeImageCropWithImage:(id)a3 regionOfInterest:(CGRect)a4 usingDescriptorProcessor:(ImageDescriptorProcessorAbstract *)a5 scalingImage:(BOOL)a6 options:(id)a7 pixelBuffer:(__CVBuffer *)a8 error:(id *)a9
{
  BOOL v51 = a6;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v18 = a3;
  id v19 = a7;
  int v20 = [v18 width];
  int v21 = [v18 height];
  float v22 = (*((float (**)(ImageDescriptorProcessorAbstract *))a5->var0 + 19))(a5);
  float v24 = v23;
  unint64_t v25 = v20;
  unint64_t v26 = v21;
  double v27 = (double)(unint64_t)v20;
  v52.origin.double x = x * v27;
  v52.size.double width = width * v27;
  double v28 = (double)(unint64_t)v21;
  v52.origin.double y = y * v28;
  v52.size.double height = height * v28;
  CGRect v53 = CGRectIntegral(v52);
  double v29 = v53.origin.x;
  double v30 = v53.origin.y;
  double v31 = v53.size.width;
  double v32 = v53.size.height;
  if (v51)
  {
    float v33 = (float)((unint64_t)(float)(v22 + v24) >> 1);
    if (v20 <= v21)
    {
      float v36 = v53.size.width;
      float v35 = v33 / v36;
      unint64_t v26 = vcvtps_u32_f32((float)(v33 / v36) * (float)v21);
      unint64_t v25 = (unint64_t)(float)(v22 + v24) >> 1;
    }
    else
    {
      float v34 = v53.size.height;
      float v35 = v33 / v34;
      unint64_t v25 = vcvtps_u32_f32((float)(v33 / v34) * (float)v20);
      unint64_t v26 = (unint64_t)(float)(v22 + v24) >> 1;
    }
  }
  else
  {
    float v35 = 1.0;
  }
  int v37 = (*((uint64_t (**)(ImageDescriptorProcessorAbstract *))a5->var0 + 17))(a5);
  if (v37 == 1) {
    uint64_t v38 = 1;
  }
  else {
    uint64_t v38 = 4;
  }
  if (v37 == 1) {
    uint64_t v39 = 1278226488;
  }
  else {
    uint64_t v39 = 1111970369;
  }
  uint64_t v40 = (__CVBuffer *)objc_msgSend(v18, "croppedBufferWithWidth:height:format:cropRect:options:error:", v25, v26, v39, v19, a9, v29, v30, v31, v32, a1);
  *a8 = v40;
  if (v40
    && ([v18 fileURL],
        uint64_t v41 = objc_claimAutoreleasedReturnValue(),
        char v42 = [v50 _dumpIntermediatesFullImage:v19 imageURL:v41 requiredImageSource:*a8 imageProcessingType:v38 error:a9], v41, (v42 & 1) != 0))
  {
    unsigned int v43 = [NSNumber numberWithInt:v38];
    [v19 setObject:v43 forKeyedSubscript:@"VNImageClassifierProcessingOption_ImageProcessingType"];

    int v44 = [NSNumber numberWithUnsignedLong:(unint64_t)(float)(v22 + v24) >> 1];
    [v19 setObject:v44 forKeyedSubscript:@"VNImageClassifierProcessingOption_AveragedSideLength"];

    unint64_t v45 = [NSNumber numberWithBool:v51];
    [v19 setObject:v45 forKeyedSubscript:@"VNImageClassifierProcessingOption_ScaleImage"];

    *(float *)&double v46 = v35;
    float v47 = [NSNumber numberWithFloat:v46];
    [v19 setObject:v47 forKeyedSubscript:@"VNImageClassifierProcessingOption_ScaleFactor"];

    BOOL v48 = 1;
  }
  else
  {
    BOOL v48 = 0;
  }

  return v48;
}

@end