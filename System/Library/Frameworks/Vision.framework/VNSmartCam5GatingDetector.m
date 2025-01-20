@interface VNSmartCam5GatingDetector
+ (BOOL)providesSceneLabelsForConfiguration:(id)a3;
+ (BOOL)providesSegmentationLabelsForConfiguration:(id)a3;
+ (id)_inferenceNetworkDescriptorForConfiguration:(id)a3 error:(id *)a4;
+ (id)inputImageBlobNameForConfiguration:(id)a3;
+ (id)modelPathForConfiguration:(id)a3 error:(id *)a4;
+ (id)sceneLabelsFilePathForConfiguration:(id)a3 error:(id *)a4;
+ (id)segmentationLabelsFilePathForConfiguration:(id)a3 error:(id *)a4;
+ (unsigned)analysisPixelFormatTypeForConfiguration:(id)a3;
- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4;
- (BOOL)configureImageAnalyzerOptions:(void *)a3 error:(id *)a4;
- (NSArray)supportedDocumentElementIdentifiers;
- (id)observationsForLastAnalysisOfImageAnalyzer:(void *)a3 processOptions:(id)a4 originatingRequestSpecifier:(id)a5 qosClass:(unsigned int)a6 error:(id *)a7;
- (id)supportedClassificationIdentifiersWithOptions:(id)a3 error:(id *)a4;
- (uint64_t)_recordRecognizedObjectObservationsWithIdentifier:(void *)a3 inObservationsArray:(void *)a4 sceneLabelToConfidenceMap:(uint64x2_t *)a5 segmentationTensor:(uint64_t *)a6 segmentationChannelLabels:(void *)a7 originatingRequestSpecifier:(unsigned int)a8 qosClass:(void *)a9 session:(void *)a10 error:;
- (unint64_t)defaultImageCropAndScaleOption;
- (unsigned)analysisTypesForProcessOptions:(id)a3;
@end

@implementation VNSmartCam5GatingDetector

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boundingBoxGenerator, 0);
  objc_storeStrong((id *)&self->_documentIdentifierToSceneLabels, 0);

  objc_storeStrong((id *)&self->_inferenceNetworkDescriptor, 0);
}

