@interface _MLCGPUMatMul
+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6;
+ (id)layerWithDevice:(id)a3 descriptor:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6;
- (_MLCGPUMatMul)initWithDevice:(id)a3 descriptor:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6;
@end

@implementation _MLCGPUMatMul

+ (id)layerWithDevice:(id)a3 descriptor:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = (void *)[objc_alloc((Class)a1) initWithDevice:v13 descriptor:v12 sourceTensors:v11 resultTensor:v10];

  return v14;
}

- (_MLCGPUMatMul)initWithDevice:(id)a3 descriptor:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6
{
  v142[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v138.receiver = self;
  v138.super_class = (Class)_MLCGPUMatMul;
  v14 = [(_MLCGPUMatMul *)&v138 init];
  if (v14)
  {
    id v107 = v13;
    v15 = [v10 deviceList];
    uint64_t v125 = [v15 count];

    v111 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    if (([v11 transposesX] & 1) != 0 || objc_msgSend(v11, "transposesY"))
    {
      if ([v11 transposesX] && !objc_msgSend(v11, "transposesY"))
      {
        unsigned int v133 = 0;
        uint64_t v126 = 1;
      }
      else if (([v11 transposesX] & 1) != 0 || (objc_msgSend(v11, "transposesY") & 1) == 0)
      {
        if ([v11 transposesX] && objc_msgSend(v11, "transposesY"))
        {
          uint64_t v126 = 0x100000001;
          unsigned int v133 = 1;
        }
        else
        {
          uint64_t v126 = 0;
          unsigned int v133 = 0;
        }
      }
      else
      {
        unsigned int v133 = 0;
        uint64_t v126 = 0x100000000;
      }
    }
    else
    {
      unsigned int v133 = 0;
      uint64_t v126 = 0x100000001;
    }
    BOOL v110 = ([v11 transposesX] & 1) == 0 && (objc_msgSend(v11, "transposesY") & 1) != 0
        || ([v11 transposesX] & 1) == 0 && (objc_msgSend(v11, "transposesY") & 1) == 0;
    id v127 = v10;
    v136 = v11;
    BOOL v109 = [v11 transposesX] && !objc_msgSend(v11, "transposesY")
        || ([v11 transposesX] & 1) == 0 && (objc_msgSend(v11, "transposesY") & 1) == 0;
    v108 = v14;
    uint64_t v16 = 0;
    char v17 = 1;
    do
    {
      unint64_t v18 = 0;
      char v19 = v17;
      v142[v16] = 1;
      uint64_t v20 = 1;
      while (1)
      {
        v21 = [v12 objectAtIndexedSubscript:v16];
        v22 = [v21 descriptor];
        unint64_t v23 = [v22 dimensionCount] - 2;

        if (v18 >= v23) {
          break;
        }
        v24 = [v12 objectAtIndexedSubscript:v16];
        v25 = [v24 descriptor];
        v26 = [v25 shape];
        v27 = [v26 objectAtIndexedSubscript:v18];
        v20 *= [v27 unsignedIntegerValue];
        v142[v16] = v20;

        ++v18;
      }
      char v17 = 0;
      uint64_t v16 = 1;
    }
    while ((v19 & 1) != 0);
    id v10 = v127;
    id v11 = v136;
    if (v125)
    {
      uint64_t v28 = 0;
      uint64_t v123 = v142[1];
      uint64_t v124 = v142[0];
      do
      {
        v29 = [v10 deviceList];
        uint64_t v30 = [v29 objectAtIndexedSubscript:v28];

        uint64_t v134 = v28;
        v135 = (void *)v30;
        if (v124 == v123)
        {
          v31 = [v12 objectAtIndexedSubscript:0];
          v32 = [v31 descriptor];
          uint64_t v33 = [v32 dimensionCount] - 2;

          v34 = [v12 objectAtIndexedSubscript:0];
          v35 = [v34 descriptor];
          uint64_t v129 = [v35 dimensionCount] - 1;

          v36 = [v12 objectAtIndexedSubscript:1];
          v37 = [v36 descriptor];
          uint64_t v38 = [v37 dimensionCount];

          v39 = [v12 objectAtIndexedSubscript:1];
          v40 = [v39 descriptor];
          uint64_t v41 = [v40 dimensionCount] - 1;

          v42 = [v12 objectAtIndexedSubscript:0];
          v43 = [v42 descriptor];
          v44 = [v43 shape];
          v45 = [v44 objectAtIndexedSubscript:v33];

          v46 = [v12 objectAtIndexedSubscript:1];
          v47 = [v46 descriptor];
          v48 = [v47 shape];
          uint64_t v122 = v41;
          v49 = [v48 objectAtIndexedSubscript:v41];

          LODWORD(v48) = [v11 transposesX];
          v50 = [v12 objectAtIndexedSubscript:0];
          v51 = [v50 descriptor];
          v52 = [v51 shape];
          v53 = v52;
          if (v48)
          {
            v54 = [v52 objectAtIndexedSubscript:v33];
            uint64_t v118 = [v54 unsignedIntegerValue];

            v50 = [v12 objectAtIndexedSubscript:0];
            v51 = [v50 descriptor];
            v53 = [v51 shape];
            [v53 objectAtIndexedSubscript:v129];
            v45 = v55 = v45;
          }
          else
          {
            v55 = [v52 objectAtIndexedSubscript:v129];
            uint64_t v118 = [v55 unsignedIntegerValue];
          }
          uint64_t v128 = v38 - 2;

          if ([v136 transposesY])
          {
            v60 = [v12 objectAtIndexedSubscript:1];
            v61 = [v60 descriptor];
            v62 = [v61 shape];
            uint64_t v63 = [v62 objectAtIndexedSubscript:v128];

            v49 = (void *)v63;
          }
          id v64 = objc_alloc(MEMORY[0x1E4F35660]);
          uint64_t v65 = [v136 transposesX];
          uint64_t v66 = [v136 transposesY];
          uint64_t v67 = [v45 unsignedIntegerValue];
          v131 = v45;
          uint64_t v68 = [v49 unsignedIntegerValue];
          [v136 alpha];
          v119 = (void *)[v64 initWithDevice:v30 transposeLeft:v65 transposeRight:v66 resultRows:v67 resultColumns:v68 interiorColumns:v118 alpha:v69 beta:0.0];
          id v112 = objc_alloc(MEMORY[0x1E4F35660]);
          v115 = [v12 objectAtIndexedSubscript:0];
          v113 = [v115 descriptor];
          v70 = [v113 shape];
          v71 = [v70 objectAtIndexedSubscript:v33];
          uint64_t v120 = [v71 unsignedIntegerValue];
          v72 = [v12 objectAtIndexedSubscript:0];
          v73 = [v72 descriptor];
          v74 = [v73 shape];
          [v74 objectAtIndexedSubscript:v129];
          v75 = v49;
          v76 = v117 = v49;
          uint64_t v77 = [v76 unsignedIntegerValue];
          uint64_t v78 = [v75 unsignedIntegerValue];
          [v136 alpha];
          v130 = (void *)[v112 initWithDevice:v30 transposeLeft:v133 transposeRight:v126 resultRows:v120 resultColumns:v77 interiorColumns:v78 alpha:v79 beta:0.0];

          id v114 = objc_alloc(MEMORY[0x1E4F35660]);
          v121 = [v12 objectAtIndexedSubscript:1];
          v116 = [v121 descriptor];
          v80 = [v116 shape];
          v81 = [v80 objectAtIndexedSubscript:v128];
          uint64_t v82 = [v81 unsignedIntegerValue];
          v83 = [v12 objectAtIndexedSubscript:1];
          v84 = [v83 descriptor];
          v85 = [v84 shape];
          v86 = [v85 objectAtIndexedSubscript:v122];
          uint64_t v87 = [v86 unsignedIntegerValue];
          uint64_t v88 = [v131 unsignedIntegerValue];
          [v136 alpha];
          v90 = (void *)[v114 initWithDevice:v135 transposeLeft:HIDWORD(v126) transposeRight:v133 resultRows:v82 resultColumns:v87 interiorColumns:v88 alpha:v89 beta:0.0];

          id v11 = v136;
          v59 = +[MLCMatMulGPUDeviceOps deviceOpsWithForwardKernel:v119 gradientKernel:v130 secondaryGradientKernel:v90];

          v56 = 0;
          v58 = 0;
          id v10 = v127;
          if (!v59) {
            goto LABEL_44;
          }
        }
        else
        {
          v56 = (void *)[objc_alloc(MEMORY[0x1E4F357B8]) initWithDevice:v30 sourceCount:2];
          [v11 alpha];
          [v56 setAlpha:v57];
          v58 = (void *)[objc_alloc(MEMORY[0x1E4F35878]) initWithDevice:v30 axis:2];
          v59 = +[MLCMatMulGPUDeviceOps deviceOps];
          if (!v59) {
            goto LABEL_44;
          }
        }
        [v59 setLayer:objc_opt_class()];
        [v59 setMatmulKernel:v56];
        [v59 setReduceSumKernel:v58];
        v132 = v58;
        v91 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v11, "transposesX"));
        v141[0] = v91;
        v92 = [NSNumber numberWithBool:v133];
        v141[1] = v92;
        v93 = [NSNumber numberWithBool:HIDWORD(v126)];
        v141[2] = v93;
        v94 = [MEMORY[0x1E4F1C978] arrayWithObjects:v141 count:3];
        v95 = (void *)[v94 copy];
        [v59 setTransposeLeft:v95];

        v96 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v136, "transposesY"));
        v140[0] = v96;
        v97 = [NSNumber numberWithBool:v126];
        v140[1] = v97;
        v98 = [NSNumber numberWithBool:v133];
        v140[2] = v98;
        v99 = [MEMORY[0x1E4F1C978] arrayWithObjects:v140 count:3];
        v100 = (void *)[v99 copy];
        [v59 setTransposeRight:v100];

        v101 = [NSNumber numberWithBool:v110];
        v139[0] = v101;
        v102 = [NSNumber numberWithBool:v109];
        v139[1] = v102;
        v103 = [MEMORY[0x1E4F1C978] arrayWithObjects:v139 count:2];
        v104 = (void *)[v103 copy];
        [v59 setGradientLeftRightMatrixSelectionFlags:v104];

        id v10 = v127;
        id v11 = v136;

        v58 = v132;
        [v59 setSourceOfForwardNeededForGradient:1];
        [v59 setResultOfForwardNeededForGradient:0];
        [v111 addObject:v59];
LABEL_44:

        uint64_t v28 = v134 + 1;
      }
      while (v125 != v134 + 1);
    }
    v105 = (void *)[v111 copy];
    v14 = v108;
    v137.receiver = v108;
    v137.super_class = (Class)_MLCGPUMatMul;
    [(_MLCGPULayer *)&v137 setDeviceOps:v105];

    id v13 = v107;
  }

  return v14;
}

