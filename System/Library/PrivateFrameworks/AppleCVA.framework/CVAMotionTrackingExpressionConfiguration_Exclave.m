@interface CVAMotionTrackingExpressionConfiguration_Exclave
+ ($AA6A45B2DFCED8527C3A0E9A46B0D48F)_emptyAccessibilityExpressions;
+ (BOOL)_jawOpenStartingWithValue:(float)a3 mouthClose:(float)a4 forActivation:(unint64_t)a5;
+ (float)_minConfidenceExpressionStarted:(unint64_t)a3 forActivation:(unint64_t)a4;
+ (id)_facialExpressionToActivationToValueMapping;
- ($AA6A45B2DFCED8527C3A0E9A46B0D48F)previousExpressions;
- ($AA6A45B2DFCED8527C3A0E9A46B0D48F)processIncomingExpressions:(SEL)a3;
- (void)setPreviousExpressions:(id *)a3;
@end

@implementation CVAMotionTrackingExpressionConfiguration_Exclave

+ (BOOL)_jawOpenStartingWithValue:(float)a3 mouthClose:(float)a4 forActivation:(unint64_t)a5
{
  float v5 = a3 - a4;
  BOOL v7 = v5 >= 0.1 && a5 == 3;
  if (a5 - 1 <= 1) {
    return v5 >= 0.05;
  }
  else {
    return v7;
  }
}

+ (id)_facialExpressionToActivationToValueMapping
{
  if (qword_1EA6437D8 != -1) {
    dispatch_once(&qword_1EA6437D8, &unk_1F26F55A8);
  }
  v2 = (void *)qword_1EA6437D0;
  return v2;
}

+ (float)_minConfidenceExpressionStarted:(unint64_t)a3 forActivation:(unint64_t)a4
{
  v6 = [(id)objc_opt_class() _facialExpressionToActivationToValueMapping];
  BOOL v7 = [NSNumber numberWithUnsignedInteger:a3];
  v8 = [v6 objectForKeyedSubscript:v7];
  v9 = [NSNumber numberWithUnsignedInteger:a4];
  v10 = [v8 objectForKeyedSubscript:v9];
  [v10 floatValue];
  float v12 = v11;

  return v12;
}

+ ($AA6A45B2DFCED8527C3A0E9A46B0D48F)_emptyAccessibilityExpressions
{
  retstr->var8 = 0;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  return result;
}

- (void)setPreviousExpressions:(id *)a3
{
  *(_OWORD *)&self->_previousExpressions.raiseEyebrows = *(_OWORD *)&a3->var0;
  long long v3 = *(_OWORD *)&a3->var2;
  long long v4 = *(_OWORD *)&a3->var4;
  long long v5 = *(_OWORD *)&a3->var6;
  self->_previousExpressions.puckerLipsRight = a3->var8;
  *(_OWORD *)&self->_previousExpressions.mouthPuckerCenter = v5;
  *(_OWORD *)&self->_previousExpressions.eyeBlink = v4;
  *(_OWORD *)&self->_previousExpressions.smile = v3;
}

- ($AA6A45B2DFCED8527C3A0E9A46B0D48F)previousExpressions
{
  long long v3 = *(_OWORD *)&self->var3;
  long long v4 = *(_OWORD *)&self->var7;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self->var5;
  *(_OWORD *)&retstr->var6 = v4;
  retstr->var8 = self[1].var0;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var1;
  *(_OWORD *)&retstr->var2 = v3;
  return self;
}

