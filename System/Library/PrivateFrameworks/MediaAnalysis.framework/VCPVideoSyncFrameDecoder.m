@interface VCPVideoSyncFrameDecoder
+ (BOOL)isSyncFrameForCMSampleBuffer:(opaqueCMSampleBuffer *)a3;
+ (BOOL)readBigEndianInt:(int *)a3 fromBlockBuffer:(OpaqueCMBlockBuffer *)a4 forNumBytes:(int)a5 atOffset:(unint64_t)a6;
- (BOOL)decodeCMSampleBuffer:(opaqueCMSampleBuffer *)a3 toCMSampleBuffer:(opaqueCMSampleBuffer *)a4 error:(id *)a5;
- (VCPVideoSyncFrameDecoder)initWithDecoderSettings:(id)a3 formatDescription:(opaqueCMFormatDescription *)a4 rotationAngle:(int)a5;
- (id).cxx_construct;
- (void)dealloc;
@end

@implementation VCPVideoSyncFrameDecoder

- (VCPVideoSyncFrameDecoder)initWithDecoderSettings:(id)a3 formatDescription:(opaqueCMFormatDescription *)a4 rotationAngle:(int)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v45.receiver = self;
  v45.super_class = (Class)VCPVideoSyncFrameDecoder;
  v9 = [(VCPVideoSyncFrameDecoder *)&v45 init];
  if (!v9) {
    goto LABEL_34;
  }
  v10 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v11 = *MEMORY[0x1E4F24E10];
  v12 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F24E10]];
  [v10 setObject:v12 forKeyedSubscript:v11];

  uint64_t v13 = *MEMORY[0x1E4F24D08];
  v14 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F24D08]];
  [v10 setObject:v14 forKeyedSubscript:v13];

  uint64_t v15 = *MEMORY[0x1E4F24D70];
  v16 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F24D70]];
  [v10 setObject:v16 forKeyedSubscript:v15];

  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v17 = VCPLogInstance();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v47 = v18;
      __int16 v48 = 2112;
      v49 = v10;
      id v19 = v18;
      _os_log_impl(&dword_1BBEDA000, v17, OS_LOG_TYPE_INFO, "[%@] Creating VTDecompressionSession with pixelBufferAttributes %@", buf, 0x16u);
    }
  }
  v20 = VCPSignPostLog();
  os_signpost_id_t v21 = os_signpost_id_generate(v20);

  v22 = VCPSignPostLog();
  v23 = v22;
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "VTDecompressionSession_Create", "", buf, 2u);
  }

  value = v9->_decompressionSession.value_;
  if (value)
  {
    CFRelease(value);
    v9->_decompressionSession.value_ = 0;
  }
  if (!VTDecompressionSessionCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a4, 0, (CFDictionaryRef)v10, 0, &v9->_decompressionSession.value_))
  {
    v29 = VCPSignPostLog();
    v30 = v29;
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v30, OS_SIGNPOST_INTERVAL_END, v21, "VTDecompressionSession_Create", "", buf, 2u);
    }

    v9->_requiresRotation = a5 != 0;
    if (a5)
    {
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        v31 = VCPLogInstance();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          v32 = objc_opt_class();
          *(_DWORD *)buf = 138412546;
          v47 = v32;
          __int16 v48 = 1024;
          LODWORD(v49) = a5;
          id v33 = v32;
          _os_log_impl(&dword_1BBEDA000, v31, OS_LOG_TYPE_INFO, "[%@] Creating ma::Rotator with rotation angle %d", buf, 0x12u);
        }
      }
      v34 = VCPSignPostLog();
      os_signpost_id_t v35 = os_signpost_id_generate(v34);

      v36 = VCPSignPostLog();
      v37 = v36;
      if (v35 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v37, OS_SIGNPOST_INTERVAL_BEGIN, v35, "MARotator_Create", "", buf, 2u);
      }

      v38 = (Rotator *)operator new(0x20uLL, MEMORY[0x1E4FBA2D0]);
      if (!v38)
      {
        v9->_rotator = 0;
        if ((int)MediaAnalysisLogLevel() < 3) {
          goto LABEL_16;
        }
        v25 = VCPLogInstance();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v43 = objc_opt_class();
          *(_DWORD *)buf = 138412290;
          v47 = v43;
          id v44 = v43;
          _os_log_impl(&dword_1BBEDA000, v25, OS_LOG_TYPE_ERROR, "[%@] Failed to create ma::Rotator", buf, 0xCu);
        }
        goto LABEL_15;
      }
      v39 = v38;
      ma::Rotator::Rotator((uint64_t)v38, a5);
      v9->_rotator = v39;
      v40 = VCPSignPostLog();
      v41 = v40;
      if (v35 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v41, OS_SIGNPOST_INTERVAL_END, v35, "MARotator_Create", "", buf, 2u);
      }
    }
