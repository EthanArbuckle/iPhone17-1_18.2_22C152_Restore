@interface _MLCCPUMHAttention
+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6;
+ (BOOL)setOptimizerDataForDevice:(id)a3 deviceOps:(id)a4 dataForWeights:(id)a5 dataForBias:(id)a6;
+ (id)layerWithDevice:(id)a3 descriptor:(id)a4 weights:(id)a5 bias:(id)a6 attnBias:(id)a7 inferenceOnly:(BOOL)a8;
- (_MLCCPUMHAttention)initWithDevice:(id)a3 descriptor:(id)a4 weights:(id)a5 bias:(id)a6 attnBias:(id)a7 inferenceOnly:(BOOL)a8;
@end

@implementation _MLCCPUMHAttention

- (_MLCCPUMHAttention)initWithDevice:(id)a3 descriptor:(id)a4 weights:(id)a5 bias:(id)a6 attnBias:(id)a7 inferenceOnly:(BOOL)a8
{
  BOOL v166 = a8;
  v192[3] = *MEMORY[0x1E4F143B8];
  id v175 = a3;
  id v12 = a4;
  id v13 = a5;
  id v182 = a6;
  id v181 = a7;
  v180 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  bzero(v186, 0x9B0uLL);
  id v179 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v186 length:2480];
  uint64_t v14 = [v179 bytes];
  unint64_t v15 = [v12 modelDimension];
  uint64_t v169 = [v12 keyDimension];
  uint64_t v167 = [v12 valueDimension];
  v176 = v12;
  unint64_t v16 = [v12 headCount];
  v17 = [NSNumber numberWithUnsignedInteger:v15];
  v192[0] = v17;
  unint64_t v171 = v15 / v16;
  v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  v192[1] = v18;
  unint64_t v172 = v16;
  v19 = [NSNumber numberWithUnsignedInteger:v16];
  v192[2] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v192 count:3];

  v21 = [v13 objectAtIndexedSubscript:0];
  v22 = [v21 descriptor];
  v23 = +[MLCTensor tensorWithShape:dataType:](MLCTensor, "tensorWithShape:dataType:", v20, [v22 dataType]);

  uint64_t v183 = v14;
  uint64_t v24 = v14 + 176;
  v25 = [v23 descriptor];
  v26 = [v25 shape];
  v173 = v23;
  v27 = [v23 descriptor];
  v28 = [v27 stride];
  v29 = [v13 objectAtIndexedSubscript:0];
  v30 = [v29 data];
  v184 = v13;
  v31 = [v13 objectAtIndexedSubscript:0];
  v32 = [v31 descriptor];
  LODWORD(v24) = CPU_BuildBNNSNDArrayDescriptorColMajor(v24, v26, v28, v30, [v32 dataType], 3);

  if (v24)
  {
    v33 = [NSNumber numberWithUnsignedInteger:v169];
    v191[0] = v33;
    v34 = [NSNumber numberWithUnsignedInteger:v171];
    v191[1] = v34;
    v35 = [NSNumber numberWithUnsignedInteger:v172];
    v191[2] = v35;
    v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v191 count:3];

    v37 = [v184 objectAtIndexedSubscript:1];
    v38 = [v37 descriptor];
    v39 = +[MLCTensor tensorWithShape:dataType:](MLCTensor, "tensorWithShape:dataType:", v36, [v38 dataType]);

    v40 = [v39 descriptor];
    v41 = [v40 shape];
    v170 = v39;
    v42 = [v39 descriptor];
    v43 = [v42 stride];
    v44 = [v184 objectAtIndexedSubscript:1];
    v45 = [v44 data];
    v46 = [v184 objectAtIndexedSubscript:1];
    v47 = [v46 descriptor];
    LODWORD(v37) = CPU_BuildBNNSNDArrayDescriptorColMajor(v183 + 704, v41, v43, v45, [v47 dataType], 3);

    if (!v37)
    {
      v118 = 0;
      v120 = self;
      v119 = v175;
      v73 = v176;
      v116 = v181;
      v121 = v182;
LABEL_36:

      v20 = v36;
      goto LABEL_37;
    }
    v48 = [NSNumber numberWithUnsignedInteger:v167];
    v190[0] = v48;
    v49 = [NSNumber numberWithUnsignedInteger:v171];
    v190[1] = v49;
    v50 = [NSNumber numberWithUnsignedInteger:v172];
    v190[2] = v50;
    uint64_t v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:v190 count:3];

    v52 = [v184 objectAtIndexedSubscript:2];
    v53 = [v52 descriptor];
    v168 = (void *)v51;
    v54 = +[MLCTensor tensorWithShape:dataType:](MLCTensor, "tensorWithShape:dataType:", v51, [v53 dataType]);

    v55 = [v54 descriptor];
    v56 = [v55 shape];
    v165 = v54;
    v57 = [v54 descriptor];
    v58 = [v57 stride];
    v59 = [v184 objectAtIndexedSubscript:2];
    v60 = [v59 data];
    v61 = [v184 objectAtIndexedSubscript:2];
    v62 = [v61 descriptor];
    LODWORD(v52) = CPU_BuildBNNSNDArrayDescriptorColMajor(v183 + 1232, v56, v58, v60, [v62 dataType], 3);

    if (!v52) {
      goto LABEL_13;
    }
    v162 = [v184 objectAtIndexedSubscript:3];
    v63 = [v162 descriptor];
    v64 = [v63 shape];
    v65 = [v184 objectAtIndexedSubscript:3];
    v66 = [v65 descriptor];
    v67 = [v66 stride];
    v68 = [v184 objectAtIndexedSubscript:3];
    v69 = [v68 data];
    v70 = [v184 objectAtIndexedSubscript:3];
    v71 = [v70 descriptor];
    BOOL v72 = CPU_BuildBNNSNDArrayDescriptorColMajor(v183 + 2120, v64, v67, v69, [v71 dataType], 2);

    if (!v72)
    {
LABEL_13:
      v118 = 0;
      v120 = self;
      v119 = v175;
      v73 = v176;
      goto LABEL_14;
    }
    v73 = v176;
    if ([v176 hasBiases])
    {
      v74 = [NSNumber numberWithUnsignedInteger:v171];
      v189[0] = v74;
      v75 = [NSNumber numberWithUnsignedInteger:v172];
      v189[1] = v75;
      uint64_t v76 = [MEMORY[0x1E4F1C978] arrayWithObjects:v189 count:2];

      v77 = [v182 objectAtIndexedSubscript:0];
      v78 = [v77 descriptor];
      v168 = (void *)v76;
      v79 = +[MLCTensor tensorWithShape:dataType:](MLCTensor, "tensorWithShape:dataType:", v76, [v78 dataType]);

      v80 = [v79 descriptor];
      v81 = [v80 shape];
      v163 = v79;
      v82 = [v79 descriptor];
      v83 = [v82 stride];
      v84 = [v182 objectAtIndexedSubscript:0];
      v85 = [v84 data];
      v86 = [v182 objectAtIndexedSubscript:0];
      v87 = [v86 descriptor];
      LODWORD(v77) = CPU_BuildBNNSNDArrayDescriptorColMajor(v183 + 352, v81, v83, v85, [v87 dataType], 2);

      if (v77)
      {
        v88 = [v163 descriptor];
        v89 = [v88 shape];
        v90 = [v163 descriptor];
        v91 = [v90 stride];
        v92 = [v182 objectAtIndexedSubscript:1];
        v93 = [v92 data];
        v94 = [v182 objectAtIndexedSubscript:1];
        v95 = [v94 descriptor];
        BOOL v96 = CPU_BuildBNNSNDArrayDescriptorColMajor(v183 + 880, v89, v91, v93, [v95 dataType], 2);

        if (v96)
        {
          v97 = [v163 descriptor];
          v98 = [v97 shape];
          v99 = [v163 descriptor];
          v100 = [v99 stride];
          v101 = [v182 objectAtIndexedSubscript:2];
          v102 = [v101 data];
          v103 = [v182 objectAtIndexedSubscript:2];
          v104 = [v103 descriptor];
          BOOL v105 = CPU_BuildBNNSNDArrayDescriptorColMajor(v183 + 1408, v98, v100, v102, [v104 dataType], 2);

          if (v105)
          {
            v161 = [v182 objectAtIndexedSubscript:3];
            v106 = [v161 descriptor];
            v107 = [v106 shape];
            v108 = [v182 objectAtIndexedSubscript:3];
            v109 = [v108 descriptor];
            v110 = [v109 stride];
            v111 = [v182 objectAtIndexedSubscript:3];
            v112 = [v111 data];
            v113 = [v182 objectAtIndexedSubscript:3];
            v114 = [v113 descriptor];
            BOOL v115 = CPU_BuildBNNSNDArrayDescriptorColMajor(v183 + 2296, v107, v110, v112, [v114 dataType], 1);

            if (!v115)
            {
              v118 = 0;
              v36 = v168;
              v120 = self;
              v119 = v175;
              v73 = v176;
              v116 = v181;
              v121 = v182;
              goto LABEL_35;
            }
            v73 = v176;
            v116 = v181;
            v117 = v168;
            goto LABEL_16;
          }
        }
        v157 = v163;
        v118 = 0;
      }
      else
      {
        v118 = 0;
        v157 = v163;
      }
      v120 = self;
      v119 = v175;
      v116 = v181;
      v121 = v182;
LABEL_33:
      v36 = v168;
LABEL_34:

      goto LABEL_35;
    }
    v117 = v168;
    v116 = v181;
