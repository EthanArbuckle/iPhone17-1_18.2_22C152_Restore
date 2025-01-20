@interface VCPWallpaperAnalyzer
+ (id)sharedModelPool;
- (VCPWallpaperAnalyzer)init;
- (int)analyzeWithSceneprint:(id)a3 results:(id *)a4 cancel:(id)a5;
- (int)createModel;
@end

@implementation VCPWallpaperAnalyzer

+ (id)sharedModelPool
{
  v2 = +[VCPSharedInstanceManager sharedManager];
  v3 = [v2 sharedInstanceWithIdentifier:@"VCPWallpaperAnalyzer.sharedModelPool" andCreationBlock:&__block_literal_global_18];

  return v3;
}

VCPObjectPool *__39__VCPWallpaperAnalyzer_sharedModelPool__block_invoke()
{
  return +[VCPObjectPool objectPoolWithAllocator:&__block_literal_global_233];
}

VCPCNNModelEspresso *__39__VCPWallpaperAnalyzer_sharedModelPool__block_invoke_2()
{
  v0 = objc_msgSend(MEMORY[0x1E4F28B50], "vcp_mediaAnalysisBundle");
  v1 = [v0 resourceURL];

  v2 = [MEMORY[0x1E4F1CB10] URLWithString:@"quantized_9hy8wvx5wz_iteration_47_model.espresso.net" relativeToURL:v1];
  v3 = [[VCPCNNModelEspresso alloc] initWithParameters:v2 inputNames:0 outputNames:0 properties:0];

  return v3;
}

- (VCPWallpaperAnalyzer)init
{
  v11.receiver = self;
  v11.super_class = (Class)VCPWallpaperAnalyzer;
  v2 = [(VCPWallpaperAnalyzer *)&v11 init];
  v3 = v2;
  if (v2)
  {
    resConfig = v2->_resConfig;
    v2->_resConfig = (NSString *)&stru_1F15A0D70;

    v5 = [(id)objc_opt_class() sharedModelPool];
    uint64_t v6 = [v5 getObject];
    modelEspresso = v3->_modelEspresso;
    v3->_modelEspresso = (VCPLoaned *)v6;

    if (v3->_modelEspresso) {
      v8 = v3;
    }
    else {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  return v9;
}

- (int)createModel
{
  v2 = self;
  v3 = [(VCPLoaned *)self->_modelEspresso object];
  LODWORD(v2) = [v3 prepareModelWithConfig:v2->_resConfig];

  return (int)v2;
}

- (int)analyzeWithSceneprint:(id)a3 results:(id *)a4 cancel:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if ([v7 requestRevision] == 3737841671)
  {
    v8 = (void *)MEMORY[0x1C186D320]();
    int v9 = [(VCPWallpaperAnalyzer *)self createModel];
    if (v9)
    {
      int v10 = 6;
    }
    else
    {
      v12 = [(VCPLoaned *)self->_modelEspresso object];
      id v13 = [v7 descriptorData];
      int v9 = objc_msgSend(v12, "espressoForward:", objc_msgSend(v13, "bytes"));

      if (v9) {
        int v10 = 6;
      }
      else {
        int v10 = 0;
      }
    }
    if (!v10)
    {
      v14 = [(VCPLoaned *)self->_modelEspresso object];
      [v14 outputBlob];
      int v15 = *(_DWORD *)(*(void *)buf + 4);

      if (a4)
      {
        v23 = @"WPResults";
        v20 = @"wallpaperScore";
        LODWORD(v16) = v15;
        objc_super v11 = [NSNumber numberWithFloat:v16];
        v21 = v11;
        v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
        v22 = v17;
        v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
        v24 = v18;
        *a4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];

LABEL_15:
      }
    }
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      objc_super v11 = VCPLogInstance();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)&buf[4] = [v7 requestRevision];
        __int16 v26 = 2048;
        uint64_t v27 = 3737841671;
        _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_ERROR, "Invalid sceneprint revision: %lu (required %lu)", buf, 0x16u);
      }
      int v9 = -50;
      goto LABEL_15;
    }
    int v9 = -50;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resConfig, 0);
  objc_storeStrong((id *)&self->_modelEspresso, 0);
}

@end