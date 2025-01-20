@interface MLCMultiheadAttentionLayer
+ (MLCMultiheadAttentionLayer)layerWithDescriptor:(MLCMultiheadAttentionDescriptor *)descriptor weights:(NSArray *)weights biases:(NSArray *)biases attentionBiases:(NSArray *)attentionBiases;
- (BOOL)allocateDataForOptimizer:(id)a3;
- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5;
- (BOOL)isSupportedShapeForTensorSources:(id)a3;
- (MLCMultiheadAttentionDescriptor)descriptor;
- (MLCMultiheadAttentionLayer)initWithDescriptor:(id)a3 weights:(id)a4 bias:(id)a5 attentionBias:(id)a6;
- (NSArray)attentionBiases;
- (NSArray)biases;
- (NSArray)biasesParameters;
- (NSArray)weights;
- (NSArray)weightsParameters;
- (id)description;
- (id)resultTensorFromSources:(id)a3;
- (id)summarizedDOTDescription;
- (unint64_t)allocatedDataSizeForTraining:(BOOL)a3 optimizer:(id)a4;
- (unint64_t)parametersCount;
- (void)allocateGradientsForParameters;
- (void)linkAssociatedTensors;
- (void)unlinkAssociatedTensors;
@end

@implementation MLCMultiheadAttentionLayer

+ (MLCMultiheadAttentionLayer)layerWithDescriptor:(MLCMultiheadAttentionDescriptor *)descriptor weights:(NSArray *)weights biases:(NSArray *)biases attentionBiases:(NSArray *)attentionBiases
{
  v10 = attentionBiases;
  v11 = biases;
  v12 = weights;
  v13 = descriptor;
  v14 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v13 weights:v12 bias:v11 attentionBias:v10];

  return (MLCMultiheadAttentionLayer *)v14;
}

- (MLCMultiheadAttentionLayer)initWithDescriptor:(id)a3 weights:(id)a4 bias:(id)a5 attentionBias:(id)a6
{
  v193[2] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if ([v13 count] != 4)
  {
    v17 = +[MLCLog framework];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[MLCMultiheadAttentionLayer initWithDescriptor:weights:bias:attentionBias:]7(a2);
    }
    goto LABEL_11;
  }
  if ([v12 hasBiases])
  {
    if (!v14)
    {
      v17 = +[MLCLog framework];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[MLCMultiheadAttentionLayer initWithDescriptor:weights:bias:attentionBias:](a2);
      }
      goto LABEL_11;
    }
    if ([v14 count] != 4)
    {
      v17 = +[MLCLog framework];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[MLCMultiheadAttentionLayer initWithDescriptor:weights:bias:attentionBias:]6(a2);
      }
      goto LABEL_11;
    }
  }
  char v16 = [v12 hasBiases];
  if (v14 && (v16 & 1) == 0)
  {
    v17 = +[MLCLog framework];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[MLCMultiheadAttentionLayer initWithDescriptor:weights:bias:attentionBias:]5(a2);
    }
