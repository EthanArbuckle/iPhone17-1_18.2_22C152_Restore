@interface VNShotflowDetectorANODv5
+ (Class)VNShotflowNetworkClass;
+ (id)defaultFilterThresholds;
+ (id)filterThresholdsArrayForFilterThresholds:(id)a3 error:(id *)a4;
+ (id)supportedLabelKeys;
- (VNShotflowDetectorANODv5)initWithNetwork:(id)a3;
- (float)faceBodyDistanceThreshold;
- (float)petFaceThreshold;
- (id)analyzePetFaces:(id)a3;
- (id)getIndexBoxes:(id)a3 filterThresholdIndex:(unint64_t)a4;
- (id)groupFaceBody:(id)a3;
- (id)nmsBoxes:(id)a3 usingThresholds:(id)a4;
- (id)processBoxes:(id)a3 withHeight:(float)a4 andWidth:(float)a5 filterThresholds:(id)a6;
- (void)setFaceBodyDistanceThreshold:(float)a3;
- (void)setPetFaceThreshold:(float)a3;
@end

@implementation VNShotflowDetectorANODv5

+ (Class)VNShotflowNetworkClass
{
  return (Class)objc_opt_class();
}

+ (id)filterThresholdsArrayForFilterThresholds:(id)a3 error:(id *)a4
{
  v10[12] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v10[0] = @"VNShotflowDetectorFilterThresholdKey_HumanFace";
  v10[1] = @"VNShotflowDetectorFilterThresholdKey_HumanHead";
  v10[2] = @"VNShotflowDetectorFilterThresholdKey_HumanBody";
  v10[3] = @"VNShotflowDetectorFilterThresholdKey_CatBody";
  v10[4] = @"VNShotflowDetectorFilterThresholdKey_DogBody";
  v10[5] = @"VNShotflowDetectorFilterThresholdKey_Other";
  v10[6] = @"VNShotflowDetectorFilterThresholdKey_Food";
  v10[7] = @"VNShotflowDetectorFilterThresholdKey_Drink";
  v10[8] = @"VNShotflowDetectorFilterThresholdKey_CatHead";
  v10[9] = @"VNShotflowDetectorFilterThresholdKey_DogHead";
  v10[10] = @"VNShotflowDetectorFilterThresholdKey_SportsBall";
  v10[11] = @"VNShotflowDetectorFilterThresholdKey_FullBody";
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:12];
  v8 = +[VNShotflowDetector _filterThresholdsArrayFromKeys:inFilterThresholds:error:]((uint64_t)a1, v7, v6, a4);

  return v8;
}

+ (id)defaultFilterThresholds
{
  if (+[VNShotflowDetectorANODv5 defaultFilterThresholds]::onceToken != -1) {
    dispatch_once(&+[VNShotflowDetectorANODv5 defaultFilterThresholds]::onceToken, &__block_literal_global_302);
  }
  v2 = (void *)+[VNShotflowDetectorANODv5 defaultFilterThresholds]::filterThresholds;

  return v2;
}

void __51__VNShotflowDetectorANODv5_defaultFilterThresholds__block_invoke()
{
  v3[12] = *MEMORY[0x1E4F143B8];
  v2[0] = @"VNShotflowDetectorFilterThresholdKey_HumanFace";
  v2[1] = @"VNShotflowDetectorFilterThresholdKey_HumanHead";
  v3[0] = &unk_1EF7A80F0;
  v3[1] = &unk_1EF7A8110;
  v2[2] = @"VNShotflowDetectorFilterThresholdKey_HumanBody";
  v2[3] = @"VNShotflowDetectorFilterThresholdKey_CatBody";
  v3[2] = &unk_1EF7A8120;
  v3[3] = &unk_1EF7A8130;
  v2[4] = @"VNShotflowDetectorFilterThresholdKey_DogBody";
  v2[5] = @"VNShotflowDetectorFilterThresholdKey_Other";
  v3[4] = &unk_1EF7A8140;
  v3[5] = &unk_1EF7A8040;
  v2[6] = @"VNShotflowDetectorFilterThresholdKey_Food";
  v2[7] = @"VNShotflowDetectorFilterThresholdKey_Drink";
  v3[6] = &unk_1EF7A8150;
  v3[7] = &unk_1EF7A8160;
  v2[8] = @"VNShotflowDetectorFilterThresholdKey_CatHead";
  v2[9] = @"VNShotflowDetectorFilterThresholdKey_DogHead";
  v3[8] = &unk_1EF7A8170;
  v3[9] = &unk_1EF7A8180;
  v2[10] = @"VNShotflowDetectorFilterThresholdKey_SportsBall";
  v2[11] = @"VNShotflowDetectorFilterThresholdKey_FullBody";
  v3[10] = &unk_1EF7A8190;
  v3[11] = &unk_1EF7A81A0;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:12];
  v1 = (void *)+[VNShotflowDetectorANODv5 defaultFilterThresholds]::filterThresholds;
  +[VNShotflowDetectorANODv5 defaultFilterThresholds]::filterThresholds = v0;
}

