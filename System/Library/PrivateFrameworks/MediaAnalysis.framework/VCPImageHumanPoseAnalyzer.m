@interface VCPImageHumanPoseAnalyzer
+ (BOOL)saveKeypoints;
+ (id)sharedModel:(id)a3;
- (BOOL)trackingMode;
- (VCPImageHumanPoseAnalyzer)init;
- (VCPImageHumanPoseAnalyzer)initWithKeypointsOption:(BOOL)a3 aspectRatio:(id)a4 lightweight:(BOOL)a5 forceCPU:(BOOL)a6 sharedModel:(BOOL)a7 flushModel:(BOOL)a8;
- (id).cxx_construct;
- (int)analyzePixelBuffer:(__CVBuffer *)a3 flags:(unint64_t *)a4 results:(id *)a5 cancel:(id)a6;
- (int)configForAspectRatio:(id)a3;
- (int)copyImage:(__CVBuffer *)a3 toData:(float *)a4 withChannels:(int)a5;
- (int)createInput:(float *)a3 withBuffer:(__CVBuffer *)a4 modelInputHeight:(int)a5 modelInputWidth:(int)a6;
- (int)createModelWithHeight:(int)a3 srcWidth:(int)a4;
- (int)generateHumanPose:(__CVBuffer *)a3;
- (int)parsePersons:(float)a3 width:(int)a4 height:(int)a5;
- (int)preferredInputFormat:(int *)a3 height:(int *)a4 format:(unsigned int *)a5;
- (int)processPersons:(float)a3 width:(int)a4 height:(int)a5;
- (int)reInitModel;
- (int)updateModelForAspectRatio:(id)a3;
- (void)dealloc;
- (void)setTrackingMode:(BOOL)a3;
@end

@implementation VCPImageHumanPoseAnalyzer

+ (BOOL)saveKeypoints
{
  return 0;
}

- (VCPImageHumanPoseAnalyzer)init
{
  return 0;
}

