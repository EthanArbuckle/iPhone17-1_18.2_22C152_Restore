@interface HMIFaceClassifierVIP
- (HMIFaceClassifierVIP)initWithError:(id *)a3;
- (HMIFaceQualityFilterSVM)faceAestheticQualityFilter;
- (HMIFaceQualityFilterSVM)faceRecognizabilityFilter;
- (HMIFaceprinter)faceprinter;
- (double)classificationThresholdKnown;
- (double)classificationThresholdUnknown;
- (id)classifyFaceEvent:(id)a3 pixelBuffer:(__CVBuffer *)a4 fastMode:(BOOL)a5 homeUUID:(id)a6 error:(id *)a7;
- (id)qualityPredictionFromSVMUsingFaceQualityFilterSVM:(id)a3 detectorConfidence:(double)a4 laplacian:(double)a5 yaw:(double)a6 boxSize:(double)a7 error:(id *)a8;
@end

@implementation HMIFaceClassifierVIP

- (HMIFaceClassifierVIP)initWithError:(id *)a3
{
  v29.receiver = self;
  v29.super_class = (Class)HMIFaceClassifierVIP;
  v4 = [(HMIFaceClassifierVIP *)&v29 init];
  if (!v4) {
    goto LABEL_5;
  }
  v5 = objc_alloc_init(HMIFaceprinter);
  faceprinter = v4->_faceprinter;
  v4->_faceprinter = v5;

  v7 = +[HMIPreference sharedInstance];
  v8 = [v7 numberPreferenceForKey:@"personsModelClassificationThresholdKnown" defaultValue:&unk_26D9A9A10];
  [v8 doubleValue];
  v4->_classificationThresholdKnown = v9;

  v10 = +[HMIPreference sharedInstance];
  v11 = [v10 numberPreferenceForKey:@"personsModelClassificationThresholdUnknown" defaultValue:&unk_26D9A9A20];
  [v11 doubleValue];
  v4->_classificationThresholdUnknown = v12;

  v13 = [HMIFaceQualityFilterSVM alloc];
  v14 = +[HMIFaceQualityFilterSVM defaultRecognizabilityModelPath];
  v15 = +[HMIFaceQualityFilterSVM defaultRecognizabilityDataScalerPath];
  id v28 = 0;
  uint64_t v16 = [(HMIFaceQualityFilterSVM *)v13 initWithModelPath:v14 dataScalerPath:v15 error:&v28];
  id v17 = v28;
  faceRecognizabilityFilter = v4->_faceRecognizabilityFilter;
  v4->_faceRecognizabilityFilter = (HMIFaceQualityFilterSVM *)v16;

  if (v4->_faceRecognizabilityFilter)
  {
    v19 = [HMIFaceQualityFilterSVM alloc];
    v20 = +[HMIFaceQualityFilterSVM defaultAestheticQualityModelPath];
    v21 = +[HMIFaceQualityFilterSVM defaultAestheticQualityDataScalerPath];
    id v27 = v17;
    uint64_t v22 = [(HMIFaceQualityFilterSVM *)v19 initWithModelPath:v20 dataScalerPath:v21 error:&v27];
    id v23 = v27;

    faceAestheticQualityFilter = v4->_faceAestheticQualityFilter;
    v4->_faceAestheticQualityFilter = (HMIFaceQualityFilterSVM *)v22;

    if (v4->_faceAestheticQualityFilter)
    {

LABEL_5:
      v25 = v4;
      goto LABEL_10;
    }
    id v17 = v23;
  }
  if (a3)
  {
    id v17 = v17;
    *a3 = v17;
  }
  HMIErrorLog(v4, v17);

  v25 = 0;
LABEL_10:

  return v25;
}