LABEL_11:
    v18 = 0;
    goto LABEL_12;
  }
  if ([v12 hasAttentionBiases])
  {
    if (!v15)
    {
      v17 = +[MLCLog framework];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[MLCMultiheadAttentionLayer initWithDescriptor:weights:bias:attentionBias:](a2);
      }
      goto LABEL_11;
    }
    if ([v15 count] != 2)
    {
      v17 = +[MLCLog framework];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[MLCMultiheadAttentionLayer initWithDescriptor:weights:bias:attentionBias:]4(a2);
      }
      goto LABEL_11;
    }
  }
  char v20 = [v12 hasAttentionBiases];
  if (v15 && (v20 & 1) == 0)
  {
    v17 = +[MLCLog framework];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[MLCMultiheadAttentionLayer initWithDescriptor:weights:bias:attentionBias:]3(a2);
    }
    goto LABEL_11;
  }
  id obj = a4;
  id v146 = a6;
  v147 = a2;
  v164 = self;
  v169 = v14;
  uint64_t v21 = [v12 modelDimension];
  uint64_t v151 = [v12 keyDimension];
  uint64_t v149 = [v12 valueDimension];
  unint64_t v22 = [v12 headCount];
  v23 = [v13 objectAtIndexedSubscript:0];
  v24 = [v23 descriptor];
  v17 = [v24 shape];

  v157 = [NSNumber numberWithUnsignedInteger:v21];
  v193[0] = v157;
  unint64_t v170 = v21;
  v25 = [NSNumber numberWithUnsignedInteger:v21];
  v193[1] = v25;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v193 count:2];
  unint64_t v166 = v22;
  v168 = v15;
  id v148 = a5;
  if ([v17 isEqualToArray:v26])
  {

    unint64_t v27 = 0x1E4F28000;
  }
  else
  {
    v28 = [NSNumber numberWithUnsignedInteger:v21];
    v192[0] = v28;
    uint64_t v29 = [NSNumber numberWithUnsignedInteger:v170 / v22];
    unint64_t v30 = v22;
    v31 = (void *)v29;
    v192[1] = v29;
    v32 = [NSNumber numberWithUnsignedInteger:v30];
    v192[2] = v32;
    v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v192 count:3];
    char v143 = [v17 isEqualToArray:v33];

    id v15 = v168;
    unint64_t v27 = 0x1E4F28000uLL;
    if ((v143 & 1) == 0)
    {
      v61 = +[MLCLog framework];
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
        -[MLCMultiheadAttentionLayer initWithDescriptor:weights:bias:attentionBias:]2(v147);
      }
      goto LABEL_54;
    }
  }
  v34 = [v13 objectAtIndexedSubscript:1];
  v35 = [v34 descriptor];
  v36 = [v35 shape];

  unint64_t v37 = v170;
  v158 = [*(id *)(v27 + 3792) numberWithUnsignedInteger:v170];
  v191[0] = v158;
  v38 = [*(id *)(v27 + 3792) numberWithUnsignedInteger:v151];
  v191[1] = v38;
  v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v191 count:2];
  unint64_t v40 = v27;
  if ([v36 isEqualToArray:v39])
  {
    v41 = v36;

    unint64_t v42 = v40;
  }
  else
  {
    v152 = [*(id *)(v27 + 3792) numberWithUnsignedInteger:v170];
    v190[0] = v152;
    v43 = [*(id *)(v27 + 3792) numberWithUnsignedInteger:v170 / v166];
    v190[1] = v43;
    v44 = [*(id *)(v27 + 3792) numberWithUnsignedInteger:v166];
    v190[2] = v44;
    v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v190 count:3];
    v41 = v36;
    char v144 = [v36 isEqualToArray:v45];

    id v15 = v168;
    unint64_t v37 = v170;

    unint64_t v42 = 0x1E4F28000uLL;
    if ((v144 & 1) == 0)
    {
      v73 = +[MLCLog framework];
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
        -[MLCMultiheadAttentionLayer initWithDescriptor:weights:bias:attentionBias:]1(v147);
      }

      v18 = 0;
      v17 = v41;
      goto LABEL_55;
    }
  }
  v46 = [v13 objectAtIndexedSubscript:2];
  v47 = [v46 descriptor];
  v17 = [v47 shape];

  v48 = [*(id *)(v42 + 3792) numberWithUnsignedInteger:v37];
  v189[0] = v48;
  v49 = [*(id *)(v42 + 3792) numberWithUnsignedInteger:v149];
  v189[1] = v49;
  v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:v189 count:2];
  if ([v17 isEqualToArray:v50])
  {

    unint64_t v51 = v42;
  }
  else
  {
    v153 = [*(id *)(v42 + 3792) numberWithUnsignedInteger:v37];
    v159 = v48;
    v188[0] = v153;
    unint64_t v51 = v42;
    v52 = [*(id *)(v42 + 3792) numberWithUnsignedInteger:v37 / v166];
    v188[1] = v52;
    v53 = [*(id *)(v42 + 3792) numberWithUnsignedInteger:v166];
    v188[2] = v53;
    v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:v188 count:3];
    char v150 = [v17 isEqualToArray:v54];

    unint64_t v37 = v170;
    id v15 = v168;

    if ((v150 & 1) == 0)
    {
      v61 = +[MLCLog framework];
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
        -[MLCMultiheadAttentionLayer initWithDescriptor:weights:bias:attentionBias:]0(v147);
      }
      goto LABEL_54;
    }
  }
  v55 = [v13 objectAtIndexedSubscript:3];
  v56 = [v55 descriptor];
  v57 = [v56 shape];

  v154 = [*(id *)(v51 + 3792) numberWithUnsignedInteger:v37];
  v187[0] = v154;
  v58 = [*(id *)(v51 + 3792) numberWithUnsignedInteger:v37];
  v187[1] = v58;
  v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:v187 count:2];
  v160 = v57;
  if ([v57 isEqualToArray:v59])
  {

    v60 = v148;
  }
  else
  {
    unint64_t v62 = v51;
    v63 = [*(id *)(v51 + 3792) numberWithUnsignedInteger:v37];
    v186[0] = v63;
    v64 = [*(id *)(v62 + 3792) numberWithUnsignedInteger:v37 / v166];
    v186[1] = v64;
    v65 = [*(id *)(v62 + 3792) numberWithUnsignedInteger:v166];
    v186[2] = v65;
    v66 = [MEMORY[0x1E4F1C978] arrayWithObjects:v186 count:3];
    char v67 = [v57 isEqualToArray:v66];

    id v15 = v168;
    v60 = v148;
    if ((v67 & 1) == 0)
    {
      v79 = +[MLCLog framework];
      self = v164;
      if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR)) {
        -[MLCMultiheadAttentionLayer initWithDescriptor:weights:bias:attentionBias:].cold.9(v147);
      }
      goto LABEL_59;
    }
  }
  if (![v12 hasBiases])
  {
    id v14 = v169;
    v74 = v164;
    goto LABEL_49;
  }
  v68 = [v169 objectAtIndexedSubscript:0];
  v69 = [v68 descriptor];
  v17 = [v69 shape];

  unint64_t v70 = v170;
  v71 = [NSNumber numberWithUnsignedInteger:v170];
  v185 = v71;
  v72 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v185 count:1];
  if ([v17 isEqualToArray:v72])
  {
  }
  else
  {
    v80 = [NSNumber numberWithUnsignedInteger:v170 / v166];
    v184[0] = v80;
    v81 = [NSNumber numberWithUnsignedInteger:v166];
    v184[1] = v81;
    v82 = [MEMORY[0x1E4F1C978] arrayWithObjects:v184 count:2];
    char v161 = [v17 isEqualToArray:v82];

    unint64_t v70 = v170;
    if ((v161 & 1) == 0)
    {
      v111 = +[MLCLog framework];
      if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR)) {
        -[MLCMultiheadAttentionLayer initWithDescriptor:weights:bias:attentionBias:].cold.8(v147);
      }

      v18 = 0;
      goto LABEL_98;
    }
  }
  v83 = [v169 objectAtIndexedSubscript:1];
  v84 = [v83 descriptor];
  v85 = [v84 shape];

  v86 = [NSNumber numberWithUnsignedInteger:v70];
  v183 = v86;
  v87 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v183 count:1];
  if ([v85 isEqualToArray:v87])
  {

    goto LABEL_65;
  }
  v88 = [NSNumber numberWithUnsignedInteger:v70 / v166];
  v182[0] = v88;
  v89 = [NSNumber numberWithUnsignedInteger:v166];
  v182[1] = v89;
  v90 = [MEMORY[0x1E4F1C978] arrayWithObjects:v182 count:2];
  char v155 = [v85 isEqualToArray:v90];

  unint64_t v70 = v170;
  if ((v155 & 1) == 0)
  {
    v141 = +[MLCLog framework];
    if (os_log_type_enabled(v141, OS_LOG_TYPE_ERROR)) {
      -[MLCMultiheadAttentionLayer initWithDescriptor:weights:bias:attentionBias:].cold.7(v147);
    }

    v18 = 0;
    v17 = v85;
LABEL_98:
    id v15 = v168;
    id v14 = v169;
    goto LABEL_56;
  }
LABEL_65:
  v91 = [v169 objectAtIndexedSubscript:2];
  v92 = [v91 descriptor];
  v17 = [v92 shape];

  v93 = [NSNumber numberWithUnsignedInteger:v70];
  v181 = v93;
  v94 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v181 count:1];
  if ([v17 isEqualToArray:v94])
  {

    unint64_t v95 = v70;
  }
  else
  {
    v163 = [NSNumber numberWithUnsignedInteger:v70 / v166];
    v180[0] = v163;
    [NSNumber numberWithUnsignedInteger:v166];
    v104 = unint64_t v95 = v70;
    v180[1] = v104;
    v105 = [MEMORY[0x1E4F1C978] arrayWithObjects:v180 count:2];
    char v156 = [v17 isEqualToArray:v105];

    if ((v156 & 1) == 0)
    {
      v61 = +[MLCLog framework];
      id v15 = v168;
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
        -[MLCMultiheadAttentionLayer initWithDescriptor:weights:bias:attentionBias:].cold.6(v147);
      }
      goto LABEL_54;
    }
  }
  v106 = [v169 objectAtIndexedSubscript:3];
  v107 = [v106 descriptor];
  v108 = [v107 shape];

  v109 = [NSNumber numberWithUnsignedInteger:v95];
  v179 = v109;
  v110 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v179 count:1];
  id v15 = v168;
  v160 = v108;
  if ([v108 isEqualToArray:v110])
  {

    id v14 = v169;
    v74 = v164;
    v60 = v148;
    goto LABEL_49;
  }
  v178[0] = &unk_1F3876A50;
  v138 = [NSNumber numberWithUnsignedInteger:v95];
  v178[1] = v138;
  v139 = [MEMORY[0x1E4F1C978] arrayWithObjects:v178 count:2];
  char v140 = [v108 isEqualToArray:v139];

  if ((v140 & 1) == 0)
  {
    v79 = +[MLCLog framework];
    self = v164;
    if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR)) {
      -[MLCMultiheadAttentionLayer initWithDescriptor:weights:bias:attentionBias:].cold.5(v147);
    }