- (VCPImageHumanPoseAnalyzer)initWithKeypointsOption:(BOOL)a3 aspectRatio:(id)a4 lightweight:(BOOL)a5 forceCPU:(BOOL)a6 sharedModel:(BOOL)a7 flushModel:(BOOL)a8
{
  BOOL v36 = a6;
  BOOL v37 = a7;
  BOOL v8 = a5;
  v40[2] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  v11 = objc_msgSend(MEMORY[0x1E4F28B50], "vcp_mediaAnalysisBundle");
  v12 = [v11 resourceURL];

  v13 = [MEMORY[0x1E4F1CB10] URLWithString:@"cnn_human_pose.espresso.net" relativeToURL:v12];
  netFileUrl = self->_netFileUrl;
  self->_netFileUrl = v13;

  v38.receiver = self;
  v38.super_class = (Class)VCPImageHumanPoseAnalyzer;
  v15 = [(VCPImageHumanPoseAnalyzer *)&v38 init];
  v16 = v15;
  if (!v15) {
    goto LABEL_12;
  }
  resConfig = v15->_resConfig;
  v15->_resConfig = (NSString *)@"res_256x256";

  v16->_inputWidth = 256;
  v16->_inputHeight = 256;
  if (v8)
  {
    v18 = v16->_resConfig;
    v16->_resConfig = (NSString *)@"res_192x192";

    v16->_inputWidth = 192;
    v16->_inputHeight = 192;
    goto LABEL_6;
  }
  if (v10 && [(VCPImageHumanPoseAnalyzer *)v16 configForAspectRatio:v10])
  {
LABEL_12:
    v31 = 0;
    goto LABEL_13;
  }
LABEL_6:
  v16->_inputData = 0;
  v16->_trackingMode = 0;
  uint64_t v19 = [MEMORY[0x1E4F1CA48] array];
  persons = v16->_persons;
  v16->_persons = (NSMutableArray *)v19;

  uint64_t v21 = [MEMORY[0x1E4F1CA48] array];
  results = v16->_results;
  v16->_results = (NSMutableArray *)v21;

  if ((DeviceHasANE() & v37) != 1 || v36)
  {
    v25 = [VCPCNNModelEspresso alloc];
    v26 = v16->_netFileUrl;
    v39[0] = @"forceCPU";
    v24 = [NSNumber numberWithBool:v36];
    v40[0] = v24;
    v39[1] = @"sharedContext";
    v27 = [NSNumber numberWithBool:v37];
    v40[1] = v27;
    v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:2];
    uint64_t v29 = [(VCPCNNModelEspresso *)v25 initWithParameters:v26 inputNames:0 outputNames:0 properties:v28];
    modelEspresso = v16->_modelEspresso;
    v16->_modelEspresso = (VCPCNNModelEspresso *)v29;
  }
  else
  {
    uint64_t v23 = [(id)objc_opt_class() sharedModel:v16->_netFileUrl];
    v24 = v16->_modelEspresso;
    v16->_modelEspresso = (VCPCNNModelEspresso *)v23;
  }

  v31 = v16->_modelEspresso;
  if (v31)
  {
    if (![(VCPImageHumanPoseAnalyzer *)v16 createModelWithHeight:v16->_inputHeight srcWidth:v16->_inputWidth])
    {
      v16->_saveKeypoints = a3;
      v16->_heatmapNms = 0;
      v16->_forceCPU = v36;
      v16->_sharedModel = v37;
      v16->_flushModel = a8;
      v31 = v16;
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_13:
  v32 = v31;

  return v32;
}

- (int)reInitModel
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v3 = [VCPCNNModelEspresso alloc];
  netFileUrl = self->_netFileUrl;
  v11[0] = @"forceCPU";
  v5 = [NSNumber numberWithBool:self->_forceCPU];
  v12[0] = v5;
  v11[1] = @"sharedContext";
  v6 = [NSNumber numberWithBool:self->_sharedModel];
  v12[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  BOOL v8 = [(VCPCNNModelEspresso *)v3 initWithParameters:netFileUrl inputNames:0 outputNames:0 properties:v7];
  modelEspresso = self->_modelEspresso;
  self->_modelEspresso = v8;

  if (self->_modelEspresso) {
    return [(VCPImageHumanPoseAnalyzer *)self createModelWithHeight:self->_inputHeight srcWidth:self->_inputWidth];
  }
  else {
    return -108;
  }
}

+ (id)sharedModel:(id)a3
{
  id v3 = a3;
  v4 = +[VCPSharedInstanceManager sharedManager];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__VCPImageHumanPoseAnalyzer_sharedModel___block_invoke;
  v8[3] = &unk_1E6298108;
  id v5 = v3;
  id v9 = v5;
  v6 = [v4 sharedInstanceWithIdentifier:@"VCPHumanPoseEspresso" andCreationBlock:v8];

  return v6;
}

VCPCNNModelEspresso *__41__VCPImageHumanPoseAnalyzer_sharedModel___block_invoke(uint64_t a1)
{
  v1 = [[VCPCNNModelEspresso alloc] initWithParameters:*(void *)(a1 + 32) inputNames:0 outputNames:0 properties:0];
  return v1;
}

- (void)dealloc
{
  inputData = self->_inputData;
  if (inputData) {
    MEMORY[0x1C186C790](inputData, 0x1000C8052888210);
  }
  heatmapNms = self->_heatmapNms;
  if (heatmapNms) {
    MEMORY[0x1C186C790](heatmapNms, 0x1000C8052888210);
  }
  v5.receiver = self;
  v5.super_class = (Class)VCPImageHumanPoseAnalyzer;
  [(VCPImageHumanPoseAnalyzer *)&v5 dealloc];
}

- (int)configForAspectRatio:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  if (v4)
  {
    [v4 floatValue];
    if (v6 <= 1.4)
    {
      [v5 floatValue];
      resConfig = self->_resConfig;
      if (v10 >= 0.714285726)
      {
        self->_resConfig = (NSString *)@"res_256x256";
        int v9 = 256;
        int v8 = 256;
      }
      else
      {
        self->_resConfig = (NSString *)@"res_192x320";
        int v8 = 320;
        int v9 = 192;
      }
    }
    else
    {
      resConfig = self->_resConfig;
      self->_resConfig = (NSString *)@"res_320x192";
      int v8 = 192;
      int v9 = 320;
    }

    self->_inputWidth = v9;
    self->_inputHeight = v8;
  }

  return 0;
}

- (int)updateModelForAspectRatio:(id)a3
{
  objc_super v5 = self->_resConfig;
  int v6 = [(VCPImageHumanPoseAnalyzer *)self configForAspectRatio:a3];
  if (!v6)
  {
    if (v5 == self->_resConfig)
    {
      int v6 = 0;
    }
    else if (self->_modelEspresso)
    {
      int v6 = [(VCPImageHumanPoseAnalyzer *)self createModelWithHeight:self->_inputHeight srcWidth:self->_inputWidth];
    }
    else
    {
      int v6 = -108;
    }
  }

  return v6;
}

