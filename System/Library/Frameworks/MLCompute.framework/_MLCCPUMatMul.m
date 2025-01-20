@interface _MLCCPUMatMul
+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6;
+ (id)layerWithDevice:(id)a3 descriptor:(id)a4 inferenceOnly:(BOOL)a5;
- (_MLCCPUMatMul)initWithDevice:(id)a3 descriptor:(id)a4 inferenceOnly:(BOOL)a5;
@end

@implementation _MLCCPUMatMul

+ (id)layerWithDevice:(id)a3 descriptor:(id)a4 inferenceOnly:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = (void *)[objc_alloc((Class)a1) initWithDevice:v9 descriptor:v8 inferenceOnly:v5];

  return v10;
}

- (_MLCCPUMatMul)initWithDevice:(id)a3 descriptor:(id)a4 inferenceOnly:(BOOL)a5
{
  BOOL v21 = a5;
  v27[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  bzero(v25, 0x220uLL);
  id v9 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v25 length:544];
  uint64_t v10 = [v9 bytes];
  [v6 alpha];
  *(_DWORD *)uint64_t v10 = v11;
  *(_DWORD *)(v10 + 4) = 0;
  *(unsigned char *)(v10 + 8) = [v6 transposesX];
  *(unsigned char *)(v10 + 9) = [v6 transposesY];
  *(_WORD *)(v10 + 10) = 0;
  *(unsigned char *)(v10 + 12) = 0;
  memset(v24, 0, sizeof(v24));
  v12 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v24 length:176];
  v13 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v24 length:176];
  v14 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v24 length:176];
  v27[0] = v12;
  v27[1] = v13;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
  v26 = v14;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
  v17 = +[MLCCPUDeviceOps deviceOpsWithType:45 params:v9 inDeltaData:v15 outDeltaData:v16 weightsDeltaData:0 biasDeltaData:0 weightsMomentumData:0 biasMomentumData:0];

  if (v17)
  {
    [v8 addObject:v17];
    [v17 setInferenceOnly:v21];
    objc_msgSend(v17, "setTransposeX:", objc_msgSend(v6, "transposesX"));
    objc_msgSend(v17, "setTransposeY:", objc_msgSend(v6, "transposesY"));
  }
  v18 = (void *)[v8 copy];
  v23.receiver = self;
  v23.super_class = (Class)_MLCCPUMatMul;
  v19 = [(_MLCCPULayer *)&v23 initWithDevice:v7 deviceOps:v18];

  return v19;
}

