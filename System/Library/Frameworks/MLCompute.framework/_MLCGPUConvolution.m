@interface _MLCGPUConvolution
+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6;
+ (BOOL)setOptimizerDataForDevice:(id)a3 deviceOps:(id)a4 weights:(id)a5 bias:(id)a6;
+ (id)layerWithDevice:(id)a3 weights:(id)a4 biasTerms:(id)a5 descriptor:(id)a6 neuronDescriptor:(id)a7;
+ (void)setGradientComputeWeightsAndBiasOnly:(id)a3 deviceOps:(id)a4;
- (_MLCGPUConvolution)initWithDevice:(id)a3 weights:(id)a4 biasTerms:(id)a5 descriptor:(id)a6 neuronDescriptor:(id)a7;
@end

@implementation _MLCGPUConvolution

- (_MLCGPUConvolution)initWithDevice:(id)a3 weights:(id)a4 biasTerms:(id)a5 descriptor:(id)a6 neuronDescriptor:(id)a7
{
  v166[1] = *MEMORY[0x1E4F143B8];
  id v152 = a3;
  id v151 = a4;
  id v150 = a5;
  id v13 = a6;
  id v14 = a7;
  v155.receiver = self;
  v155.super_class = (Class)_MLCGPUConvolution;
  v15 = [(_MLCGPUConvolution *)&v155 init];
  v16 = v15;
  if (!v15)
  {
LABEL_90:
    v129 = v16;
    goto LABEL_91;
  }
  v133 = v15;
  v139 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  unint64_t v17 = 0x1E4F1C000;
  id v138 = v14;
  BOOL v146 = +[MLCPlatformInfo gpuUseMPSGraphConvolution];
  if (v146)
  {
    uint64_t v134 = 0;
    v135 = 0;
    BOOL v140 = 1;
LABEL_25:
    v36 = [v152 deviceList];
    uint64_t v37 = [v36 count];

    if (v37)
    {
      unint64_t v38 = 0;
      do
      {
        if (v146)
        {
          uint64_t v39 = objc_opt_new();
          uint64_t v144 = objc_opt_new();
          v40 = +[MLCConvolutionGPUDeviceOps deviceOpsWithForwardMPSGraph:gradientMPSGraph:](MLCConvolutionGPUDeviceOps, "deviceOpsWithForwardMPSGraph:gradientMPSGraph:", v39);
          [v40 setIsMPSGraph:1];
          int v41 = [v13 paddingPolicy];
          if (v41) {
            uint64_t v42 = v41 == 1;
          }
          else {
            uint64_t v42 = 2;
          }
          v148 = (void *)v39;
          uint64_t v141 = v42;
          if ([v13 isConvolutionTranspose]) {
            uint64_t v43 = [v13 outputFeatureChannelCount];
          }
          else {
            uint64_t v43 = [v13 inputFeatureChannelCount];
          }
          unint64_t v48 = v43;
          unint64_t v49 = [v13 groupCount];
          if ([v13 isConvolutionTranspose]) {
            uint64_t v50 = [v13 inputFeatureChannelCount];
          }
          else {
            uint64_t v50 = [v13 outputFeatureChannelCount];
          }
          uint64_t v59 = v50;
          unint64_t v147 = v38;
          if ([v13 usesDepthwiseConvolution])
          {
            uint64_t v143 = objc_msgSend(MEMORY[0x1E4F35A40], "descriptorWithStrideInX:strideInY:dilationRateInX:dilationRateInY:paddingLeft:paddingRight:paddingTop:paddingBottom:paddingStyle:dataLayout:weightsLayout:", objc_msgSend(v13, "strideInX"), objc_msgSend(v13, "strideInY"), objc_msgSend(v13, "dilationRateInX"), objc_msgSend(v13, "dilationRateInY"), objc_msgSend(v13, "paddingSizeInX"), objc_msgSend(v13, "paddingSizeInX"), objc_msgSend(v13, "paddingSizeInY"), objc_msgSend(v13, "paddingSizeInY"), v141, 0, 3);
            v60 = objc_msgSend(MEMORY[0x1E4F35A40], "descriptorWithStrideInX:strideInY:dilationRateInX:dilationRateInY:paddingLeft:paddingRight:paddingTop:paddingBottom:paddingStyle:dataLayout:weightsLayout:", objc_msgSend(v13, "strideInX"), objc_msgSend(v13, "strideInY"), objc_msgSend(v13, "dilationRateInX"), objc_msgSend(v13, "dilationRateInY"), objc_msgSend(v13, "paddingSizeInX"), objc_msgSend(v13, "paddingSizeInX"), objc_msgSend(v13, "paddingSizeInY"), objc_msgSend(v13, "paddingSizeInY"), v141, 1, 3);
            v61 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "kernelHeight"));
            v165[0] = v61;
            v62 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "kernelWidth"));
            v165[1] = v62;
            v63 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "inputFeatureChannelCount"));
            v165[2] = v63;
            v64 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "outputFeatureChannelCount")/ (unint64_t)objc_msgSend(v13, "inputFeatureChannelCount"));
            v165[3] = v64;
            v65 = [MEMORY[0x1E4F1C978] arrayWithObjects:v165 count:4];
            v66 = [v151 descriptor];
            v67 = objc_msgSend(v148, "placeholderWithShape:dataType:name:", v65, GPU_GetDataType(objc_msgSend(v66, "dataType")), 0);

            [v40 setDepthWiseConvolution:1];
          }
          else
          {
            unint64_t v136 = v48 / v49;
            uint64_t v143 = objc_msgSend(MEMORY[0x1E4F35A38], "descriptorWithStrideInX:strideInY:dilationRateInX:dilationRateInY:groups:paddingLeft:paddingRight:paddingTop:paddingBottom:paddingStyle:dataLayout:weightsLayout:", objc_msgSend(v13, "strideInX"), objc_msgSend(v13, "strideInY"), objc_msgSend(v13, "dilationRateInX"), objc_msgSend(v13, "dilationRateInY"), objc_msgSend(v13, "groupCount"), objc_msgSend(v13, "paddingSizeInX"), objc_msgSend(v13, "paddingSizeInX"), objc_msgSend(v13, "paddingSizeInY"), objc_msgSend(v13, "paddingSizeInY"), v141, 0, 3);
            v60 = objc_msgSend(MEMORY[0x1E4F35A38], "descriptorWithStrideInX:strideInY:dilationRateInX:dilationRateInY:groups:paddingLeft:paddingRight:paddingTop:paddingBottom:paddingStyle:dataLayout:weightsLayout:", objc_msgSend(v13, "strideInX"), objc_msgSend(v13, "strideInY"), objc_msgSend(v13, "dilationRateInX"), objc_msgSend(v13, "dilationRateInY"), objc_msgSend(v13, "groupCount"), objc_msgSend(v13, "paddingSizeInX"), objc_msgSend(v13, "paddingSizeInX"), objc_msgSend(v13, "paddingSizeInY"), objc_msgSend(v13, "paddingSizeInY"), v141, 1, 3);
            objc_msgSend(v40, "setConvolutionTranspose:", objc_msgSend(v13, "isConvolutionTranspose"));
            v68 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "kernelHeight"));
            v164[0] = v68;
            v69 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "kernelWidth"));
            v164[1] = v69;
            v70 = [NSNumber numberWithUnsignedInteger:v136];
            v164[2] = v70;
            v71 = [NSNumber numberWithUnsignedInteger:v59];
            v164[3] = v71;
            v72 = [MEMORY[0x1E4F1C978] arrayWithObjects:v164 count:4];
            v73 = [v151 descriptor];
            v67 = objc_msgSend(v148, "placeholderWithShape:dataType:name:", v72, GPU_GetDataType(objc_msgSend(v73, "dataType")), 0);
          }
          v74 = [v40 descriptorsForMPSGraph];
          v45 = (void *)v143;
          objc_msgSend(v74, "setObject:atIndexedSubscript:");

          v75 = [v40 descriptorsForMPSGraph];
          [v75 setObject:v60 atIndexedSubscript:1];

          if (v138)
          {
            v76 = [v40 descriptorsForMPSGraph];
            [v76 setObject:v138 atIndexedSubscript:2];
          }
          v163 = v67;
          unint64_t v17 = 0x1E4F1C000uLL;
          v77 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v163 count:1];
          v78 = (void *)[v77 mutableCopy];
          [v40 setMpsGraphTensors:v78];

          if (v150)
          {
            objc_msgSend(v40, "setBiasChannelCount:", objc_msgSend(v13, "outputFeatureChannelCount"));
            v162[0] = &unk_1F3876480;
            v79 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v40, "biasChannelCount"));
            v162[1] = v79;
            v162[2] = &unk_1F3876480;
            v162[3] = &unk_1F3876480;
            v80 = [MEMORY[0x1E4F1C978] arrayWithObjects:v162 count:4];
            v81 = [v150 descriptor];
            v82 = objc_msgSend(v148, "placeholderWithShape:dataType:name:", v80, GPU_GetDataType(objc_msgSend(v81, "dataType")), 0);

            v83 = [v40 mpsGraphTensors];
            [v83 addObject:v82];

            [v40 setHasBias:1];
            unint64_t v17 = 0x1E4F1C000;
          }
          else
          {
            [v40 setHasBias:0];
          }
          unint64_t v38 = v147;
          v58 = (void *)v144;

          v46 = v148;
        }
        else
        {
          v44 = [v152 deviceList];
          v45 = [v44 objectAtIndexedSubscript:v38];

          if (v140)
          {
            if ([v13 isConvolutionTranspose])
            {
              v46 = (void *)[objc_alloc(MEMORY[0x1E4F35408]) initWithDevice:v45 weights:v135];
              v47 = (objc_class *)MEMORY[0x1E4F35410];
            }
            else
            {
              v46 = (void *)[objc_alloc(MEMORY[0x1E4F353E8]) initWithDevice:v45 weights:v135];
              v47 = (objc_class *)MEMORY[0x1E4F353F8];
            }
            v58 = (void *)[[v47 alloc] initWithDevice:v45 weights:v135];
          }
          else
          {
            v51 = [v151 childLayers];
            v52 = [v51 objectAtIndexedSubscript:v134];
            v53 = [v52 deviceOps];
            v54 = [v53 objectAtIndexedSubscript:v38];

            [v13 isConvolutionTranspose];
            v55 = [v54 forwardKernel];
            v56 = [v54 gradientKernel];
            v46 = (void *)[v55 copy];
            uint64_t v57 = [v56 copy];

            v58 = (void *)v57;
          }
          v40 = 0;
          if (v46 && v58)
          {
            v40 = +[MLCGPUDeviceOps deviceOpsWithForwardKernel:v46 gradientKernel:v58];
          }
        }

        if (!v40) {
          goto LABEL_88;
        }
        v84 = [v152 deviceList];
        unint64_t v85 = [v84 count];

        if (v85 >= 2)
        {
          if (v150)
          {
            v160[0] = v151;
            v160[1] = v150;
            v86 = *(void **)(v17 + 2424);
            v87 = (id *)v160;
            uint64_t v88 = 2;
          }
          else
          {
            id v161 = v151;
            v86 = *(void **)(v17 + 2424);
            v87 = &v161;
            uint64_t v88 = 1;
          }
          v89 = [v86 arrayWithObjects:v87 count:v88];
          int v90 = [v40 isMPSGraph];
          v91 = +[MLCMultiGPUDeviceOps multiGPUDeviceOpsWithGPUDeviceOps:v40];
          if (v90)
          {
            [v40 setConvolutionMultiGPUChildOps:v91];
            GPU_AllocateResourceForMultiGPUTraining(v152, v91, v89, v38);
          }
          else
          {

            GPU_AllocateResourceForMultiGPUTraining(v152, v91, v89, v38);
            v40 = v91;
          }
        }
        [v40 setLayer:objc_opt_class()];
        [v40 setSourceOfForwardNeededForGradient:1];
        [v40 setResultOfForwardNeededForGradient:0];
        if (![v40 isMPSGraph])
        {
          if ([v13 isConvolutionTranspose]) {
            [v40 setLayer:objc_opt_class()];
          }
          goto LABEL_87;
        }
        if (v38)
        {
          if (!v150) {
            goto LABEL_86;
          }
        }
        else
        {
          if ([v152 needToAllocateDeviceMemoryForTensor:v151]) {
            [v152 allocateDeviceMemoryForTensor:v151];
          }
          v92 = [v151 deviceMemory];
          v93 = [v92 objectAtIndexedSubscript:0];

          int v94 = [v13 isConvolutionTranspose];
          id v95 = [v151 data];
          uint64_t v149 = [v95 bytes];
          id v96 = v93;
          uint64_t v97 = [v96 contents];
          uint64_t v98 = [v13 kernelWidth];
          uint64_t v99 = [v13 kernelHeight];
          unint64_t v100 = [v13 inputFeatureChannelCount];
          if (v94)
          {
            unint64_t v101 = [v13 outputFeatureChannelCount];
            unint64_t v145 = v101 / [v13 groupCount];
            v102 = [v151 descriptor];
            LODWORD(v132) = [v102 dataType];
            BOOL v103 = +[MLCDataHelper convertSourceOIHW:v149 toResultHWOI:v97 width:v98 height:v99 inputFeatureChannelCount:v100 outputFeatureChannelCount:v145 dataType:v132];
          }
          else
          {
            uint64_t v137 = v99;
            v142 = v95;
            unint64_t v104 = [v13 groupCount];
            int v105 = [v13 usesDepthwiseConvolution];
            unint64_t v106 = [v13 outputFeatureChannelCount];
            if (v105) {
              v106 /= (unint64_t)[v13 inputFeatureChannelCount];
            }
            v107 = [v151 descriptor];
            LODWORD(v132) = [v107 dataType];
            BOOL v103 = +[MLCDataHelper convertSourceOIHW:v149 toResultHWIO:v97 width:v98 height:v137 inputFeatureChannelCount:v100 / v104 outputFeatureChannelCount:v106 dataType:v132];
          }
          unint64_t v17 = 0x1E4F1C000uLL;
          unint64_t v38 = 0;
          if (!v103)
          {
            v108 = +[MLCLog framework];
            if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR)) {
              -[_MLCGPUConvolution initWithDevice:weights:biasTerms:descriptor:neuronDescriptor:](buf, &v159, v108);
            }
          }
          +[MLCGPUHelper didModifyRange:buffer:](MLCGPUHelper, "didModifyRange:buffer:", 0, [v96 length], v96);

          if (!v150)
          {
LABEL_86:
            v116 = [v151 deviceMemory];
            v117 = [v116 objectAtIndexedSubscript:v38];
            v156 = v117;
            v118 = [*(id *)(v17 + 2424) arrayWithObjects:&v156 count:1];
            unint64_t v119 = v38;
            v120 = (void *)[v118 copy];
            [v40 setExportableState:v120];

            unint64_t v38 = v119;
            goto LABEL_87;
          }
          if ([v152 needToAllocateDeviceMemoryForTensor:v150]) {
            [v152 allocateDeviceMemoryForTensor:v150];
          }
          [v152 broadcastTensor:v150];
        }
        v109 = [v151 deviceMemory];
        v110 = [v109 objectAtIndexedSubscript:v38];
        v157[0] = v110;
        v111 = [v150 deviceMemory];
        [v111 objectAtIndexedSubscript:v38];
        v113 = unint64_t v112 = v38;
        v157[1] = v113;
        v114 = [*(id *)(v17 + 2424) arrayWithObjects:v157 count:2];
        v115 = (void *)[v114 copy];
        [v40 setExportableState:v115];

        unint64_t v17 = 0x1E4F1C000;
        unint64_t v38 = v112;

