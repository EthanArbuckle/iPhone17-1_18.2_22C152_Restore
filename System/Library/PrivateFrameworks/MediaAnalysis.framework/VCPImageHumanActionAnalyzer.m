@interface VCPImageHumanActionAnalyzer
+ (id)sharedModel:(id)a3 outputNames:(id)a4 properties:(id)a5;
- (CGRect)rectFromPHFace:(id)a3;
- (VCPImageHumanActionAnalyzer)initWithPHFaces:(id)a3 existingResults:(id)a4;
- (id).cxx_construct;
- (int)aggregateWith:(id)a3;
- (int)analyzePixelBuffer:(__CVBuffer *)a3 flags:(unint64_t *)a4 results:(id *)a5 cancel:(id)a6;
- (int)copyImage:(__CVBuffer *)a3 toData:(float *)a4;
- (int)createInput:(float *)a3 withBuffer:(__CVBuffer *)a4 cnnInputHeight:(int)a5 cnnInputWidth:(int)a6 crop:(CGRect)a7;
- (void)dealloc;
@end

@implementation VCPImageHumanActionAnalyzer

+ (id)sharedModel:(id)a3 outputNames:(id)a4 properties:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = +[VCPSharedInstanceManager sharedManager];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __66__VCPImageHumanActionAnalyzer_sharedModel_outputNames_properties___block_invoke;
  v16[3] = &unk_1E62990C0;
  id v11 = v7;
  id v17 = v11;
  id v12 = v8;
  id v18 = v12;
  id v13 = v9;
  id v19 = v13;
  v14 = [v10 sharedInstanceWithIdentifier:@"VCPImageHumanActionEspresso" andCreationBlock:v16];

  return v14;
}

VCPCNNModelEspresso *__66__VCPImageHumanActionAnalyzer_sharedModel_outputNames_properties___block_invoke(void *a1)
{
  v1 = [[VCPCNNModelEspresso alloc] initWithParameters:a1[4] inputNames:0 outputNames:a1[5] properties:a1[6]];
  return v1;
}

- (VCPImageHumanActionAnalyzer)initWithPHFaces:(id)a3 existingResults:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)VCPImageHumanActionAnalyzer;
  id v9 = [(VCPImageHumanActionAnalyzer *)&v21 init];
  v10 = objc_msgSend(MEMORY[0x1E4F28B50], "vcp_mediaAnalysisBundle");
  id v11 = [v10 resourceURL];

  id v12 = [MEMORY[0x1E4F1CB10] URLWithString:@"cnn_image_human_action.espresso.net" relativeToURL:v11];
  if (!v9) {
    goto LABEL_6;
  }
  objc_storeStrong((id *)&v9->_phFaces, a3);
  uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
  results = v9->_results;
  v9->_results = (NSMutableArray *)v13;

  uint64_t v15 = [(id)objc_opt_class() sharedModel:v12 outputNames:0 properties:0];
  model = v9->_model;
  v9->_model = (VCPCNNModelEspresso *)v15;

  v9->_inputData = (float *)operator new[](0xC0000uLL, MEMORY[0x1E4FBA2D0]);
  objc_storeStrong((id *)&v9->_existingResults, a4);
  id v17 = v9->_model;
  if (!v17)
  {
LABEL_5:
    inputData = 0;
    goto LABEL_7;
  }
  inputData = v9->_inputData;
  if (inputData)
  {
    if ([(VCPCNNModelEspresso *)v17 prepareModelWithConfig:&stru_1F15A0D70]) {
      goto LABEL_5;
    }
LABEL_6:
    inputData = v9;
  }
LABEL_7:
  id v19 = inputData;

  return v19;
}

- (void)dealloc
{
  inputData = self->_inputData;
  if (inputData) {
    MEMORY[0x1C186C790](inputData, 0x1000C8052888210);
  }
  v4.receiver = self;
  v4.super_class = (Class)VCPImageHumanActionAnalyzer;
  [(VCPImageHumanActionAnalyzer *)&v4 dealloc];
}

