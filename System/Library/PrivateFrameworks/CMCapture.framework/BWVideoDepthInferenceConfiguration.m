@interface BWVideoDepthInferenceConfiguration
- ($2825F4736939C4A6D3AD43837233062D)featuresDimensions;
- ($2825F4736939C4A6D3AD43837233062D)inputDimensions;
- ($2825F4736939C4A6D3AD43837233062D)outputDimensions;
- (ADEspressoStereoV2InferenceDescriptor)stereoV2inferenceDescriptor;
- (BOOL)requiresAppleDepthPostProcessing;
- (BOOL)requiresCroppingOfDepthBuffer;
- (BOOL)requiresVerticalFlipOfDepthBuffer;
- (BOOL)sourceIsNuri;
- (BWVideoDepthInferenceConfiguration)initWithConcurrencyWidth:(unint64_t)a3 videoDepthLayout:(int)a4 captureDevice:(id)a5 backpressureEvent:(id)a6;
- (BWVideoDepthInferenceConfiguration)initWithConcurrencyWidth:(unint64_t)a3 videoDepthLayout:(int)a4 captureDevice:(id)a5 overrideOutputDimensions:(id)a6 backpressureEvent:(id)a7;
- (BWVideoDepthInferenceConfiguration)initWithConcurrencyWidth:(unint64_t)a3 videoDepthLayout:(int)a4 captureDevice:(id)a5 requiresCroppingOfDepthBuffer:(BOOL)a6 requiresVerticalFlipOfDepthBuffer:(BOOL)a7 backpressureEvent:(id)a8;
- (MTLEvent)backpressureEvent;
- (NSDictionary)cameraInfoByPortType;
- (NSString)portType;
- (float)networkBias;
- (int)videoDepthAlgorithm;
- (int)videoDepthLayout;
- (unint64_t)concurrencyWidth;
- (unsigned)featuresPixelFormat;
- (unsigned)outputPixelFormat;
- (unsigned)temporalDepthInputPixelFormat;
- (void)dealloc;
- (void)setRequiresAppleDepthPostProcessing:(BOOL)a3;
- (void)setSourceIsNuri:(BOOL)a3;
@end

@implementation BWVideoDepthInferenceConfiguration

- (BWVideoDepthInferenceConfiguration)initWithConcurrencyWidth:(unint64_t)a3 videoDepthLayout:(int)a4 captureDevice:(id)a5 requiresCroppingOfDepthBuffer:(BOOL)a6 requiresVerticalFlipOfDepthBuffer:(BOOL)a7 backpressureEvent:(id)a8
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  v60.receiver = self;
  v60.super_class = (Class)BWVideoDepthInferenceConfiguration;
  v14 = [(BWInferenceConfiguration *)&v60 initWithInferenceType:109];
  if (!v14) {
    return v14;
  }
  id v51 = a8;
  unint64_t v52 = a3;
  BOOL v49 = a6;
  BOOL v50 = a7;
  v14->_cameraInfoByPortType = (NSDictionary *)(id)[a5 cameraInfoByPortType];
  v14->_videoDepthAlgorithm = -1;
  id v55 = a5;
  v14->_portType = 0;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  v15 = (void *)[a5 activePortTypes];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v56 objects:v61 count:16];
  if (!v16)
  {
    uint64_t v21 = -1;
    goto LABEL_21;
  }
  uint64_t v17 = v16;
  uint64_t v18 = *(void *)v57;
  uint64_t v19 = *MEMORY[0x1E4F52DF0];
  uint64_t v20 = *MEMORY[0x1E4F52DE8];
  v53 = (NSString *)*MEMORY[0x1E4F52DD8];
  uint64_t v54 = *MEMORY[0x1E4F52E00];
  uint64_t v21 = -1;
  while (2)
  {
    for (uint64_t i = 0; i != v17; ++i)
    {
      if (*(void *)v57 != v18) {
        objc_enumerationMutation(v15);
      }
      v23 = *(void **)(*((void *)&v56 + 1) + 8 * i);
      if ([v23 isEqual:v19])
      {
        int v25 = 0;
        uint64_t v21 = 1;
        goto LABEL_20;
      }
      if (![v23 isEqual:v20])
      {
        if (([v23 isEqual:v54] & 1) == 0) {
          continue;
        }
        int v25 = 2;
        uint64_t v21 = 2;
LABEL_20:
        v14->_videoDepthAlgorithm = v25;
        v14->_portType = (NSString *)v23;
        goto LABEL_21;
      }
      v14->_videoDepthAlgorithm = 1;
      objc_msgSend((id)objc_msgSend(v55, "zoomCommandHandler"), "requestedZoomFactorWithoutFudge");
      if (v24 == 4.0)
      {
        v14->_videoDepthAlgorithm = 3;
        uint64_t v21 = 3;
      }
      else
      {
        uint64_t v21 = 0;
      }
      v14->_portType = v53;
    }
    uint64_t v17 = [v15 countByEnumeratingWithState:&v56 objects:v61 count:16];
    if (v17) {
      continue;
    }
    break;
  }
