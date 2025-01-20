@interface VCPVideoAnalyzer
+ (unint64_t)dependencies;
- (id)results;
- (int)analyzeFrame:(__CVBuffer *)a3 withTimestamp:(id *)a4 andDuration:(id *)a5 flags:(unint64_t *)a6;
- (int)finishAnalysisPass:(id *)a3;
@end

@implementation VCPVideoAnalyzer

+ (unint64_t)dependencies
{
  return 0;
}

- (int)analyzeFrame:(__CVBuffer *)a3 withTimestamp:(id *)a4 andDuration:(id *)a5 flags:(unint64_t *)a6
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v6 = VCPLogInstance();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315138;
      v9 = "-[VCPVideoAnalyzer analyzeFrame:withTimestamp:andDuration:flags:]";
      _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_ERROR, "Unimplemented method %s", (uint8_t *)&v8, 0xCu);
    }
  }
  return -4;
}

- (int)finishAnalysisPass:(id *)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v3 = VCPLogInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315138;
      v6 = "-[VCPVideoAnalyzer finishAnalysisPass:]";
      _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_ERROR, "Unimplemented method %s", (uint8_t *)&v5, 0xCu);
    }
  }
  return -4;
}

- (id)results
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v2 = VCPLogInstance();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315138;
      int v5 = "-[VCPVideoAnalyzer results]";
      _os_log_impl(&dword_1BBEDA000, v2, OS_LOG_TYPE_ERROR, "Unimplemented method %s", (uint8_t *)&v4, 0xCu);
    }
  }
  return 0;
}

@end