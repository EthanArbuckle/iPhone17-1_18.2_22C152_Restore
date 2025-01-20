@interface VNCoreMLModel
+ (VNCoreMLModel)modelForMLModel:(MLModel *)model error:(NSError *)error;
- (BOOL)wantsSequencedRequestObservationsRecording;
- (MLModel)model;
- (MLObjectBoundingBoxOutputDescription)boundingBoxOutputDescription;
- (NSArray)supportedComputeDevices;
- (NSDictionary)detectionPrintInputDescriptions;
- (NSObject)cachingIdentifier;
- (NSString)inputImageFeatureName;
- (NSString)inputImageKey;
- (NSString)inputScenePrintKey;
- (NSString)predictedFeatureKey;
- (NSString)predictedProbabilitiesKey;
- (VNOperationPoints)operationPoints;
- (VNRequestSpecifier)detectionPrintRequestSpecifier;
- (VNRequestSpecifier)scenePrintRequestSpecifier;
- (id)_configuredMLPredictionOptionsForOptions:(void *)a3 error:;
- (id)featureProvider;
- (id)predictWithCVPixelBuffer:(__CVBuffer *)a3 options:(id)a4 error:(id *)a5;
- (id)sequencedRequestPreviousObservationsKey;
- (int)modelType;
- (int64_t)inputScenePrintMLMultiArrayDataType;
- (unint64_t)inputImageHeight;
- (unint64_t)inputImageWidth;
- (unsigned)inputImageFormat;
- (void)setFeatureProvider:(id)featureProvider;
- (void)setInputImageFeatureName:(NSString *)inputImageFeatureName;
- (void)setInputImageKey:(id)a3;
- (void)setInputScenePrintKey:(id)a3;
- (void)setModel:(id)a3;
- (void)setModelType:(int)a3;
- (void)setPredictedFeatureKey:(id)a3;
@end

@implementation VNCoreMLModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectionPrintInputDescriptions, 0);
  objc_storeStrong((id *)&self->_detectionPrintRequestSpecifier, 0);
  objc_storeStrong((id *)&self->_inputScenePrintKey, 0);
  objc_storeStrong((id *)&self->_scenePrintRequestSpecifier, 0);
  objc_storeStrong((id *)&self->_boundingBoxOutputDescription, 0);
  objc_storeStrong((id *)&self->_predictedProbabilitiesKey, 0);
  objc_storeStrong((id *)&self->_predictedFeatureKey, 0);
  objc_storeStrong((id *)&self->_inputImageKey, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_featureProvider, 0);
  objc_storeStrong((id *)&self->_operationPoints, 0);

  objc_storeStrong((id *)&self->_uuidStringForCacheIdentifier, 0);
}

- (NSDictionary)detectionPrintInputDescriptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (VNRequestSpecifier)detectionPrintRequestSpecifier
{
  return (VNRequestSpecifier *)objc_getProperty(self, a2, 120, 1);
}

- (int64_t)inputScenePrintMLMultiArrayDataType
{
  return self->_inputScenePrintMLMultiArrayDataType;
}

- (void)setInputScenePrintKey:(id)a3
{
}

- (NSString)inputScenePrintKey
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (VNRequestSpecifier)scenePrintRequestSpecifier
{
  return (VNRequestSpecifier *)objc_getProperty(self, a2, 96, 1);
}

- (unsigned)inputImageFormat
{
  return self->_inputImageFormat;
}

- (unint64_t)inputImageHeight
{
  return self->_inputImageHeight;
}

- (unint64_t)inputImageWidth
{
  return self->_inputImageWidth;
}

- (MLObjectBoundingBoxOutputDescription)boundingBoxOutputDescription
{
  return (MLObjectBoundingBoxOutputDescription *)objc_getProperty(self, a2, 72, 1);
}

- (NSString)predictedProbabilitiesKey
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPredictedFeatureKey:(id)a3
{
}

- (NSString)predictedFeatureKey
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setInputImageKey:(id)a3
{
}

- (NSString)inputImageKey
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setModelType:(int)a3
{
  self->_modelType = a3;
}

- (int)modelType
{
  return self->_modelType;
}