LABEL_16:
    if (![v73 hasAttentionBiases])
    {
      v168 = v117;
      goto LABEL_21;
    }
    v122 = [NSNumber numberWithUnsignedInteger:v171];
    v188[0] = v122;
    v123 = [NSNumber numberWithUnsignedInteger:v172];
    v188[1] = v123;
    uint64_t v124 = [MEMORY[0x1E4F1C978] arrayWithObjects:v188 count:2];

    v125 = [v116 objectAtIndexedSubscript:0];
    v126 = [v125 descriptor];
    v168 = (void *)v124;
    v127 = +[MLCTensor tensorWithShape:dataType:](MLCTensor, "tensorWithShape:dataType:", v124, [v126 dataType]);

    v128 = [v127 descriptor];
    v129 = [v128 shape];
    v164 = v127;
    v130 = [v127 descriptor];
    v131 = [v130 stride];
    v132 = [v116 objectAtIndexedSubscript:0];
    v133 = [v132 data];
    v134 = [v116 objectAtIndexedSubscript:0];
    v135 = [v134 descriptor];
    LODWORD(v126) = CPU_BuildBNNSNDArrayDescriptorColMajor(v183 + 1592, v129, v131, v133, [v135 dataType], 2);

    if (!v126)
    {
      v118 = 0;
      v157 = v164;
      v36 = v168;
      v120 = self;
      v119 = v175;
      v116 = v181;
      v121 = v182;
      goto LABEL_34;
    }
    v177 = [v164 descriptor];
    v136 = [v177 shape];
    v137 = [v164 descriptor];
    v138 = [v137 stride];
    v139 = [v181 objectAtIndexedSubscript:1];
    v140 = [v139 data];
    v141 = [v181 objectAtIndexedSubscript:1];
    v142 = [v141 descriptor];
    BOOL v143 = CPU_BuildBNNSNDArrayDescriptorColMajor(v183 + 1768, v136, v138, v140, [v142 dataType], 2);

    if (v143)
    {
      v116 = v181;
LABEL_21:
      *(unsigned char *)(v183 + 1584) = [v73 addsZeroAttention];
      [v73 dropout];
      *(_DWORD *)(v183 + 2472) = v144;
      v145 = (void *)MEMORY[0x1E4F1CBF0];
      uint64_t v146 = [MEMORY[0x1E4F1CBF0] mutableCopy];
      v178 = (void *)[v145 mutableCopy];
      v147 = (void *)[v145 mutableCopy];
      v148 = (void *)[v145 mutableCopy];
      v149 = (void *)[v145 mutableCopy];
      if (!v166)
      {
        v150 = v147;
        v151 = (void *)v146;
        uint64_t v152 = 0;
        v187[0] = v183;
        v187[1] = v183 + 528;
        v187[2] = v183 + 1056;
        v187[3] = v183 + 1944;
        do
        {
          v153 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v187[v152] length:528];
          [v151 addObject:v153];

          ++v152;
        }
        while (v152 != 4);
        v154 = [v151 objectAtIndexedSubscript:3];
        [v178 addObject:v154];

        [v151 removeLastObject];
        uint64_t v146 = (uint64_t)v151;
        if ([v73 hasAttentionBiases])
        {
          v155 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v183 + 1592 length:176];
          [v149 addObject:v155];

          uint64_t v146 = (uint64_t)v151;
          v156 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v183 + 1768 length:176];
          [v149 addObject:v156];
        }
        v147 = v150;
      }
      v157 = (void *)v146;
      v158 = +[MLCMHACPUDeviceOps deviceOpsWithType:44 params:v179 inDeltaData:v146 outDeltaData:v178 weightsDeltaData:0 biasDeltaData:0 weightsMomentumData:0 biasMomentumData:0];
      v119 = v175;
      if (v158)
      {
        [v180 addObject:v158];
        objc_msgSend(v158, "setHasBias:", objc_msgSend(v73, "hasBiases"));
        objc_msgSend(v158, "setHasAttnBias:", objc_msgSend(v73, "hasAttentionBiases"));
        objc_msgSend(v158, "setHasKeyMask:", objc_msgSend(v73, "hasKeyPaddingMask"));
        objc_msgSend(v158, "setHasAttnMask:", objc_msgSend(v73, "hasAttentionMask"));
        [v158 setInferenceOnly:v166];
        [v158 setAttnBiasDeltaData:v149];
        [v158 setWeightsDeltaDataBytesArray:v147];
        [v158 setBiasDeltaDataBytesArray:v148];
      }
      v159 = (void *)[v180 copy];
      v185.receiver = self;
      v185.super_class = (Class)_MLCCPUMHAttention;
      v120 = [(_MLCCPULayer *)&v185 initWithDevice:v175 deviceOps:v159];

      v118 = v120;
      v121 = v182;
      goto LABEL_33;
    }
    v118 = 0;
    v120 = self;
    v119 = v175;
