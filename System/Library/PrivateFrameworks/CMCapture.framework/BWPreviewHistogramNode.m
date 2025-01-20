@interface BWPreviewHistogramNode
+ (void)initialize;
- (BOOL)ispHistogramsEnabled;
- (BOOL)msrHistogramsEnabled;
- (BWPreviewHistogramNode)init;
- (id)nodeSubType;
- (id)nodeType;
- (void)_emitISPLumaHistogramFromSampleBuffer:(uint64_t)a1;
- (void)_emitMSRHistogramFromSampleBuffer:(uint64_t)a1;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)setIspHistogramsEnabled:(BOOL)a3;
- (void)setMsrHistogramsEnabled:(BOOL)a3;
@end

@implementation BWPreviewHistogramNode

- (id)nodeType
{
  return @"Effect";
}

- (void)setMsrHistogramsEnabled:(BOOL)a3
{
  self->_msrHistogramsEnabled = a3;
}

- (void)setIspHistogramsEnabled:(BOOL)a3
{
  self->_ispHistogramsEnabled = a3;
}

- (BWPreviewHistogramNode)init
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)BWPreviewHistogramNode;
  v2 = [(BWNode *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_msrHistogramsEnabled = 1;
    v2->_ispHistogramDownsamplingEnabled = 1;
    v4 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v2];
    [(BWNodeInput *)v4 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
    [(BWNode *)v3 addInput:v4];
    v5 = [[BWNodeOutput alloc] initWithMediaType:1836016234 node:v3];
    v8[0] = *MEMORY[0x1E4F559E0];
    -[BWNodeOutput setFormat:](v5, "setFormat:", +[BWMetadataObjectFormat formatWithMetadataIdentifiers:](BWMetadataObjectFormat, "formatWithMetadataIdentifiers:", [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1]));
    [(BWNode *)v3 addOutput:v5];
  }
  return v3;
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  if (self->_msrHistogramsEnabled) {
    -[BWPreviewHistogramNode _emitMSRHistogramFromSampleBuffer:]((uint64_t)self, a3);
  }
  if (self->_ispHistogramsEnabled)
  {
    -[BWPreviewHistogramNode _emitISPLumaHistogramFromSampleBuffer:]((uint64_t)self, a3);
  }
}

- (void)_emitMSRHistogramFromSampleBuffer:(uint64_t)a1
{
  if (a1)
  {
    CMSampleBufferRef v10 = 0;
    v4 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F531B0], 0);
    if (v4)
    {
      v5 = v4;
      unint64_t v6 = [v4 length] / 3uLL;
      if (v6 < [v5 length]
        && (uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", objc_msgSend(v5, "bytes"), v6)) != 0)
      {
        v8 = (const void *)v7;
        memset(&sampleTimingArray.presentationTimeStamp, 0, 48);
        *(_OWORD *)&sampleTimingArray.duration.value = *MEMORY[0x1E4F1F9F8];
        sampleTimingArray.duration.epoch = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
        CMSampleBufferGetPresentationTimeStamp(&sampleTimingArray.presentationTimeStamp, (CMSampleBufferRef)target);
        sampleTimingArray.decodeTimeStamp = sampleTimingArray.duration;
        CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 1u, 0, 0, 0, 0, 1, &sampleTimingArray, 0, 0, &v10);
        if (v10)
        {
          CMSetAttachment(v10, (CFStringRef)*MEMORY[0x1E4F531B8], v8, 1u);
          [*(id *)(a1 + 16) emitSampleBuffer:v10];
          if (v10) {
            CFRelease(v10);
          }
          return;
        }
        fig_log_get_emitter();
      }
      else
      {
        fig_log_get_emitter();
      }
      FigDebugAssert3();
    }
  }
}

+ (void)initialize
{
}

- (id)nodeSubType
{
  return @"PreviewHistogram";
}

- (void)_emitISPLumaHistogramFromSampleBuffer:(uint64_t)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v4 = objc_msgSend((id)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F54060]);
    if (v4)
    {
      v5 = (_DWORD *)[v4 bytes];
      if (*v5 == 256)
      {
        if (*(unsigned char *)(a1 + 98))
        {
          uint64_t v6 = 0;
          uint64_t v7 = v5 + 2;
          do
          {
            *(_DWORD *)&v14[v6] = *v7 + *(v7 - 1);
            v6 += 4;
            v7 += 2;
          }
          while (v6 != 512);
          v8 = (void *)MEMORY[0x1E4F1C9B8];
          v9 = v14;
          uint64_t v10 = 512;
        }
        else
        {
          v9 = v5 + 1;
          v8 = (void *)MEMORY[0x1E4F1C9B8];
          uint64_t v10 = 1024;
        }
        v11 = (const void *)[v8 dataWithBytes:v9 length:v10];
        CMAttachmentBearerRef targeta = 0;
        memset(&sampleTimingArray.presentationTimeStamp, 0, 48);
        *(_OWORD *)&sampleTimingArray.duration.value = *MEMORY[0x1E4F1F9F8];
        sampleTimingArray.duration.epoch = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
        CMSampleBufferGetPresentationTimeStamp(&sampleTimingArray.presentationTimeStamp, (CMSampleBufferRef)target);
        sampleTimingArray.decodeTimeStamp = sampleTimingArray.duration;
        CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 1u, 0, 0, 0, 0, 1, &sampleTimingArray, 0, 0, (CMSampleBufferRef *)&targeta);
        if (targeta)
        {
          CMSetAttachment(targeta, (CFStringRef)*MEMORY[0x1E4F531B8], v11, 1u);
          [*(id *)(a1 + 16) emitSampleBuffer:targeta];
          if (targeta) {
            CFRelease(targeta);
          }
        }
        else
        {
          fig_log_get_emitter();
          FigDebugAssert3();
        }
      }
    }
  }
}

- (BOOL)msrHistogramsEnabled
{
  return self->_msrHistogramsEnabled;
}

- (BOOL)ispHistogramsEnabled
{
  return self->_ispHistogramsEnabled;
}

@end