- (void)setModel:(id)a3
{
}

- (MLModel)model
{
  return (MLModel *)objc_getProperty(self, a2, 40, 1);
}

- (void)setFeatureProvider:(id)featureProvider
{
}

- (id)featureProvider
{
  return self->_featureProvider;
}

- (VNOperationPoints)operationPoints
{
  return (VNOperationPoints *)objc_getProperty(self, a2, 16, 1);
}

- (id)sequencedRequestPreviousObservationsKey
{
  id v3 = [NSString alloc];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = (void *)[v3 initWithFormat:@"%@:UUID=%@", v5, self->_uuidStringForCacheIdentifier];

  return v6;
}

- (BOOL)wantsSequencedRequestObservationsRecording
{
  return 0;
}

- (NSObject)cachingIdentifier
{
  return self->_uuidStringForCacheIdentifier;
}

- (id)predictWithCVPixelBuffer:(__CVBuffer *)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v9 = [VNPixelBufferMLFeatureProvider alloc];
  inputImageKey = self->_inputImageKey;
  v11 = [(VNCoreMLModel *)self featureProvider];
  v12 = [(VNPixelBufferMLFeatureProvider *)v9 initWithPixelBuffer:a3 forKey:inputImageKey originalFeatureProvider:v11];

  v13 = -[VNCoreMLModel _configuredMLPredictionOptionsForOptions:error:](self, v8, a5);
  if (v13)
  {
    v14 = [(VNCoreMLModel *)self model];
    v15 = [v14 predictionFromFeatures:v12 options:v13 error:a5];
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)_configuredMLPredictionOptionsForOptions:(void *)a3 error:
{
  id v5 = a2;
  if (a1)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1E9E0]);
    v7 = @"VNComputeStageMain";
    id v8 = [v5 objectForKeyedSubscript:@"VNDetectorOption_ComputeStageDeviceAssignments"];
    v9 = [v8 objectForKeyedSubscript:@"VNComputeStageMain"];
    if (v9)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v10 = [v9 computeDevice];

        v9 = (void *)v10;
      }
      v11 = [a1 supportedComputeDevices];
      if (([v11 containsObject:v9] & 1) == 0)
      {
        if (a3)
        {
          *a3 = +[VNError errorForUnsupportedComputeDevice:v9];
        }

        id v12 = 0;
        goto LABEL_11;
      }
      objc_msgSend(v6, "setUsesCPUOnly:", +[VNComputeDeviceUtilities isCPUComputeDevice:](VNComputeDeviceUtilities, "isCPUComputeDevice:", v9));
    }
    id v12 = v6;
LABEL_11:

    goto LABEL_12;
  }
  id v12 = 0;
LABEL_12:

  return v12;
}

- (NSString)inputImageFeatureName
{
  return self->_inputImageKey;
}

- (void)setInputImageFeatureName:(NSString *)inputImageFeatureName
{
  v13 = inputImageFeatureName;
  v4 = (NSString *)[(NSString *)v13 copy];
  inputImageKey = self->_inputImageKey;
  self->_inputImageKey = v4;

  id v6 = [(VNCoreMLModel *)self model];
  v7 = [v6 modelDescription];

  id v8 = [v7 inputDescriptionsByName];
  v9 = [v8 objectForKeyedSubscript:v13];
  uint64_t v10 = v9;
  if (v9 && [v9 type] == 4)
  {
    v11 = [v10 imageConstraint];
    id v12 = v11;
    if (v11)
    {
      self->_inputImageWidth = [v11 pixelsWide];
      self->_inputImageHeight = [v12 pixelsHigh];
      self->_inputImageFormat = [v12 pixelFormatType];
    }
  }
  else
  {
    self->_inputImageWidth = 0;
    self->_inputImageHeight = 0;
  }
}

- (NSArray)supportedComputeDevices
{
  v2 = [(VNCoreMLModel *)self model];
  id v3 = [v2 configuration];
  uint64_t v4 = [v3 computeUnits];

  unint64_t v5 = +[VNComputeDeviceUtilities computeDeviceTypesForMLComputeUnits:v4];

  return (NSArray *)+[VNComputeDeviceUtilities computeDevicesOfTypes:v5];
}

