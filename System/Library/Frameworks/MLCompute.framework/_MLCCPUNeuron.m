@interface _MLCCPUNeuron
+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6;
+ (id)layerWithDevice:(id)a3 descriptor:(id)a4;
- (_MLCCPUNeuron)initWithDevice:(id)a3 descriptor:(id)a4;
@end

@implementation _MLCCPUNeuron

- (_MLCCPUNeuron)initWithDevice:(id)a3 descriptor:(id)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  uint64_t v24 = 0;
  memset(v23, 0, sizeof(v23));
  memset(v22, 0, sizeof(v22));
  if (setBNNSActivation((uint64_t)v23, v8))
  {
    v10 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v22 length:408];
    memset(v21, 0, sizeof(v21));
    memset(v20, 0, sizeof(v20));
    v11 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v21 length:176];
    v12 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v20 length:176];
    v26[0] = v11;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
    v25 = v12;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
    v15 = +[MLCCPUDeviceOps deviceOpsWithType:13 params:v10 inDeltaData:v13 outDeltaData:v14 weightsDeltaData:0 biasDeltaData:0 weightsMomentumData:0 biasMomentumData:0];

    if (v15) {
      [v9 addObject:v15];
    }
    v16 = (void *)[v9 copy];
    v19.receiver = self;
    v19.super_class = (Class)_MLCCPUNeuron;
    self = [(_MLCCPULayer *)&v19 initWithDevice:v7 deviceOps:v16];

    v17 = self;
  }
  else
  {
    v10 = +[MLCLog framework];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[_MLCCPUNeuron initWithDevice:descriptor:](a2, v8);
    }
    v17 = 0;
  }

  return v17;
}

+ (id)layerWithDevice:(id)a3 descriptor:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithDevice:v7 descriptor:v6];

  return v8;
}

+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6
{
  v124[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a6;
  v10 = [a4 objectAtIndexedSubscript:0];
  id v11 = [v10 params];
  uint64_t v12 = [v11 bytes];
  if ([v10 deviceOpType] == 16)
  {
    v13 = [v9 descriptor];
    v14 = [v13 shape];
    uint64_t v15 = [v14 count];

    char v16 = 0;
    switch(v15)
    {
      case 1:
        goto LABEL_4;
      case 2:
        goto LABEL_3;
      case 3:
        v56 = [v9 descriptor];
        v57 = [v56 shape];
        v58 = [v57 objectAtIndexedSubscript:2];
        if ([v58 unsignedIntegerValue] == 1)
        {
          uint64_t v59 = [v10 softmaxDimension];

          if (v59 != 2) {
            goto LABEL_3;
          }
        }
        else
        {
        }
        if ([v10 softmaxDimension] != 2) {
          goto LABEL_24;
        }
        char v67 = 0;
        goto LABEL_25;
      case 4:
        v60 = [v9 descriptor];
        v61 = [v60 shape];
        v62 = [v61 objectAtIndexedSubscript:2];
        if ([v62 unsignedIntegerValue] != 1) {
          goto LABEL_23;
        }
        uint64_t v110 = v12;
        id v63 = v8;
        v64 = [v9 descriptor];
        v65 = [v64 shape];
        v66 = [v65 objectAtIndexedSubscript:3];
        if ([v66 unsignedIntegerValue] == 1)
        {
          unint64_t v115 = [v10 softmaxDimension];

          id v8 = v63;
          uint64_t v12 = v110;
          if (v115 < 2)
          {
LABEL_3:
            char v16 = 1 - [v10 softmaxDimension];
LABEL_4:
            *(_DWORD *)(v12 + 400) = 1 << v16;
            v17 = [v8 objectAtIndexedSubscript:0];
            v18 = [v17 descriptor];
            objc_super v19 = [v18 shape];
            uint64_t v20 = [v19 count];

            v21 = [v8 objectAtIndexedSubscript:0];
            v108 = [v21 descriptor];
            v106 = [v108 shape];
            uint64_t v22 = [v106 objectAtIndexedSubscript:0];
            id v112 = v11;
            v104 = (void *)v22;
            if (v20 == 1)
            {
              v124[0] = v22;
              v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v124 count:1];
              uint64_t v24 = [v8 objectAtIndexedSubscript:0];
              v25 = [v24 descriptor];
              v102 = [v25 stride];
              v113 = [v102 objectAtIndexedSubscript:0];
              v123 = v113;
              v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v123 count:1];
              v100 = [v8 objectAtIndexedSubscript:0];
              v27 = [v100 descriptor];
              CPU_BuildBNNSNDArrayDescriptor(v12, v23, v26, 0, [v27 dataType], 1, 0);
            }
            else
            {
              v122[0] = v22;
              v96 = [v8 objectAtIndexedSubscript:0];
              v94 = [v96 descriptor];
              v92 = [v94 shape];
              v102 = [v92 objectAtIndexedSubscript:1];
              v122[1] = v102;
              v113 = [MEMORY[0x1E4F1C978] arrayWithObjects:v122 count:2];
              v90 = [v8 objectAtIndexedSubscript:0];
              v100 = [v90 descriptor];
              v27 = [v100 stride];
              v91 = [v27 objectAtIndexedSubscript:0];
              v121[0] = v91;
              v89 = [v8 objectAtIndexedSubscript:0];
              v88 = [v89 descriptor];
              [v88 stride];
              v29 = v28 = v8;
              [v29 objectAtIndexedSubscript:1];
              v98 = v21;
              v31 = uint64_t v30 = v12;
              v121[1] = v31;
              v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v121 count:2];
              v33 = [v28 objectAtIndexedSubscript:0];
              v34 = [v33 descriptor];
              CPU_BuildBNNSNDArrayDescriptor(v30, v113, v32, 0, [v34 dataType], 1, 0);

              v25 = v92;
              uint64_t v24 = v94;

              v26 = v90;
              uint64_t v12 = v30;
              v21 = v98;

              id v8 = v28;
              v23 = v96;
            }
            v114 = v8;
            v35 = [v8 objectAtIndexedSubscript:0];
            v36 = [v35 descriptor];
            v37 = [v36 shape];
            uint64_t v38 = [v37 count];

            uint64_t v109 = v12;
            uint64_t v39 = v12 + 176;
            v107 = [v9 descriptor];
            v105 = [v107 shape];
            uint64_t v40 = [v105 objectAtIndexedSubscript:0];
            v103 = (void *)v40;
            if (v38 == 1)
            {
              uint64_t v120 = v40;
              v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v120 count:1];
              v42 = [v9 descriptor];
              v43 = [v42 stride];
              v44 = [v43 objectAtIndexedSubscript:0];
              v119 = v44;
              v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v119 count:1];
              v46 = [v9 descriptor];
              CPU_BuildBNNSNDArrayDescriptor(v39, v41, v45, 0, [v46 dataType], 1, 0);
            }
            else
            {
              v118[0] = v40;
              v101 = [v9 descriptor];
              v99 = [v101 shape];
              v97 = [v99 objectAtIndexedSubscript:1];
              v118[1] = v97;
              v93 = [MEMORY[0x1E4F1C978] arrayWithObjects:v118 count:2];
              v95 = [v9 descriptor];
              v47 = [v95 stride];
              v48 = [v47 objectAtIndexedSubscript:0];
              v117[0] = v48;
              v49 = [v9 descriptor];
              v50 = [v49 stride];
              v51 = [v50 objectAtIndexedSubscript:1];
              v117[1] = v51;
              v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:v117 count:2];
              v53 = [v9 descriptor];
              CPU_BuildBNNSNDArrayDescriptor(v39, v93, v52, 0, [v53 dataType], 1, 0);
            }
            uint64_t v54 = v109;
            goto LABEL_27;
          }
        }
        else
        {

          id v8 = v63;
          uint64_t v12 = v110;
LABEL_23:
        }
