@interface VCPImageBackboneAnalyzer
+ (id)sharedModel:(id)a3 identifier:(id)a4 outputNames:(id)a5 inputNames:(id)a6 functionName:(id)a7;
- (BOOL)bypassNormalizaton;
- (BOOL)isFP16;
- (NSData)embedding;
- (NSData)hiddenEmbedding;
- (NSData)spatialEmbedding;
- (VCPImageBackboneAnalyzer)initWithRequestedAnalyses:(unint64_t)a3 andRevision:(id)a4 useSharedModel:(BOOL)a5;
- (int)analyzePixelBuffer:(__CVBuffer *)a3 flags:(unint64_t *)a4 results:(id *)a5 cancel:(id)a6;
- (int)configForAspectRatio:(float)a3;
- (int)prepareInput:(__CVBuffer *)a3 withChannels:(int)a4 settling:(BOOL)a5;
- (void)setBypassNormalizaton:(BOOL)a3;
@end

@implementation VCPImageBackboneAnalyzer

+ (id)sharedModel:(id)a3 identifier:(id)a4 outputNames:(id)a5 inputNames:(id)a6 functionName:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v16 = +[VCPSharedInstanceManager sharedManager];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __87__VCPImageBackboneAnalyzer_sharedModel_identifier_outputNames_inputNames_functionName___block_invoke;
  v23[3] = &unk_1E6298048;
  id v17 = v11;
  id v24 = v17;
  id v18 = v13;
  id v25 = v18;
  id v19 = v14;
  id v26 = v19;
  id v20 = v15;
  id v27 = v20;
  v21 = [v16 sharedInstanceWithIdentifier:v12 andCreationBlock:v23];

  return v21;
}

VCPCNNModelEspressoV2 *__87__VCPImageBackboneAnalyzer_sharedModel_identifier_outputNames_inputNames_functionName___block_invoke(void *a1)
{
  v1 = [[VCPCNNModelEspressoV2 alloc] initWithParameters:a1[4] outputNames:a1[5] inputNames:a1[6] functionName:a1[7]];
  return v1;
}

- (VCPImageBackboneAnalyzer)initWithRequestedAnalyses:(unint64_t)a3 andRevision:(id)a4 useSharedModel:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v8 = VCPSignPostLog();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  v10 = VCPSignPostLog();
  id v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "VCPPhotoAnalyzer_Image_VCPImageBackboneInit", "", buf, 2u);
  }

  self->_isFP16 = 0;
  self->_revision = +[VCPVideoTransformerBackbone revision];
  if (v7)
  {
    if ([v7 intValue] != 4 && objc_msgSend(v7, "intValue") != 5)
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        int v25 = -18;
        goto LABEL_21;
      }
      id v17 = VCPLogInstance();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        int v33 = [v7 intValue];
        *(_DWORD *)buf = 67109120;
        int v36 = v33;
        _os_log_impl(&dword_1BBEDA000, v17, OS_LOG_TYPE_ERROR, "VCPImageBackboneAnalyzer] revision %d is not supported", buf, 8u);
      }
      int v25 = -18;
      goto LABEL_20;
    }
    self->_revision = (int)[v7 intValue];
  }
  v34.receiver = self;
  v34.super_class = (Class)VCPImageBackboneAnalyzer;
  id v12 = [(VCPImageBackboneAnalyzer *)&v34 init];
  if (v12)
  {
    v12->_inputWidth = +[VCPVideoTransformerBackbone idealInputWidthWithRevision:v12->_revision];
    v12->_inputHeight = +[VCPVideoTransformerBackbone idealInputHeightWithRevision:v12->_revision];
    inputData = v12->_inputData;
    v12->_inputData = 0;

    id v14 = [[VCPTransforms alloc] initImageTransform:128 transformedImageWidth:v12->_inputWidth transformedImageHeight:v12->_inputHeight];
    transformImage = v12->_transformImage;
    v12->_transformImage = v14;

    v16 = objc_msgSend(MEMORY[0x1E4F28B50], "vcp_mediaAnalysisBundle");
    id v17 = [v16 resourceURL];

    if (v12->_revision == 5) {
      id v18 = @"mubb_md5";
    }
    else {
      id v18 = @"mubb_md4";
    }
    id v19 = [MEMORY[0x1E4F1CB10] URLWithString:v18 relativeToURL:v17];
    id v20 = NSString;
    v21 = [NSNumber numberWithInteger:v12->_revision];
    v22 = [v21 stringValue];
    v23 = [v20 stringWithFormat:@"%@_%@", @"image_backbone", v22];

    if (v5)
    {
      id v24 = [(id)objc_opt_class() sharedModel:v19 identifier:v23 outputNames:&unk_1F15EDFB0 inputNames:&unk_1F15EDFC8 functionName:@"main_image"];
    }
    else
    {
      id v24 = [[VCPCNNModelEspressoV2 alloc] initWithParameters:v19 outputNames:&unk_1F15EDFB0 inputNames:&unk_1F15EDFE0 functionName:@"main_image"];
    }
    modelEspressoV2 = v12->_modelEspressoV2;
    v12->_modelEspressoV2 = v24;

    if (v12->_modelEspressoV2)
    {
      LODWORD(v27) = 1.0;
      int v25 = [(VCPImageBackboneAnalyzer *)v12 configForAspectRatio:v27];
    }
    else
    {
      int v25 = -108;
    }

    self = v12;
LABEL_20:

    goto LABEL_21;
  }
  int v25 = 0;
  self = 0;
