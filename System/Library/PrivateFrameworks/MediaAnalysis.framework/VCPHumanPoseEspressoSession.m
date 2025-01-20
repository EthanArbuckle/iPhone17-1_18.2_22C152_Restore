@interface VCPHumanPoseEspressoSession
- (VCPHumanPoseEspressoSession)initWithOptions:(id)a3;
- (id)keypointsToObservation:(id)a3;
- (int)keypointsFromTensor:(VCPHumanPoseEspressoSession *)self width:(SEL)a2 height:channels:withOptions:results:;
- (int)keypointsFromTensor:(id *)a3 withOptions:(id)a4 results:(id)a5;
- (int)processFrame:(__CVBuffer *)a3 withOptions:(id)a4 results:(id)a5;
- (int)requiredInputFormat:(int *)a3 height:(int *)a4 format:(unsigned int *)a5;
- (void)dealloc;
@end

@implementation VCPHumanPoseEspressoSession

- (VCPHumanPoseEspressoSession)initWithOptions:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)VCPHumanPoseEspressoSession;
  v5 = [(VCPHumanPoseEspressoSession *)&v27 init];
  v6 = v5;
  v7 = v5;
  if (v5)
  {
    *(void *)&v5->_width = 0x3000000030;
    v5->_revision = 1;
    v8 = [v4 objectForKeyedSubscript:@"revision"];

    if (v8)
    {
      v9 = [v4 objectForKeyedSubscript:@"revision"];
      v7->_revision = [v9 intValue];
    }
    v10 = [v4 objectForKeyedSubscript:@"config"];

    if (!v10)
    {
LABEL_11:
      v7->_uint64_t plan = 0;
      v7->_ctx = 0;
      v13 = [v4 objectForKeyedSubscript:@"loadModel"];
      v14 = v13;
      if (v13 && [v13 BOOLValue])
      {
        v15 = objc_msgSend(MEMORY[0x1E4F28B50], "vcp_mediaAnalysisBundle");
        v16 = [v15 resourceURL];

        v17 = [MEMORY[0x1E4F1CB10] URLWithString:@"cnn_human_pose_lite_v2.espresso.net" relativeToURL:v16];
        v7->_ctx = (void *)espresso_create_context();
        uint64_t plan = espresso_create_plan();
        v7->_uint64_t plan = (void *)plan;
        if (!plan
          || ([v17 path],
              id v19 = objc_claimAutoreleasedReturnValue(),
              [v19 UTF8String],
              int v20 = espresso_plan_add_network(),
              v19,
              v20)
          || ([@"res_256x160" UTF8String], espresso_network_select_configuration())
          || espresso_plan_build())
        {

          goto LABEL_24;
        }
        int v21 = espresso_network_bind_buffer();

        if (v21) {
          goto LABEL_24;
        }
      }
      int v22 = 17 * v7->_width * v7->_height;
      if (v22 < 0) {
        size_t v23 = -1;
      }
      else {
        size_t v23 = 2 * v22;
      }
      v24 = operator new[](v23, MEMORY[0x1E4FBA2D0]);
      *(void *)v7->_heatmapNms = v24;
      if (v24)
      {
        *(void *)&v7->_modelOutput16bit[4] = 0;
        *(_DWORD *)&v7->_loadModel = 0;
        v6 = v7;
LABEL_25:

        goto LABEL_26;
      }
LABEL_24:
      v6 = 0;
      goto LABEL_25;
    }
    v11 = [v4 objectForKeyedSubscript:@"config"];
    if ([v11 isEqualToString:@"res_256x160"])
    {
      uint64_t v12 = 0x2800000040;
    }
    else
    {
      if (![v11 isEqualToString:@"res_160x256"])
      {
LABEL_10:

        goto LABEL_11;
      }
      uint64_t v12 = 0x4000000028;
    }
    *(void *)&v7->_width = v12;
    goto LABEL_10;
  }
LABEL_26:
  v25 = v6;

  return v25;
}

