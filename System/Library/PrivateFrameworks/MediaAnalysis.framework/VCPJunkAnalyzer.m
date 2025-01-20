@interface VCPJunkAnalyzer
- (int)analyzePixelBuffer:(__CVBuffer *)a3 flags:(unint64_t *)a4 results:(id *)a5 cancel:(id)a6;
@end

@implementation VCPJunkAnalyzer

- (int)analyzePixelBuffer:(__CVBuffer *)a3 flags:(unint64_t *)a4 results:(id *)a5 cancel:(id)a6
{
  v35[1] = *MEMORY[0x1E4F143B8];
  v8 = (uint64_t (**)(void))a6;
  *a5 = 0;
  id v9 = objc_alloc(MEMORY[0x1E4F45890]);
  v10 = (void *)[v9 initWithCVPixelBuffer:a3 options:MEMORY[0x1E4F1CC08]];
  if (!v10)
  {
    v11 = 0;
    int v12 = -108;
    goto LABEL_16;
  }
  if (!v8 || (v8[2](v8) & 1) == 0)
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F45868]);
    v11 = v13;
    if (!v13
      || ([v13 setPreferBackgroundProcessing:1],
          v35[0] = v11,
          [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1],
          v14 = objc_claimAutoreleasedReturnValue(),
          char v15 = [v10 performRequests:v14 error:0],
          v14,
          (v15 & 1) == 0))
    {
      int v12 = -18;
      goto LABEL_16;
    }
    v16 = [v11 results];
    BOOL v17 = [v16 count] == 1;

    if (v17)
    {
      v18 = [v11 results];
      v19 = [v18 objectAtIndexedSubscript:0];

      v33 = @"JunkResults";
      v30 = @"attributes";
      v28 = @"junk";
      v20 = NSNumber;
      [v19 confidence];
      v21 = objc_msgSend(v20, "numberWithFloat:");
      v29 = v21;
      v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
      v31 = v22;
      v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      v32 = v23;
      v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
      v34 = v24;
      *a5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 4)
      {
LABEL_15:
        int v12 = 0;
        goto LABEL_16;
      }
      v19 = VCPLogInstance();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v25 = [v11 results];
        v27[0] = 67109120;
        v27[1] = [v25 count];
        _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Junk analayzer - unexpected %d VNObservations", (uint8_t *)v27, 8u);
      }
    }

    goto LABEL_15;
  }
  v11 = 0;
  int v12 = -128;
LABEL_16:

  return v12;
}

@end