- (int)copyImage:(__CVBuffer *)a3 toData:(float *)a4
{
  if (CVPixelBufferGetPixelFormatType(a3) != 1111970369) {
    return -50;
  }
  int Width = CVPixelBufferGetWidth(a3);
  int Height = CVPixelBufferGetHeight(a3);
  CVPixelBufferRef pixelBuffer = a3;
  CVPixelBufferLockFlags unlockFlags = 1;
  if (!a3)
  {
    BOOL v11 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v11) {
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v11, v12, v13, v14, v15, v16, v17, v18);
    }
    return -50;
  }
  int v8 = Height;
  CVReturn v9 = CVPixelBufferLockBaseAddress(a3, 1uLL);
  CVReturn v30 = v9;
  if (v9)
  {
    int v10 = v9;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:]();
    }
  }
  else
  {
    BaseAddress = CVPixelBufferGetBaseAddress(a3);
    int BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
    bzero(a4, 3 * 4 * Width * v8);
    if (v8 >= 1)
    {
      int v23 = 0;
      v24 = &a4[2 * v8 * Width];
      v25 = &a4[v8 * Width];
      uint64_t v26 = 4 * Width;
      do
      {
        if (Width >= 1)
        {
          for (uint64_t i = 0; i != Width; ++i)
          {
            LOBYTE(v22) = BaseAddress[(int)(i * 4) + 2];
            double v28 = (double)*(unint64_t *)&v22 / 255.0;
            *(float *)&double v28 = v28;
            a4[i] = *(float *)&v28;
            LOBYTE(v28) = BaseAddress[(int)(i * 4) + 1];
            double v29 = (double)*(unint64_t *)&v28 / 255.0;
            *(float *)&double v29 = v29;
            v25[i] = *(float *)&v29;
            LOBYTE(v29) = BaseAddress[(int)(i * 4)];
            double v22 = (double)*(unint64_t *)&v29 / 255.0;
            *(float *)&double v22 = v22;
            v24[i] = *(float *)&v22;
          }
        }
        BaseAddress += BytesPerRow;
        ++v23;
        v24 = (float *)((char *)v24 + v26);
        v25 = (float *)((char *)v25 + v26);
        a4 = (float *)((char *)a4 + v26);
      }
      while (v23 != v8);
    }
    int v10 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v30);
    if (pixelBuffer
      && !v30
      && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
      && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      -[VCPCNNSmileDetector detectSmileForFace:inBuffer:smile:]();
    }
  }
  return v10;
}