+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6
{
  id v9 = a5;
  uint64_t v10 = (BNNSLayerParametersBroadcastMatMul *)a6;
  v182 = [a4 objectAtIndexedSubscript:0];
  id v11 = [v182 params];
  uint64_t v12 = [v11 bytes];
  v13 = [v9 objectAtIndexedSubscript:0];
  v14 = [v9 objectAtIndexedSubscript:1];
  v15 = [v13 descriptor];
  unint64_t v16 = [v15 dimensionCount];

  v17 = [v14 descriptor];
  unint64_t v18 = [v17 dimensionCount];

  id v181 = v11;
  layer_params = (BNNSLayerParametersBroadcastMatMul *)v12;
  v186 = v14;
  v178 = a2;
  if (v16 != v18)
  {
    v19 = v13;
    v20 = [v13 descriptor];
    BOOL v21 = [v20 shape];
    v22 = (void *)[v21 mutableCopy];

    objc_super v23 = [v14 descriptor];
    v24 = [v23 shape];
    v25 = (void *)[v24 mutableCopy];

    if (v16 <= v18) {
      unint64_t v26 = v18;
    }
    else {
      unint64_t v26 = v16;
    }
    if (v16 < v18)
    {
      unint64_t v27 = v26 - v16;
      do
      {
        [v22 insertObject:&unk_1F38765B8 atIndex:0];
        --v27;
      }
      while (v27);
    }
    if (v18 < v16)
    {
      unint64_t v28 = v26 - v18;
      do
      {
        [v25 insertObject:&unk_1F38765B8 atIndex:0];
        --v28;
      }
      while (v28);
    }
    v29 = [v19 descriptor];
    v30 = +[MLCTensorDescriptor descriptorWithShape:dataType:](MLCTensorDescriptor, "descriptorWithShape:dataType:", v22, [v29 dataType]);
    uint64_t v31 = +[MLCTensor tensorWithDescriptor:v30];

    v32 = [v186 descriptor];
    v33 = +[MLCTensorDescriptor descriptorWithShape:dataType:](MLCTensorDescriptor, "descriptorWithShape:dataType:", v25, [v32 dataType]);
    uint64_t v34 = +[MLCTensor tensorWithDescriptor:v33];

    v186 = (void *)v34;
    v13 = (void *)v31;
    uint64_t v12 = (uint64_t)layer_params;
  }
  uint64_t v35 = v12 + 16;
  v36 = [v13 descriptor];
  [v36 shape];
  v38 = v37 = v13;
  v39 = [v37 descriptor];
  v40 = [v39 stride];
  v41 = [v37 descriptor];
  int v42 = [v41 dataType];
  v180 = v37;
  v43 = [v37 descriptor];
  BOOL v44 = CPU_BuildBNNSNDArrayDescriptorRowMajor(v35, v38, v40, 0, v42, [v43 dimensionCount], 0);

  if (!v44) {
    goto LABEL_22;
  }
  v45 = [v186 descriptor];
  v46 = [v45 shape];
  v47 = [v186 descriptor];
  v48 = [v47 stride];
  v49 = [v186 descriptor];
  int v50 = [v49 dataType];
  v51 = [v186 descriptor];
  p_iB_desc = &layer_params->iB_desc;
  BOOL v52 = CPU_BuildBNNSNDArrayDescriptorRowMajor((uint64_t)&layer_params->iB_desc, v46, v48, 0, v50, [v51 dimensionCount], 0);

  if (!v52)
  {
    BOOL v79 = 0;
    v64 = v182;
    goto LABEL_24;
  }
  v174 = (long long *)v35;
  p_o_desc = &layer_params->o_desc;
  v54 = [(BNNSLayerParametersBroadcastMatMul *)v10 descriptor];
  v55 = [v54 shape];
  v56 = [(BNNSLayerParametersBroadcastMatMul *)v10 descriptor];
  v57 = [v56 stride];
  v58 = [(BNNSLayerParametersBroadcastMatMul *)v10 descriptor];
  int v59 = [v58 dataType];
  v60 = [(BNNSLayerParametersBroadcastMatMul *)v10 descriptor];
  BOOL v61 = CPU_BuildBNNSNDArrayDescriptorRowMajor((uint64_t)&layer_params->o_desc, v55, v57, 0, v59, [v60 dimensionCount], 0);

  if (!v61)
  {
LABEL_22:
    BOOL v79 = 0;
    v64 = v182;
LABEL_24:
    v81 = v180;
    v80 = v181;
    v82 = v186;
    goto LABEL_25;
  }
  v176 = &layer_params->o_desc;
  if ([v9 count] == 3) {
    layer_params->beta = 1.0;
  }
  memset(&filter_params, 0, sizeof(filter_params));
  filter_params.flags = 1;
  v62 = (BNNSLayerParametersBroadcastMatMul *)BNNSFilterCreateLayerBroadcastMatMul(layer_params, &filter_params);
  v63 = v62;
  v64 = v182;
  v65 = &layer_params->o_desc;
  if (v62)
  {
    layer_paramsa = v62;
    v66 = v10;
    v67 = [v9 objectAtIndexedSubscript:0];
    v68 = [v67 descriptor];
    uint64_t v69 = [v68 dimensionCount];

    if (v69)
    {
      unint64_t v70 = 0;
      uint64_t v71 = 1;
      do
      {
        v72 = [v9 objectAtIndexedSubscript:0];
        v73 = [v72 descriptor];
        v74 = [v73 shape];
        v75 = [v74 objectAtIndexedSubscript:v70];
        v71 *= [v75 unsignedIntegerValue];

        ++v70;
        v76 = [v9 objectAtIndexedSubscript:0];
        v77 = [v76 descriptor];
        unint64_t v78 = [v77 dimensionCount];
      }
      while (v70 < v78);
    }
    else
    {
      uint64_t v71 = 1;
    }
    [v182 setSourceStride:v71];
    uint64_t v84 = 1;
    v85 = [v9 objectAtIndexedSubscript:1];
    v86 = [v85 descriptor];
    uint64_t v87 = [v86 dimensionCount];

    if (v87)
    {
      unint64_t v88 = 0;
      uint64_t v84 = 1;
      do
      {
        v89 = [v9 objectAtIndexedSubscript:1];
        v90 = [v89 descriptor];
        v91 = [v90 shape];
        v92 = [v91 objectAtIndexedSubscript:v88];
        v84 *= [v92 unsignedIntegerValue];

        ++v88;
        v93 = [v9 objectAtIndexedSubscript:1];
        v94 = [v93 descriptor];
        unint64_t v95 = [v94 dimensionCount];
      }
      while (v88 < v95);
    }
    [v182 setSourceStrideSecondary:v84];
    uint64_t v10 = v66;
    v96 = [(BNNSLayerParametersBroadcastMatMul *)v66 descriptor];
    uint64_t v97 = [v96 dimensionCount];

    if (v97)
    {
      unint64_t v98 = 0;
      uint64_t v99 = 1;
      do
      {
        v100 = [(BNNSLayerParametersBroadcastMatMul *)v66 descriptor];
        v101 = [v100 shape];
        v102 = [v101 objectAtIndexedSubscript:v98];
        v99 *= [v102 unsignedIntegerValue];

        ++v98;
        v103 = [(BNNSLayerParametersBroadcastMatMul *)v66 descriptor];
        unint64_t v104 = [v103 dimensionCount];
      }
      while (v98 < v104);
    }
    else
    {
      uint64_t v99 = 1;
    }
    [v182 setResultStride:v99];
    v65 = p_o_desc;
    v63 = layer_paramsa;
  }
  objc_opt_class();
  v105 = objc_opt_new();
  [v182 setLayer:v105];

  v106 = [v182 layer];
  [v106 setFilter:v63];

  if (([v182 inferenceOnly] & 1) == 0)
  {
    v107 = [v182 inDeltaData];
    id v108 = [v107 objectAtIndexedSubscript:0];
    v109 = (_OWORD *)[v108 bytes];

    long long v110 = *v174;
    long long v111 = v174[2];
    v109[1] = v174[1];
    v109[2] = v111;
    _OWORD *v109 = v110;
    long long v112 = v174[3];
    long long v113 = v174[4];
    long long v114 = v174[6];
    v109[5] = v174[5];
    v109[6] = v114;
    v109[3] = v112;
    v109[4] = v113;
    long long v115 = v174[7];
    long long v116 = v174[8];
    long long v117 = v174[10];
    v109[9] = v174[9];
    v109[10] = v117;
    v109[7] = v115;
    v109[8] = v116;
    v118 = [v182 inDeltaData];
    id v119 = [v118 objectAtIndexedSubscript:1];
    v120 = (_OWORD *)[v119 bytes];

    long long v121 = *(_OWORD *)&p_iB_desc->flags;
    long long v122 = *(_OWORD *)&p_iB_desc->size[3];
    v120[1] = *(_OWORD *)&p_iB_desc->size[1];
    v120[2] = v122;
    _OWORD *v120 = v121;
    long long v123 = *(_OWORD *)&p_iB_desc->size[5];
    long long v124 = *(_OWORD *)&p_iB_desc->size[7];
    long long v125 = *(_OWORD *)&p_iB_desc->stride[3];
    v120[5] = *(_OWORD *)&p_iB_desc->stride[1];
    v120[6] = v125;
    v120[3] = v123;
    v120[4] = v124;
    long long v126 = *(_OWORD *)&p_iB_desc->stride[5];
    long long v127 = *(_OWORD *)&p_iB_desc->stride[7];
    long long v128 = *(_OWORD *)&p_iB_desc->table_data_type;
    v120[9] = *(_OWORD *)&p_iB_desc->data_type;
    v120[10] = v128;
    v120[7] = v126;
    v120[8] = v127;
    v129 = [v182 outDeltaData];
    id v130 = [v129 objectAtIndexedSubscript:0];
    v131 = (_OWORD *)[v130 bytes];

    long long v132 = *(_OWORD *)&v65->flags;
    long long v133 = *(_OWORD *)&v65->size[3];
    v131[1] = *(_OWORD *)&v65->size[1];
    v131[2] = v133;
    _OWORD *v131 = v132;
    long long v134 = *(_OWORD *)&v65->size[5];
    long long v135 = *(_OWORD *)&v65->size[7];
    long long v136 = *(_OWORD *)&v65->stride[3];
    v131[5] = *(_OWORD *)&v65->stride[1];
    v131[6] = v136;
    v131[3] = v134;
    v131[4] = v135;
    long long v137 = *(_OWORD *)&v65->stride[5];
    long long v138 = *(_OWORD *)&v65->stride[7];
    long long v139 = *(_OWORD *)&v65->table_data_type;
    v131[9] = *(_OWORD *)&v65->data_type;
    v131[10] = v139;
    v131[7] = v137;
    v131[8] = v138;
  }
  if ([v9 count] == 2)
  {
    BOOL v79 = 1;
    goto LABEL_24;
  }
  bzero(v187, 0x218uLL);
  id v175 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v187 length:536];
  uint64_t v140 = [v175 bytes];
  v141 = [v9 objectAtIndexedSubscript:2];
  v142 = [v141 descriptor];
  v143 = [v142 shape];
  v144 = v10;
  v145 = (void *)[v143 mutableCopy];

  unint64_t v146 = [v145 count];
  v147 = [(BNNSLayerParametersBroadcastMatMul *)v144 descriptor];
  unint64_t v148 = [v147 dimensionCount];

  if (v146 < v148)
  {
    do
    {
      [v145 insertObject:&unk_1F38765B8 atIndex:0];
      ++v146;
      v149 = [(BNNSLayerParametersBroadcastMatMul *)v144 descriptor];
      unint64_t v150 = [v149 dimensionCount];
    }
    while (v146 < v150);
  }
  layer_paramsb = v144;
  v151 = [(BNNSLayerParametersBroadcastMatMul *)v144 descriptor];
  v152 = +[MLCTensorDescriptor descriptorWithShape:dataType:](MLCTensorDescriptor, "descriptorWithShape:dataType:", v145, [v151 dataType]);
  v153 = +[MLCTensor tensorWithDescriptor:v152];

  v179 = [v153 descriptor];
  v154 = [v179 shape];
  v155 = [v153 descriptor];
  v156 = [v155 stride];
  v157 = [v153 descriptor];
  int v158 = [v157 dataType];
  v173 = v153;
  v159 = [v153 descriptor];
  LOBYTE(v158) = CPU_BuildBNNSNDArrayDescriptorRowMajor(v140 + 176, v154, v156, 0, v158, [v159 dimensionCount], 0);

  if (v158)
  {
    long long v160 = *(_OWORD *)&v176->flags;
    long long v161 = *(_OWORD *)&v176->size[3];
    *(_OWORD *)(v140 + 16) = *(_OWORD *)&v176->size[1];
    *(_OWORD *)(v140 + 32) = v161;
    *(_OWORD *)uint64_t v140 = v160;
    long long v162 = *(_OWORD *)&v176->size[5];
    long long v163 = *(_OWORD *)&v176->size[7];
    long long v164 = *(_OWORD *)&v176->stride[3];
    *(_OWORD *)(v140 + 80) = *(_OWORD *)&v176->stride[1];
    *(_OWORD *)(v140 + 96) = v164;
    *(_OWORD *)(v140 + 48) = v162;
    *(_OWORD *)(v140 + 64) = v163;
    long long v165 = *(_OWORD *)&v176->stride[5];
    long long v166 = *(_OWORD *)&v176->stride[7];
    long long v167 = *(_OWORD *)&v176->table_data_type;
    *(_OWORD *)(v140 + 144) = *(_OWORD *)&v176->data_type;
    *(_OWORD *)(v140 + 160) = v167;
    *(_OWORD *)(v140 + 112) = v165;
    *(_OWORD *)(v140 + 128) = v166;
    *(_DWORD *)(v140 + 528) = 6;
    uint64_t v168 = MEMORY[0x1E01B0D70](v140, &filter_params);
    BOOL v79 = v168 != 0;
    if (v168)
    {
      uint64_t v169 = v168;
      v170 = v175;
      [v182 setFusedPrimitiveParams:v175];
      v171 = [v182 layer];
      uint64_t v172 = v169;
      v64 = v182;
      [v171 setSecondaryFilter:v172];
    }
    else
    {
      v171 = +[MLCLog framework];
      v170 = v175;
      if (os_log_type_enabled(v171, OS_LOG_TYPE_ERROR)) {
        +[_MLCCPUMatMul compileWithDevice:deviceOps:sourceTensors:resultTensor:](v178, v171);
      }
      v64 = v182;
    }
    v81 = v180;
    v80 = v181;
    v82 = v186;
  }
  else
  {
    BOOL v79 = 0;
    v64 = v182;
    v81 = v180;
    v80 = v181;
    v82 = v186;
    v170 = v175;
  }

  uint64_t v10 = layer_paramsb;
LABEL_25:

  return v79;
}

+ (void)compileWithDevice:(const char *)a1 deviceOps:(NSObject *)a2 sourceTensors:resultTensor:.cold.1(const char *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = NSStringFromSelector(a1);
  int v4 = 138412290;
  BOOL v5 = v3;
  _os_log_error_impl(&dword_1DD0C9000, a2, OS_LOG_TYPE_ERROR, "%@: failed to create reduction filter", (uint8_t *)&v4, 0xCu);
}

@end