- (id)qualityPredictionFromSVMUsingFaceQualityFilterSVM:(id)a3 detectorConfidence:(double)a4 laplacian:(double)a5 yaw:(double)a6 boxSize:(double)a7 error:(id *)a8
{
  id v14 = a3;
  id v28 = 0;
  v15 = (void *)[objc_alloc(MEMORY[0x263F00DA8]) initWithShape:&unk_26D9A9708 dataType:65600 error:&v28];
  id v16 = v28;
  id v17 = v16;
  if (v15)
  {
    v18 = [NSNumber numberWithDouble:a4];
    [v15 setObject:v18 atIndexedSubscript:0];

    v19 = [NSNumber numberWithDouble:a5];
    [v15 setObject:v19 atIndexedSubscript:1];

    v20 = [NSNumber numberWithDouble:a6];
    [v15 setObject:v20 atIndexedSubscript:2];

    v21 = [NSNumber numberWithDouble:a7];
    [v15 setObject:v21 atIndexedSubscript:3];

    id v26 = v17;
    double v27 = 0.0;
    char v22 = [v14 predict:v15 output:&v27 error:&v26];
    id v23 = v26;

    if (v22)
    {
      v24 = [NSNumber numberWithDouble:v27];
    }
    else
    {
      if (a8) {
        *a8 = v23;
      }
      HMIErrorLog(self, v23);
      v24 = 0;
    }
    id v17 = v23;
  }
  else
  {
    if (a8) {
      *a8 = v16;
    }
    HMIErrorLog(self, v17);
    v24 = 0;
  }

  return v24;
}

