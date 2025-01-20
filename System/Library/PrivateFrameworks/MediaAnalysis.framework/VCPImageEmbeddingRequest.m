@interface VCPImageEmbeddingRequest
- (BOOL)cleanupWithOptions:(id)a3 error:(id *)a4;
- (BOOL)updateWithOptions:(id)a3 error:(id *)a4;
- (CGSize)preferredInputSizeWithOptions:(id)a3 error:(id *)a4;
- (VCPImageEmbeddingRequest)initWithOptions:(id)a3;
- (id)processImage:(__CVBuffer *)a3 withOptions:(id)a4 error:(id *)a5;
- (unsigned)preferredPixelFormat;
@end

@implementation VCPImageEmbeddingRequest

- (VCPImageEmbeddingRequest)initWithOptions:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)VCPImageEmbeddingRequest;
  v3 = [(VCPRequest *)&v15 initWithOptions:a3];
  v4 = v3;
  if (!v3) {
    goto LABEL_13;
  }
  unsigned int revision = v3->super._revision;
  if (!revision)
  {
    uint64_t v6 = 4;
    v3->super._unsigned int revision = 4;
LABEL_11:
    v8 = [VCPImageBackboneAnalyzer alloc];
    v7 = [NSNumber numberWithInteger:v6];
    uint64_t v9 = [(VCPImageBackboneAnalyzer *)v8 initWithRequestedAnalyses:0x1000000000000 andRevision:v7 useSharedModel:0];
    analyzer = v4->_analyzer;
    v4->_analyzer = (VCPImageBackboneAnalyzer *)v9;

    goto LABEL_12;
  }
  if (revision == 5) {
    uint64_t v6 = 5;
  }
  else {
    uint64_t v6 = 4;
  }
  if ((revision & 0xFFFFFFFE) == 4) {
    goto LABEL_11;
  }
  if ((int)MediaAnalysisLogLevel() < 3) {
    goto LABEL_13;
  }
  v7 = VCPLogInstance();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v14[0] = 0;
    _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_ERROR, "VCPImageEmbeddingRequest only supports revision 4 and revision 5", (uint8_t *)v14, 2u);
  }
LABEL_12:

LABEL_13:
  if (v4->_analyzer) {
    v11 = v4;
  }
  else {
    v11 = 0;
  }
  v12 = v11;

  return v12;
}

- (id)processImage:(__CVBuffer *)a3 withOptions:(id)a4 error:(id *)a5
{
  uint64_t v6 = a3;
  v34[1] = *MEMORY[0x1E4F143B8];
  v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", a3, a4);
  analyzer = self->_analyzer;
  id v29 = 0;
  LODWORD(v6) = [(VCPImageBackboneAnalyzer *)analyzer analyzePixelBuffer:v6 flags:0 results:&v29 cancel:&__block_literal_global_6];
  id v10 = v29;
  v11 = v10;
  if (v6)
  {
    if (!a5) {
      goto LABEL_19;
    }
    v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v33 = *MEMORY[0x1E4F28568];
    v13 = [NSString stringWithFormat:@"VCPImageEmbeddingRequest image embedding analysis failed"];
    v34[0] = v13;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
    *a5 = [v12 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v14];
  }
  else
  {
    v13 = [v10 objectForKeyedSubscript:@"ImageEmbeddingResults"];
    if (![v13 count]) {
      goto LABEL_18;
    }
    objc_super v15 = [v13 objectAtIndexedSubscript:0];
    v16 = [v15 objectForKeyedSubscript:@"attributes"];
    v14 = [v16 objectForKeyedSubscript:@"embeddings"];

    v17 = [v13 objectAtIndexedSubscript:0];
    v18 = [v17 objectForKeyedSubscript:@"attributes"];
    v19 = [v18 objectForKeyedSubscript:@"embeddingVersion"];

    if (!v19 || [v19 intValue] != self->super._revision)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v20 = VCPLogInstance();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BBEDA000, v20, OS_LOG_TYPE_ERROR, "VCPMADImageEmbeddingTask unexpected image embedding version", buf, 2u);
        }
      }
      if (a5)
      {
        v21 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v31 = *MEMORY[0x1E4F28568];
        v22 = [NSString stringWithFormat:@"VCPMADImageEmbeddingTask unexpected image embedding version. Expect %d, got %d", self->super._revision, objc_msgSend(v19, "intValue")];
        v32 = v22;
        v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
        *a5 = [v21 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v23];
      }
    }

    if (!v14) {
      goto LABEL_18;
    }
    v24 = objc_alloc_init(VCPImageEmbeddingObservation);
    [(VCPImageEmbeddingObservation *)v24 setVersion:self->super._revision];
    [(VCPImageEmbeddingObservation *)v24 setData:v14];
    [(VCPImageEmbeddingObservation *)v24 setType:1];
    -[VCPImageEmbeddingObservation setCount:](v24, "setCount:", (unint64_t)[v14 length] >> 1);
    v30[0] = &unk_1F15EB460;
    v25 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[VCPImageEmbeddingObservation count](v24, "count"));
    v30[1] = v25;
    v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
    [(VCPImageEmbeddingObservation *)v24 setShape:v26];

    if (v24) {
      [v8 addObject:v24];
    }
  }
LABEL_18:

LABEL_19:
  return v8;
}

uint64_t __59__VCPImageEmbeddingRequest_processImage_withOptions_error___block_invoke()
{
  return 0;
}

- (BOOL)updateWithOptions:(id)a3 error:(id *)a4
{
  int width = self->super._width;
  int height = self->super._height;
  v11.receiver = self;
  v11.super_class = (Class)VCPImageEmbeddingRequest;
  [(VCPRequest *)&v11 updateWithOptions:a3 error:a4];
  int v7 = self->super._width;
  if (width != v7)
  {
    if (v7 < 1) {
      return 1;
    }
    int v8 = self->super._height;
    goto LABEL_10;
  }
  int v8 = self->super._height;
  if (width >= 1 && height != v8)
  {
LABEL_10:
    if (v8 >= 1)
    {
      self->_preferredWidth = v7;
      self->_preferredHeight = self->super._height;
      self->_preferredFormat = 1111970369;
    }
  }
  return 1;
}

- (CGSize)preferredInputSizeWithOptions:(id)a3 error:(id *)a4
{
  double preferredWidth = (double)self->_preferredWidth;
  double preferredHeight = (double)self->_preferredHeight;
  result.int height = preferredHeight;
  result.int width = preferredWidth;
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