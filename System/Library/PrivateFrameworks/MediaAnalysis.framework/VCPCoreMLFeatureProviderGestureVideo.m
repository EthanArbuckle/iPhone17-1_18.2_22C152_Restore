@interface VCPCoreMLFeatureProviderGestureVideo
- (BOOL)lrFlip;
- (BOOL)ready;
- (BOOL)scaleUpSmallHandGroup;
- (NSSet)featureNames;
- (VCPCoreMLFeatureProviderGestureVideo)init;
- (id)existingGroupIDs;
- (id)featureValueForName:(id)a3;
- (id)observationsForCurrentGroup;
- (int)rotationInDegrees;
- (void)addLeftHand:(id)a3 andRightHand:(id)a4;
- (void)reset;
- (void)setCurrentGroupID:(int)a3;
- (void)setLrFlip:(BOOL)a3;
- (void)setRotationInDegrees:(int)a3;
- (void)setScaleUpSmallHandGroup:(BOOL)a3;
@end

@implementation VCPCoreMLFeatureProviderGestureVideo

- (VCPCoreMLFeatureProviderGestureVideo)init
{
  v8.receiver = self;
  v8.super_class = (Class)VCPCoreMLFeatureProviderGestureVideo;
  v2 = [(VCPCoreMLFeatureProviderGestureVideo *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    v4 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v3;

    *((_WORD *)v2 + 14) = 0;
    *((_DWORD *)v2 + 8) = 0;
    *(void *)(v2 + 20) = -4294967291;
  }
  if (*((void *)v2 + 1)) {
    v5 = v2;
  }
  else {
    v5 = 0;
  }
  v6 = v5;

  return v6;
}

- (void)addLeftHand:(id)a3 andRightHand:(id)a4
{
  id v21 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x1E4F1CA60] dictionary];
  if (v21) {
    [v7 setObject:v21 forKeyedSubscript:@"leftHand"];
  }
  if (v6) {
    [v7 setObject:v6 forKeyedSubscript:@"rightHand"];
  }
  observationsPersons = self->_observationsPersons;
  v9 = [NSNumber numberWithInt:self->_currentGroupID];
  v10 = [(NSMutableDictionary *)observationsPersons objectForKeyedSubscript:v9];

  if (v10)
  {
    v11 = self->_observationsPersons;
    v12 = [NSNumber numberWithInt:self->_currentGroupID];
    v13 = [(NSMutableDictionary *)v11 objectForKeyedSubscript:v12];
  }
  else
  {
    v13 = [MEMORY[0x1E4F1CA48] array];
  }
  [v13 addObject:v7];
  v14 = self->_observationsPersons;
  v15 = [NSNumber numberWithInt:self->_currentGroupID];
  [(NSMutableDictionary *)v14 setObject:v13 forKeyedSubscript:v15];

  v16 = self->_observationsPersons;
  v17 = [NSNumber numberWithInt:self->_currentGroupID];
  v18 = [(NSMutableDictionary *)v16 objectForKeyedSubscript:v17];
  unint64_t v19 = [v18 count];
  unint64_t channels = self->_channels;

  if (v19 > channels) {
    [v13 removeObjectAtIndex:0];
  }
}

- (void)setCurrentGroupID:(int)a3
{
  self->_currentGroupID = a3;
}

- (id)existingGroupIDs
{
  return (id)[(NSMutableDictionary *)self->_observationsPersons allKeys];
}

- (BOOL)ready
{
  v2 = self;
  observationsPersons = self->_observationsPersons;
  v4 = [NSNumber numberWithInt:self->_currentGroupID];
  v5 = [(NSMutableDictionary *)observationsPersons objectForKeyedSubscript:v4];
  LOBYTE(v2) = [v5 count] >= (unint64_t)v2->_channels;

  return (char)v2;
}

- (void)reset
{
}

