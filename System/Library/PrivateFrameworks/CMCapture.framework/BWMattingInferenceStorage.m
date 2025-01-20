@interface BWMattingInferenceStorage
+ (void)initialize;
- (id)newMetadataDictionarySatisfyingRequirement:(id)a3;
- (opaqueCMSampleBuffer)newSampleBufferSatisfyingRequirement:(id)a3 withPropagationSampleBuffer:(opaqueCMSampleBuffer *)a4;
- (void)dealloc;
- (void)setDictionary:(id)a3 forMetadataRequirement:(id)a4;
@end

@implementation BWMattingInferenceStorage

+ (void)initialize
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWMattingInferenceStorage;
  [(BWInferenceProviderStorage *)&v3 dealloc];
}

- (void)setDictionary:(id)a3 forMetadataRequirement:(id)a4
{
  metadataDictionaryByRequirement = self->_metadataDictionaryByRequirement;
  if (!metadataDictionaryByRequirement)
  {
    metadataDictionaryByRequirement = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    self->_metadataDictionaryByRequirement = metadataDictionaryByRequirement;
  }
  [(NSMutableDictionary *)metadataDictionaryByRequirement setObject:a3 forKeyedSubscript:a4];
}

- (opaqueCMSampleBuffer)newSampleBufferSatisfyingRequirement:(id)a3 withPropagationSampleBuffer:(opaqueCMSampleBuffer *)a4
{
  CMAttachmentBearerRef target = 0;
  CFTypeRef v7 = (CFTypeRef)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "videoFormat"), "underlyingVideoFormat"), "formatDescription");
  if (v7) {
    CFTypeRef v7 = CFRetain(v7);
  }
  CFTypeRef cf = v7;
  v8 = [(BWInferenceProviderStorage *)self pixelBufferForRequirement:a3];
  if (v8)
  {
    if (!BWCMSampleBufferCreateDeepCopyWithNewPixelBuffer(a4, v8, 0, &cf, (CMSampleBufferRef *)&target))
    {
      CFStringRef v9 = (const __CFString *)*MEMORY[0x1E4F53070];
      v10 = objc_msgSend((id)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0), "mutableCopy");
      CMSetAttachment(target, v9, v10, 1u);

      goto LABEL_6;
    }
    fig_log_get_emitter();
  }
  else
  {
    fig_log_get_emitter();
  }
  FigDebugAssert3();
LABEL_6:
  if (cf) {
    CFRelease(cf);
  }
  return (opaqueCMSampleBuffer *)target;
}

- (id)newMetadataDictionarySatisfyingRequirement:(id)a3
{
  objc_super v3 = (void *)[(NSMutableDictionary *)self->_metadataDictionaryByRequirement objectForKeyedSubscript:a3];
  return v3;
}

@end