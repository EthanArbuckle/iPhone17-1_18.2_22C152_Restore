@interface _MLCCPUArithmetic
+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6;
+ (id)layerWithDevice:(id)a3 operation:(int)a4;
+ (int)arithmeticOperatorTypeFor:(int)a3;
+ (unsigned)bnnsArithmeticFunctionFor:(int)a3;
- (_MLCCPUArithmetic)initWithDevice:(id)a3 operation:(int)a4;
@end

@implementation _MLCCPUArithmetic

+ (int)arithmeticOperatorTypeFor:(int)a3
{
  if (a3 <= 0x1D && ((1 << a3) & 0x3C20000F) != 0) {
    return 2;
  }
  else {
    return 1;
  }
}

+ (unsigned)bnnsArithmeticFunctionFor:(int)a3
{
  if (a3 < 0x1E) {
    return dword_1DD1F0E50[a3];
  }
  v6 = +[MLCLog framework];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    +[_MLCCPUArithmetic bnnsArithmeticFunctionFor:v6];
  }

  return 0;
}

- (_MLCCPUArithmetic)initWithDevice:(id)a3 operation:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  memset(v22, 0, sizeof(v22));
  id v8 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v22 length:64];
  v9 = (_DWORD *)[v8 bytes];
  _DWORD *v9 = [(id)objc_opt_class() bnnsArithmeticFunctionFor:v4];
  memset(v29, 0, sizeof(v29));
  memset(v28, 0, sizeof(v28));
  memset(v27, 0, sizeof(v27));
  v10 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v28 length:176];
  v11 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v27 length:176];
  if ([(id)objc_opt_class() arithmeticOperatorTypeFor:v4] == 2)
  {
    v12 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v29 length:176];
    v26[0] = v10;
    v26[1] = v12;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
    v25 = v11;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
    v15 = +[MLCCPUDeviceOps deviceOpsWithType:1 params:v8 inDeltaData:v13 outDeltaData:v14 weightsDeltaData:0 biasDeltaData:0 weightsMomentumData:0 biasMomentumData:0];

    [v15 setBinaryOperation:1];
    if (!v15) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v24 = v10;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  v23 = v11;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
  v15 = +[MLCCPUDeviceOps deviceOpsWithType:1 params:v8 inDeltaData:v16 outDeltaData:v17 weightsDeltaData:0 biasDeltaData:0 weightsMomentumData:0 biasMomentumData:0];

  [v15 setBinaryOperation:0];
  if (v15) {
LABEL_5:
  }
    [v7 addObject:v15];
LABEL_6:
  v18 = (void *)[v7 copy];
  v21.receiver = self;
  v21.super_class = (Class)_MLCCPUArithmetic;
  v19 = [(_MLCCPULayer *)&v21 initWithDevice:v6 deviceOps:v18];

  return v19;
}

+ (id)layerWithDevice:(id)a3 operation:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithDevice:v6 operation:v4];

  return v7;
}