- (void)dealloc
{
  uint64_t v3 = *(void *)self->_heatmapNms;
  if (v3) {
    MEMORY[0x1C186C790](v3, 0x1000C80BDFB0063);
  }
  uint64_t v4 = *(void *)&self->_modelOutput16bit[4];
  if (v4) {
    MEMORY[0x1C186C790](v4, 0x1000C80BDFB0063);
  }
  if (self->_plan) {
    espresso_plan_destroy();
  }
  if (self->_ctx) {
    espresso_context_destroy();
  }
  v5.receiver = self;
  v5.super_class = (Class)VCPHumanPoseEspressoSession;
  [(VCPHumanPoseEspressoSession *)&v5 dealloc];
}

- (id)keypointsToObservation:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v22 = v3;
  if ([v3 count] == 17)
  {
    int v21 = objc_alloc_init(VCPPersonObservation);
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v24 != v7) {
            objc_enumerationMutation(v5);
          }
          v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if ([v9 count] != 3)
          {

            v17 = 0;
            goto LABEL_16;
          }
          v10 = objc_alloc_init(VCPKeypoint);
          v11 = [v9 objectAtIndexedSubscript:0];
          [v11 floatValue];
          float v13 = v12;
          v14 = [v9 objectAtIndexedSubscript:1];
          [v14 floatValue];
          -[VCPKeypoint setLocation:](v10, "setLocation:", v13, v15);

          v16 = [v9 objectAtIndexedSubscript:2];
          [v16 floatValue];
          -[VCPKeypoint setConfidence:](v10, "setConfidence:");

          [v4 addObject:v10];
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    [(VCPPersonObservation *)v21 setKeypoints:v4];
    v17 = v21;
    [(VCPPersonObservation *)v21 setRevision:1];
LABEL_16:
    id v19 = v17;

    goto LABEL_17;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v18 = VCPLogInstance();
    int v21 = (VCPPersonObservation *)v18;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v18, OS_LOG_TYPE_ERROR, " keypointsToObservation - unexpected keypoints count", buf, 2u);
    }
    id v19 = 0;
LABEL_17:

    goto LABEL_19;
  }
  id v19 = 0;
LABEL_19:

  return v19;
}

- (int)keypointsFromTensor:(id *)a3 withOptions:(id)a4 results:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  var0 = (int *)a3->var0;
  if (!a3->var0)
  {
    int v28 = -18;
    goto LABEL_15;
  }
  unint64_t var4 = a3->var4;
  unint64_t var5 = a3->var5;
  unint64_t var6 = a3->var6;
  v14 = *(_WORD **)&self->_modelOutput16bit[4];
  int v15 = var4 * var5;
  if (!v14) {
    goto LABEL_5;
  }
  if (v15 != *(_DWORD *)&self->_loadModel)
  {
    MEMORY[0x1C186C790](*(void *)&self->_modelOutput16bit[4], 0x1000C80BDFB0063);
LABEL_5:
    uint64_t v16 = (var5 * var4 * var6);
    uint64_t v17 = v16 << 32;
    uint64_t v18 = 2 * (int)v16;
    if (v17 < 0) {
      size_t v19 = -1;
    }
    else {
      size_t v19 = v18;
    }
    v14 = operator new[](v19, MEMORY[0x1E4FBA2D0]);
    *(void *)&self->_modelOutput16bit[4] = v14;
    *(_DWORD *)&self->_loadModel = v15;
    if (!v14)
    {
      int v28 = -108;
      goto LABEL_15;
    }
  }
  uint64_t v20 = (v15 * var6);
  if ((int)v20 >= 1)
  {
    int v21 = v14;
    do
    {
      int v22 = *var0++;
      _S0 = v22;
      __asm { FCVT            H0, S0 }
      *v21++ = _S0;
      --v20;
    }
    while (v20);
  }
  int v28 = [(VCPHumanPoseEspressoSession *)self keypointsFromTensor:v14 width:(int)var4 height:(int)var5 channels:(int)var6 withOptions:v8 results:v9];
LABEL_15:

  return v28;
}