- (id)observationsForLastAnalysisOfImageAnalyzer:(void *)a3 processOptions:(id)a4 originatingRequestSpecifier:(id)a5 qosClass:(unsigned int)a6 error:(id *)a7
{
  uint64_t v8 = *(void *)&a6;
  id v11 = a4;
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v13 = [v11 objectForKeyedSubscript:@"VNSmartCam5GatingDetectorProcessingOption_ClassificationEnabled"];
  int v14 = [v13 BOOLValue];

  if (v14)
  {
    id v15 = v11;
    if (!self)
    {
LABEL_58:

      goto LABEL_59;
    }
    v16 = +[VNValidationUtilities originatingRequestSpecifierForKey:@"VNSmartCam5GatingDetectorProcessingOption_ClassificationOriginatingRequestSpecifier" inOptions:v15 error:a7];
    if (v16)
    {
      v17 = +[VNValidationUtilities requiredObjectOfClass:objc_opt_class() forKey:@"VNSmartCam5GatingDetectorProcessingOption_ClassificationObservationsArray" inOptions:v15 error:a7];
      if (v17)
      {
        v18 = [(VNImageAnalyzerBasedDetector *)self observationsForSceneLabelsFromLastAnalysisOfImageAnalyzer:a3 identifierAcceptingBlock:0 operationPointsProvider:0 originatingRequestSpecifier:v16 qosClass:v8 error:a7];
        if (v18)
        {
          [v17 addObjectsFromArray:v18];
          id v19 = v18;
        }
      }
      else
      {
        v18 = 0;
      }
    }
    else
    {
      v18 = 0;
    }

    if (!v18) {
      goto LABEL_59;
    }
    [v12 addObjectsFromArray:v18];
  }
  v20 = [v11 objectForKeyedSubscript:@"VNSmartCam5GatingDetectorProcessingOption_DocumentRegionGatingEnabled"];
  int v21 = [v20 BOOLValue];

  v22 = [v11 objectForKeyedSubscript:@"VNSmartCam5GatingDetectorProcessingOption_TextRegionGatingEnabled"];
  int v23 = [v22 BOOLValue];

  v24 = [v11 objectForKeyedSubscript:@"VNSmartCam5GatingDetectorProcessingOption_MachineReadableCodesGatingEnabled"];
  int v25 = [v24 BOOLValue];

  if ((v21 | v23 | v25) != 1)
  {
LABEL_57:
    id v52 = v12;
    goto LABEL_60;
  }
  unsigned int v63 = v8;
  id v15 = v11;
  if (!self) {
    goto LABEL_58;
  }
  v26 = +[VNValidationUtilities requiredSessionInOptions:v15 error:a7];
  if (!v26)
  {
    id v31 = 0;
    goto LABEL_55;
  }
  id v64 = v26;
  v27 = +[VNValidationUtilities originatingRequestSpecifierForKey:@"VNSmartCam5GatingDetectorProcessingOption_GatingOriginatingRequestSpecifier" inOptions:v15 error:a7];
  if (v27)
  {
    id v62 = v27;
    v61 = +[VNValidationUtilities requiredObjectOfClass:objc_opt_class() forKey:@"VNSmartCam5GatingDetectorProcessingOption_GatingObservationsArray" inOptions:v15 error:a7];
    if (!v61)
    {
      id v31 = 0;
      v32 = 0;
LABEL_53:

      v27 = v62;
      goto LABEL_54;
    }
    vision::mod::ImageAnalyzer::getSceneLabelsConfidences((vision::mod::ImageAnalyzer *)v80, v28, (uint64_t)a3);
    memset(v79, 0, sizeof(v79));
    long long v77 = 0u;
    *(_OWORD *)v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v68 = 0u;
    memset(&v67, 0, sizeof(v67));
    if (v21)
    {
      v29 = [v15 objectForKeyedSubscript:@"VNSmartCam5GatingDetectorProcessingOption_DocumentRegionGatingGenerateSegmentationMask"];
      int v57 = [v29 BOOLValue];

      if (!v23) {
        goto LABEL_20;
      }
    }
    else
    {
      int v57 = 0;
      if (!v23)
      {
LABEL_20:
        int v56 = 0;
        if (v25)
        {
LABEL_21:
          v30 = [v15 objectForKeyedSubscript:@"VNSmartCam5GatingDetectorProcessingOption_MachineReadableCodesGatingGenerateSegmentationMask"];
          int v55 = [v30 BOOLValue];

          goto LABEL_28;
        }
LABEL_27:
        int v55 = 0;
LABEL_28:
        if (((v57 | v56) & 1) != 0 || v55)
        {
          vision::mod::ImageAnalyzer::getSceneSegmentation((vision::mod::ImageAnalyzer *)v65, (uint64_t)a3);
          free(v78[1]);
          v78[1] = 0;
          free(v79[1]);
          memset(&v79[1], 0, 32);
          free(v79[5]);
          memset(&v79[5], 0, 32);
          long long v76 = v65[8];
          long long v77 = v65[9];
          v78[0] = v66;
          long long v72 = v65[4];
          long long v73 = v65[5];
          long long v74 = v65[6];
          long long v75 = v65[7];
          long long v68 = v65[0];
          long long v69 = v65[1];
          long long v70 = v65[2];
          long long v71 = v65[3];
          vision::mod::ImageAnalyzer_Tensor3D::~ImageAnalyzer_Tensor3D((vision::mod::ImageAnalyzer_Tensor3D *)v65);
          LabelsList = vision::mod::ImageAnalyzer::getLabelsList((uint64_t)a3, 0x20u);
          if (&v67 != (std::vector<std::string> *)LabelsList) {
            std::vector<std::string>::__assign_with_size[abi:ne180100]<std::string*,std::string*>(&v67, (std::string *)*LabelsList, (long long *)LabelsList[1], 0xAAAAAAAAAAAAAAABLL * ((LabelsList[1] - *LabelsList) >> 3));
          }
        }
        id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        v60 = v35;
        if (!v21) {
          goto LABEL_65;
        }
        v36 = (uint64x2_t *)&v68;
        if (!v57) {
          v36 = 0;
        }
        v54 = v36;
        id v37 = v35;
        id v38 = v62;
        id v39 = v64;
        v58 = v37;
        LOBYTE(v37) = -[VNSmartCam5GatingDetector _recordRecognizedObjectObservationsWithIdentifier:inObservationsArray:sceneLabelToConfidenceMap:segmentationTensor:segmentationChannelLabels:originatingRequestSpecifier:qosClass:session:error:]((uint64_t)self, @"VNRecognizeDocumentElementIdentifierDocument", v37, v80, v54, (uint64_t *)&v67, v38, v63, v39, a7);

        v40 = v60;
        if (v37)
        {
LABEL_65:
          if (v23)
          {
            v41 = v56 ? (uint64x2_t *)&v68 : 0;
            id v42 = v60;
            id v43 = v62;
            id v44 = v64;
            int v45 = -[VNSmartCam5GatingDetector _recordRecognizedObjectObservationsWithIdentifier:inObservationsArray:sceneLabelToConfidenceMap:segmentationTensor:segmentationChannelLabels:originatingRequestSpecifier:qosClass:session:error:]((uint64_t)self, @"VNRecognizeDocumentElementIdentifierText", v42, v80, v41, (uint64_t *)&v67, v43, v63, v44, a7);

            if (!v45)
            {
              id v31 = 0;
              v40 = v60;
              v32 = v61;
              goto LABEL_51;
            }
          }
          v40 = v60;
          if (!v25)
          {
LABEL_47:
            v32 = v61;
            [v61 addObjectsFromArray:v60];
            id v31 = v60;
            goto LABEL_51;
          }
          if (v55) {
            v46 = (uint64x2_t *)&v68;
          }
          else {
            v46 = 0;
          }
          id v47 = v60;
          id v48 = v62;
          id v49 = v64;
          v59 = v47;
          if (-[VNSmartCam5GatingDetector _recordRecognizedObjectObservationsWithIdentifier:inObservationsArray:sceneLabelToConfidenceMap:segmentationTensor:segmentationChannelLabels:originatingRequestSpecifier:qosClass:session:error:]((uint64_t)self, @"VNRecognizeDocumentElementIdentifierQRCode", v47, v80, v46, (uint64_t *)&v67, v48, v63, v49, a7))
          {
            int v50 = -[VNSmartCam5GatingDetector _recordRecognizedObjectObservationsWithIdentifier:inObservationsArray:sceneLabelToConfidenceMap:segmentationTensor:segmentationChannelLabels:originatingRequestSpecifier:qosClass:session:error:]((uint64_t)self, @"VNRecognizeDocumentElementIdentifierAppCode", v47, v80, v46, (uint64_t *)&v67, v48, v63, v49, a7);

            if (v50) {
              goto LABEL_47;
            }
          }
          else
          {
          }
        }
        id v31 = 0;
        v32 = v61;
LABEL_51:

        *(void *)&v65[0] = &v67;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v65);
        vision::mod::ImageAnalyzer_Tensor3D::~ImageAnalyzer_Tensor3D((vision::mod::ImageAnalyzer_Tensor3D *)&v68);
        std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__deallocate_node((void **)v80[2]);
        v51 = (void *)v80[0];
        v80[0] = 0;
        if (v51) {
          operator delete(v51);
        }
        goto LABEL_53;
      }
    }
    v33 = [v15 objectForKeyedSubscript:@"VNSmartCam5GatingDetectorProcessingOption_TextRegionGatingGenerateSegmentationMask"];
    int v56 = [v33 BOOLValue];

    if (v25) {
      goto LABEL_21;
    }
    goto LABEL_27;
  }
  id v31 = 0;