+ (VNCoreMLModel)modelForMLModel:(MLModel *)model error:(NSError *)error
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  v73 = model;
  unint64_t v5 = [VNCoreMLModel alloc];
  id v6 = v73;
  if (!v5
    || (v82.receiver = v5,
        v82.super_class = (Class)VNCoreMLModel,
        (id v7 = objc_msgSendSuper2(&v82, sel_init)) == 0))
  {
    id v28 = 0;
    v29 = v6;
    goto LABEL_66;
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F29128]);
  uint64_t v9 = [v8 UUIDString];
  uint64_t v10 = (void *)*((void *)v7 + 1);
  *((void *)v7 + 1) = v9;

  id v11 = [(MLModel *)v6 modelDescription];
  id v12 = [v11 inputDescriptionsByName];
  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v83 objects:v87 count:16];
  if (!v14) {
    goto LABEL_11;
  }
  uint64_t v15 = *(void *)v84;
  while (2)
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if (*(void *)v84 != v15) {
        objc_enumerationMutation(v13);
      }
      v17 = *(void **)(*((void *)&v83 + 1) + 8 * i);
      v18 = [v13 objectForKeyedSubscript:v17];
      if ([v18 type] == 4)
      {
        v19 = [v18 imageConstraint];
        v20 = v19;
        if (!v19)
        {

          goto LABEL_20;
        }
        *((void *)v7 + 10) = [v19 pixelsWide];
        *((void *)v7 + 11) = [v20 pixelsHigh];
        *((_DWORD *)v7 + 7) = [v20 pixelFormatType];
        uint64_t v21 = [v17 copy];
        v22 = (void *)*((void *)v7 + 6);
        *((void *)v7 + 6) = v21;

        uint64_t v23 = +[VNOperationPoints operationPointsForMLModel:v6 error:error];
        v24 = (void *)*((void *)v7 + 2);
        *((void *)v7 + 2) = v23;

        if (!*((void *)v7 + 2)) {
          goto LABEL_22;
        }
        v25 = [v11 predictedProbabilitiesName];
        v69 = v25;
        if ([v25 length]) {
          objc_storeStrong((id *)v7 + 8, v25);
        }
        obuint64_t j = [v11 predictedFeatureName];
        uint64_t v26 = [(MLModel *)v6 objectBoundingBoxOutputDescription];
        v27 = (void *)*((void *)v7 + 9);
        *((void *)v7 + 9) = v26;

        if (*((void *)v7 + 9))
        {
          *((_DWORD *)v7 + 6) = 3;
        }
        else if (obj)
        {
          objc_storeStrong((id *)v7 + 7, obj);
          *((_DWORD *)v7 + 6) = 0;
        }
        else
        {
          v30 = [v11 outputDescriptionsByName];
          *((_DWORD *)v7 + 6) = 1;
          long long v80 = 0u;
          long long v81 = 0u;
          long long v78 = 0u;
          long long v79 = 0u;
          id v31 = v30;
          uint64_t v32 = [v31 countByEnumeratingWithState:&v78 objects:v87 count:16];
          if (v32)
          {
            uint64_t v33 = *(void *)v79;
            do
            {
              for (uint64_t j = 0; j != v32; ++j)
              {
                if (*(void *)v79 != v33) {
                  objc_enumerationMutation(v31);
                }
                v35 = [v31 objectForKeyedSubscript:*(void *)(*((void *)&v78 + 1) + 8 * j)];
                if ([v35 type] == 4) {
                  *((_DWORD *)v7 + 6) = 2;
                }
              }
              uint64_t v32 = [v31 countByEnumeratingWithState:&v78 objects:v87 count:16];
            }
            while (v32);
          }
        }
        v36 = [(MLModel *)v6 visionFeaturePrintInfo];
        v37 = v36;
        v29 = v6;
        if (!v36) {
          goto LABEL_63;
        }
        v71 = v36;
        v29 = [v36 postVisionFeaturePrintModel];

        v72 = [v37 featureExtractorParameters];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v68 = v72;
          if (objc_opt_respondsToSelector())
          {
            v38 = [v68 requestClassName];
          }
          else
          {
            v38 = @"VNCreateSceneprintRequest";
          }
          v67 = v38;
          uint64_t v46 = +[VNRequestSpecifier specifierForRequestClassName:revision:error:](VNRequestSpecifier, "specifierForRequestClassName:revision:error:", v38, [v68 scenePrintVersion], error);
          v47 = (void *)*((void *)v7 + 12);
          *((void *)v7 + 12) = v46;

          v48 = (void *)*((void *)v7 + 12);
          if (v48 && [v48 representsSupportedRequestAndReturnError:error])
          {
            v49 = [v29 modelDescription];
            v50 = [v49 inputDescriptionsByName];

            long long v76 = 0u;
            long long v77 = 0u;
            long long v74 = 0u;
            long long v75 = 0u;
            id v51 = v50;
            uint64_t v52 = [v51 countByEnumeratingWithState:&v74 objects:&v83 count:16];
            if (v52)
            {
              uint64_t v53 = *(void *)v75;
              while (2)
              {
                for (uint64_t k = 0; k != v52; ++k)
                {
                  if (*(void *)v75 != v53) {
                    objc_enumerationMutation(v51);
                  }
                  v55 = *(void **)(*((void *)&v74 + 1) + 8 * k);
                  v56 = [v51 objectForKeyedSubscript:v55];
                  if ([v56 type] == 5)
                  {
                    objc_storeStrong((id *)v7 + 13, v55);
                    v37 = v71;
                    v65 = [v56 multiArrayConstraint];
                    *((void *)v7 + 14) = [v65 dataType];

                    goto LABEL_61;
                  }

                  v37 = v71;
                }
                uint64_t v52 = [v51 countByEnumeratingWithState:&v74 objects:&v83 count:16];
                if (v52) {
                  continue;
                }
                break;
              }
            }
LABEL_61:

            *((_DWORD *)v7 + 6) = 4;
            goto LABEL_62;
          }

LABEL_58:
          id v28 = 0;
LABEL_64:

          goto LABEL_65;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v68 = v72;
          uint64_t v39 = +[VNRequestSpecifier specifierForRequestClassName:revision:error:](VNRequestSpecifier, "specifierForRequestClassName:revision:error:", @"VNCreateDetectionprintRequest", [v68 objectPrintVersion], error);
          v40 = (void *)*((void *)v7 + 15);
          *((void *)v7 + 15) = v39;

          v41 = (void *)*((void *)v7 + 15);
          if (!v41 || ![v41 representsSupportedRequestAndReturnError:error]) {
            goto LABEL_58;
          }
          v42 = [v29 modelDescription];
          v43 = [v42 inputDescriptionsByName];
          uint64_t v44 = [v43 copy];
          v45 = (void *)*((void *)v7 + 16);
          *((void *)v7 + 16) = v44;

          if (!*((void *)v7 + 16))
          {
            if (error)
            {
              *error = +[VNError errorForInvalidModelWithLocalizedDescription:@"The FeaturePrint input descriptions ares not available."];
            }
            goto LABEL_58;
          }
          *((_DWORD *)v7 + 6) = 5;
        }
        else
        {
          v57 = (objc_class *)objc_opt_class();
          NSStringFromClass(v57);
          id v68 = objc_claimAutoreleasedReturnValue();
          uint64_t v58 = [v68 UTF8String];
          VNValidatedLog(2, @"CoreML model has a FeaturePrint with an unsupported feature extractor class %s", v59, v60, v61, v62, v63, v64, v58);
        }
LABEL_62:

LABEL_63:
        objc_storeStrong((id *)v7 + 5, v29);
        id v28 = v7;
        goto LABEL_64;
      }
    }
    uint64_t v14 = [v13 countByEnumeratingWithState:&v83 objects:v87 count:16];
    if (v14) {
      continue;
    }
    break;
  }
LABEL_11:

LABEL_20:
  if (error)
  {
    +[VNError errorWithCode:15 message:@"The model does not have a valid input feature of type image"];
    id v28 = 0;
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_22:
    id v28 = 0;
  }
  v29 = v6;
LABEL_65:

LABEL_66:

  return (VNCoreMLModel *)v28;
}

@end