+ (id)supportedLabelKeys
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__VNShotflowDetectorANODv5_supportedLabelKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNShotflowDetectorANODv5 supportedLabelKeys]::onceToken != -1) {
    dispatch_once(&+[VNShotflowDetectorANODv5 supportedLabelKeys]::onceToken, block);
  }
  v2 = (void *)+[VNShotflowDetectorANODv5 supportedLabelKeys]::supportedLabelKeys;

  return v2;
}

void __46__VNShotflowDetectorANODv5_supportedLabelKeys__block_invoke(uint64_t a1)
{
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)&OBJC_METACLASS___VNShotflowDetectorANODv5;
  uint64_t v1 = objc_msgSendSuper2(&v3, sel_supportedLabelKeys);
  v2 = (void *)+[VNShotflowDetectorANODv5 supportedLabelKeys]::supportedLabelKeys;
  +[VNShotflowDetectorANODv5 supportedLabelKeys]::supportedLabelKeys = v1;
}

- (void)setFaceBodyDistanceThreshold:(float)a3
{
  self->_faceBodyDistanceThreshold = a3;
}

- (float)faceBodyDistanceThreshold
{
  return self->_faceBodyDistanceThreshold;
}

- (void)setPetFaceThreshold:(float)a3
{
  self->_petFaceThreshold = a3;
}

- (float)petFaceThreshold
{
  return self->_petFaceThreshold;
}