LABEL_87:
        [v139 addObject:v40];

LABEL_88:
        ++v38;
        v121 = [v152 deviceList];
        unint64_t v122 = [v121 count];
      }
      while (v38 < v122);
    }
    v123 = (void *)[v139 copy];
    v154.receiver = v133;
    v154.super_class = (Class)_MLCGPUConvolution;
    [(_MLCGPULayer *)&v154 setDeviceOps:v123];

    v153.receiver = v133;
    v153.super_class = (Class)_MLCGPUConvolution;
    v124 = [(_MLCGPULayer *)&v153 deviceOps];
    int v125 = [v13 paddingPolicy];
    uint64_t v126 = [v13 paddingSizeInX];
    uint64_t v127 = [v13 paddingSizeInY];
    int v128 = v125;
    v16 = v133;
    GPU_SetPaddingPolicyForLayer(v152, v124, v128, v126, v127);

    id v14 = v138;
    goto LABEL_90;
  }
  v18 = [v151 childLayers];
  uint64_t v19 = [v18 count];

  if (v19)
  {
    uint64_t v20 = 0;
    while (1)
    {
      v21 = [v151 childLayers];
      v22 = [v21 objectAtIndexedSubscript:v20];
      v23 = [v22 deviceOps];
      uint64_t v24 = v20;
      uint64_t v25 = [v23 count];

      BOOL v140 = v25 == 0;
      if (v25) {
        break;
      }
      v26 = [v151 childLayers];
      unint64_t v27 = [v26 count];

      uint64_t v20 = v24 + 1;
      if (v24 + 1 >= v27)
      {
        uint64_t v134 = 0;
        goto LABEL_11;
      }
    }
    uint64_t v134 = v24;
LABEL_11:
    id v14 = v138;
    unint64_t v17 = 0x1E4F1C000uLL;
  }
  else
  {
    uint64_t v134 = 0;
    BOOL v140 = 1;
  }
  v166[0] = v151;
  v28 = [*(id *)(v17 + 2424) arrayWithObjects:v166 count:1];
  v29 = (void *)[v28 mutableCopy];

  if (v150) {
    [v29 addObject:v150];
  }
  v30 = GPU_GetDataSourceFromTensors(v29);
  v31 = v30;
  if (v30)
  {
    v32 = [v30 neuronDesc];
    BOOL v33 = v32 != 0;

    char v34 = (v138 != 0) ^ v33;
    id v14 = v138;
    if ((v34 & 1) == 0)
    {
      v135 = v31;
LABEL_24:

      goto LABEL_25;
    }
  }
  else if (!v140)
  {
    v135 = 0;
    goto LABEL_24;
  }
  if (v14) {
    +[_MLCGPUWeightsConvolution weightWithDescriptor:v13 biasTerms:v150 weights:v151 neuronDescriptor:v14];
  }
  else {
  v35 = +[_MLCGPUWeightsConvolution weightWithDescriptor:v13 biasTerms:v150 weights:v151];
  }

  if (v35)
  {
    v135 = v35;
    GPU_AssociateDataSourceToTensors(v35, v29);
    goto LABEL_24;
  }
  v131 = +[MLCLog framework];
  if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR)) {
    -[_MLCGPUConvolution initWithDevice:weights:biasTerms:descriptor:neuronDescriptor:](a2, v131);
  }

  v129 = 0;
  v16 = v133;