+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6
{
  v169 = a2;
  id v8 = a5;
  id v9 = a6;
  v10 = [a4 objectAtIndexedSubscript:0];
  id v11 = [v10 params];
  uint64_t v12 = [v11 bytes];

  bzero(v181, 0x228uLL);
  id v13 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v181 length:552];
  *(void *)(v12 + 8) = [v13 bytes];
  v171 = v13;
  [v10 setArithmeticParamsData:v13];
  v14 = (void *)MEMORY[0x1E4F1CBF0];
  v15 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  v174 = (void *)[v14 mutableCopy];
  v172 = v10;
  v173 = v9;
  uint64_t v170 = v12;
  if ([v10 binaryOperation])
  {
    if (*(_DWORD *)v12 <= 1u)
    {
      v16 = [v8 objectAtIndexedSubscript:0];
      int v17 = [v9 doesShapeMatchWithTensor:v16];

      if (v17) {
        [v10 setUseSourceGradientDeviceMemoryForResultGradientTensor:1];
      }
      if (!*(_DWORD *)v12)
      {
        v18 = [v8 objectAtIndexedSubscript:1];
        int v19 = [v9 doesShapeMatchWithTensor:v18];

        if (v19) {
          [v10 setUseSourceGradientDeviceMemoryForSecondaryResultGradientTensor:1];
        }
      }
    }
    v175 = v15;
    v20 = *(_DWORD **)(v12 + 8);
    objc_super v21 = [v8 objectAtIndexedSubscript:0];
    v22 = [v21 descriptor];
    v23 = [v22 shape];
    uint64_t v177 = [v23 count];

    v24 = [v8 objectAtIndexedSubscript:1];
    v25 = [v24 descriptor];
    v26 = [v25 shape];
    unint64_t v27 = [v26 count];
    v28 = [v8 objectAtIndexedSubscript:0];
    v29 = [v28 descriptor];
    uint64_t v30 = [v29 shape];
    unint64_t v31 = [v30 count];

    v32 = [v8 objectAtIndexedSubscript:1];
    v33 = [v32 descriptor];
    v34 = [v33 shape];
    unint64_t v35 = [v34 count];
    if (v27 <= v31)
    {
      v62 = [v8 objectAtIndexedSubscript:0];
      v63 = [v62 descriptor];
      v64 = [v63 shape];
      unint64_t v65 = [v64 count];

      if (v35 >= v65)
      {
        v68 = [v8 objectAtIndexedSubscript:0];
        v69 = [v68 descriptor];
        v70 = [v69 shape];
        v71 = [v70 objectAtIndexedSubscript:0];
        int v72 = [v71 unsignedIntValue];

        if (v72 == 1)
        {
          v73 = [v8 objectAtIndexedSubscript:0];
          v74 = v20;
          v20[44] = ~[v73 computeFlags] & 2;
        }
        else
        {
          v74 = v20;
          v20[44] = 1;
        }
        v39 = v172;
        v38 = v173;
        v75 = [v8 objectAtIndexedSubscript:1];
        v76 = [v75 descriptor];
        v77 = [v76 shape];
        v78 = [v77 objectAtIndexedSubscript:0];
        int v79 = [v78 unsignedIntValue];

        if (v79 == 1)
        {
          v80 = [v8 objectAtIndexedSubscript:1];
          v74[90] = ~[v80 computeFlags] & 2;
        }
        else
        {
          v74[90] = 1;
        }
        v20 = v74;
      }
      else
      {
        v20[44] = 1;
        v66 = [v8 objectAtIndexedSubscript:1];
        v20[90] = ~[v66 computeFlags] & 2;

        v39 = v172;
        v38 = v173;
      }
      unint64_t v37 = v177;
    }
    else
    {

      v36 = [v8 objectAtIndexedSubscript:0];
      v20[44] = ~[v36 computeFlags] & 2;

      v20[90] = 1;
      unint64_t v37 = v35;
      v39 = v172;
      v38 = v173;
    }
    v20[136] = 1;
    v81 = [v8 objectAtIndexedSubscript:0];
    v82 = [v81 descriptor];
    v83 = [v82 shape];
    uint64_t v84 = [v83 count];

    v85 = [v8 objectAtIndexedSubscript:0];
    v86 = [v85 descriptor];
    v87 = [v86 shape];
    v88 = v87;
    unint64_t v179 = v37;
    if (v37 == v84)
    {
      uint64_t v89 = [v87 copy];

      v90 = [v8 objectAtIndexedSubscript:0];
      [v39 setSourceStride:CPU_SetBatchStride(v90)];

      v175 = (void *)v89;
    }
    else
    {
      unint64_t v91 = v37;
      uint64_t v92 = [v87 count];

      if (v91)
      {
        v167 = v20;
        unint64_t v93 = 0;
        unint64_t v94 = v91 - v92;
        unint64_t v95 = v92 - v91;
        v96 = v175;
        unint64_t v37 = v91;
        do
        {
          if (v93 >= v94)
          {
            v98 = [v8 objectAtIndexedSubscript:0];
            v99 = [v98 descriptor];
            v100 = [v99 shape];
            v101 = [v100 objectAtIndexedSubscript:v95 + v93];
            uint64_t v97 = [v101 unsignedIntegerValue];

            unint64_t v37 = v179;
            v96 = v175;
          }
          else
          {
            uint64_t v97 = 1;
          }
          v102 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v97, v167, v169);
          [v96 setObject:v102 atIndexedSubscript:v93];

          ++v93;
        }
        while (v37 != v93);
        v39 = v172;
        v38 = v173;
        if (v37 < 2)
        {
          uint64_t v104 = 1;
          v20 = v167;
        }
        else
        {
          uint64_t v103 = 1;
          uint64_t v104 = 1;
          v20 = v167;
          do
          {
            v105 = [v96 objectAtIndexedSubscript:v103];
            v104 *= [v105 unsignedIntegerValue];

            ++v103;
          }
          while (v37 != v103);
        }
      }
      else
      {
        uint64_t v104 = 1;
        unint64_t v37 = 0;
      }
      [v39 setSourceStride:v104];
    }
    v106 = [v8 objectAtIndexedSubscript:1];
    v107 = [v106 descriptor];
    v108 = [v107 shape];
    uint64_t v109 = [v108 count];

    v110 = [v8 objectAtIndexedSubscript:1];
    v111 = [v110 descriptor];
    v112 = [v111 shape];
    v113 = v112;
    if (v37 == v109)
    {
      v61 = (void *)[v112 copy];

      v114 = [v8 objectAtIndexedSubscript:1];
      [v39 setSourceStrideSecondary:CPU_SetBatchStride(v114)];
    }
    else
    {
      unint64_t v115 = v37;
      uint64_t v116 = [v112 count];

      if (v115)
      {
        v168 = v20;
        unint64_t v117 = 0;
        unint64_t v118 = v115 - v116;
        unint64_t v119 = v116 - v115;
        v61 = v174;
        unint64_t v120 = v115;
        do
        {
          if (v117 >= v118)
          {
            v122 = [v8 objectAtIndexedSubscript:1];
            v123 = [v122 descriptor];
            v124 = [v123 shape];
            v125 = [v124 objectAtIndexedSubscript:v119 + v117];
            uint64_t v121 = [v125 unsignedIntegerValue];

            unint64_t v120 = v179;
            v61 = v174;
          }
          else
          {
            uint64_t v121 = 1;
          }
          v126 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v121, v168);
          [v61 setObject:v126 atIndexedSubscript:v117];

          ++v117;
        }
        while (v120 != v117);
        v39 = v172;
        v38 = v173;
        if (v120 < 2)
        {
          uint64_t v128 = 1;
          v20 = v168;
        }
        else
        {
          uint64_t v127 = 1;
          uint64_t v128 = 1;
          v20 = v168;
          do
          {
            v129 = [v61 objectAtIndexedSubscript:v127];
            v128 *= [v129 unsignedIntegerValue];

            ++v127;
          }
          while (v120 != v127);
        }
      }
      else
      {
        uint64_t v128 = 1;
        v61 = v174;
      }
      [v39 setSourceStrideSecondary:v128];
    }
    v130 = [v8 objectAtIndexedSubscript:0];
    v131 = [v130 descriptor];
    int v132 = CPU_BuildBNNSNDArrayDescriptor((uint64_t)v20, v175, 0, 0, [v131 dataType], 1, 0);

    if (!v132
      || ([v8 objectAtIndexedSubscript:1],
          v133 = objc_claimAutoreleasedReturnValue(),
          [v133 descriptor],
          v134 = objc_claimAutoreleasedReturnValue(),
          int v135 = CPU_BuildBNNSNDArrayDescriptor((uint64_t)(v20 + 46), v61, 0, 0, [v134 dataType], 1, 0), v134, v133, !v135))
    {
      BOOL v67 = 0;
LABEL_67:
      v60 = v175;
      goto LABEL_68;
    }
    uint64_t v136 = (uint64_t)(v20 + 92);
    v137 = [v38 descriptor];
    v138 = [v137 shape];
    v139 = [v38 descriptor];
    v140 = [v139 stride];
    [v38 descriptor];
    v142 = v141 = v61;
    LOBYTE(v136) = CPU_BuildBNNSNDArrayDescriptor(v136, v138, v140, 0, [v142 dataType], 1, 0);

    v61 = v141;
    BOOL v67 = 0;
    v60 = v175;
    if (v136)
    {
LABEL_59:
      [v39 setResultStride:CPU_SetBatchStride(v38)];
      v143 = [v39 inDeltaData];
      id v144 = [v143 objectAtIndexedSubscript:0];
      uint64_t v145 = [v144 bytes];

      v146 = [v39 outDeltaData];
      id v147 = [v146 objectAtIndexedSubscript:0];
      uint64_t v148 = [v147 bytes];

      v149 = [v8 objectAtIndexedSubscript:0];
      v150 = [v149 descriptor];
      v175 = v60;
      CPU_BuildBNNSNDArrayDescriptor(v145, v60, 0, 0, [v150 dataType], 1, 0);

      if ([v39 binaryOperation])
      {
        v151 = [v39 inDeltaData];
        id v152 = [v151 objectAtIndexedSubscript:1];
        uint64_t v153 = [v152 bytes];

        v154 = [v8 objectAtIndexedSubscript:1];
        v155 = [v154 descriptor];
        CPU_BuildBNNSNDArrayDescriptor(v153, v61, 0, 0, [v155 dataType], 1, 0);
      }
      v156 = v61;
      v157 = [v38 descriptor];
      v158 = [v157 shape];
      v159 = [v38 descriptor];
      v160 = [v159 stride];
      v161 = [v38 descriptor];
      CPU_BuildBNNSNDArrayDescriptor(v148, v158, v160, 0, [v161 dataType], 1, 0);

      memset(v180, 0, sizeof(v180));
      LODWORD(v180[0]) = 1;
      uint64_t v162 = MEMORY[0x1E01B0CC0](v170, v180);
      if (!v162)
      {
        v163 = +[MLCLog framework];
        if (os_log_type_enabled(v163, OS_LOG_TYPE_ERROR)) {
          +[_MLCCPUConvolution compileWithDevice:deviceOps:sourceTensors:resultTensor:convolutionTranspose:](v169, v163);
        }
      }
      objc_opt_class();
      v164 = objc_opt_new();
      [v39 setLayer:v164];

      v165 = [v39 layer];
      [v165 setFilter:v162];

      BOOL v67 = 1;
      v61 = v156;
      goto LABEL_67;
    }
  }
  else
  {
    v40 = [v8 objectAtIndexedSubscript:0];
    v41 = [v40 descriptor];
    v42 = [v41 shape];
    uint64_t v178 = [v42 copy];

    uint64_t v43 = *(void *)(v12 + 8);
    v44 = [v8 objectAtIndexedSubscript:0];
    v45 = [v44 descriptor];
    v46 = [v45 shape];
    v47 = [v8 objectAtIndexedSubscript:0];
    v48 = [v47 descriptor];
    v49 = [v48 stride];
    v176 = v8;
    v50 = [v8 objectAtIndexedSubscript:0];
    v51 = [v50 descriptor];
    uint64_t v52 = v43;
    LODWORD(v43) = CPU_BuildBNNSNDArrayDescriptor(v43, v46, v49, 0, [v51 dataType], 1, 0);

    if (v43)
    {
      *(_DWORD *)(v52 + 176) = 1;
      v38 = v173;
      v53 = [v173 descriptor];
      v54 = [v53 shape];
      v55 = [v173 descriptor];
      v56 = [v55 stride];
      v57 = [v173 descriptor];
      int v58 = CPU_BuildBNNSNDArrayDescriptor(v52 + 184, v54, v56, 0, [v57 dataType], 1, 0);

      if (v58)
      {
        *(_DWORD *)(v52 + 360) = 1;
        id v8 = v176;
        v59 = [v176 objectAtIndexedSubscript:0];
        v39 = v172;
        [v172 setSourceStride:CPU_SetBatchStride(v59)];

        v60 = (void *)v178;
        v61 = v174;
        goto LABEL_59;
      }
      BOOL v67 = 0;
      v60 = (void *)v178;
      id v8 = v176;
    }
    else
    {
      BOOL v67 = 0;
      id v8 = v176;
      v60 = (void *)v178;
      v38 = v173;
    }
    v39 = v172;
    v61 = v174;
  }
LABEL_68:

  return v67;
}

+ (void)bnnsArithmeticFunctionFor:(NSObject *)a3 .cold.1(const char *a1, int a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v5 = NSStringFromSelector(a1);
  int v6 = 138412546;
  v7 = v5;
  __int16 v8 = 1024;
  int v9 = a2;
  _os_log_error_impl(&dword_1DD0C9000, a3, OS_LOG_TYPE_ERROR, "%@: Unknown arithmetic operation type %d", (uint8_t *)&v6, 0x12u);
}

@end