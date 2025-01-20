@interface FigCaptureCMIOExtensionSessionStreamDelegate
- (opaqueCMSampleBuffer)stream:(id)a3 copySampleBuffer:(BOOL *)a4 error:(id *)a5;
- (void)stream:(id)a3 propertiesChanged:(id)a4;
- (void)stream:(id)a3 receivedSampleBuffer:(opaqueCMSampleBuffer *)a4;
@end

@implementation FigCaptureCMIOExtensionSessionStreamDelegate

- (void)stream:(id)a3 propertiesChanged:(id)a4
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  v7 = (os_unfair_lock_s *)(DerivedStorage + 20);
  os_unfair_lock_lock((os_unfair_lock_t)(DerivedStorage + 20));
  if (*(unsigned char *)(DerivedStorage + 16))
  {
    os_unfair_lock_unlock(v7);
    id v8 = 0;
  }
  else
  {
    id v8 = *(id *)(DerivedStorage + 48);
    os_unfair_lock_unlock(v7);
    if (v8)
    {
      global_queue = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __73__FigCaptureCMIOExtensionSessionStreamDelegate_stream_propertiesChanged___block_invoke;
      block[3] = &unk_1E5C248A0;
      block[4] = a4;
      block[5] = self;
      block[6] = v8;
      dispatch_async(global_queue, block);
    }
  }
}

uint64_t __73__FigCaptureCMIOExtensionSessionStreamDelegate_stream_propertiesChanged___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t result = [obj countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)v17;
    uint64_t v5 = *MEMORY[0x1E4F22110];
    uint64_t v14 = *MEMORY[0x1E4F543F8];
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v17 != v4) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v16 + 1) + 8 * v6);
        id v8 = (void *)[*(id *)(a1 + 32) objectForKeyedSubscript:v7];
        if ([v7 isEqualToString:v5])
        {
          if (![v8 value]) {
            goto LABEL_13;
          }
          uint64_t v20 = v14;
          uint64_t v21 = [v8 value];
          uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
          FigCaptureDeviceGetNotificationCenter(v9, v10);
        }
        else
        {
          id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          [v11 setObject:v7 forKeyedSubscript:@"CMIOExtensionPropertyName"];
          [v11 setObject:*(void *)(a1 + 48) forKeyedSubscript:@"UniqueID"];
          uint64_t v12 = [v8 value];
          if (v12) {
            uint64_t v12 = objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend(v8, "value"), @"CMIOExtensionPropertyValue");
          }
          FigCaptureDeviceGetNotificationCenter(v12, v13);
        }
        CMNotificationCenterPostNotification();
LABEL_13:
        ++v6;
      }
      while (v3 != v6);
      uint64_t result = [obj countByEnumeratingWithState:&v16 objects:v22 count:16];
      uint64_t v3 = result;
    }
    while (result);
  }
  return result;
}

