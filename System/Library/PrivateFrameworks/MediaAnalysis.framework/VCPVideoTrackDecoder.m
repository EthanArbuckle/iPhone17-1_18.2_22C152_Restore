@interface VCPVideoTrackDecoder
+ ($2825F4736939C4A6D3AD43837233062D)decodeDimensionsForTrack:(id)a3;
- (BOOL)validateDecodedFrame:(__CVBuffer *)a3 withSettings:(id)a4;
- (VCPVideoTrackDecoder)init;
- (VCPVideoTrackDecoder)initWithTrack:(id)a3;
- (id)settings;
- (int64_t)status;
- (opaqueCMSampleBuffer)copyNextSampleBuffer;
- (opaqueCMSampleBuffer)getNextCaptureSampleBuffer;
@end

@implementation VCPVideoTrackDecoder

+ ($2825F4736939C4A6D3AD43837233062D)decodeDimensionsForTrack:(id)a3
{
  id v3 = a3;
  [v3 naturalSize];
  double v5 = v4;
  double v7 = v6;
  if (v3)
  {
    [v3 preferredTransform];
    double v8 = *((double *)&v20 + 1);
    double v9 = *(double *)&v20;
    double v10 = *((double *)&v21 + 1);
    double v11 = *(double *)&v21;
  }
  else
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v20 = 0u;
    double v10 = 0.0;
    double v8 = 0.0;
    double v11 = 0.0;
    double v9 = 0.0;
  }
  int v12 = (int)fabs(v7 * v11 + v9 * v5);
  int v13 = (int)fabs(v7 * v10 + v8 * v5);
  if (v12 <= v13) {
    int v14 = v13;
  }
  else {
    int v14 = v12;
  }
  if (v14)
  {
    uint64_t v15 = (580 * v12 / v14) & 0xFFFFFFFE;
    unint64_t v16 = (unint64_t)((580 * v13 / v14) & 0xFFFFFFFE) << 32;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v17 = VCPLogInstance();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v19 = 0;
        _os_log_impl(&dword_1BBEDA000, v17, OS_LOG_TYPE_ERROR, "Both width and height are zero", v19, 2u);
      }
    }
    uint64_t v15 = 0;
    unint64_t v16 = 0;
  }

  return ($2825F4736939C4A6D3AD43837233062D)(v16 | v15);
}

- (VCPVideoTrackDecoder)init
{
  return 0;
}

- (VCPVideoTrackDecoder)initWithTrack:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  double v6 = [v5 mediaType];
  if ([v6 isEqualToString:*MEMORY[0x1E4F15C18]])
  {
  }
  else
  {
    double v7 = [v5 mediaType];
    char v8 = [v7 isEqualToString:*MEMORY[0x1E4F15BB8]];

    if ((v8 & 1) == 0)
    {
LABEL_13:
      int v14 = 0;
      goto LABEL_14;
    }
  }
  $2825F4736939C4A6D3AD43837233062D v9 = +[VCPVideoTrackDecoder decodeDimensionsForTrack:v5];
  int var0 = v9.var0;
  unint64_t v11 = HIDWORD(*(unint64_t *)&v9);
  if (v9.var0 < 192 || v9.var1 <= 95)
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      uint64_t v15 = VCPLogInstance();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v19 = (float)((float)var0 / (float)(int)v11);
        _os_log_impl(&dword_1BBEDA000, v15, OS_LOG_TYPE_DEFAULT, "  Extreme aspect ratio %f; initialization failed",
          buf,
          0xCu);
      }
    }
    goto LABEL_13;
  }
  v17.receiver = self;
  v17.super_class = (Class)VCPVideoTrackDecoder;
  int v12 = [(VCPVideoTrackDecoder *)&v17 init];
  int v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_track, a3);
  }
  self = v13;
  int v14 = self;
LABEL_14:

  return v14;
}

- (id)settings
{
  v13[5] = *MEMORY[0x1E4F143B8];
  $2825F4736939C4A6D3AD43837233062D v2 = +[VCPVideoTrackDecoder decodeDimensionsForTrack:self->_track];
  uint64_t v3 = *MEMORY[0x1E4F24D70];
  v13[0] = &unk_1F15ED1E8;
  uint64_t v4 = *MEMORY[0x1E4F24E10];
  v12[0] = v3;
  v12[1] = v4;
  id v5 = [NSNumber numberWithInt:v2];
  unint64_t v6 = HIDWORD(*(unint64_t *)&v2);
  v13[1] = v5;
  v12[2] = *MEMORY[0x1E4F24D08];
  double v7 = [NSNumber numberWithInt:HIDWORD(*(unint64_t *)&v2)];
  v13[2] = v7;
  v12[3] = *MEMORY[0x1E4F24CE8];
  char v8 = [NSNumber numberWithInt:-v2.var0 & 0xF];
  v13[3] = v8;
  v12[4] = *MEMORY[0x1E4F24CD0];
  $2825F4736939C4A6D3AD43837233062D v9 = [NSNumber numberWithInt:-(int)v6 & 0xF];
  v13[4] = v9;
  double v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:5];

  return v10;
}

- (BOOL)validateDecodedFrame:(__CVBuffer *)a3 withSettings:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  unint64_t v6 = [v5 objectForKey:*MEMORY[0x1E4F24CE8]];
  unsigned int v7 = [v6 unsignedIntValue];

  char v8 = [v5 objectForKey:*MEMORY[0x1E4F24CD0]];
  unsigned int v9 = [v8 unsignedIntValue];

  size_t v15 = 0;
  size_t extraColumnsOnRight = 0;
  CVPixelBufferGetExtendedPixels(a3, 0, &extraColumnsOnRight, 0, &v15);
  uint64_t v10 = v7;
  BOOL v11 = extraColumnsOnRight == v7 && v15 == v9;
  BOOL v12 = v11;
  if (!v11 && (int)MediaAnalysisLogLevel() >= 3)
  {
    int v13 = VCPLogInstance();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218752;
      size_t v18 = extraColumnsOnRight;
      __int16 v19 = 2048;
      size_t v20 = v15;
      __int16 v21 = 2048;
      uint64_t v22 = v10;
      __int16 v23 = 2048;
      uint64_t v24 = v9;
      _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_ERROR, "[VideoTrackDecoder] Decoded frame and setting mismatch: actual padding right: %zupx, bottom: %zupx (expected right: %zupx, bottom: %zupx)", buf, 0x2Au);
    }
  }
  return v12;
}

- (int64_t)status
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"NotImplementedException" reason:@"[VideoTrackDecoder status] should not be called" userInfo:0];
  objc_exception_throw(v2);
}

- (opaqueCMSampleBuffer)copyNextSampleBuffer
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"NotImplementedException" reason:@"[VideoTrackDecoder copyNextSampleBuffer] should not be called" userInfo:0];
  objc_exception_throw(v2);
}

- (opaqueCMSampleBuffer)getNextCaptureSampleBuffer
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"NotImplementedException" reason:@"[VideoTrackDecoder getNextCaptureSampleBuffer] should not be called" userInfo:0];
  objc_exception_throw(v2);
}

- (void).cxx_destruct
{
}

@end