LABEL_24:
        char v67 = 3 - [v10 softmaxDimension];
LABEL_25:
        *(_DWORD *)(v12 + 400) = 1 << v67;
        break;
      default:
        BOOL v55 = 0;
        goto LABEL_30;
    }
  }
  id v112 = v11;
  v111 = [v8 objectAtIndexedSubscript:0];
  v68 = [v111 descriptor];
  v69 = [v68 shape];
  v70 = [v8 objectAtIndexedSubscript:0];
  v71 = [v70 descriptor];
  [v71 stride];
  v72 = v10;
  id v73 = v9;
  v75 = uint64_t v74 = v12;
  v114 = v8;
  v76 = [v8 objectAtIndexedSubscript:0];
  v77 = [v76 descriptor];
  CPU_BuildBNNSNDArrayDescriptor(v74, v69, v75, 0, [v77 dataType], 1, 0);

  uint64_t v54 = v74;
  id v9 = v73;
  v10 = v72;

  v78 = [v9 descriptor];
  v79 = [v78 shape];
  v80 = [v9 descriptor];
  v81 = [v80 stride];
  v82 = [v9 descriptor];
  CPU_BuildBNNSNDArrayDescriptor(v54 + 176, v79, v81, 0, [v82 dataType], 1, 0);

LABEL_27:
  memset(v116, 0, sizeof(v116));
  LODWORD(v116[0]) = 1;
  uint64_t v83 = MEMORY[0x1E01B0CB0](v54, v116);
  id v8 = v114;
  if (v83)
  {
    v84 = [v114 objectAtIndexedSubscript:0];
    [v10 setSourceStride:CPU_SetBatchStride(v84)];

    [v10 setResultStride:CPU_SetBatchStride(v9)];
  }
  objc_opt_class();
  v85 = objc_opt_new();
  [v10 setLayer:v85];

  v86 = [v10 layer];
  [v86 setFilter:v83];

  BOOL v55 = 1;
  id v11 = v112;
LABEL_30:

  return v55;
}

- (void)initWithDevice:(const char *)a1 descriptor:(void *)a2 .cold.1(const char *a1, void *a2)
{
  v3 = NSStringFromSelector(a1);
  [a2 activationType];
  OUTLINED_FUNCTION_8(&dword_1DD0C9000, v4, v5, "%@: Unknown neuron type %d", v6, v7, v8, v9, 2u);
}

@end