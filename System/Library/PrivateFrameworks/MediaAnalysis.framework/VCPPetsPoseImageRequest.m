@interface VCPPetsPoseImageRequest
- (BOOL)cleanupWithOptions:(id)a3 error:(id *)a4;
- (CGSize)preferredInputSizeWithOptions:(id)a3 error:(id *)a4;
- (VCPPetsPoseImageRequest)init;
- (VCPPetsPoseImageRequest)initWithOptions:(id)a3;
- (id)processImage:(__CVBuffer *)a3 withOptions:(id)a4 error:(id *)a5;
- (int)parseResults:(id)a3 observations:(id)a4;
- (unsigned)preferredPixelFormat;
@end

@implementation VCPPetsPoseImageRequest

- (VCPPetsPoseImageRequest)init
{
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v3 = VCPLogInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_ERROR, "Not implemented, please use initWithOptions", v5, 2u);
    }
  }
  return 0;
}

- (VCPPetsPoseImageRequest)initWithOptions:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VCPPetsPoseImageRequest;
  v5 = [(VCPRequest *)&v14 initWithOptions:v4];
  v6 = v5;
  if (v5)
  {
    int maxNumPets = v5->super._maxNumPets;
    if (maxNumPets <= 0) {
      int maxNumPets = 2;
    }
    v5->super._int maxNumPets = maxNumPets;
    v8 = [[VCPImagePetsKeypointsAnalyzer alloc] initWithMaxNumRegions:v5->super._maxNumPets forceCPU:v5->super._useCPUOnly sharedModel:0];
    analyzer = v6->_analyzer;
    v6->_analyzer = v8;

    v10 = v6->_analyzer;
    if (v10) {
      [(VCPImagePetsKeypointsAnalyzer *)v10 preferredInputFormat:&v6->_preferredWidth height:&v6->_preferredHeight format:&v6->_preferredFormat];
    }
  }
  if (v6->_analyzer) {
    v11 = v6;
  }
  else {
    v11 = 0;
  }
  v12 = v11;

  return v12;
}

- (int)parseResults:(id)a3 observations:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v33 = v5;
  id v34 = a4;
  if (v34)
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    obuint64_t j = v5;
    uint64_t v6 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v6)
    {
      uint64_t v28 = v6;
      uint64_t v29 = *(void *)v42;
      while (2)
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v42 != v29) {
            objc_enumerationMutation(obj);
          }
          v30 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          v7 = [v30 objectForKeyedSubscript:@"attributes"];
          v35 = [v7 objectForKeyedSubscript:@"petsKeypoints"];

          if ([v35 count] != 25)
          {
LABEL_21:

            int v26 = -18;
            goto LABEL_23;
          }
          v36 = objc_alloc_init(VCPPetsObservation);
          v8 = [MEMORY[0x1E4F1CA48] array];
          long long v39 = 0u;
          long long v40 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          id v9 = v35;
          uint64_t v10 = [v9 countByEnumeratingWithState:&v37 objects:v45 count:16];
          if (v10)
          {
            uint64_t v11 = *(void *)v38;
            while (2)
            {
              for (uint64_t j = 0; j != v10; ++j)
              {
                if (*(void *)v38 != v11) {
                  objc_enumerationMutation(v9);
                }
                v13 = *(void **)(*((void *)&v37 + 1) + 8 * j);
                if ([v13 count] != 3)
                {

                  goto LABEL_21;
                }
                objc_super v14 = objc_alloc_init(VCPKeypoint);
                v15 = [v13 objectAtIndexedSubscript:0];
                [v15 floatValue];
                float v17 = v16;
                v18 = [v13 objectAtIndexedSubscript:1];
                [v18 floatValue];
                -[VCPKeypoint setLocation:](v14, "setLocation:", v17, v19);

                v20 = [v13 objectAtIndexedSubscript:2];
                [v20 floatValue];
                -[VCPKeypoint setConfidence:](v14, "setConfidence:");

                [v8 addObject:v14];
              }
              uint64_t v10 = [v9 countByEnumeratingWithState:&v37 objects:v45 count:16];
              if (v10) {
                continue;
              }
              break;
            }
          }

          [(VCPPetsObservation *)v36 setKeypoints:v8];
          v21 = [v30 objectForKeyedSubscript:@"attributes"];
          v22 = [v21 objectForKeyedSubscript:@"petsBounds"];
          NSRect v48 = NSRectFromString(v22);
          -[VCPPetsObservation setBounds:](v36, "setBounds:", v48.origin.x, v48.origin.y, v48.size.width, v48.size.height);

          v23 = [v30 objectForKeyedSubscript:@"attributes"];
          v24 = [v23 objectForKeyedSubscript:@"petsType"];
          int v25 = [v24 intValue];

          [(VCPPetsObservation *)v36 setPetsType:v25 != 0];
          [(VCPPetsObservation *)v36 setRevision:1];
          [v34 addObject:v36];
        }
        int v26 = 0;
        uint64_t v28 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
        if (v28) {
          continue;
        }
        break;
      }
    }
    else
    {
      int v26 = 0;
    }
LABEL_23:
  }
  else
  {
    int v26 = -50;
  }

  return v26;
}

- (id)processImage:(__CVBuffer *)a3 withOptions:(id)a4 error:(id *)a5
{
  v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", a3, a4);
  uint64_t v18 = 0;
  analyzer = self->_analyzer;
  if (analyzer)
  {
    id v17 = 0;
    int v10 = [(VCPImagePetsKeypointsAnalyzer *)analyzer analyzePixelBuffer:a3 flags:&v18 results:&v17 cancel:&__block_literal_global_70];
    id v11 = v17;
    v12 = v11;
    if (!v10)
    {
      v13 = [v11 objectForKeyedSubscript:@"PetsKeypointsResults"];

      if (!v13
        || ([v12 objectForKeyedSubscript:@"PetsKeypointsResults"],
            objc_super v14 = objc_claimAutoreleasedReturnValue(),
            int v10 = [(VCPPetsPoseImageRequest *)self parseResults:v14 observations:v8],
            v14,
            !v10))
      {
        id v15 = v8;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v12 = 0;
    int v10 = -18;
  }
  if (a5)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v10 userInfo:0];
    id v15 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v15 = 0;
  }
LABEL_10:

  return v15;
}

uint64_t __58__VCPPetsPoseImageRequest_processImage_withOptions_error___block_invoke()
{
  return 0;
}

- (CGSize)preferredInputSizeWithOptions:(id)a3 error:(id *)a4
{
  analyzer = self->_analyzer;
  if (analyzer) {
    [(VCPImagePetsKeypointsAnalyzer *)analyzer preferredInputFormat:&self->_preferredWidth height:&self->_preferredHeight format:&self->_preferredFormat];
  }
  double preferredWidth = (double)self->_preferredWidth;
  double preferredHeight = (double)self->_preferredHeight;
  result.height = preferredHeight;
  result.width = preferredWidth;
  return result;
}

- (unsigned)preferredPixelFormat
{
  return self->_preferredFormat;
}

- (BOOL)cleanupWithOptions:(id)a3 error:(id *)a4
{
  analyzer = self->_analyzer;
  self->_analyzer = 0;

  return 1;
}

- (void).cxx_destruct
{
}

@end