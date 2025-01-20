@interface VCPImageDescriptor
+ (BOOL)usePHAssetData;
+ (id)descriptorWithData:(id)a3;
+ (id)descriptorWithImage:(__CVBuffer *)a3;
+ (int)preferredPixelFormat;
- (VCPImageDescriptor)initWithData:(id)a3;
- (VCPImageDescriptor)initWithImage:(__CVBuffer *)a3;
- (id)serialize;
- (int)computeDistance:(float *)a3 toDescriptor:(id)a4;
@end

@implementation VCPImageDescriptor

+ (BOOL)usePHAssetData
{
  return 0;
}

+ (int)preferredPixelFormat
{
  return 875704438;
}

+ (id)descriptorWithImage:(__CVBuffer *)a3
{
  v3 = [[VCPImageDescriptor alloc] initWithImage:a3];
  return v3;
}

+ (id)descriptorWithData:(id)a3
{
  id v3 = a3;
  v4 = [[VCPImageDescriptor alloc] initWithData:v3];

  return v4;
}

- (VCPImageDescriptor)initWithImage:(__CVBuffer *)a3
{
  v33[1] = *MEMORY[0x1E4F143B8];
  v31.receiver = self;
  v31.super_class = (Class)VCPImageDescriptor;
  v4 = [(VCPImageDescriptor *)&v31 init];
  if (!v4)
  {
    v22 = 0;
    goto LABEL_28;
  }
  context = (void *)MEMORY[0x1C186D320]();
  id v5 = objc_alloc(MEMORY[0x1E4F45890]);
  v6 = (void *)[v5 initWithCVPixelBuffer:a3 options:MEMORY[0x1E4F1CC08]];
  if (v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F45750]);
    v8 = v7;
    if (v7)
    {
      [v7 setPreferBackgroundProcessing:1];
      v33[0] = v8;
      v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
      char v10 = [v6 performRequests:v9 error:0];

      if (v10)
      {
        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        v11 = [v8 results];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
        if (v12)
        {
          int v13 = 0;
          uint64_t v14 = *(void *)v28;
          do
          {
            uint64_t v15 = 0;
            int v16 = v13;
            int v17 = v12;
            v13 += v12;
            do
            {
              if (*(void *)v28 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v18 = [*(id *)(*((void *)&v27 + 1) + 8 * v15) imageprint];
              imagePrint = v4->_imagePrint;
              v4->_imagePrint = (VNImageprint *)v18;

              ++v15;
            }
            while (v12 != v15);
            uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
          }
          while (v12);

          if (v16 + v17 - 1 < 1 || (int)MediaAnalysisLogLevel() < 4) {
            goto LABEL_17;
          }
          v11 = VCPLogInstance();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Image descriptor - found more than 1 VNImageprintObservations", buf, 2u);
          }
        }

LABEL_17:
        int v20 = 0;
        int v21 = 1;
        goto LABEL_21;
      }
    }
    int v21 = 0;
    int v20 = -18;
  }
  else
  {
    v8 = 0;
    int v21 = 0;
    int v20 = -108;
  }
LABEL_21:

  if (v21 && !v4->_imagePrint) {
    int v20 = -18;
  }
  if (v20) {
    v23 = 0;
  }
  else {
    v23 = v4;
  }
  v22 = v23;
LABEL_28:

  return v22;
}

- (VCPImageDescriptor)initWithData:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VCPImageDescriptor;
  id v5 = [(VCPImageDescriptor *)&v15 init];
  if (v5)
  {
    if (v4)
    {
      id v14 = 0;
      uint64_t v6 = [objc_alloc(MEMORY[0x1E4F458A0]) initWithState:v4 error:&v14];
      id v7 = v14;
      imagePrint = v5->_imagePrint;
      v5->_imagePrint = (VNImageprint *)v6;

      if (v5->_imagePrint)
      {
        v9 = v5;
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v11 = VCPLogInstance();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            uint64_t v12 = [v7 description];
            *(_DWORD *)buf = 138412290;
            int v17 = v12;
            _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_ERROR, "VNImageprint init error: %@", buf, 0xCu);
          }
        }
        v9 = 0;
      }
    }
    else
    {
      v9 = 0;
      id v7 = 0;
    }
    char v10 = v9;
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)serialize
{
  return (id)[(VNImageprint *)self->_imagePrint serializeStateAndReturnError:0];
}

- (int)computeDistance:(float *)a3 toDescriptor:(id)a4
{
  id v5 = [(VNImageprint *)self->_imagePrint distanceToImageprint:*((void *)a4 + 1) error:0];
  uint64_t v6 = v5;
  if (v5)
  {
    [v5 floatValue];
    int v7 = 0;
    *(_DWORD *)a3 = v8;
  }
  else
  {
    int v7 = -18;
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end