LABEL_54:

  v26 = v64;
LABEL_55:

  if (v31)
  {
    [v12 addObjectsFromArray:v31];

    goto LABEL_57;
  }
LABEL_59:
  id v52 = 0;
LABEL_60:

  return v52;
}

- (uint64_t)_recordRecognizedObjectObservationsWithIdentifier:(void *)a3 inObservationsArray:(void *)a4 sceneLabelToConfidenceMap:(uint64x2_t *)a5 segmentationTensor:(uint64_t *)a6 segmentationChannelLabels:(void *)a7 originatingRequestSpecifier:(unsigned int)a8 qosClass:(void *)a9 session:(void *)a10 error:
{
  v119[1] = *MEMORY[0x1E4F143B8];
  id v13 = a2;
  id v96 = a3;
  id v97 = a7;
  id v98 = a9;
  uint64_t v81 = a1;
  v95 = v13;
  [*(id *)(a1 + 104) objectForKey:v13];
  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = [obj countByEnumeratingWithState:&v104 objects:v116 count:16];
  uint64_t v83 = 1;
  if (!v14) {
    goto LABEL_88;
  }
  uint64_t v93 = *(void *)v105;
LABEL_3:
  uint64_t v15 = 0;
  uint64_t v92 = v14;
  while (1)
  {
    if (*(void *)v105 != v93) {
      objc_enumerationMutation(obj);
    }
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[*(id *)(*((void *)&v104 + 1) + 8 * v15) UTF8String]);
    id v100 = v95;
    id v101 = v96;
    id v16 = v97;
    id v99 = v98;
    v17 = std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::find<std::string>(a4, (unsigned __int8 *)__p);
    if (!v17) {
      goto LABEL_20;
    }
    v18 = v17;
    uint64_t v19 = 0;
    v20 = (v103 & 0x80u) == 0 ? __p : (void **)__p[0];
    int v21 = (v103 & 0x80u) == 0 ? (char *)v103 : (char *)__p[1];
    while (1)
    {
      v22 = &(&-[VNSmartCam5GatingDetector _gatingConfidenceThresholdForSceneLabel:]::identifierThresholds)[v19];
      if ((&-[VNSmartCam5GatingDetector _gatingConfidenceThresholdForSceneLabel:]::identifierThresholds)[v19 + 1] == v21
        && !memcmp(*v22, v20, (size_t)v21))
      {
        break;
      }
      v19 += 3;
      if (v19 == 6) {
        goto LABEL_16;
      }
    }
    if (v22 == (char **)VNGenerateAnimalSegmentationRequestFeatureDog)
    {
LABEL_16:
      float v23 = 0.0;
      goto LABEL_19;
    }
    float v23 = *((float *)v22 + 4);
LABEL_19:
    float v24 = *((float *)v18 + 10);
    if (v24 < v23)
    {
LABEL_20:
      char v25 = 1;
      goto LABEL_69;
    }
    v26 = (CGRect *)operator new(0x20uLL);
    v27 = v26 + 1;
    CGRect *v26 = VNNormalizedIdentityRect;
    if (!a5
      || (uint64_t v28 = *a6,
          uint64_t v29 = a6[1],
          uint64_t v30 = std::__find_impl[abi:ne180100]<std::string const*,std::string const*,std::string,std::__identity>(*a6, v29, (unsigned __int8 **)__p), v30 == v29))
    {
      v59 = 0;
      goto LABEL_54;
    }
    int32x2_t v110 = vrev64_s32((int32x2_t)vcvt_f32_f64(vcvtq_f64_u64(a5[5])));
    int v109 = 0;
    memset(v117, 0, sizeof(v117));
    vision::mod::ImageAnalyzer_Tensor3D::getVImageBufferFromTensorChannel(v117, (uint64_t)a5, 0xAAAAAAAAAAAAAAABLL * ((v30 - v28) >> 3), (float *)&v110, &v109);
    unsigned int v108 = 0;
    CVPixelBufferRef DeepCopyCVPixelBufferFromVImageBuffer = ImageProcessing_createDeepCopyCVPixelBufferFromVImageBuffer((char **)v117, v109, (int *)&v108);
    if (DeepCopyCVPixelBufferFromVImageBuffer)
    {
      v32 = DeepCopyCVPixelBufferFromVImageBuffer;
      id v89 = v16;
      texture = v32;
      id v84 = v99;
      v33 = [VNImageBuffer alloc];
      v87 = [(VNImageBuffer *)v33 initWithCVPixelBuffer:v32 orientation:1 options:MEMORY[0x1E4F1CC08] session:v84];
      id v34 = objc_alloc(MEMORY[0x1E4F1CA60]);
      v119[0] = v87;
      id v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v119 count:1];
      v86 = objc_msgSend(v34, "initWithObjectsAndKeys:", v35, @"VNDetectorProcessOption_InputImageBuffers", v89, @"VNDetectorOption_OriginatingRequestSpecifier", 0);

      v36 = objc_msgSend(*(id *)(v81 + 112), "internalProcessUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", a8, v86, 0, a10, 0, 0.0, 0.0, 1.0, 1.0);
      id v37 = v36;
      if (v36)
      {
        if ([v36 count])
        {
          long long v114 = 0u;
          long long v115 = 0u;
          long long v113 = 0u;
          long long v112 = 0u;
          id v38 = v37;
          v80 = v37;
          uint64_t v39 = [v38 countByEnumeratingWithState:&v112 objects:v118 count:16];
          if (v39)
          {
            uint64_t v40 = *(void *)v113;
            v41 = (char *)v26;
            do
            {
              for (uint64_t i = 0; i != v39; ++i)
              {
                if (*(void *)v113 != v40) {
                  objc_enumerationMutation(v38);
                }
                [*(id *)(*((void *)&v112 + 1) + 8 * i) boundingBox];
                uint64_t v47 = v43;
                uint64_t v48 = v44;
                uint64_t v49 = v45;
                uint64_t v50 = v46;
                if (v41 >= (char *)v27)
                {
                  uint64_t v51 = (v41 - (char *)v26) >> 5;
                  unint64_t v52 = v51 + 1;
                  if ((unint64_t)(v51 + 1) >> 59) {
                    std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
                  }
                  if (((char *)v27 - (char *)v26) >> 4 > v52) {
                    unint64_t v52 = ((char *)v27 - (char *)v26) >> 4;
                  }
                  if ((unint64_t)((char *)v27 - (char *)v26) >= 0x7FFFFFFFFFFFFFE0) {
                    unint64_t v53 = 0x7FFFFFFFFFFFFFFLL;
                  }
                  else {
                    unint64_t v53 = v52;
                  }
                  if (v53) {
                    unint64_t v53 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<vImage_Buffer>>(v53);
                  }
                  else {
                    uint64_t v54 = 0;
                  }
                  int v55 = (void *)(v53 + 32 * v51);
                  *int v55 = v47;
                  v55[1] = v48;
                  v55[2] = v49;
                  v55[3] = v50;
                  if (v41 == (char *)v26)
                  {
                    v58 = (CGRect *)(v53 + 32 * v51);
                  }
                  else
                  {
                    unint64_t v56 = v53 + 32 * v51;
                    do
                    {
                      long long v57 = *((_OWORD *)v41 - 1);
                      v58 = (CGRect *)(v56 - 32);
                      *(_OWORD *)(v56 - 32) = *((_OWORD *)v41 - 2);
                      *(_OWORD *)(v56 - 16) = v57;
                      v41 -= 32;
                      v56 -= 32;
                    }
                    while (v41 != (char *)v26);
                  }
                  v27 = (CGRect *)(v53 + 32 * v54);
                  v41 = (char *)(v55 + 4);
                  if (v26) {
                    operator delete(v26);
                  }
                  v26 = v58;
                }
                else
                {
                  *(void *)v41 = v43;
                  *((void *)v41 + 1) = v44;
                  *((void *)v41 + 2) = v45;
                  *((void *)v41 + 3) = v46;
                  v41 += 32;
                }
              }
              uint64_t v39 = [v38 countByEnumeratingWithState:&v112 objects:v118 count:16];
            }
            while (v39);
          }
          else
          {
            v41 = (char *)v26;
          }

          v27 = (CGRect *)v41;
          id v37 = v80;
        }
        else
        {
          CGRect *v26 = VNNormalizedIdentityRect;
        }
      }

      if (v37)
      {
        v59 = [[VNPixelBufferObservation alloc] initWithOriginatingRequestSpecifier:v89 featureName:0 CVPixelBuffer:texture];
        char v77 = 1;
      }
      else
      {
        v59 = 0;
        char v77 = 0;
        char v111 = 0;
      }
      CVPixelBufferRelease(texture);
      if ((v77 & 1) == 0)
      {
LABEL_60:

        if (!v26) {
          goto LABEL_68;
        }
        goto LABEL_67;
      }
LABEL_54:
      v60 = [VNClassificationObservation alloc];
      *(float *)&double v61 = v24;
      id v62 = [(VNClassificationObservation *)v60 initWithOriginatingRequestSpecifier:v16 identifier:v100 confidence:v61];
      for (j = v26; j != v27; ++j)
      {
        double x = j->origin.x;
        double y = j->origin.y;
        double width = j->size.width;
        double height = j->size.height;
        v121.origin.double x = 0.0;
        v121.origin.double y = 0.0;
        v121.size.double width = 1.0;
        v121.size.double height = 1.0;
        v120.origin.double x = j->origin.x;
        v120.origin.double y = y;
        v120.size.double width = width;
        v120.size.double height = height;
        BOOL v68 = CGRectEqualToRect(v120, v121);
        long long v69 = [VNRecognizedObjectObservation alloc];
        *(void *)&v117[0] = v62;
        long long v70 = [MEMORY[0x1E4F1C978] arrayWithObjects:v117 count:1];
        if (v68) {
          long long v72 = 0;
        }
        else {
          long long v72 = v59;
        }
        *(float *)&double v71 = v24;
        long long v73 = -[VNRecognizedObjectObservation initWithOriginatingRequestSpecifier:boundingBox:confidence:labels:segmentationMask:groupId:](v69, "initWithOriginatingRequestSpecifier:boundingBox:confidence:labels:segmentationMask:groupId:", v16, v70, v72, 0, x, y, width, height, v71);

        [v101 addObject:v73];
      }
      char v111 = 1;

      goto LABEL_60;
    }
    if (a10)
    {
      uint64_t v74 = v108;
      long long v75 = __p;
      if ((v103 & 0x80u) != 0) {
        long long v75 = (void **)__p[0];
      }
      long long v76 = objc_msgSend(NSString, "stringWithFormat:", @"unable to create segmentation image for %s", v75);
      *a10 = +[VNError errorForOSStatus:v74 localizedDescription:v76];
    }
    char v111 = 0;
