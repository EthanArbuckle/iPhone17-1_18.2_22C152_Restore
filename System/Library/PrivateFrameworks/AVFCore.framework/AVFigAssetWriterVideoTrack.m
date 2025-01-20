@interface AVFigAssetWriterVideoTrack
- (int)_attachToFigAssetWriterUsingFormatSpecification:(id)a3 sourcePixelBufferAttributes:(id)a4 multiPass:(BOOL)a5 error:(id *)a6;
@end

@implementation AVFigAssetWriterVideoTrack

- (int)_attachToFigAssetWriterUsingFormatSpecification:(id)a3 sourcePixelBufferAttributes:(id)a4 multiPass:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v50 = 0;
  int v49 = 0;
  v11 = (void *)[a3 outputSettings];
  uint64_t v12 = [a3 sourceFormatDescription];
  if (!v11)
  {
    v48.receiver = self;
    v48.super_class = (Class)AVFigAssetWriterVideoTrack;
    int v49 = [(AVFigAssetWriterTrack *)&v48 _attachToFigAssetWriterUsingFormatSpecification:a3 sourcePixelBufferAttributes:a4 multiPass:v7 error:&v50];
    goto LABEL_40;
  }
  v13 = (const opaqueCMFormatDescription *)v12;
  if (![v11 willYieldCompressedSamples]) {
    goto LABEL_40;
  }
  uint64_t v14 = [v11 height];
  int32_t v47 = [v11 width];
  unsigned int v45 = CMMediaTypeFromAVMediaType([(AVFigAssetWriterTrack *)self mediaType]);
  unsigned int v44 = [v11 videoCodecType];
  uint64_t v43 = [v11 videoEncoderSpecification];
  uint64_t v15 = [v11 pixelTransferProperties];
  v16 = (void *)[v11 videoCompressionProperties];
  if (v7) {
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:*MEMORY[0x1E4F1CFD0] forKey:*MEMORY[0x1E4F344D0]];
  }
  else {
    uint64_t v17 = 0;
  }
  if (v15)
  {
    v16 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v16];
    [v16 setObject:v15 forKey:*MEMORY[0x1E4F44A68]];
  }
  if ([v11 shouldPrepareEncodedSampleBuffersForPaddedWrites])
  {
    v16 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v16];
    [v16 setObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F44A78]];
  }
  if (v13)
  {
    uint64_t v42 = v17;
    v46 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v16];
    CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions(v13);
    CFPropertyListRef Extension = CMFormatDescriptionGetExtension(v13, (CFStringRef)*MEMORY[0x1E4F24B98]);
    CFPropertyListRef v20 = CMFormatDescriptionGetExtension(v13, (CFStringRef)*MEMORY[0x1E4F24A78]);
    int32_t width = v47;
    LODWORD(height) = v14;
    BOOL v23 = (int)v14 > 0 && v47 > 0;
    if (!v23) {
      int32_t width = Dimensions.width;
    }
    int32_t v47 = width;
    if (v23) {
      uint64_t height = height;
    }
    else {
      uint64_t height = Dimensions.height;
    }
    uint64_t v24 = *MEMORY[0x1E4F44A60];
    if (![v16 objectForKey:*MEMORY[0x1E4F44A60]] && Extension) {
      [v46 setObject:Extension forKey:v24];
    }
    uint64_t v25 = *MEMORY[0x1E4F44858];
    if ([v16 objectForKey:*MEMORY[0x1E4F44858]]) {
      BOOL v26 = 1;
    }
    else {
      BOOL v26 = v20 == 0;
    }
    int v27 = v26;
    if (((v27 | v23) & 1) == 0) {
      [v46 setObject:v20 forKey:v25];
    }
    if (a4)
    {
      uint64_t v14 = height;
    }
    else
    {
      uint64_t MediaSubType = CMFormatDescriptionGetMediaSubType(v13);
      CMVideoDimensions v29 = CMVideoFormatDescriptionGetDimensions(v13);
      v30 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v31 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:MediaSubType];
      uint64_t v32 = *MEMORY[0x1E4F24D70];
      uint64_t v33 = [MEMORY[0x1E4F28ED0] numberWithInteger:v29.width];
      uint64_t v34 = *MEMORY[0x1E4F24E10];
      uint64_t v14 = height;
      uint64_t v35 = [MEMORY[0x1E4F28ED0] numberWithInteger:*(uint64_t *)&v29 >> 32];
      a4 = (id)objc_msgSend(v30, "dictionaryWithObjectsAndKeys:", v31, v32, v33, v34, v35, *MEMORY[0x1E4F24D08], 0);
    }
    v16 = v46;
    uint64_t v17 = v42;
  }
  v36 = [(AVFigAssetWriterTrack *)self figAssetWriter];
  uint64_t v37 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v37) {
    uint64_t v38 = v37;
  }
  else {
    uint64_t v38 = 0;
  }
  v39 = *(uint64_t (**)(OpaqueFigAssetWriter *, void, uint64_t, void, void, void, uint64_t, void *, uint64_t, long long *, id, int *))(v38 + 184);
  if (!v39)
  {
    uint64_t v40 = 4294954514;
    goto LABEL_39;
  }
  long long v51 = *MEMORY[0x1E4F1F9F8];
  uint64_t v52 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  uint64_t v40 = v39(v36, v47, v14, 0, v45, v44, v43, v16, v17, &v51, a4, &v49);
  if (v40) {
LABEL_39:
  }
    id v50 = +[AVAssetWriter _errorForOSStatus:v40];
LABEL_40:
  if (a6) {
    *a6 = v50;
  }
  return v49;
}

@end