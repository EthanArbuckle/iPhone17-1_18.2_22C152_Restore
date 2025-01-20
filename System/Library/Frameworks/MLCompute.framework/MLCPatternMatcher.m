@interface MLCPatternMatcher
+ (BOOL)canTransformToGELUFromLayer:(id)a3 stopGradientTensorList:(id)a4 fusedLayers:(id)a5 inputTensor:(id *)a6;
+ (BOOL)canTransformToGELUType1FromLayer:(id)a3 fusedLayers:(id)a4 inputTensor:(id)a5 withAccuracy:(float)a6;
+ (BOOL)canTransformToGELUType2FromLayer:(id)a3 fusedLayers:(id)a4 inputTensor:(id)a5 withAccuracy:(float)a6;
+ (BOOL)canTransformToHardSwishFromLayer:(id)a3 stopGradientTensorList:(id)a4 fusedLayers:(id)a5 inputTensor:(id *)a6;
+ (BOOL)canTransformToReLUNFromLayer:(id)a3 stopGradientTensorList:(id)a4 fusedLayers:(id)a5 alpha:(float *)a6 beta:(float *)a7;
+ (BOOL)checkIntermediateTensorsOfFusedLayers:(id)a3 stopGradientTensorList:(id)a4 forPattern:(id)a5;
+ (BOOL)isActivationLayer:(id)a3 withActivationType:(int)a4;
+ (BOOL)isArithmeticLayer:(id)a3 withOperation:(int)a4;
+ (BOOL)isConstTensor:(id)a3 withValue:(float)a4 withAccuracy:(float)a5;
+ (float)getAccuracyForLayer:(id)a3;
@end

@implementation MLCPatternMatcher