LABEL_21:
  v28 = VCPSignPostLog();
  v29 = v28;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v29, OS_SIGNPOST_INTERVAL_END, v9, "VCPPhotoAnalyzer_Image_VCPImageBackboneInit", "", buf, 2u);
  }

  if (v25) {
    v30 = 0;
  }
  else {
    v30 = self;
  }
  v31 = v30;

  return v31;
}

- (int)configForAspectRatio:(float)a3
{
  v4 = [(VCPCNNModelEspressoV2 *)self->_modelEspressoV2 inputsSize];
  BOOL v5 = [v4 objectAtIndexedSubscript:0];
  uint64_t v6 = [v5 unsignedIntValue];

  if (v6 != 3 * self->_inputHeight * self->_inputWidth) {
    return -50;
  }
  id v7 = [(VCPCNNModelEspressoV2 *)self->_modelEspressoV2 inputsType];
  v8 = [v7 objectAtIndexedSubscript:0];
  uint64_t v9 = [v8 unsignedIntValue];

  v10 = [[VCPEspressoV2Data alloc] initWithTensorType:v9 size:v6];
  inputData = self->_inputData;
  self->_inputData = v10;

  if (self->_inputData) {
    return 0;
  }
  else {
    return -108;
  }
}

- (int)prepareInput:(__CVBuffer *)a3 withChannels:(int)a4 settling:(BOOL)a5
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  unint64_t v8 = self->_revision - 3;
  if (v8 >= 3) {
    int v9 = 14;
  }
  else {
    int v9 = 11;
  }
  int v48 = v9;
  int Width = CVPixelBufferGetWidth(a3);
  int Height = CVPixelBufferGetHeight(a3);
  if (a4 != 3) {
    return -50;
  }
  float v12 = (float)Width;
  float v13 = (float)Height;
  if ((float)((float)Height * 1.2) >= (float)Width)
  {
    if ((float)(v12 * 1.2) >= v13)
    {
      double v15 = *MEMORY[0x1E4F1DB28];
      double v18 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    }
    else
    {
      float v20 = v12 / v13;
      double v18 = (float)((float)(Height - Width) / (float)(v13 + v13));
      double v17 = v20;
      double v16 = 1.0;
      double v15 = 0.0;
    }
  }
  else
  {
    float v14 = v13 / v12;
    double v15 = (float)((float)(Width - Height) / (float)(v12 + v12));
    double v16 = v14;
    double v17 = 1.0;
    double v18 = 0.0;
  }
  inputint Height = self->_inputHeight;
  inputint Width = self->_inputWidth;
  v23 = -[VCPTransforms cropAndScale:regionCrop:](self->_transformImage, "cropAndScale:regionCrop:", a3, v15, v18, v16, v17);
  if (!v23) {
    return -18;
  }
  id v24 = v23;
  CVPixelBufferRef pixelBuffer = v23;
  CVPixelBufferLockFlags unlockFlags = 1;
  CVReturn v25 = CVPixelBufferLockBaseAddress(v23, 1uLL);
  CVReturn v53 = v25;
  if (!v25
    || (int v19 = v25, os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    && (*(_DWORD *)buf = 134218240,
        v57 = v24,
        __int16 v58 = 1024,
        int v59 = v19,
        _os_log_error_impl(&dword_1BBEDA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", buf, 0x12u), (int v19 = v53) == 0))
  {
    BaseAddress = CVPixelBufferGetBaseAddress(v24);
    int BytesPerRow = CVPixelBufferGetBytesPerRow(v24);
    v46 = v24;
    int v29 = self->_inputHeight;
    if (v29 >= 1)
    {
      int v30 = 0;
      uint64_t v50 = inputWidth * (uint64_t)inputHeight;
      BOOL v31 = v8 >= 3;
      if (v8 >= 3) {
        char v32 = 4;
      }
      else {
        char v32 = 5;
      }
      if (v31) {
        int v33 = 15;
      }
      else {
        int v33 = 31;
      }
      int v52 = v33;
      if (v31) {
        int v34 = 196;
      }
      else {
        int v34 = 121;
      }
      int v51 = v34;
      uint64_t v47 = BytesPerRow;
      LODWORD(v35) = self->_inputWidth;
      do
      {
        if ((int)v35 >= 1)
        {
          uint64_t v36 = 0;
          int v37 = (v30 >> v32) * v48;
          int v49 = v30;
          int v38 = (v30 & v52) << v32;
          int v39 = 1;
          do
          {
            LOBYTE(v28) = BaseAddress[v39 + 1];
            uint64_t v40 = (v36 >> v32) + v37 + ((v52 & v36) + v38) * v51;
            *(float *)&double v28 = (float)((float)((float)LODWORD(v28) / 255.0) + -0.48145) / 0.26863;
            [(VCPEspressoV2Data *)self->_inputData setValueFP:v40 atIndex:v28];
            LOBYTE(v41) = BaseAddress[v39];
            *(float *)&double v42 = (float)((float)((float)v41 / 255.0) + -0.45783) / 0.2613;
            [(VCPEspressoV2Data *)self->_inputData setValueFP:v40 + v50 atIndex:v42];
            LOBYTE(v43) = BaseAddress[v39 - 1];
            *(float *)&double v44 = (float)((float)((float)v43 / 255.0) + -0.40821) / 0.27578;
            [(VCPEspressoV2Data *)self->_inputData setValueFP:v40 + 2 * (int)v50 atIndex:v44];
            ++v36;
            uint64_t v35 = self->_inputWidth;
            v39 += 4;
          }
          while (v36 < v35);
          int v29 = self->_inputHeight;
          int v30 = v49;
        }
        BaseAddress += v47;
        ++v30;
      }
      while (v30 < v29);
    }
    int v19 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v53);
    id v24 = v46;
  }
  CFRelease(v24);
  if (pixelBuffer
    && !v53
    && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[VCPImageExposurePreAnalyzer analyzePixelBuffer:flags:results:cancel:]();
  }
  return v19;
}

- (int)analyzePixelBuffer:(__CVBuffer *)a3 flags:(unint64_t *)a4 results:(id *)a5 cancel:(id)a6
{
  v52[1] = *MEMORY[0x1E4F143B8];
  int v9 = VCPSignPostLog();
  os_signpost_id_t v10 = os_signpost_id_generate(v9);

  id v11 = VCPSignPostLog();
  float v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(buf.value) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "VCPPhotoAnalyzer_Image_VCPImageBackbonePreProcess", "", (uint8_t *)&buf, 2u);
  }

  int v13 = [(VCPImageBackboneAnalyzer *)self prepareInput:a3 withChannels:3 settling:0];
  if (!v13)
  {
    float v14 = VCPSignPostLog();
    double v15 = v14;
    if (v10 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v14))
    {
      LOWORD(buf.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v15, OS_SIGNPOST_INTERVAL_END, v10, "VCPPhotoAnalyzer_Image_VCPImageBackbonePreProcess", "", (uint8_t *)&buf, 2u);
    }

    double v16 = [(VCPCNNModelEspressoV2 *)self->_modelEspressoV2 inputsType];
    double v17 = [v16 objectAtIndexedSubscript:0];
    unsigned int v18 = [v17 unsignedIntValue];

    int v13 = [(VCPCNNModelEspressoV2 *)self->_modelEspressoV2 espressoForward:[(VCPEspressoV2Data *)self->_inputData getData:v18]];
    if (!v13)
    {
      int v19 = [(VCPCNNModelEspressoV2 *)self->_modelEspressoV2 outputsSize];
      if ([v19 count])
      {
        modelEspressoV2 = self->_modelEspressoV2;
        if (modelEspressoV2)
        {
          [(VCPCNNModelEspressoV2 *)modelEspressoV2 outputs];
          CMTimeValue value = buf.value;
          uint64_t v21 = *(void *)&buf.timescale;
          p_CMTime buf = &buf;
          std::vector<VCPEspressoV2Data * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_buf);
          if (v21 != value)
          {
            [(VCPCNNModelEspressoV2 *)self->_modelEspressoV2 outputs];
            v23 = +[VCPVideoTransformerBackbone getNSDataFromOuput:*(void *)buf.value isFP16:0];
            embedding = self->_embedding;
            self->_embedding = v23;

            p_CMTime buf = &buf;
            std::vector<VCPEspressoV2Data * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_buf);
            if ((self->_revision & 0xFFFFFFFFFFFFFFFELL) != 4) {
              goto LABEL_23;
            }
            if ((unint64_t)[v19 count] >= 3)
            {
              CVReturn v25 = self->_modelEspressoV2;
              if (v25)
              {
                [(VCPCNNModelEspressoV2 *)v25 outputs];
                CMTimeValue v27 = buf.value;
                uint64_t v26 = *(void *)&buf.timescale;
              }
              else
              {
                CMTimeValue v27 = 0;
                uint64_t v26 = 0;
                memset(&buf, 0, sizeof(buf));
              }
              unint64_t v29 = v26 - v27;
              p_CMTime buf = &buf;
              std::vector<VCPEspressoV2Data * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_buf);
              if (v29 >= 0x18)
              {
                [(VCPCNNModelEspressoV2 *)self->_modelEspressoV2 outputs];
                int v30 = +[VCPVideoTransformerBackbone getNSDataFromOuput:*(void *)(buf.value + 8) isFP16:0];
                spatialEmbedding = self->_spatialEmbedding;
                self->_spatialEmbedding = v30;

                p_CMTime buf = &buf;
                std::vector<VCPEspressoV2Data * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_buf);
                [(VCPCNNModelEspressoV2 *)self->_modelEspressoV2 outputs];
                char v32 = +[VCPVideoTransformerBackbone getNSDataFromOuput:*(void *)(buf.value + 16) isFP16:0];
                hiddenEmbedding = self->_hiddenEmbedding;
                self->_hiddenEmbedding = v32;

                p_CMTime buf = &buf;
                std::vector<VCPEspressoV2Data * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_buf);
LABEL_23:
                if (!self->_bypassNormalizaton && self->_revision == 3)
                {
                  int v34 = +[VCPTextEncoder applyL2Norm:self->_embedding isFP16:0];
                  uint64_t v35 = self->_embedding;
                  self->_embedding = v34;
                }
                uint64_t v36 = +[VCPTextEncoder convertFloat32ToFloat16:self->_embedding];
                int v51 = @"ImageEmbeddingResults";
                v48[0] = @"start";
                int v37 = (CMTime *)MEMORY[0x1E4F1FA48];
                CMTime buf = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
                CFDictionaryRef v38 = CMTimeCopyAsDictionary(&buf, 0);
                v49[0] = v38;
                v48[1] = @"duration";
                CMTime buf = *v37;
                CFDictionaryRef v39 = CMTimeCopyAsDictionary(&buf, 0);
                v49[1] = v39;
                v48[2] = @"attributes";
                v47[0] = v36;
                v46[0] = @"embeddings";
                v46[1] = @"embeddingVersion";
                uint64_t v40 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", +[VCPVideoTransformerBackbone embeddingVersionForRevision:](VCPVideoTransformerBackbone, "embeddingVersionForRevision:", self->_revision));
                v47[1] = v40;
                unsigned int v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:2];
                v49[2] = v41;
                double v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:3];
                uint64_t v50 = v42;
                unsigned int v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
                v52[0] = v43;
                *a5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:&v51 count:1];

                int v13 = 0;
                goto LABEL_18;
              }
            }
          }
        }
        else
        {
          memset(&buf, 0, sizeof(buf));
          p_CMTime buf = &buf;
          std::vector<VCPEspressoV2Data * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_buf);
        }
      }
      int v13 = 1;
LABEL_18:
    }
  }
  return v13;
}

- (BOOL)isFP16
{
  return self->_isFP16;
}

- (NSData)embedding
{
  return (NSData *)objc_getProperty(self, a2, 88, 1);
}

- (NSData)spatialEmbedding
{
  return (NSData *)objc_getProperty(self, a2, 96, 1);
}

- (NSData)hiddenEmbedding
{
  return (NSData *)objc_getProperty(self, a2, 104, 1);
}

- (BOOL)bypassNormalizaton
{
  return self->_bypassNormalizaton;
}

- (void)setBypassNormalizaton:(BOOL)a3
{
  self->_bypassNormalizaton = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hiddenEmbedding, 0);
  objc_storeStrong((id *)&self->_spatialEmbedding, 0);
  objc_storeStrong((id *)&self->_embedding, 0);
  objc_storeStrong((id *)&self->_modelEspressoV2, 0);
  objc_storeStrong((id *)&self->_inputData, 0);
  objc_storeStrong((id *)&self->_transformImage, 0);
}

@end