LABEL_21:
  if (a4 == 1)
  {
    uint64_t v28 = 1;
    unint64_t v26 = v52;
    v27 = v55;
LABEL_25:
    if ([v27 depthType] == 3)
    {
      id v29 = (id)[objc_alloc((Class)getADStereoV2PipelineParametersClass()) init];
      v30 = (ADEspressoStereoV2InferenceDescriptor *)(id)objc_msgSend((id)objc_msgSend(objc_alloc((Class)getADStereoV2PipelineClass()), "initWithParameters:", v29), "inferenceDescriptor");
      v14->_stereoV2inferenceDescriptor = v30;
      objc_msgSend((id)objc_msgSend((id)-[ADEspressoStereoV2InferenceDescriptor disparityOutput](v30, "disparityOutput"), "imageDescriptor"), "sizeForLayout:", 255);
      v14->_inputDimensions.width = (int)v31;
      v14->_inputDimensions.height = (int)v32;
      v14->_outputDimensions.width = (int)v31;
      v14->_outputDimensions.height = (int)v32;
      v14->_outputPixelFormat = objc_msgSend((id)objc_msgSend((id)-[ADEspressoStereoV2InferenceDescriptor disparityOutput](v14->_stereoV2inferenceDescriptor, "disparityOutput"), "imageDescriptor"), "pixelFormat");
      v33 = objc_msgSend((id)-[ADEspressoStereoV2InferenceDescriptor depthFeaturesOutput](v14->_stereoV2inferenceDescriptor, "depthFeaturesOutput"), "imageDescriptor");
      [v33 sizeForLayout:255];
      v14->_featuresDimensions.width = (int)v34;
      v14->_featuresDimensions.height = (int)v35;
      v14->_featuresPixelFormat = [v33 pixelFormat];
    }
    else
    {
      id v36 = (id)[objc_alloc((Class)getADPCEDisparityColorPipelineClass()) initForInputSource:v21 metalDevice:0];
      v37 = (void *)[v36 inferenceDescriptor];
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v37, "disparityInput"), "imageDescriptor"), "sizeForLayout:", v28);
      double v39 = v38;
      double v41 = v40;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v37, "disparityOutput"), "imageDescriptor"), "sizeForLayout:", v28);
      v14->_inputDimensions.width = (int)v39;
      v14->_inputDimensions.height = (int)v41;
      v14->_outputDimensions.width = (int)v42;
      v14->_outputDimensions.height = (int)v43;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v37, "featuresOutput"), "imageDescriptor"), "sizeForLayout:", v28);
      v14->_featuresDimensions.width = (int)v44;
      v14->_featuresDimensions.height = (int)v45;
      v14->_featuresPixelFormat = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v37, "featuresOutput"), "imageDescriptor"), "pixelFormat");
      v14->_temporalDepthInputPixelFormat = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v37, "prevDisparityInput"), "imageDescriptor"), "pixelFormat");
      objc_msgSend((id)objc_msgSend(v36, "pipelineParameters"), "outputDisparityBias");
      v14->_networkBias = v46;
    }
    v47 = v14->_portType;
    v14->_concurrencyWidth = v26;
    v14->_videoDepthLayout = a4;
    v14->_requiresAppleDepthPostProcessing = 0;
    v14->_requiresCroppingOfDepthBuffer = v49;
    v14->_requiresVerticalFlipOfDepthBuffer = v50;
    v14->_backpressureEvent = (MTLEvent *)v51;
  }
  else
  {
    unint64_t v26 = v52;
    v27 = v55;
    if (!a4)
    {
      uint64_t v28 = 3;
      goto LABEL_25;
    }
    return 0;
  }
  return v14;
}