- (id)groupFaceBody:(id)a3
{
  uint64_t v157 = *MEMORY[0x1E4F143B8];
  id v104 = a3;
  objc_super v3 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_325];
  v103 = [v104 filteredArrayUsingPredicate:v3];

  v4 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_327];
  v114 = [v104 filteredArrayUsingPredicate:v4];

  v5 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_329];
  v113 = [v104 filteredArrayUsingPredicate:v5];

  long long v148 = 0u;
  long long v149 = 0u;
  long long v146 = 0u;
  long long v147 = 0u;
  id obj = v103;
  uint64_t v6 = [obj countByEnumeratingWithState:&v146 objects:v156 count:16];
  if (v6)
  {
    uint64_t v111 = *(void *)v147;
    uint64_t v7 = 1;
    do
    {
      uint64_t v115 = v6;
      for (uint64_t i = 0; i != v115; ++i)
      {
        if (*(void *)v147 != v111) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v146 + 1) + 8 * i);
        [v9 setGroupId:v7];
        [v9 boxCenter];
        double v11 = v10;
        double v13 = v12;
        long long v144 = 0u;
        long long v145 = 0u;
        long long v142 = 0u;
        long long v143 = 0u;
        id v14 = v114;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v142 objects:v155 count:16];
        int v119 = v7;
        if (v15)
        {
          int v16 = 0;
          uint64_t v17 = *(void *)v143;
          unsigned int v20 = -1;
          float v21 = 1000000.0;
          do
          {
            uint64_t v22 = 0;
            int v23 = v16;
            v16 += v15;
            do
            {
              if (*(void *)v143 != v17) {
                objc_enumerationMutation(v14);
              }
              v24 = *(void **)(*((void *)&v142 + 1) + 8 * v22);
              if (![v24 groupId])
              {
                [v24 associatedX];
                float v26 = v25;
                [v24 associatedY];
                float v18 = v11;
                float v19 = v13;
                float v28 = vabds_f32(v26, v18) + vabds_f32(v27, v19);
                if (v28 < v21)
                {
                  unsigned int v20 = v23 + v22;
                  float v21 = v28;
                }
              }
              ++v22;
            }
            while (v15 != v22);
            uint64_t v15 = [v14 countByEnumeratingWithState:&v142 objects:v155 count:16];
          }
          while (v15);
        }
        else
        {
          unsigned int v20 = -1;
          float v21 = 1000000.0;
        }

        [(VNShotflowDetectorANODv5 *)self faceBodyDistanceThreshold];
        if (v21 < v29 && (v20 & 0x80000000) == 0)
        {
          v30 = [v14 objectAtIndexedSubscript:v20];
          objc_msgSend(v30, "setGroupId:", objc_msgSend(v9, "groupId"));
        }
        long long v140 = 0u;
        long long v141 = 0u;
        long long v138 = 0u;
        long long v139 = 0u;
        id v31 = v113;
        uint64_t v32 = [v31 countByEnumeratingWithState:&v138 objects:v154 count:16];
        if (v32)
        {
          int v33 = 0;
          uint64_t v34 = *(void *)v139;
          float v35 = v11;
          float v36 = v13;
          unsigned int v37 = -1;
          float v38 = 1000000.0;
          do
          {
            uint64_t v39 = 0;
            int v40 = v33;
            v33 += v32;
            do
            {
              if (*(void *)v139 != v34) {
                objc_enumerationMutation(v31);
              }
              v41 = *(void **)(*((void *)&v138 + 1) + 8 * v39);
              if (![v41 groupId])
              {
                [v41 associatedX];
                float v43 = v42;
                [v41 associatedY];
                float v45 = vabds_f32(v43, v35) + vabds_f32(v44, v36);
                if (v45 < v38)
                {
                  unsigned int v37 = v40 + v39;
                  float v38 = v45;
                }
              }
              ++v39;
            }
            while (v32 != v39);
            uint64_t v32 = [v31 countByEnumeratingWithState:&v138 objects:v154 count:16];
          }
          while (v32);
        }
        else
        {
          unsigned int v37 = -1;
          float v38 = 1000000.0;
        }

        [(VNShotflowDetectorANODv5 *)self faceBodyDistanceThreshold];
        if (v38 < v46 && (v37 & 0x80000000) == 0)
        {
          v47 = [v31 objectAtIndexedSubscript:v37];
          objc_msgSend(v47, "setGroupId:", objc_msgSend(v9, "groupId"));
        }
        uint64_t v7 = (v119 + 1);
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v146 objects:v156 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 1;
  }

  v48 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_331];
  v102 = [v104 filteredArrayUsingPredicate:v48];

  v49 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_333];
  v112 = [v104 filteredArrayUsingPredicate:v49];

  long long v136 = 0u;
  long long v137 = 0u;
  long long v134 = 0u;
  long long v135 = 0u;
  id v106 = v102;
  uint64_t v50 = [v106 countByEnumeratingWithState:&v134 objects:v153 count:16];
  if (v50)
  {
    uint64_t v109 = *(void *)v135;
    do
    {
      uint64_t v51 = 0;
      uint64_t v116 = v50;
      do
      {
        if (*(void *)v135 != v109) {
          objc_enumerationMutation(v106);
        }
        v52 = *(void **)(*((void *)&v134 + 1) + 8 * v51);
        [v52 setGroupId:v7];
        [v52 boxCenter];
        double v54 = v53;
        double v56 = v55;
        long long v132 = 0u;
        long long v133 = 0u;
        long long v130 = 0u;
        long long v131 = 0u;
        id v57 = v112;
        uint64_t v58 = [v57 countByEnumeratingWithState:&v130 objects:v152 count:16];
        int v120 = v7;
        if (v58)
        {
          int v59 = 0;
          uint64_t v60 = *(void *)v131;
          float v61 = v54;
          float v62 = v56;
          unsigned int v63 = -1;
          float v64 = 1000000.0;
          do
          {
            uint64_t v65 = 0;
            int v66 = v59;
            v59 += v58;
            do
            {
              if (*(void *)v131 != v60) {
                objc_enumerationMutation(v57);
              }
              v67 = *(void **)(*((void *)&v130 + 1) + 8 * v65);
              if (![v67 groupId])
              {
                [v67 associatedX];
                float v69 = v68;
                [v67 associatedY];
                float v71 = vabds_f32(v69, v61) + vabds_f32(v70, v62);
                if (v71 < v64)
                {
                  float v64 = v71;
                  unsigned int v63 = v66 + v65;
                }
              }
              ++v65;
            }
            while (v58 != v65);
            uint64_t v58 = [v57 countByEnumeratingWithState:&v130 objects:v152 count:16];
          }
          while (v58);
        }
        else
        {
          unsigned int v63 = -1;
          float v64 = 1000000.0;
        }

        [(VNShotflowDetectorANODv5 *)self faceBodyDistanceThreshold];
        if (v64 < v72 && (v63 & 0x80000000) == 0)
        {
          v73 = [v57 objectAtIndexedSubscript:v63];
          objc_msgSend(v73, "setGroupId:", objc_msgSend(v52, "groupId"));
        }
        uint64_t v7 = (v120 + 1);
        ++v51;
      }
      while (v51 != v116);
      uint64_t v50 = [v106 countByEnumeratingWithState:&v134 objects:v153 count:16];
    }
    while (v50);
  }

  v74 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_335];
  v101 = [v104 filteredArrayUsingPredicate:v74];

  v75 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_337];
  v110 = [v104 filteredArrayUsingPredicate:v75];

  long long v128 = 0u;
  long long v129 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  id v105 = v101;
  uint64_t v76 = [v105 countByEnumeratingWithState:&v126 objects:v151 count:16];
  if (v76)
  {
    uint64_t v107 = *(void *)v127;
    do
    {
      uint64_t v77 = 0;
      uint64_t v117 = v76;
      do
      {
        if (*(void *)v127 != v107) {
          objc_enumerationMutation(v105);
        }
        v78 = *(void **)(*((void *)&v126 + 1) + 8 * v77);
        [v78 setGroupId:v7];
        [v78 boxCenter];
        double v80 = v79;
        double v82 = v81;
        long long v124 = 0u;
        long long v125 = 0u;
        long long v122 = 0u;
        long long v123 = 0u;
        id v83 = v110;
        uint64_t v84 = [v83 countByEnumeratingWithState:&v122 objects:v150 count:16];
        int v121 = v7;
        if (v84)
        {
          int v85 = 0;
          uint64_t v86 = *(void *)v123;
          float v87 = v80;
          float v88 = v82;
          unsigned int v89 = -1;
          float v90 = 1000000.0;
          do
          {
            uint64_t v91 = 0;
            int v92 = v85;
            v85 += v84;
            do
            {
              if (*(void *)v123 != v86) {
                objc_enumerationMutation(v83);
              }
              v93 = *(void **)(*((void *)&v122 + 1) + 8 * v91);
              if (![v93 groupId])
              {
                [v93 associatedX];
                float v95 = v94;
                [v93 associatedY];
                float v97 = vabds_f32(v95, v87) + vabds_f32(v96, v88);
                if (v97 < v90)
                {
                  float v90 = v97;
                  unsigned int v89 = v92 + v91;
                }
              }
              ++v91;
            }
            while (v84 != v91);
            uint64_t v84 = [v83 countByEnumeratingWithState:&v122 objects:v150 count:16];
          }
          while (v84);
        }
        else
        {
          unsigned int v89 = -1;
          float v90 = 1000000.0;
        }

        [(VNShotflowDetectorANODv5 *)self faceBodyDistanceThreshold];
        if (v90 < v98 && (v89 & 0x80000000) == 0)
        {
          v99 = [v83 objectAtIndexedSubscript:v89];
          objc_msgSend(v99, "setGroupId:", objc_msgSend(v78, "groupId"));
        }
        uint64_t v7 = (v121 + 1);
        ++v77;
      }
      while (v77 != v117);
      uint64_t v76 = [v105 countByEnumeratingWithState:&v126 objects:v151 count:16];
    }
    while (v76);
  }

  return v104;
}

