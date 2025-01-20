@interface VNFaceGeometryEstimator
+ (const)allLandmarksPointsIndexes;
+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4;
- (BOOL)_buildCalibrationMatrix:(id)a3 calibrationMatrix:(float *)a4 error:(id *)a5;
- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9;
- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9;
@end

@implementation VNFaceGeometryEstimator

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7 = @"VNComputeStageMain";
  v4 = +[VNComputeDeviceUtilities allCPUComputeDevices];
  v8[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

+ (const)allLandmarksPointsIndexes
{
  if (+[VNFaceGeometryEstimator allLandmarksPointsIndexes]::onceToken != -1) {
    dispatch_once(&+[VNFaceGeometryEstimator allLandmarksPointsIndexes]::onceToken, &__block_literal_global_14641);
  }
  return (const void *)+[VNFaceGeometryEstimator allLandmarksPointsIndexes]::allLandmarksPointsIndexes;
}

void __52__VNFaceGeometryEstimator_allLandmarksPointsIndexes__block_invoke()
{
}

- (BOOL)_buildCalibrationMatrix:(id)a3 calibrationMatrix:(float *)a4 error:(id *)a5
{
  id v7 = a3;
  int v18 = 0;
  LODWORD(v8) = 1161527296;
  if (+[VNValidationUtilities getFloatValue:&v18 forKey:@"VNFaceGeometryEstimatorInitOption_CameraFocalLength" inOptions:v7 withDefaultValue:a5 error:v8])
  {
    id v17 = 0;
    BOOL v9 = +[VNValidationUtilities getOptionalObject:&v17 ofClass:objc_opt_class() forKey:@"VNFaceGeometryEstimatorInitOption_ImageSize" inOptions:v7 error:a5];
    CFDictionaryRef v10 = (const __CFDictionary *)v17;
    CFDictionaryRef v11 = v10;
    if (v9)
    {
      if (!v10)
      {
        int32x2_t v12 = (int32x2_t)0x4400000044000000;
        if (!a4)
        {
LABEL_10:
          BOOL v13 = 1;
LABEL_14:

          goto LABEL_15;
        }
LABEL_9:
        int v14 = v18;
        *(_DWORD *)a4 = v18;
        *((void *)a4 + 1) = 0;
        a4[1] = 0.0;
        *((_DWORD *)a4 + 4) = v14;
        a4[5] = 0.0;
        *((int32x2_t *)a4 + 3) = vrev64_s32(v12);
        a4[8] = 1.0;
        goto LABEL_10;
      }
      float64x2_t v16 = *(float64x2_t *)MEMORY[0x1E4F1DB30];
      if (CGSizeMakeWithDictionaryRepresentation(v10, (CGSize *)&v16))
      {
        int32x2_t v12 = vrev64_s32((int32x2_t)vmul_f32(vcvt_f32_f64(v16), (float32x2_t)0x3F0000003F000000));
        if (!a4) {
          goto LABEL_10;
        }
        goto LABEL_9;
      }
      if (a5)
      {
        *a5 = +[VNError errorForInvalidOption:v11 named:@"VNFaceGeometryEstimatorInitOption_ImageSize"];
      }
    }
    BOOL v13 = 0;
    goto LABEL_14;
  }
  BOOL v13 = 0;
LABEL_15:

  return v13;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  v72[1] = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  int32x2_t v12 = [(VNDetector *)self validatedImageBufferFromOptions:v11 error:a8];
  if (v12)
  {
    BOOL v13 = VNCloneFaceObservationFromOptions((uint64_t)v11, a8);
    if (v13)
    {
      v48 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v11 error:a8];
      if (v48)
      {
        int v14 = [v11 objectForKey:@"VNFaceGeometryEstimatorProcessOption_EstimatePoseOnly"];
        v47 = v14;
        if (v14) {
          char v15 = [v14 BOOLValue];
        }
        else {
          char v15 = 0;
        }
        unint64_t v17 = [v12 width];
        unint64_t v18 = [v12 height];
        uint64_t v65 = 0;
        v66 = &v65;
        uint64_t v67 = 0x4812000000;
        v68 = __Block_byref_object_copy__14652;
        v69 = __Block_byref_object_dispose__14653;
        v70 = "";
        std::vector<_Geometry2D_point2D_>::vector(__p, 0x3FuLL);
        v19 = [v13 landmarkPoints];
        objc_msgSend(v13, "alignedBoundingBox", v19);
        float v21 = v20;
        float v23 = v22;
        float v25 = v24;
        float v27 = v26;
        uint64_t v56 = 0;
        v57 = &v56;
        uint64_t v58 = 0x6012000000;
        v59 = __Block_byref_object_copy__37;
        v60 = __Block_byref_object_dispose__38;
        v61 = "";
        long long v62 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        v28 = (void *)v66[6];
        id v29 = v19;
        memcpy(v28, (const void *)[v29 bytes], 0x1F8uLL);
        for (uint64_t i = 0; i != 504; i += 8)
        {
          uint64_t v31 = v66[6];
          float v32 = (double)v17 * v27 * *(float *)(v31 + i);
          *(float *)(v31 + i) = v32;
          uint64_t v33 = v66[6] + i;
          float v34 = (double)v18 * v25 * *(float *)(v33 + 4);
          *(float *)(v33 + 4) = v34;
          uint64_t v35 = v66[6];
          float v36 = (double)v17 * v21 + *(float *)(v35 + i);
          *(float *)(v35 + i) = v36;
          uint64_t v37 = v66[6] + i;
          float v38 = (double)v18 * v23 + *(float *)(v37 + 4);
          *(float *)(v37 + 4) = v38;
          uint64_t v39 = v66[6] + i;
          float v40 = (double)v18 - *(float *)(v39 + 4);
          *(float *)(v39 + 4) = v40;
        }
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __125__VNFaceGeometryEstimator_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke;
        aBlock[3] = &unk_1E5B1D6D8;
        aBlock[4] = self;
        char v55 = v15;
        id v50 = v11;
        v53 = &v65;
        v54 = &v56;
        id v41 = v13;
        id v51 = v41;
        id v42 = v48;
        id v52 = v42;
        v43 = _Block_copy(aBlock);
        if (VNExecuteBlock(v43, (uint64_t)a8))
        {
          id v44 = objc_alloc(MEMORY[0x1E4F1C9B8]);
          v45 = (void *)[v44 initWithBytes:v57 + 6 length:48];
          [v41 setPoseData:v45 originatingRequestSpecifier:v42];
          v72[0] = v41;
          float64x2_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:1];
        }
        else
        {
          float64x2_t v16 = 0;
        }

        _Block_object_dispose(&v56, 8);
        _Block_object_dispose(&v65, 8);
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
      }
      else
      {
        float64x2_t v16 = 0;
      }
    }
    else
    {
      float64x2_t v16 = 0;
    }
  }
  else
  {
    float64x2_t v16 = 0;
  }

  return v16;
}

