@interface MADHEICSAlphaSequenceTranscoder
- (MADHEICSAlphaSequenceTranscoder)initWithSequenceData:(id)a3 maxDimension:(unint64_t)a4 qualityValue:(double)a5;
- (id).cxx_construct;
- (id)run;
- (int)_addFrameToSequence:(int64_t)a3 basePixelBuffer:(__CVBuffer *)a4 alphaPixelBuffer:(__CVBuffer *)a5 pts:(id *)a6;
- (int)_decodeFrameIndex:(unint64_t)a3 basePixelBuffer:(__CVBuffer *)a4 alphaPixelBuffer:(__CVBuffer *)a5 pts:(id *)a6;
- (int)_setupTranscode;
- (int)_transcode;
@end

@implementation MADHEICSAlphaSequenceTranscoder

- (MADHEICSAlphaSequenceTranscoder)initWithSequenceData:(id)a3 maxDimension:(unint64_t)a4 qualityValue:(double)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MADHEICSAlphaSequenceTranscoder;
  v10 = [(MADHEICSAlphaSequenceTranscoder *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_sequenceData, a3);
    v11->_maxDimension = a4;
    v11->_qualityValue = a5;
  }

  return v11;
}

- (int)_setupTranscode
{
  v23[2] = *MEMORY[0x1E4F143B8];
  p_source = &self->_source;
  value = self->_source.value_;
  if (value)
  {
    CFRelease(value);
    p_source->value_ = 0;
  }
  int Container = CMPhotoDecompressionSessionCreate();
  if (!Container)
  {
    v6 = self->_sourceContainer.value_;
    if (v6)
    {
      CFRelease(v6);
      self->_sourceContainer.value_ = 0;
    }
    int Container = CMPhotoDecompressionSessionCreateContainer();
    if (!Container)
    {
      v7 = self->_sequenceContainer.value_;
      if (v7)
      {
        CFRelease(v7);
        self->_sequenceContainer.value_ = 0;
      }
      int Container = CMPhotoDecompressionContainerCreateSequenceContainer();
      if (!Container)
      {
        v8 = self->_compressionSession.value_;
        if (v8)
        {
          CFRelease(v8);
          self->_compressionSession.value_ = 0;
        }
        int Container = CMPhotoCompressionSessionCreate();
        if (!Container)
        {
          uint64_t v9 = *MEMORY[0x1E4F56048];
          v22[0] = *MEMORY[0x1E4F56058];
          v22[1] = v9;
          v23[0] = &unk_1F15EBA78;
          v23[1] = &unk_1F15EBA90;
          v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
          int Container = CMPhotoCompressionSessionOpenEmptyContainer();
          if (!Container)
          {
            int Container = CMPhotoCompressionSessionStartImageSequence();
            if (!Container)
            {
              int Container = CMPhotoDecompressionContainerGetImageCount();
              if (!Container)
              {
                CFDictionaryRef theDict = 0;
                int Container = CMPhotoDecompressionContainerCreateDictionaryDescription();
                if (!Container)
                {
                  CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x1E4F56258]);
                  v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
                  frameProperties = self->_frameProperties;
                  self->_frameProperties = v11;

                  if (self->_frameProperties)
                  {
                    objc_super v13 = (OS_dispatch_group *)dispatch_group_create();
                    encodeGroup = self->_encodeGroup;
                    self->_encodeGroup = v13;

                    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
                    v16 = (OS_dispatch_queue *)dispatch_queue_create("heics.encode", v15);
                    encodeQueue = self->_encodeQueue;
                    self->_encodeQueue = v16;

                    v18 = (OS_dispatch_semaphore *)dispatch_semaphore_create(2);
                    encodeSemaphore = self->_encodeSemaphore;
                    self->_encodeSemaphore = v18;

                    int Container = 0;
                  }
                  else
                  {
                    int Container = -18;
                  }
                }
                CF<opaqueCMSampleBuffer *>::~CF((const void **)&theDict);
              }
            }
          }
        }
      }
    }
  }
  return Container;
}