LABEL_34:
    v28 = v9;
    goto LABEL_35;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v25 = VCPLogInstance();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v47 = v26;
      id v27 = v26;
      _os_log_impl(&dword_1BBEDA000, v25, OS_LOG_TYPE_ERROR, "[%@] Failed to create VTDecompressionSession", buf, 0xCu);
    }
LABEL_15:
  }
LABEL_16:

  v28 = 0;
LABEL_35:

  return v28;
}

- (void)dealloc
{
  rotator = self->_rotator;
  if (rotator)
  {
    ma::Rotator::~Rotator((ma::Rotator *)rotator);
    MEMORY[0x1C186C7D0]();
  }
  v4.receiver = self;
  v4.super_class = (Class)VCPVideoSyncFrameDecoder;
  [(VCPVideoSyncFrameDecoder *)&v4 dealloc];
}

+ (BOOL)readBigEndianInt:(int *)a3 fromBlockBuffer:(OpaqueCMBlockBuffer *)a4 forNumBytes:(int)a5 atOffset:(unint64_t)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  size_t totalLengthOut = 0;
  size_t lengthAtOffsetOut = 0;
  dataPointerOut = 0;
  if (CMBlockBufferGetDataPointer(a4, a6, &lengthAtOffsetOut, &totalLengthOut, &dataPointerOut))
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v9 = VCPLogInstance();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        v22 = v10;
        id v11 = v10;
        _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_ERROR, "[%@] Failed to obtain raw data pointer from the given block buffer", buf, 0xCu);
      }
LABEL_21:

      return 0;
    }
    return 0;
  }
  if (lengthAtOffsetOut + a6 != totalLengthOut)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v9 = VCPLogInstance();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        v22 = v13;
        id v14 = v13;
        _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_ERROR, "[%@] The input block buffer is not contiguous", buf, 0xCu);
      }
      goto LABEL_21;
    }
    return 0;
  }
  switch(a5)
  {
    case 4:
      int v12 = bswap32(*(_DWORD *)dataPointerOut);
      goto LABEL_17;
    case 2:
      int v12 = bswap32(*(unsigned __int16 *)dataPointerOut) >> 16;
      goto LABEL_17;
    case 1:
      int v12 = *dataPointerOut;
LABEL_17:
      *a3 = v12;
      return 1;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v9 = VCPLogInstance();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v16 = objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v22 = v16;
      __int16 v23 = 1024;
      int v24 = a5;
      id v17 = v16;
      _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_ERROR, "[%@] Invalid parameter for numBytes: %d", buf, 0x12u);
    }
    goto LABEL_21;
  }
  return 0;
}

+ (BOOL)isSyncFrameForCMSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  *(void *)&v49[13] = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      uint64_t v13 = VCPLogInstance();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v47 = (id)objc_opt_class();
        id v14 = v47;
        _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_DEFAULT, "[%@] Requested CMSampleBuffer is NULL", buf, 0xCu);
      }
      goto LABEL_36;
    }
    return 0;
  }
  FormatDescription = CMSampleBufferGetFormatDescription(a3);
  if (!FormatDescription)
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      uint64_t v13 = VCPLogInstance();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v47 = (id)objc_opt_class();
        id v15 = v47;
        _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_DEFAULT, "[%@] No format description in the requested CMSampleBuffer", buf, 0xCu);
      }
      goto LABEL_36;
    }
    return 0;
  }
  v5 = FormatDescription;
  FourCharCode MediaSubType = CMFormatDescriptionGetMediaSubType(FormatDescription);
  FourCharCode v7 = MediaSubType;
  if (MediaSubType != 1635148593 && MediaSubType != 1752589105)
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      v16 = VCPLogInstance();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v47 = (id)objc_opt_class();
        __int16 v48 = 1024;
        *(_DWORD *)v49 = v7;
        id v17 = v47;
        _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_DEFAULT, "[%@] Unsupported codec type: %d", buf, 0x12u);
      }
    }
    return 0;
  }
  DataBuffer = CMSampleBufferGetDataBuffer(a3);
  if (!DataBuffer)
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      uint64_t v13 = VCPLogInstance();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v47 = (id)objc_opt_class();
        id v18 = v47;
        _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_DEFAULT, "[%@] No block buffer in the requested CMSampleBuffer", buf, 0xCu);
      }