- (void)stream:(id)a3 receivedSampleBuffer:(opaqueCMSampleBuffer *)a4
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  CVPixelBufferRef pixelBufferOut = 0;
  CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F53070];
  v7 = (void *)CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  if (!v7)
  {
    v7 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    CMSetAttachment(a4, v6, v7, 1u);
  }
  FormatDescription = CMSampleBufferGetFormatDescription(a4);
  CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions(FormatDescription);
  CMVideoDimensions v10 = Dimensions;
  if (Dimensions.width >= 1 && Dimensions.height >= 1)
  {
    v41.size.width = (double)Dimensions.width;
    v41.size.height = (double)Dimensions.height;
    v41.origin.x = 0.0;
    v41.origin.y = 0.0;
    CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v41);
    [v7 setObject:DictionaryRepresentation forKeyedSubscript:*MEMORY[0x1E4F54358]];
    if (DictionaryRepresentation) {
      CFRelease(DictionaryRepresentation);
    }
    uint64_t v12 = [NSNumber numberWithInt:v10];
    [v7 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F54168]];
    uint64_t v13 = [NSNumber numberWithInt:HIDWORD(*(unint64_t *)&v10)];
    [v7 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F54160]];
  }
  [*(id *)(DerivedStorage + 248) processSampleBuffer:a4];
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a4);
  CFStringRef v15 = (const __CFString *)*MEMORY[0x1E4F531A8];
  long long v16 = (void *)CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E4F531A8], 0);
  if (v16)
  {
    long long v17 = v16;
    uint64_t v18 = *MEMORY[0x1E4F53DC8];
    uint64_t v19 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F53DC8]];
    uint64_t v20 = *MEMORY[0x1E4F53DD0];
    uint64_t v21 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F53DD0]];
    if (v19) {
      [v7 setObject:v19 forKeyedSubscript:v18];
    }
    if (v21) {
      [v7 setObject:v21 forKeyedSubscript:v20];
    }
    CFDictionaryRef v22 = (const __CFDictionary *)[v17 objectForKeyedSubscript:*MEMORY[0x1E4F556C0]];
    if (v22 && ImageBuffer) {
      CMSetAttachments(ImageBuffer, v22, 1u);
    }
    CMRemoveAttachment(a4, v15);
  }
  memset(&v39, 0, sizeof(v39));
  CMSampleBufferGetPresentationTimeStamp(&v39, a4);
  uint64_t v23 = (void *)[*(id *)(DerivedStorage + 96) objectForKeyedSubscript:*MEMORY[0x1E4F55410]];
  v24 = (__CVPixelBufferPool *)[v23 objectForKeyedSubscript:*MEMORY[0x1E4F55330]];
  v25 = (CFAllocatorRef *)MEMORY[0x1E4F1CF80];
  if (!v24) {
    goto LABEL_26;
  }
  CFAllocatorRef v26 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  if (CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v24, &pixelBufferOut)) {
    goto LABEL_42;
  }
  v27 = *(OpaqueVTPixelTransferSession **)(DerivedStorage + 240);
  if (v27) {
    goto LABEL_22;
  }
  if (VTPixelTransferSessionCreate(v26, (VTPixelTransferSessionRef *)(DerivedStorage + 240)))
  {
LABEL_42:
    FigDebugAssert3();
    goto LABEL_39;
  }
  v27 = *(OpaqueVTPixelTransferSession **)(DerivedStorage + 240);
LABEL_22:
  if (VTPixelTransferSessionTransferImage(v27, ImageBuffer, pixelBufferOut)) {
    goto LABEL_42;
  }
  CVBufferPropagateAttachments(ImageBuffer, pixelBufferOut);
  CFDictionaryRef v28 = CVBufferCopyAttachments(pixelBufferOut, kCVAttachmentMode_ShouldNotPropagate);
  if (v28)
  {
    CFDictionaryRef v29 = (const __CFDictionary *)CFAutorelease(v28);
    if (v29) {
      CVBufferSetAttachments(pixelBufferOut, v29, kCVAttachmentMode_ShouldNotPropagate);
    }
  }
LABEL_26:
  if (!pixelBufferOut)
  {
    if (ImageBuffer) {
      v30 = (__CVBuffer *)CFRetain(ImageBuffer);
    }
    else {
      v30 = 0;
    }
    CVPixelBufferRef pixelBufferOut = v30;
  }
  CFAllocatorRef v31 = *v25;
  CFDictionaryRef v32 = CMCopyDictionaryOfAttachments(*v25, a4, 1u);
  if (v32)
  {
    CFDictionaryRef v33 = v32;
    CVBufferSetAttachment(pixelBufferOut, @"SampleBufferPropagatableAttachments", v32, kCVAttachmentMode_ShouldPropagate);
    CFRelease(v33);
  }
  CFDictionaryRef v34 = CMCopyDictionaryOfAttachments(v31, a4, 0);
  if (v34)
  {
    CFDictionaryRef v35 = v34;
    CVBufferSetAttachment(pixelBufferOut, @"SampleBufferNonPropagatableAttachments", v34, kCVAttachmentMode_ShouldNotPropagate);
    CFRelease(v35);
  }
  os_unfair_lock_lock((os_unfair_lock_t)(DerivedStorage + 20));
  if (*(unsigned char *)(DerivedStorage + 104))
  {
    uint64_t v36 = *(void *)(DerivedStorage + 112);
    if (v36)
    {
      v37 = *(void (**)(uint64_t, CVPixelBufferRef, CMTime *))(v36 + 16);
      CMTime v38 = v39;
      v37(v36, pixelBufferOut, &v38);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(DerivedStorage + 20));
LABEL_39:
  if (pixelBufferOut) {
    CFRelease(pixelBufferOut);
  }
}

- (opaqueCMSampleBuffer)stream:(id)a3 copySampleBuffer:(BOOL *)a4 error:(id *)a5
{
  return 0;
}

@end