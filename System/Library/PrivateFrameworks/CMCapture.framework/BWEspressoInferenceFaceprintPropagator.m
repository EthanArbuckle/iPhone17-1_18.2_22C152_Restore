@interface BWEspressoInferenceFaceprintPropagator
- (BOOL)allowsAsyncPropagation;
- (BWEspressoInferenceFaceprintPropagator)initWithFaceprintRequirement:(id)a3 faceprintSizeBytes:(unint64_t)a4 confidenceRequirement:(id)a5 maxFaces:(unint64_t)a6 faceIndex:(unint64_t)a7;
- (void)dealloc;
- (void)propagateInferenceResultsToInferenceDictionary:(id)a3 usingStorage:(id)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 propagationSampleBuffer:(opaqueCMSampleBuffer *)a6;
@end

@implementation BWEspressoInferenceFaceprintPropagator

- (BWEspressoInferenceFaceprintPropagator)initWithFaceprintRequirement:(id)a3 faceprintSizeBytes:(unint64_t)a4 confidenceRequirement:(id)a5 maxFaces:(unint64_t)a6 faceIndex:(unint64_t)a7
{
  v15.receiver = self;
  v15.super_class = (Class)BWEspressoInferenceFaceprintPropagator;
  v12 = [(BWEspressoInferenceFaceprintPropagator *)&v15 init];
  if (v12)
  {
    v12->_faceprintRequirement = (BWInferenceMetadataRequirement *)[a3 copy];
    uint64_t v13 = [a5 copy];
    v12->_maxFaces = a6;
    v12->_faceIndex = a7;
    v12->_confidenceRequirement = (BWInferenceMetadataRequirement *)v13;
    v12->_faceprintSizeBytes = a4;
  }
  return v12;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWEspressoInferenceFaceprintPropagator;
  [(BWEspressoInferenceFaceprintPropagator *)&v3 dealloc];
}

- (void)propagateInferenceResultsToInferenceDictionary:(id)a3 usingStorage:(id)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 propagationSampleBuffer:(opaqueCMSampleBuffer *)a6
{
  uint64_t v10 = [a4 tensorForRequirement:self->_faceprintRequirement];
  if (!v10) {
    return;
  }
  v11 = (void *)v10;
  uint64_t v12 = [a4 tensorForRequirement:self->_confidenceRequirement];
  if (!v12) {
    return;
  }
  uint64_t v13 = (_DWORD **)v12;
  CFStringRef v14 = [(NSArray *)[(BWInferenceMetadataRequirement *)self->_faceprintRequirement metadataKeys] firstObject];
  id v15 = (id)CMGetAttachment(a6, v14, 0);
  CFStringRef v16 = [(NSArray *)[(BWInferenceMetadataRequirement *)self->_confidenceRequirement metadataKeys] firstObject];
  CFTypeRef v17 = CMGetAttachment(a6, v16, 0);
  id v18 = (id)v17;
  if (!v15)
  {
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (self->_maxFaces)
    {
      unint64_t v19 = 0;
      do
        objc_msgSend(v15, "setObject:atIndexedSubscript:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"), v19++);
      while (self->_maxFaces > v19);
    }
    CMSetAttachment(a6, v14, v15, 1u);

    if (v18) {
      goto LABEL_14;
    }
    goto LABEL_10;
  }
  if (!v17)
  {
LABEL_10:
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (self->_maxFaces)
    {
      unint64_t v20 = 0;
      do
        objc_msgSend(v18, "setObject:atIndexedSubscript:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"), v20++);
      while (self->_maxFaces > v20);
    }
    CMSetAttachment(a6, v16, v18, 1u);
  }
LABEL_14:
  objc_msgSend(v15, "replaceObjectAtIndex:withObject:", self->_faceIndex, objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", *v11, self->_faceprintSizeBytes));
  LODWORD(v21) = **v13;
  objc_msgSend(v18, "replaceObjectAtIndex:withObject:", self->_faceIndex, objc_msgSend(NSNumber, "numberWithFloat:", v21));
  [a3 setObject:v15 forKeyedSubscript:v14];
  [a3 setObject:v18 forKeyedSubscript:v16];
}

- (BOOL)allowsAsyncPropagation
{
  return 0;
}

@end