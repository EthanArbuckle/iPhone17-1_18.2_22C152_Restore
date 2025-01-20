@interface AXMModelDetectorNode
+ (BOOL)isSupported;
+ (BOOL)supportsSecureCoding;
+ (id)title;
- (AXMModelDetectorNode)initWithCoder:(id)a3;
- (BOOL)_loadModel:(id *)a3;
- (BOOL)preloadModelIfNeeded:(id *)a3;
- (BOOL)requiresVisionFramework;
- (NSString)modelIdentifier;
- (NSURL)modelURL;
- (void)encodeWithCoder:(id)a3;
- (void)evaluate:(id)a3 metrics:(id)a4;
- (void)nodeInitialize;
- (void)setModelURL:(id)a3;
@end

@implementation AXMModelDetectorNode

- (void)nodeInitialize
{
  v2.receiver = self;
  v2.super_class = (Class)AXMModelDetectorNode;
  [(AXMEvaluationNode *)&v2 nodeInitialize];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMModelDetectorNode)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AXMModelDetectorNode;
  v5 = [(AXMEvaluationNode *)&v10 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectForKey:@"modelURL"];
    if (v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6];
      modelURL = v5->_modelURL;
      v5->_modelURL = (NSURL *)v7;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AXMModelDetectorNode;
  id v4 = a3;
  [(AXMEvaluationNode *)&v6 encodeWithCoder:v4];
  v5 = [(NSURL *)self->_modelURL path];
  [v4 encodeObject:v5 forKey:@"modelURL"];
}

+ (BOOL)isSupported
{
  return 1;
}

- (BOOL)requiresVisionFramework
{
  return 1;
}

+ (id)title
{
  return @"Model Detector";
}

- (NSString)modelIdentifier
{
  objc_super v2 = [(NSURL *)self->_modelURL lastPathComponent];
  v3 = [v2 stringByDeletingPathExtension];

  return (NSString *)v3;
}

- (void)setModelURL:(id)a3
{
  id v6 = a3;
  if ((-[NSURL isEqual:](self->_modelURL, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_modelURL, a3);
    model = self->_model;
    self->_model = 0;
  }
}

- (BOOL)preloadModelIfNeeded:(id *)a3
{
  return self->_model || [(AXMModelDetectorNode *)self _loadModel:a3];
}

- (BOOL)_loadModel:(id *)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  if (self->_model)
  {
    id v4 = 0;
    if (!a3) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  id v6 = [(AXMModelDetectorNode *)self modelURL];

  if (!v6)
  {
    v17 = @"Could not load model. modelURL was nil";
    goto LABEL_17;
  }
  if (!getMLModelClass())
  {
    v17 = @"Could not load model. MLModelSoft unexpectedly NULL";
    goto LABEL_17;
  }
  getMLModelClass();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v17 = @"Could not load model. MLModelSoft does not respond to modelWithContentsOfURL:error:";
    goto LABEL_17;
  }
  if (!getVNCoreMLModelClass())
  {
    v17 = @"Could not load model. VNCoreMLModelSoft unexpectedly NULL";
    goto LABEL_17;
  }
  getVNCoreMLModelClass();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v17 = @"Could not load model. VNCoreMLModelSoft does not respond to modelForMLModel:error:";
LABEL_17:
    id v4 = _AXMMakeError(0, v17, v7, v8, v9, v10, v11, v12, v49);
    if (!a3) {
      goto LABEL_19;
    }
LABEL_18:
    *a3 = v4;
    goto LABEL_19;
  }
  id MLModelClass = getMLModelClass();
  v14 = [(AXMModelDetectorNode *)self modelURL];
  id v53 = 0;
  v15 = [MLModelClass modelWithContentsOfURL:v14 error:&v53];
  id v16 = v53;

  if (!v15 || v16)
  {
    v19 = AXMediaLogCommon();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B57D5000, v19, OS_LOG_TYPE_DEFAULT, "CoreML model may need to be compiled first. Attempting to compile...", buf, 2u);
    }

    id v20 = getMLModelClass();
    v21 = [(AXMModelDetectorNode *)self modelURL];
    id v52 = 0;
    v22 = [v20 compileModelAtURL:v21 error:&v52];
    id v23 = v52;

    if (!v22 || v23)
    {
      id v27 = [(AXMModelDetectorNode *)self modelURL];
      id v4 = _AXMMakeError(0, @"Failed to compile model on the fly at URL: %@. error:%@\nTried to compile model due to original error: %@", v34, v35, v36, v37, v38, v39, (uint64_t)v27);

      uint64_t v26 = (uint64_t)v15;
    }
    else
    {

      v24 = AXMediaLogCommon();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = [v22 path];
        *(_DWORD *)buf = 138412290;
        v55 = v25;
        _os_log_impl(&dword_1B57D5000, v24, OS_LOG_TYPE_DEFAULT, "Successfully compiled CoreML model to %@", buf, 0xCu);
      }
      id v51 = 0;
      uint64_t v26 = [getMLModelClass() modelWithContentsOfURL:v22 error:&v51];
      id v27 = v51;

      if (v26 && !v27)
      {
        id v4 = 0;
LABEL_32:

        v15 = (void *)v26;
        goto LABEL_33;
      }
      id v4 = _AXMMakeError(0, @"Could not load model at URL: %@. error:%@", v28, v29, v30, v31, v32, v33, (uint64_t)v22);
    }

    goto LABEL_32;
  }
  id v4 = 0;