+ (BOOL)canTransformToReLUNFromLayer:(id)a3 stopGradientTensorList:(id)a4 fusedLayers:(id)a5 alpha:(float *)a6 beta:(float *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v15 = [v14 count];
  int v16 = [a1 isActivationLayer:v12 withActivationType:1];
  id v17 = v12;
  if (v15 && [v14 count] != 3)
  {
    if (v16 && [v14 count] == 4)
    {
      id v18 = [v14 objectAtIndexedSubscript:1];
      uint64_t v110 = 2;
      goto LABEL_15;
    }
LABEL_19:
    BOOL v35 = 0;
    v28 = v17;
    goto LABEL_63;
  }
  if (!v16)
  {
    if ([a1 isActivationLayer:v17 withActivationType:2])
    {
      uint64_t v110 = 1;
      v28 = v17;
      goto LABEL_16;
    }
    goto LABEL_19;
  }
  id v18 = [v17 sourceTensors];
  if ([v18 count] != 1)
  {
LABEL_24:
    BOOL v35 = 0;
    v28 = v17;
LABEL_62:

    goto LABEL_63;
  }
  int v111 = v16;
  v105 = a7;
  v19 = [v17 sourceTensors];
  v20 = [v19 objectAtIndexedSubscript:0];
  v21 = [v20 parentLayers];
  if ([v21 count] != 1)
  {
LABEL_23:

    goto LABEL_24;
  }
  uint64_t v103 = v15;
  v22 = [v17 resultTensors];
  if ([v22 count] != 1)
  {

    goto LABEL_23;
  }
  id v99 = a1;
  id v101 = v13;
  v100 = [v17 resultTensors];
  v23 = [v100 objectAtIndexedSubscript:0];
  v24 = [v23 childLayers];
  uint64_t v109 = [v24 count];

  if (v109 != 1)
  {
    BOOL v35 = 0;
    v28 = v17;
    id v13 = v101;
    goto LABEL_63;
  }
  v25 = [v17 resultTensors];
  v26 = [v25 objectAtIndexedSubscript:0];
  v27 = [v26 childLayers];
  id v18 = [v27 objectAtIndexedSubscript:0];

  a1 = v99;
  if (([v99 isActivationLayer:v18 withActivationType:2] & 1) == 0)
  {
    BOOL v35 = 0;
    v28 = v17;
    id v13 = v101;
    goto LABEL_62;
  }
  uint64_t v110 = 1;
  id v13 = v101;
  uint64_t v15 = v103;
  a7 = v105;
  int v16 = v111;
LABEL_15:

  v28 = v18;
LABEL_16:
  *a6 = 0.0;
  [a1 getAccuracyForLayer:v17];
  float v30 = v29;
  id v18 = [v28 descriptor];
  [v18 a];
  if (fabsf(v31 + 1.0) > v30) {
    goto LABEL_61;
  }
  int v112 = v16;
  v32 = [v28 descriptor];
  [v32 b];
  float v34 = fabsf(v33);

  if (v34 <= v30)
  {
    if (v112)
    {
      id v18 = v17;
    }
    else
    {
      id v18 = [v28 sourceTensors];
      if ([v18 count] != 1) {
        goto LABEL_61;
      }
      uint64_t v104 = v15;
      v106 = a7;
      id v36 = a1;
      v37 = [v28 sourceTensors];
      v38 = [v37 objectAtIndexedSubscript:0];
      v39 = [v38 parentLayers];
      uint64_t v40 = [v39 count];

      if (v40 != 1) {
        goto LABEL_18;
      }
      v41 = [v28 sourceTensors];
      v42 = [v41 objectAtIndexedSubscript:0];
      v43 = [v42 parentLayers];
      id v18 = [v43 objectAtIndexedSubscript:0];

      v44 = [v18 fusedLayers];
      uint64_t v45 = [v44 count];

      if (v45)
      {
        v46 = [v18 fusedLayers];
        uint64_t v47 = [v46 lastObject];

        id v18 = (id)v47;
      }
      a1 = v36;
      uint64_t v15 = v104;
      a7 = v106;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || [v18 operation])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v107 = a7;
        uint64_t v48 = v15;
        id v49 = a1;
        id v50 = v18;
        id v18 = v18;
        v51 = [v18 descriptor];
        int v52 = [v51 activationType];

        switch(v52)
        {
          case 1:
            v53 = [v18 descriptor];
            [v53 a];
            float v55 = v54;
            goto LABEL_47;
          case 3:
          case 4:
          case 6:
            goto LABEL_49;
          case 9:
            v57 = [v18 descriptor];
            [v57 a];
            float v59 = v58;

            if (v59 <= 0.0) {
              goto LABEL_49;
            }
            goto LABEL_48;
          case 10:
            v53 = [v18 descriptor];
            [v53 a];
            if (v60 > 0.0) {
              goto LABEL_44;
            }
            goto LABEL_46;
          case 17:
            v53 = [v18 descriptor];
            [v53 a];
            if (v61 < 0.0)
            {
LABEL_44:

LABEL_48:
              goto LABEL_61;
            }
LABEL_46:
            v62 = [v18 descriptor];
            [v62 b];
            float v55 = v63;

LABEL_47:
            if (v55 < 0.0) {
              goto LABEL_48;
            }
LABEL_49:

            a1 = v49;
            uint64_t v15 = v48;
            a7 = v107;
            id v18 = v50;
            break;
          default:
            goto LABEL_48;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_61;
        }
        unsigned int v56 = [v18 operation];
        BOOL v35 = 0;
        if (v56 > 0x17 || ((1 << v56) & 0xC10180) == 0) {
          goto LABEL_62;
        }
      }
    }
    id v64 = a1;
    v65 = [v28 resultTensors];
    uint64_t v66 = [v65 count];

    if (v66 == 1)
    {
      if (v15)
      {
        uint64_t v67 = objc_msgSend(v14, "objectAtIndexedSubscript:");

        ++v110;
        v28 = (void *)v67;
      }
      else
      {
        id v102 = v18;
        v83 = [v28 resultTensors];
        v84 = [v83 objectAtIndexedSubscript:0];

        v85 = [v84 childLayers];
        if ([v85 count] != 1)
        {
LABEL_74:

          goto LABEL_75;
        }
        v108 = a7;
        v86 = [v84 childLayers];
        v87 = [v86 objectAtIndexedSubscript:0];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {
LABEL_75:

          goto LABEL_76;
        }
        if (v112) {
          [v14 addObject:v28];
        }
        uint64_t v89 = [v84 childLayers];
        v79 = [(id)v89 objectAtIndexedSubscript:0];

        [v14 addObject:v79];
        LOBYTE(v89) = [v79 skipLayer];

        uint64_t v15 = 0;
        a7 = v108;
        if (v89) {
          goto LABEL_69;
        }
        v28 = v79;
        id v18 = v102;
      }
      v68 = [v28 descriptor];
      if ([v68 activationType] != 17)
      {
LABEL_60:

        goto LABEL_61;
      }
      id v102 = v18;
      v69 = a7;
      uint64_t v70 = v15;
      v71 = [v28 descriptor];
      [v71 a];
      float v73 = v72;
      v74 = [v28 descriptor];
      [v74 b];
      float v76 = vabds_f32(v73, v75);

      if (v76 >= v30)
      {
LABEL_76:
        BOOL v35 = 0;
        id v18 = v102;
        goto LABEL_62;
      }
      v77 = [v28 descriptor];
      [v77 b];
      float *v69 = -v78;

      if (v70)
      {
        v79 = [v14 objectAtIndexedSubscript:v110];

        goto LABEL_57;
      }
      v90 = [v28 resultTensors];
      v84 = [v90 objectAtIndexedSubscript:0];

      v85 = [v84 childLayers];
      if ([v85 count] == 1)
      {
        v91 = [v84 childLayers];
        v92 = [v91 objectAtIndexedSubscript:0];
        objc_opt_class();
        char v113 = objc_opt_isKindOfClass();

        if (v113)
        {
          uint64_t v93 = [v84 childLayers];
          v79 = [(id)v93 objectAtIndexedSubscript:0];

          [v14 addObject:v79];
          LOBYTE(v93) = [v79 skipLayer];

          if ((v93 & 1) == 0)
          {
LABEL_57:
            v28 = v79;
            v68 = [v79 descriptor];
            id v18 = v102;
            if ([v68 activationType] == 2)
            {
              v80 = [v28 descriptor];
              [v80 a];
              if (fabsf(v81 + 1.0) <= v30)
              {
                v94 = [v28 descriptor];
                [v94 b];
                float v96 = fabsf(v95);

                if (v96 <= v30)
                {
                  if (v70
                    || (v97 = (void *)[v14 mutableCopy],
                        [v97 insertObject:v17 atIndex:0],
                        int v98 = [v64 checkIntermediateTensorsOfFusedLayers:v97 stopGradientTensorList:v13 forPattern:@"ReLUN"], v97, v98))
                  {
                    BOOL v35 = 1;
                    goto LABEL_62;
                  }
                }
                goto LABEL_61;
              }
            }
            goto LABEL_60;
          }
LABEL_69:
          BOOL v35 = 0;
          id v18 = v102;
          v28 = v79;
          goto LABEL_62;
        }
        goto LABEL_75;
      }
      goto LABEL_74;
    }