- (int)_decodeFrameIndex:(unint64_t)a3 basePixelBuffer:(__CVBuffer *)a4 alphaPixelBuffer:(__CVBuffer *)a5 pts:(id *)a6
{
  v43[1] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = VCPSignPostLog();
  os_signpost_id_t v10 = os_signpost_id_generate(v9);

  v11 = VCPSignPostLog();
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(buf.value) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "MADHEICSTranscode_DecodeFrame", "", (uint8_t *)&buf, 2u);
  }

  objc_super v13 = [(NSArray *)self->_frameProperties objectAtIndexedSubscript:a3];
  CFDictionaryRef v14 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F56268]];
  CFDictionaryRef v15 = v14;
  if (v14)
  {
    CMTimeMakeFromDictionary(&buf, v14);
    *(CMTime *)a6 = buf;
    v16 = (void *)MEMORY[0x1E4F1CA60];
    uint64_t v17 = *MEMORY[0x1E4F562B0];
    uint64_t v42 = *MEMORY[0x1E4F562B0];
    v43[0] = &unk_1F15EBAA8;
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:&v42 count:1];
    v38 = [v16 dictionaryWithDictionary:v18];

    v19 = VCPSignPostLog();
    os_signpost_id_t v20 = os_signpost_id_generate(v19);

    v21 = VCPSignPostLog();
    v22 = v21;
    if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      LOWORD(buf.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "MADHEICSTranscode_DecodeBaseImage", "", (uint8_t *)&buf, 2u);
    }

    int ImageForIndex = CMPhotoDecompressionContainerCreateImageForIndex();
    if (!ImageForIndex)
    {
      v24 = VCPSignPostLog();
      v25 = v24;
      if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
      {
        LOWORD(buf.value) = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v25, OS_SIGNPOST_INTERVAL_END, v20, "MADHEICSTranscode_DecodeBaseImage", "", (uint8_t *)&buf, 2u);
      }

      v26 = (void *)MEMORY[0x1E4F1CA60];
      uint64_t v40 = v17;
      v41 = &unk_1F15EBAC0;
      v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
      v28 = [v26 dictionaryWithDictionary:v27];

      v29 = VCPSignPostLog();
      os_signpost_id_t v30 = os_signpost_id_generate(v29);

      v31 = VCPSignPostLog();
      v32 = v31;
      if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
      {
        LOWORD(buf.value) = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v32, OS_SIGNPOST_INTERVAL_BEGIN, v30, "MADHEICSTranscode_DecodeAlphaImage", "", (uint8_t *)&buf, 2u);
      }

      int ImageForIndex = CMPhotoDecompressionContainerCreateAuxiliaryImageForIndex();
      if (!ImageForIndex)
      {
        v33 = VCPSignPostLog();
        v34 = v33;
        if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
        {
          LOWORD(buf.value) = 0;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v34, OS_SIGNPOST_INTERVAL_END, v30, "MADHEICSTranscode_DecodeAlphaImage", "", (uint8_t *)&buf, 2u);
        }

        v35 = VCPSignPostLog();
        v36 = v35;
        if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
        {
          LOWORD(buf.value) = 0;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v36, OS_SIGNPOST_INTERVAL_END, v10, "MADHEICSTranscode_DecodeFrame", "", (uint8_t *)&buf, 2u);
        }
      }
    }
  }
  else
  {
    int ImageForIndex = -18;
  }

  return ImageForIndex;
}