- ($AA6A45B2DFCED8527C3A0E9A46B0D48F)processIncomingExpressions:(SEL)a3
{
  long long v5 = retstr;
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  float var0 = a4->var0;
  float var3 = a4->var3;
  float var2 = a4->var2;
  float var1 = a4->var1;
  float var4 = a4->var4;
  float var6 = a4->var6;
  float var5 = a4->var5;
  float var8 = a4->var8;
  float var7 = a4->var7;
  float var11 = a4->var11;
  float var10 = a4->var10;
  float var9 = a4->var9;
  float var12 = a4->var12;
  float var13 = a4->var13;
  *(_OWORD *)&retstr->float var0 = 0u;
  *(_OWORD *)&retstr->float var2 = 0u;
  *(_OWORD *)&retstr->float var4 = 0u;
  *(_OWORD *)&retstr->float var6 = 0u;
  retstr->float var8 = 0;
  v10 = objc_opt_class();
  if (v10)
  {
    [v10 _emptyAccessibilityExpressions];
  }
  else
  {
    v5->float var8 = 0;
    *(_OWORD *)&v5->float var4 = 0u;
    *(_OWORD *)&v5->float var6 = 0u;
    *(_OWORD *)&v5->float var0 = 0u;
    *(_OWORD *)&v5->float var2 = 0u;
  }
  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  uint64_t v71 = [&unk_1F26F9438 countByEnumeratingWithState:&v99 objects:v103 count:16];
  if (v71)
  {
    uint64_t v65 = *(void *)v100;
    v69 = v5;
    float v67 = var12;
    float v68 = var11;
    float v66 = var13;
    do
    {
      for (uint64_t i = 0; i != v71; ++i)
      {
        if (*(void *)v100 != v65) {
          objc_enumerationMutation(&unk_1F26F9438);
        }
        unint64_t v12 = [*(id *)(*((void *)&v99 + 1) + 8 * i) unsignedIntegerValue];
        [(id)objc_opt_class() _minConfidenceExpressionStarted:3 forActivation:v12];
        float v14 = v13;
        [(id)objc_opt_class() _minConfidenceExpressionStarted:2 forActivation:v12];
        float v16 = v15;
        [(id)objc_opt_class() _minConfidenceExpressionStarted:1 forActivation:v12];
        float v18 = v17;
        [(id)objc_opt_class() _minConfidenceExpressionStarted:0 forActivation:v12];
        float v20 = v19;
        [(id)objc_opt_class() _minConfidenceExpressionStarted:4 forActivation:v12];
        float v22 = v21;
        [(id)objc_opt_class() _minConfidenceExpressionStarted:5 forActivation:v12];
        float v24 = v23;
        [(id)objc_opt_class() _minConfidenceExpressionStarted:6 forActivation:v12];
        float v79 = v25;
        [(id)objc_opt_class() _minConfidenceExpressionStarted:7 forActivation:v12];
        float v78 = v26;
        [(id)objc_opt_class() _minConfidenceExpressionStarted:8 forActivation:v12];
        float v77 = v27;
        BOOL v28 = var2 > v16 && var1 > v16;
        BOOL v29 = var6 > v20 && var5 > v20;
        BOOL v30 = var8 > v22 && var7 > v22;
        BOOL v31 = var10 > v24;
        if (var9 <= v24) {
          BOOL v31 = 0;
        }
        BOOL v75 = v30;
        BOOL v76 = v31;
        BOOL v73 = v28;
        BOOL v74 = v29;
        if (var3 <= v18)
        {
          int v72 = 0;
        }
        else
        {
          v32 = objc_opt_class();
          *(float *)&double v33 = var3;
          *(float *)&double v34 = var4;
          int v72 = [v32 _jawOpenStartingWithValue:v12 mouthClose:v33 forActivation:v34];
        }
        [(CVAMotionTrackingExpressionConfiguration_Exclave *)self previousExpressions];
        [(CVAMotionTrackingExpressionConfiguration_Exclave *)self previousExpressions];
        [(CVAMotionTrackingExpressionConfiguration_Exclave *)self previousExpressions];
        [(CVAMotionTrackingExpressionConfiguration_Exclave *)self previousExpressions];
        [(CVAMotionTrackingExpressionConfiguration_Exclave *)self previousExpressions];
        [(CVAMotionTrackingExpressionConfiguration_Exclave *)self previousExpressions];
        [(CVAMotionTrackingExpressionConfiguration_Exclave *)self previousExpressions];
        [(CVAMotionTrackingExpressionConfiguration_Exclave *)self previousExpressions];
        [(CVAMotionTrackingExpressionConfiguration_Exclave *)self previousExpressions];
        float v35 = v20 * 0.375;
        float v36 = v22 * 0.95;
        float v37 = v24 * 0.65;
        BOOL v39 = var1 > (float)(v16 * 0.61538) && v98 >= v12;
        BOOL v40 = var2 > (float)(v16 * 0.61538) && v39;
        BOOL v42 = var3 > (float)(v18 * 0.5) && v97 >= v12;
        BOOL v44 = var5 > v35 && v95 >= v12;
        BOOL v45 = var6 > v35 && v44;
        BOOL v47 = var8 > v36 && v94 >= v12;
        BOOL v48 = var7 > v36 && v47;
        BOOL v50 = var10 > v37 && v93 >= v12;
        BOOL v51 = var9 > v37 && v50;
        BOOL v53 = v66 > (float)(v79 * 0.6) && v92 >= v12;
        BOOL v55 = v67 > (float)(v77 * 0.6) && v90 >= v12;
        BOOL v57 = v68 > (float)(v78 * 0.6) && v91 >= v12;
        BOOL v58 = var0 > (float)(v14 * 0.1) && v96 >= v12;
        int v59 = var0 > v14;
        if (v58) {
          int v59 = 1;
        }
        long long v5 = v69;
        if (v73 || v40) {
          v69->float var2 = v12;
        }
        if ((v72 & ~v59 | v42) == 1) {
          v69->float var1 = v12;
        }
        if (v59) {
          v69->float var3 = v12;
        }
        if (v74 || v45) {
          v69->float var0 = v12;
        }
        if (v75 || v48) {
          v69->float var4 = v12;
        }
        if (v76 || v51) {
          v69->float var5 = v12;
        }
        if (v67 > v77) {
          BOOL v55 = 1;
        }
        if (v55) {
          v69->float var7 = v12;
        }
        if (v68 > v78) {
          BOOL v57 = 1;
        }
        if (v57)
        {
          v69->float var8 = v12;
          unint64_t v60 = v12;
        }
        else
        {
          unint64_t v60 = v69->var8;
        }
        if (v66 > v79) {
          BOOL v53 = 1;
        }
        if (!v69->var7 && !v60 && v53) {
          v69->float var6 = v12;
        }
      }
      uint64_t v71 = [&unk_1F26F9438 countByEnumeratingWithState:&v99 objects:v103 count:16];
    }
    while (v71);
  }
  long long v61 = *(_OWORD *)&v5->var6;
  v88[2] = *(_OWORD *)&v5->var4;
  v88[3] = v61;
  unint64_t v89 = v5->var8;
  long long v62 = *(_OWORD *)&v5->var2;
  v88[0] = *(_OWORD *)&v5->var0;
  v88[1] = v62;
  return ($AA6A45B2DFCED8527C3A0E9A46B0D48F *)[(CVAMotionTrackingExpressionConfiguration_Exclave *)self setPreviousExpressions:v88];
}

@end