LABEL_59:

    v18 = 0;
    v17 = v160;
    id v14 = v169;
    goto LABEL_12;
  }
  id v14 = v169;
  v74 = v164;
  v60 = v148;
LABEL_49:
  if (![v12 hasAttentionBiases])
  {
    v17 = v160;
LABEL_79:
    v173.receiver = v74;
    v173.super_class = (Class)MLCMultiheadAttentionLayer;
    v116 = [(MLCLayer *)&v173 initWithLabel:@"MultiheadAttention"];
    p_isa = (id *)&v116->super.super.isa;
    if (v116)
    {
      objc_storeStrong((id *)&v116->_descriptor, a3);
      v118 = p_isa + 26;
      objc_storeStrong(p_isa + 26, obj);
      v165 = p_isa + 27;
      objc_storeStrong(p_isa + 27, v60);
      v171 = p_isa;
      v167 = p_isa + 28;
      objc_storeStrong(p_isa + 28, v146);
      v119 = (void *)MEMORY[0x1E4F1CBF0];
      v120 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
      v121 = (void *)[v119 mutableCopy];
      if ([v13 count])
      {
        unint64_t v122 = 0;
        do
        {
          v123 = [v13 objectAtIndexedSubscript:v122];
          v124 = +[MLCTensorParameter parameterWithTensor:v123];
          [v120 setObject:v124 atIndexedSubscript:v122];

          v125 = [*v118 objectAtIndexedSubscript:v122];
          [v125 setIsLayerParameter:1];

          ++v122;
        }
        while (v122 < [v13 count]);
      }
      uint64_t v126 = [v120 copy];
      id v127 = v171[29];
      v171[29] = (id)v126;

      if ([v12 hasBiases] && objc_msgSend(v169, "count"))
      {
        unint64_t v128 = 0;
        do
        {
          v129 = [v169 objectAtIndexedSubscript:v128];
          v130 = +[MLCTensorParameter parameterWithTensor:v129];
          [v121 addObject:v130];

          v131 = [*v165 objectAtIndexedSubscript:v128];
          [v131 setIsLayerParameter:1];

          ++v128;
        }
        while (v128 < [v169 count]);
      }
      if ([v12 hasAttentionBiases] && objc_msgSend(v168, "count"))
      {
        unint64_t v132 = 0;
        do
        {
          v133 = [v168 objectAtIndexedSubscript:v132];
          v134 = +[MLCTensorParameter parameterWithTensor:v133];
          [v121 addObject:v134];

          v135 = [*v167 objectAtIndexedSubscript:v132];
          [v135 setIsLayerParameter:1];

          ++v132;
        }
        while (v132 < [v168 count]);
      }
      uint64_t v136 = [v121 copy];
      p_isa = v171;
      id v137 = v171[30];
      v171[30] = (id)v136;

      v172.receiver = v171;
      v172.super_class = (Class)MLCMultiheadAttentionLayer;
      [(MLCLayer *)&v172 setIsUpdatable:1];

      id v14 = v169;
      id v15 = v168;
    }
    self = p_isa;
    v18 = self;
    goto LABEL_12;
  }
  v75 = [v15 objectAtIndexedSubscript:0];
  v76 = [v75 descriptor];
  v17 = [v76 shape];

  v77 = [NSNumber numberWithUnsignedInteger:v170];
  v177 = v77;
  v78 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v177 count:1];
  if ([v17 isEqualToArray:v78])
  {

    goto LABEL_68;
  }
  v96 = [NSNumber numberWithUnsignedInteger:v170 / v166];
  v176[0] = v96;
  v97 = [NSNumber numberWithUnsignedInteger:v166];
  v176[1] = v97;
  v98 = [MEMORY[0x1E4F1C978] arrayWithObjects:v176 count:2];
  char v162 = [v17 isEqualToArray:v98];

  id v15 = v168;
  if ((v162 & 1) == 0)
  {
    v61 = +[MLCLog framework];
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
      -[MLCMultiheadAttentionLayer initWithDescriptor:weights:bias:attentionBias:].cold.4(v147);
    }
LABEL_54:

    v18 = 0;
LABEL_55:
    id v14 = v169;
LABEL_56:
    self = v164;
    goto LABEL_12;
  }
LABEL_68:
  v99 = [v15 objectAtIndexedSubscript:1];
  v100 = [v99 descriptor];
  v101 = [v100 shape];

  v102 = [NSNumber numberWithUnsignedInteger:v170];
  v175 = v102;
  v103 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v175 count:1];
  if ([v101 isEqualToArray:v103])
  {

    v17 = v101;
    id v14 = v169;
LABEL_78:
    v74 = v164;
    v60 = v148;
    goto LABEL_79;
  }
  v112 = [NSNumber numberWithUnsignedInteger:v170 / v166];
  v174[0] = v112;
  v113 = [NSNumber numberWithUnsignedInteger:v166];
  v174[1] = v113;
  v114 = [MEMORY[0x1E4F1C978] arrayWithObjects:v174 count:2];
  char v115 = [v101 isEqualToArray:v114];

  if (v115)
  {
    v17 = v101;
    id v15 = v168;
    id v14 = v169;
    goto LABEL_78;
  }
  v142 = +[MLCLog framework];
  self = v164;
  if (os_log_type_enabled(v142, OS_LOG_TYPE_ERROR)) {
    -[MLCMultiheadAttentionLayer initWithDescriptor:weights:bias:attentionBias:](v147);
  }

  v18 = 0;
  v17 = v101;
  id v15 = v168;
  id v14 = v169;
LABEL_12:

  return v18;
}

- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  uint64_t v162 = *MEMORY[0x1E4F143B8];
  id v154 = a3;
  id v8 = a4;
  id v153 = a5;
  v9 = [v8 objectAtIndexedSubscript:0];
  v10 = [v9 descriptor];
  uint64_t v11 = [v10 dimensionCount];

  id v12 = [(MLCMultiheadAttentionLayer *)self descriptor];
  uint64_t v13 = [v12 modelDimension];
  id v14 = [v8 objectAtIndexedSubscript:0];
  id v15 = [v14 descriptor];
  char v16 = [v15 shape];
  uint64_t v17 = v11 - 1;
  v18 = [v16 objectAtIndexedSubscript:v11 - 1];
  uint64_t v19 = [v18 unsignedIntegerValue];

  if (v13 != v19)
  {
    v78 = +[MLCLog framework];
    if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR)) {
      -[MLCMultiheadAttentionLayer compileForDevice:sourceTensors:resultTensor:].cold.8(a2);
    }
    char v79 = 0;
    v34 = v153;
    v43 = v154;
    goto LABEL_56;
  }
  char v20 = [(MLCMultiheadAttentionLayer *)self descriptor];
  uint64_t v21 = [v20 keyDimension];
  unint64_t v22 = [v8 objectAtIndexedSubscript:1];
  v23 = [v22 descriptor];
  v24 = [v23 shape];
  v25 = [v24 objectAtIndexedSubscript:v17];
  uint64_t v26 = [v25 unsignedIntegerValue];

  if (v21 != v26)
  {
    v78 = +[MLCLog framework];
    v34 = v153;
    v43 = v154;
    if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR)) {
      -[MLCMultiheadAttentionLayer compileForDevice:sourceTensors:resultTensor:].cold.7(a2);
    }
    goto LABEL_55;
  }
  unint64_t v27 = [(MLCMultiheadAttentionLayer *)self descriptor];
  uint64_t v28 = [v27 valueDimension];
  uint64_t v29 = [v8 objectAtIndexedSubscript:2];
  unint64_t v30 = [v29 descriptor];
  v31 = [v30 shape];
  v32 = [v31 objectAtIndexedSubscript:v17];
  uint64_t v33 = [v32 unsignedIntegerValue];

  v34 = v153;
  if (v28 != v33)
  {
    v78 = +[MLCLog framework];
    v43 = v154;
    if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR)) {
      -[MLCMultiheadAttentionLayer compileForDevice:sourceTensors:resultTensor:].cold.6(a2);
    }
    goto LABEL_55;
  }
  v35 = [v153 descriptor];
  uint64_t v36 = [v35 dimensionCount];

  unint64_t v37 = [(MLCMultiheadAttentionLayer *)self descriptor];
  uint64_t v38 = [v37 modelDimension];
  v39 = [v153 descriptor];
  unint64_t v40 = [v39 shape];
  v41 = [v40 objectAtIndexedSubscript:v36 - 1];
  uint64_t v42 = [v41 unsignedIntegerValue];

  v43 = v154;
  if (v38 != v42)
  {
    v78 = +[MLCLog framework];
    if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR)) {
      -[MLCMultiheadAttentionLayer compileForDevice:sourceTensors:resultTensor:].cold.5(a2);
    }
    goto LABEL_55;
  }
  v44 = [v8 objectAtIndexedSubscript:0];
  v45 = [v44 descriptor];
  uint64_t v46 = [v45 dataType];

  if (!+[MLCLayer supportsDataType:v46 onDevice:v154])
  {
    v78 = +[MLCLog framework];
    if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
    {
      v80 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v157 = v80;
      __int16 v158 = 1024;
      int v159 = v46;
      __int16 v160 = 2112;
      id v161 = v154;
      _os_log_error_impl(&dword_1DD0C9000, v78, OS_LOG_TYPE_ERROR, "%@: MultiheadAttention layer with data type = %d is not supported on a device = %@", buf, 0x1Cu);
    }
    goto LABEL_55;
  }
  if ([v8 count] == 5)
  {
    v47 = [v8 objectAtIndexedSubscript:3];
    v48 = [v47 descriptor];
    uint64_t v49 = [v48 dimensionCount];

    if (v49 == 2)
    {
      v50 = [v8 objectAtIndexedSubscript:1];
      unint64_t v51 = [v50 descriptor];
      v52 = [v51 shape];
      id v146 = [v8 objectAtIndexedSubscript:1];
      v142 = [v146 descriptor];
      uint64_t v149 = v52;
      v53 = objc_msgSend(v52, "objectAtIndexedSubscript:", objc_msgSend(v142, "dimensionCount") - 2);
      uint64_t v54 = [v53 unsignedIntegerValue];
      v55 = [v8 objectAtIndexedSubscript:3];
      v56 = [v55 descriptor];
      v57 = [v56 shape];
      v58 = [v57 objectAtIndexedSubscript:1];
      if (v54 == [v58 unsignedIntegerValue])
      {
        v59 = [v8 objectAtIndexedSubscript:3];
        [v59 descriptor];
        v60 = v138 = v50;
        int v134 = [v60 dataType];

        v34 = v153;
        v43 = v154;
        if (v134 == 4)
        {
          v61 = [(MLCMultiheadAttentionLayer *)self descriptor];
          [v61 setHasKeyPaddingMask:1];

          unint64_t v62 = [v8 objectAtIndexedSubscript:4];
          v63 = [v62 descriptor];
          uint64_t v64 = [v63 dimensionCount];

          if (v64 != 3) {
            goto LABEL_53;
          }
          v65 = [v8 objectAtIndexedSubscript:1];
          v66 = [v65 descriptor];
          char v67 = [v66 shape];
          v68 = [v8 objectAtIndexedSubscript:1];
          char v150 = [v68 descriptor];
          v147 = objc_msgSend(v67, "objectAtIndexedSubscript:", objc_msgSend(v150, "dimensionCount") - 2);
          uint64_t v69 = [v147 unsignedIntegerValue];
          char v143 = [v8 objectAtIndexedSubscript:4];
          unint64_t v70 = [v143 descriptor];
          v71 = [v70 shape];
          v72 = [v71 objectAtIndexedSubscript:2];
          if (v69 != [v72 unsignedIntegerValue])
          {

            v34 = v153;
            v43 = v154;
            goto LABEL_53;
          }
          v135 = [v8 objectAtIndexedSubscript:0];
          unint64_t v128 = [v135 descriptor];
          v118 = [v128 shape];
          unint64_t v122 = [v8 objectAtIndexedSubscript:0];
          v116 = [v122 descriptor];
          objc_msgSend(v118, "objectAtIndexedSubscript:", objc_msgSend(v116, "dimensionCount") - 2);
          v73 = unint64_t v132 = v68;
          uint64_t v139 = [v73 unsignedIntegerValue];
          v74 = [v8 objectAtIndexedSubscript:4];
          [v74 descriptor];
          v75 = v130 = v65;
          [v75 shape];
          v76 = uint64_t v126 = v66;
          [v76 objectAtIndexedSubscript:1];
          v77 = v120 = v67;
          uint64_t v124 = [v77 unsignedIntegerValue];

          v34 = v153;
          v43 = v154;
          if (v139 != v124)
          {
LABEL_53:
            v78 = +[MLCLog framework];
            if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR)) {
              -[MLCMultiheadAttentionLayer compileForDevice:sourceTensors:resultTensor:](a2);
            }
LABEL_55:
            char v79 = 0;
            goto LABEL_56;
          }
          goto LABEL_36;
        }
      }
      else
      {

        v34 = v153;
        v43 = v154;
      }
    }
    v78 = +[MLCLog framework];
    if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR)) {
      -[MLCMultiheadAttentionLayer compileForDevice:sourceTensors:resultTensor:](a2);
    }
    goto LABEL_55;
  }
  if ([v8 count] == 4)
  {
    v81 = [v8 objectAtIndexedSubscript:3];
    v82 = [v81 descriptor];
    uint64_t v83 = [v82 dimensionCount];

    if (v83 == 3)
    {
      uint64_t v151 = [v8 objectAtIndexedSubscript:1];
      v84 = [v151 descriptor];
      v96 = [v84 shape];
      v97 = [v8 objectAtIndexedSubscript:1];
      v141 = [v97 descriptor];
      id v148 = v96;
      v98 = objc_msgSend(v96, "objectAtIndexedSubscript:", objc_msgSend(v141, "dimensionCount") - 2);
      uint64_t v99 = [v98 unsignedIntegerValue];
      v100 = [v8 objectAtIndexedSubscript:3];
      v90 = [v100 descriptor];
      v91 = [v90 shape];
      v92 = [v91 objectAtIndexedSubscript:2];
      if (v99 == [v92 unsignedIntegerValue])
      {
        v131 = [v8 objectAtIndexedSubscript:0];
        v129 = [v131 descriptor];
        v123 = [v129 shape];
        v125 = [v8 objectAtIndexedSubscript:0];
        v121 = [v125 descriptor];
        v117 = objc_msgSend(v123, "objectAtIndexedSubscript:", objc_msgSend(v121, "dimensionCount") - 2);
        uint64_t v133 = [v117 unsignedIntegerValue];
        v101 = [v8 objectAtIndexedSubscript:3];
        [v101 descriptor];
        v102 = id v137 = v84;
        [v102 shape];
        v103 = v119 = v90;
        [v103 objectAtIndexedSubscript:1];
        v104 = v145 = v97;
        uint64_t v127 = [v104 unsignedIntegerValue];

        v34 = v153;
        v43 = v154;
        if (v133 == v127)
        {
LABEL_36:
          unint64_t v95 = [(MLCMultiheadAttentionLayer *)self descriptor];
          [v95 setHasAttentionMask:1];
          goto LABEL_37;
        }
LABEL_50:
        v78 = +[MLCLog framework];
        if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR)) {
          -[MLCMultiheadAttentionLayer compileForDevice:sourceTensors:resultTensor:].cold.4(a2);
        }
        goto LABEL_55;
      }
      v114 = v100;
      v87 = v98;
      v86 = v141;
    }
    else
    {
      if (v83 != 2) {
        goto LABEL_50;
      }
      uint64_t v151 = [v8 objectAtIndexedSubscript:1];
      v84 = [v151 descriptor];
      v85 = [v84 shape];
      char v144 = [v8 objectAtIndexedSubscript:1];
      v86 = [v144 descriptor];
      id v148 = v85;
      v87 = objc_msgSend(v85, "objectAtIndexedSubscript:", objc_msgSend(v86, "dimensionCount") - 2);
      uint64_t v88 = [v87 unsignedIntegerValue];
      v89 = [v8 objectAtIndexedSubscript:3];
      v90 = [v89 descriptor];
      v91 = [v90 shape];
      v92 = [v91 objectAtIndexedSubscript:1];
      if (v88 == [v92 unsignedIntegerValue])
      {
        v93 = [v8 objectAtIndexedSubscript:3];
        [v93 descriptor];
        v94 = uint64_t v136 = v84;
        int v140 = [v94 dataType];

        v34 = v153;
        v43 = v154;
        if (v140 == 4)
        {
          unint64_t v95 = [(MLCMultiheadAttentionLayer *)self descriptor];
          [v95 setHasKeyPaddingMask:1];
LABEL_37:

          goto LABEL_38;
        }
        goto LABEL_50;
      }
      v114 = v89;
      v97 = v144;
    }

    v34 = v153;
    v43 = v154;
    goto LABEL_50;
  }