- (int)preferredInputFormat:(int *)a3 height:(int *)a4 format:(unsigned int *)a5
{
  int result = -50;
  if (a3 && a4)
  {
    if (a5)
    {
      int result = 0;
      *a3 = self->_inputWidth;
      *a4 = self->_inputHeight;
      *a5 = 1111970369;
    }
  }
  return result;
}

- (int)parsePersons:(float)a3 width:(int)a4 height:(int)a5
{
  uint64_t v134 = *MEMORY[0x1E4F143B8];
  modelEspresso = self->_modelEspresso;
  if (!modelEspresso) {
    return -18;
  }
  v106 = self;
  [(VCPCNNModelEspresso *)modelEspresso outputBlob];
  __src = v126;
  if (!v126) {
    return -18;
  }
  heatmapNms = v106->_heatmapNms;
  int v104 = a5 * a4;
  if (!heatmapNms) {
    operator new[]();
  }
  memcpy(heatmapNms, v126, 68 * a5 * a4);
  int v11 = 0;
  uint64_t v12 = 0;
  v13 = v106->_heatmapNms;
  uint64_t v14 = a4;
  uint64_t v15 = 4 * a4;
  LODWORD(v16) = -1.0;
  do
  {
    if (a5 >= 1)
    {
      uint64_t v17 = 0;
      LODWORD(v18) = 0;
      uint64_t v19 = (uint64_t)&v13[v11 - 3 + -3 * a4];
      v20 = &v13[v104 * (int)v12];
      do
      {
        if (a4 >= 1)
        {
          uint64_t v21 = 0;
          uint64_t v18 = (int)v18;
          uint64_t v22 = v19;
          do
          {
            float v23 = v20[v18];
            if (v23 >= a3)
            {
              uint64_t v24 = -3;
              uint64_t v25 = v22;
              do
              {
                uint64_t v26 = 0;
                BOOL v28 = v24 + v17 >= 0 && v24 + v17 < a5;
                while (!v28 || v21 + v26 - 3 < 0 || v21 + v26 - 3 >= a4 || *(float *)(v25 + 4 * v26) <= v23)
                {
                  if (++v26 == 7) {
                    goto LABEL_28;
                  }
                }
                float v23 = v23 + -1.0;
                v20[v18] = v23;
LABEL_28:
                ++v24;
                v25 += v15;
              }
              while (v24 != 4);
            }
            else
            {
              v20[v18] = v23 + -1.0;
            }
            ++v21;
            ++v18;
            v22 += 4;
          }
          while (v21 != a4);
        }
        ++v17;
        v19 += v15;
      }
      while (v17 != a5);
    }
    ++v12;
    v11 += v104;
  }
  while (v12 != 17);
  v105 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", v16);
  obunint64_t j = 0;
  do
  {
    if (a5 < 1) {
      goto LABEL_62;
    }
    int v29 = 0;
    unsigned int v107 = 0;
    uint64_t v114 = (uint64_t)&v106->_heatmapNms[v104 * (int)obj];
    do
    {
      if (a4 < 1) {
        goto LABEL_61;
      }
      unsigned int v30 = 0;
      uint64_t v31 = v29;
      do
      {
        if (*(float *)(v114 + 4 * v31) <= a3) {
          goto LABEL_59;
        }
        uint64_t v112 = v31;
        float v32 = __src[v104 * ((int)obj + 17) + v31];
        long long v124 = 0u;
        long long v125 = 0u;
        long long v122 = 0u;
        long long v123 = 0u;
        id v33 = v105;
        uint64_t v34 = [v33 countByEnumeratingWithState:&v122 objects:v133 count:16];
        unsigned int v110 = v30;
        if (v34)
        {
          int v35 = 0;
          uint64_t v36 = *(void *)v123;
          LODWORD(v37) = -1;
          float v38 = 3.4028e38;
          do
          {
            uint64_t v39 = 0;
            int v40 = v35;
            v35 += v34;
            do
            {
              if (*(void *)v123 != v36) {
                objc_enumerationMutation(v33);
              }
              v41 = [*(id *)(*((void *)&v122 + 1) + 8 * v39) objectAtIndexedSubscript:0];
              [v41 floatValue];
              float v43 = v42;

              float v44 = vabds_f32(v32, v43);
              if (v44 >= v38) {
                uint64_t v37 = v37;
              }
              else {
                uint64_t v37 = (v40 + v39);
              }
              if (v44 < v38) {
                float v38 = v44;
              }
              ++v39;
            }
            while (v34 != v39);
            uint64_t v34 = [v33 countByEnumeratingWithState:&v122 objects:v133 count:16];
          }
          while (v34);

          if ((v37 & 0x80000000) == 0 && v38 < 0.3)
          {
            v46 = [(NSMutableArray *)v106->_persons objectAtIndexedSubscript:v37];
            v47 = [v33 objectAtIndexedSubscript:v37];
            v48 = [v47 objectAtIndexedSubscript:0];
            [v48 floatValue];
            float v50 = v49;

            v51 = [v33 objectAtIndexedSubscript:v37];
            v52 = [v51 objectAtIndexedSubscript:1];
            [v52 floatValue];
            float v54 = v53;

            *(float *)&double v55 = (float)(v32 + (float)(v50 * v54)) / (float)(v54 + 1.0);
            v56 = [NSNumber numberWithFloat:v55];
            v132[0] = v56;
            *(float *)&double v57 = v54 + 1.0;
            v58 = [NSNumber numberWithFloat:v57];
            v132[1] = v58;
            v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:v132 count:2];
            [v33 setObject:v59 atIndexedSubscript:v37];

            float v60 = *(float *)(v114 + 4 * v112);
            v61 = [v46 objectAtIndexedSubscript:obj];
            v62 = [v61 objectAtIndexedSubscript:2];
            [v62 floatValue];
            LODWORD(v58) = v60 > v63;

            if (v58)
            {
              v64 = [NSNumber numberWithInt:v110];
              v131[0] = v64;
              v65 = [NSNumber numberWithInt:v107];
              v131[1] = v65;
              LODWORD(v66) = *(_DWORD *)(v114 + 4 * v112);
              v67 = [NSNumber numberWithFloat:v66];
              v131[2] = v67;
              v68 = [MEMORY[0x1E4F1C978] arrayWithObjects:v131 count:3];
              [v46 setObject:v68 atIndexedSubscript:obj];
            }
            goto LABEL_58;
          }
        }
        else
        {
        }
        *(float *)&double v45 = v32;
        v69 = [NSNumber numberWithFloat:v45];
        v130[0] = v69;
        v130[1] = &unk_1F15EAD98;
        v70 = [MEMORY[0x1E4F1C978] arrayWithObjects:v130 count:2];
        [v33 addObject:v70];

        v46 = [MEMORY[0x1E4F1CA48] array];
        int v71 = 17;
        do
        {
          [v46 addObject:&unk_1F15EE760];
          --v71;
        }
        while (v71);
        v72 = [NSNumber numberWithInt:v110];
        v129[0] = v72;
        v73 = [NSNumber numberWithInt:v107];
        v129[1] = v73;
        LODWORD(v74) = *(_DWORD *)(v114 + 4 * v112);
        v75 = [NSNumber numberWithFloat:v74];
        v129[2] = v75;
        v76 = [MEMORY[0x1E4F1C978] arrayWithObjects:v129 count:3];
        [v46 setObject:v76 atIndexedSubscript:obj];

        [(NSMutableArray *)v106->_persons addObject:v46];
LABEL_58:

        uint64_t v31 = v112;
        unsigned int v30 = v110;
LABEL_59:
        ++v30;
        ++v31;
      }
      while (v30 != a4);
      int v29 = v31;
LABEL_61:
      ++v107;
    }
    while (v107 != a5);
LABEL_62:
    obunint64_t j = (char *)obj + 1;
  }
  while (obj != (id)17);
  long long v120 = 0u;
  long long v121 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  obja = v106->_persons;
  uint64_t v77 = [(NSMutableArray *)obja countByEnumeratingWithState:&v118 objects:v128 count:16];
  if (v77)
  {
    uint64_t v111 = v77;
    uint64_t v113 = *(void *)v119;
    while (2)
    {
      for (uint64_t i = 0; i != v111; ++i)
      {
        if (*(void *)v119 != v113) {
          objc_enumerationMutation(obja);
        }
        v117 = *(void **)(*((void *)&v118 + 1) + 8 * i);
        if ([v117 count] != 17)
        {
          int v9 = -18;
          goto LABEL_89;
        }
        int v78 = 0;
        for (unint64_t j = 0; [v117 count] > j; ++j)
        {
          v80 = [v117 objectAtIndexedSubscript:j];
          v81 = [v80 objectAtIndexedSubscript:2];
          [v81 floatValue];
          BOOL v83 = v82 > 0.1;

          if (v83)
          {
            v84 = [v80 objectAtIndexedSubscript:0];
            int v85 = [v84 intValue];

            v86 = [v80 objectAtIndexedSubscript:1];
            int v87 = [v86 intValue];

            v89 = &__src[v14 * (v87 - 3) + v85 + v78];
            float v90 = 0.0;
            uint64_t v91 = -3;
            float v92 = 0.0;
            double v93 = 0.0;
            do
            {
              uint64_t v94 = v91 + v87;
              *(float *)&double v88 = (float)(v91 + v87);
              for (uint64_t k = -3; k != 4; ++k)
              {
                if ((v94 & 0x8000000000000000) == 0
                  && v94 < a5
                  && ((v85 + k) & 0x8000000000000000) == 0
                  && v85 + k < v14)
                {
                  float v96 = v89[k];
                  if (v96 > 0.05)
                  {
                    float v90 = v90 + v96;
                    *(float *)&double v93 = *(float *)&v93 + (float)(v96 * (float)(v85 + k));
                    float v92 = v92 + (float)(v96 * *(float *)&v88);
                  }
                }
              }
              ++v91;
              v89 += v14;
            }
            while (v91 != 4);
            if (v90 > 0.0)
            {
              *(float *)&double v93 = (float)(*(float *)&v93 / v90) + 0.5;
              v97 = objc_msgSend(NSNumber, "numberWithFloat:", v93, v88);
              v127[0] = v97;
              *(float *)&double v98 = (float)(v92 / v90) + 0.5;
              v99 = [NSNumber numberWithFloat:v98];
              v127[1] = v99;
              v100 = [v80 objectAtIndexedSubscript:2];
              v127[2] = v100;
              v101 = [MEMORY[0x1E4F1C978] arrayWithObjects:v127 count:3];
              [v117 setObject:v101 atIndexedSubscript:j];
            }
          }

          v78 += v104;
        }
      }
      uint64_t v111 = [(NSMutableArray *)obja countByEnumeratingWithState:&v118 objects:v128 count:16];
      if (v111) {
        continue;
      }
      break;
    }
  }
  int v9 = 0;