LABEL_61:
    BOOL v35 = 0;
    goto LABEL_62;
  }
LABEL_18:
  BOOL v35 = 0;
LABEL_63:

  return v35;
}

+ (BOOL)canTransformToHardSwishFromLayer:(id)a3 stopGradientTensorList:(id)a4 fusedLayers:(id)a5 inputTensor:(id *)a6
{
  uint64_t v124 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [v12 count];
  BOOL v14 = v13 == 0;
  if (v13)
  {
    if ([v12 count] != 4 && objc_msgSend(v12, "count") != 6) {
      goto LABEL_12;
    }
    uint64_t v15 = [v12 objectAtIndexedSubscript:0];

    uint64_t v16 = 1;
    id v10 = (id)v15;
  }
  else
  {
    uint64_t v16 = 0;
  }
  [a1 getAccuracyForLayer:v10];
  float v18 = v17;
  if (![a1 isArithmeticLayer:v10 withOperation:0]
    || (uint64_t v106 = v16,
        [v10 sourceTensors],
        v19 = objc_claimAutoreleasedReturnValue(),
        uint64_t v20 = [v19 count],
        v19,
        v20 != 2))
  {
LABEL_12:
    BOOL v33 = 0;
    goto LABEL_92;
  }
  if (v13)
  {
    v21 = [v12 objectAtIndexedSubscript:v106];

    v22 = [v21 sourceTensors];
    uint64_t v23 = [v22 objectAtIndexedSubscript:0];

    goto LABEL_10;
  }
  int v98 = v12;
  id v34 = *a6;
  long long v117 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  BOOL v35 = [v10 sourceTensors];
  uint64_t v36 = [v35 countByEnumeratingWithState:&v117 objects:v123 count:16];
  if (!v36)
  {

    BOOL v33 = 0;
    id v105 = v34;
    *a6 = v105;
    goto LABEL_80;
  }
  uint64_t v39 = v36;
  BOOL v102 = v13 == 0;
  id v95 = v11;
  char v40 = 0;
  uint64_t v41 = *(void *)v118;
  do
  {
    for (uint64_t i = 0; i != v39; ++i)
    {
      if (*(void *)v118 != v41) {
        objc_enumerationMutation(v35);
      }
      v43 = *(void **)(*((void *)&v117 + 1) + 8 * i);
      LODWORD(v37) = 3.0;
      *(float *)&double v38 = v18;
      if ([a1 isConstTensor:v43 withValue:v37 withAccuracy:v38])
      {
        char v40 = 1;
      }
      else
      {
        id v44 = v43;

        id v34 = v44;
      }
    }
    uint64_t v39 = [v35 countByEnumeratingWithState:&v117 objects:v123 count:16];
  }
  while (v39);

  id v105 = v34;
  *a6 = v105;
  id v11 = v95;
  if ((v40 & 1) == 0) {
    goto LABEL_79;
  }
  uint64_t v45 = [v10 resultTensors];
  if ([v45 count] != 1)
  {

    goto LABEL_79;
  }
  v46 = [v10 resultTensors];
  uint64_t v47 = [v46 objectAtIndexedSubscript:0];
  uint64_t v48 = [v47 childLayers];
  uint64_t v49 = [v48 count];

  if (v49 != 1)
  {
LABEL_79:
    BOOL v33 = 0;
    goto LABEL_80;
  }
  [v98 addObject:v10];
  id v50 = [v10 resultTensors];
  v51 = [v50 objectAtIndexedSubscript:0];
  int v52 = [v51 childLayers];
  v21 = [v52 objectAtIndexedSubscript:0];

  if ([v21 skipLayer])
  {
    BOOL v33 = 0;
    id v10 = v21;
LABEL_80:
    id v12 = v98;
    goto LABEL_91;
  }
  uint64_t v13 = 0;
  id v12 = v98;
  uint64_t v23 = (uint64_t)v105;
  BOOL v14 = v102;
LABEL_10:
  id v105 = (id)v23;
  v24 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  v108 = v21;
  if ([a1 isActivationLayer:v21 withActivationType:10])
  {
    id v25 = v21;
    v26 = [v25 descriptor];
    [v26 a];
    float v28 = v27;

    float v29 = [v25 descriptor];
    [v29 b];
    float v31 = v30;

    [v24 addObject:v25];
    float v32 = v31 + -6.0;
  }
  else
  {
    float v32 = -7.0;
    float v28 = -1.0;
  }
  BOOL v33 = 0;
  if (fabsf(v28) >= v18 || fabsf(v32) >= v18) {
    goto LABEL_90;
  }
  if (!v13)
  {
    [v12 addObjectsFromArray:v24];
    v84 = [v21 resultTensors];
    if ([v84 count] != 1)
    {

      BOOL v33 = 0;
      goto LABEL_90;
    }
    char v103 = v14;
    v94 = v24;
    id v96 = v11;
    id v85 = v12;
    v86 = [v21 resultTensors];
    v87 = [v86 objectAtIndexedSubscript:0];
    v88 = [v87 childLayers];
    uint64_t v89 = [v88 count];

    if (v89 == 1)
    {
      v90 = [v21 resultTensors];
      v91 = [v90 objectAtIndexedSubscript:0];
      v92 = [v91 childLayers];
      v53 = [v92 objectAtIndexedSubscript:0];

      if (([v53 skipLayer] & 1) == 0)
      {
        id v12 = v85;
        uint64_t v13 = 0;
        goto LABEL_33;
      }
      BOOL v33 = 0;
      v108 = v53;
    }
    else
    {
      BOOL v33 = 0;
    }
    id v12 = v85;
    goto LABEL_89;
  }
  char v103 = v14;
  v94 = v24;
  id v96 = v11;
  v53 = objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v24, "count") + v106);

