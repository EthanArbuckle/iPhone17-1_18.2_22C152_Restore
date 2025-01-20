@interface MADPNGAlphaSequenceWriter
- (MADPNGAlphaSequenceWriter)initWithFrameCount:(unint64_t)a3;
- (id).cxx_construct;
- (id)finishWithEndTime:(id *)a3;
- (id)transcodeWithMaxDimension:(unint64_t)a3;
- (int)addPixelBuffer:(__CVBuffer *)a3 withTime:(id *)a4;
@end

@implementation MADPNGAlphaSequenceWriter

- (MADPNGAlphaSequenceWriter)initWithFrameCount:(unint64_t)a3
{
  v18[2] = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)MADPNGAlphaSequenceWriter;
  v4 = [(MADPNGAlphaSequenceWriter *)&v14 init];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA58] data];
    data = v4->_data;
    v4->_data = (NSMutableData *)v5;

    v7 = (__CFData *)v4->_data;
    v8 = [(id)*MEMORY[0x1E4F44460] identifier];
    CGImageDestinationRef v13 = CGImageDestinationCreateWithData(v7, v8, a3, 0);
    CF<__CVBuffer *>::operator=((const void **)&v4->_destination.value_, (const void **)&v13);
    CF<opaqueCMSampleBuffer *>::~CF((const void **)&v13);

    value = v4->_destination.value_;
    if (value)
    {
      v17[0] = *MEMORY[0x1E4F2FCD8];
      uint64_t v15 = *MEMORY[0x1E4F2F4C8];
      v16 = &unk_1F15ED770;
      v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
      v17[1] = *MEMORY[0x1E4F2FB40];
      v18[0] = v10;
      v18[1] = MEMORY[0x1E4F1CC38];
      CGImageDestinationSetProperties(value, (CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2]);
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v11 = VCPLogInstance();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v13) = 0;
          _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_ERROR, "Failed to create PNG sequence destination", (uint8_t *)&v13, 2u);
        }
      }
      v4->_status = -18;
    }
    v4->_remainingFrameCount = a3;
  }
  return v4;
}

- (int)addPixelBuffer:(__CVBuffer *)a3 withTime:(id *)a4
{
  v4 = self;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  LODWORD(self) = self->_status;
  if (self) {
    return (int)self;
  }
  if (v4->_remainingFrameCount)
  {
    value = v4->_lastPixelBuffer.value_;
    if (!value)
    {
LABEL_9:
      lhs.value = (CMTimeValue)CFRetain(a3);
      CF<__CVBuffer *>::operator=((const void **)&v4->_lastPixelBuffer.value_, (const void **)&lhs);
      CF<opaqueCMSampleBuffer *>::~CF((const void **)&lhs);
      LODWORD(self) = 0;
      int64_t var3 = a4->var3;
      *(_OWORD *)&v4->_lastPTS.value = *(_OWORD *)&a4->var0;
      v4->_lastPTS.epoch = var3;
      return (int)self;
    }
    p_value = &v4->_lastImage.value_;
    v9 = v4->_lastImage.value_;
    if (v9)
    {
      CFRelease(v9);
      CGImageRef *p_value = 0;
    }
    LODWORD(self) = VTCreateCGImageFromCVPixelBuffer(value, 0, &v4->_lastImage.value_);
    v4->_status = (int)self;
    if (!self)
    {
      v10 = (void *)MEMORY[0x1E4F1CA60];
      uint64_t v25 = *MEMORY[0x1E4F2FCD8];
      uint64_t v23 = *MEMORY[0x1E4F2F4D0];
      v11 = NSNumber;
      CMTime lhs = (CMTime)*a4;
      CMTime rhs = (CMTime)v4->_lastPTS;
      CMTimeSubtract(&time, &lhs, &rhs);
      v12 = [v11 numberWithDouble:CMTimeGetSeconds(&time)];
      v24 = v12;
      CGImageDestinationRef v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      v26 = v13;
      objc_super v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      CFDictionaryRef v15 = [v10 dictionaryWithDictionary:v14];

      CGImageDestinationAddImage(v4->_destination.value_, *p_value, v15);
      --v4->_remainingFrameCount;

      goto LABEL_9;
    }
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      v17 = VCPLogInstance();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int64_t var0 = a4->var0;
        int var1 = a4->var1;
        LODWORD(lhs.value) = 134218240;
        *(CMTimeValue *)((char *)&lhs.value + 4) = var0;
        LOWORD(lhs.flags) = 1024;
        *(CMTimeFlags *)((char *)&lhs.flags + 2) = var1;
        _os_log_impl(&dword_1BBEDA000, v17, OS_LOG_TYPE_DEFAULT, "PNG sequence full; dropping pixel buffer (%lld/%d)",
          (uint8_t *)&lhs,
          0x12u);
      }
    }
    self = (MADPNGAlphaSequenceWriter *)v4->_lastImage.value_;
    if (self)
    {
      CFRelease(self);
      LODWORD(self) = 0;
      v4->_lastImage.value_ = 0;
    }
  }
  return (int)self;
}