- (void)setSourceIsNuri:(BOOL)a3
{
  self->_sourceIsNuruint64_t i = a3;
}

- (void)setRequiresAppleDepthPostProcessing:(BOOL)a3
{
  self->_requiresAppleDepthPostProcessing = a3;
}

- ($2825F4736939C4A6D3AD43837233062D)outputDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_outputDimensions;
}

- (BOOL)requiresAppleDepthPostProcessing
{
  return self->_requiresAppleDepthPostProcessing;
}

- (unint64_t)concurrencyWidth
{
  return self->_concurrencyWidth;
}

- (int)videoDepthAlgorithm
{
  return self->_videoDepthAlgorithm;
}

- (BOOL)requiresVerticalFlipOfDepthBuffer
{
  return self->_requiresVerticalFlipOfDepthBuffer;
}

- (BOOL)requiresCroppingOfDepthBuffer
{
  return self->_requiresCroppingOfDepthBuffer;
}

- (NSString)portType
{
  return self->_portType;
}

- ($2825F4736939C4A6D3AD43837233062D)inputDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_inputDimensions;
}

- (unsigned)featuresPixelFormat
{
  return self->_featuresPixelFormat;
}

- ($2825F4736939C4A6D3AD43837233062D)featuresDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_featuresDimensions;
}

- (unsigned)temporalDepthInputPixelFormat
{
  return self->_temporalDepthInputPixelFormat;
}

- (BOOL)sourceIsNuri
{
  return self->_sourceIsNuri;
}

- (float)networkBias
{
  return self->_networkBias;
}

- (MTLEvent)backpressureEvent
{
  return self->_backpressureEvent;
}

- (int)videoDepthLayout
{
  return self->_videoDepthLayout;
}

- (BWVideoDepthInferenceConfiguration)initWithConcurrencyWidth:(unint64_t)a3 videoDepthLayout:(int)a4 captureDevice:(id)a5 backpressureEvent:(id)a6
{
  return [(BWVideoDepthInferenceConfiguration *)self initWithConcurrencyWidth:a3 videoDepthLayout:*(void *)&a4 captureDevice:a5 requiresCroppingOfDepthBuffer:0 requiresVerticalFlipOfDepthBuffer:0 backpressureEvent:a6];
}

- (BWVideoDepthInferenceConfiguration)initWithConcurrencyWidth:(unint64_t)a3 videoDepthLayout:(int)a4 captureDevice:(id)a5 overrideOutputDimensions:(id)a6 backpressureEvent:(id)a7
{
  result = [(BWVideoDepthInferenceConfiguration *)self initWithConcurrencyWidth:a3 videoDepthLayout:*(void *)&a4 captureDevice:a5 backpressureEvent:a7];
  if (result) {
    result->_outputDimensions = ($470D365275581EF16070F5A11344F73E)a6;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWVideoDepthInferenceConfiguration;
  [(BWInferenceConfiguration *)&v3 dealloc];
}

- (NSDictionary)cameraInfoByPortType
{
  return self->_cameraInfoByPortType;
}

- (ADEspressoStereoV2InferenceDescriptor)stereoV2inferenceDescriptor
{
  return self->_stereoV2inferenceDescriptor;
}

- (unsigned)outputPixelFormat
{
  return self->_outputPixelFormat;
}

@end