LABEL_14:
    v116 = v181;
    v121 = v182;
    v36 = v168;
LABEL_35:

    goto LABEL_36;
  }
  v118 = 0;
  v120 = self;
  v119 = v175;
  v73 = v176;
  v116 = v181;
  v121 = v182;
LABEL_37:

  return v118;
}

+ (id)layerWithDevice:(id)a3 descriptor:(id)a4 weights:(id)a5 bias:(id)a6 attnBias:(id)a7 inferenceOnly:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  v19 = (void *)[objc_alloc((Class)a1) initWithDevice:v18 descriptor:v17 weights:v16 bias:v15 attnBias:v14 inferenceOnly:v8];

  return v19;
}

+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6
{
  id v8 = a5;
  id v205 = a6;
  v206 = [a4 objectAtIndexedSubscript:0];
  id v199 = [v206 params];
  uint64_t v9 = [v199 bytes];
  v200 = [v8 objectAtIndexedSubscript:0];
  v10 = [v200 descriptor];
  v11 = [v10 shape];
  id v12 = [v8 objectAtIndexedSubscript:0];
  id v13 = [v12 descriptor];
  id v14 = [v13 stride];
  v207 = v8;
  id v15 = [v8 objectAtIndexedSubscript:0];
  id v16 = [v15 descriptor];
  int v17 = [v16 dataType];
  id v18 = [NSNumber numberWithUnsignedInteger:0];
  v198 = (long long *)v9;
  BOOL v19 = CPU_BuildBNNSNDArrayDescriptorRowMajor(v9, v11, v14, 0, v17, 2, v18);

  if (!v19) {
    goto LABEL_14;
  }
  v201 = [v207 objectAtIndexedSubscript:1];
  v20 = [v201 descriptor];
  v21 = [v20 shape];
  v22 = [v207 objectAtIndexedSubscript:1];
  v23 = [v22 descriptor];
  uint64_t v24 = [v23 stride];
  v25 = [v207 objectAtIndexedSubscript:1];
  v26 = [v25 descriptor];
  int v27 = [v26 dataType];
  v28 = [NSNumber numberWithUnsignedInteger:0];
  BOOL v29 = CPU_BuildBNNSNDArrayDescriptorRowMajor((uint64_t)(v198 + 33), v21, v24, 0, v27, 2, v28);

  if (!v29) {
    goto LABEL_14;
  }
  v202 = [v207 objectAtIndexedSubscript:2];
  v30 = [v202 descriptor];
  v31 = [v30 shape];
  v32 = [v207 objectAtIndexedSubscript:2];
  v33 = [v32 descriptor];
  v34 = [v33 stride];
  v35 = [v207 objectAtIndexedSubscript:2];
  v36 = [v35 descriptor];
  int v37 = [v36 dataType];
  v38 = [NSNumber numberWithUnsignedInteger:0];
  BOOL v39 = CPU_BuildBNNSNDArrayDescriptorRowMajor((uint64_t)(v198 + 66), v31, v34, 0, v37, 2, v38);

  if (!v39)
  {
LABEL_14:
    BOOL v151 = 0;
    v90 = v207;
    v40 = v205;
    goto LABEL_15;
  }
  v40 = v205;
  v41 = [v205 descriptor];
  v42 = [v41 shape];
  v43 = [v205 descriptor];
  v44 = [v43 stride];
  v45 = [v205 descriptor];
  int v46 = [v45 dataType];
  v47 = [NSNumber numberWithUnsignedInteger:0];
  BOOL v48 = CPU_BuildBNNSNDArrayDescriptorRowMajor((uint64_t)v198 + 1944, v42, v44, 0, v46, 2, v47);

  if (!v48)
  {
    BOOL v151 = 0;
    v90 = v207;
    goto LABEL_15;
  }
  v49 = v198;
  memset(v219, 0, 32);
  LODWORD(v219[0]) = 1;
  uint64_t v50 = MEMORY[0x1E01B0D20](v198, v219);
  uint64_t v51 = v206;
  if (v50)
  {
    v194 = [v207 objectAtIndexedSubscript:0];
    v191 = [v194 descriptor];
    v52 = [v191 stride];
    v53 = [v52 objectAtIndexedSubscript:0];
    unint64_t v54 = [v53 unsignedIntegerValue];
    v55 = [v207 objectAtIndexedSubscript:0];
    [v55 descriptor];
    v56 = uint64_t v197 = v50;
    v57 = [v56 stride];
    v58 = [v207 objectAtIndexedSubscript:0];
    v59 = [v58 descriptor];
    v60 = objc_msgSend(v57, "objectAtIndexedSubscript:", objc_msgSend(v59, "dimensionCount") - 1);
    objc_msgSend(v206, "setSourceStride:", v54 / objc_msgSend(v60, "unsignedIntegerValue"));

    v195 = [v207 objectAtIndexedSubscript:1];
    v192 = [v195 descriptor];
    v61 = [v192 stride];
    v62 = [v61 objectAtIndexedSubscript:0];
    unint64_t v63 = [v62 unsignedIntegerValue];
    v64 = [v207 objectAtIndexedSubscript:1];
    v65 = [v64 descriptor];
    v66 = [v65 stride];
    v67 = [v207 objectAtIndexedSubscript:1];
    v68 = [v67 descriptor];
    v69 = objc_msgSend(v66, "objectAtIndexedSubscript:", objc_msgSend(v68, "dimensionCount") - 1);
    objc_msgSend(v206, "setSourceStrideSecondary:", v63 / objc_msgSend(v69, "unsignedIntegerValue"));

    v196 = [v207 objectAtIndexedSubscript:2];
    v193 = [v196 descriptor];
    v70 = [v193 stride];
    v71 = [v70 objectAtIndexedSubscript:0];
    unint64_t v72 = [v71 unsignedIntegerValue];
    v73 = [v207 objectAtIndexedSubscript:2];
    v74 = [v73 descriptor];
    v75 = [v74 stride];
    uint64_t v76 = [v207 objectAtIndexedSubscript:2];
    v77 = [v76 descriptor];
    v78 = objc_msgSend(v75, "objectAtIndexedSubscript:", objc_msgSend(v77, "dimensionCount") - 1);
    objc_msgSend(v206, "setSourceStrideTertiary:", v72 / objc_msgSend(v78, "unsignedIntegerValue"));

    v40 = v205;
    v79 = [v205 descriptor];
    v80 = [v79 stride];
    v81 = [v80 objectAtIndexedSubscript:0];
    unint64_t v82 = [v81 unsignedIntegerValue];
    v83 = [v205 descriptor];
    v84 = [v83 stride];
    v85 = [v205 descriptor];
    v86 = objc_msgSend(v84, "objectAtIndexedSubscript:", objc_msgSend(v85, "dimensionCount") - 1);
    objc_msgSend(v206, "setResultStride:", v82 / objc_msgSend(v86, "unsignedIntegerValue"));

    uint64_t v51 = v206;
    uint64_t v50 = v197;

    v49 = v198;
  }
  unint64_t v87 = 0x1E4F28000;
  objc_opt_class();
  v88 = objc_opt_new();
  [v51 setLayer:v88];

  v89 = [v51 layer];
  [v89 setFilter:v50];

  v90 = v207;
  if (([v51 inferenceOnly] & 1) == 0)
  {
    v91 = [v51 inDeltaData];
    id v92 = [v91 objectAtIndexedSubscript:0];
    uint64_t v93 = [v92 bytes];

    long long v94 = *v49;
    long long v95 = v49[2];
    *(_OWORD *)(v93 + 16) = v49[1];
    *(_OWORD *)(v93 + 32) = v95;
    *(_OWORD *)uint64_t v93 = v94;
    long long v96 = v49[3];
    long long v97 = v49[4];
    long long v98 = v49[6];
    *(_OWORD *)(v93 + 80) = v49[5];
    *(_OWORD *)(v93 + 96) = v98;
    *(_OWORD *)(v93 + 48) = v96;
    *(_OWORD *)(v93 + 64) = v97;
    long long v99 = v49[7];
    long long v100 = v49[8];
    long long v101 = v49[10];
    *(_OWORD *)(v93 + 144) = v49[9];
    *(_OWORD *)(v93 + 160) = v101;
    *(_OWORD *)(v93 + 112) = v99;
    *(_OWORD *)(v93 + 128) = v100;
    *(void *)(v93 + 88) = [v51 sourceStride];
    v102 = [v51 inDeltaData];
    id v103 = [v102 objectAtIndexedSubscript:1];
    uint64_t v104 = [v103 bytes];

    long long v105 = v198[33];
    long long v106 = v198[35];
    *(_OWORD *)(v104 + 16) = v198[34];
    *(_OWORD *)(v104 + 32) = v106;
    *(_OWORD *)uint64_t v104 = v105;
    long long v107 = v198[36];
    long long v108 = v198[37];
    long long v109 = v198[39];
    *(_OWORD *)(v104 + 80) = v198[38];
    *(_OWORD *)(v104 + 96) = v109;
    *(_OWORD *)(v104 + 48) = v107;
    *(_OWORD *)(v104 + 64) = v108;
    long long v110 = v198[40];
    long long v111 = v198[41];
    long long v112 = v198[43];
    *(_OWORD *)(v104 + 144) = v198[42];
    *(_OWORD *)(v104 + 160) = v112;
    *(_OWORD *)(v104 + 112) = v110;
    *(_OWORD *)(v104 + 128) = v111;
    *(void *)(v104 + 88) = [v51 sourceStrideSecondary];
    v113 = [v51 inDeltaData];
    id v114 = [v113 objectAtIndexedSubscript:2];
    uint64_t v115 = [v114 bytes];

    long long v116 = v198[66];
    long long v117 = v198[68];
    *(_OWORD *)(v115 + 16) = v198[67];
    *(_OWORD *)(v115 + 32) = v117;
    *(_OWORD *)uint64_t v115 = v116;
    long long v118 = v198[69];
    long long v119 = v198[70];
    long long v120 = v198[72];
    *(_OWORD *)(v115 + 80) = v198[71];
    *(_OWORD *)(v115 + 96) = v120;
    *(_OWORD *)(v115 + 48) = v118;
    *(_OWORD *)(v115 + 64) = v119;
    long long v121 = v198[73];
    long long v122 = v198[74];
    long long v123 = v198[76];
    *(_OWORD *)(v115 + 144) = v198[75];
    *(_OWORD *)(v115 + 160) = v123;
    *(_OWORD *)(v115 + 112) = v121;
    *(_OWORD *)(v115 + 128) = v122;
    *(void *)(v115 + 88) = [v51 sourceStrideTertiary];
    uint64_t v124 = [v51 outDeltaData];
    id v125 = [v124 objectAtIndexedSubscript:0];
    uint64_t v126 = [v125 bytes];

    long long v127 = *(long long *)((char *)v198 + 1944);
    long long v128 = *(long long *)((char *)v198 + 1976);
    *(_OWORD *)(v126 + 16) = *(long long *)((char *)v198 + 1960);
    *(_OWORD *)(v126 + 32) = v128;
    *(_OWORD *)uint64_t v126 = v127;
    long long v129 = *(long long *)((char *)v198 + 1992);
    long long v130 = *(long long *)((char *)v198 + 2008);
    long long v131 = *(long long *)((char *)v198 + 2040);
    *(_OWORD *)(v126 + 80) = *(long long *)((char *)v198 + 2024);
    *(_OWORD *)(v126 + 96) = v131;
    *(_OWORD *)(v126 + 48) = v129;
    *(_OWORD *)(v126 + 64) = v130;
    long long v132 = *(long long *)((char *)v198 + 2056);
    long long v133 = *(long long *)((char *)v198 + 2072);
    long long v134 = *(long long *)((char *)v198 + 2104);
    *(_OWORD *)(v126 + 144) = *(long long *)((char *)v198 + 2088);
    *(_OWORD *)(v126 + 160) = v134;
    *(_OWORD *)(v126 + 112) = v132;
    *(_OWORD *)(v126 + 128) = v133;
    *(void *)(v126 + 88) = [v51 resultStride];
  }
  if ([v51 hasKeyMask])
  {
    long long v217 = 0u;
    long long v218 = 0u;
    long long v215 = 0u;
    long long v216 = 0u;
    long long v213 = 0u;
    long long v214 = 0u;
    long long v211 = 0u;
    long long v212 = 0u;
    long long v209 = 0u;
    long long v210 = 0u;
    long long v208 = 0u;
    id v135 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v208 length:176];
    uint64_t v136 = [v135 bytes];
    v137 = [v207 objectAtIndexedSubscript:3];
    v138 = [v137 descriptor];
    v139 = [v138 shape];
    v140 = [v207 objectAtIndexedSubscript:3];
    v141 = [v140 descriptor];
    v142 = [v141 stride];
    LODWORD(v136) = CPU_BuildBNNSNDArrayDescriptorRowMajor(v136, v139, v142, 0, 4, 1, &unk_1F3876738);

    if (v136)
    {
      BOOL v143 = [v207 objectAtIndexedSubscript:3];
      int v144 = [v143 descriptor];
      uint64_t v145 = [v144 dimensionCount];

      uint64_t v146 = [v207 objectAtIndexedSubscript:3];
      v147 = [v146 descriptor];
      v148 = [v147 shape];
      v149 = [v148 objectAtIndexedSubscript:v145 - 1];
      objc_msgSend(v206, "setKeyMaskStride:", objc_msgSend(v149, "unsignedIntegerValue"));

      uint64_t v51 = v206;
      [v206 setKeyMask:v135];

      v90 = v207;
      unint64_t v87 = 0x1E4F28000uLL;
      goto LABEL_12;
    }

    BOOL v151 = 0;
    v90 = v207;
LABEL_15:
    uint64_t v51 = v206;
LABEL_16:
    uint64_t v152 = v199;
    goto LABEL_17;
  }