- (int)aggregateWith:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v39 = a3;
  v43 = self;
  if ([(NSMutableArray *)self->_results count])
  {
    v46 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    obuint64_t j = self->_results;
    uint64_t v4 = [(NSMutableArray *)obj countByEnumeratingWithState:&v55 objects:v63 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v56;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v56 != v5) {
            objc_enumerationMutation(obj);
          }
          id v7 = *(void **)(*((void *)&v55 + 1) + 8 * i);
          int v8 = [v7 objectForKeyedSubscript:@"attributes"];
          CVReturn v9 = [v8 objectForKeyedSubscript:@"faceIdentifier"];

          int v10 = [v7 objectForKeyedSubscript:@"attributes"];
          BOOL v11 = [v10 objectForKeyedSubscript:@"humanActions"];

          if (v9) {
            BOOL v12 = v11 == 0;
          }
          else {
            BOOL v12 = 1;
          }
          if (!v12) {
            [v46 setObject:v7 forKeyedSubscript:v9];
          }
        }
        uint64_t v4 = [(NSMutableArray *)obj countByEnumeratingWithState:&v55 objects:v63 count:16];
      }
      while (v4);
    }

    [(NSMutableArray *)v43->_results removeAllObjects];
    v41 = [MEMORY[0x1E4F1CA48] array];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v40 = v39;
    uint64_t v13 = [v40 countByEnumeratingWithState:&v51 objects:v62 count:16];
    if (v13)
    {
      uint64_t v42 = *(void *)v52;
      do
      {
        uint64_t v44 = v13;
        for (uint64_t j = 0; j != v44; ++j)
        {
          if (*(void *)v52 != v42) {
            objc_enumerationMutation(v40);
          }
          uint64_t v15 = *(void **)(*((void *)&v51 + 1) + 8 * j);
          uint64_t v16 = [v15 objectForKeyedSubscript:@"attributes"];
          uint64_t v17 = [v16 objectForKeyedSubscript:@"faceIdentifier"];

          uint64_t v18 = [v15 objectForKeyedSubscript:@"attributes"];
          id v19 = [v18 objectForKeyedSubscript:@"humanActions"];

          if (v17) {
            BOOL v20 = v19 == 0;
          }
          else {
            BOOL v20 = 1;
          }
          if (v20)
          {
            [v41 addObject:v15];
          }
          else
          {
            objc_super v21 = [v46 objectForKeyedSubscript:v17];
            BOOL v22 = v21 == 0;

            if (!v22)
            {
              int v23 = (void *)[v15 mutableCopy];
              v24 = (void *)[v19 mutableCopy];
              v25 = [v46 objectForKeyedSubscript:v17];
              uint64_t v26 = [v25 objectForKeyedSubscript:@"attributes"];
              v27 = [v26 objectForKeyedSubscript:@"humanActions"];
              [v24 addEntriesFromDictionary:v27];

              [v46 removeObjectForKey:v17];
              double v28 = [v15 objectForKeyedSubscript:@"attributes"];
              double v29 = (void *)[v28 mutableCopy];
              [v23 setObject:v29 forKeyedSubscript:@"attributes"];

              CVReturn v30 = [v23 objectForKeyedSubscript:@"attributes"];
              [v30 setObject:v24 forKeyedSubscript:@"humanActions"];

              [v41 addObject:v23];
              if ((int)MediaAnalysisLogLevel() >= 7)
              {
                v31 = VCPLogInstance();
                if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v61 = v17;
                  _os_log_impl(&dword_1BBEDA000, v31, OS_LOG_TYPE_DEBUG, "Image Action classifier - merged actions for face  %@", buf, 0xCu);
                }
              }
            }
          }
        }
        uint64_t v13 = [v40 countByEnumeratingWithState:&v51 objects:v62 count:16];
      }
      while (v13);
    }

    [(NSMutableArray *)v43->_results addObjectsFromArray:v41];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v32 = v46;
    uint64_t v33 = [v32 countByEnumeratingWithState:&v47 objects:v59 count:16];
    if (v33)
    {
      uint64_t v34 = *(void *)v48;
      do
      {
        for (uint64_t k = 0; k != v33; ++k)
        {
          if (*(void *)v48 != v34) {
            objc_enumerationMutation(v32);
          }
          results = v43->_results;
          v37 = [v32 objectForKeyedSubscript:*(void *)(*((void *)&v47 + 1) + 8 * k)];
          [(NSMutableArray *)results addObject:v37];
        }
        uint64_t v33 = [v32 countByEnumeratingWithState:&v47 objects:v59 count:16];
      }
      while (v33);
    }
  }
  else
  {
    [(NSMutableArray *)self->_results addObjectsFromArray:v39];
  }

  return 0;
}

- (int)createInput:(float *)a3 withBuffer:(__CVBuffer *)a4 cnnInputHeight:(int)a5 cnnInputWidth:(int)a6 crop:(CGRect)a7
{
  if (!a3) {
    return -108;
  }
  CFTypeRef cf = 0;
  int v9 = Scaler::ScaleCropped(&self->_scaler, a7, a4, (__CVBuffer **)&cf, *(uint64_t *)&a6, *(uint64_t *)&a5, 1111970369);
  if (!v9) {
    int v9 = [(VCPImageHumanActionAnalyzer *)self copyImage:cf toData:a3];
  }
  if (cf) {
    CFRelease(cf);
  }
  return v9;
}