LABEL_89:

  return v9;
}

- (int)processPersons:(float)a3 width:(int)a4 height:(int)a5
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  obunint64_t j = self->_persons;
  uint64_t v79 = [(NSMutableArray *)obj countByEnumeratingWithState:&v87 objects:v94 count:16];
  if (v79)
  {
    float v77 = a3;
    float v84 = (float)a5;
    float v85 = (float)a4;
    uint64_t v81 = *(void *)v88;
    float v8 = 1.0;
    HIDWORD(v9) = 1072850534;
    while (2)
    {
      for (uint64_t i = 0; i != v79; ++i)
      {
        if (*(void *)v88 != v81) {
          objc_enumerationMutation(obj);
        }
        v86 = *(void **)(*((void *)&v87 + 1) + 8 * i);
        LODWORD(v9) = 1036831949;
        unint64_t v80 = +[VCPHuman flagsFromKeypoints:withMinConfidence:](VCPHuman, "flagsFromKeypoints:withMinConfidence:", v9);
        unint64_t v10 = 0;
        float v11 = 1.0;
        float v12 = 0.0;
        float v13 = 0.0;
        float v14 = 1.0;
        float v15 = 0.0;
        float v16 = 0.0;
        while ([v86 count] > v10)
        {
          uint64_t v17 = [v86 objectAtIndexedSubscript:v10];
          BOOL v18 = [v17 count] == 3;

          if (!v18)
          {
            int v75 = -18;
            goto LABEL_49;
          }
          uint64_t v19 = NSNumber;
          v20 = [v86 objectAtIndexedSubscript:v10];
          uint64_t v21 = [v20 objectAtIndexedSubscript:0];
          [v21 floatValue];
          *(float *)&double v23 = v22 / v85;
          uint64_t v24 = [v19 numberWithFloat:v23];
          v93[0] = v24;
          uint64_t v25 = NSNumber;
          uint64_t v26 = [v86 objectAtIndexedSubscript:v10];
          v27 = [v26 objectAtIndexedSubscript:1];
          [v27 floatValue];
          *(float *)&double v29 = v8 - (float)(v28 / v84);
          unsigned int v30 = [v25 numberWithFloat:v29];
          v93[1] = v30;
          uint64_t v31 = [v86 objectAtIndexedSubscript:v10];
          float v32 = [v31 objectAtIndexedSubscript:2];
          v93[2] = v32;
          id v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v93 count:3];
          [v86 setObject:v33 atIndexedSubscript:v10];

          uint64_t v34 = [v86 objectAtIndexedSubscript:v10];
          int v35 = [v34 objectAtIndexedSubscript:2];
          [v35 floatValue];
          LODWORD(v31) = v36 > 0.1;

          if (v31)
          {
            uint64_t v37 = [v86 objectAtIndexedSubscript:v10];
            float v38 = [v37 objectAtIndexedSubscript:0];
            [v38 floatValue];
            if (v14 >= v39) {
              float v14 = v39;
            }

            int v40 = [v86 objectAtIndexedSubscript:v10];
            v41 = [v40 objectAtIndexedSubscript:1];
            [v41 floatValue];
            if (v11 >= v42) {
              float v11 = v42;
            }

            float v43 = [v86 objectAtIndexedSubscript:v10];
            float v44 = [v43 objectAtIndexedSubscript:0];
            [v44 floatValue];
            if (v45 >= v13) {
              float v13 = v45;
            }

            v46 = [v86 objectAtIndexedSubscript:v10];
            v47 = [v46 objectAtIndexedSubscript:1];
            [v47 floatValue];
            if (v48 >= v12) {
              float v12 = v48;
            }

            float v49 = [v86 objectAtIndexedSubscript:v10];
            float v50 = [v49 objectAtIndexedSubscript:2];
            [v50 floatValue];
            float v52 = v51;

            float v16 = v16 + v52;
            float v15 = v15 + v8;
          }
          ++v10;
        }
        if ((float)(v13 - v14) != 0.0 && (float)(v12 - v11) != 0.0 && v15 > 4.0 && (v80 & 0xFFFFFFFFFFEFFFFFLL) != 0)
        {
          float v53 = vabds_f32(v13, v14);
          float v54 = vabds_f32(v12, v11);
          float v55 = v53 >= v54 ? v53 : v54;
          if (v55 > 0.1)
          {
            double v56 = v14;
            double v57 = v11;
            double v58 = v53;
            double v59 = v54;
            float v60 = v16 / v15;
            float v61 = v14 - v58 * 0.150000006;
            float v62 = v61 >= 0.0 ? v14 - v58 * 0.150000006 : 0.0;
            float v63 = v57 - v59 * 0.150000006;
            float v64 = v63 >= 0.0 ? v57 - v59 * 0.150000006 : 0.0;
            float v65 = v56 + v58 * 1.14999998;
            float v66 = v65 <= 1.0 ? v65 : 1.0;
            double v9 = v57 + v59 * 1.14999998;
            *(float *)&double v9 = v9;
            float v8 = 1.0;
            float v67 = *(float *)&v9 <= 1.0 ? *(float *)&v9 : 1.0;
            if (v60 > v77)
            {
              v68 = [MEMORY[0x1E4F1CA60] dictionary];
              v96.origin.x = v62;
              v96.origin.y = v64;
              v96.size.width = (float)(v66 - v62);
              v96.size.height = (float)(v67 - v64);
              v69 = NSStringFromRect(v96);
              [v68 setObject:v69 forKeyedSubscript:@"humanBounds"];

              *(float *)&double v70 = v60;
              int v71 = [NSNumber numberWithFloat:v70];
              [v68 setObject:v71 forKeyedSubscript:@"humanConfidence"];

              if (self->_saveKeypoints) {
                [v68 setObject:v86 forKeyedSubscript:@"humanKeypoints"];
              }
              results = self->_results;
              v91[0] = @"flags";
              v73 = [NSNumber numberWithUnsignedLongLong:v80];
              v91[1] = @"attributes";
              v92[0] = v73;
              v92[1] = v68;
              double v74 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v92 forKeys:v91 count:2];
              [(NSMutableArray *)results addObject:v74];
            }
          }
        }
      }
      int v75 = 0;
      uint64_t v79 = [(NSMutableArray *)obj countByEnumeratingWithState:&v87 objects:v94 count:16];
      if (v79) {
        continue;
      }
      break;
    }
  }
  else
  {
    int v75 = 0;
  }