- (id)finishWithEndTime:(id *)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (self->_status) {
    goto LABEL_2;
  }
  unint64_t remainingFrameCount = self->_remainingFrameCount;
  if (remainingFrameCount)
  {
    if (remainingFrameCount != 1 && (int)MediaAnalysisLogLevel() >= 4)
    {
      v8 = VCPLogInstance();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = LODWORD(self->_remainingFrameCount) - 1;
        LODWORD(buf.var0) = 67109120;
        HIDWORD(buf.var0) = v9;
        _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_DEFAULT, "PNG sequence expected %d more frames; repeating last",
          (uint8_t *)&buf,
          8u);
      }
    }
    $3CC8671D27C23BF42ADDB32F2B5E48AE buf = *a3;
    CMTime time2 = (CMTime)self->_lastPTS;
    if (CMTimeCompare((CMTime *)&buf, &time2) < 0)
    {
      if ((int)MediaAnalysisLogLevel() < 3) {
        goto LABEL_2;
      }
      CGImageDestinationRef v13 = VCPLogInstance();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.var0) = 0;
        _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_ERROR, "Invalid PNG sequence end time specified", (uint8_t *)&buf, 2u);
      }
      goto LABEL_19;
    }
    value = self->_lastPixelBuffer.value_;
    p_lastImage = &self->_lastImage;
    v12 = self->_lastImage.value_;
    if (v12)
    {
      CFRelease(v12);
      p_lastImage->value_ = 0;
    }
    if (VTCreateCGImageFromCVPixelBuffer(value, 0, &self->_lastImage.value_))
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
LABEL_2:
        v3 = 0;
        goto LABEL_3;
      }
      CGImageDestinationRef v13 = VCPLogInstance();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.var0) = 0;
        _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_ERROR, "Failed to convert CVPixelBuffer to CGImage", (uint8_t *)&buf, 2u);
      }
LABEL_19:

      goto LABEL_2;
    }
    $3CC8671D27C23BF42ADDB32F2B5E48AE buf = *a3;
    CMTime time2 = (CMTime)self->_lastPTS;
    CMTimeSubtract(&time, (CMTime *)&buf, &time2);
    double Seconds = CMTimeGetSeconds(&time);
    unint64_t v18 = self->_remainingFrameCount;
    if (v18)
    {
      double v19 = Seconds / (double)v18;
      uint64_t v20 = *MEMORY[0x1E4F2FCD8];
      uint64_t v21 = *MEMORY[0x1E4F2F4D0];
      do
      {
        v22 = (void *)MEMORY[0x1E4F1CA60];
        uint64_t v32 = v20;
        uint64_t v30 = v21;
        uint64_t v23 = [NSNumber numberWithDouble:v19];
        v31 = v23;
        v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
        v33 = v24;
        uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
        CFDictionaryRef v26 = [v22 dictionaryWithDictionary:v25];

        CGImageDestinationAddImage(self->_destination.value_, p_lastImage->value_, v26);
        --self->_remainingFrameCount;
      }
      while (self->_remainingFrameCount);
    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 4)
  {
    objc_super v14 = VCPLogInstance();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v15 = self->_lastPTS.value;
      int timescale = self->_lastPTS.timescale;
      LODWORD(buf.var0) = 134218240;
      *(int64_t *)((char *)&buf.var0 + 4) = v15;
      LOWORD(buf.var2) = 1024;
      *(unsigned int *)((char *)&buf.var2 + 2) = timescale;
      _os_log_impl(&dword_1BBEDA000, v14, OS_LOG_TYPE_DEFAULT, "PNG sequence full; dropping pixel buffer (%lld/%d)",
        (uint8_t *)&buf,
        0x12u);
    }
  }
  if (!CGImageDestinationFinalize(self->_destination.value_))
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v27 = VCPLogInstance();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.var0) = 0;
        _os_log_impl(&dword_1BBEDA000, v27, OS_LOG_TYPE_ERROR, "Failed to finalize output PNG sequence", (uint8_t *)&buf, 2u);
      }
    }
    goto LABEL_2;
  }
  v3 = self->_data;
LABEL_3:
  return v3;
}

- (id)transcodeWithMaxDimension:(unint64_t)a3
{
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v3 = VCPLogInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_ERROR, "Transcode not supported", v5, 2u);
    }
  }
  return 0;
}

- (void).cxx_destruct
{
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_lastImage.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_lastPixelBuffer.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_destination.value_);
  objc_storeStrong((id *)&self->_data, 0);
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 4) = 0;
  *((void *)self + 8) = 0;
  return self;
}

@end