LABEL_38:
  if ((unint64_t)[v8 count] >= 4)
  {
    unint64_t v105 = 3;
    do
    {
      v106 = [v8 objectAtIndexedSubscript:v105];
      objc_msgSend(v106, "setComputeFlags:", objc_msgSend(v106, "computeFlags") | 8);

      ++v105;
    }
    while (v105 < [v8 count]);
  }
  v107 = [v43 computeEngine];
  v108 = [(MLCMultiheadAttentionLayer *)self descriptor];
  v109 = [(MLCMultiheadAttentionLayer *)self weights];
  v110 = [(MLCMultiheadAttentionLayer *)self biases];
  v111 = [(MLCMultiheadAttentionLayer *)self attentionBiases];
  v78 = objc_msgSend(v107, "multiheadAttentionLayerWithDescriptor:weights:bias:attnBias:inferenceOnly:", v108, v109, v110, v111, -[MLCLayer compileForInferenceOnly](self, "compileForInferenceOnly"));

  if (!v78 || ![v78 count])
  {
    v113 = +[MLCLog framework];
    if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR)) {
      -[MLCScatterLayer compileForDevice:sourceTensors:resultTensor:](a2, (uint64_t)v78, v113);
    }

    goto LABEL_55;
  }
  v112 = [v43 computeEngine];
  char v79 = [v112 compileLayerDeviceOps:v78 sourceTensors:v8 resultTensor:v34];

  v155.receiver = self;
  v155.super_class = (Class)MLCMultiheadAttentionLayer;
  [(MLCLayer *)&v155 bindDevice:v43 deviceOps:v78];
LABEL_56:

  return v79;
}