LABEL_33:
  if (v15)
  {
    if (!v4)
    {
      id v50 = 0;
      v40 = [getVNCoreMLModelClass() modelForMLModel:v15 error:&v50];
      id v41 = v50;
      model = self->_model;
      self->_model = v40;

      if (!self->_model || (id v4 = 0, v41))
      {
        id v4 = _AXMMakeError(0, @"Could not craete VNCoreMLModel. error:%@", v43, v44, v45, v46, v47, v48, (uint64_t)v41);
      }
    }
  }

  if (a3) {
    goto LABEL_18;
  }
LABEL_19:

  return v4 == 0;
}

- (void)evaluate:(id)a3 metrics:(id)a4
{
  v51[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v50.receiver = self;
  v50.super_class = (Class)AXMModelDetectorNode;
  id v8 = [(AXMEvaluationNode *)&v50 evaluate:v6 metrics:v7];
  uint64_t v9 = (void *)MEMORY[0x1BA9A10B0](v8);
  if (getVNClassificationObservationClass())
  {
    if (getVNCoreMLRequestClass())
    {
      uint64_t v10 = [(AXMModelDetectorNode *)self modelURL];

      if (v10)
      {
        id v49 = 0;
        BOOL v11 = [(AXMModelDetectorNode *)self _loadModel:&v49];
        uint64_t v12 = v49;
        if (v11)
        {
          v13 = [objc_alloc((Class)getVNCoreMLRequestClass()) initWithModel:self->_model];
          [v13 setImageCropAndScaleOption:0];
          v51[0] = v13;
          v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:1];
          uint64_t v48 = v12;
          [(AXMEvaluationNode *)self evaluateRequests:v14 withContext:v6 requestHandlerOptions:0 metrics:v7 error:&v48];
          v15 = v48;

          id v16 = [v13 results];
          v17 = [v16 firstObject];

          getVNClassificationObservationClass();
          if (objc_opt_isKindOfClass())
          {
            id v18 = v17;
            [v18 confidence];
            double v20 = v19;
            [(AXMEvaluationNode *)self minimumConfidence];
            if (v21 <= v20)
            {
              uint64_t v44 = [(AXMModelDetectorNode *)self modelIdentifier];
              uint64_t v45 = (void *)v44;
              uint64_t v46 = @"UnknownModel";
              if (v44) {
                uint64_t v46 = (__CFString *)v44;
              }
              uint64_t v47 = v46;

              [v6 size];
              v22 = +[AXMVisionFeature featureWithVisionRequest:modelClassificationResult:modelIdentifier:canvasSize:](AXMVisionFeature, "featureWithVisionRequest:modelClassificationResult:modelIdentifier:canvasSize:", v13, v18, v47);

              [v6 appendFeature:v22];
            }
            else
            {
              v22 = AXMediaLogResults();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
                -[AXMModelDetectorNode evaluate:metrics:].cold.4(self, (uint64_t)v18, v22);
              }
            }
          }
          uint64_t v12 = v15;
        }
        else
        {
          v13 = AXMediaLogCommon();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            -[AXMModelDetectorNode evaluate:metrics:].cold.5((uint64_t)v12, v13);
          }
        }
      }
      else
      {
        uint64_t v12 = AXMediaLogCommon();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          -[AXMModelDetectorNode evaluate:metrics:](v12, v37, v38, v39, v40, v41, v42, v43);
        }
      }
    }
    else
    {
      uint64_t v12 = AXMediaLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[AXMModelDetectorNode evaluate:metrics:](v12, v30, v31, v32, v33, v34, v35, v36);
      }
    }
  }
  else
  {
    uint64_t v12 = AXMediaLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[AXMModelDetectorNode evaluate:metrics:](v12, v23, v24, v25, v26, v27, v28, v29);
    }
  }
}

- (NSURL)modelURL
{
  return self->_modelURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelURL, 0);

  objc_storeStrong((id *)&self->_model, 0);
}

- (void)evaluate:(uint64_t)a3 metrics:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)evaluate:(uint64_t)a3 metrics:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)evaluate:(uint64_t)a3 metrics:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)evaluate:(NSObject *)a3 metrics:.cold.4(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [a1 minimumConfidence];
  int v6 = 134218242;
  uint64_t v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_debug_impl(&dword_1B57D5000, a3, OS_LOG_TYPE_DEBUG, "Discarding classification result due to low confidence. minimumAllowed:%.2f . %@", (uint8_t *)&v6, 0x16u);
}

- (void)evaluate:(uint64_t)a1 metrics:(NSObject *)a2 .cold.5(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B57D5000, a2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v2, 0xCu);
}

@end