- (int)keypointsFromTensor:(VCPHumanPoseEspressoSession *)self width:(SEL)a2 height:channels:withOptions:results:
{
  id v8 = v7;
  uint64_t v9 = v5;
  unint64_t v10 = v4;
  unint64_t v11 = v3;
  float v12 = v2;
  uint64_t v198 = *MEMORY[0x1E4F143B8];
  id v157 = v6;
  id v158 = v8;
  int v13 = -18;
  if (v9 != 34) {
    goto LABEL_119;
  }
  if (!v12) {
    goto LABEL_119;
  }
  __src = v12;
  if (!v158) {
    goto LABEL_119;
  }
  v161 = [MEMORY[0x1E4F1CA48] array];
  v14 = self;
  int v15 = *(void **)self->_heatmapNms;
  unint64_t v16 = v10 * v11;
  if (v15)
  {
    if (v16 == self->_height * (uint64_t)self->_width)
    {
      size_t v17 = 34 * v16;
      v14 = self;
      goto LABEL_13;
    }
    MEMORY[0x1C186C790]();
    v14 = self;
  }
  size_t v17 = 34 * v16;
  if (((17 * v16) & 0x8000000000000000) != 0) {
    size_t v18 = -1;
  }
  else {
    size_t v18 = 34 * v16;
  }
  int v15 = operator new[](v18, MEMORY[0x1E4FBA2D0]);
  *(void *)v14->_heatmapNms = v15;
  if (!v15)
  {
    int v13 = -108;
    goto LABEL_118;
  }
  v14->_width = v11;
  v14->_height = v10;
LABEL_13:
  memcpy(v15, __src, v17);
  uint64_t v19 = 0;
  uint64_t v20 = *(void *)v14->_heatmapNms;
  uint64_t v21 = v20 - 6;
  LOWORD(v22) = COERCE_UNSIGNED_INT(-1.0);
  do
  {
    if (v10)
    {
      uint64_t v23 = 0;
      LODWORD(v24) = 0;
      uint64_t v25 = v20 + 2 * v16 * v19;
      int v26 = -3;
      do
      {
        if (v11)
        {
          uint64_t v27 = 0;
          uint64_t v24 = (int)v24;
          uint64_t v28 = v21;
          do
          {
            _H1 = *(short float *)(v25 + 2 * v24);
            __asm { FCVT            S2, H1 }
            if (_S2 >= 0.1)
            {
              int v34 = -3;
              unsigned int v35 = v26;
              do
              {
                uint64_t v36 = 0;
                unint64_t v37 = (v34 + v23);
                BOOL v39 = (v37 & 0x80000000) != 0 || v37 >= v10;
                while (v39
                     || v27 + v36 - 3 < 0
                     || (v27 + v36 - 3) >= v11
                     || *(short float *)(v28 + 2 * v11 * v35 + 2 * v36) <= _H1)
                {
                  if (++v36 == 7) {
                    goto LABEL_34;
                  }
                }
                _H1 = _H1 + *(short float *)&v22;
                *(short float *)(v25 + 2 * v24) = _H1;
LABEL_34:
                ++v34;
                ++v35;
              }
              while (v34 != 4);
            }
            else
            {
              *(short float *)(v25 + 2 * v24) = _H1 + *(short float *)&v22;
            }
            ++v27;
            ++v24;
            v28 += 2;
          }
          while (v27 != v11);
        }
        ++v23;
        ++v26;
      }
      while (v23 != v10);
    }
    ++v19;
    v21 += 2 * v16;
  }
  while (v19 != 17);
  v162 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", v22);
  for (uint64_t i = 0; i != 17; ++i)
  {
    if (!v10) {
      continue;
    }
    int v40 = 0;
    uint64_t v174 = *(void *)self->_heatmapNms + 2 * v16 * i;
    v163 = &__src[2 * v16 * (i + 17)];
    for (j = 0; j != (char *)v10; ++j)
    {
      if (!v11) {
        continue;
      }
      v41 = 0;
      uint64_t v42 = v40;
      do
      {
        _H0 = *(_WORD *)(v174 + 2 * v42);
        __asm { FCVT            S0, H0 }
        if (_S0 <= 0.1) {
          goto LABEL_65;
        }
        obj = v41;
        uint64_t v171 = v42;
        _H8 = *(_WORD *)&v163[2 * v42];
        long long v185 = 0u;
        long long v186 = 0u;
        long long v187 = 0u;
        long long v188 = 0u;
        id v46 = v162;
        uint64_t v47 = [v46 countByEnumeratingWithState:&v185 objects:v197 count:16];
        __asm { FCVT            S8, H8 }
        if (v47)
        {
          int v49 = 0;
          uint64_t v50 = *(void *)v186;
          LODWORD(v51) = -1;
          float v52 = 3.4028e38;
          do
          {
            uint64_t v53 = 0;
            int v54 = v49;
            v49 += v47;
            do
            {
              if (*(void *)v186 != v50) {
                objc_enumerationMutation(v46);
              }
              v55 = [*(id *)(*((void *)&v185 + 1) + 8 * v53) objectAtIndexedSubscript:0];
              [v55 floatValue];
              float v57 = v56;

              float v58 = vabds_f32(_S8, v57);
              if (v58 >= v52) {
                uint64_t v51 = v51;
              }
              else {
                uint64_t v51 = (v54 + v53);
              }
              if (v58 < v52) {
                float v52 = v58;
              }
              ++v53;
            }
            while (v47 != v53);
            uint64_t v47 = [v46 countByEnumeratingWithState:&v185 objects:v197 count:16];
          }
          while (v47);

          if ((v51 & 0x80000000) == 0 && v52 < 0.3)
          {
            v60 = [v161 objectAtIndexedSubscript:v51];
            v61 = [v46 objectAtIndexedSubscript:v51];
            v62 = [v61 objectAtIndexedSubscript:0];
            [v62 floatValue];
            float v64 = v63;

            v65 = [v46 objectAtIndexedSubscript:v51];
            v66 = [v65 objectAtIndexedSubscript:1];
            [v66 floatValue];
            float v68 = v67;

            *(float *)&double v69 = (float)(_S8 + (float)(v64 * v68)) / (float)(v68 + 1.0);
            v70 = [NSNumber numberWithFloat:v69];
            v196[0] = v70;
            *(float *)&double v71 = v68 + 1.0;
            v72 = [NSNumber numberWithFloat:v71];
            v196[1] = v72;
            v73 = [MEMORY[0x1E4F1C978] arrayWithObjects:v196 count:2];
            [v46 setObject:v73 atIndexedSubscript:v51];

            _H8 = *(_WORD *)(v174 + 2 * v171);
            v75 = [v60 objectAtIndexedSubscript:i];
            v76 = [v75 objectAtIndexedSubscript:2];
            [v76 floatValue];
            __asm { FCVT            S1, H8 }
            LODWORD(v73) = v78 < _S1;

            if (v73)
            {
              v79 = [NSNumber numberWithInt:obj];
              v195[0] = v79;
              v80 = [NSNumber numberWithInt:j];
              v195[1] = v80;
              _H0 = *(_WORD *)(v174 + 2 * v171);
              __asm { FCVT            S0, H0 }
              v83 = [NSNumber numberWithFloat:_D0];
              v195[2] = v83;
              v84 = [MEMORY[0x1E4F1C978] arrayWithObjects:v195 count:3];
              [v60 setObject:v84 atIndexedSubscript:i];
            }
            goto LABEL_64;
          }
        }
        else
        {
        }
        *(float *)&double v59 = _S8;
        v85 = [NSNumber numberWithFloat:v59];
        v194[0] = v85;
        v194[1] = &unk_1F15EAC08;
        v86 = [MEMORY[0x1E4F1C978] arrayWithObjects:v194 count:2];
        [v46 addObject:v86];

        v60 = [MEMORY[0x1E4F1CA48] array];
        int v87 = 17;
        do
        {
          [v60 addObject:&unk_1F15EDF08];
          --v87;
        }
        while (v87);
        v88 = [NSNumber numberWithInt:obj];
        v193[0] = v88;
        v89 = [NSNumber numberWithInt:j];
        v193[1] = v89;
        _H0 = *(_WORD *)(v174 + 2 * v171);
        __asm { FCVT            S0, H0 }
        v92 = [NSNumber numberWithFloat:_D0];
        v193[2] = v92;
        v93 = [MEMORY[0x1E4F1C978] arrayWithObjects:v193 count:3];
        [v60 setObject:v93 atIndexedSubscript:i];

        [v161 addObject:v60];
LABEL_64:

        unint64_t v16 = v10 * v11;
        v41 = obj;
        uint64_t v42 = v171;
LABEL_65:
        ++v41;
        ++v42;
      }
      while (v41 != (char *)v11);
      int v40 = v42;
    }
  }
  long long v183 = 0u;
  long long v184 = 0u;
  long long v181 = 0u;
  long long v182 = 0u;
  id obja = v161;
  uint64_t v94 = [obja countByEnumeratingWithState:&v181 objects:v192 count:16];
  if (v94)
  {
    uint64_t v175 = *(void *)v182;
    while (2)
    {
      uint64_t v172 = v94;
      for (uint64_t k = 0; k != v172; ++k)
      {
        if (*(void *)v182 != v175) {
          objc_enumerationMutation(obja);
        }
        v96 = *(void **)(*((void *)&v181 + 1) + 8 * k);
        if ([v96 count] != 17)
        {
LABEL_120:
          int v13 = -18;
          goto LABEL_121;
        }
        for (unint64_t m = 0; [v96 count] > m; ++m)
        {
          v98 = [v96 objectAtIndexedSubscript:m];
          v99 = [v98 objectAtIndexedSubscript:2];
          [v99 floatValue];
          BOOL v101 = v100 > 0.1;

          if (v101)
          {
            v102 = [v98 objectAtIndexedSubscript:0];
            int v103 = [v102 intValue];

            v104 = [v98 objectAtIndexedSubscript:1];
            int v105 = [v104 intValue];

            float v107 = 0.0;
            int v108 = -3;
            float v109 = 0.0;
            double v110 = 0.0;
            do
            {
              unint64_t v111 = (v108 + v105);
              unint64_t v112 = v111 * v11;
              *(float *)&double v106 = (float)(int)v111;
              BOOL v114 = (v111 & 0x80000000) != 0 || v111 >= v10;
              for (int n = -3; n != 4; ++n)
              {
                unint64_t v116 = (v103 + n);
                char v117 = (v116 & 0x80000000) != 0 || v114;
                if ((v117 & 1) == 0 && v116 < v11)
                {
                  _H2 = *(_WORD *)&__src[2 * v10 * v11 * m + 2 * v112 + 2 * v116];
                  __asm { FCVT            S2, H2 }
                  if (_S2 > 0.05)
                  {
                    float v107 = v107 + _S2;
                    *(float *)&double v110 = *(float *)&v110 + (float)(_S2 * (float)(int)v116);
                    float v109 = v109 + (float)(_S2 * *(float *)&v106);
                  }
                }
              }
              ++v108;
            }
            while (v108 != 4);
            if (v107 > 0.0)
            {
              *(float *)&double v110 = (float)(*(float *)&v110 / v107) + 0.5;
              v120 = objc_msgSend(NSNumber, "numberWithFloat:", v110, v106);
              v191[0] = v120;
              *(float *)&double v121 = (float)(v109 / v107) + 0.5;
              v122 = [NSNumber numberWithFloat:v121];
              v191[1] = v122;
              v123 = [v98 objectAtIndexedSubscript:2];
              v191[2] = v123;
              v124 = [MEMORY[0x1E4F1C978] arrayWithObjects:v191 count:3];
              [v96 setObject:v124 atIndexedSubscript:m];
            }
          }
        }
      }
      uint64_t v94 = [obja countByEnumeratingWithState:&v181 objects:v192 count:16];
      if (v94) {
        continue;
      }
      break;
    }
  }

  long long v179 = 0u;
  long long v180 = 0u;
  long long v177 = 0u;
  long long v178 = 0u;
  id v165 = obja;
  uint64_t v166 = [v165 countByEnumeratingWithState:&v177 objects:v190 count:16];
  if (v166)
  {
    uint64_t v168 = *(void *)v178;
    float v125 = (float)v11;
    float v126 = (float)v10;
    do
    {
      for (iuint64_t i = 0; ii != v166; ++ii)
      {
        if (*(void *)v178 != v168) {
          objc_enumerationMutation(v165);
        }
        unint64_t v127 = 0;
        v128 = *(void **)(*((void *)&v177 + 1) + 8 * ii);
        float v129 = 0.0;
        float v130 = 0.0;
        while ([v128 count] > v127)
        {
          v132 = [v128 objectAtIndexedSubscript:v127];
          BOOL v133 = [v132 count] == 3;

          if (!v133) {
            goto LABEL_120;
          }
          v134 = NSNumber;
          v176 = [v128 objectAtIndexedSubscript:v127];
          v135 = [v176 objectAtIndexedSubscript:0];
          [v135 floatValue];
          *(float *)&double v137 = v136 / v125;
          v138 = [v134 numberWithFloat:v137];
          v189[0] = v138;
          v139 = NSNumber;
          v140 = [v128 objectAtIndexedSubscript:v127];
          v141 = [v140 objectAtIndexedSubscript:1];
          [v141 floatValue];
          *(float *)&double v143 = 1.0 - (float)(v142 / v126);
          v144 = [v139 numberWithFloat:v143];
          v189[1] = v144;
          v145 = [v128 objectAtIndexedSubscript:v127];
          v146 = [v145 objectAtIndexedSubscript:2];
          v189[2] = v146;
          v147 = [MEMORY[0x1E4F1C978] arrayWithObjects:v189 count:3];
          [v128 setObject:v147 atIndexedSubscript:v127];

          v148 = [v128 objectAtIndexedSubscript:v127];
          v149 = [v148 objectAtIndexedSubscript:2];
          [v149 floatValue];
          LODWORD(v145) = v150 > 0.1;

          if (v145)
          {
            v151 = [v128 objectAtIndexedSubscript:v127];
            v152 = [v151 objectAtIndexedSubscript:2];
            [v152 floatValue];
            float v154 = v153;

            float v129 = v129 + v154;
            float v130 = v130 + 1.0;
          }
          ++v127;
        }
        if (v130 > 4.0)
        {
          *(float *)&double v131 = v129 / v130;
          if ((float)(v129 / v130) > 0.1)
          {
            v155 = -[VCPHumanPoseEspressoSession keypointsToObservation:](self, "keypointsToObservation:", v128, v131);
            [v158 addObject:v155];
          }
        }
      }
      int v13 = 0;
      uint64_t v166 = objc_msgSend(v165, "countByEnumeratingWithState:objects:count:", &v177, v190, 16, v131);
    }
    while (v166);
  }
  else
  {
    int v13 = 0;
  }
LABEL_121:

LABEL_118:
LABEL_119:

  return v13;
}