LABEL_91:

  return v129;
}

+ (BOOL)setOptimizerDataForDevice:(id)a3 deviceOps:(id)a4 weights:(id)a5 bias:(id)a6
{
  v72[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v62 = a4;
  id v10 = a5;
  id v11 = a6;
  v63 = v9;
  v12 = [v9 deviceList];
  uint64_t v13 = [v12 count];

  if (v13)
  {
    unint64_t v14 = 0;
    while (1)
    {
      v15 = [v62 objectAtIndexedSubscript:v14];
      v16 = [v10 optimizerDeviceData];
      unint64_t v17 = [v16 objectAtIndexedSubscript:v14];
      v18 = [v17 momentumVectors];

      uint64_t v19 = [v10 optimizerDeviceData];
      uint64_t v20 = [v19 objectAtIndexedSubscript:v14];
      v21 = [v20 velocityVectors];

      v22 = [v10 optimizerDeviceData];
      v23 = [v22 objectAtIndexedSubscript:v14];
      uint64_t v24 = [v23 centerWeightVectors];

      if (v11) {
        break;
      }
      v51 = [v10 optimizerData];
      uint64_t v52 = [v51 count];

      if (!v52) {
        goto LABEL_14;
      }
      v53 = [v18 objectAtIndexedSubscript:0];
      v72[0] = v53;
      v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:1];
      [v15 setMomentumVectors:v54];

      v55 = [v10 optimizerData];
      unint64_t v56 = [v55 count];

      if (v56 < 2) {
        goto LABEL_14;
      }
      uint64_t v57 = [v21 objectAtIndexedSubscript:0];
      v71 = v57;
      v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v71 count:1];
      [v15 setVelocityVectors:v58];

      uint64_t v59 = [v10 optimizerData];
      unint64_t v60 = [v59 count];

      if (v60 < 3) {
        goto LABEL_14;
      }
      unint64_t v27 = [v24 objectAtIndexedSubscript:0];
      v70 = v27;
      v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v70 count:1];
      [v15 setCenterWeightVectors:v30];
LABEL_13:

LABEL_14:
      ++v14;
      unint64_t v49 = [v63 deviceList];
      unint64_t v50 = [v49 count];

      if (v14 >= v50) {
        goto LABEL_20;
      }
    }
    v64 = v24;
    v65 = v21;
    v66 = v18;
    uint64_t v25 = [v11 optimizerDeviceData];
    v26 = [v25 objectAtIndexedSubscript:v14];
    unint64_t v27 = [v26 momentumVectors];

    v28 = [v11 optimizerDeviceData];
    v29 = [v28 objectAtIndexedSubscript:v14];
    v30 = [v29 velocityVectors];

    v31 = [v11 optimizerDeviceData];
    v32 = [v31 objectAtIndexedSubscript:v14];
    BOOL v33 = [v32 centerWeightVectors];

    char v34 = [v10 optimizerData];
    if (![v34 count]) {
      goto LABEL_11;
    }
    v35 = [v11 optimizerData];
    uint64_t v36 = [v35 count];

    if (v36)
    {
      uint64_t v37 = [v66 objectAtIndexedSubscript:0];
      v69[0] = v37;
      unint64_t v38 = [v27 objectAtIndexedSubscript:0];
      v69[1] = v38;
      uint64_t v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:2];
      [v15 setMomentumVectors:v39];

      char v34 = [v10 optimizerData];
      if ((unint64_t)[v34 count] < 2) {
        goto LABEL_11;
      }
      v40 = [v11 optimizerData];
      unint64_t v41 = [v40 count];

      if (v41 < 2) {
        goto LABEL_12;
      }
      uint64_t v42 = [v65 objectAtIndexedSubscript:0];
      v68[0] = v42;
      uint64_t v43 = [v30 objectAtIndexedSubscript:0];
      v68[1] = v43;
      v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:2];
      [v15 setVelocityVectors:v44];

      char v34 = [v10 optimizerData];
      if ((unint64_t)[v34 count] < 3)
      {
LABEL_11:

        goto LABEL_12;
      }
      v45 = [v11 optimizerData];
      unint64_t v46 = [v45 count];

      if (v46 >= 3)
      {
        char v34 = [v64 objectAtIndexedSubscript:0];
        v67[0] = v34;
        v47 = [v33 objectAtIndexedSubscript:0];
        v67[1] = v47;
        unint64_t v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:2];
        [v15 setCenterWeightVectors:v48];

        goto LABEL_11;
      }
    }