LABEL_33:
  char v54 = 0;
  char v55 = 1;
  unsigned int v56 = v53;
  char v57 = 1;
  char v58 = 1;
  id v59 = v105;
  uint64_t v97 = v13;
  id v99 = v12;
  while (1)
  {
    while (1)
    {
      char v107 = v55;
      char v100 = v54;
      if ((v58 & 1) != 0 && [a1 isArithmeticLayer:v56 withOperation:3])
      {
        long long v115 = 0u;
        long long v116 = 0u;
        long long v113 = 0u;
        long long v114 = 0u;
        float v60 = [v56 sourceTensors];
        uint64_t v61 = [v60 countByEnumeratingWithState:&v113 objects:v122 count:16];
        if (v61)
        {
          uint64_t v64 = v61;
          uint64_t v65 = *(void *)v114;
          while (2)
          {
            for (uint64_t j = 0; j != v64; ++j)
            {
              if (*(void *)v114 != v65) {
                objc_enumerationMutation(v60);
              }
              LODWORD(v62) = 6.0;
              *(float *)&double v63 = v18;
              if ([a1 isConstTensor:*(void *)(*((void *)&v113 + 1) + 8 * j) withValue:v62 withAccuracy:v63])
              {
                char v58 = 0;
                id v59 = v105;
                goto LABEL_64;
              }
            }
            uint64_t v64 = [v60 countByEnumeratingWithState:&v113 objects:v122 count:16];
            if (v64) {
              continue;
            }
            break;
          }
        }
        v108 = v56;

        goto LABEL_87;
      }
      v108 = v56;
      if (![a1 isArithmeticLayer:v56 withOperation:2]) {
        goto LABEL_87;
      }
      long long v111 = 0u;
      long long v112 = 0u;
      long long v109 = 0u;
      long long v110 = 0u;
      float v60 = [v56 sourceTensors];
      uint64_t v67 = [v60 countByEnumeratingWithState:&v109 objects:v121 count:16];
      if (v67)
      {
        uint64_t v70 = v67;
        uint64_t v71 = *(void *)v110;
LABEL_48:
        uint64_t v72 = 0;
        while (1)
        {
          if (*(void *)v110 != v71) {
            objc_enumerationMutation(v60);
          }
          if ((v57 & (*(void *)(*((void *)&v109 + 1) + 8 * v72) == (void)v59)) != 0)
          {
            char v57 = 0;
            goto LABEL_63;
          }
          if (v58)
          {
            LODWORD(v68) = 1042983595;
            *(float *)&double v69 = v18;
            if (objc_msgSend(a1, "isConstTensor:withValue:withAccuracy:", v68, v69)) {
              break;
            }
          }
          if (v70 == ++v72)
          {
            uint64_t v70 = [v60 countByEnumeratingWithState:&v109 objects:v121 count:16];
            if (v70) {
              goto LABEL_48;
            }
            goto LABEL_56;
          }
        }
        char v58 = 0;
LABEL_63:
        unsigned int v56 = v108;
LABEL_64:

        if (v13) {
          goto LABEL_58;
        }
        break;
      }
LABEL_56:

      unsigned int v56 = v108;
      if ((v103 & 1) == 0) {
        goto LABEL_87;
      }
      if (!v13) {
        break;
      }
LABEL_58:
      float v73 = [v12 lastObject];

      char v55 = 0;
      char v54 = 1;
      unsigned int v56 = v73;
      char v103 = 1;
      if ((v107 & 1) == 0) {
        goto LABEL_71;
      }
    }
    v74 = [v56 resultTensors];
    if ([v74 count] != 1)
    {
      v108 = v56;

LABEL_87:
      BOOL v33 = 0;
      goto LABEL_88;
    }
    float v75 = [v56 resultTensors];
    float v76 = [v75 objectAtIndexedSubscript:0];
    v77 = [v76 childLayers];
    if ((v107 & ([v77 count] != 1)) != 0)
    {
      v108 = v56;

      goto LABEL_95;
    }
    [v56 resultTensors];
    float v78 = v104 = v74;
    v79 = [v78 objectAtIndexedSubscript:0];
    v80 = [v79 childLayers];
    char v101 = v100 & ((unint64_t)[v80 count] > 1);

    if (v101) {
      break;
    }
    id v12 = v99;
    [v99 addObject:v56];
    float v81 = [v56 resultTensors];
    v82 = [v81 objectAtIndexedSubscript:0];
    v83 = [v82 childLayers];
    float v73 = [v83 lastObject];

    if ([v73 skipLayer]) {
      goto LABEL_83;
    }
    char v55 = 0;
    char v54 = 1;
    unsigned int v56 = v73;
    char v103 = 1;
    uint64_t v13 = v97;
    id v59 = v105;
    if ((v107 & 1) == 0)
    {
      if ([a1 checkIntermediateTensorsOfFusedLayers:v99 stopGradientTensorList:v96 forPattern:@"Hardswish"])LABEL_71:BOOL v33 = 1; {
      else
      }
LABEL_83:
        BOOL v33 = 0;
      v108 = v73;
LABEL_88:
      id v11 = v96;
      goto LABEL_89;
    }
  }
  v108 = v56;