LABEL_12:
  if ([v51 hasKeyMask])
  {
    uint64_t v150 = 4;
  }
  else if ([v51 hasAttnMask])
  {
    uint64_t v150 = 3;
  }
  else
  {
    uint64_t v150 = 4;
  }
  if (![v51 hasAttnMask])
  {
    BOOL v151 = 1;
    goto LABEL_16;
  }
  long long v217 = 0u;
  long long v218 = 0u;
  long long v215 = 0u;
  long long v216 = 0u;
  long long v213 = 0u;
  long long v214 = 0u;
  long long v211 = 0u;
  long long v212 = 0u;
  long long v209 = 0u;
  long long v210 = 0u;
  long long v208 = 0u;
  v154 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v208 length:176];
  v155 = [v90 objectAtIndexedSubscript:v150];
  v156 = [v155 descriptor];
  v157 = [v156 shape];
  v158 = [v157 objectAtIndexedSubscript:0];
  uint64_t v159 = [v158 unsignedIntegerValue];

  v160 = [v90 objectAtIndexedSubscript:v150];
  v161 = [v160 descriptor];
  v162 = [v161 shape];
  v163 = (void *)[v162 mutableCopy];

  if (v159 == 1)
  {
    uint64_t v164 = 2;
  }
  else
  {
    v165 = [v90 objectAtIndexedSubscript:v150];
    BOOL v166 = [v165 descriptor];
    [v166 shape];
    v203 = v154;
    v168 = uint64_t v167 = v163;
    uint64_t v169 = [v168 objectAtIndexedSubscript:0];
    unint64_t v170 = [v169 unsignedIntegerValue];

    unint64_t v171 = [v90 objectAtIndexedSubscript:0];
    unint64_t v172 = [v171 descriptor];
    v173 = [v172 shape];
    v174 = [v173 objectAtIndexedSubscript:0];
    unint64_t v175 = v87;
    unint64_t v176 = [v174 unsignedIntegerValue];

    v163 = v167;
    v154 = v203;

    [v163 removeObjectAtIndex:0];
    v177 = [*(id *)(v175 + 3792) numberWithUnsignedInteger:v170 / v176];
    [v163 insertObject:v177 atIndex:0];

    v178 = [*(id *)(v175 + 3792) numberWithUnsignedInteger:v176];
    [v163 insertObject:v178 atIndex:0];

    uint64_t v164 = 4;
  }
  uint64_t v204 = v164;
  id v179 = [v90 objectAtIndexedSubscript:v150];
  v180 = [v179 descriptor];
  id v181 = +[MLCTensor tensorWithShape:dataType:](MLCTensor, "tensorWithShape:dataType:", v163, [v180 dataType]);

  id v182 = v154;
  uint64_t v183 = [v182 bytes];
  v184 = [v181 descriptor];
  objc_super v185 = [v184 shape];
  v186 = [v181 descriptor];
  [v186 stride];
  v188 = v187 = v163;
  v189 = [v90 objectAtIndexedSubscript:v150];
  v190 = [v189 descriptor];
  LODWORD(v183) = CPU_BuildBNNSNDArrayDescriptorRowMajor(v183, v185, v188, 0, [v190 dataType], v204, 0);

  v90 = v207;
  v40 = v205;
  uint64_t v51 = v206;
  uint64_t v152 = v199;
  if (v183)
  {
    [v206 setAttnMask:v182];

    BOOL v151 = 1;
  }
  else
  {

    BOOL v151 = 0;
  }