- (id)classifyFaceEvent:(id)a3 pixelBuffer:(__CVBuffer *)a4 fastMode:(BOOL)a5 homeUUID:(id)a6 error:(id *)a7
{
  BOOL v9 = a5;
  uint64_t v225 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a6;
  id v14 = [v12 roll];
  v15 = +[HMIFaceprinter createFacePixelBufferForFaceEvent:v12 pixelBuffer:a4 roll:v14 error:a7];

  if (v15)
  {
    id v195 = v13;
    id v16 = objc_alloc_init(HMIFaceQualityEntropyOfLaplacian);
    id v17 = [v12 confidence];
    [v17 value];
    double v19 = v18;

    [(HMIFaceQualityEntropyOfLaplacian *)v16 computeJunkScoreForPixelBuffer:v15];
    float v21 = v20;
    char v22 = [v12 yaw];
    [v22 doubleValue];
    double v24 = v23;

    [v12 boundingBox];
    double v26 = v25;
    double v28 = v27;
    double Size = HMICVPixelBufferGetSize(a4);
    float v31 = HMICGSizeAreaInPixelsFromNormalized(v26, v28, Size, v30);
    faceRecognizabilityFilter = self->_faceRecognizabilityFilter;
    id v206 = 0;
    v33 = [(HMIFaceClassifierVIP *)self qualityPredictionFromSVMUsingFaceQualityFilterSVM:faceRecognizabilityFilter detectorConfidence:&v206 laplacian:v19 yaw:v21 boxSize:v24 error:v31];
    id v34 = v206;
    v35 = v34;
    if (v33)
    {
      uint64_t v36 = [v33 doubleValue];
      if (v37 < 0.55 || fabs(v24) > 0.65)
      {
        v67 = v16;
        v68 = (void *)MEMORY[0x22A641C70](v36);
        v69 = self;
        v70 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
        {
          v71 = HMFGetLogIdentifier();
          [v33 doubleValue];
          *(_DWORD *)buf = 138543874;
          v220 = v71;
          __int16 v221 = 2048;
          double v222 = v72;
          __int16 v223 = 2048;
          double v224 = v24;
          _os_log_impl(&dword_225DC6000, v70, OS_LOG_TYPE_DEBUG, "%{public}@Face below face quality thresholds: SVM recognizability = %lf, Yaw = %lf, discarding", buf, 0x20u);
        }
        CVPixelBufferRelease(v15);
        v217 = @"FaceFilteredState";
        v73 = HMIFaceFilteredStateAsString(1);
        v218 = v73;
        v74 = [NSDictionary dictionaryWithObjects:&v218 forKeys:&v217 count:1];

        v75 = [HMIVideoAnalyzerEventFace alloc];
        v76 = [v12 confidence];
        [v12 boundingBox];
        double v78 = v77;
        double v80 = v79;
        double v82 = v81;
        double v84 = v83;
        v85 = [v12 yaw];
        v86 = [v12 roll];
        v66 = -[HMIVideoAnalyzerEventFace initWithConfidence:boundingBox:yaw:roll:faceRecognition:userInfo:](v75, "initWithConfidence:boundingBox:yaw:roll:faceRecognition:userInfo:", v76, v85, v86, 0, v74, v78, v80, v82, v84);

        id v16 = v67;
      }
      else
      {
        v194 = v16;
        v38 = [(HMIFaceClassifierVIP *)self faceprinter];
        v39 = [v38 createFaceprintForFacePixelBuffer:v15 fastMode:v9 error:a7];

        if (v39)
        {
          v40 = [v39 faceprint];
          [v40 confidence];
          double v42 = v41;

          HIDWORD(v44) = 1069128089;
          if (v42 >= 0.1)
          {
            LODWORD(v44) = 1.0;
            LODWORD(v43) = 1.0;
            v87 = +[HMIVisionUtilities createJPEGDataFromPixelBuffer:v15 scale:a7 encodeQuality:v44 error:v43];
            CVPixelBufferRelease(v15);
            if (v87)
            {
              v88 = +[HMIPersonsModelManager sharedInstance];
              v89 = [v88 predictPersonFromFaceObservation:v39 homeUUID:v195 error:a7];

              if (v89)
              {
                v192 = v89;
                v188 = v87;
                if ([v89 count])
                {
                  v90 = [v39 faceAttributes];
                  v91 = [v90 facemaskCategory];

                  v184 = v91;
                  v92 = [v91 label];
                  [v92 identifier];
                  v93 = v187 = v39;
                  int v183 = [v93 isEqualToString:*MEMORY[0x263F1F0F8]];

                  v94 = [HMIFaceCrop alloc];
                  v95 = [MEMORY[0x263F08C38] UUID];
                  v96 = [MEMORY[0x263EFF910] date];
                  v193 = -[HMIFaceCrop initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:](v94, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:", v95, v87, v96, 0.0, 0.0, 1.0, 1.0);

                  v189 = [HMIFaceprint alloc];
                  v185 = [MEMORY[0x263F08C38] UUID];
                  v97 = [v187 faceprint];
                  v98 = [v97 descriptorData];
                  v99 = +[HMIFaceprinter currentModelUUID];
                  v100 = [(HMIFaceCrop *)v193 UUID];
                  v190 = [(HMIFaceprint *)v189 initWithUUID:v185 data:v98 modelUUID:v99 faceCropUUID:v100];

                  faceAestheticQualityFilter = self->_faceAestheticQualityFilter;
                  id v205 = v35;
                  v102 = [(HMIFaceClassifierVIP *)self qualityPredictionFromSVMUsingFaceQualityFilterSVM:faceAestheticQualityFilter detectorConfidence:&v205 laplacian:v19 yaw:v21 boxSize:v24 error:v31];
                  id v103 = v205;

                  if (v102)
                  {
                    v104 = [MEMORY[0x263EFF9C0] set];
                    v196[0] = MEMORY[0x263EF8330];
                    v196[1] = 3221225472;
                    v196[2] = __78__HMIFaceClassifierVIP_classifyFaceEvent_pixelBuffer_fastMode_homeUUID_error___block_invoke;
                    v196[3] = &unk_26477C2D8;
                    v196[4] = self;
                    id v180 = v104;
                    id v197 = v180;
                    char v204 = v183;
                    id v105 = v102;
                    id v198 = v105;
                    id v178 = v12;
                    id v199 = v178;
                    float v202 = v21;
                    float v203 = v31;
                    v106 = v190;
                    v200 = v106;
                    v107 = v193;
                    v201 = v107;
                    objc_msgSend(v192, "na_map:", v196);
                    double v108 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
                    v193 = v107;
                    id v181 = v103;
                    double v182 = v108;
                    v191 = v106;
                    id v186 = v105;
                    if ([*(id *)&v108 count])
                    {
                      if (objc_msgSend(*(id *)&v108, "na_any:", &__block_literal_global_10))
                      {
                        v109 = v106;
                        v110 = v107;
                        v111 = (void *)MEMORY[0x22A641C70]();
                        v112 = self;
                        v113 = HMFGetOSLogHandle();
                        if (os_log_type_enabled(v113, OS_LOG_TYPE_INFO))
                        {
                          v114 = HMFGetLogIdentifier();
                          *(_DWORD *)buf = 138543618;
                          v220 = v114;
                          __int16 v221 = 2112;
                          double v222 = v182;
                          _os_log_impl(&dword_225DC6000, v113, OS_LOG_TYPE_INFO, "%{public}@Positive face classifications: %@ ", buf, 0x16u);
                        }
                        v107 = v110;
                        v106 = v109;
                      }
                      v115 = [HMIFaceRecognition alloc];
                      [v105 doubleValue];
                      double v117 = v116;
                      v118 = [(HMIFaceprint *)v106 UUID];
                      double v119 = v182;
                      v120 = v180;
                      uint64_t v121 = [(HMIFaceRecognition *)v115 initWithFaceCrop:v107 faceprint:v106 classifications:*(void *)&v182 predictedLinkedEntityUUIDs:v180 faceQualityScore:0 sessionEntityAssignment:v118 sessionEntityUUID:v117];

                      v207 = @"FaceFilteredState";
                      v122 = HMIFaceFilteredStateAsString(0);
                      v208 = v122;
                      v123 = [NSDictionary dictionaryWithObjects:&v208 forKeys:&v207 count:1];

                      v124 = [HMIVideoAnalyzerEventFace alloc];
                      v125 = [v178 confidence];
                      [v178 boundingBox];
                      double v127 = v126;
                      double v129 = v128;
                      double v131 = v130;
                      double v133 = v132;
                      v134 = [v178 yaw];
                      v135 = [v178 roll];
                      v136 = v124;
                      v137 = (void *)v121;
                      v66 = -[HMIVideoAnalyzerEventFace initWithConfidence:boundingBox:yaw:roll:faceRecognition:userInfo:](v136, "initWithConfidence:boundingBox:yaw:roll:faceRecognition:userInfo:", v125, v134, v135, v121, v123, v127, v129, v131, v133);

                      v39 = v187;
                    }
                    else
                    {
                      v158 = (void *)MEMORY[0x22A641C70]();
                      v159 = self;
                      v160 = HMFGetOSLogHandle();
                      if (os_log_type_enabled(v160, OS_LOG_TYPE_DEBUG))
                      {
                        v161 = HMFGetLogIdentifier();
                        *(_DWORD *)buf = 138543362;
                        v220 = v161;
                        _os_log_impl(&dword_225DC6000, v160, OS_LOG_TYPE_DEBUG, "%{public}@Face recognition set is empty", buf, 0xCu);
                      }
                      v39 = v187;
                      if (v183)
                      {
                        v211 = @"FaceFilteredState";
                        v162 = HMIFaceFilteredStateAsString(5);
                        v212 = v162;
                        v163 = NSDictionary;
                        v164 = &v212;
                        v165 = &v211;
                      }
                      else
                      {
                        v209 = @"FaceFilteredState";
                        v162 = HMIFaceFilteredStateAsString(2);
                        v210 = v162;
                        v163 = NSDictionary;
                        v164 = &v210;
                        v165 = &v209;
                      }
                      uint64_t v166 = objc_msgSend(v163, "dictionaryWithObjects:forKeys:count:", v164, v165, 1, v178);

                      v167 = [HMIVideoAnalyzerEventFace alloc];
                      v123 = [v179 confidence];
                      [v179 boundingBox];
                      double v169 = v168;
                      double v171 = v170;
                      double v173 = v172;
                      double v175 = v174;
                      v125 = [v179 yaw];
                      v134 = [v179 roll];
                      v176 = v167;
                      v137 = (void *)v166;
                      v66 = -[HMIVideoAnalyzerEventFace initWithConfidence:boundingBox:yaw:roll:faceRecognition:userInfo:](v176, "initWithConfidence:boundingBox:yaw:roll:faceRecognition:userInfo:", v123, v125, v134, 0, v166, v169, v171, v173, v175);
                      v120 = v180;
                      double v119 = v182;
                    }

                    v35 = v181;
                    id v16 = v194;
                    v154 = v191;
                    v89 = v192;
                    v157 = v184;
                    v155 = v186;
                  }
                  else
                  {
                    id v16 = v194;
                    v89 = v192;
                    if (a7) {
                      *a7 = v103;
                    }
                    HMIErrorLog(self, v103);
                    v66 = 0;
                    v35 = v103;
                    v155 = 0;
                    v39 = v187;
                    v157 = v184;
                    v154 = v190;
                  }
                }
                else
                {
                  v138 = (void *)MEMORY[0x22A641C70]();
                  v139 = self;
                  v140 = HMFGetOSLogHandle();
                  if (os_log_type_enabled(v140, OS_LOG_TYPE_ERROR))
                  {
                    v141 = HMFGetLogIdentifier();
                    *(_DWORD *)buf = 138543362;
                    v220 = v141;
                    _os_log_impl(&dword_225DC6000, v140, OS_LOG_TYPE_ERROR, "%{public}@personsModelPredictions is empty", buf, 0xCu);
                  }
                  v213 = @"FaceFilteredState";
                  v142 = HMIFaceFilteredStateAsString(4);
                  v214 = v142;
                  uint64_t v143 = [NSDictionary dictionaryWithObjects:&v214 forKeys:&v213 count:1];

                  v144 = [HMIVideoAnalyzerEventFace alloc];
                  uint64_t v145 = [v12 confidence];
                  [v12 boundingBox];
                  double v147 = v146;
                  double v149 = v148;
                  double v151 = v150;
                  double v153 = v152;
                  v154 = [v12 yaw];
                  v155 = [v12 roll];
                  v193 = (HMIFaceCrop *)v145;
                  uint64_t v156 = v145;
                  v157 = (void *)v143;
                  v66 = -[HMIVideoAnalyzerEventFace initWithConfidence:boundingBox:yaw:roll:faceRecognition:userInfo:](v144, "initWithConfidence:boundingBox:yaw:roll:faceRecognition:userInfo:", v156, v154, v155, 0, v143, v147, v149, v151, v153);
                  id v16 = v194;
                  v89 = v192;
                }

                v87 = v188;
              }
              else
              {
                v66 = 0;
                id v16 = v194;
              }
            }
            else
            {
              v66 = 0;
              id v16 = v194;
            }
          }
          else
          {
            v45 = v39;
            v46 = (void *)MEMORY[0x22A641C70]();
            v47 = self;
            v48 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
            {
              v49 = HMFGetLogIdentifier();
              v50 = [v39 faceprint];
              [v50 confidence];
              *(_DWORD *)buf = 138543618;
              v220 = v49;
              __int16 v221 = 2048;
              double v222 = v51;
              _os_log_impl(&dword_225DC6000, v48, OS_LOG_TYPE_DEBUG, "%{public}@Face below ANFR face quality threshold: ANFR confidence = %lf, discarding", buf, 0x16u);
            }
            CVPixelBufferRelease(v15);
            v215 = @"FaceFilteredState";
            v52 = HMIFaceFilteredStateAsString(3);
            v216 = v52;
            v53 = [NSDictionary dictionaryWithObjects:&v216 forKeys:&v215 count:1];

            v54 = [HMIVideoAnalyzerEventFace alloc];
            v55 = [v12 confidence];
            [v12 boundingBox];
            double v57 = v56;
            double v59 = v58;
            double v61 = v60;
            double v63 = v62;
            v64 = [v12 yaw];
            v65 = [v12 roll];
            v66 = -[HMIVideoAnalyzerEventFace initWithConfidence:boundingBox:yaw:roll:faceRecognition:userInfo:](v54, "initWithConfidence:boundingBox:yaw:roll:faceRecognition:userInfo:", v55, v64, v65, 0, v53, v57, v59, v61, v63);

            id v16 = v194;
            v39 = v45;
          }
        }
        else
        {
          CVPixelBufferRelease(v15);
          v66 = 0;
          id v16 = v194;
        }
      }
    }
    else
    {
      if (a7) {
        *a7 = v34;
      }
      HMIErrorLog(self, v35);
      CVPixelBufferRelease(v15);
      v66 = 0;
    }

    id v13 = v195;
  }
  else
  {
    v66 = 0;
  }

  return v66;
}

HMIFaceClassification *__78__HMIFaceClassifierVIP_classifyFaceEvent_pixelBuffer_fastMode_homeUUID_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [v3 confidence];
  [v4 floatValue];
  float v6 = v5;

  double v7 = v6;
  uint64_t v8 = [*(id *)(a1 + 32) classificationThresholdKnown];
  if (v9 < v7)
  {
    v10 = [v3 personUUID];
    v11 = [v3 linkedEntityUUID];

    if (v11)
    {
      id v12 = *(void **)(a1 + 40);
      id v13 = [v3 linkedEntityUUID];
      [v12 addObject:v13];
    }
    if (!*(unsigned char *)(a1 + 88))
    {
      uint64_t v19 = 2;
      goto LABEL_14;
    }
    id v14 = (void *)MEMORY[0x22A641C70]();
    id v15 = *(id *)(a1 + 32);
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = HMFGetLogIdentifier();
      double v18 = [v3 sourceUUID];
      int v50 = 138543874;
      float v51 = v17;
      __int16 v52 = 2112;
      v53 = v18;
      __int16 v54 = 2112;
      double v55 = *(double *)&v10;
      _os_log_impl(&dword_225DC6000, v16, OS_LOG_TYPE_INFO, "%{public}@Positively classified face with facemask: (sourceUUID: %@, personUUID: %@)", (uint8_t *)&v50, 0x20u);
    }
    uint64_t v19 = 2;
LABEL_8:

LABEL_14:
    double v24 = [HMIFaceClassification alloc];
    double v25 = [v3 sourceUUID];
    double v26 = [*(id *)(a1 + 64) UUID];
    double v27 = [(HMIFaceClassification *)v24 initWithUUID:v10 sourceUUID:v25 sessionEntityUUID:v26 faceCrop:*(void *)(a1 + 72) faceprint:*(void *)(a1 + 64) confidence:v19 familiarity:v7];

    goto LABEL_20;
  }
  if (*(unsigned char *)(a1 + 88))
  {
    float v20 = (void *)MEMORY[0x22A641C70](v8);
    id v21 = *(id *)(a1 + 32);
    char v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      double v23 = HMFGetLogIdentifier();
      int v50 = 138543362;
      float v51 = v23;
      _os_log_impl(&dword_225DC6000, v22, OS_LOG_TYPE_INFO, "%{public}@Face removed from unknown & uncertain bucket: has facemask", (uint8_t *)&v50, 0xCu);
    }
  }
  else
  {
    uint64_t v28 = [*(id *)(a1 + 48) doubleValue];
    if (v29 >= 0.71)
    {
      uint64_t v41 = [*(id *)(a1 + 32) classificationThresholdUnknown];
      if (v42 <= v7
        || ([*(id *)(a1 + 56) confidence],
            double v43 = objc_claimAutoreleasedReturnValue(),
            [v43 value],
            double v45 = v44,
            v43,
            v45 <= 0.65))
      {
        id v14 = (void *)MEMORY[0x22A641C70](v41);
        id v15 = *(id *)(a1 + 32);
        id v16 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          v48 = HMFGetLogIdentifier();
          v49 = [*(id *)(a1 + 56) yaw];
          int v50 = 138543618;
          float v51 = v48;
          __int16 v52 = 2112;
          v53 = v49;
          _os_log_impl(&dword_225DC6000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Added to uncertain bucket yaw: %@", (uint8_t *)&v50, 0x16u);
        }
        v10 = 0;
        uint64_t v19 = 1;
      }
      else
      {
        id v14 = (void *)MEMORY[0x22A641C70]();
        id v15 = *(id *)(a1 + 32);
        id v16 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          v46 = HMFGetLogIdentifier();
          v47 = [*(id *)(a1 + 56) yaw];
          int v50 = 138543618;
          float v51 = v46;
          __int16 v52 = 2112;
          v53 = v47;
          _os_log_impl(&dword_225DC6000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Added to unknown bucket yaw: %@", (uint8_t *)&v50, 0x16u);
        }
        uint64_t v19 = 0;
        v10 = 0;
      }
      goto LABEL_8;
    }
    float v20 = (void *)MEMORY[0x22A641C70](v28);
    id v30 = *(id *)(a1 + 32);
    float v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      v32 = HMFGetLogIdentifier();
      v33 = [*(id *)(a1 + 56) confidence];
      [v33 value];
      v35 = v34;
      double v36 = *(float *)(a1 + 80);
      double v37 = [*(id *)(a1 + 56) yaw];
      [v37 doubleValue];
      double v38 = *(float *)(a1 + 84);
      int v50 = 138544386;
      float v51 = v32;
      __int16 v52 = 2048;
      v53 = v35;
      __int16 v54 = 2048;
      double v55 = v36;
      __int16 v56 = 2048;
      uint64_t v57 = v39;
      __int16 v58 = 2048;
      double v59 = v38;
      _os_log_impl(&dword_225DC6000, v31, OS_LOG_TYPE_INFO, "%{public}@Face removed from unknown and uncertian bucket, SSD confidence = %f, entropy of laplacian = %f, Face yaw = %f, box size: %f", (uint8_t *)&v50, 0x34u);
    }
  }
  double v27 = 0;
LABEL_20:

  return v27;
}

BOOL __78__HMIFaceClassifierVIP_classifyFaceEvent_pixelBuffer_fastMode_homeUUID_error___block_invoke_55(uint64_t a1, void *a2)
{
  return [a2 familiarity] == 2;
}

- (HMIFaceprinter)faceprinter
{
  return (HMIFaceprinter *)objc_getProperty(self, a2, 8, 1);
}

- (HMIFaceQualityFilterSVM)faceRecognizabilityFilter
{
  return (HMIFaceQualityFilterSVM *)objc_getProperty(self, a2, 16, 1);
}

- (HMIFaceQualityFilterSVM)faceAestheticQualityFilter
{
  return (HMIFaceQualityFilterSVM *)objc_getProperty(self, a2, 24, 1);
}

- (double)classificationThresholdKnown
{
  return self->_classificationThresholdKnown;
}

- (double)classificationThresholdUnknown
{
  return self->_classificationThresholdUnknown;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceAestheticQualityFilter, 0);
  objc_storeStrong((id *)&self->_faceRecognizabilityFilter, 0);
  objc_storeStrong((id *)&self->_faceprinter, 0);
}

@end