LABEL_95:
  BOOL v33 = 0;
  id v11 = v96;
  id v12 = v99;
LABEL_89:
  v24 = v94;
LABEL_90:

  id v10 = v108;
LABEL_91:

LABEL_92:
  return v33;
}

+ (BOOL)canTransformToGELUFromLayer:(id)a3 stopGradientTensorList:(id)a4 fusedLayers:(id)a5 inputTensor:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [v12 count];
  [a1 getAccuracyForLayer:v10];
  int v15 = v14;
  if (v13)
  {
    uint64_t v16 = [v12 objectAtIndexedSubscript:0];

    uint64_t v17 = 1;
    id v10 = (id)v16;
  }
  else
  {
    uint64_t v17 = 0;
  }
  if ([a1 isArithmeticLayer:v10 withOperation:2])
  {
    float v18 = [v10 sourceTensors];
    v19 = [v18 objectAtIndexedSubscript:1];

    if (v13)
    {
      uint64_t v20 = [v12 objectAtIndexedSubscript:v17];
      ++v17;
    }
    else
    {
      id v55 = v11;
      if (a6) {
        *a6 = v19;
      }
      [v12 addObject:v10];
      v22 = [v10 sourceTensors];
      [v22 objectAtIndexedSubscript:0];
      v24 = uint64_t v23 = v19;
      id v25 = [v24 parentLayers];
      uint64_t v20 = [v25 lastObject];

      v19 = v23;
      id v10 = v22;
      id v11 = v55;
    }

    if (![a1 isArithmeticLayer:v20 withOperation:2]) {
      goto LABEL_28;
    }
    v26 = [v20 sourceTensors];
    float v27 = [v26 objectAtIndexedSubscript:1];
    LODWORD(v28) = 0.5;
    LODWORD(v29) = v15;
    int v21 = [a1 isConstTensor:v27 withValue:v28 withAccuracy:v29];

    if (v21)
    {
      if (v13)
      {
        float v30 = [v12 objectAtIndexedSubscript:v17];
        ++v17;
      }
      else
      {
        [v12 addObject:v20];
        float v31 = [v20 sourceTensors];
        float v32 = [v31 objectAtIndexedSubscript:0];
        [v32 parentLayers];
        id v56 = v11;
        v34 = BOOL v33 = v19;
        float v30 = [v34 lastObject];

        v19 = v33;
        id v11 = v56;

        uint64_t v20 = v31;
      }

      if ([a1 isArithmeticLayer:v30 withOperation:0])
      {
        BOOL v35 = [v30 sourceTensors];
        uint64_t v36 = [v35 objectAtIndexedSubscript:1];
        LODWORD(v37) = 1.0;
        LODWORD(v38) = v15;
        int v21 = [a1 isConstTensor:v36 withValue:v37 withAccuracy:v38];

        if (v21)
        {
          if (v13)
          {
            uint64_t v20 = [v12 objectAtIndexedSubscript:v17];

            if ([a1 isActivationLayer:v20 withActivationType:5])
            {
              uint64_t v39 = [v12 objectAtIndexedSubscript:v17 + 1];

              char v40 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
              uint64_t v41 = objc_msgSend(v12, "subarrayWithRange:", v17 + 2, objc_msgSend(v12, "count") - (v17 + 2));
              v42 = (void *)[v41 mutableCopy];

              LODWORD(v43) = v15;
              if (([a1 canTransformToGELUType1FromLayer:v39 fusedLayers:v42 inputTensor:v19 withAccuracy:v43] & 1) == 0)
              {
                LODWORD(v44) = v15;
                if (([a1 canTransformToGELUType2FromLayer:v39 fusedLayers:v42 inputTensor:v19 withAccuracy:v44] & 1) == 0)goto LABEL_34; {
              }
                }
LABEL_33:
              LOBYTE(v21) = 1;
LABEL_35:

              uint64_t v20 = (void *)v39;
              goto LABEL_29;
            }
            goto LABEL_28;
          }
          [v12 addObject:v30];
          uint64_t v45 = [v30 sourceTensors];
          v46 = [v45 objectAtIndexedSubscript:0];
          uint64_t v47 = [v46 parentLayers];
          uint64_t v20 = [v47 lastObject];

          if ([a1 isActivationLayer:v20 withActivationType:5])
          {
            [v12 addObject:v20];
            uint64_t v48 = [v20 sourceTensors];
            uint64_t v49 = [v48 objectAtIndexedSubscript:0];
            id v50 = [v49 parentLayers];
            uint64_t v39 = [v50 lastObject];

            v51 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
            LODWORD(v52) = v15;
            if ([a1 canTransformToGELUType1FromLayer:v39 fusedLayers:v51 inputTensor:v19 withAccuracy:v52])
            {
              v42 = v51;
            }
            else
            {
              v42 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];

              LODWORD(v54) = v15;
              if (([a1 canTransformToGELUType2FromLayer:v39 fusedLayers:v42 inputTensor:v19 withAccuracy:v54] & 1) == 0)goto LABEL_34; {
            }
              }
            [v12 addObjectsFromArray:v42];
            if ([a1 checkIntermediateTensorsOfFusedLayers:v12 stopGradientTensorList:v11 forPattern:@"GELU"])goto LABEL_33; {
LABEL_34:
            }
            LOBYTE(v21) = 0;
            goto LABEL_35;
          }
LABEL_28:
          LOBYTE(v21) = 0;
          goto LABEL_29;
        }
      }
      else
      {
        LOBYTE(v21) = 0;
      }
      uint64_t v20 = v30;
    }