LABEL_36:

      return 0;
    }
    return 0;
  }
  CMBlockBufferRef blockBufferOut = 0;
  CMBlockBufferCreateContiguous(0, DataBuffer, 0, 0, 0, 0, 0, &blockBufferOut);
  if (v7 != 1752589105)
  {
    if (v7 != 1635148593) {
      goto LABEL_60;
    }
    int NALUnitHeaderLengthOut = 0;
    if (!CMVideoFormatDescriptionGetH264ParameterSetAtIndex(v5, 0, 0, 0, 0, &NALUnitHeaderLengthOut)
      && NALUnitHeaderLengthOut)
    {
      size_t DataLength = CMBlockBufferGetDataLength(blockBufferOut);
      if (DataLength > NALUnitHeaderLengthOut + 1)
      {
        uint64_t v10 = 0;
        while (1)
        {
          int v43 = 0;
          if (([(id)objc_opt_class() readBigEndianInt:&v43 fromBlockBuffer:blockBufferOut forNumBytes:NALUnitHeaderLengthOut atOffset:v10] & 1) == 0)break; {
          if (v43 <= 0)
          }
          {
            if ((int)MediaAnalysisLogLevel() < 4) {
              goto LABEL_60;
            }
            v28 = VCPLogInstance();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              v29 = objc_opt_class();
              *(_DWORD *)buf = 138412546;
              id v47 = v29;
              __int16 v48 = 1024;
              *(_DWORD *)v49 = v43;
              id v30 = v29;
              _os_log_impl(&dword_1BBEDA000, v28, OS_LOG_TYPE_DEFAULT, "[%@][H264] Invalid NAL Unit length %d", buf, 0x12u);
            }
            goto LABEL_71;
          }
          if (DataLength < (unint64_t)v43 + 4)
          {
            if ((int)MediaAnalysisLogLevel() < 4) {
              goto LABEL_60;
            }
            v28 = VCPLogInstance();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              id v33 = objc_opt_class();
              *(_DWORD *)buf = 138412802;
              id v47 = v33;
              __int16 v48 = 1024;
              *(_DWORD *)v49 = v43;
              v49[2] = 2048;
              *(void *)&v49[3] = DataLength;
              id v34 = v33;
              _os_log_impl(&dword_1BBEDA000, v28, OS_LOG_TYPE_DEFAULT, "[%@][H264] Attempting to read past end of block buffer (NAL Unit length %d, remaining block buffer length %zu)", buf, 0x1Cu);
            }
            goto LABEL_71;
          }
          unsigned int v42 = 0;
          char v11 = [(id)objc_opt_class() readBigEndianInt:&v42 fromBlockBuffer:blockBufferOut forNumBytes:1 atOffset:v10 + NALUnitHeaderLengthOut];
          if ((v11 & 1) == 0) {
            goto LABEL_61;
          }
          if ((v42 & 0x80) != 0)
          {
            if ((int)MediaAnalysisLogLevel() < 4) {
              goto LABEL_60;
            }
            v37 = VCPLogInstance();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              v38 = objc_opt_class();
              *(_DWORD *)buf = 138412546;
              id v47 = v38;
              __int16 v48 = 2048;
              *(void *)v49 = 1;
              id v39 = v38;
              _os_log_impl(&dword_1BBEDA000, v37, OS_LOG_TYPE_DEFAULT, "[%@][H264] Invalid forbidden zero bit value %zu", buf, 0x16u);
            }
            goto LABEL_79;
          }
          if ((v42 & 0x60) != 0 && (v42 & 0x1F) == 5) {
            goto LABEL_61;
          }
          uint64_t v12 = v43 + (uint64_t)NALUnitHeaderLengthOut;
          v10 += v12;
          DataLength -= v12;
          if (DataLength <= NALUnitHeaderLengthOut + 1) {
            goto LABEL_60;
          }
        }
      }
      goto LABEL_60;
    }
    if ((int)MediaAnalysisLogLevel() < 4) {
      goto LABEL_60;
    }
    __int16 v23 = VCPLogInstance();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      id v47 = v24;
      id v25 = v24;
      _os_log_impl(&dword_1BBEDA000, v23, OS_LOG_TYPE_DEFAULT, "[%@][H264] Failed to get NAL Unit header length", buf, 0xCu);
    }
