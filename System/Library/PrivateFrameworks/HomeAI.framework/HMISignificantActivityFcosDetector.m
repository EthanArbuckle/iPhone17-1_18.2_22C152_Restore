@interface HMISignificantActivityFcosDetector
+ (HMIMLModel)sharedModel;
+ (id)defaultAssetPath;
+ (id)defaultNMSConfiguration;
- (BOOL)_runNeuralNetworkOnPixelBuffer:(__CVBuffer *)a3 offsetsZero:(id)a4 offsetsOne:(id)a5 scores:(id)a6 yaws:(id)a7 rolls:(id)a8 error:(id *)a9;
- (BOOL)predict:(__CVBuffer *)a3 detectedObjects:(id)a4 error:(id *)a5;
- (CGSize)inputDimensions;
- (HMINMSConfiguration)nmsConfiguration;
- (HMISignificantActivityFcosDetector)initWithConfidenceThresholds:(id)a3 nmsConfiguration:(id)a4 error:(id *)a5;
- (NSArray)offsetsOneFeatureValueNames;
- (NSArray)offsetsZeroFeatureValueNames;
- (NSArray)rollsFeatureValueNames;
- (NSArray)scoresFeatureValueNames;
- (NSArray)yawsFeatureValueNames;
- (NSString)inputFeatureValueName;
- (void)_postProcessOffsetsZero:(id)a3 offsetsOne:(id)a4 scores:(id)a5 yaws:(id)a6 rolls:(id)a7 outputPredictions:(id)a8;
@end

@implementation HMISignificantActivityFcosDetector

- (HMISignificantActivityFcosDetector)initWithConfidenceThresholds:(id)a3 nmsConfiguration:(id)a4 error:(id *)a5
{
  v33[16] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v32.receiver = self;
  v32.super_class = (Class)HMISignificantActivityFcosDetector;
  v9 = [(HMISignificantActivityFcosDetector *)&v32 init];
  if (v9)
  {
    if ([v7 count])
    {
      unint64_t v10 = 0;
      do
      {
        v11 = [v7 objectAtIndexedSubscript:v10];
        [v11 floatValue];
        v9->_confidenceThresholds[v10] = v12;

        ++v10;
      }
      while ([v7 count] > v10);
    }
    objc_storeStrong((id *)&v9->_nmsConfiguration, a4);
    v9->_inputDimensions = (CGSize)kHMISignificantActivityFcosInputSize;
    inputFeatureValueName = v9->_inputFeatureValueName;
    v9->_inputFeatureValueName = (NSString *)@"image_Placeholder";

    offsetsZeroFeatureValueNames = v9->_offsetsZeroFeatureValueNames;
    v9->_offsetsZeroFeatureValueNames = (NSArray *)&unk_26D9A9660;

    offsetsOneFeatureValueNames = v9->_offsetsOneFeatureValueNames;
    v9->_offsetsOneFeatureValueNames = (NSArray *)&unk_26D9A9678;

    scoresFeatureValueNames = v9->_scoresFeatureValueNames;
    v9->_scoresFeatureValueNames = (NSArray *)&unk_26D9A9690;

    yawsFeatureValueNames = v9->_yawsFeatureValueNames;
    v9->_yawsFeatureValueNames = (NSArray *)&unk_26D9A96A8;

    rollsFeatureValueNames = v9->_rollsFeatureValueNames;
    v9->_rollsFeatureValueNames = (NSArray *)&unk_26D9A96C0;

    [(HMISignificantActivityFcosDetector *)v9 inputDimensions];
    uint64_t v21 = 0;
    v33[0] = *(void *)&v19.f64[0];
    *(float64_t *)&v33[1] = v20;
    __asm
    {
      FMOV            V2.2D, #-1.0
      FMOV            V3.2D, #0.5
      FMOV            V4.2S, #1.0
    }
    v29.f64[0] = v19.f64[0];
    do
    {
      *(void *)&v29.f64[1] = v33[v21 + 1];
      float64x2_t v29 = vcvtq_f64_f32(vadd_f32(vrndm_f32(vcvt_f32_f64(vmulq_f64(vaddq_f64(v29, _Q2), _Q3))), _D4));
      *(float64x2_t *)&v33[v21 + 2] = v29;
      v21 += 2;
    }
    while (v21 != 14);
    unint64_t v30 = 0;
    v19.f64[1] = v20;
    do
    {
      v9->_anchorStrides[v30 / 2] = (CGSize)vcvtq_f64_f32(vcvt_f32_f64(vdivq_f64(vcvtq_f64_f32(vcvt_f32_f64(vdivq_f64(v19, *(float64x2_t *)&v33[v30 + 6]))), v19)));
      v30 += 2;
    }
    while (v30 != 10);
  }

  return v9;
}

