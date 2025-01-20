@interface MADAlphaSequenceWriter
+ (id)transcodeSequenceData:(id)a3 maxDimension:(unint64_t)a4 outputWidth:(unint64_t *)a5 outputHeight:(unint64_t *)a6;
+ (id)writerWithUniformTypeIdentifier:(id)a3 frameCount:(unint64_t)a4 crop:(CGRect *)a5;
- (id)finishWithEndTime:(id *)a3;
- (int)addPixelBuffer:(__CVBuffer *)a3 withTime:(id *)a4;
@end

@implementation MADAlphaSequenceWriter

+ (id)writerWithUniformTypeIdentifier:(id)a3 frameCount:(unint64_t)a4 crop:(CGRect *)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = [v7 identifier];
  int v9 = [v8 isEqual:@"public.heics"];

  if (v9)
  {
    v10 = [[MADHEICSAlphaSequenceWriter alloc] initWithFrameCount:a4 crop:a5];
LABEL_8:
    v12 = v10;
    goto LABEL_9;
  }
  if ([v7 isEqual:*MEMORY[0x1E4F44490]])
  {
    v11 = MADHEVCAlphaSequenceWriter;
LABEL_7:
    v10 = (MADHEICSAlphaSequenceWriter *)[[v11 alloc] initWithFrameCount:a4];
    goto LABEL_8;
  }
  if ([v7 isEqual:*MEMORY[0x1E4F44460]])
  {
    v11 = MADPNGAlphaSequenceWriter;
    goto LABEL_7;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v14 = VCPLogInstance();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138412290;
      id v16 = v7;
      _os_log_impl(&dword_1BBEDA000, v14, OS_LOG_TYPE_ERROR, "Output type %@ not supported", (uint8_t *)&v15, 0xCu);
    }
  }
  v12 = 0;
LABEL_9:

  return v12;
}

- (int)addPixelBuffer:(__CVBuffer *)a3 withTime:(id *)a4
{
  return -4;
}

- (id)finishWithEndTime:(id *)a3
{
  return 0;
}

+ (id)transcodeSequenceData:(id)a3 maxDimension:(unint64_t)a4 outputWidth:(unint64_t *)a5 outputHeight:(unint64_t *)a6
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v6 = VCPLogInstance();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = (objc_class *)objc_opt_class();
      v8 = NSStringFromClass(v7);
      int v10 = 138412290;
      v11 = v8;
      _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_ERROR, "[%@] Transcode not supported", (uint8_t *)&v10, 0xCu);
    }
  }
  return 0;
}

@end