LABEL_59:

    goto LABEL_60;
  }
  int NALUnitHeaderLengthOut = 0;
  if (!CMVideoFormatDescriptionGetHEVCParameterSetAtIndex(v5, 0, 0, 0, 0, &NALUnitHeaderLengthOut)
    && NALUnitHeaderLengthOut)
  {
    size_t v20 = CMBlockBufferGetDataLength(blockBufferOut);
    if (v20 > NALUnitHeaderLengthOut + 2)
    {
      uint64_t v21 = 0;
      while (1)
      {
        int v43 = 0;
        if (([(id)objc_opt_class() readBigEndianInt:&v43 fromBlockBuffer:blockBufferOut forNumBytes:NALUnitHeaderLengthOut atOffset:v21] & 1) == 0)goto LABEL_60; {
        if (v43 <= 1)
        }
        {
          if ((int)MediaAnalysisLogLevel() < 4) {
            goto LABEL_60;
          }
          v28 = VCPLogInstance();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            v31 = objc_opt_class();
            *(_DWORD *)buf = 138412546;
            id v47 = v31;
            __int16 v48 = 1024;
            *(_DWORD *)v49 = v43;
            id v32 = v31;
            _os_log_impl(&dword_1BBEDA000, v28, OS_LOG_TYPE_DEFAULT, "[%@][HEVC] Invalid NAL Unit length %d", buf, 0x12u);
          }
          goto LABEL_71;
        }
        if (v20 < (unint64_t)v43 + 4) {
          break;
        }
        unsigned int v42 = 0;
        char v11 = [(id)objc_opt_class() readBigEndianInt:&v42 fromBlockBuffer:blockBufferOut forNumBytes:2 atOffset:v21 + NALUnitHeaderLengthOut];
        if ((v11 & 1) == 0) {
          goto LABEL_61;
        }
        if ((v42 & 0x8000) != 0)
        {
          if ((int)MediaAnalysisLogLevel() >= 4)
          {
            v37 = VCPLogInstance();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              v40 = objc_opt_class();
              *(_DWORD *)buf = 138412546;
              id v47 = v40;
              __int16 v48 = 2048;
              *(void *)v49 = 1;
              id v41 = v40;
              _os_log_impl(&dword_1BBEDA000, v37, OS_LOG_TYPE_DEFAULT, "[%@][HEVC] Invalid forbidden zero bit value %zu", buf, 0x16u);
            }
LABEL_79:
          }
          goto LABEL_60;
        }
        if ((v42 & 0x1F8) == 0 && ((v42 >> 9) & 0x3E) - 16 < 6) {
          goto LABEL_61;
        }
        uint64_t v22 = v43 + (uint64_t)NALUnitHeaderLengthOut;
        v21 += v22;
        v20 -= v22;
        if (v20 <= NALUnitHeaderLengthOut + 2) {
          goto LABEL_60;
        }
      }
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        v28 = VCPLogInstance();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          os_signpost_id_t v35 = objc_opt_class();
          *(_DWORD *)buf = 138412802;
          id v47 = v35;
          __int16 v48 = 1024;
          *(_DWORD *)v49 = v43;
          v49[2] = 2048;
          *(void *)&v49[3] = v20;
          id v36 = v35;
          _os_log_impl(&dword_1BBEDA000, v28, OS_LOG_TYPE_DEFAULT, "[%@][HEVC] Attempting to read past end of block buffer (NAL Unit length %d, remaining block buffer length %zu)", buf, 0x1Cu);
        }
LABEL_71:

        goto LABEL_60;
      }
    }
    goto LABEL_60;
  }
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    __int16 v23 = VCPLogInstance();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v26 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      id v47 = v26;
      id v27 = v26;
      _os_log_impl(&dword_1BBEDA000, v23, OS_LOG_TYPE_DEFAULT, "[%@][HEVC] Failed to get NAL Unit header length", buf, 0xCu);
    }
    goto LABEL_59;
  }