LABEL_29:

    id v10 = v20;
    goto LABEL_30;
  }
  LOBYTE(v21) = 0;
LABEL_30:

  return v21;
}

+ (float)getAccuracyForLayer:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v3 = objc_msgSend(a3, "sourceTensors", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    float v7 = 0.00000001;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        float v9 = v7;
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        id v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) descriptor];
        int v11 = [v10 dataType];

        if (v11 == 3)
        {
          float v7 = fminf(v7, 0.0001);
        }
        else
        {
          float v7 = 0.0;
          if (v11 == 1) {
            float v7 = fminf(v9, 0.00000001);
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
  else
  {
    float v7 = 0.00000001;
  }

  return v7;
}

+ (BOOL)isArithmeticLayer:(id)a3 withOperation:(int)a4
{
  id v5 = a3;
  BOOL v6 = v5
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [v5 operation] == a4;

  return v6;
}

+ (BOOL)isActivationLayer:(id)a3 withActivationType:(int)a4
{
  id v5 = a3;
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v6 = [v5 descriptor];
    BOOL v7 = [v6 activationType] == a4;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

+ (BOOL)isConstTensor:(id)a3 withValue:(float)a4 withAccuracy:(float)a5
{
  id v8 = a3;
  if (([v8 computeFlags] & 2) == 0) {
    goto LABEL_24;
  }
  float v9 = [v8 descriptor];
  uint64_t v10 = [v9 elementCount];

  if (v10 != 1) {
    goto LABEL_24;
  }
  int v11 = [v8 descriptor];
  int v12 = [v11 dataType];

  if (v12 != 3)
  {
    if (v12 == 1)
    {
      id v13 = [v8 data];
      long long v14 = (float *)[v13 bytes];

      long long v15 = [v8 descriptor];
      uint64_t v16 = [v15 elementCount];

      if (v16)
      {
        uint64_t v17 = v16 - 1;
        do
        {
          float v18 = *v14++;
          float v19 = vabds_f32(v18, a4);
          _CF = v17-- != 0;
          char v21 = _CF;
          BOOL v22 = v19 < a5;
        }
        while (v19 < a5 && (v21 & 1) != 0);
        goto LABEL_25;
      }
LABEL_26:
      BOOL v22 = 1;
      goto LABEL_25;
    }
    uint64_t v36 = +[MLCLog framework];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      +[MLCPatternMatcher isConstTensor:withValue:withAccuracy:](a2, v8, v36);
    }

LABEL_24:
    BOOL v22 = 0;
    goto LABEL_25;
  }
  id v23 = [v8 data];
  v24 = (__int16 *)[v23 bytes];

  id v25 = [v8 descriptor];
  uint64_t v26 = [v25 elementCount];

  if (!v26) {
    goto LABEL_26;
  }
  uint64_t v27 = v26 - 1;
  do
  {
    __int16 v28 = *v24++;
    _H0 = v28;
    __asm { FCVT            S0, H0 }
    float v34 = vabds_f32(_S0, a4);
    _CF = v27-- != 0;
    char v35 = _CF;
    BOOL v22 = v34 < a5;
  }
  while (v34 < a5 && (v35 & 1) != 0);
LABEL_25:

  return v22;
}

+ (BOOL)canTransformToGELUType1FromLayer:(id)a3 fusedLayers:(id)a4 inputTensor:(id)a5 withAccuracy:(float)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [v11 count];
  if (![a1 isArithmeticLayer:v10 withOperation:2]) {
    goto LABEL_14;
  }
  long long v14 = [v10 sourceTensors];
  long long v15 = [v14 objectAtIndexedSubscript:1];
  LODWORD(v16) = 1061962281;
  *(float *)&double v17 = a6;
  int v18 = [a1 isConstTensor:v15 withValue:v16 withAccuracy:v17];

  if (v18)
  {
    if (v13)
    {
      float v19 = [v11 objectAtIndexedSubscript:0];
      uint64_t v20 = 1;
    }
    else
    {
      [v11 addObject:v10];
      char v21 = [v10 sourceTensors];
      BOOL v22 = [v21 objectAtIndexedSubscript:0];
      id v23 = [v22 parentLayers];
      float v19 = [v23 lastObject];

      uint64_t v20 = 0;
      id v10 = v21;
    }

    if (![a1 isArithmeticLayer:v19 withOperation:0]) {
      goto LABEL_8;
    }
    v24 = [v19 sourceTensors];
    id v25 = [v24 objectAtIndexedSubscript:1];

    if (v25 != v12) {
      goto LABEL_8;
    }
    if (v13)
    {
      id v10 = [v11 objectAtIndexedSubscript:v20];
      ++v20;
    }
    else
    {
      [v11 addObject:v19];
      uint64_t v26 = [v19 sourceTensors];
      uint64_t v27 = [v26 objectAtIndexedSubscript:0];
      __int16 v28 = [v27 parentLayers];
      id v10 = [v28 lastObject];

      float v19 = v26;
    }

    if (![a1 isArithmeticLayer:v10 withOperation:2]) {
      goto LABEL_14;
    }
    double v29 = [v10 sourceTensors];
    id v30 = [v29 objectAtIndexedSubscript:1];

    if (v30 != v12) {
      goto LABEL_14;
    }
    if (v13)
    {
      float v19 = [v11 objectAtIndexedSubscript:v20];
      ++v20;
    }
    else
    {
      [v11 addObject:v10];
      float v32 = [v10 sourceTensors];
      BOOL v33 = [v32 objectAtIndexedSubscript:0];
      float v34 = [v33 parentLayers];
      float v19 = [v34 lastObject];

      id v10 = v32;
    }

    if (![a1 isArithmeticLayer:v19 withOperation:2]) {
      goto LABEL_8;
    }
    char v35 = [v19 sourceTensors];
    uint64_t v36 = [v35 objectAtIndexedSubscript:0];
    LODWORD(v37) = 1027024659;
    *(float *)&double v38 = a6;
    int v39 = [a1 isConstTensor:v36 withValue:v37 withAccuracy:v38];

    if (!v39)
    {
LABEL_8:
      LOBYTE(v18) = 0;
      id v10 = v19;
      goto LABEL_15;
    }
    if (v13)
    {
      id v10 = [v11 objectAtIndexedSubscript:v20];
    }
    else
    {
      [v11 addObject:v19];
      char v40 = [v19 sourceTensors];
      uint64_t v41 = [v40 objectAtIndexedSubscript:1];
      v42 = [v41 parentLayers];
      id v10 = [v42 lastObject];

      float v19 = v40;
    }

    if (![a1 isArithmeticLayer:v10 withOperation:2])
    {
LABEL_14:
      LOBYTE(v18) = 0;
      goto LABEL_15;
    }
    double v43 = [v10 sourceTensors];
    id v44 = [v43 objectAtIndexedSubscript:0];
    if (v44 != v12)
    {

      goto LABEL_14;
    }
    uint64_t v45 = [v10 sourceTensors];
    id v46 = [v45 objectAtIndexedSubscript:1];

    LOBYTE(v18) = v46 == v12;
    if (v46 == v12 && !v13)
    {
      [v11 addObject:v10];
      LOBYTE(v18) = 1;
    }
  }
LABEL_15:

  return v18;
}