LABEL_67:
    operator delete(v26);
LABEL_68:
    char v25 = v111;
LABEL_69:

    if ((v25 & 1) == 0) {
      break;
    }
    if ((char)v103 < 0) {
      operator delete(__p[0]);
    }
    if (++v15 == v92)
    {
      uint64_t v78 = [obj countByEnumeratingWithState:&v104 objects:v116 count:16];
      uint64_t v14 = v78;
      if (!v78)
      {
        uint64_t v83 = 1;
        goto LABEL_88;
      }
      goto LABEL_3;
    }
  }
  if ((char)v103 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v83 = 0;
LABEL_88:

  return v83;
}

- (unsigned)analysisTypesForProcessOptions:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"VNSmartCam5GatingDetectorProcessingOption_ClassificationEnabled"];
  if ([v4 BOOLValue]) {
    goto LABEL_6;
  }
  v5 = [v3 objectForKeyedSubscript:@"VNSmartCam5GatingDetectorProcessingOption_DocumentRegionGatingEnabled"];
  if ([v5 BOOLValue])
  {
LABEL_5:

LABEL_6:
LABEL_7:
    unsigned int v7 = 2;
    goto LABEL_8;
  }
  v6 = [v3 objectForKeyedSubscript:@"VNSmartCam5GatingDetectorProcessingOption_TextRegionGatingEnabled"];
  if ([v6 BOOLValue])
  {

    goto LABEL_5;
  }
  id v13 = [v3 objectForKeyedSubscript:@"VNSmartCam5GatingDetectorProcessingOption_MachineReadableCodesGatingEnabled"];
  char v14 = [v13 BOOLValue];

  if (v14) {
    goto LABEL_7;
  }
  unsigned int v7 = 0;
