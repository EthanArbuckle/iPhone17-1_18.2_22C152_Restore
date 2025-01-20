@interface VCPSceneprintDescriptor
+ (BOOL)usePHAssetData;
+ (id)descriptorWithData:(id)a3;
+ (id)descriptorWithImage:(__CVBuffer *)a3;
+ (int)preferredPixelFormat;
- (VCPSceneprintDescriptor)initWithData:(id)a3;
- (VCPSceneprintDescriptor)initWithImage:(__CVBuffer *)a3;
- (id)serialize;
- (int)computeDistance:(float *)a3 toDescriptor:(id)a4;
@end

@implementation VCPSceneprintDescriptor

+ (BOOL)usePHAssetData
{
  return 1;
}

+ (int)preferredPixelFormat
{
  return 1111970369;
}

+ (id)descriptorWithImage:(__CVBuffer *)a3
{
  v3 = [[VCPSceneprintDescriptor alloc] initWithImage:a3];
  return v3;
}

+ (id)descriptorWithData:(id)a3
{
  id v3 = a3;
  v4 = [[VCPSceneprintDescriptor alloc] initWithData:v3];

  return v4;
}

- (VCPSceneprintDescriptor)initWithImage:(__CVBuffer *)a3
{
  v36[1] = *MEMORY[0x1E4F143B8];
  v35.receiver = self;
  v35.super_class = (Class)VCPSceneprintDescriptor;
  v4 = [(VCPSceneprintDescriptor *)&v35 init];
  if (!v4)
  {
    v7 = 0;
    goto LABEL_35;
  }
  v5 = (void *)MEMORY[0x1C186D320]();
  id v6 = objc_alloc(MEMORY[0x1E4F45890]);
  v7 = (VCPSceneprintDescriptor *)[v6 initWithCVPixelBuffer:a3 options:MEMORY[0x1E4F1CC08]];
  if (!v7)
  {
    int v27 = 4;
    int v26 = -108;
    goto LABEL_30;
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F45758]);
  v9 = v8;
  if (v8)
  {
    [v8 setPreferBackgroundProcessing:1];
    if (DeviceHasANE())
    {
      v10 = [MEMORY[0x1E4F458E8] defaultANEDevice];
      [v9 setProcessingDevice:v10];
    }
    id v34 = 0;
    char v11 = [v9 setRevision:3737841671 error:&v34];
    id v12 = v34;
    if ((v11 & 1) == 0)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v28 = VCPLogInstance();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BBEDA000, v28, OS_LOG_TYPE_ERROR, "Error -[VNCreateSceneprintRequest setRevision:error:]", buf, 2u);
        }
      }
      int v27 = 4;
      int v26 = -18;
      goto LABEL_28;
    }
    v36[0] = v9;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
    id v32 = v12;
    char v14 = [(VCPSceneprintDescriptor *)v7 performRequests:v13 error:&v32];
    id v15 = v32;

    if (v14)
    {
      v16 = [v9 results];
      BOOL v17 = [v16 count] == 1;

      if (v17)
      {
        v18 = [v9 results];
        v19 = [v18 objectAtIndexedSubscript:0];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          v21 = [v9 results];
          v22 = [v21 objectAtIndexedSubscript:0];
          v23 = [v22 sceneprints];
          uint64_t v24 = [v23 firstObject];
          sceneprint = v4->_sceneprint;
          v4->_sceneprint = (VNSceneprint *)v24;

          if (v4->_sceneprint) {
            int v26 = 0;
          }
          else {
            int v26 = -18;
          }
          int v27 = 4 * (v4->_sceneprint == 0);
          goto LABEL_27;
        }
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v29 = VCPLogInstance();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v29, OS_LOG_TYPE_ERROR, "Error -[VNImageRequestHandler requestHandler:error:]", buf, 2u);
      }
    }
    int v27 = 4;
    int v26 = -18;
LABEL_27:
    id v12 = v15;
LABEL_28:

    goto LABEL_29;
  }
  int v27 = 4;
  int v26 = -18;
LABEL_29:

LABEL_30:
  if ((v27 | 4) == 4)
  {
    if (v26) {
      v30 = 0;
    }
    else {
      v30 = v4;
    }
    v7 = v30;
  }
LABEL_35:

  return v7;
}

- (VCPSceneprintDescriptor)initWithData:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VCPSceneprintDescriptor;
  v5 = [(VCPSceneprintDescriptor *)&v15 init];
  if (v5)
  {
    id v14 = 0;
    uint64_t v6 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:&v14];
    id v7 = v14;
    sceneprint = v5->_sceneprint;
    v5->_sceneprint = (VNSceneprint *)v6;

    v9 = v5;
    if (!v5->_sceneprint)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v10 = VCPLogInstance();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          char v11 = [v7 description];
          *(_DWORD *)buf = 138412290;
          BOOL v17 = v11;
          _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_ERROR, "NSKeyedUnarchiver error: %@", buf, 0xCu);
        }
      }
      v9 = 0;
    }
    id v12 = v9;
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)serialize
{
  return (id)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self->_sceneprint requiringSecureCoding:1 error:0];
}

- (int)computeDistance:(float *)a3 toDescriptor:(id)a4
{
  uint64_t v6 = (uint64_t *)a4;
  id v7 = v6;
  if (v6 && (uint64_t v8 = v6[1]) != 0)
  {
    sceneprint = self->_sceneprint;
    id v17 = 0;
    v10 = [(VNSceneprint *)sceneprint computeDistance:v8 withDistanceFunction:1 error:&v17];
    id v11 = v17;
    id v12 = v11;
    if (v10) {
      BOOL v13 = v11 == 0;
    }
    else {
      BOOL v13 = 0;
    }
    if (v13)
    {
      [v10 floatValue];
      int v14 = 0;
      *(_DWORD *)a3 = v15;
    }
    else
    {
      int v14 = -18;
    }
  }
  else
  {
    int v14 = -18;
  }

  return v14;
}

- (void).cxx_destruct
{
}

@end