- (BOOL)allocateDataForOptimizer:(id)a3
{
  id v4 = a3;
  v5 = [(MLCMultiheadAttentionLayer *)self biases];
  v6 = (void *)[v5 mutableCopy];

  v7 = [(MLCMultiheadAttentionLayer *)self descriptor];
  int v8 = [v7 hasAttentionBiases];

  if (v8)
  {
    if (!v6) {
      v6 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    }
    v9 = [(MLCMultiheadAttentionLayer *)self attentionBiases];
    [v6 addObjectsFromArray:v9];
  }
  v10 = [(MLCMultiheadAttentionLayer *)self weights];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    unint64_t v12 = 0;
    do
    {
      uint64_t v13 = [(MLCMultiheadAttentionLayer *)self weightsParameters];
      id v14 = [v13 objectAtIndexedSubscript:v12];
      id v15 = [(MLCLayer *)self device];
      [v14 allocateDataForOptimizer:v4 device:v15 isVector:0];

      ++v12;
      char v16 = [(MLCMultiheadAttentionLayer *)self weights];
      unint64_t v17 = [v16 count];
    }
    while (v12 < v17);
  }
  v18 = [(MLCMultiheadAttentionLayer *)self descriptor];
  if ([v18 hasBiases])
  {

    goto LABEL_11;
  }
  uint64_t v19 = [(MLCMultiheadAttentionLayer *)self descriptor];
  int v20 = [v19 hasAttentionBiases];

  if (v20)
  {
LABEL_11:
    for (unint64_t i = 0; ; ++i)
    {
      unint64_t v22 = [(MLCMultiheadAttentionLayer *)self biases];
      uint64_t v23 = [v22 count];
      v24 = [(MLCMultiheadAttentionLayer *)self attentionBiases];
      unint64_t v25 = [v24 count] + v23;

      if (i >= v25) {
        break;
      }
      uint64_t v26 = [(MLCMultiheadAttentionLayer *)self biasesParameters];
      unint64_t v27 = [v26 objectAtIndexedSubscript:i];
      uint64_t v28 = [(MLCLayer *)self device];
      [v27 allocateDataForOptimizer:v4 device:v28 isVector:0];
    }
  }
  uint64_t v29 = [(MLCLayer *)self device];
  unint64_t v30 = [v29 computeEngine];
  v31 = [(MLCLayer *)self deviceOps];
  v32 = [(MLCMultiheadAttentionLayer *)self weights];
  if ([v6 count]) {
    uint64_t v33 = v6;
  }
  else {
    uint64_t v33 = 0;
  }
  [v30 setMHALayerOptimizerDataForDeviceOps:v31 optimizerDataForWeights:v32 optimizerDataForBias:v33];

  return 1;
}

- (unint64_t)allocatedDataSizeForTraining:(BOOL)a3 optimizer:(id)a4
{
  BOOL v4 = a3;
  id v34 = a4;
  v6 = [(MLCMultiheadAttentionLayer *)self weights];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    unint64_t v8 = 0;
    uint64_t v9 = 0;
    do
    {
      v10 = [(MLCMultiheadAttentionLayer *)self weights];
      uint64_t v11 = [v10 objectAtIndexedSubscript:v8];
      unint64_t v12 = [v11 descriptor];
      v9 += [v12 tensorAllocationSizeInBytes];

      if (v4)
      {
        uint64_t v13 = [(MLCMultiheadAttentionLayer *)self weights];
        id v14 = [v13 objectAtIndexedSubscript:v8];
        id v15 = [v14 descriptor];
        uint64_t v16 = [v15 tensorAllocationSizeInBytes];
        v9 += [v34 numOptimizerDataBuffers] * v16;
      }
      ++v8;
      unint64_t v17 = [(MLCMultiheadAttentionLayer *)self weights];
      unint64_t v18 = [v17 count];
    }
    while (v8 < v18);
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v19 = [(MLCMultiheadAttentionLayer *)self descriptor];
  if ([v19 hasBiases])
  {
  }
  else
  {
    int v20 = [(MLCMultiheadAttentionLayer *)self descriptor];
    int v21 = [v20 hasAttentionBiases];

    if (!v21)
    {
      uint64_t v22 = 0;
      goto LABEL_17;
    }
  }
  uint64_t v22 = 0;
  for (unint64_t i = 0; ; ++i)
  {
    v24 = [(MLCMultiheadAttentionLayer *)self biases];
    uint64_t v25 = [v24 count];
    uint64_t v26 = [(MLCMultiheadAttentionLayer *)self attentionBiases];
    unint64_t v27 = [v26 count] + v25;

    if (i >= v27) {
      break;
    }
    uint64_t v28 = [(MLCMultiheadAttentionLayer *)self biasesParameters];
    uint64_t v29 = [v28 objectAtIndexedSubscript:i];
    unint64_t v30 = [v29 tensor];
    v31 = [v30 descriptor];
    uint64_t v32 = [v31 tensorAllocationSizeInBytes];

    v22 += v32;
    if (v4) {
      v22 += [v34 numOptimizerDataBuffers] * v32;
    }
  }
LABEL_17:

  return v22 + v9;
}

- (id)resultTensorFromSources:(id)a3
{
  id v4 = a3;
  v5 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  for (unint64_t i = 0; ; ++i)
  {
    uint64_t v7 = [v4 objectAtIndexedSubscript:0];
    unint64_t v8 = [v7 descriptor];
    uint64_t v9 = [v8 shape];
    unint64_t v10 = [v9 count];

    if (i >= v10) {
      break;
    }
    uint64_t v11 = [v4 objectAtIndexedSubscript:0];
    unint64_t v12 = [v11 descriptor];
    uint64_t v13 = [v12 shape];
    id v14 = [v13 objectAtIndexedSubscript:i];
    unint64_t v15 = -[MLCLayer resultSizeFromSourceSize:dimension:](self, "resultSizeFromSourceSize:dimension:", [v14 unsignedIntegerValue], i);

    uint64_t v16 = [NSNumber numberWithUnsignedInteger:v15];
    [v5 setObject:v16 atIndexedSubscript:i];
  }
  unint64_t v17 = (void *)[v5 copy];
  unint64_t v18 = [v4 objectAtIndexedSubscript:0];
  uint64_t v19 = [v18 descriptor];
  int v20 = +[MLCTensorDescriptor descriptorWithShape:dataType:](MLCTensorDescriptor, "descriptorWithShape:dataType:", v17, [v19 dataType]);

  int v21 = +[MLCTensor tensorWithDescriptor:v20];

  return v21;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(MLCMultiheadAttentionLayer *)self descriptor];
  uint64_t v7 = [(MLCMultiheadAttentionLayer *)self weights];
  unint64_t v8 = [(MLCMultiheadAttentionLayer *)self biases];
  uint64_t v9 = [(MLCMultiheadAttentionLayer *)self attentionBiases];
  unint64_t v10 = [(MLCLayer *)self resultTensors];
  uint64_t v11 = [v3 stringWithFormat:@"%@: { descriptor=%@ : weights=%@ : biases=%@ : attentioBias=%@ : resultTensor=%@ }", v5, v6, v7, v8, v9, v10];

  return v11;
}