LABEL_8:
  uint64_t v8 = [v3 objectForKeyedSubscript:@"VNSmartCam5GatingDetectorProcessingOption_DocumentRegionGatingGenerateSegmentationMask"];
  if (([v8 BOOLValue] & 1) == 0)
  {
    v9 = [v3 objectForKeyedSubscript:@"VNSmartCam5GatingDetectorProcessingOption_TextRegionGatingGenerateSegmentationMask"];
    if (![v9 BOOLValue])
    {
      id v11 = [v3 objectForKeyedSubscript:@"VNSmartCam5GatingDetectorProcessingOption_MachineReadableCodesGatingGenerateSegmentationMask"];
      char v12 = [v11 BOOLValue];

      if ((v12 & 1) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
LABEL_12:
  v7 |= 0x20u;
LABEL_13:

  return v7;
}

- (BOOL)configureImageAnalyzerOptions:(void *)a3 error:(id *)a4
{
  v10.receiver = self;
  v10.super_class = (Class)VNSmartCam5GatingDetector;
  BOOL v6 = [(VNImageAnalyzerBasedDetector *)&v10 configureImageAnalyzerOptions:a3 error:a4];
  if (v6)
  {
    id v7 = [(VisionCoreSmartCam5InferenceNetworkDescriptor *)self->_inferenceNetworkDescriptor sceneLabelsOutputBlobName];
    std::string::__assign_external((std::string *)a3 + 5, (const std::string::value_type *)[v7 UTF8String]);

    id v8 = [(VisionCoreSmartCam5InferenceNetworkDescriptor *)self->_inferenceNetworkDescriptor sceneSegmentationOutputBlobName];
    std::string::__assign_external((std::string *)a3 + 12, (const std::string::value_type *)[v8 UTF8String]);
  }
  return v6;
}

- (unint64_t)defaultImageCropAndScaleOption
{
  return 2;
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  v19[4] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(VNDetector *)self configurationOptions];
  id v8 = [(id)objc_opt_class() _inferenceNetworkDescriptorForConfiguration:v7 error:a4];
  inferenceNetworkDescriptor = self->_inferenceNetworkDescriptor;
  self->_inferenceNetworkDescriptor = v8;

  if (self->_inferenceNetworkDescriptor
    && (v17.receiver = self,
        v17.super_class = (Class)VNSmartCam5GatingDetector,
        [(VNImageAnalyzerBasedDetector *)&v17 completeInitializationForSession:v6 error:a4]))
  {
    v18[0] = @"VNRecognizeDocumentElementIdentifierDocument";
    v18[1] = @"VNRecognizeDocumentElementIdentifierText";
    v19[0] = &unk_1EF7A7D48;
    v19[1] = &unk_1EF7A7D60;
    v18[2] = @"VNRecognizeDocumentElementIdentifierQRCode";
    v18[3] = @"VNRecognizeDocumentElementIdentifierAppCode";
    v19[2] = &unk_1EF7A7D78;
    v19[3] = &unk_1EF7A7D90;
    objc_super v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:4];
    documentIdentifierToSceneLabels = self->_documentIdentifierToSceneLabels;
    self->_documentIdentifierToSceneLabels = v10;

    uint64_t v12 = [v6 detectorOfType:@"VNObjectnessBasedSaliencyHeatmapBoundingBoxGeneratorType" configuredWithOptions:v7 error:a4];
    p_boundingBoxGenerator = &self->_boundingBoxGenerator;
    char v14 = *p_boundingBoxGenerator;
    *p_boundingBoxGenerator = (VNSaliencyOHeatmapBoundingBoxGenerator *)v12;

    BOOL v15 = *p_boundingBoxGenerator != 0;
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (NSArray)supportedDocumentElementIdentifiers
{
  v4[4] = *MEMORY[0x1E4F143B8];
  v4[0] = @"VNRecognizeDocumentElementIdentifierDocument";
  v4[1] = @"VNRecognizeDocumentElementIdentifierText";
  v4[2] = @"VNRecognizeDocumentElementIdentifierQRCode";
  v4[3] = @"VNRecognizeDocumentElementIdentifierAppCode";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:4];

  return (NSArray *)v2;
}

- (id)supportedClassificationIdentifiersWithOptions:(id)a3 error:(id *)a4
{
  v4 = [(VNImageAnalyzerBasedDetector *)self supportedClassificationIdentifiersAcceptedByBlock:0 error:a4];

  return v4;
}

+ (id)segmentationLabelsFilePathForConfiguration:(id)a3 error:(id *)a4
{
  v5 = objc_msgSend(a1, "_inferenceNetworkDescriptorForConfiguration:error:", a3);
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 segmentationLabelsFileURL];
    id v8 = [v7 VisionCoreFileSystemPathAndReturnError:a4];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (BOOL)providesSegmentationLabelsForConfiguration:(id)a3
{
  return 1;
}

+ (unsigned)analysisPixelFormatTypeForConfiguration:(id)a3
{
  id v3 = [a1 _inferenceNetworkDescriptorForConfiguration:a3 error:0];
  v4 = [v3 onlyInputImage];
  unsigned int v5 = [v4 pixelFormatType];

  return v5;
}

+ (id)inputImageBlobNameForConfiguration:(id)a3
{
  id v3 = [a1 _inferenceNetworkDescriptorForConfiguration:a3 error:0];
  v4 = [v3 onlyInputImage];
  unsigned int v5 = [v4 name];

  return v5;
}

+ (id)sceneLabelsFilePathForConfiguration:(id)a3 error:(id *)a4
{
  unsigned int v5 = objc_msgSend(a1, "_inferenceNetworkDescriptorForConfiguration:error:", a3);
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 sceneLabelConfidencesOutput];
    id v8 = [v7 labelsFileURL];
    v9 = [v8 VisionCoreFileSystemPathAndReturnError:a4];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)providesSceneLabelsForConfiguration:(id)a3
{
  return 1;
}

+ (id)modelPathForConfiguration:(id)a3 error:(id *)a4
{
  unsigned int v5 = objc_msgSend(a1, "_inferenceNetworkDescriptorForConfiguration:error:", a3);
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 URL];
    id v8 = [v7 VisionCoreFileSystemPathAndReturnError:a4];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)_inferenceNetworkDescriptorForConfiguration:(id)a3 error:(id *)a4
{
  unsigned int v5 = +[VNFrameworkManager manager];
  id v6 = [v5 detectorDescriptorsCache];
  id v7 = [v6 objectForIdentifier:@"VNSmartCam5GatingDetector" creationBlock:&__block_literal_global_13382 error:a4];

  return v7;
}

uint64_t __79__VNSmartCam5GatingDetector__inferenceNetworkDescriptorForConfiguration_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4FB3F30] descriptorAndReturnError:a2];
}

@end