LABEL_60:
  char v11 = 0;
LABEL_61:
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&blockBufferOut);
  return v11;
}

- (BOOL)decodeCMSampleBuffer:(opaqueCMSampleBuffer *)a3 toCMSampleBuffer:(opaqueCMSampleBuffer *)a4 error:(id *)a5
{
  v78[1] = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    if (a5)
    {
      id v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v77 = *MEMORY[0x1E4F28568];
      size_t v20 = [NSString stringWithFormat:@"[%@] No CMSampleBuffer", objc_opt_class()];
      v78[0] = v20;
      uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v78 forKeys:&v77 count:1];
      *a5 = [v19 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v21];
    }
    return 0;
  }
  if (!self->_decompressionSession.value_)
  {
    if (a5)
    {
      uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v75 = *MEMORY[0x1E4F28568];
      __int16 v23 = [NSString stringWithFormat:@"[%@] No VTDecompressionSession", objc_opt_class()];
      v76 = v23;
      int v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v76 forKeys:&v75 count:1];
      *a5 = [v22 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v24];
    }
    return 0;
  }
  uint64_t v55 = 0;
  v56 = (const void **)&v55;
  uint64_t v57 = 0x3812000000;
  v58 = __Block_byref_object_copy__23;
  v59 = __Block_byref_object_dispose__23;
  v60 = &unk_1BC33760A;
  v61 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__VCPVideoSyncFrameDecoder_decodeCMSampleBuffer_toCMSampleBuffer_error___block_invoke;
  aBlock[3] = &unk_1E6299188;
  aBlock[4] = &v55;
  v9 = _Block_copy(aBlock);
  uint64_t v10 = VCPSignPostLog();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);

  uint64_t v12 = VCPSignPostLog();
  uint64_t v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    LOWORD(buf.duration.value) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "VTDecompressionSession_Decode", "", (uint8_t *)&buf, 2u);
  }

  OSStatus v14 = VTDecompressionSessionDecodeFrameWithOutputHandler(self->_decompressionSession.value_, a3, 0, 0, v9);
  if (!v14)
  {
    v26 = VCPSignPostLog();
    id v27 = v26;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      LOWORD(buf.duration.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v27, OS_SIGNPOST_INTERVAL_END, v11, "VTDecompressionSession_Decode", "", (uint8_t *)&buf, 2u);
    }

    if (!v56[6])
    {
      if (a5)
      {
        v38 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v71 = *MEMORY[0x1E4F28568];
        id v39 = [NSString stringWithFormat:@"[%@] Failed to decode sync frame", objc_opt_class()];
        v72 = v39;
        v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v72 forKeys:&v71 count:1];
        *a5 = [v38 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v40];
      }
      goto LABEL_9;
    }
    if (self->_requiresRotation)
    {
      if (!self->_rotator)
      {
        if (a5)
        {
          id v41 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v69 = *MEMORY[0x1E4F28568];
          unsigned int v42 = [NSString stringWithFormat:@"[%@] No ma::Rotator", objc_opt_class()];
          v70 = v42;
          int v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v70 forKeys:&v69 count:1];
          *a5 = [v41 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v43];
        }
        goto LABEL_9;
      }
      buf.duration.value = 0;
      v28 = VCPSignPostLog();
      os_signpost_id_t v29 = os_signpost_id_generate(v28);

      id v30 = VCPSignPostLog();
      v31 = v30;
      if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
      {
        LOWORD(v53.value) = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v31, OS_SIGNPOST_INTERVAL_BEGIN, v29, "MARotator_Rotate", "", (uint8_t *)&v53, 2u);
      }

      rotator = self->_rotator;
      id v33 = (__CVBuffer *)v56[6];
      if (buf.duration.value)
      {
        CFRelease((CFTypeRef)buf.duration.value);
        buf.duration.value = 0;
      }
      int v34 = ma::Rotator::Rotate((ma::Rotator *)rotator, v33, (CFTypeRef *)&buf);
      if (v34)
      {
        if (a5)
        {
          os_signpost_id_t v35 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v67 = *MEMORY[0x1E4F28568];
          id v36 = [NSString stringWithFormat:@"[%@] Failed to perform rotation", objc_opt_class()];
          v68 = v36;
          v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v68 forKeys:&v67 count:1];
          *a5 = [v35 errorWithDomain:*MEMORY[0x1E4F28760] code:v34 userInfo:v37];
        }
        CF<opaqueCMSampleBuffer *>::~CF((const void **)&buf);
        goto LABEL_9;
      }
      id v44 = VCPSignPostLog();
      objc_super v45 = v44;
      if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v44))
      {
        LOWORD(v53.value) = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v45, OS_SIGNPOST_INTERVAL_END, v29, "MARotator_Rotate", "", (uint8_t *)&v53, 2u);
      }

      CF<__CVBuffer *>::operator=(v56 + 6, (const void **)&buf);
      CF<opaqueCMSampleBuffer *>::~CF((const void **)&buf);
    }
    memset(&v53, 0, sizeof(v53));
    CMSampleBufferGetPresentationTimeStamp(&v53, a3);
    v46 = (__CVBuffer *)v56[6];
    CMTime v52 = v53;
    CMVideoFormatDescriptionRef formatDescriptionOut = 0;
    OSStatus v47 = CMVideoFormatDescriptionCreateForImageBuffer(0, v46, &formatDescriptionOut);
    if (v47)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        __int16 v48 = VCPLogInstance();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf.duration.value) = 0;
          _os_log_impl(&dword_1BBEDA000, v48, OS_LOG_TYPE_ERROR, "[CVPixelBuffer->CMSampleBuffer] Failed to create format description", (uint8_t *)&buf, 2u);
        }