+ (HMIMLModel)sharedModel
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__HMISignificantActivityFcosDetector_sharedModel__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedModel_onceToken != -1) {
    dispatch_once(&sharedModel_onceToken, block);
  }
  v2 = (void *)sharedModel_model;
  return (HMIMLModel *)v2;
}

void __49__HMISignificantActivityFcosDetector_sharedModel__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x22A641C70]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    int v16 = 138543362;
    v17 = v5;
    _os_log_impl(&dword_225DC6000, v4, OS_LOG_TYPE_INFO, "%{public}@Initializing shared model", (uint8_t *)&v16, 0xCu);
  }
  v6 = +[HMISignificantActivityFcosDetector defaultAssetPath];
  if (v6)
  {
    id v7 = [NSURL fileURLWithPath:v6];
    id v8 = [[HMIMLModel alloc] initWithModelURL:v7];
    v9 = (void *)sharedModel_model;
    sharedModel_model = (uint64_t)v8;

    if (!sharedModel_model)
    {
      unint64_t v10 = (void *)MEMORY[0x22A641C70]();
      v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        float v12 = HMFGetLogIdentifier();
        int v16 = 138543362;
        v17 = v12;
        _os_log_impl(&dword_225DC6000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to load model!", (uint8_t *)&v16, 0xCu);
      }
    }
  }
  else
  {
    v13 = (void *)MEMORY[0x22A641C70]();
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      int v16 = 138543362;
      v17 = v15;
      _os_log_impl(&dword_225DC6000, v14, OS_LOG_TYPE_ERROR, "%{public}@Model is not bundled into framework. Default model is stored in Git LFS. Make sure Git LFS is installed in your local system.", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (BOOL)predict:(__CVBuffer *)a3 detectedObjects:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v9 = [MEMORY[0x263EFF980] arrayWithCapacity:5];
  unint64_t v10 = [MEMORY[0x263EFF980] arrayWithCapacity:5];
  v11 = [MEMORY[0x263EFF980] arrayWithCapacity:5];
  float v12 = [MEMORY[0x263EFF980] arrayWithCapacity:5];
  v13 = [MEMORY[0x263EFF980] arrayWithCapacity:5];
  int v16 = [[HMISignpost alloc] initWithName:@"SignificantActivityFcosDetector"];
  BOOL v14 = [(HMISignificantActivityFcosDetector *)self _runNeuralNetworkOnPixelBuffer:a3 offsetsZero:v9 offsetsOne:v10 scores:v11 yaws:v12 rolls:v13 error:a5];
  if (v14) {
    [(HMISignificantActivityFcosDetector *)self _postProcessOffsetsZero:v9 offsetsOne:v10 scores:v11 yaws:v12 rolls:v13 outputPredictions:v8];
  }
  __HMISignpostScopeLeave(&v16);

  return v14;
}

- (BOOL)_runNeuralNetworkOnPixelBuffer:(__CVBuffer *)a3 offsetsZero:(id)a4 offsetsOne:(id)a5 scores:(id)a6 yaws:(id)a7 rolls:(id)a8 error:(id *)a9
{
  v15 = a9;
  id v65 = a4;
  id v64 = a5;
  id v63 = a6;
  id v62 = a7;
  id v61 = a8;
  int v16 = +[HMIPreference sharedInstance];
  LODWORD(a7) = [v16 BOOLPreferenceForKey:@"showROI" defaultValue:0];

  if (a7)
  {
    v17 = [HMIVideoFrame alloc];
    long long v67 = *MEMORY[0x263F010E0];
    uint64_t v68 = *(void *)(MEMORY[0x263F010E0] + 16);
    uint64_t v18 = [(HMIVideoFrame *)v17 initWithPixelBuffer:a3 presentationTimeStamp:&v67];
    [(HMIVideoFrame *)v18 printWithScale:1.0];
  }
  float64x2_t v19 = +[HMIVisionUtilities transferPixelBuffer:a3 pixelFormat:1111970369 options:0 error:a9];
  float64_t v20 = [HMIInputFeatureProvider alloc];
  uint64_t v21 = [(HMISignificantActivityFcosDetector *)self inputFeatureValueName];
  uint64_t v22 = [(HMIInputFeatureProvider *)v20 initWithPixelBuffer:v19 inputName:v21];

  CVPixelBufferRelease(v19);
  v23 = +[HMISignificantActivityFcosDetector sharedModel];
  id v66 = 0;
  v60 = (void *)v22;
  v24 = [v23 predictionFromFeatures:v22 error:&v66];
  id v25 = v66;

  v59 = v25;
  if (!v24 || v25)
  {
    v53 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1019 underlyingError:v25];
    float64x2_t v29 = v53;
    if (a9) {
      *a9 = v53;
    }
    HMIErrorLog(self, v29);
  }
  else
  {
    uint64_t v26 = 0;
    while (1)
    {
      v27 = [(HMISignificantActivityFcosDetector *)self offsetsZeroFeatureValueNames];
      v28 = [v27 objectAtIndexedSubscript:v26];
      float64x2_t v29 = [v24 featureValueForName:v28];

      if (!v29 || [v29 type] != 5) {
        break;
      }
      unint64_t v30 = [v29 multiArrayValue];
      [v65 addObject:v30];

      v31 = [(HMISignificantActivityFcosDetector *)self offsetsOneFeatureValueNames];
      objc_super v32 = [v31 objectAtIndexedSubscript:v26];
      v33 = [v24 featureValueForName:v32];

      if (!v33 || [v33 type] != 5)
      {
        v56 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1020 description:@"CoreML output nil or not of type MLFeatureTypeMultiArray"];
        v57 = v56;
        if (v15) {
          id *v15 = v56;
        }
        HMIErrorLog(self, v57);

        goto LABEL_41;
      }
      v34 = [v33 multiArrayValue];
      [v64 addObject:v34];

      v35 = [(HMISignificantActivityFcosDetector *)self scoresFeatureValueNames];
      v36 = [v35 objectAtIndexedSubscript:v26];
      v37 = [v24 featureValueForName:v36];

      if (v37 && [v37 type] == 5)
      {
        v38 = [v37 multiArrayValue];
        [v63 addObject:v38];

        v39 = [(HMISignificantActivityFcosDetector *)self yawsFeatureValueNames];
        v40 = [v39 objectAtIndexedSubscript:v26];
        v41 = [v24 featureValueForName:v40];

        if (v41 && [v41 type] == 5)
        {
          v42 = [v41 multiArrayValue];
          [v62 addObject:v42];

          v43 = [(HMISignificantActivityFcosDetector *)self rollsFeatureValueNames];
          v44 = [v43 objectAtIndexedSubscript:v26];
          v45 = [v24 featureValueForName:v44];

          if (v45 && [v45 type] == 5)
          {
            v46 = [v45 multiArrayValue];
            [v61 addObject:v46];
            int v47 = 0;
          }
          else
          {
            v50 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1020 description:@"CoreML output nil or not of type MLFeatureTypeMultiArray"];
            v46 = v50;
            if (a9) {
              *a9 = v50;
            }
            HMIErrorLog(self, v46);
            int v47 = 1;
          }
        }
        else
        {
          v49 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1020 description:@"CoreML output nil or not of type MLFeatureTypeMultiArray"];
          v45 = v49;
          if (v15) {
            id *v15 = v49;
          }
          HMIErrorLog(self, v45);
          int v47 = 1;
        }
      }
      else
      {
        v48 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1020 description:@"CoreML output nil or not of type MLFeatureTypeMultiArray"];
        v41 = v48;
        if (v15) {
          id *v15 = v48;
        }
        HMIErrorLog(self, v41);
        int v47 = 1;
      }

      BOOL v51 = v47 == 0;
      if (!v47)
      {
        BOOL v52 = v26++ == 4;
        v15 = a9;
        if (!v52) {
          continue;
        }
      }
      goto LABEL_42;
    }
    v54 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1020 description:@"CoreML output nil or not of type MLFeatureTypeMultiArray"];
    v55 = v54;
    if (v15) {
      id *v15 = v54;
    }
    HMIErrorLog(self, v55);
  }