LABEL_49:

  return v75;
}

- (int)generateHumanPose:(__CVBuffer *)a3
{
  int result = [(VCPCNNModelEspresso *)self->_modelEspresso espressoForward:self->_inputData];
  if (!result)
  {
    modelEspresso = self->_modelEspresso;
    if (modelEspresso)
    {
      [(VCPCNNModelEspresso *)modelEspresso outputBlob];
      v7 = self->_modelEspresso;
      uint64_t v8 = v11;
      if (v7)
      {
        [(VCPCNNModelEspresso *)v7 outputBlob];
        uint64_t v9 = v12;
      }
      else
      {
        uint64_t v9 = 0;
      }
    }
    else
    {
      uint64_t v9 = 0;
      uint64_t v8 = 0;
    }
    LODWORD(v5) = 1036831949;
    int result = [(VCPImageHumanPoseAnalyzer *)self parsePersons:v8 width:v9 height:v5];
    if (!result)
    {
      LODWORD(v10) = 1036831949;
      return [(VCPImageHumanPoseAnalyzer *)self processPersons:v8 width:v9 height:v10];
    }
  }
  return result;
}

- (int)copyImage:(__CVBuffer *)a3 toData:(float *)a4 withChannels:(int)a5
{
  if (a5 != 3 || CVPixelBufferGetPixelFormatType(a3) != 1111970369) {
    return -50;
  }
  int Width = CVPixelBufferGetWidth(a3);
  int Height = CVPixelBufferGetHeight(a3);
  CVPixelBufferRef pixelBuffer = a3;
  CVPixelBufferLockFlags unlockFlags = 1;
  if (!a3)
  {
    BOOL v12 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v12) {
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:](v12, v13, v14, v15, v16, v17, v18, v19);
    }
    return -50;
  }
  int v9 = Height;
  CVReturn v10 = CVPixelBufferLockBaseAddress(a3, 1uLL);
  CVReturn v31 = v10;
  if (v10)
  {
    int v11 = v10;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:]();
    }
  }
  else
  {
    BaseAddress = CVPixelBufferGetBaseAddress(a3);
    int BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
    bzero(a4, 3 * 4 * Width * v9);
    if (v9 >= 1)
    {
      int v24 = 0;
      uint64_t v25 = &a4[2 * v9 * Width];
      uint64_t v26 = &a4[v9 * Width];
      uint64_t v27 = 4 * Width;
      do
      {
        if (Width >= 1)
        {
          for (uint64_t i = 0; i != Width; ++i)
          {
            LOBYTE(v23) = BaseAddress[(int)(i * 4) + 2];
            *(float *)&unsigned int v29 = (float)LODWORD(v23) / 255.0;
            a4[i] = *(float *)&v29;
            LOBYTE(v29) = BaseAddress[(int)(i * 4) + 1];
            *(float *)&unsigned int v30 = (float)v29 / 255.0;
            v26[i] = *(float *)&v30;
            LOBYTE(v30) = BaseAddress[(int)(i * 4)];
            float v23 = (float)v30 / 255.0;
            v25[i] = v23;
          }
        }
        BaseAddress += BytesPerRow;
        ++v24;
        uint64_t v25 = (float *)((char *)v25 + v27);
        uint64_t v26 = (float *)((char *)v26 + v27);
        a4 = (float *)((char *)a4 + v27);
      }
      while (v24 != v9);
    }
    int v11 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v31);
    if (pixelBuffer
      && !v31
      && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
      && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      -[VCPCNNSmileDetector detectSmileForFace:inBuffer:smile:]();
    }
  }
  return v11;
}