- (id)summarizedDOTDescription
{
  uint64_t v23 = NSString;
  v3 = (objc_class *)objc_opt_class();
  int v21 = NSStringFromClass(v3);
  NSUInteger v20 = [(MLCLayer *)self layerID];
  v24 = [(MLCMultiheadAttentionLayer *)self descriptor];
  uint64_t v19 = [v24 modelDimension];
  uint64_t v22 = [(MLCMultiheadAttentionLayer *)self descriptor];
  uint64_t v18 = [v22 keyDimension];
  id v4 = [(MLCMultiheadAttentionLayer *)self descriptor];
  uint64_t v5 = [v4 valueDimension];
  v6 = [(MLCMultiheadAttentionLayer *)self descriptor];
  uint64_t v7 = [v6 headCount];
  unint64_t v8 = [(MLCMultiheadAttentionLayer *)self descriptor];
  [v8 dropout];
  double v10 = v9;
  uint64_t v11 = [(MLCMultiheadAttentionLayer *)self descriptor];
  unsigned int v12 = [v11 hasBiases];
  uint64_t v13 = [(MLCMultiheadAttentionLayer *)self descriptor];
  unsigned int v14 = [v13 hasAttentionBiases];
  unint64_t v15 = [(MLCMultiheadAttentionLayer *)self descriptor];
  uint64_t v16 = [v23 stringWithFormat:@"<%@ (%lu)<BR /><FONT POINT-SIZE=\"10\">Model Dimension: %lu    Key Dimension: %lu    Value Dimension: %lu<BR />Head Count: %lu          Dropout: %.03f           Has Biases: %hhd<BR />Has Attention Biases: %hhd    Adds Zero Attention: %hhd</FONT>>", v21, v20, v19, v18, v5, v7, *(void *)&v10, v12, v14, objc_msgSend(v15, "addsZeroAttention")];

  return v16;
}

- (BOOL)isSupportedShapeForTensorSources:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    for (unint64_t i = 0; i < [v3 count]; ++i)
    {
      uint64_t v5 = [v3 objectAtIndexedSubscript:i];
      v6 = [v5 descriptor];
      uint64_t v7 = [v6 shape];
      unint64_t v8 = [v7 count];

      if (i > 2)
      {
        if (v8 < 2)
        {
LABEL_9:
          BOOL v9 = 0;
          goto LABEL_10;
        }
      }
      else if (v8 < 3)
      {
        goto LABEL_9;
      }
    }
  }
  BOOL v9 = 1;
LABEL_10:

  return v9;
}

- (void)linkAssociatedTensors
{
  id v3 = [(MLCMultiheadAttentionLayer *)self weights];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    unint64_t v5 = 0;
    do
    {
      v6 = [(MLCMultiheadAttentionLayer *)self weights];
      uint64_t v7 = [v6 objectAtIndexedSubscript:v5];
      unint64_t v8 = [v7 childLayers];
      [v8 addObject:self];

      ++v5;
      BOOL v9 = [(MLCMultiheadAttentionLayer *)self weights];
      unint64_t v10 = [v9 count];
    }
    while (v5 < v10);
  }
  uint64_t v11 = [(MLCMultiheadAttentionLayer *)self descriptor];
  int v12 = [v11 hasBiases];

  if (v12)
  {
    uint64_t v13 = [(MLCMultiheadAttentionLayer *)self biases];
    uint64_t v14 = [v13 count];

    if (v14)
    {
      unint64_t v15 = 0;
      do
      {
        uint64_t v16 = [(MLCMultiheadAttentionLayer *)self biases];
        unint64_t v17 = [v16 objectAtIndexedSubscript:v15];
        uint64_t v18 = [v17 childLayers];
        [v18 addObject:self];

        ++v15;
        uint64_t v19 = [(MLCMultiheadAttentionLayer *)self biases];
        unint64_t v20 = [v19 count];
      }
      while (v15 < v20);
    }
  }
  int v21 = [(MLCMultiheadAttentionLayer *)self descriptor];
  int v22 = [v21 hasAttentionBiases];

  if (v22)
  {
    uint64_t v23 = [(MLCMultiheadAttentionLayer *)self attentionBiases];
    uint64_t v24 = [v23 count];

    if (v24)
    {
      unint64_t v25 = 0;
      do
      {
        uint64_t v26 = [(MLCMultiheadAttentionLayer *)self attentionBiases];
        unint64_t v27 = [v26 objectAtIndexedSubscript:v25];
        uint64_t v28 = [v27 childLayers];
        [v28 addObject:self];

        ++v25;
        uint64_t v29 = [(MLCMultiheadAttentionLayer *)self attentionBiases];
        unint64_t v30 = [v29 count];
      }
      while (v25 < v30);
    }
  }
}

- (void)unlinkAssociatedTensors
{
  id v3 = [(MLCMultiheadAttentionLayer *)self weights];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    unint64_t v5 = 0;
    do
    {
      v6 = [(MLCMultiheadAttentionLayer *)self weights];
      uint64_t v7 = [v6 objectAtIndexedSubscript:v5];
      unint64_t v8 = [v7 childLayers];
      [v8 removeObject:self];

      ++v5;
      BOOL v9 = [(MLCMultiheadAttentionLayer *)self weights];
      unint64_t v10 = [v9 count];
    }
    while (v5 < v10);
  }
  uint64_t v11 = [(MLCMultiheadAttentionLayer *)self descriptor];
  int v12 = [v11 hasBiases];

  if (v12)
  {
    uint64_t v13 = [(MLCMultiheadAttentionLayer *)self biases];
    uint64_t v14 = [v13 count];

    if (v14)
    {
      unint64_t v15 = 0;
      do
      {
        uint64_t v16 = [(MLCMultiheadAttentionLayer *)self biases];
        unint64_t v17 = [v16 objectAtIndexedSubscript:v15];
        uint64_t v18 = [v17 childLayers];
        [v18 removeObject:self];

        ++v15;
        uint64_t v19 = [(MLCMultiheadAttentionLayer *)self biases];
        unint64_t v20 = [v19 count];
      }
      while (v15 < v20);
    }
  }
  int v21 = [(MLCMultiheadAttentionLayer *)self descriptor];
  int v22 = [v21 hasAttentionBiases];

  if (v22)
  {
    uint64_t v23 = [(MLCMultiheadAttentionLayer *)self attentionBiases];
    uint64_t v24 = [v23 count];

    if (v24)
    {
      unint64_t v25 = 0;
      do
      {
        uint64_t v26 = [(MLCMultiheadAttentionLayer *)self attentionBiases];
        unint64_t v27 = [v26 objectAtIndexedSubscript:v25];
        uint64_t v28 = [v27 childLayers];
        [v28 removeObject:self];

        ++v25;
        uint64_t v29 = [(MLCMultiheadAttentionLayer *)self attentionBiases];
        unint64_t v30 = [v29 count];
      }
      while (v25 < v30);
    }
  }
}

