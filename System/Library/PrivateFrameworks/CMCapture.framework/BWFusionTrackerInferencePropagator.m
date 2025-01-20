@interface BWFusionTrackerInferencePropagator
- (BOOL)allowsAsyncPropagation;
- (BWFusionTrackerInferencePropagator)initWithInputVideoRequirement:(id)a3 outputTensorRequirements:(id)a4 operation:(int64_t)a5;
- (void)dealloc;
- (void)propagateInferenceResultsToInferenceDictionary:(id)a3 usingStorage:(id)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 propagationSampleBuffer:(opaqueCMSampleBuffer *)a6;
@end

@implementation BWFusionTrackerInferencePropagator

- (BWFusionTrackerInferencePropagator)initWithInputVideoRequirement:(id)a3 outputTensorRequirements:(id)a4 operation:(int64_t)a5
{
  v11.receiver = self;
  v11.super_class = (Class)BWFusionTrackerInferencePropagator;
  v8 = [(BWFusionTrackerInferencePropagator *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_operation = a5;
    v8->_outputTensorRequirements = (NSMutableDictionary *)a4;
    v9->_inputVideoRequirement = (BWInferenceVideoRequirement *)a3;
  }
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWFusionTrackerInferencePropagator;
  [(BWFusionTrackerInferencePropagator *)&v3 dealloc];
}

- (void)propagateInferenceResultsToInferenceDictionary:(id)a3 usingStorage:(id)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 propagationSampleBuffer:(opaqueCMSampleBuffer *)a6
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = [a4 pixelBufferForRequirement:self->_inputVideoRequirement];
  obuint64_t j = a6;
  v10 = objc_msgSend((id)CMGetAttachment(a6, @"FusionTrackerInput", 0), "highPriorityTrackerState");
  if (!v9) {
    goto LABEL_30;
  }
  objc_super v11 = v10;
  if ([v10 completed]) {
    goto LABEL_30;
  }
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  outputTensorRequirements = self->_outputTensorRequirements;
  uint64_t v14 = [(NSMutableDictionary *)outputTensorRequirements countByEnumeratingWithState:&v67 objects:v72 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v68;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v68 != v16) {
          objc_enumerationMutation(outputTensorRequirements);
        }
        uint64_t v18 = *(void *)(*((void *)&v67 + 1) + 8 * i);
        uint64_t v19 = objc_msgSend(a4, "tensorForRequirement:", -[NSMutableDictionary objectForKeyedSubscript:](self->_outputTensorRequirements, "objectForKeyedSubscript:", v18));
        FTEspressoBufferClass = (void *)getFTEspressoBufferClass();
        CGPoint v21 = *(CGPoint *)v19;
        long long v22 = *(_OWORD *)(v19 + 32);
        v57.size = *(CGSize *)(v19 + 16);
        long long v58 = v22;
        v57.origin = v21;
        long long v23 = *(_OWORD *)(v19 + 48);
        long long v24 = *(_OWORD *)(v19 + 64);
        long long v25 = *(_OWORD *)(v19 + 96);
        long long v61 = *(_OWORD *)(v19 + 80);
        long long v62 = v25;
        long long v59 = v23;
        long long v60 = v24;
        long long v26 = *(_OWORD *)(v19 + 112);
        long long v27 = *(_OWORD *)(v19 + 128);
        long long v28 = *(_OWORD *)(v19 + 144);
        uint64_t v66 = *(void *)(v19 + 160);
        long long v64 = v27;
        long long v65 = v28;
        long long v63 = v26;
        objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(FTEspressoBufferClass, "bufferWithEspressoBuffer:", &v57), v18);
      }
      uint64_t v15 = [(NSMutableDictionary *)outputTensorRequirements countByEnumeratingWithState:&v67 objects:v72 count:16];
    }
    while (v15);
  }
  int64_t operation = self->_operation;
  switch(operation)
  {
    case 1:
      targetRectForSampleBuffer(obj);
      if (!objc_msgSend(v11, "postProcessExemplarOutputs:forTargetRect:", v12)) {
        goto LABEL_28;
      }
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      obja = self->_outputTensorRequirements;
      uint64_t v33 = [(NSMutableDictionary *)obja countByEnumeratingWithState:&v53 objects:v71 count:16];
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = *(void *)v54;
        do
        {
          for (uint64_t j = 0; j != v34; ++j)
          {
            if (*(void *)v54 != v35) {
              objc_enumerationMutation(obja);
            }
            uint64_t v37 = *(void *)(*((void *)&v53 + 1) + 8 * j);
            uint64_t v38 = objc_msgSend(a4, "tensorForRequirement:", -[NSMutableDictionary objectForKeyedSubscript:](self->_outputTensorRequirements, "objectForKeyedSubscript:", v37));
            v39 = (void *)[MEMORY[0x1E4F1C9B8] dataWithBytes:*(void *)v38 length:bweis_storageLengthInBytes(v38)];
            uint64_t v66 = 0;
            long long v64 = 0u;
            long long v65 = 0u;
            long long v62 = 0u;
            long long v63 = 0u;
            long long v60 = 0u;
            long long v61 = 0u;
            long long v58 = 0u;
            long long v59 = 0u;
            memset(&v57, 0, sizeof(v57));
            CGPoint v40 = *(CGPoint *)v38;
            long long v41 = *(_OWORD *)(v38 + 32);
            v57.size = *(CGSize *)(v38 + 16);
            long long v58 = v41;
            v57.origin = v40;
            long long v42 = *(_OWORD *)(v38 + 48);
            long long v43 = *(_OWORD *)(v38 + 64);
            long long v44 = *(_OWORD *)(v38 + 96);
            long long v61 = *(_OWORD *)(v38 + 80);
            long long v62 = v44;
            long long v59 = v42;
            long long v60 = v43;
            long long v45 = *(_OWORD *)(v38 + 112);
            long long v46 = *(_OWORD *)(v38 + 128);
            long long v47 = *(_OWORD *)(v38 + 144);
            uint64_t v66 = *(void *)(v38 + 160);
            long long v64 = v46;
            long long v65 = v47;
            long long v63 = v45;
            *(void *)&v57.origin.x = [v39 bytes];
            objc_msgSend((id)objc_msgSend(v11, "sessionStorage"), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithBytes:objCType:", &v57, "{?=^v^v[4Q][4Q]QQQQQQQQQQi}"), v37);
            objc_msgSend((id)objc_msgSend(v11, "sessionStorage"), "setObject:forKeyedSubscript:", v39, objc_msgSend(NSString, "stringWithFormat:", @"%@_underlying_data", v37));
          }
          uint64_t v34 = [(NSMutableDictionary *)obja countByEnumeratingWithState:&v53 objects:v71 count:16];
        }
        while (v34);
      }
      break;
    case 2:
      if ([v11 postProcessInstanceOutputs:v12]) {
        break;
      }
      goto LABEL_28;
    case 3:
      uint64_t v30 = objc_msgSend(a4, "tensorForRequirement:", objc_msgSend((id)-[NSMutableDictionary allValues](self->_outputTensorRequirements, "allValues"), "firstObject"));
      *(void *)&long long v58 = 0;
      memset(&v57, 0, sizeof(v57));
      FTTapToBoxClass = (void *)getFTTapToBoxClass();
      if (FTTapToBoxClass)
      {
        [FTTapToBoxClass postProcessNetworkOutput:v30];
        double v32 = *(double *)&v58;
      }
      else
      {
        *(void *)&long long v58 = 0;
        double v32 = 0.0;
        memset(&v57, 0, sizeof(v57));
      }
      [(id)getFTTapToBoxClass() defaultConfidenceThreshold];
      if (v32 < v48)
      {
LABEL_28:
        [v11 abort];
        break;
      }
      CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v57);
      CMSetAttachment(obj, @"BWInferenceAttachmentKey_FusionTrackerTargetRect", DictionaryRepresentation, 1u);
      [a3 addEntriesFromDictionary:DictionaryRepresentation];

      break;
    default:
      break;
  }
LABEL_30:
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
}

- (BOOL)allowsAsyncPropagation
{
  return 0;
}

@end