- (CGRect)rectFromPHFace:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  [v3 bodyWidth];
  double v9 = v8;
  [v3 bodyHeight];
  if (v9 * v10 < 0.00499999989 || ([v3 size], v11 == 0.0))
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      BOOL v12 = VCPLogInstance();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v13 = [v3 localIdentifier];
        *(_DWORD *)buf = 138412290;
        long long v57 = v13;
        _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_DEBUG, "Image Action classifier - torso or face not detected %@", buf, 0xCu);
      }
    }
  }
  else
  {
    [v3 centerX];
    double v15 = v14;
    [v3 size];
    double v17 = v16;
    [v3 bodyCenterX];
    double v19 = v18;
    [v3 bodyWidth];
    double v21 = v20;
    [v3 centerX];
    double v23 = v22;
    [v3 size];
    double v25 = v24;
    [v3 bodyCenterX];
    double v27 = v26;
    [v3 bodyWidth];
    double v55 = v28;
    double v51 = v27;
    double v52 = v25;
    double v53 = v23;
    double v54 = v21;
    [v3 centerY];
    double v50 = v29;
    [v3 size];
    double v49 = v30;
    [v3 bodyCenterY];
    double v32 = v31;
    [v3 bodyHeight];
    double v34 = v33;
    [v3 centerY];
    double v36 = v35;
    [v3 size];
    double v38 = v37;
    [v3 bodyCenterY];
    double v40 = v39;
    [v3 bodyHeight];
    float v41 = fmax(fmin(v15 + v17 * -0.5, v19 + v54 * -1.5), 0.00999999978);
    float v42 = fmin(fmax(v53 + v52 * 0.5, v51 + v55 * 1.5), 0.99000001);
    float v43 = fmax(fmin(v50 + v49 * -0.5, v32 + v34 * -1.70000005), 0.00999999978);
    *(float *)&double v44 = fmin(fmax(v36 + v38 * 0.5, v40 + v44 * 0.5), 0.99000001);
    double v4 = v41;
    double v5 = v43;
    double v6 = (float)(v42 - v41);
    double v7 = (float)(*(float *)&v44 - v43);
  }

  double v45 = v4;
  double v46 = v5;
  double v47 = v6;
  double v48 = v7;
  result.size.height = v48;
  result.size.width = v47;
  result.origin.y = v46;
  result.origin.x = v45;
  return result;
}