- (int)requiredInputFormat:(int *)a3 height:(int *)a4 format:(unsigned int *)a5
{
  int result = -50;
  if (a3 && a4)
  {
    if (a5)
    {
      int result = 0;
      *a3 = 256;
      *a4 = 160;
      *a5 = 1111970369;
    }
  }
  return result;
}

- (int)processFrame:(__CVBuffer *)a3 withOptions:(id)a4 results:(id)a5
{
  id v7 = a5;
  id v8 = v7;
  int v9 = -50;
  if (a3 && v7)
  {
    size_t Width = CVPixelBufferGetWidth(a3);
    size_t Height = CVPixelBufferGetHeight(a3);
    if (CVPixelBufferGetPixelFormatType(a3) == 1111970369 && Width == 256 && Height == 160)
    {
      [@"input" UTF8String];
      if (espresso_network_bind_direct_cvpixelbuffer() || espresso_plan_execute_sync()) {
        int v9 = -18;
      }
      else {
        int v9 = [(VCPHumanPoseEspressoSession *)self keypointsFromTensor:&self->_outputBlob withOptions:0 results:v8];
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        float v12 = VCPLogInstance();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v14 = 0;
          _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_ERROR, "incompatible input buffer size/format, check requiredInputFormat", v14, 2u);
        }
      }
      int v9 = -50;
    }
  }

  return v9;
}

@end