- (int)createModelWithHeight:(int)a3 srcWidth:(int)a4
{
  inputData = self->_inputData;
  if (inputData)
  {
    MEMORY[0x1C186C790](inputData, 0x1000C8052888210, *(void *)&a3, *(void *)&a4);
    self->_inputData = 0;
  }
  heatmapNms = self->_heatmapNms;
  if (heatmapNms)
  {
    MEMORY[0x1C186C790](heatmapNms, 0x1000C8052888210, *(void *)&a3, *(void *)&a4);
    self->_heatmapNms = 0;
  }
  int result = -[VCPCNNModelEspresso prepareModelWithConfig:](self->_modelEspresso, "prepareModelWithConfig:", self->_resConfig, *(void *)&a4);
  if (!result)
  {
    modelEspresso = self->_modelEspresso;
    if (modelEspresso
      && ([(VCPCNNModelEspresso *)modelEspresso inputBlob], (int v9 = self->_modelEspresso) != 0))
    {
      [(VCPCNNModelEspresso *)v9 inputBlob];
      CVReturn v10 = self->_modelEspresso;
      uint64_t v11 = v17 * v18;
      if (v10)
      {
        [(VCPCNNModelEspresso *)v10 inputBlob];
        uint64_t v12 = v16;
LABEL_12:
        unint64_t v13 = v11 * v12;
        if (v13 >> 62) {
          size_t v14 = -1;
        }
        else {
          size_t v14 = 4 * v13;
        }
        uint64_t v15 = (float *)operator new[](v14, MEMORY[0x1E4FBA2D0]);
        self->_inputData = v15;
        if (v15) {
          return 0;
        }
        else {
          return -108;
        }
      }
    }
    else
    {
      uint64_t v11 = 0;
    }
    uint64_t v12 = 0;
    goto LABEL_12;
  }
  return result;
}

