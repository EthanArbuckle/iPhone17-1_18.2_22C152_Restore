@interface CopySectionProperty
@end

@implementation CopySectionProperty

uint64_t __captureSession_CopySectionProperty_block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v2 = (void *)[*(id *)(*(void *)(a1 + 40) + 664) movieFileSinkPipelineWithSinkID:*(void *)(a1 + 48)];
  uint64_t v3 = [*(id *)(*(void *)(a1 + 40) + 664) audioFileSinkPipelineWithSinkID:*(void *)(a1 + 48)];
  [v2 sinkID];
  if (FigCFEqual())
  {
    v4 = (void *)[(id)-[FigCaptureMovieFileSinkPipeline movieFileSinkNodes]((uint64_t)v2) objectAtIndexedSubscript:0];
    v5 = 0;
    v6 = v4;
  }
  else if (v3)
  {
    v6 = (void *)-[FigCaptureAudioFileSinkPipeline audioFileSinkNode](v3);
    v5 = 0;
    v4 = 0;
  }
  else
  {
    objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 40) + 664), "micSourcePipeline"), "sourceID");
    if (FigCFEqual()) {
      v5 = (void *)-[FigCaptureMicSourcePipeline sourceNode]([*(id *)(*(void *)(a1 + 40) + 664) micSourcePipeline]);
    }
    else {
      v5 = 0;
    }
    v4 = 0;
    v6 = 0;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 56), @"CaptureSessionFileSink_RecordedDuration"))
  {
    CFDictionaryRef v7 = (const __CFDictionary *)[*(id *)(*(void *)(a1 + 40) + 752) objectForKeyedSubscript:*(void *)(a1 + 48)];
    if (v7)
    {
      memset(&valuePtr, 0, sizeof(valuePtr));
      CMTimeMakeFromDictionary(&valuePtr, v7);
LABEL_17:
      CFAllocatorRef v10 = *(const __CFAllocator **)(a1 + 72);
      CMTime time = valuePtr;
      uint64_t result = (uint64_t)CMTimeCopyAsDictionary(&time, v10);
LABEL_30:
      **(void **)(a1 + 64) = result;
      return result;
    }
    if (v6)
    {
      memset(&valuePtr, 0, sizeof(valuePtr));
      [v6 lastFileDuration];
      goto LABEL_17;
    }
LABEL_25:
    uint64_t result = FigSignalErrorAt();
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    return result;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 56), @"CaptureSessionFileSink_RecordedSize"))
  {
    v8 = (void *)[*(id *)(*(void *)(a1 + 40) + 760) objectForKeyedSubscript:*(void *)(a1 + 48)];
    if (v8)
    {
      CMTimeValue v9 = [v8 unsignedLongLongValue];
    }
    else
    {
      if (!v6) {
        goto LABEL_25;
      }
      CMTimeValue v9 = [v6 lastFileSize];
    }
    valuePtr.value = v9;
    uint64_t result = (uint64_t)CFNumberCreate(*(CFAllocatorRef *)(a1 + 72), kCFNumberSInt64Type, &valuePtr);
    goto LABEL_30;
  }
  if (v4 && CFEqual(*(CFTypeRef *)(a1 + 56), @"CaptureSessionMovieFileSink_MovieLevelMetadata"))
  {
    uint64_t result = [v4 movieLevelMetadata];
    if (!result) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  if (v5 && CFEqual(*(CFTypeRef *)(a1 + 56), @"CaptureSessionAudioSource_AudioMeteringLevels"))
  {
    uint64_t result = [v5 audioLevels];
    if (!result) {
      goto LABEL_30;
    }
LABEL_29:
    uint64_t result = (uint64_t)CFRetain((CFTypeRef)result);
    goto LABEL_30;
  }
  uint64_t result = CFEqual(*(CFTypeRef *)(a1 + 56), @"CaptureSessionMetadataSource_MetadataFormatDescription");
  if (result)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v12 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 664), "metadataSourcePipelines", 0);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v26 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v21;
LABEL_34:
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v20 + 1) + 8 * v16);
        if (objc_msgSend((id)objc_msgSend(v17, "sourceID"), "isEqualToString:", *(void *)(a1 + 48))) {
          break;
        }
        if (v14 == ++v16)
        {
          uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v26 count:16];
          if (v14) {
            goto LABEL_34;
          }
          goto LABEL_40;
        }
      }
      v19 = (const void *)-[FigCaptureMetadataSourcePipeline sourceFormatDescription]((uint64_t)v17);
      if (!v19 || (uint64_t result = (uint64_t)CFRetain(v19), (v18 = result) == 0))
      {
        uint64_t result = FigSignalErrorAt();
        uint64_t v18 = 0;
        *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
      }
      if (v17) {
        goto LABEL_46;
      }
    }
    else
    {
LABEL_40:
      uint64_t v18 = 0;
    }
    uint64_t result = FigSignalErrorAt();
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
LABEL_46:
    **(void **)(a1 + 64) = v18;
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = -12784;
  }
  return result;
}

@end