BOOL __42__VNShotflowDetectorANODv5_groupFaceBody___block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 label] == 14 || objc_msgSend(v2, "label") == 10;

  return v3;
}

BOOL __42__VNShotflowDetectorANODv5_groupFaceBody___block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 label] == 5;
}

BOOL __42__VNShotflowDetectorANODv5_groupFaceBody___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 label] == 13 || objc_msgSend(v2, "label") == 9;

  return v3;
}

BOOL __42__VNShotflowDetectorANODv5_groupFaceBody___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 label] == 4;
}

BOOL __42__VNShotflowDetectorANODv5_groupFaceBody___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 label] == 12;
}

BOOL __42__VNShotflowDetectorANODv5_groupFaceBody___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 label] == 1 || objc_msgSend(v2, "label") == 2;

  return v3;
}

BOOL __42__VNShotflowDetectorANODv5_groupFaceBody___block_invoke(uint64_t a1, void *a2)
{
  return [a2 label] == 3;
}

- (id)analyzePetFaces:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if ([v8 label] == 10)
        {
          [v8 petFaceScore];
          float v10 = v9;
          [(VNShotflowDetectorANODv5 *)self petFaceThreshold];
          if (v10 > v11) {
            [v8 setLabel:14];
          }
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v5);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v12 = v4;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v12);
        }
        int v16 = *(void **)(*((void *)&v21 + 1) + 8 * j);
        if (objc_msgSend(v16, "label", (void)v21) == 9)
        {
          [v16 petFaceScore];
          float v18 = v17;
          [(VNShotflowDetectorANODv5 *)self petFaceThreshold];
          if (v18 > v19) {
            [v16 setLabel:13];
          }
        }
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v13);
  }

  return v12;
}