+ (BOOL)canTransformToGELUType2FromLayer:(id)a3 fusedLayers:(id)a4 inputTensor:(id)a5 withAccuracy:(float)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [v11 count];
  if (![a1 isArithmeticLayer:v10 withOperation:2]) {
    goto LABEL_3;
  }
  long long v14 = [v10 sourceTensors];
  id v15 = [v14 objectAtIndexedSubscript:1];

  if (v15 != v12) {
    goto LABEL_3;
  }
  if (v13)
  {
    int v18 = [v11 objectAtIndexedSubscript:0];
    uint64_t v19 = 1;
  }
  else
  {
    [v11 addObject:v10];
    uint64_t v20 = [v10 sourceTensors];
    char v21 = [v20 objectAtIndexedSubscript:0];
    BOOL v22 = [v21 parentLayers];
    int v18 = [v22 lastObject];

    uint64_t v19 = 0;
    id v10 = v20;
  }

  if (![a1 isArithmeticLayer:v18 withOperation:2]) {
    goto LABEL_20;
  }
  id v23 = [v18 sourceTensors];
  v24 = [v23 objectAtIndexedSubscript:1];
  LODWORD(v25) = 1027024659;
  *(float *)&double v26 = a6;
  int v27 = [a1 isConstTensor:v24 withValue:v25 withAccuracy:v26];

  if (!v27) {
    goto LABEL_20;
  }
  if (v13)
  {
    id v10 = [v11 objectAtIndexedSubscript:v19];
    ++v19;
  }
  else
  {
    [v11 addObject:v18];
    __int16 v28 = [v18 sourceTensors];
    double v29 = [v28 objectAtIndexedSubscript:0];
    id v30 = [v29 parentLayers];
    id v10 = [v30 lastObject];

    int v18 = v28;
  }

  if (![a1 isArithmeticLayer:v10 withOperation:0]) {
    goto LABEL_3;
  }
  float v31 = [v10 sourceTensors];
  float v32 = [v31 objectAtIndexedSubscript:1];
  LODWORD(v33) = 1.0;
  *(float *)&double v34 = a6;
  int v35 = [a1 isConstTensor:v32 withValue:v33 withAccuracy:v34];

  if (!v35) {
    goto LABEL_3;
  }
  if (v13)
  {
    int v18 = [v11 objectAtIndexedSubscript:v19];
    ++v19;
  }
  else
  {
    [v11 addObject:v10];
    uint64_t v36 = [v10 sourceTensors];
    double v37 = [v36 objectAtIndexedSubscript:0];
    double v38 = [v37 parentLayers];
    int v18 = [v38 lastObject];

    id v10 = v36;
  }

  if (![a1 isArithmeticLayer:v18 withOperation:2]
    || ([v18 sourceTensors],
        int v39 = objc_claimAutoreleasedReturnValue(),
        [v39 objectAtIndexedSubscript:1],
        id v40 = (id)objc_claimAutoreleasedReturnValue(),
        v40,
        v39,
        v40 != v12))
  {
LABEL_20:
    LOBYTE(v16) = 0;
    id v10 = v18;
    goto LABEL_4;
  }
  if (v13)
  {
    id v10 = [v11 objectAtIndexedSubscript:v19];
  }
  else
  {
    [v11 addObject:v18];
    uint64_t v41 = [v18 sourceTensors];
    v42 = [v41 objectAtIndexedSubscript:0];
    double v43 = [v42 parentLayers];
    id v10 = [v43 lastObject];

    int v18 = v41;
  }

  if (![a1 isArithmeticLayer:v10 withOperation:2])
  {
LABEL_3:
    LOBYTE(v16) = 0;
    goto LABEL_4;
  }
  id v44 = [v10 sourceTensors];
  uint64_t v45 = [v44 objectAtIndexedSubscript:1];
  LODWORD(v46) = 1340983747;
  *(float *)&double v47 = a6;
  int v16 = [a1 isConstTensor:v45 withValue:v46 withAccuracy:v47];

  if (v16 && !v13)
  {
    [v11 addObject:v10];
    LOBYTE(v16) = 1;
  }