LABEL_12:

    v21 = v65;
    v18 = v66;
    uint64_t v24 = v64;
    goto LABEL_13;
  }
LABEL_20:

  return 1;
}

+ (void)setGradientComputeWeightsAndBiasOnly:(id)a3 deviceOps:(id)a4
{
  id v13 = a3;
  id v5 = a4;
  v6 = [v13 deviceList];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    unint64_t v8 = 0;
    do
    {
      id v9 = [v5 objectAtIndexedSubscript:v8];
      [v9 setComputeWeightsAndBiasOnly:1];
      if (([v9 isMPSGraph] & 1) == 0)
      {
        id v10 = [v9 gradientKernel];
        [v10 setGradientOption:2];
      }
      ++v8;
      id v11 = [v13 deviceList];
      unint64_t v12 = [v11 count];
    }
    while (v8 < v12);
  }
}

+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6
{
  v285[4] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v267 = a5;
  id v266 = a6;
  v257 = v9;
  id v11 = [v9 deviceList];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    unint64_t v13 = 0;
    id v228 = v10;
    while (1)
    {
      unint64_t v14 = objc_msgSend(v10, "objectAtIndexedSubscript:", v13, v228);
      if ([v14 isMPSGraph])
      {
        v244 = v14;
        v268 = [v10 objectAtIndexedSubscript:v13];
        v258 = [v268 forwardMPSGraph];
        v265 = [v268 gradientMPSGraph];
        v15 = [v267 objectAtIndexedSubscript:0];
        v16 = [v15 descriptor];
        unsigned int DataType = GPU_GetDataType([v16 dataType]);

        unint64_t v17 = [v267 objectAtIndexedSubscript:0];
        v18 = [v17 descriptor];
        uint64_t v19 = [v18 shape];
        uint64_t v20 = [v19 count];

        unint64_t v245 = v13;
        switch(v20)
        {
          case 1:
            v285[0] = &unk_1F3876480;
            v285[1] = &unk_1F3876480;
            v285[2] = &unk_1F3876480;
            v21 = [v267 objectAtIndexedSubscript:0];
            v22 = [v21 descriptor];
            v23 = [v22 shape];
            uint64_t v24 = [v23 objectAtIndexedSubscript:0];
            v285[3] = v24;
            v263 = [MEMORY[0x1E4F1C978] arrayWithObjects:v285 count:4];

            v284[0] = &unk_1F3876480;
            v284[1] = &unk_1F3876480;
            v284[2] = &unk_1F3876480;
            uint64_t v25 = [v267 objectAtIndexedSubscript:0];
            v26 = [v25 descriptor];
            unint64_t v27 = [v26 shape];
            v28 = [v27 objectAtIndexedSubscript:0];
            v284[3] = v28;
            v254 = [MEMORY[0x1E4F1C978] arrayWithObjects:v284 count:4];
            goto LABEL_11;
          case 2:
            v40 = [v267 objectAtIndexedSubscript:0];
            unint64_t v41 = [v40 descriptor];
            uint64_t v42 = [v41 shape];
            uint64_t v43 = [v42 objectAtIndexedSubscript:0];
            v283[0] = v43;
            v283[1] = &unk_1F3876480;
            v283[2] = &unk_1F3876480;
            v44 = [v267 objectAtIndexedSubscript:0];
            v45 = [v44 descriptor];
            unint64_t v46 = [v45 shape];
            v47 = [v46 objectAtIndexedSubscript:1];
            v283[3] = v47;
            v263 = [MEMORY[0x1E4F1C978] arrayWithObjects:v283 count:4];

            uint64_t v25 = [v267 objectAtIndexedSubscript:0];
            v26 = [v25 descriptor];
            unint64_t v27 = [v26 shape];
            v28 = [v27 objectAtIndexedSubscript:0];
            v282[0] = v28;
            v282[1] = &unk_1F3876480;
            v282[2] = &unk_1F3876480;
            unint64_t v48 = [v267 objectAtIndexedSubscript:0];
            unint64_t v49 = [v48 descriptor];
            unint64_t v50 = [v49 shape];
            v51 = [v50 objectAtIndexedSubscript:1];
            v282[3] = v51;
            v254 = [MEMORY[0x1E4F1C978] arrayWithObjects:v282 count:4];

            unint64_t v13 = v245;
LABEL_11:

            goto LABEL_16;
          case 3:
            v259 = [v267 objectAtIndexedSubscript:0];
            v255 = [v259 descriptor];
            v249 = [v255 shape];
            uint64_t v52 = [v249 objectAtIndexedSubscript:0];
            v281[0] = v52;
            v281[1] = &unk_1F3876480;
            v53 = [v267 objectAtIndexedSubscript:0];
            v54 = [v53 descriptor];
            v55 = [v54 shape];
            unint64_t v56 = [v55 objectAtIndexedSubscript:2];
            v281[2] = v56;
            uint64_t v57 = [v267 objectAtIndexedSubscript:0];
            v58 = [v57 descriptor];
            uint64_t v59 = [v58 shape];
            unint64_t v60 = [v59 objectAtIndexedSubscript:1];
            v281[3] = v60;
            v263 = [MEMORY[0x1E4F1C978] arrayWithObjects:v281 count:4];

            uint64_t v25 = [v267 objectAtIndexedSubscript:0];
            v26 = [v25 descriptor];
            v61 = [v26 shape];
            v260 = [v61 objectAtIndexedSubscript:0];
            v280[0] = v260;
            v250 = [v267 objectAtIndexedSubscript:0];
            id v62 = [v250 descriptor];
            v63 = [v62 shape];
            v64 = [v63 objectAtIndexedSubscript:1];
            v280[1] = v64;
            v280[2] = &unk_1F3876480;
            v65 = [v267 objectAtIndexedSubscript:0];
            v66 = [v65 descriptor];
            v67 = [v66 shape];
            v68 = [v67 objectAtIndexedSubscript:2];
            v280[3] = v68;
            v254 = [MEMORY[0x1E4F1C978] arrayWithObjects:v280 count:4];

            unint64_t v13 = v245;
            goto LABEL_16;
          case 4:
            v238 = [v267 objectAtIndexedSubscript:0];
            v261 = [v238 descriptor];
            v256 = [v261 shape];
            v251 = [v256 objectAtIndexedSubscript:0];
            v279[0] = v251;
            v246 = [v267 objectAtIndexedSubscript:0];
            v242 = [v246 descriptor];
            v240 = [v242 shape];
            v69 = [v240 objectAtIndexedSubscript:2];
            v279[1] = v69;
            v70 = [v267 objectAtIndexedSubscript:0];
            v71 = [v70 descriptor];
            v72 = [v71 shape];
            v73 = [v72 objectAtIndexedSubscript:3];
            v279[2] = v73;
            v74 = [v267 objectAtIndexedSubscript:0];
            v75 = [v74 descriptor];
            v76 = [v75 shape];
            [v76 objectAtIndexedSubscript:1];
            v78 = unint64_t v77 = v13;
            v279[3] = v78;
            v263 = [MEMORY[0x1E4F1C978] arrayWithObjects:v279 count:4];

            unint64_t v13 = v77;
            v79 = v267;
            goto LABEL_15;
          default:
            v80 = [v267 objectAtIndexedSubscript:0];
            v81 = [v80 descriptor];
            v263 = [v81 shape];

            v79 = v267;
LABEL_15:
            uint64_t v25 = [v79 objectAtIndexedSubscript:0];
            v26 = [v25 descriptor];
            v254 = [v26 shape];
LABEL_16:

            v82 = [v266 descriptor];
            v83 = [v82 shape];
            uint64_t v84 = [v83 count];

            switch(v84)
            {
              case 1:
                v278[0] = &unk_1F3876480;
                v278[1] = &unk_1F3876480;
                v278[2] = &unk_1F3876480;
                unint64_t v85 = [v266 descriptor];
                v86 = [v85 shape];
                v87 = [v86 objectAtIndexedSubscript:0];
                v278[3] = v87;
                v262 = [MEMORY[0x1E4F1C978] arrayWithObjects:v278 count:4];

                v277[0] = &unk_1F3876480;
                v277[1] = &unk_1F3876480;
                v277[2] = &unk_1F3876480;
                uint64_t v88 = [v266 descriptor];
                v89 = [v88 shape];
                int v90 = [v89 objectAtIndexedSubscript:0];
                v277[3] = v90;
                v241 = [MEMORY[0x1E4F1C978] arrayWithObjects:v277 count:4];
                goto LABEL_21;
              case 2:
                v91 = [v266 descriptor];
                v92 = [v91 shape];
                v93 = [v92 objectAtIndexedSubscript:0];
                v276[0] = v93;
                v276[1] = &unk_1F3876480;
                v276[2] = &unk_1F3876480;
                int v94 = [v266 descriptor];
                id v95 = [v94 shape];
                id v96 = [v95 objectAtIndexedSubscript:1];
                v276[3] = v96;
                v262 = [MEMORY[0x1E4F1C978] arrayWithObjects:v276 count:4];

                uint64_t v88 = [v266 descriptor];
                v89 = [v88 shape];
                int v90 = [v89 objectAtIndexedSubscript:0];
                v275[0] = v90;
                v275[1] = &unk_1F3876480;
                v275[2] = &unk_1F3876480;
                uint64_t v97 = [v266 descriptor];
                uint64_t v98 = [v97 shape];
                uint64_t v99 = [v98 objectAtIndexedSubscript:1];
                v275[3] = v99;
                v241 = [MEMORY[0x1E4F1C978] arrayWithObjects:v275 count:4];

                goto LABEL_20;
              case 3:
                unint64_t v100 = [v266 descriptor];
                unint64_t v101 = [v100 shape];
                v102 = [v101 objectAtIndexedSubscript:0];
                v274[0] = v102;
                v274[1] = &unk_1F3876480;
                BOOL v103 = [v266 descriptor];
                unint64_t v104 = [v103 shape];
                int v105 = [v104 objectAtIndexedSubscript:2];
                v274[2] = v105;
                unint64_t v106 = [v266 descriptor];
                v107 = [v106 shape];
                v108 = [v107 objectAtIndexedSubscript:1];
                v274[3] = v108;
                v262 = [MEMORY[0x1E4F1C978] arrayWithObjects:v274 count:4];

                uint64_t v88 = [v266 descriptor];
                v89 = [v88 shape];
                int v90 = [v89 objectAtIndexedSubscript:0];
                v273[0] = v90;
                uint64_t v97 = [v266 descriptor];
                v109 = [v97 shape];
                v110 = [v109 objectAtIndexedSubscript:1];
                v273[1] = v110;
                v273[2] = &unk_1F3876480;
                v111 = [v266 descriptor];
                unint64_t v112 = [v111 shape];
                v113 = [v112 objectAtIndexedSubscript:2];
                v273[3] = v113;
                v241 = [MEMORY[0x1E4F1C978] arrayWithObjects:v273 count:4];

                unint64_t v13 = v245;
LABEL_20:

LABEL_21:
                goto LABEL_25;
              case 4:
                v114 = [v266 descriptor];
                v252 = [v114 shape];
                v247 = [v252 objectAtIndexedSubscript:0];
                v272[0] = v247;
                v115 = [v266 descriptor];
                v116 = [v115 shape];
                v117 = [v116 objectAtIndexedSubscript:2];
                v272[1] = v117;
                v118 = [v266 descriptor];
                unint64_t v119 = [v118 shape];
                v120 = [v119 objectAtIndexedSubscript:3];
                v272[2] = v120;
                v121 = [v266 descriptor];
                unint64_t v122 = [v121 shape];
                v123 = [v122 objectAtIndexedSubscript:1];
                v272[3] = v123;
                v262 = [MEMORY[0x1E4F1C978] arrayWithObjects:v272 count:4];

                unint64_t v13 = v245;
                v124 = v266;
                goto LABEL_24;
              default:
                int v125 = [v266 descriptor];
                v262 = [v125 shape];

                v124 = v266;
LABEL_24:
                uint64_t v88 = [v124 descriptor];
                v241 = [v88 shape];
LABEL_25:

                uint64_t v126 = [v257 deviceList];
                uint64_t v127 = [v126 objectAtIndexedSubscript:v13];

                int v128 = [v267 objectAtIndexedSubscript:0];
                v129 = [v128 descriptor];
                v130 = [v129 shape];
                uint64_t v131 = [v130 count];

                uint64_t v132 = [v257 gpuLibrary];
                v133 = [v132 objectAtIndexedSubscript:v13];
                uint64_t v134 = v133;
                if (v131 == 3)
                {
                  uint64_t v135 = [v133 newFunctionWithName:@"transpose_three_dims"];

                  unint64_t v136 = (void *)[&unk_1F3876CA8 copy];
                  uint64_t v137 = [v263 objectAtIndexedSubscript:0];
                  v271[0] = v137;
                  id v138 = [v263 objectAtIndexedSubscript:2];
                  v271[1] = v138;
                  v139 = [v263 objectAtIndexedSubscript:3];
                  v271[2] = v139;
                  id v140 = [MEMORY[0x1E4F1C978] arrayWithObjects:v271 count:3];

                  v253 = (void *)[&unk_1F3876CC0 copy];
                  uint64_t v141 = [v262 objectAtIndexedSubscript:0];
                  v270[0] = v141;
                  v142 = [v262 objectAtIndexedSubscript:2];
                  v270[1] = v142;
                  uint64_t v143 = [v262 objectAtIndexedSubscript:3];
                  v270[2] = v143;
                  id v248 = [MEMORY[0x1E4F1C978] arrayWithObjects:v270 count:3];
                }
                else
                {
                  uint64_t v135 = [v133 newFunctionWithName:@"transpose_four_dims"];

                  unint64_t v136 = (void *)[&unk_1F3876CD8 copy];
                  id v140 = v263;
                  v253 = (void *)[&unk_1F3876CF0 copy];
                  id v248 = v262;
                }
                v237 = (void *)v135;
                v239 = v127;
                v234 = (void *)[v127 newComputePipelineStateWithFunction:v135 error:0];
                uint64_t v144 = +[MLCGPUDeviceOps deviceOpsWithForwardKernel:](MLCGPUDeviceOps, "deviceOpsWithForwardKernel:");
                v236 = v136;
                unint64_t v145 = (void *)[v136 mutableCopy];
                [v144 setTransposeShape:v145];

                BOOL v146 = [v267 objectAtIndexedSubscript:0];
                unint64_t v147 = [v146 descriptor];
                uint64_t v148 = +[MLCTensor tensorWithShape:dataType:](MLCTensor, "tensorWithShape:dataType:", v140, [v147 dataType]);

                uint64_t v149 = [v267 objectAtIndexedSubscript:0];
                id v150 = [v149 descriptor];
                v235 = v140;
                uint64_t v151 = +[MLCTensor tensorWithShape:dataType:](MLCTensor, "tensorWithShape:dataType:", v140, [v150 dataType]);

                id v152 = (void *)[v253 mutableCopy];
                [v144 setTransposeGradientShape:v152];

                objc_super v153 = [v266 descriptor];
                uint64_t v154 = +[MLCTensor tensorWithShape:dataType:](MLCTensor, "tensorWithShape:dataType:", v248, [v153 dataType]);

                v231 = (void *)v151;
                v232 = (void *)v148;
                v269[0] = v148;
                v269[1] = v154;
                v269[2] = v151;
                objc_super v155 = [MEMORY[0x1E4F1C978] arrayWithObjects:v269 count:3];
                v156 = (void *)[v155 copy];
                v157 = v268;
                [v268 setTransposedTensors:v156];

                v233 = v144;
                [v268 setTransposeDeviceOps:v144];
                uint64_t v158 = [v258 placeholderWithShape:v254 dataType:DataType name:0];
                uint64_t v159 = [v268 mpsGraphTensors];
                uint64_t v160 = [v159 objectAtIndexedSubscript:0];

                id v161 = [v268 descriptorsForMPSGraph];
                uint64_t v162 = [v161 objectAtIndexedSubscript:0];

                v163 = [v268 descriptorsForMPSGraph];
                uint64_t v164 = [v163 objectAtIndexedSubscript:1];

                v230 = (void *)v154;
                v243 = (void *)v162;
                if ([v268 depthWiseConvolution])
                {
                  v165 = (void *)v160;
                  uint64_t v166 = [v258 depthwiseConvolution2DWithSourceTensor:v158 weightsTensor:v160 descriptor:v162 name:0];
                }
                else
                {
                  v165 = (void *)v160;
                  if ([v268 convolutionTranspose]) {
                    [v258 convolutionTranspose2DWithSourceTensor:v158 weightsTensor:v160 outputShape:v241 descriptor:v162 name:0];
                  }
                  else {
                  uint64_t v166 = [v258 convolution2DWithSourceTensor:v158 weightsTensor:v160 descriptor:v162 name:0];
                  }
                }
                v167 = (void *)v166;
                v168 = (void *)v164;
                v169 = [v268 mpsGraphTensors];
                v229 = (void *)v158;
                [v169 addObject:v158];

                int v170 = [v268 hasBias];
                v171 = [v268 mpsGraphTensors];
                v172 = v171;
                if (v170)
                {
                  uint64_t v173 = [v171 objectAtIndexedSubscript:1];

                  v174 = [v258 additionWithPrimaryTensor:v167 secondaryTensor:v173 name:0];
                  v175 = [v268 mpsGraphTensors];
                  [v175 addObject:v174];

                  v172 = (void *)v173;
                }
                else
                {
                  [v171 addObject:v167];
                }
                v176 = v265;
                v177 = v165;

                v178 = [v268 descriptorsForMPSGraph];
                unint64_t v179 = [v178 count];

                if (v179 >= 3)
                {
                  v180 = [v268 descriptorsForMPSGraph];
                  v181 = [v180 objectAtIndexedSubscript:2];

                  v182 = [v268 mpsGraphTensors];
                  v183 = [v268 mpsGraphTensors];
                  v184 = objc_msgSend(v182, "objectAtIndexedSubscript:", objc_msgSend(v183, "count") - 1);

                  if ([v181 activationType] == 1)
                  {
                    id v185 = [v258 reLUWithTensor:v184 name:0];
                  }
                  else if ([v181 activationType] == 3)
                  {
                    id v185 = [v258 sigmoidWithTensor:v184 name:0];
                  }
                  else
                  {
                    id v185 = v184;
                  }
                  v204 = v185;
                  v205 = [v268 mpsGraphTensors];
                  v206 = [v268 mpsGraphTensors];
                  objc_msgSend(v205, "setObject:atIndexedSubscript:", v204, objc_msgSend(v206, "count") - 1);

                  v157 = v268;
                  v176 = v265;
                }
                v207 = [v176 placeholderWithShape:v262 dataType:DataType name:0];
                v208 = [v165 shape];
                v209 = [v176 placeholderWithShape:v208 dataType:DataType name:0];

                if ([v157 depthWiseConvolution])
                {
                  v210 = v263;
                  uint64_t v211 = [v176 depthwiseConvolution2DDataGradientWithIncomingGradientTensor:v207 weightsTensor:v209 outputShape:v263 descriptor:v168 name:0];
                }
                else
                {
                  v210 = v263;
                  if ([v157 convolutionTranspose]) {
                    [v176 convolutionTranspose2DDataGradientWithIncomingGradientTensor:v207 weightsTensor:v209 outputShape:v263 forwardConvolutionDescriptor:v168 name:0];
                  }
                  else {
                  uint64_t v211 = [v176 convolution2DDataGradientWithIncomingGradientTensor:v207 weightsTensor:v209 outputShape:v263 forwardConvolutionDescriptor:v168 name:0];
                  }
                }
                v212 = (void *)v211;
                v213 = [v176 placeholderWithShape:v210 dataType:DataType name:0];
                if ([v157 depthWiseConvolution])
                {
                  v214 = [v177 shape];
                  uint64_t v215 = [v176 depthwiseConvolution2DWeightsGradientWithIncomingGradientTensor:v207 sourceTensor:v213 outputShape:v214 descriptor:v168 name:0];
                }
                else
                {
                  int v216 = [v157 convolutionTranspose];
                  v214 = [v177 shape];
                  if (v216) {
                    [v265 convolutionTranspose2DWeightsGradientWithIncomingGradientTensor:v207 sourceTensor:v213 outputShape:v214 forwardConvolutionDescriptor:v168 name:0];
                  }
                  else {
                  uint64_t v215 = [v265 convolution2DWeightsGradientWithIncomingGradientTensor:v207 sourceTensor:v213 outputShape:v214 forwardConvolutionDescriptor:v168 name:0];
                  }
                }
                v217 = (void *)v215;

                v218 = [v157 mpsGraphTensors];
                [v218 addObject:v207];

                v219 = [v268 mpsGraphTensors];
                [v219 addObject:v209];

                v220 = [v268 mpsGraphTensors];
                [v220 addObject:v212];

                v221 = [v268 mpsGraphTensors];
                [v221 addObject:v213];

                v222 = [v268 mpsGraphTensors];
                [v222 addObject:v217];

                v29 = v268;
                if ([v268 hasBias])
                {
                  v223 = [v265 reductionSumWithTensor:v207 axes:&unk_1F3876D08 name:0];
                  v224 = [v268 mpsGraphTensors];
                  [v224 addObject:v223];

                  v29 = v268;
                }

                unint64_t v13 = v245;
                break;
            }
            break;
        }
        goto LABEL_65;
      }
      v29 = [v14 forwardKernel];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_66;
      }
      v30 = [v29 padding];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass) {
        goto LABEL_66;
      }
      v244 = v14;
      v32 = [v267 objectAtIndexedSubscript:0];
      BOOL v33 = [v32 descriptor];
      char v34 = [v33 shape];
      uint64_t v35 = [v34 count];

      if (v35 == 4) {
        break;
      }
      v186 = [v267 objectAtIndexedSubscript:0];
      v187 = [v186 descriptor];
      v188 = [v187 shape];
      uint64_t v189 = [v188 count];

      if (v189 == 3)
      {
        uint64_t v36 = v29;
        unint64_t v37 = v13;
        uint64_t v39 = 0;
        uint64_t v38 = 2;
        goto LABEL_44;
      }