- (int)_addFrameToSequence:(int64_t)a3 basePixelBuffer:(__CVBuffer *)a4 alphaPixelBuffer:(__CVBuffer *)a5 pts:(id *)a6
{
  v46[6] = *MEMORY[0x1E4F143B8];
  v8 = VCPSignPostLog();
  os_signpost_id_t spid = os_signpost_id_generate(v8);

  uint64_t v9 = VCPSignPostLog();
  os_signpost_id_t v10 = v9;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)CMTime buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v10, OS_SIGNPOST_INTERVAL_BEGIN, spid, "MADHEICSTranscode_EncodeFrame", "", buf, 2u);
  }

  v11 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v12 = *MEMORY[0x1E4F56158];
  v45[0] = *MEMORY[0x1E4F560B8];
  v45[1] = v12;
  v46[0] = &unk_1F15EBAD8;
  v46[1] = &unk_1F15EBAF0;
  v45[2] = *MEMORY[0x1E4F56150];
  uint64_t v43 = *MEMORY[0x1E4F56358];
  objc_super v13 = [NSNumber numberWithDouble:self->_qualityValue];
  v44 = v13;
  CFDictionaryRef v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
  v46[2] = v14;
  v45[3] = *MEMORY[0x1E4F56120];
  CFDictionaryRef v15 = [NSNumber numberWithUnsignedInteger:self->_maxDimension];
  uint64_t v16 = *MEMORY[0x1E4F56190];
  v46[3] = v15;
  v46[4] = MEMORY[0x1E4F1CC38];
  uint64_t v17 = *MEMORY[0x1E4F56088];
  v45[4] = v16;
  v45[5] = v17;
  v46[5] = MEMORY[0x1E4F1CC38];
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:6];
  v19 = [v11 dictionaryWithDictionary:v18];

  os_signpost_id_t v20 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v19];
  [v20 setObject:&unk_1F15EBB08 forKeyedSubscript:*MEMORY[0x1E4F560F8]];
  v21 = VCPSignPostLog();
  os_signpost_id_t v22 = os_signpost_id_generate(v21);

  v23 = VCPSignPostLog();
  v24 = v23;
  if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_WORD *)CMTime buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v22, "MADHEICSTranscode_EncodeBaseImage", "", buf, 2u);
  }

  *(void *)CMTime buf = 0;
  long long v40 = *(_OWORD *)&a6->var0;
  int64_t var3 = a6->var3;
  int v25 = CMPhotoCompressionSessionAddImageToSequence();
  if (!v25)
  {
    v26 = VCPSignPostLog();
    v27 = v26;
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      *(_WORD *)v39 = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v27, OS_SIGNPOST_INTERVAL_END, v22, "MADHEICSTranscode_EncodeBaseImage", "", v39, 2u);
    }

    v28 = VCPSignPostLog();
    os_signpost_id_t v29 = os_signpost_id_generate(v28);

    os_signpost_id_t v30 = VCPSignPostLog();
    v31 = v30;
    if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
    {
      *(_WORD *)v39 = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v31, OS_SIGNPOST_INTERVAL_BEGIN, v29, "MADHEICSTranscode_EncodeAlphaImage", "", v39, 2u);
    }

    *(void *)v39 = 0;
    int v25 = CMPhotoCompressionSessionAddAuxiliaryImage();
    if (!v25)
    {
      v32 = VCPSignPostLog();
      v33 = v32;
      if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
      {
        *(_WORD *)v38 = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v33, OS_SIGNPOST_INTERVAL_END, v29, "MADHEICSTranscode_EncodeAlphaImage", "", v38, 2u);
      }

      v34 = VCPSignPostLog();
      v35 = v34;
      if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
      {
        *(_WORD *)v38 = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v35, OS_SIGNPOST_INTERVAL_END, spid, "MADHEICSTranscode_EncodeFrame", "", v38, 2u);
      }
    }
  }

  return v25;
}