- (int)analyzePixelBuffer:(__CVBuffer *)a3 flags:(unint64_t *)a4 results:(id *)a5 cancel:(id)a6
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  double v55 = (uint64_t (**)(void))a6;
  [(NSMutableArray *)self->_results removeAllObjects];
  int Width = CVPixelBufferGetWidth(a3);
  int Height = CVPixelBufferGetHeight(a3);
  if (Height >= Width) {
    int v10 = Width;
  }
  else {
    int v10 = Height;
  }
  if (v10 < 64)
  {
    int v11 = 0;
    goto LABEL_56;
  }
  if (v55 && (v55[2]() & 1) != 0)
  {
    int v11 = -128;
    goto LABEL_56;
  }
  if (![(PHFetchResult *)self->_phFaces count] || [(PHFetchResult *)self->_phFaces count] > 2) {
    goto LABEL_51;
  }
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  obuint64_t j = self->_phFaces;
  uint64_t v12 = [(PHFetchResult *)obj countByEnumeratingWithState:&v59 objects:v73 count:16];
  if (!v12) {
    goto LABEL_50;
  }
  uint64_t v54 = *(void *)v60;
  *(void *)&long long v13 = 67109376;
  long long v50 = v13;
  while (2)
  {
    uint64_t v53 = v12;
    for (uint64_t i = 0; i != v53; ++i)
    {
      if (*(void *)v60 != v54) {
        objc_enumerationMutation(obj);
      }
      double v15 = *(void **)(*((void *)&v59 + 1) + 8 * i);
      if (objc_msgSend(v15, "ageType", v50)
        && [v15 ageType] != 1
        && [v15 ageType] != 2)
      {
        if ((int)MediaAnalysisLogLevel() < 6) {
          continue;
        }
        double v22 = VCPLogInstance();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BBEDA000, v22, OS_LOG_TYPE_INFO, "Image Action classifier - PHFace gated out by age attribute", buf, 2u);
        }
        goto LABEL_47;
      }
      [(VCPImageHumanActionAnalyzer *)self rectFromPHFace:v15];
      double x = v75.origin.x;
      double y = v75.origin.y;
      double v18 = v75.size.width;
      double v19 = v75.size.height;
      if (!CGRectIsEmpty(v75))
      {
        double v20 = [v15 localIdentifier];
        BOOL v21 = v20 == 0;

        if (!v21)
        {
          double v22 = [MEMORY[0x1E4F1CA60] dictionary];
          int v11 = -[VCPImageHumanActionAnalyzer createInput:withBuffer:cnnInputHeight:cnnInputWidth:crop:](self, "createInput:withBuffer:cnnInputHeight:cnnInputWidth:crop:", self->_inputData, a3, 256, 256, x, 1.0 - y - v19, v18, v19);
          if (v11
            || (int v11 = [(VCPCNNModelEspresso *)self->_model espressoForward:self->_inputData]) != 0)
          {

            goto LABEL_56;
          }
          model = self->_model;
          if (!model) {
            goto LABEL_57;
          }
          [(VCPCNNModelEspresso *)model outputBlob];
          uint64_t v24 = *(void *)buf;
          if (!*(void *)buf) {
            goto LABEL_57;
          }
          double v25 = self->_model;
          if (v25)
          {
            [(VCPCNNModelEspresso *)v25 outputBlob];
            double v26 = self->_model;
            uint64_t v27 = v72;
            if (v26)
            {
              [(VCPCNNModelEspresso *)v26 outputBlob];
              uint64_t v28 = v58;
            }
            else
            {
              uint64_t v28 = 0;
            }
          }
          else
          {
            uint64_t v28 = 0;
            uint64_t v27 = 0;
          }
          if (v28 * v27 != 5)
          {
LABEL_57:

            int v11 = -18;
            goto LABEL_56;
          }
          uint64_t v29 = 0;
          int v30 = 0;
          float v31 = 0.0;
          do
          {
            if (*(float *)(v24 + 4 * v29) > v31)
            {
              float v31 = *(float *)(v24 + 4 * v29);
              int v30 = v29;
            }
            ++v29;
          }
          while (v29 != 5);
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            double v33 = VCPLogInstance();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v50;
              *(_DWORD *)&uint8_t buf[4] = v30;
              __int16 v70 = 2048;
              double v71 = v31;
              _os_log_impl(&dword_1BBEDA000, v33, OS_LOG_TYPE_DEBUG, "Image Action classifier - action class %d with confidence %f", buf, 0x12u);
            }
          }
          if (v31 > 0.2 && v30 != 4)
          {
            *(float *)&double v32 = v31;
            double v35 = [NSNumber numberWithFloat:v32];
            double v36 = [NSNumber numberWithInt:(v30 + 10000)];
            double v37 = [v36 stringValue];
            [v22 setObject:v35 forKeyedSubscript:v37];

            double v38 = (void *)MEMORY[0x1E4F1CA60];
            v67[0] = @"faceIdentifier";
            double v39 = [v15 localIdentifier];
            v68[0] = v39;
            v68[1] = v22;
            v67[1] = @"humanActions";
            v67[2] = @"humanBounds";
            v76.origin.double x = x;
            v76.origin.double y = y;
            v76.size.width = v18;
            v76.size.height = v19;
            double v40 = NSStringFromRect(v76);
            v68[2] = v40;
            float v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v68 forKeys:v67 count:3];
            float v42 = [v38 dictionaryWithDictionary:v41];

            results = self->_results;
            v65[0] = @"start";
            double v44 = (CMTime *)MEMORY[0x1E4F1FA48];
            CMTime v57 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
            double v45 = CMTimeToNSDictionary(&v57);
            v66[0] = v45;
            v65[1] = @"duration";
            CMTime v56 = *v44;
            double v46 = CMTimeToNSDictionary(&v56);
            v65[2] = @"attributes";
            v66[1] = v46;
            v66[2] = v42;
            double v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v66 forKeys:v65 count:3];
            [(NSMutableArray *)results addObject:v47];
          }
LABEL_47:

          continue;
        }
      }
    }
    uint64_t v12 = [(PHFetchResult *)obj countByEnumeratingWithState:&v59 objects:v73 count:16];
    if (v12) {
      continue;
    }
    break;
  }
LABEL_50:

LABEL_51:
  if (![(NSArray *)self->_existingResults count]
    || (int v11 = [(VCPImageHumanActionAnalyzer *)self aggregateWith:self->_existingResults]) == 0)
  {
    double v48 = self->_results;
    if (v48)
    {
      v63 = @"HumanActionClassificationResults";
      uint64_t v64 = v48;
      *a5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v64 forKeys:&v63 count:1];
    }
    int v11 = 0;
  }
LABEL_56:

  return v11;
}

- (void).cxx_destruct
{
  p_scaler = &self->_scaler;
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_scaler.transfer_session_.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&p_scaler->pool_.value_);
  objc_storeStrong((id *)&self->_phFaces, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_existingResults, 0);
  objc_storeStrong((id *)&self->_results, 0);
}

- (id).cxx_construct
{
  *((void *)self + 11) = 0;
  *((_DWORD *)self + 24) = 0;
  return self;
}

@end