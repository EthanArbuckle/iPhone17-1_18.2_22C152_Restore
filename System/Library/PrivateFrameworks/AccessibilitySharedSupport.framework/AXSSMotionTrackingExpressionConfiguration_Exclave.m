@interface AXSSMotionTrackingExpressionConfiguration_Exclave
+ ($AA6A45B2DFCED8527C3A0E9A46B0D48F)emptyAccessibilityExpressions;
+ (BOOL)_jawOpenStartingWithValue:(float)a3 mouthClose:(float)a4 forActivation:(unint64_t)a5;
+ (float)_minConfidenceExpressionStarted:(unint64_t)a3 forActivation:(unint64_t)a4;
+ (id)_facialExpressionToActivationToValueMapping;
- ($AA6A45B2DFCED8527C3A0E9A46B0D48F)previousExpressions;
- ($AA6A45B2DFCED8527C3A0E9A46B0D48F)processIncomingExpressions:(SEL)a3;
- (void)setPreviousExpressions:(id *)a3;
@end

@implementation AXSSMotionTrackingExpressionConfiguration_Exclave

- ($AA6A45B2DFCED8527C3A0E9A46B0D48F)processIncomingExpressions:(SEL)a3
{
  v5 = retstr;
  uint64_t v103 = *MEMORY[0x1E4F143B8];
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
  +[AXSSMotionTrackingExpressionConfiguration_Exclave emptyAccessibilityExpressions];
  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  uint64_t v70 = [&unk_1F0C67080 countByEnumeratingWithState:&v98 objects:v102 count:16];
  if (v70)
  {
    uint64_t v64 = *(void *)v99;
    v68 = v5;
    float v66 = var12;
    float v67 = var11;
    float v65 = var13;
    do
    {
      for (uint64_t i = 0; i != v70; ++i)
      {
        if (*(void *)v99 != v64) {
          objc_enumerationMutation(&unk_1F0C67080);
        }
        unint64_t v11 = [*(id *)(*((void *)&v98 + 1) + 8 * i) unsignedIntegerValue];
        [(id)objc_opt_class() _minConfidenceExpressionStarted:3 forActivation:v11];
        float v13 = v12;
        [(id)objc_opt_class() _minConfidenceExpressionStarted:2 forActivation:v11];
        float v15 = v14;
        [(id)objc_opt_class() _minConfidenceExpressionStarted:1 forActivation:v11];
        float v17 = v16;
        [(id)objc_opt_class() _minConfidenceExpressionStarted:0 forActivation:v11];
        float v19 = v18;
        [(id)objc_opt_class() _minConfidenceExpressionStarted:4 forActivation:v11];
        float v21 = v20;
        [(id)objc_opt_class() _minConfidenceExpressionStarted:5 forActivation:v11];
        float v23 = v22;
        [(id)objc_opt_class() _minConfidenceExpressionStarted:6 forActivation:v11];
        float v78 = v24;
        [(id)objc_opt_class() _minConfidenceExpressionStarted:7 forActivation:v11];
        float v77 = v25;
        [(id)objc_opt_class() _minConfidenceExpressionStarted:8 forActivation:v11];
        float v76 = v26;
        BOOL v27 = var2 > v15 && var1 > v15;
        BOOL v28 = var6 > v19 && var5 > v19;
        BOOL v29 = var8 > v21 && var7 > v21;
        BOOL v30 = var10 > v23;
        if (var9 <= v23) {
          BOOL v30 = 0;
        }
        BOOL v74 = v29;
        BOOL v75 = v30;
        BOOL v72 = v27;
        BOOL v73 = v28;
        if (var3 <= v17)
        {
          int v71 = 0;
        }
        else
        {
          v31 = objc_opt_class();
          *(float *)&double v32 = var3;
          *(float *)&double v33 = var4;
          int v71 = [v31 _jawOpenStartingWithValue:v11 mouthClose:v32 forActivation:v33];
        }
        [(AXSSMotionTrackingExpressionConfiguration_Exclave *)self previousExpressions];
        [(AXSSMotionTrackingExpressionConfiguration_Exclave *)self previousExpressions];
        [(AXSSMotionTrackingExpressionConfiguration_Exclave *)self previousExpressions];
        [(AXSSMotionTrackingExpressionConfiguration_Exclave *)self previousExpressions];
        [(AXSSMotionTrackingExpressionConfiguration_Exclave *)self previousExpressions];
        [(AXSSMotionTrackingExpressionConfiguration_Exclave *)self previousExpressions];
        [(AXSSMotionTrackingExpressionConfiguration_Exclave *)self previousExpressions];
        [(AXSSMotionTrackingExpressionConfiguration_Exclave *)self previousExpressions];
        [(AXSSMotionTrackingExpressionConfiguration_Exclave *)self previousExpressions];
        float v34 = v19 * 0.375;
        float v35 = v21 * 0.95;
        float v36 = v23 * 0.65;
        BOOL v38 = var1 > (float)(v15 * 0.61538) && v97 >= v11;
        BOOL v39 = var2 > (float)(v15 * 0.61538) && v38;
        BOOL v41 = var3 > (float)(v17 * 0.5) && v96 >= v11;
        BOOL v43 = var5 > v34 && v94 >= v11;
        BOOL v44 = var6 > v34 && v43;
        BOOL v46 = var8 > v35 && v93 >= v11;
        BOOL v47 = var7 > v35 && v46;
        BOOL v49 = var10 > v36 && v92 >= v11;
        BOOL v50 = var9 > v36 && v49;
        BOOL v52 = v65 > (float)(v78 * 0.6) && v91 >= v11;
        BOOL v54 = v66 > (float)(v76 * 0.6) && v89 >= v11;
        BOOL v56 = v67 > (float)(v77 * 0.6) && v90 >= v11;
        BOOL v57 = var0 > (float)(v13 * 0.1) && v95 >= v11;
        int v58 = var0 > v13;
        if (v57) {
          int v58 = 1;
        }
        v5 = v68;
        if (v72 || v39) {
          v68->float var2 = v11;
        }
        if ((v71 & ~v58 | v41) == 1) {
          v68->float var1 = v11;
        }
        if (v58) {
          v68->float var3 = v11;
        }
        if (v73 || v44) {
          v68->float var0 = v11;
        }
        if (v74 || v47) {
          v68->float var4 = v11;
        }
        if (v75 || v50) {
          v68->float var5 = v11;
        }
        if (v66 > v76) {
          BOOL v54 = 1;
        }
        if (v54) {
          v68->float var7 = v11;
        }
        if (v67 > v77) {
          BOOL v56 = 1;
        }
        if (v56)
        {
          v68->float var8 = v11;
          unint64_t v59 = v11;
        }
        else
        {
          unint64_t v59 = v68->var8;
        }
        if (v65 > v78) {
          BOOL v52 = 1;
        }
        if (!v68->var7 && !v59 && v52) {
          v68->float var6 = v11;
        }
      }
      uint64_t v70 = [&unk_1F0C67080 countByEnumeratingWithState:&v98 objects:v102 count:16];
    }
    while (v70);
  }
  long long v60 = *(_OWORD *)&v5->var6;
  v87[2] = *(_OWORD *)&v5->var4;
  v87[3] = v60;
  unint64_t v88 = v5->var8;
  long long v61 = *(_OWORD *)&v5->var2;
  v87[0] = *(_OWORD *)&v5->var0;
  v87[1] = v61;
  return ($AA6A45B2DFCED8527C3A0E9A46B0D48F *)[(AXSSMotionTrackingExpressionConfiguration_Exclave *)self setPreviousExpressions:v87];
}