uint64_t __125__VNFaceGeometryEstimator_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  int v20 = 0;
  memset(v19, 0, sizeof(v19));
  if ([*(id *)(a1 + 32) _buildCalibrationMatrix:*(void *)(a1 + 40) calibrationMatrix:v19 error:a2])
  {
    v3 = VNBinModelFilePathFromModelNameAndThrow(@"eigenshape");
    v4 = +[VNModelFilesCache sharedInstance];
    v5 = [v4 load:v3];
    if (v5)
    {
      v6 = (FILE *)[v5 ptrFile];
      memset(v21, 0, sizeof(v21));
      int v22 = 1065353216;
      vision::mod::readBinSerializedModelValues(v6, 0, vision::mod::Face3D::modelFileInfo(void)::tempInfo, v21);
      std::string::basic_string[abi:ne180100]<0>(__p, "mu");
      id v7 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v21, (unsigned __int8 *)__p);
      if (v7 && *((_DWORD *)v7 + 10) == 2)
      {
        uint64_t v8 = *((void *)v7 + 7);
        if (v8) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
        }
        unint64_t v9 = *((void *)v7 + 8) / 3uLL;
        char v10 = 1;
      }
      else
      {
        LODWORD(v9) = 0;
        char v10 = 0;
      }
      if (SHIBYTE(v18[0]) < 0) {
        operator delete(__p[0]);
      }
      if ((v10 & 1) == 0) {
        goto LABEL_28;
      }
      std::string::basic_string[abi:ne180100]<0>(__p, "S");
      id v11 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(v21, (unsigned __int8 *)__p);
      if (v11 && *((_DWORD *)v11 + 10) == 2)
      {
        uint64_t v12 = *((void *)v11 + 7);
        if (v12) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(v12 + 8), 1uLL, memory_order_relaxed);
        }
        char v13 = 1;
      }
      else
      {
        char v13 = 0;
      }
      if (SHIBYTE(v18[0]) < 0) {
        operator delete(__p[0]);
      }
      if (v13)
      {
        if (v9 == 63) {
          operator new[]();
        }
        exception = __cxa_allocate_exception(8uLL);
        uint64_t v16 = 892;
      }
      else
      {
LABEL_28:
        exception = __cxa_allocate_exception(8uLL);
        uint64_t v16 = 888;
      }
      void *exception = v16;
      __cxa_throw(exception, MEMORY[0x1E4FBA3E0], 0);
    }
    if (a2)
    {
      *a2 = +[VNError errorWithCode:9 message:@"Could not read face geometry estimator model data"];
      v5 = 0;
    }
  }
  return 0;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  return 1;
}

@end