LABEL_47:
      v258 = +[_MLCGPUConvolutionTransposePadding convolutionTransposeZeroPaddingWithTopAmount:bottomAmount:leftAmount:rightAmount:outputPaddingX:outputPaddingY:](_MLCGPUConvolutionTransposePadding, "convolutionTransposeZeroPaddingWithTopAmount:bottomAmount:leftAmount:rightAmount:outputPaddingX:outputPaddingY:");
      objc_msgSend(v29, "setPadding:");
LABEL_65:

      id v10 = v228;
      unint64_t v14 = v244;
LABEL_66:

      ++v13;
      v225 = [v257 deviceList];
      unint64_t v226 = [v225 count];

      if (v13 >= v226) {
        goto LABEL_67;
      }
    }
    uint64_t v36 = v29;
    unint64_t v37 = v13;
    uint64_t v38 = 3;
    uint64_t v39 = 2;
LABEL_44:
    v190 = [v267 objectAtIndexedSubscript:0];
    v191 = [v190 descriptor];
    v192 = [v191 shape];
    v193 = [v192 objectAtIndexedSubscript:v38];
    [v193 floatValue];
    [v36 strideInPixelsX];
    [v36 dilationRateX];
    [v36 kernelWidth];

    v194 = [v266 descriptor];
    v195 = [v194 shape];
    v196 = [v195 objectAtIndexedSubscript:v38];
    [v196 floatValue];

    if (v35 == 4)
    {
      v197 = [v267 objectAtIndexedSubscript:0];
      v198 = [v197 descriptor];
      v199 = [v198 shape];
      v200 = [v199 objectAtIndexedSubscript:v39];
      [v200 floatValue];
      [v36 strideInPixelsY];
      [v36 dilationRateY];
      [v36 kernelHeight];

      v201 = [v266 descriptor];
      v202 = [v201 shape];
      v203 = [v202 objectAtIndexedSubscript:v39];
      [v203 floatValue];
    }
    unint64_t v13 = v37;
    v29 = v36;
    goto LABEL_47;
  }
LABEL_67:

  return 1;
}

+ (id)layerWithDevice:(id)a3 weights:(id)a4 biasTerms:(id)a5 descriptor:(id)a6 neuronDescriptor:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  unint64_t v17 = (void *)[objc_alloc((Class)a1) initWithDevice:v16 weights:v15 biasTerms:v14 descriptor:v13 neuronDescriptor:v12];

  return v17;
}

- (void)initWithDevice:(os_log_t)log weights:biasTerms:descriptor:neuronDescriptor:.cold.1(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "-[_MLCGPUConvolution initWithDevice:weights:biasTerms:descriptor:neuronDescriptor:]";
  _os_log_error_impl(&dword_1DD0C9000, log, OS_LOG_TYPE_ERROR, "%s: failed to convert weight layout for a convolution layer", buf, 0xCu);
}

- (void)initWithDevice:(const char *)a1 weights:(NSObject *)a2 biasTerms:descriptor:neuronDescriptor:.cold.2(const char *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = NSStringFromSelector(a1);
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_1DD0C9000, a2, OS_LOG_TYPE_ERROR, "%@: mpsWeightsConvolution creation failed", (uint8_t *)&v4, 0xCu);
}

@end