- (id)observationsForCurrentGroup
{
  observationsPersons = self->_observationsPersons;
  uint64_t v3 = [NSNumber numberWithInt:self->_currentGroupID];
  v4 = [(NSMutableDictionary *)observationsPersons objectForKeyedSubscript:v3];

  return v4;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F15EE730];
}

- (id)featureValueForName:(id)a3
{
  uint64_t v108 = (uint64_t)&v108;
  v127[3] = *MEMORY[0x1E4F143B8];
  MEMORY[0x1F4188790]((void *)self->_channels, self, a2, a3);
  v112 = &v108 - 2 * v4;
  id v5 = objc_alloc(MEMORY[0x1E4F1E9A8]);
  id v6 = [NSNumber numberWithInt:self->_channels];
  v127[0] = v6;
  v127[1] = &unk_1F15EDB00;
  v127[2] = &unk_1F15EDB18;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v127 count:3];
  id v113 = (id)[v5 initWithShape:v7 dataType:65568 error:0];

  observationsPersons = self->_observationsPersons;
  v9 = [NSNumber numberWithInt:self->_currentGroupID];
  v10 = [(NSMutableDictionary *)observationsPersons objectForKeyedSubscript:v9];
  LODWORD(v7) = [v10 count] == self->_channels;

  if (!v7)
  {
    v106 = 0;
    goto LABEL_92;
  }
  if (self->_channels < 1) {
    goto LABEL_90;
  }
  uint64_t v13 = 0;
  v114 = @"leftHand";
  int v109 = 2;
  float v110 = 0.3;
  float v111 = 0.0;
  do
  {
    v14 = self->_observationsPersons;
    v15 = [NSNumber numberWithInt:self->_currentGroupID];
    v16 = [(NSMutableDictionary *)v14 objectForKeyedSubscript:v15];
    v17 = [v16 objectAtIndexedSubscript:v13];
    v18 = [v17 objectForKeyedSubscript:v114];

    unint64_t v19 = self->_observationsPersons;
    v20 = [NSNumber numberWithInt:self->_currentGroupID];
    id v21 = [(NSMutableDictionary *)v19 objectForKeyedSubscript:v20];
    v22 = [v21 objectAtIndexedSubscript:v13];
    v23 = [v22 objectForKeyedSubscript:@"rightHand"];

    if (self->_lrFlip)
    {
      v24 = self->_observationsPersons;
      v25 = [NSNumber numberWithInt:self->_currentGroupID];
      v26 = [(NSMutableDictionary *)v24 objectForKeyedSubscript:v25];
      v27 = [v26 objectAtIndexedSubscript:v13];
      v28 = [v27 objectForKeyedSubscript:@"rightHand"];

      v29 = self->_observationsPersons;
      v30 = [NSNumber numberWithInt:self->_currentGroupID];
      v31 = [(NSMutableDictionary *)v29 objectForKeyedSubscript:v30];
      v32 = [v31 objectAtIndexedSubscript:v13];
      uint64_t v33 = [v32 objectForKeyedSubscript:v114];

      v23 = (void *)v33;
    }
    else
    {
      v28 = v18;
    }
    id v34 = v113;
    uint64_t v35 = 0;
    v36 = (float *)([v34 dataPointer] + 504 * v13 + 252);
    float v37 = 0.0;
    float v38 = 1.0;
    float v39 = 1.0;
    float v40 = 0.0;
    do
    {
      if (v28)
      {
        v41 = [v28 keypoints];
        v42 = [v41 objectAtIndexedSubscript:v35];
        [v42 location];
        transformLocation(v129, self->_lrFlip, self->_rotationInDegrees);
        double v44 = v43;
        double v46 = v45;

        float v47 = v44;
        *(v36 - 63) = v47;
        float v48 = v46;
        *(v36 - 21) = v48;
        v49 = [v28 keypoints];
        v50 = [v49 objectAtIndexedSubscript:v35];
        [v50 confidence];
        *((_DWORD *)v36 + 21) = v51;

        if (v44 <= v38) {
          float v38 = v44;
        }
        if (v46 <= v39) {
          float v39 = v46;
        }
        if (v44 > v37) {
          float v37 = v44;
        }
        if (v46 > v40) {
          float v40 = v46;
        }
        if (!v23)
        {
LABEL_28:
          *(v36 - 42) = 0.0;
          float *v36 = 0.0;
          v36[42] = 0.0;
          goto LABEL_29;
        }
      }
      else
      {
        *(v36 - 63) = 0.0;
        *(v36 - 21) = 0.0;
        v36[21] = 0.0;
        if (!v23) {
          goto LABEL_28;
        }
      }
      v52 = [v23 keypoints];
      v53 = [v52 objectAtIndexedSubscript:v35];
      [v53 location];
      transformLocation(v130, self->_lrFlip, self->_rotationInDegrees);
      double v55 = v54;
      double v57 = v56;

      float v58 = v55;
      *(v36 - 42) = v58;
      float v59 = v57;
      float *v36 = v59;
      v60 = [v23 keypoints];
      v61 = [v60 objectAtIndexedSubscript:v35];
      [v61 confidence];
      *((_DWORD *)v36 + 42) = v62;

      if (v55 <= v38) {
        float v38 = v55;
      }
      if (v57 <= v39) {
        float v39 = v57;
      }
      if (v55 > v37) {
        float v37 = v55;
      }
      if (v57 > v40) {
        float v40 = v57;
      }
LABEL_29:
      ++v35;
      ++v36;
    }
    while (v35 != 21);
    if (self->_scaleUpSmallHandGroup)
    {
      if (v38 < 1.0) {
        float v63 = v38;
      }
      else {
        float v63 = 1.0;
      }
      BOOL v64 = v38 > 0.0;
      float v65 = 0.0;
      if (v64) {
        float v66 = v63;
      }
      else {
        float v66 = 0.0;
      }
      if (v39 < 1.0) {
        float v67 = v39;
      }
      else {
        float v67 = 1.0;
      }
      if (v39 <= 0.0) {
        float v68 = 0.0;
      }
      else {
        float v68 = v67;
      }
      if (v37 < 1.0) {
        float v69 = v37;
      }
      else {
        float v69 = 1.0;
      }
      if (v37 <= 0.0) {
        float v70 = 0.0;
      }
      else {
        float v70 = v69;
      }
      if (v40 < 1.0) {
        float v71 = v40;
      }
      else {
        float v71 = 1.0;
      }
      if (v40 <= 0.0) {
        float v72 = 0.0;
      }
      else {
        float v72 = v71;
      }
      double v73 = (float)(v70 + v66) * 0.5;
      double v74 = (float)(v72 + v68) * 0.5;
      v75 = (double *)&v112[2 * v13];
      double *v75 = v73;
      v75[1] = v74;
      if (v28)
      {
        [v28 bounds];
        double v77 = v76;
        [v28 bounds];
        float v65 = fmax((v77 + v78) * 0.5, 0.0);
      }
      if (v23)
      {
        [v23 bounds];
        double v80 = v79;
        [v23 bounds];
        double v82 = (v80 + v81) * 0.5;
        if (v82 > v65)
        {
          float v83 = v82;
          float v65 = v83;
        }
      }
      if (v65 > 0.0)
      {
        float v84 = v110 / v65;
        if (v111 >= (float)(v110 / v65)) {
          float v84 = v111;
        }
        double v85 = v73 / (v73 - v66);
        if (v85 >= v74 / (v74 - v68)) {
          double v85 = v74 / (v74 - v68);
        }
        float v86 = v85;
        double v87 = (1.0 - v73) / (v70 - v73);
        double v88 = v72 - v74;
        if (v87 >= (1.0 - v74) / v88) {
          double v87 = (1.0 - v74) / v88;
        }
        float v89 = v87;
        if (v86 >= v89) {
          float v90 = v87;
        }
        else {
          float v90 = v86;
        }
        if (v84 < v90) {
          float v90 = v84;
        }
        BOOL v64 = v84 > 0.0;
        float v91 = 0.0;
        if (v64) {
          float v91 = v90;
        }
        float v111 = v91;
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          v92 = VCPLogInstance();
          if (os_log_type_enabled(v92, (os_log_type_t)v109))
          {
            *(_DWORD *)buf = 134219264;
            double v116 = v111;
            __int16 v117 = 2048;
            double v118 = v73;
            __int16 v119 = 2048;
            double v120 = (float)(v72 + v68) * 0.5;
            __int16 v121 = 2048;
            double v122 = v65;
            __int16 v123 = 2048;
            double v124 = v86;
            __int16 v125 = 2048;
            double v126 = v89;
            _os_log_impl(&dword_1BBEDA000, v92, (os_log_type_t)v109, "Adjusted scaleF %.2f, groupCenter [%.2f,%.2f], refHandSize %.2f, upperBounds:%.2f,%.2f", buf, 0x3Eu);
          }
        }
      }
    }

    ++v13;
  }
  while (v13 < self->_channels);
  if (self->_scaleUpSmallHandGroup)
  {
    LODWORD(v11) = 1.0;
    *(float *)&double v12 = v111;
    if (v111 > 1.0)
    {
      int v93 = MediaAnalysisLogLevel();
      *(float *)&double v11 = v111;
      double v94 = v111;
      os_log_type_t v95 = v109;
      if (v93 >= 7)
      {
        v96 = VCPLogInstance();
        if (os_log_type_enabled(v96, v95))
        {
          *(_DWORD *)buf = 134217984;
          double v116 = v94;
          _os_log_impl(&dword_1BBEDA000, v96, v95, "VCPCoreMLFeatureProviderGestureVideo: scaling up small hands, scale factor %.2f", buf, 0xCu);
        }
      }
      if (self->_channels >= 1)
      {
        uint64_t v97 = 0;
        do
        {
          uint64_t v98 = [objc_retainAutorelease(v34) dataPointer] + ((0x7E00000000 * v97) >> 30);
          v99 = (double *)&v112[2 * v97];
          double v11 = *v99;
          double v12 = v99[1];
          for (uint64_t i = 84; i != 168; i += 4)
          {
            v101 = (float *)(v98 + i);
            float v102 = v11 + v94 * (*(float *)(v98 + i - 84) - v11);
            float v103 = v12 + v94 * (*(float *)(v98 + i + 84) - v12);
            float v104 = v11 + v94 * (*(float *)(v98 + i) - v11);
            float v105 = v12 + v94 * (*(float *)(v98 + i + 168) - v12);
            *(v101 - 21) = v102;
            v101[21] = v103;
            float *v101 = v104;
            v101[42] = v105;
          }
          ++v97;
        }
        while (v97 < self->_channels);
      }
    }
  }
LABEL_90:
  v106 = objc_msgSend(MEMORY[0x1E4F1E950], "featureValueWithMultiArray:", v113, v11, v12);
LABEL_92:

  return v106;
}

- (BOOL)lrFlip
{
  return self->_lrFlip;
}

- (void)setLrFlip:(BOOL)a3
{
  self->_lrFlip = a3;
}

- (BOOL)scaleUpSmallHandGroup
{
  return self->_scaleUpSmallHandGroup;
}

- (void)setScaleUpSmallHandGroup:(BOOL)a3
{
  self->_scaleUpSmallHandGroup = a3;
}

- (int)rotationInDegrees
{
  return self->_rotationInDegrees;
}

- (void)setRotationInDegrees:(int)a3
{
  self->_rotationInDegrees = a3;
}

- (void).cxx_destruct
{
}

@end