- (int)_transcode
{
  v3 = VCPSignPostLog();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  v5 = VCPSignPostLog();
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)CMTime buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "MADHEICSTranscode_Transcode", "", buf, 2u);
  }

  int v7 = [(MADHEICSAlphaSequenceTranscoder *)self _setupTranscode];
  if (v7) {
    return v7;
  }
  *(void *)CMTime buf = 0;
  v26 = buf;
  uint64_t v27 = 0x2020000000;
  int v28 = 0;
  if (self->_frameCount <= 0)
  {
    dispatch_group_wait((dispatch_group_t)self->_encodeGroup, 0xFFFFFFFFFFFFFFFFLL);
    goto LABEL_22;
  }
  int64_t v8 = 0;
  do
  {
    uint64_t v9 = (void *)MEMORY[0x1C186D320]();
    CFTypeRef v21 = 0;
    CFTypeRef cf = 0;
    int v7 = [(MADHEICSAlphaSequenceTranscoder *)self _decodeFrameIndex:v8 basePixelBuffer:&cf alphaPixelBuffer:&v21 pts:v23];
    if (v7) {
      goto LABEL_10;
    }
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_encodeSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    if (*((_DWORD *)v26 + 6))
    {
      dispatch_semaphore_signal((dispatch_semaphore_t)self->_encodeSemaphore);
LABEL_10:
      char v10 = 0;
      goto LABEL_11;
    }
    encodeGroup = self->_encodeGroup;
    encodeQueue = self->_encodeQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3321888768;
    block[2] = __45__MADHEICSAlphaSequenceTranscoder__transcode__block_invoke;
    block[3] = &unk_1F159F0F0;
    block[4] = self;
    block[5] = buf;
    CFTypeRef v17 = cf;
    if (cf) {
      CFRetain(cf);
    }
    CFTypeRef v18 = v21;
    if (v21) {
      CFRetain(v21);
    }
    long long v19 = *(_OWORD *)v23;
    uint64_t v20 = v24;
    dispatch_group_async(encodeGroup, encodeQueue, block);
    CF<opaqueCMSampleBuffer *>::~CF(&v18);
    CF<opaqueCMSampleBuffer *>::~CF(&v17);
    char v10 = 1;
LABEL_11:
    CF<opaqueCMSampleBuffer *>::~CF(&v21);
    CF<opaqueCMSampleBuffer *>::~CF(&cf);
    if ((v10 & 1) == 0) {
      break;
    }
    ++v8;
  }
  while (v8 < self->_frameCount);
  dispatch_group_wait((dispatch_group_t)self->_encodeGroup, 0xFFFFFFFFFFFFFFFFLL);
  if (!v7)
  {
LABEL_22:
    int v7 = *((_DWORD *)v26 + 6);
    if (!v7)
    {
      int v7 = CMPhotoCompressionSessionEndImageSequence();
      if (!v7)
      {
        objc_super v13 = VCPSignPostLog();
        CFDictionaryRef v14 = v13;
        if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
        {
          *(_WORD *)v23 = 0;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v14, OS_SIGNPOST_INTERVAL_END, v4, "MADHEICSTranscode_Transcode", "", v23, 2u);
        }
      }
    }
  }
  _Block_object_dispose(buf, 8);
  return v7;
}

intptr_t __45__MADHEICSAlphaSequenceTranscoder__transcode__block_invoke(uint64_t a1)
{
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    v2 = *(void **)(a1 + 32);
    uint64_t v3 = v2[9];
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    long long v7 = *(_OWORD *)(a1 + 64);
    uint64_t v8 = *(void *)(a1 + 80);
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 _addFrameToSequence:v3 basePixelBuffer:v4 alphaPixelBuffer:v5 pts:&v7];
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 104));
}

- (id)run
{
  if ([(MADHEICSAlphaSequenceTranscoder *)self _transcode])
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v2 = VCPLogInstance();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)CMTime buf = 0;
        _os_log_impl(&dword_1BBEDA000, v2, OS_LOG_TYPE_ERROR, "Failed to transcode HEIC sequence", buf, 2u);
      }
    }
  }
  else
  {
    CFTypeRef cf = 0;
    if (CMPhotoCompressionSessionCloseContainerAndCopyBacking() && (int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v3 = VCPLogInstance();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v5 = 0;
        _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_ERROR, "Failed to copy HEIC sequence data", v5, 2u);
      }
    }
    CF<opaqueCMSampleBuffer *>::~CF(&cf);
  }
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encodeSemaphore, 0);
  objc_storeStrong((id *)&self->_encodeQueue, 0);
  objc_storeStrong((id *)&self->_encodeGroup, 0);
  objc_storeStrong((id *)&self->_frameProperties, 0);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_compressionSession.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_sequenceContainer.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_sourceContainer.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_source.value_);
  objc_storeStrong((id *)&self->_sequenceData, 0);
}

- (id).cxx_construct
{
  *((void *)self + 8) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  *((void *)self + 4) = 0;
  return self;
}

@end