+ (float)_minConfidenceExpressionStarted:(unint64_t)a3 forActivation:(unint64_t)a4
{
  v6 = [(id)objc_opt_class() _facialExpressionToActivationToValueMapping];
  v7 = [NSNumber numberWithUnsignedInteger:a3];
  v8 = [v6 objectForKeyedSubscript:v7];
  v9 = [NSNumber numberWithUnsignedInteger:a4];
  v10 = [v8 objectForKeyedSubscript:v9];
  [v10 floatValue];
  float v12 = v11;

  return v12;
}

+ (id)_facialExpressionToActivationToValueMapping
{
  if (_facialExpressionToActivationToValueMapping_onceToken != -1) {
    dispatch_once(&_facialExpressionToActivationToValueMapping_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)_facialExpressionToActivationToValueMapping_facialExpressionToSensitivityToValueMapping;

  return v2;
}

+ (BOOL)_jawOpenStartingWithValue:(float)a3 mouthClose:(float)a4 forActivation:(unint64_t)a5
{
  float v5 = vabds_f32(a3, a4);
  if (a5 - 1 <= 1) {
    return v5 >= 0.05;
  }
  return v5 >= 0.1 && a5 == 3;
}

+ ($AA6A45B2DFCED8527C3A0E9A46B0D48F)emptyAccessibilityExpressions
{
  retstr->float var8 = 0;
  *(_OWORD *)&retstr->float var4 = 0u;
  *(_OWORD *)&retstr->float var6 = 0u;
  *(_OWORD *)&retstr->float var0 = 0u;
  *(_OWORD *)&retstr->float var2 = 0u;
  return result;
}

- ($AA6A45B2DFCED8527C3A0E9A46B0D48F)previousExpressions
{
  long long v3 = *(_OWORD *)&self->var3;
  long long v4 = *(_OWORD *)&self->var7;
  *(_OWORD *)&retstr->float var4 = *(_OWORD *)&self->var5;
  *(_OWORD *)&retstr->float var6 = v4;
  retstr->float var8 = self[1].var0;
  *(_OWORD *)&retstr->float var0 = *(_OWORD *)&self->var1;
  *(_OWORD *)&retstr->float var2 = v3;
  return self;
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

@end