LABEL_41:

  BOOL v51 = 0;
LABEL_42:

  return v51;
}

- (void)_postProcessOffsetsZero:(id)a3 offsetsOne:(id)a4 scores:(id)a5 yaws:(id)a6 rolls:(id)a7 outputPredictions:(id)a8
{
  uint64_t v112 = *MEMORY[0x263EF8340];
  id v87 = a3;
  id v86 = a4;
  id v85 = a5;
  id v84 = a6;
  id v83 = a7;
  id v82 = a8;
  v101 = [MEMORY[0x263EFF980] array];
  for (uint64_t i = 0; i != 5; ++i)
  {
    BOOL v14 = [v87 objectAtIndexedSubscript:i];
    id v104 = [v86 objectAtIndexedSubscript:i];
    v15 = [v85 objectAtIndexedSubscript:i];
    int v16 = [v84 objectAtIndexedSubscript:i];
    v17 = [v83 objectAtIndexedSubscript:i];
    uint64_t v18 = [v14 shape];
    float64x2_t v19 = [v18 objectAtIndexedSubscript:3];
    uint64_t v98 = [v19 unsignedLongValue];

    float64_t v20 = [v14 shape];
    uint64_t v21 = [v20 objectAtIndexedSubscript:2];
    uint64_t v22 = [v21 unsignedLongValue];

    v23 = [v14 strides];
    v24 = [v23 objectAtIndexedSubscript:1];
    uint64_t v102 = [v24 unsignedLongValue];

    id v25 = [v14 strides];
    uint64_t v26 = [v25 objectAtIndexedSubscript:3];
    uint64_t v97 = [v26 unsignedLongValue];

    v27 = [v15 strides];
    v28 = [v27 objectAtIndexedSubscript:3];
    uint64_t v29 = [v28 unsignedLongValue];

    unint64_t v30 = [v17 strides];
    v31 = [v30 objectAtIndexedSubscript:3];
    uint64_t v96 = [v31 unsignedLongValue];

    id v92 = v14;
    uint64_t v106 = [v92 dataPointer];
    id v91 = v104;
    v105 = (float *)[v91 dataPointer];
    id v90 = v15;
    objc_super v32 = (float *)[v90 dataPointer];
    id v89 = v16;
    v33 = (_DWORD *)[v89 dataPointer];
    id v88 = v17;
    uint64_t v34 = [v88 dataPointer];
    uint64_t v93 = v22;
    if (v22)
    {
      v35 = (_DWORD *)v34;
      unint64_t v36 = 0;
      uint64_t v95 = v29;
      do
      {
        unint64_t v94 = v36;
        if (v98)
        {
          unint64_t v37 = 0;
          double v38 = (float)v36 + 0.5;
          do
          {
            unint64_t v99 = v37;
            v100 = v32;
            double v39 = (float)v37 + 0.5;
            for (uint64_t j = 1; j != 7; ++j)
            {
              float v41 = self->_confidenceThresholds[j];
              if (v41 >= 0.0)
              {
                float v42 = *v32;
                if (*v32 >= v41)
                {
                  v43 = &self->_anchorStrides[i];
                  float v44 = v39 * v43->width;
                  float v45 = v38 * v43->height;
                  uint64_t v46 = i;
                  if (j == 5) {
                    int v47 = v105;
                  }
                  else {
                    int v47 = (float *)v106;
                  }
                  float v48 = expf(*v47);
                  float v49 = expf(v47[v102]);
                  float v50 = expf(v47[2 * v102]);
                  double v51 = (float)(v44 - v49);
                  double v52 = (float)(v49 + expf(v47[3 * v102]));
                  v53 = [HMIObjectDetection alloc];
                  LODWORD(v54) = *v33;
                  v55 = [NSNumber numberWithFloat:v54];
                  LODWORD(v56) = *v35;
                  v57 = [NSNumber numberWithFloat:v56];
                  v58 = -[HMIObjectDetection initWithLabelIndex:confidence:unclampedBoundingBox:yaw:roll:](v53, "initWithLabelIndex:confidence:unclampedBoundingBox:yaw:roll:", j, v55, v57, v42, v51, (float)(v45 - v48), v52, (float)(v48 + v50));

                  [v101 addObject:v58];
                  uint64_t i = v46;
                }
              }
              v32 += v102;
            }
            objc_super v32 = &v100[v95];
            v105 += v97;
            v106 += 4 * v97;
            v33 += v96;
            unint64_t v37 = v99 + 1;
            v35 += v96;
          }
          while (v99 + 1 != v98);
        }
        unint64_t v36 = v94 + 1;
      }
      while (v94 + 1 != v93);
    }
  }
  v59 = [MEMORY[0x263EFF980] array];
  v60 = [(HMISignificantActivityFcosDetector *)self nmsConfiguration];
  +[HMIObjectDetectionUtils nmsMultiClass:v101 output:v59 nmsConfiguration:v60];

  long long v109 = 0u;
  long long v110 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  id v61 = v59;
  uint64_t v62 = [v61 countByEnumeratingWithState:&v107 objects:v111 count:16];
  if (v62)
  {
    uint64_t v63 = v62;
    uint64_t v64 = *(void *)v108;
    do
    {
      for (uint64_t k = 0; k != v63; ++k)
      {
        if (*(void *)v108 != v64) {
          objc_enumerationMutation(v61);
        }
        id v66 = *(void **)(*((void *)&v107 + 1) + 8 * k);
        [v66 boundingBox];
        v115.origin.double x = v67;
        v115.origin.double y = v68;
        v115.size.double width = v69;
        v115.size.double height = v70;
        v113.origin.double x = 0.0;
        v113.origin.double y = 0.0;
        v113.size.double width = 1.0;
        v113.size.double height = 1.0;
        CGRect v114 = CGRectIntersection(v113, v115);
        double x = v114.origin.x;
        double y = v114.origin.y;
        double width = v114.size.width;
        double height = v114.size.height;
        if (!CGRectIsEmpty(v114))
        {
          v75 = [HMIObjectDetection alloc];
          uint64_t v76 = [v66 labelIndex];
          [v66 confidence];
          double v78 = v77;
          v79 = [v66 yaw];
          v80 = [v66 roll];
          v81 = -[HMIObjectDetection initWithLabelIndex:confidence:boundingBox:yaw:roll:](v75, "initWithLabelIndex:confidence:boundingBox:yaw:roll:", v76, v79, v80, v78, x, y, width, height);

          [v82 addObject:v81];
        }
      }
      uint64_t v63 = [v61 countByEnumeratingWithState:&v107 objects:v111 count:16];
    }
    while (v63);
  }
}