- (int)createInput:(float *)a3 withBuffer:(__CVBuffer *)a4 modelInputHeight:(int)a5 modelInputWidth:(int)a6
{
  if (!a3) {
    return -108;
  }
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  CFTypeRef cf = 0;
  int Width = CVPixelBufferGetWidth(a4);
  int Height = CVPixelBufferGetHeight(a4);
  if (CVPixelBufferGetPixelFormatType(a4) == 1111970369 && Width == v6 && Height == v7)
  {
    CFTypeRef v13 = CFRetain(a4);
    CFTypeRef cf = v13;
  }
  else
  {
    Scaler::Scale(&self->_scaler, a4, (__CVBuffer **)&cf, v6, v7, 1111970369);
    int v14 = v15;
    if (v15) {
      goto LABEL_10;
    }
    CFTypeRef v13 = cf;
  }
  int v14 = [(VCPImageHumanPoseAnalyzer *)self copyImage:v13 toData:a3 withChannels:3];
LABEL_10:
  if (cf) {
    CFRelease(cf);
  }
  return v14;
}

- (int)analyzePixelBuffer:(__CVBuffer *)a3 flags:(unint64_t *)a4 results:(id *)a5 cancel:(id)a6
{
  v21[1] = *MEMORY[0x1E4F143B8];
  int v9 = (uint64_t (**)(void))a6;
  [(NSMutableArray *)self->_persons removeAllObjects];
  uint64_t v10 = [(NSMutableArray *)self->_results removeAllObjects];
  *a5 = 0;
  if (v9)
  {
    uint64_t v10 = v9[2](v9);
    if (v10)
    {
      int v11 = -128;
      goto LABEL_22;
    }
  }
  uint64_t v12 = (void *)MEMORY[0x1C186D320](v10);
  int Width = CVPixelBufferGetWidth(a3);
  int Height = CVPixelBufferGetHeight(a3);
  if (!self->_flushModel
    || self->_modelEspresso
    || (int v11 = [(VCPImageHumanPoseAnalyzer *)self reInitModel]) == 0)
  {
    if (Height >= Width) {
      int v15 = Width;
    }
    else {
      int v15 = Height;
    }
    if (v15 >= 64)
    {
      int v11 = [(VCPImageHumanPoseAnalyzer *)self createInput:self->_inputData withBuffer:a3 modelInputHeight:self->_inputHeight modelInputWidth:self->_inputWidth];
      if (!v11)
      {
        int v11 = [(VCPImageHumanPoseAnalyzer *)self generateHumanPose:a3];
        if (!v11)
        {
          if (self->_flushModel)
          {
            modelEspresso = self->_modelEspresso;
            if (modelEspresso)
            {
              self->_modelEspresso = 0;
            }
          }
          int v11 = 0;
          int v17 = 1;
          goto LABEL_19;
        }
      }
    }
    else
    {
      int v11 = 0;
    }
  }
  int v17 = 0;
LABEL_19:
  if (v17 && [(NSMutableArray *)self->_results count])
  {
    results = self->_results;
    v20 = @"HumanPoseResults";
    v21[0] = results;
    *a5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
  }
LABEL_22:

  return v11;
}

- (BOOL)trackingMode
{
  return self->_trackingMode;
}

- (void)setTrackingMode:(BOOL)a3
{
  self->_trackingMode = a3;
}

- (void).cxx_destruct
{
  p_scaler = &self->_scaler;
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_scaler.transfer_session_.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&p_scaler->pool_.value_);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_persons, 0);
  objc_storeStrong((id *)&self->_resConfig, 0);
  objc_storeStrong((id *)&self->_netFileUrl, 0);
  objc_storeStrong((id *)&self->_modelEspresso, 0);
}

- (id).cxx_construct
{
  *((void *)self + 16) = 0;
  *((_DWORD *)self + 34) = 0;
  return self;
}

@end