+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6
{
  v150[3] = *MEMORY[0x1E4F143B8];
  id v130 = a3;
  id v129 = a4;
  id v9 = a5;
  id v10 = a6;
  id v11 = [v9 objectAtIndexedSubscript:0];
  v150[0] = v11;
  v131 = v9;
  id v12 = [v9 objectAtIndexedSubscript:1];
  v150[1] = v12;
  v150[2] = v10;
  uint64_t v128 = v10;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v150 count:3];

  v14 = (void *)MEMORY[0x1E4F1CBF0];
  unsigned int v133 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  uint64_t v15 = 0;
  v142 = (void *)[v14 mutableCopy];
  v132 = v13;
  do
  {
    uint64_t v16 = [v13 objectAtIndexedSubscript:v15];
    char v17 = [v16 descriptor];
    uint64_t v18 = [v17 dimensionCount] - 1;

    char v19 = [v13 objectAtIndexedSubscript:v15];
    uint64_t v20 = [v19 descriptor];
    uint64_t v21 = [v20 dimensionCount] - 2;

    v22 = [v13 objectAtIndexedSubscript:v15];
    unint64_t v23 = [v22 descriptor];
    v24 = [v23 shape];
    v25 = [v24 objectAtIndexedSubscript:v21];
    uint64_t v140 = [v25 unsignedIntegerValue];

    v26 = [v13 objectAtIndexedSubscript:v15];
    v27 = [v26 descriptor];
    uint64_t v28 = [v27 shape];
    v29 = [v28 objectAtIndexedSubscript:v18];
    uint64_t v138 = [v29 unsignedIntegerValue];

    uint64_t v30 = [v13 objectAtIndexedSubscript:v15];
    v31 = [v30 descriptor];
    v32 = [v31 stride];
    uint64_t v33 = [v32 objectAtIndexedSubscript:v18];
    uint64_t v134 = [v33 unsignedIntegerValue];

    v149[v15] = 1;
    uint64_t v34 = 1;
    if (v21)
    {
      uint64_t v35 = 0;
      uint64_t v34 = 1;
      do
      {
        v36 = [v13 objectAtIndexedSubscript:v15];
        v37 = [v36 descriptor];
        uint64_t v38 = [v37 shape];
        v39 = [v38 objectAtIndexedSubscript:v35];
        v34 *= [v39 unsignedIntegerValue];
        v149[v15] = v34;

        ++v35;
      }
      while (v21 != v35);
    }
    v40 = [v13 objectAtIndexedSubscript:v15];
    uint64_t v41 = [v40 descriptor];
    v42 = [v41 shape];
    v43 = (void *)[v42 mutableCopy];
    [v142 setObject:v43 atIndexedSubscript:v15];

    v44 = [v13 objectAtIndexedSubscript:v15];
    v45 = [v44 descriptor];
    v46 = [v45 shape];
    unint64_t v47 = [v46 count];

    v48 = v142;
    if (v47 <= 3)
    {
      unint64_t v49 = v47 - 4;
      do
      {
        v50 = [v142 objectAtIndexedSubscript:v15];
        [v50 insertObject:&unk_1F3876510 atIndex:0];
      }
      while (!__CFADD__(v49++, 1));
    }
    id v13 = v132;
    v52 = [v132 objectAtIndexedSubscript:v15];
    v53 = [v52 descriptor];
    uint64_t DataType = GPU_GetDataType([v53 dataType]);

    v55 = [MEMORY[0x1E4F35640] matrixDescriptorWithRows:v140 columns:v138 matrices:v34 rowBytes:v134 * v138 matrixBytes:v134 * v138 * v140 dataType:DataType];
    [v133 addObject:v55];

    ++v15;
  }
  while (v15 != 3);
  v141 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  if (v149[0] == v149[1])
  {
    uint64_t v147 = 0;
    uint64_t v148 = 0;
  }
  else
  {
    uint64_t v56 = 0;
    char v57 = 1;
    do
    {
      char v139 = v57;
      v58 = [v48 objectAtIndexedSubscript:v56];
      v59 = [v58 objectAtIndexedSubscript:1];
      uint64_t v60 = [v59 unsignedIntegerValue];
      v61 = [v48 objectAtIndexedSubscript:2];
      v62 = [v61 objectAtIndexedSubscript:1];
      uint64_t v63 = [v62 unsignedIntegerValue];

      id v64 = [v48 objectAtIndexedSubscript:v56];
      uint64_t v65 = [v64 objectAtIndexedSubscript:0];
      uint64_t v66 = [v65 unsignedIntegerValue];
      uint64_t v67 = [v48 objectAtIndexedSubscript:2];
      uint64_t v68 = [v67 objectAtIndexedSubscript:0];
      uint64_t v69 = [v68 unsignedIntegerValue];

      *(&v147 + v56) = (v60 != v63) | (2 * (v66 != v69));
      if (v66 == v69)
      {
        v70 = (void *)[&unk_1F3876D38 copy];
        [v141 setObject:v70 atIndexedSubscript:2 * v56];

        v71 = (void *)[&unk_1F3876D50 copy];
        [v141 setObject:v71 atIndexedSubscript:(2 * v56) | 1];
      }
      else if (v60 == v63)
      {
        v136 = [v142 objectAtIndexedSubscript:2];
        uint64_t v126 = [v136 objectAtIndexedSubscript:0];
        v145[0] = v126;
        uint64_t v82 = NSNumber;
        uint64_t v124 = [v142 objectAtIndexedSubscript:v56];
        uint64_t v122 = [v124 objectAtIndexedSubscript:1];
        uint64_t v83 = [v122 unsignedIntegerValue];
        v84 = [v142 objectAtIndexedSubscript:v56];
        v85 = [v84 objectAtIndexedSubscript:2];
        v86 = objc_msgSend(v82, "numberWithUnsignedInteger:", objc_msgSend(v85, "unsignedIntegerValue") * v83);
        v145[1] = v86;
        uint64_t v87 = [v142 objectAtIndexedSubscript:v56];
        uint64_t v88 = [v87 objectAtIndexedSubscript:3];
        v145[2] = v88;
        float v89 = [MEMORY[0x1E4F1C978] arrayWithObjects:v145 count:3];
        v71 = (void *)[v89 copy];

        [v141 setObject:v71 atIndexedSubscript:2 * v56];
        v144[0] = &unk_1F3876510;
        v90 = NSNumber;
        objc_super v137 = [v142 objectAtIndexedSubscript:v56];
        id v127 = [v137 objectAtIndexedSubscript:1];
        uint64_t v91 = [v127 unsignedIntegerValue];
        v92 = [v142 objectAtIndexedSubscript:v56];
        v93 = [v92 objectAtIndexedSubscript:2];
        v94 = objc_msgSend(v90, "numberWithUnsignedInteger:", objc_msgSend(v93, "unsignedIntegerValue") * v91);
        v144[1] = v94;
        v95 = [v142 objectAtIndexedSubscript:v56];
        v96 = [v95 objectAtIndexedSubscript:3];
        v144[2] = v96;
        v97 = [MEMORY[0x1E4F1C978] arrayWithObjects:v144 count:3];
        v98 = (void *)[v97 copy];

        [v141 setObject:v98 atIndexedSubscript:(2 * v56) | 1];
      }
      else
      {
        v72 = NSNumber;
        v135 = [v142 objectAtIndexedSubscript:2];
        uint64_t v125 = [v135 objectAtIndexedSubscript:0];
        uint64_t v73 = [v125 unsignedIntegerValue];
        uint64_t v123 = [v142 objectAtIndexedSubscript:2];
        v74 = [v123 objectAtIndexedSubscript:1];
        v75 = objc_msgSend(v72, "numberWithUnsignedInteger:", objc_msgSend(v74, "unsignedIntegerValue") * v73);
        v146[0] = v75;
        v76 = [v142 objectAtIndexedSubscript:v56];
        uint64_t v77 = [v76 objectAtIndexedSubscript:2];
        v146[1] = v77;
        uint64_t v78 = [v142 objectAtIndexedSubscript:v56];
        float v79 = [v78 objectAtIndexedSubscript:3];
        v146[2] = v79;
        v80 = [MEMORY[0x1E4F1C978] arrayWithObjects:v146 count:3];
        v71 = (void *)[v80 copy];

        [v141 setObject:v71 atIndexedSubscript:2 * v56];
        v81 = (void *)[&unk_1F3876D68 copy];
        [v141 setObject:v81 atIndexedSubscript:(2 * v56) | 1];
      }
      char v57 = 0;
      uint64_t v56 = 1;
      v48 = v142;
    }
    while ((v139 & 1) != 0);
  }
  v99 = [v130 deviceList];
  uint64_t v100 = [v99 count];

  if (v100)
  {
    unint64_t v101 = 0;
    uint64_t v102 = v147;
    uint64_t v103 = v148;
    do
    {
      v104 = [v129 objectAtIndexedSubscript:v101];
      v105 = objc_opt_new();
      [v104 setLayer:v105];

      [v104 setMatrixDescs:v133];
      v106 = (void *)[v48 copy];
      [v104 setShapes:v106];

      id v107 = [NSNumber numberWithUnsignedInteger:v102];
      v143[0] = v107;
      v108 = [NSNumber numberWithUnsignedInteger:v103];
      v143[1] = v108;
      BOOL v109 = [MEMORY[0x1E4F1C978] arrayWithObjects:v143 count:2];
      BOOL v110 = (void *)[v109 copy];
      [v104 setBroadcastingFlags:v110];

      [v104 setReductionShapes:v141];
      if ((unint64_t)[v131 count] >= 3)
      {
        v111 = [v128 descriptor];
        id v112 = [v111 shape];
        uint64_t v113 = [v112 count];

        id v114 = [v128 descriptor];
        v115 = (void *)[v114 newShapeWithCount:v113];
        [v104 setSource0Shape:v115];

        v116 = [v131 objectAtIndexedSubscript:2];
        v117 = [v116 descriptor];
        uint64_t v118 = (void *)[v117 newShapeWithCount:v113];
        [v104 setSource1Shape:v118];

        [v104 setArithmeticOp:0];
        [v104 setUseSourceGradientDeviceMemoryForResultGradientTensor:1];
      }

      ++v101;
      v119 = [v130 deviceList];
      unint64_t v120 = [v119 count];

      v48 = v142;
    }
    while (v101 < v120);
  }

  return 1;
}

@end