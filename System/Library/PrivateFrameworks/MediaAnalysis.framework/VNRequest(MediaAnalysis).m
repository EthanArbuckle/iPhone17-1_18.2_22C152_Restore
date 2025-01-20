@interface VNRequest(MediaAnalysis)
+ (uint64_t)mad_includeEntityNet;
- (id)vcp_idealDimension;
- (void)vcp_idealDimension;
@end

@implementation VNRequest(MediaAnalysis)

+ (uint64_t)mad_includeEntityNet
{
  return 1;
}

- (id)vcp_idealDimension
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  NSSelectorFromString(&cfstr_Supportedimage.isa);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if ((int)MediaAnalysisLogLevel() < 4)
    {
      v9 = 0;
      goto LABEL_13;
    }
    v2 = VCPLogInstance();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v10 = [a1 description];
      int v13 = 138412290;
      v14 = v10;
      _os_log_impl(&dword_1BBEDA000, v2, OS_LOG_TYPE_DEFAULT, "Failed to query ideal dimension for request %@ because the request does not conform to VNImageIdealImageSizeProviding protocol", (uint8_t *)&v13, 0xCu);
    }
    goto LABEL_11;
  }
  v2 = [a1 supportedImageSizeSet];
  if (![v2 count])
  {
    v11 = VCPLogInstance();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      [(VNRequest(MediaAnalysis) *)a1 vcp_idealDimension];
    }

LABEL_11:
    v9 = 0;
    goto LABEL_12;
  }
  v3 = (void *)MEMORY[0x1E4F29238];
  v4 = [v2 objectAtIndexedSubscript:0];
  v5 = [v4 pixelsWideRange];
  double v6 = (double)(unint64_t)[v5 idealDimension];
  v7 = [v2 objectAtIndexedSubscript:0];
  v8 = [v7 pixelsHighRange];
  v9 = objc_msgSend(v3, "valueWithSize:", v6, (double)(unint64_t)objc_msgSend(v8, "idealDimension"));

LABEL_12:
LABEL_13:
  return v9;
}

- (void)vcp_idealDimension
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [a1 description];
  int v4 = 138412290;
  v5 = v3;
  _os_log_fault_impl(&dword_1BBEDA000, a2, OS_LOG_TYPE_FAULT, "Failed to query ideal dimension for request %@ due to empty supportedImageSizeSet", (uint8_t *)&v4, 0xCu);
}

@end