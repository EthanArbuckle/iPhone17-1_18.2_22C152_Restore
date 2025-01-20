@interface VCPVideoPersonDetector
- (VCPVideoPersonDetector)init;
- (id)persons;
- (int)analyzeFrame:(__CVBuffer *)a3 withTimestamp:(id *)a4 andDuration:(id *)a5 flags:(unint64_t *)a6;
- (int)detectPersons:(__CVBuffer *)a3 persons:(id)a4;
@end

@implementation VCPVideoPersonDetector

- (VCPVideoPersonDetector)init
{
  v6.receiver = self;
  v6.super_class = (Class)VCPVideoPersonDetector;
  v2 = [(VCPVideoPersonDetector *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    persons = v2->_persons;
    v2->_persons = (NSMutableArray *)v3;
  }
  return v2;
}

- (int)detectPersons:(__CVBuffer *)a3 persons:(id)a4
{
  v57[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  uint64_t v7 = MEMORY[0x1C186D320](Height);
  v45 = [MEMORY[0x1E4F1CA48] array];
  v8 = (void *)MEMORY[0x1C186D320]();
  id v9 = objc_alloc(MEMORY[0x1E4F45890]);
  v10 = (void *)[v9 initWithCVPixelBuffer:a3 options:MEMORY[0x1E4F1CC08]];
  v11 = VCPSignPostLog();
  os_signpost_id_t v12 = os_signpost_id_generate(v11);

  v13 = VCPSignPostLog();
  v14 = v13;
  context = (void *)v7;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "VCPVideoPersonDetectorHumanDetection", "", buf, 2u);
  }

  id v53 = 0;
  uint64_t v15 = objc_opt_class();
  if (_os_feature_enabled_impl()) {
    uint64_t v16 = 15;
  }
  else {
    uint64_t v16 = 11;
  }
  int v17 = +[VCPFaceUtils configureVNRequest:&v53 withClass:v15 andProcessingVersion:v16];
  id v18 = v53;
  v19 = v18;
  if (v17)
  {
    id v20 = 0;
LABEL_16:
    int v25 = 4;
    goto LABEL_17;
  }
  v57[0] = v18;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:1];
  id v52 = 0;
  char v22 = [v10 performRequests:v21 error:&v52];
  id v20 = v52;

  if ((v22 & 1) == 0)
  {
    int v17 = -18;
    goto LABEL_16;
  }
  id v51 = 0;
  uint64_t v23 = objc_opt_class();
  if (_os_feature_enabled_impl()) {
    uint64_t v24 = 15;
  }
  else {
    uint64_t v24 = 11;
  }
  int v17 = +[VCPFaceUtils configureVNRequest:&v51 withClass:v23 andProcessingVersion:v24];
  id v43 = v51;
  if (v17)
  {
    int v25 = 4;
  }
  else
  {
    v34 = [v19 results];
    [v43 setInputDetectedObjectObservations:v34];

    id v56 = v43;
    v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v56 count:1];
    id v50 = v20;
    char v36 = [v10 performRequests:v35 error:&v50];
    id v42 = v50;

    if (v36)
    {
      v37 = VCPSignPostLog();
      v38 = v37;
      if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v38, OS_SIGNPOST_INTERVAL_END, v12, "VCPVideoPersonDetectorHumanDetection", "", buf, 2u);
      }

      v39 = [v43 results];
      BOOL v40 = v39 == 0;

      if (!v40)
      {
        v41 = [v43 results];
        [v45 addObjectsFromArray:v41];
      }
      int v25 = 0;
      int v17 = 0;
    }
    else
    {
      int v17 = -18;
      int v25 = 4;
    }
    id v20 = v42;
  }

LABEL_17:
  if (!v25)
  {
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v26 = v45;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v46 objects:v55 count:16];
    if (v27)
    {
      uint64_t v28 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v47 != v28) {
            objc_enumerationMutation(v26);
          }
          v30 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          v31 = objc_alloc_init(VCPHuman);
          [v30 boundingBox];
          -[VCPHuman setBounds:](v31, "setBounds:");
          [v30 confidence];
          -[VCPHuman setConfidence:](v31, "setConfidence:");
          v32 = [v30 torsoprint];
          [(VCPHuman *)v31 setTorsoprint:v32];

          [v5 addObject:v31];
        }
        uint64_t v27 = [v26 countByEnumeratingWithState:&v46 objects:v55 count:16];
      }
      while (v27);
    }
  }

  return v17;
}

- (int)analyzeFrame:(__CVBuffer *)a3 withTimestamp:(id *)a4 andDuration:(id *)a5 flags:(unint64_t *)a6
{
  objc_super v6 = a3;
  v8 = (void *)MEMORY[0x1C186D320]([(NSMutableArray *)self->_persons removeAllObjects]);
  LODWORD(v6) = [(VCPVideoPersonDetector *)self detectPersons:v6 persons:self->_persons];
  return (int)v6;
}

- (id)persons
{
  return self->_persons;
}

- (void).cxx_destruct
{
}

@end