LABEL_17:

  return v151;
}

+ (BOOL)setOptimizerDataForDevice:(id)a3 deviceOps:(id)a4 dataForWeights:(id)a5 dataForBias:(id)a6
{
  v75[4] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a6;
  v10 = [a4 objectAtIndexedSubscript:0];
  if (([v10 inferenceOnly] & 1) == 0)
  {
    v71 = v9;
    id v66 = [v10 params];
    uint64_t v11 = [v66 bytes];
    id v12 = (void *)MEMORY[0x1E4F1CBF0];
    v68 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    v67 = (void *)[v12 mutableCopy];
    v75[0] = v11 + 176;
    v75[1] = v11 + 704;
    uint64_t v65 = v11;
    v75[2] = v11 + 1232;
    v75[3] = v11 + 2120;
    unint64_t v72 = v10;
    v73 = v8;
    if ([v8 count])
    {
      unint64_t v13 = 0;
      do
      {
        v69 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
        id v14 = [v8 objectAtIndexedSubscript:v13];
        id v15 = [v14 optimizerData];
        uint64_t v16 = [v15 count];

        if (v16)
        {
          unint64_t v17 = 0;
          do
          {
            id v18 = (void *)MEMORY[0x1E4F1C9B8];
            BOOL v19 = [v8 objectAtIndexedSubscript:v13];
            v20 = [v19 optimizerData];
            v21 = [v20 objectAtIndexedSubscript:v17];
            uint64_t v22 = [v21 bytes];
            v23 = [v73 objectAtIndexedSubscript:v13];
            uint64_t v24 = [v23 optimizerData];
            v25 = [v24 objectAtIndexedSubscript:v17];
            v26 = objc_msgSend(v18, "dataWithBytesNoCopy:length:freeWhenDone:", v22, objc_msgSend(v25, "length"), 0);

            v10 = v72;
            int v27 = [v72 weightsMomentumDataBytesArray];
            v28 = [v27 objectAtIndexedSubscript:v13];
            [v28 addObject:v26];

            BOOL v29 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v75[v13] length:176];
            v30 = [v73 objectAtIndexedSubscript:v13];
            v31 = [v30 optimizerData];
            v32 = [v31 objectAtIndexedSubscript:v17];
            uint64_t v33 = [v32 bytes];
            id v34 = v29;
            *(void *)([v34 bytes] + 136) = v33;

            id v8 = v73;
            [v69 addObject:v34];

            ++v17;
            v35 = [v73 objectAtIndexedSubscript:v13];
            v36 = [v35 optimizerData];
            unint64_t v37 = [v36 count];
          }
          while (v17 < v37);
        }
        [v68 addObject:v69];

        ++v13;
      }
      while (v13 < [v8 count]);
    }
    id v9 = v71;
    if (v71)
    {
      v74[0] = v65 + 352;
      v74[1] = v65 + 880;
      v74[2] = v65 + 1408;
      v74[3] = v65 + 2296;
      v74[4] = v65 + 1592;
      v74[5] = v65 + 1768;
      if ([v71 count])
      {
        unint64_t v38 = 0;
        do
        {
          BOOL v39 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
          v40 = [v9 objectAtIndexedSubscript:v38];
          v41 = [v40 optimizerData];
          uint64_t v42 = [v41 count];

          if (v42)
          {
            unint64_t v43 = 0;
            v70 = v39;
            do
            {
              v44 = (void *)MEMORY[0x1E4F1C9B8];
              v45 = [v9 objectAtIndexedSubscript:v38];
              int v46 = [v45 optimizerData];
              v47 = [v46 objectAtIndexedSubscript:v43];
              uint64_t v48 = [v47 bytes];
              v49 = [v9 objectAtIndexedSubscript:v38];
              uint64_t v50 = [v49 optimizerData];
              uint64_t v51 = [v50 objectAtIndexedSubscript:v43];
              v52 = objc_msgSend(v44, "dataWithBytesNoCopy:length:freeWhenDone:", v48, objc_msgSend(v51, "length"), 0);

              v10 = v72;
              v53 = [v72 biasMomentumDataBytesArray];
              unint64_t v54 = [v53 objectAtIndexedSubscript:v38];
              [v54 addObject:v52];

              v55 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v74[v38] length:176];
              v56 = [v71 objectAtIndexedSubscript:v38];
              v57 = [v56 optimizerData];
              v58 = [v57 objectAtIndexedSubscript:v43];
              uint64_t v59 = [v58 bytes];
              id v60 = v55;
              *(void *)([v60 bytes] + 136) = v59;

              id v9 = v71;
              BOOL v39 = v70;

              [v70 addObject:v60];
              ++v43;
              v61 = [v71 objectAtIndexedSubscript:v38];
              v62 = [v61 optimizerData];
              unint64_t v63 = [v62 count];
            }
            while (v43 < v63);
          }
          [v67 addObject:v39];

          ++v38;
        }
        while (v38 < [v9 count]);
      }
      id v8 = v73;
    }
    [v10 setWeightsMomentumDeltaDataArray:v68];
    [v10 setBiasMomentumDeltaDataArray:v67];
  }
  return 1;
}

@end