LABEL_4:

  return v16;
}

+ (BOOL)checkIntermediateTensorsOfFusedLayers:(id)a3 stopGradientTensorList:(id)a4 forPattern:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9) {
    [MEMORY[0x1E4F1CAD0] setWithArray:v9];
  }
  else {
  id v11 = [MEMORY[0x1E4F1CAD0] set];
  }
  uint64_t v12 = [v8 count];
  unint64_t v13 = v12 - 1;
  if (v12 == 1)
  {
    BOOL v15 = 1;
  }
  else
  {
    uint64_t v14 = v12;
    aSelector = a2;
    id v32 = v9;
    id v33 = v10;
    BOOL v15 = 0;
    unint64_t v16 = 1;
    while (1)
    {
      double v17 = [v8 objectAtIndexedSubscript:v16 - 1];
      if ([v17 skipLayer]) {
        break;
      }
      int v18 = [v17 resultTensors];
      uint64_t v19 = [v18 objectAtIndexedSubscript:0];
      char v20 = [v19 computeFlags];

      if (v20)
      {
        v24 = +[MLCLog framework];
        if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO)) {
          goto LABEL_19;
        }
        double v26 = NSStringFromSelector(aSelector);
        int v27 = [v17 resultTensors];
        __int16 v28 = [v27 objectAtIndexedSubscript:0];
        *(_DWORD *)buf = 138413058;
        int v35 = v26;
        __int16 v36 = 2112;
        id v37 = v8;
        __int16 v38 = 2112;
        int v39 = v33;
        __int16 v40 = 2112;
        uint64_t v41 = v28;
        double v29 = "%@: cannot fuse layers = %@ to %@, because tensor = %@ is output";
LABEL_18:
        _os_log_impl(&dword_1DD0C9000, v24, OS_LOG_TYPE_INFO, v29, buf, 0x2Au);

        goto LABEL_19;
      }
      char v21 = [v17 resultTensors];
      BOOL v22 = [v21 objectAtIndexedSubscript:0];
      int v23 = [v11 containsObject:v22];

      if (v23)
      {
        v24 = +[MLCLog framework];
        if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO)) {
          goto LABEL_19;
        }
        double v26 = NSStringFromSelector(aSelector);
        int v27 = [v17 resultTensors];
        __int16 v28 = [v27 objectAtIndexedSubscript:0];
        *(_DWORD *)buf = 138413058;
        int v35 = v26;
        __int16 v36 = 2112;
        id v37 = v8;
        __int16 v38 = 2112;
        int v39 = v33;
        __int16 v40 = 2112;
        uint64_t v41 = v28;
        double v29 = "%@: cannot fuse layers = %@ to %@, because tensor = %@ is in stop gradient list";
        goto LABEL_18;
      }

      BOOL v15 = v16++ >= v13;
      if (v14 == v16)
      {
        BOOL v15 = 1;
        id v9 = v32;
        goto LABEL_20;
      }
    }
    v24 = +[MLCLog framework];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      double v25 = NSStringFromSelector(aSelector);
      *(_DWORD *)buf = 138412802;
      int v35 = v25;
      __int16 v36 = 2112;
      id v37 = v33;
      __int16 v38 = 2112;
      int v39 = v17;
      _os_log_impl(&dword_1DD0C9000, v24, OS_LOG_TYPE_INFO, "%@: cannot fuse layers to %@, because layer = %@ was previously fused", buf, 0x20u);
    }
LABEL_19:
    id v9 = v32;

LABEL_20:
    id v10 = v33;
  }

  return v15;
}

+ (void)isConstTensor:(const char *)a1 withValue:(void *)a2 withAccuracy:(NSObject *)a3 .cold.1(const char *a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = NSStringFromSelector(a1);
  BOOL v6 = [a2 descriptor];
  int v7 = 138412546;
  id v8 = v5;
  __int16 v9 = 1024;
  int v10 = [v6 dataType];
  _os_log_error_impl(&dword_1DD0C9000, a3, OS_LOG_TYPE_ERROR, "%@: Unsupported data type = %d", (uint8_t *)&v7, 0x12u);
}

@end