+ (id)defaultNMSConfiguration
{
  v7[2] = *MEMORY[0x263EF8340];
  v2 = [HMINMSConfiguration alloc];
  v6[0] = &unk_26D9A9198;
  v6[1] = &unk_26D9A91B0;
  v7[0] = &unk_26D9A99C0;
  v7[1] = &unk_26D9A99D0;
  id v3 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];
  v4 = [(HMINMSConfiguration *)v2 initWithThresholdWithLabels:v3 metricWithLabels:MEMORY[0x263EFFA78] thresholdDefault:&unk_26D9A99E0 metricDefault:&unk_26D9A91C8];

  return v4;
}

+ (id)defaultAssetPath
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 pathForResource:@"SignificantActivityFcos" ofType:@"mlmodelc"];

  return v3;
}

- (CGSize)inputDimensions
{
  objc_copyStruct(v4, &self->_inputDimensions, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (NSString)inputFeatureValueName
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (NSArray)offsetsZeroFeatureValueNames
{
  return (NSArray *)objc_getProperty(self, a2, 128, 1);
}

- (NSArray)offsetsOneFeatureValueNames
{
  return (NSArray *)objc_getProperty(self, a2, 136, 1);
}

- (NSArray)scoresFeatureValueNames
{
  return (NSArray *)objc_getProperty(self, a2, 144, 1);
}

- (NSArray)yawsFeatureValueNames
{
  return (NSArray *)objc_getProperty(self, a2, 152, 1);
}

- (NSArray)rollsFeatureValueNames
{
  return (NSArray *)objc_getProperty(self, a2, 160, 1);
}

- (HMINMSConfiguration)nmsConfiguration
{
  return (HMINMSConfiguration *)objc_getProperty(self, a2, 168, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nmsConfiguration, 0);
  objc_storeStrong((id *)&self->_rollsFeatureValueNames, 0);
  objc_storeStrong((id *)&self->_yawsFeatureValueNames, 0);
  objc_storeStrong((id *)&self->_scoresFeatureValueNames, 0);
  objc_storeStrong((id *)&self->_offsetsOneFeatureValueNames, 0);
  objc_storeStrong((id *)&self->_offsetsZeroFeatureValueNames, 0);
  objc_storeStrong((id *)&self->_inputFeatureValueName, 0);
}

@end