- (void)allocateGradientsForParameters
{
  id v3 = [(MLCMultiheadAttentionLayer *)self weights];
  id v13 = (id)[v3 mutableCopy];

  uint64_t v4 = [(MLCMultiheadAttentionLayer *)self descriptor];
  int v5 = [v4 hasBiases];

  if (v5)
  {
    v6 = [(MLCMultiheadAttentionLayer *)self biases];
    [v13 addObjectsFromArray:v6];
  }
  uint64_t v7 = [(MLCMultiheadAttentionLayer *)self descriptor];
  int v8 = [v7 hasAttentionBiases];

  if (v8)
  {
    BOOL v9 = [(MLCMultiheadAttentionLayer *)self attentionBiases];
    [v13 addObjectsFromArray:v9];
  }
  unint64_t v10 = [(MLCLayer *)self device];
  uint64_t v11 = [v10 computeEngine];
  int v12 = [(MLCLayer *)self deviceOps];
  [v11 allocateParameterGradientsForDeviceOps:v12 parameters:v13];
}

- (unint64_t)parametersCount
{
  id v3 = [(MLCMultiheadAttentionLayer *)self weightsParameters];
  unint64_t v4 = [v3 count];

  int v5 = [(MLCMultiheadAttentionLayer *)self biasesParameters];

  if (v5)
  {
    v6 = [(MLCMultiheadAttentionLayer *)self biasesParameters];
    v4 += [v6 count];
  }
  return v4;
}

- (MLCMultiheadAttentionDescriptor)descriptor
{
  return self->_descriptor;
}

- (NSArray)weights
{
  return self->_weights;
}

- (NSArray)biases
{
  return self->_biases;
}

- (NSArray)attentionBiases
{
  return self->_attentionBiases;
}

- (NSArray)weightsParameters
{
  return self->_weightsParameters;
}

- (NSArray)biasesParameters
{
  return self->_biasesParameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biasesParameters, 0);
  objc_storeStrong((id *)&self->_weightsParameters, 0);
  objc_storeStrong((id *)&self->_attentionBiases, 0);
  objc_storeStrong((id *)&self->_biases, 0);
  objc_storeStrong((id *)&self->_weights, 0);

  objc_storeStrong((id *)&self->_descriptor, 0);
}

- (void)initWithDescriptor:(const char *)a1 weights:bias:attentionBias:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: bias is set in descriptor but not provided", v4, v5, v6, v7, v8);
}

- (void)initWithDescriptor:(const char *)a1 weights:bias:attentionBias:.cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: attentionBias is set in descriptor but not provided", v4, v5, v6, v7, v8);
}

- (void)initWithDescriptor:(const char *)a1 weights:bias:attentionBias:.cold.3(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: value attention bias must of size modelDimension", v4, v5, v6, v7, v8);
}

- (void)initWithDescriptor:(const char *)a1 weights:bias:attentionBias:.cold.4(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: key attention bias must of size modelDimension", v4, v5, v6, v7, v8);
}

- (void)initWithDescriptor:(const char *)a1 weights:bias:attentionBias:.cold.5(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: output bias must of size modelDimension", v4, v5, v6, v7, v8);
}

- (void)initWithDescriptor:(const char *)a1 weights:bias:attentionBias:.cold.6(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: value bias must of size modelDimension", v4, v5, v6, v7, v8);
}

- (void)initWithDescriptor:(const char *)a1 weights:bias:attentionBias:.cold.7(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: key bias must of size modelDimension", v4, v5, v6, v7, v8);
}

- (void)initWithDescriptor:(const char *)a1 weights:bias:attentionBias:.cold.8(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: query bias must of size modelDimension", v4, v5, v6, v7, v8);
}

- (void)initWithDescriptor:(const char *)a1 weights:bias:attentionBias:.cold.9(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: output weights must be of shape modelDimension x modelDimension", v4, v5, v6, v7, v8);
}

- (void)initWithDescriptor:(const char *)a1 weights:bias:attentionBias:.cold.10(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: value weights must be of shape modelDimension x valueDimension", v4, v5, v6, v7, v8);
}

- (void)initWithDescriptor:(const char *)a1 weights:bias:attentionBias:.cold.11(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: key weights must be of shape modelDimension x keyDimension", v4, v5, v6, v7, v8);
}

- (void)initWithDescriptor:(const char *)a1 weights:bias:attentionBias:.cold.12(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: query weights must be of shape modelDimension x modelDimension", v4, v5, v6, v7, v8);
}

- (void)initWithDescriptor:(const char *)a1 weights:bias:attentionBias:.cold.13(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: attentionBias is not set in descriptor but provided", v4, v5, v6, v7, v8);
}

- (void)initWithDescriptor:(const char *)a1 weights:bias:attentionBias:.cold.14(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: attentionBias must be an array of size 2", v4, v5, v6, v7, v8);
}

- (void)initWithDescriptor:(const char *)a1 weights:bias:attentionBias:.cold.15(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: bias is not set in descriptor but provided", v4, v5, v6, v7, v8);
}

- (void)initWithDescriptor:(const char *)a1 weights:bias:attentionBias:.cold.16(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: bias must be an array of size four", v4, v5, v6, v7, v8);
}

- (void)initWithDescriptor:(const char *)a1 weights:bias:attentionBias:.cold.17(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: weights must be an array of size four corresponding to query, key, value and output projections respectively", v4, v5, v6, v7, v8);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: attention mask is a 3D tensor of shape 1 x targetLength x sourceLength or (batch x headCount) x targetLength x sourceLength", v4, v5, v6, v7, v8);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.3(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: key mask is a 2D BOOLean tensor of shape batch x sourceLength", v4, v5, v6, v7, v8);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.4(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: key mask is a 2D BOOLean tensor of shape batch x sourceLength and attention mask is a 3D tensor of shape 1 x targetLength x sourceLength or (batch x headCount) x targetLength x sourceLength", v4, v5, v6, v7, v8);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.5(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: output must of of shape batch x targetLength x modelDim", v4, v5, v6, v7, v8);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.6(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: value must of of shape batch x sourceLength x valueDimension", v4, v5, v6, v7, v8);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.7(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: key must be of shape batch x sourceLength x keyDimension", v4, v5, v6, v7, v8);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.8(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: query must be of shape batch x targetLength x modelDim", v4, v5, v6, v7, v8);
}

@end