- (id)nmsBoxes:(id)a3 usingThresholds:(id)a4
{
  id v21 = a3;
  id v18 = a4;
  unsigned int v20 = self;
  [(VNShotflowDetector *)self nmsThreshold];
  float v7 = v6;
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v19 = [v18 count];
  if (v19)
  {
    for (uint64_t i = 0; i != v19; ++i)
    {
      if (i)
      {
        float v9 = [(VNShotflowDetectorANODv5 *)v20 getIndexBoxes:v21 filterThresholdIndex:i];
        [v22 addObjectsFromArray:v9];
      }
      else
      {
        float v9 = [(VNShotflowDetector *)v20 sortBoxes:v21 filterThresholdIndex:0];
        unint64_t v10 = [v9 count];
        unsigned __int8 v23 = 0;
        std::vector<BOOL>::vector(&__p, v10, &v23);
        if (v10)
        {
          unint64_t v11 = 0;
          do
          {
            id v12 = [v9 objectAtIndexedSubscript:v11];
            uint64_t v13 = *((void *)__p + (v11 >> 6));
            if ((v13 & (1 << v11)) != 0)
            {
              ++v11;
            }
            else
            {
              *((void *)__p + (v11 >> 6)) = v13 | (1 << v11);
              [v22 addObject:v12];
              unint64_t v14 = ++v11;
              if (v11 < v10)
              {
                do
                {
                  if ((*((void *)__p + (v14 >> 6)) & (1 << v14)) == 0)
                  {
                    uint64_t v15 = [v9 objectAtIndexedSubscript:v14];
                    [v12 intersectionOverMinArea:v15];
                    if (v16 > v7) {
                      *((void *)__p + (v14 >> 6)) |= 1 << v14;
                    }
                  }
                  ++v14;
                }
                while (v10 != v14);
              }
            }
          }
          while (v11 != v10);
        }
        if (__p) {
          operator delete(__p);
        }
      }
    }
  }

  return v22;
}

- (id)getIndexBoxes:(id)a3 filterThresholdIndex:(unint64_t)a4
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__VNShotflowDetectorANODv5_getIndexBoxes_filterThresholdIndex___block_invoke;
  v9[3] = &__block_descriptor_40_e46_B24__0__VNShotflowDetection_8__NSDictionary_16l;
  v9[4] = a4;
  float v6 = [MEMORY[0x1E4F28F60] predicateWithBlock:v9];
  float v7 = [v5 filteredArrayUsingPredicate:v6];

  return v7;
}

BOOL __63__VNShotflowDetectorANODv5_getIndexBoxes_filterThresholdIndex___block_invoke(uint64_t a1, void *a2)
{
  return [a2 label] == *(_DWORD *)(a1 + 32) + 1;
}

- (id)processBoxes:(id)a3 withHeight:(float)a4 andWidth:(float)a5 filterThresholds:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = (void *)MEMORY[0x1A6257080]();
  uint64_t v13 = [(VNShotflowDetector *)self filterBoxes:v10 usingThresholds:v11];

  unint64_t v14 = [(VNShotflowDetectorANODv5 *)self nmsBoxes:v13 usingThresholds:v11];

  *(float *)&double v15 = a4;
  *(float *)&double v16 = a5;
  float v17 = [(VNShotflowDetector *)self enforceSquareFaces:v14 withHeight:v15 andWidth:v16];

  id v18 = [(VNShotflowDetectorANODBase *)self mergeHeadsBoxes:v17];

  uint64_t v19 = [(VNShotflowDetectorANODv5 *)self analyzePetFaces:v18];

  unsigned int v20 = [(VNShotflowDetectorANODv5 *)self groupFaceBody:v19];

  v25.receiver = self;
  v25.super_class = (Class)VNShotflowDetectorANODv5;
  *(float *)&double v21 = a4;
  *(float *)&double v22 = a5;
  unsigned __int8 v23 = [(VNShotflowDetector *)&v25 processBoxes:v20 withHeight:v11 andWidth:v21 filterThresholds:v22];

  return v23;
}

- (VNShotflowDetectorANODv5)initWithNetwork:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VNShotflowDetectorANODv5;
  BOOL v3 = [(VNShotflowDetector *)&v7 initWithNetwork:a3];
  id v4 = v3;
  if (v3)
  {
    v3->super.super._nmsThreshold = 0.3;
    v3->_petFaceThreshold = 0.7;
    v3->_faceBodyDistanceThreshold = 0.07;
    id v5 = v3;
  }

  return v4;
}

@end