LABEL_49:
      }
    }
    else
    {
      *(_OWORD *)&buf.duration.value = *MEMORY[0x1E4F1F9F8];
      buf.duration.epoch = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
      buf.presentationTimeStamp = v52;
      buf.decodeTimeStamp = buf.duration;
      OSStatus v47 = CMSampleBufferCreateReadyWithImageBuffer((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v46, formatDescriptionOut, &buf, a4);
      if (v47 && (int)MediaAnalysisLogLevel() >= 3)
      {
        __int16 v48 = VCPLogInstance();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v62 = 0;
          _os_log_impl(&dword_1BBEDA000, v48, OS_LOG_TYPE_ERROR, "[CVPixelBuffer->CMSampleBuffer] Failed to create CMSampleBuffer", v62, 2u);
        }
        goto LABEL_49;
      }
    }
    CF<opaqueCMSampleBuffer *>::~CF((const void **)&formatDescriptionOut);
    BOOL v18 = v47 == 0;
    if (a5 && v47)
    {
      v49 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v65 = *MEMORY[0x1E4F28568];
      uint64_t v50 = [NSString stringWithFormat:@"[%@] Failed to perform CMSampleBuffer_CreateWithCVPixelBuffer", objc_opt_class()];
      v66 = v50;
      v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v66 forKeys:&v65 count:1];
      *a5 = [v49 errorWithDomain:*MEMORY[0x1E4F28760] code:v47 userInfo:v51];
    }
    goto LABEL_10;
  }
  if (a5)
  {
    id v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v73 = *MEMORY[0x1E4F28568];
    v16 = [NSString stringWithFormat:@"[%@] Failed to perform VTDecompressionSessionDecodeFrameWithOutputHandler", objc_opt_class()];
    v74 = v16;
    id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v74 forKeys:&v73 count:1];
    *a5 = [v15 errorWithDomain:*MEMORY[0x1E4F28760] code:v14 userInfo:v17];
  }
LABEL_9:
  BOOL v18 = 0;
LABEL_10:

  _Block_object_dispose(&v55, 8);
  CF<opaqueCMSampleBuffer *>::~CF(&v61);
  return v18;
}

void __72__VCPVideoSyncFrameDecoder_decodeCMSampleBuffer_toCMSampleBuffer_error___block_invoke(uint64_t a1, int a2, int a3, CFTypeRef cf)
{
  v7[1] = *(const void **)MEMORY[0x1E4F143B8];
  if (cf)
  {
    v7[0] = CFRetain(cf);
    CF<__CVBuffer *>::operator=((const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 48), v7);
    CF<opaqueCMSampleBuffer *>::~CF(v7);
  }
  else if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v6 = VCPLogInstance();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v7[0]) = 67109120;
      HIDWORD(v7[0]) = a2;
      _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_ERROR, "Failed to decode CMSampleBuffer via VTDecompressionSession (%d)", (uint8_t *)v7, 8u);
    }
  }
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end