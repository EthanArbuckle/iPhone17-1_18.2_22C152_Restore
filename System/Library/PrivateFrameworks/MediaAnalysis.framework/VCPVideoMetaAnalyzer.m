@interface VCPVideoMetaAnalyzer
+ (id)analyzerForTrackType:(id)a3 withTransform:(CGAffineTransform *)a4 requestAnalyses:(unint64_t)a5 formatDescription:(opaqueCMFormatDescription *)a6;
- (NSDictionary)privateResults;
- (NSDictionary)publicResults;
- (float)photoOffset;
- (int)finalizeAnalysis;
- (int)processMetadataGroup:(id)a3 flags:(unint64_t *)a4;
- (void)setPhotoOffset:(float)a3;
@end

@implementation VCPVideoMetaAnalyzer

+ (id)analyzerForTrackType:(id)a3 withTransform:(CGAffineTransform *)a4 requestAnalyses:(unint64_t)a5 formatDescription:(opaqueCMFormatDescription *)a6
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if ([v9 isEqualToString:*MEMORY[0x1E4F15D68]])
  {
    v10 = [VCPVideoMetaFaceAnalyzer alloc];
    long long v11 = *(_OWORD *)&a4->c;
    v18[0] = *(_OWORD *)&a4->a;
    v18[1] = v11;
    v18[2] = *(_OWORD *)&a4->tx;
    v12 = [(VCPVideoMetaFaceAnalyzer *)v10 initWithTransform:v18];
LABEL_11:
    v15 = v12;
    goto LABEL_12;
  }
  if ([v9 isEqualToString:*MEMORY[0x1E4F15D98]])
  {
    v13 = off_1E6296108;
LABEL_5:
    v12 = (VCPVideoMetaFaceAnalyzer *)objc_alloc_init(*v13);
    goto LABEL_11;
  }
  if ([v9 isEqualToString:@"mdta/com.apple.quicktime.live-photo-info"])
  {
    v14 = off_1E6296110;
LABEL_10:
    v12 = (VCPVideoMetaFaceAnalyzer *)[objc_alloc(*v14) initWithRequestAnalyses:a5 formatDescription:a6];
    goto LABEL_11;
  }
  if ([v9 isEqualToString:*MEMORY[0x1E4F218A0]])
  {
    v14 = off_1E6296100;
    goto LABEL_10;
  }
  if ([v9 isEqualToString:*MEMORY[0x1E4F1F168]])
  {
    v13 = &off_1E6296118;
    goto LABEL_5;
  }
  if ([v9 isEqualToString:@"mdta/com.apple.quicktime.smartstyle-info"])
  {
    v14 = off_1E62960F8;
    goto LABEL_10;
  }
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    v17 = VCPLogInstance();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v9;
      _os_log_impl(&dword_1BBEDA000, v17, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] [VCPVideoMetaAnalyzer] Unknown analysis type %@", buf, 0xCu);
    }
  }
  v15 = 0;
LABEL_12:

  return v15;
}

- (int)processMetadataGroup:(id)a3 flags:(unint64_t *)a4
{
  return -4;
}

- (int)finalizeAnalysis
{
  return 0;
}

- (NSDictionary)publicResults
{
  return 0;
}

- (NSDictionary)privateResults
{
  return 0;
}

- (float)photoOffset
{
  return self->_photoOffset;
}

- (void)setPhotoOffset:(float)a3
{
  self->_photoOffset = a3;
}

@end