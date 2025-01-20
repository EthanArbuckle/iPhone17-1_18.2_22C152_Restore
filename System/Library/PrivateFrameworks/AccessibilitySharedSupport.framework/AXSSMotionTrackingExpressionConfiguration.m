@interface AXSSMotionTrackingExpressionConfiguration
+ ($569BC8A4F588CCDEF576D5B50041512B)convertIncomingExpressionsToExclaveBlendshapesOutput:(SEL)a3;
+ (BOOL)_expressionIsActive:(unint64_t)a3 usingExclaveOutput:(id *)a4 expressionConfiguration:(id)a5;
+ (BOOL)_jawOpenStartingWithValue:(float)a3 mouthClose:(float)a4 expressionConfiguration:(id)a5;
+ (BOOL)supportsSecureCoding;
+ (float)_minConfidenceExpressionStarted:(unint64_t)a3 usingExpressionConfiguration:(id)a4;
+ (id)_defaultSensitivitiesForAllFacialExpressions;
+ (id)_facialExpressionToSensitivityToValueMapping;
+ (id)_populateExpressionArraysForProcessedExpressions:(id)a3 previousExpressions:(id)a4 startExpressionsOutSet:(id *)a5 endExpressionsOutSet:(id *)a6;
+ (id)defaultExpressionConfiguration;
+ (id)processExclaveDetectedExpressions:(id *)a3 previousExpressions:(id)a4 expressionConfiguration:(id)a5 startExpressionsOutSet:(id *)a6 endExpressionsOutSet:(id *)a7;
+ (id)processIncomingExpressions:(id)a3 previousExpressions:(id)a4 expressionConfiguration:(id)a5 startExpressionsOutSet:(id *)a6 endExpressionsOutSet:(id *)a7;
+ (unint64_t)_activationForFacialExpression:(unint64_t)a3 usingExclaveExpressions:(id *)a4;
- (AXSSMotionTrackingExpressionConfiguration)init;
- (AXSSMotionTrackingExpressionConfiguration)initWithCoder:(id)a3;
- (AXSSMotionTrackingExpressionConfiguration)initWithPlistDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMotionTrackingExpressionConfiguration:(id)a3;
- (NSDictionary)plistDictionary;
- (NSMutableDictionary)_facialExpressionToSensitivity;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)sensitivityForFacialExpression:(unint64_t)a3;
- (void)_safelySetSensitivity:(unint64_t)a3 forFacialExpression:(unint64_t)a4 inDictionary:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)plistDictionary;
- (void)setSensitivity:(unint64_t)a3 forFacialExpression:(unint64_t)a4;
- (void)set_facialExpressionToSensitivity:(id)a3;
@end

@implementation AXSSMotionTrackingExpressionConfiguration

- (AXSSMotionTrackingExpressionConfiguration)init
{
  v7.receiver = self;
  v7.super_class = (Class)AXSSMotionTrackingExpressionConfiguration;
  v2 = [(AXSSMotionTrackingExpressionConfiguration *)&v7 init];
  if (v2)
  {
    v3 = [(id)objc_opt_class() _defaultSensitivitiesForAllFacialExpressions];
    uint64_t v4 = [v3 mutableCopy];
    facialExpressionToSensitivity = v2->__facialExpressionToSensitivity;
    v2->__facialExpressionToSensitivity = (NSMutableDictionary *)v4;
  }
  return v2;
}

+ (id)defaultExpressionConfiguration
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (AXSSMotionTrackingExpressionConfiguration)initWithPlistDictionary:(id)a3
{
  v28[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__1;
  v26 = __Block_byref_object_dispose__1;
  v5 = [(id)objc_opt_class() _defaultSensitivitiesForAllFacialExpressions];
  id v27 = (id)[v5 mutableCopy];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = NSStringFromSelector(sel__facialExpressionToSensitivity);
    objc_super v7 = [v4 objectForKeyedSubscript:v6];

    v8 = (void *)MEMORY[0x1E4F28DC0];
    v9 = (void *)MEMORY[0x1E4F1CAD0];
    v28[0] = objc_opt_class();
    v28[1] = objc_opt_class();
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
    v11 = [v9 setWithArray:v10];
    id v21 = 0;
    v12 = [v8 unarchivedObjectOfClasses:v11 fromData:v7 error:&v21];
    id v13 = v21;

    if (!v13)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __69__AXSSMotionTrackingExpressionConfiguration_initWithPlistDictionary___block_invoke;
        v18[3] = &unk_1E606CEB8;
        v20 = &v22;
        v19 = self;
        [v12 enumerateKeysAndObjectsUsingBlock:v18];
      }
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)AXSSMotionTrackingExpressionConfiguration;
  v14 = [(AXSSMotionTrackingExpressionConfiguration *)&v17 init];
  v15 = v14;
  if (v14) {
    objc_storeStrong((id *)&v14->__facialExpressionToSensitivity, (id)v23[5]);
  }
  _Block_object_dispose(&v22, 8);

  return v15;
}

void __69__AXSSMotionTrackingExpressionConfiguration_initWithPlistDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
      {
        uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
        uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
        v8 = *(void **)(v7 + 40);
        *(void *)(v7 + 40) = v6;
      }
      objc_msgSend(*(id *)(a1 + 32), "_safelySetSensitivity:forFacialExpression:inDictionary:", objc_msgSend(v5, "unsignedIntegerValue"), objc_msgSend(v9, "unsignedIntegerValue"), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
    }
  }
}

- (NSDictionary)plistDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(AXSSMotionTrackingExpressionConfiguration *)self _facialExpressionToSensitivity];

  if (v4)
  {
    id v5 = (void *)MEMORY[0x1E4F28DB0];
    uint64_t v6 = [(AXSSMotionTrackingExpressionConfiguration *)self _facialExpressionToSensitivity];
    uint64_t v7 = (void *)[v6 copy];
    id v14 = 0;
    v8 = [v5 archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v14];
    id v9 = v14;
    v10 = NSStringFromSelector(sel__facialExpressionToSensitivity);
    [v3 setObject:v8 forKeyedSubscript:v10];

    if (v9)
    {
      v11 = AXSSLogForCategory(2);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        [(AXSSMotionTrackingExpressionConfiguration *)self plistDictionary];
      }
    }
  }
  v12 = (void *)[v3 copy];

  return (NSDictionary *)v12;
}

- (unint64_t)sensitivityForFacialExpression:(unint64_t)a3
{
  id v5 = [(AXSSMotionTrackingExpressionConfiguration *)self _facialExpressionToSensitivity];
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];

  if (!v7) {
    return 0;
  }
  v8 = [(AXSSMotionTrackingExpressionConfiguration *)self _facialExpressionToSensitivity];
  id v9 = [NSNumber numberWithUnsignedInteger:a3];
  v10 = [v8 objectForKeyedSubscript:v9];
  unint64_t v11 = [v10 unsignedIntegerValue];

  return v11;
}

- (void)setSensitivity:(unint64_t)a3 forFacialExpression:(unint64_t)a4
{
  id v7 = [(AXSSMotionTrackingExpressionConfiguration *)self _facialExpressionToSensitivity];
  [(AXSSMotionTrackingExpressionConfiguration *)self _safelySetSensitivity:a3 forFacialExpression:a4 inDictionary:v7];
}

+ (id)processIncomingExpressions:(id)a3 previousExpressions:(id)a4 expressionConfiguration:(id)a5 startExpressionsOutSet:(id *)a6 endExpressionsOutSet:(id *)a7
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [v11 objectForKeyedSubscript:@"TongueOut"];
  [v12 floatValue];
  float v127 = v13;

  id v14 = [v11 objectForKeyedSubscript:@"MouthSmileLeft"];
  [v14 floatValue];
  float v129 = v15;

  v16 = [v11 objectForKeyedSubscript:@"MouthSmileRight"];
  [v16 floatValue];
  float v126 = v17;

  v18 = [v11 objectForKeyedSubscript:@"JawOpen"];
  [v18 floatValue];
  float v20 = v19;

  id v21 = [v11 objectForKeyedSubscript:@"MouthClose"];
  [v21 floatValue];
  int v110 = v22;

  v23 = [v11 objectForKeyedSubscript:@"BrowOuterUpLeft"];
  [v23 floatValue];
  float v123 = v24;

  v25 = [v11 objectForKeyedSubscript:@"BrowOuterUpRight"];
  [v25 floatValue];
  float v115 = v26;

  id v27 = [v11 objectForKeyedSubscript:@"EyeBlinkRight"];
  [v27 floatValue];
  float v121 = v28;

  v29 = [v11 objectForKeyedSubscript:@"EyeBlinkLeft"];
  [v29 floatValue];
  float v120 = v30;

  v31 = [v11 objectForKeyedSubscript:@"NoseSneerRight"];
  [v31 floatValue];
  float v118 = v32;

  v33 = [v11 objectForKeyedSubscript:@"NoseSneerLeft"];
  [v33 floatValue];
  float v116 = v34;

  v35 = [v11 objectForKeyedSubscript:@"MouthRight"];
  [v35 floatValue];
  float v124 = v36;

  v37 = [v11 objectForKeyedSubscript:@"MouthLeft"];
  [v37 floatValue];
  float v125 = v38;

  v39 = [v11 objectForKeyedSubscript:@"MouthPucker"];

  [v39 floatValue];
  float v122 = v40;

  [(id)objc_opt_class() _minConfidenceExpressionStarted:4 usingExpressionConfiguration:v9];
  float v42 = v41;
  [(id)objc_opt_class() _minConfidenceExpressionStarted:3 usingExpressionConfiguration:v9];
  float v113 = v43;
  [(id)objc_opt_class() _minConfidenceExpressionStarted:2 usingExpressionConfiguration:v9];
  float v45 = v44;
  [(id)objc_opt_class() _minConfidenceExpressionStarted:1 usingExpressionConfiguration:v9];
  float v47 = v46;
  [(id)objc_opt_class() _minConfidenceExpressionStarted:5 usingExpressionConfiguration:v9];
  float v49 = v48;
  [(id)objc_opt_class() _minConfidenceExpressionStarted:6 usingExpressionConfiguration:v9];
  float v51 = v50;
  [(id)objc_opt_class() _minConfidenceExpressionStarted:7 usingExpressionConfiguration:v9];
  float v114 = v52;
  [(id)objc_opt_class() _minConfidenceExpressionStarted:8 usingExpressionConfiguration:v9];
  float v54 = v53;
  [(id)objc_opt_class() _minConfidenceExpressionStarted:9 usingExpressionConfiguration:v9];
  float v56 = v55;
  v117 = v9;
  *((float *)&v105 + 1) = v20;
  if (v20 <= v45)
  {
    int v111 = 0;
  }
  else
  {
    v57 = objc_opt_class();
    *(float *)&double v58 = v20;
    LODWORD(v59) = v110;
    int v111 = [v57 _jawOpenStartingWithValue:v9 mouthClose:v58 expressionConfiguration:v59];
  }
  unsigned int v60 = [v10 containsObject:&unk_1F0C67140];
  unsigned int v61 = [v10 containsObject:&unk_1F0C67158];
  unsigned int v62 = [v10 containsObject:&unk_1F0C67170];
  int v63 = [v10 containsObject:&unk_1F0C67188];
  unsigned int v64 = [v10 containsObject:&unk_1F0C671A0];
  unsigned int v65 = [v10 containsObject:&unk_1F0C671B8];
  unsigned int v66 = [v10 containsObject:&unk_1F0C671D0];
  unsigned int v67 = [v10 containsObject:&unk_1F0C671E8];
  unsigned int v68 = [v10 containsObject:&unk_1F0C67200];
  float v69 = v113 * 0.61538;
  float v70 = v47 * 0.375;
  float v71 = v49 * 0.95;
  float v72 = v51 * 0.65;
  if (v127 > (float)(v42 * 0.1)) {
    unsigned int v73 = v62;
  }
  else {
    unsigned int v73 = 0;
  }
  if (v129 > v69) {
    unsigned int v74 = v60;
  }
  else {
    unsigned int v74 = 0;
  }
  if (v126 > v69) {
    unsigned int v75 = v74;
  }
  else {
    unsigned int v75 = 0;
  }
  if (v123 > v70) {
    int v76 = v63;
  }
  else {
    int v76 = 0;
  }
  if (v115 <= v70) {
    int v76 = 0;
  }
  LODWORD(v105) = v76;
  if (v120 > v71) {
    unsigned int v77 = v64;
  }
  else {
    unsigned int v77 = 0;
  }
  if (v121 > v71) {
    unsigned int v78 = v77;
  }
  else {
    unsigned int v78 = 0;
  }
  if (v116 > v72) {
    unsigned int v79 = v65;
  }
  else {
    unsigned int v79 = 0;
  }
  if (v118 <= v72) {
    unsigned int v79 = 0;
  }
  unsigned int v107 = v78;
  unsigned int v108 = v79;
  if (v127 > v42) {
    uint64_t v80 = 1;
  }
  else {
    uint64_t v80 = v73;
  }
  int v81 = v111 & ~v80;
  if (v124 > (float)(v54 * 0.6)) {
    unsigned int v82 = v67;
  }
  else {
    unsigned int v82 = 0;
  }
  unsigned int v112 = v82;
  if (v125 > (float)(v56 * 0.6)) {
    unsigned int v83 = v68;
  }
  else {
    unsigned int v83 = 0;
  }
  unsigned int v128 = v83;
  if (v122 > (float)(v114 * 0.6)) {
    unsigned int v84 = v66;
  }
  else {
    unsigned int v84 = 0;
  }
  unsigned int v109 = v84;
  if (v20 > (float)(v45 * 0.5)) {
    unsigned int v85 = v61;
  }
  else {
    unsigned int v85 = 0;
  }
  BOOL v86 = v116 > v51;
  if (v118 <= v51) {
    BOOL v86 = 0;
  }
  BOOL v119 = v86;
  BOOL v87 = v120 > v49 && v121 > v49;
  BOOL v88 = v115 > v47 && v123 > v47;
  BOOL v89 = v126 > v113 && v129 > v113;
  v90 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", v105);
  v91 = [NSNumber numberWithInt:v80];
  [v90 setObject:v91 forKey:&unk_1F0C67170];

  v92 = [NSNumber numberWithInt:v89 | v75];
  [v90 setObject:v92 forKey:&unk_1F0C67140];

  v93 = [NSNumber numberWithInt:v81 | v85];
  [v90 setObject:v93 forKey:&unk_1F0C67158];

  v94 = [NSNumber numberWithInt:v88 | v106];
  [v90 setObject:v94 forKey:&unk_1F0C67188];

  v95 = [NSNumber numberWithInt:v87 | v107];
  [v90 setObject:v95 forKey:&unk_1F0C671A0];

  v96 = [NSNumber numberWithInt:v119 | v108];
  [v90 setObject:v96 forKey:&unk_1F0C671B8];

  if (v122 > v114) {
    uint64_t v97 = 1;
  }
  else {
    uint64_t v97 = v109;
  }
  v98 = [NSNumber numberWithInt:v97];
  [v90 setObject:v98 forKey:&unk_1F0C671D0];

  if (v124 > v54) {
    uint64_t v99 = 1;
  }
  else {
    uint64_t v99 = v112;
  }
  v100 = [NSNumber numberWithInt:v99];
  [v90 setObject:v100 forKey:&unk_1F0C671E8];

  if (v125 > v56) {
    uint64_t v101 = 1;
  }
  else {
    uint64_t v101 = v128;
  }
  v102 = [NSNumber numberWithInt:v101];
  [v90 setObject:v102 forKey:&unk_1F0C67200];

  v103 = [(id)objc_opt_class() _populateExpressionArraysForProcessedExpressions:v90 previousExpressions:v10 startExpressionsOutSet:a6 endExpressionsOutSet:a7];

  return v103;
}

+ (id)_populateExpressionArraysForProcessedExpressions:(id)a3 previousExpressions:(id)a4 startExpressionsOutSet:(id *)a5 endExpressionsOutSet:(id *)a6
{
  id v7 = (void *)MEMORY[0x1E4F1CA80];
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [v7 set];
  uint64_t v11 = [MEMORY[0x1E4F1CA80] set];
  float v70 = [MEMORY[0x1E4F1CA80] set];
  unsigned int v68 = (void *)v10;
  unsigned int v66 = (void *)v11;
  if (_populateExpressionArraysForProcessedExpressions_previousExpressions_startExpressionsOutSet_endExpressionsOutSet__onceToken != -1) {
    dispatch_once(&_populateExpressionArraysForProcessedExpressions_previousExpressions_startExpressionsOutSet_endExpressionsOutSet__onceToken, &__block_literal_global_3);
  }
  v12 = [v9 objectForKey:&unk_1F0C67170];
  int v60 = [v12 BOOLValue];

  float v13 = [v9 objectForKey:&unk_1F0C67140];
  int v55 = [v13 BOOLValue];

  id v14 = [v9 objectForKey:&unk_1F0C67158];
  int v56 = [v14 BOOLValue];

  float v15 = [v9 objectForKey:&unk_1F0C67188];
  int v57 = [v15 BOOLValue];

  v16 = [v9 objectForKey:&unk_1F0C671A0];
  int v58 = [v16 BOOLValue];

  float v17 = [v9 objectForKey:&unk_1F0C671B8];
  int v63 = [v17 BOOLValue];

  v18 = [v9 objectForKey:&unk_1F0C671D0];
  int v54 = [v18 BOOLValue];

  float v19 = [v9 objectForKey:&unk_1F0C671E8];
  int v64 = [v19 BOOLValue];

  float v20 = [v9 objectForKey:&unk_1F0C67200];

  int v62 = [v20 BOOLValue];
  int v21 = [v8 containsObject:&unk_1F0C67140];
  int v22 = [v8 containsObject:&unk_1F0C67158];
  int v23 = [v8 containsObject:&unk_1F0C67170];
  int v24 = [v8 containsObject:&unk_1F0C67188];
  int v25 = [v8 containsObject:&unk_1F0C671A0];
  int v26 = [v8 containsObject:&unk_1F0C671B8];
  int v65 = [v8 containsObject:&unk_1F0C671D0];
  int v61 = [v8 containsObject:&unk_1F0C671E8];
  int v59 = [v8 containsObject:&unk_1F0C67200];

  if (!v55)
  {
    float v30 = v70;
    v29 = v70;
    id v27 = v68;
    float v28 = v66;
    if (!v21) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  id v27 = v68;
  [v68 addObject:&unk_1F0C67140];
  float v28 = v66;
  v29 = v66;
  float v30 = v70;
  if ((v21 & 1) == 0) {
LABEL_7:
  }
    [v29 addObject:&unk_1F0C67140];
LABEL_8:
  if (!v56)
  {
    v31 = v30;
    if (!v22) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  [v27 addObject:&unk_1F0C67158];
  v31 = v28;
  if ((v22 & 1) == 0) {
LABEL_12:
  }
    [v31 addObject:&unk_1F0C67158];
LABEL_13:
  if (!v60)
  {
    float v32 = v30;
    if (!v23) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  [v27 addObject:&unk_1F0C67170];
  float v32 = v28;
  if ((v23 & 1) == 0) {
LABEL_17:
  }
    [v32 addObject:&unk_1F0C67170];
LABEL_18:
  if (!v57)
  {
    v33 = v30;
    if (!v24) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  [v27 addObject:&unk_1F0C67188];
  v33 = v28;
  if ((v24 & 1) == 0) {
LABEL_22:
  }
    [v33 addObject:&unk_1F0C67188];
LABEL_23:
  if (v58)
  {
    [v27 addObject:&unk_1F0C671A0];
    if ((v25 & 1) == 0)
    {
      uint64_t v34 = [MEMORY[0x1E4F1C9C8] date];
      v35 = (void *)_populateExpressionArraysForProcessedExpressions_previousExpressions_startExpressionsOutSet_endExpressionsOutSet__s_blinkEyesStartDate;
      _populateExpressionArraysForProcessedExpressions_previousExpressions_startExpressionsOutSet_endExpressionsOutSet__s_blinkEyesStartDate = v34;
    }
  }
  else if (v25)
  {
    float v36 = [MEMORY[0x1E4F1C9C8] date];
    [v36 timeIntervalSinceDate:_populateExpressionArraysForProcessedExpressions_previousExpressions_startExpressionsOutSet_endExpressionsOutSet__s_blinkEyesStartDate];
    double v38 = v37;

    v39 = [MEMORY[0x1E4F1C9C8] date];
    [v39 timeIntervalSinceDate:_populateExpressionArraysForProcessedExpressions_previousExpressions_startExpressionsOutSet_endExpressionsOutSet__s_blinkEyesStartDate];
    double v41 = v40;

    float v30 = v70;
    if (v38 >= 0.3 && v41 <= 2.0)
    {
      [v28 addObject:&unk_1F0C671A0];
      float v30 = v70;
      [v70 addObject:&unk_1F0C671A0];
    }
  }
  if (!v63)
  {
    float v42 = v30;
    if (!v26) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
  [v27 addObject:&unk_1F0C671B8];
  float v42 = v28;
  if ((v26 & 1) == 0) {
LABEL_34:
  }
    [v42 addObject:&unk_1F0C671B8];
LABEL_35:
  if (!v62)
  {
    float v43 = v30;
    float v44 = a6;
    float v45 = a5;
    if (!v59) {
      goto LABEL_40;
    }
    goto LABEL_39;
  }
  [v27 addObject:&unk_1F0C67200];
  float v43 = v28;
  float v44 = a6;
  float v45 = a5;
  if ((v59 & 1) == 0) {
LABEL_39:
  }
    [v43 addObject:&unk_1F0C67200];
LABEL_40:
  if (v64)
  {
    [v27 addObject:&unk_1F0C671E8];
    float v46 = v28;
    if (v61) {
      goto LABEL_45;
    }
    goto LABEL_44;
  }
  float v46 = v30;
  if (v61) {
LABEL_44:
  }
    [v46 addObject:&unk_1F0C671E8];
LABEL_45:
  if (([v27 containsObject:&unk_1F0C671E8] & 1) != 0
    || ([v27 containsObject:&unk_1F0C67200] & 1) != 0
    || ((v54 ^ 1) & 1) != 0)
  {
    if (!v65) {
      goto LABEL_54;
    }
    float v52 = v30;
LABEL_53:
    [v52 addObject:&unk_1F0C671D0];
LABEL_54:
    if (!v45) {
      goto LABEL_56;
    }
    goto LABEL_55;
  }
  [v27 addObject:&unk_1F0C671D0];
  float v47 = [MEMORY[0x1E4F1C9C8] date];
  float v48 = v47;
  float v49 = (void *)_populateExpressionArraysForProcessedExpressions_previousExpressions_startExpressionsOutSet_endExpressionsOutSet__s_puckerCenterStartDate;
  if (v65)
  {
    [v47 timeIntervalSinceDate:_populateExpressionArraysForProcessedExpressions_previousExpressions_startExpressionsOutSet_endExpressionsOutSet__s_puckerCenterStartDate];
    double v51 = v50;

    float v30 = v70;
    if (v51 <= 0.15) {
      goto LABEL_54;
    }
    float v52 = v28;
    goto LABEL_53;
  }
  _populateExpressionArraysForProcessedExpressions_previousExpressions_startExpressionsOutSet_endExpressionsOutSet__s_puckerCenterStartDate = (uint64_t)v47;

  float v30 = v70;
  if (v45) {
LABEL_55:
  }
    *float v45 = (id)[v28 copy];
LABEL_56:
  if (v44) {
    *float v44 = (id)[v30 copy];
  }

  return v27;
}

uint64_t __158__AXSSMotionTrackingExpressionConfiguration__populateExpressionArraysForProcessedExpressions_previousExpressions_startExpressionsOutSet_endExpressionsOutSet___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1C9C8] date];
  v1 = (void *)_populateExpressionArraysForProcessedExpressions_previousExpressions_startExpressionsOutSet_endExpressionsOutSet__s_blinkEyesStartDate;
  _populateExpressionArraysForProcessedExpressions_previousExpressions_startExpressionsOutSet_endExpressionsOutSet__s_blinkEyesStartDate = v0;

  _populateExpressionArraysForProcessedExpressions_previousExpressions_startExpressionsOutSet_endExpressionsOutSet__s_puckerCenterStartDate = [MEMORY[0x1E4F1C9C8] date];

  return MEMORY[0x1F41817F8]();
}

+ ($569BC8A4F588CCDEF576D5B50041512B)convertIncomingExpressionsToExclaveBlendshapesOutput:(SEL)a3
{
  id v5 = a4;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"TongueOut"];
  [v6 floatValue];
  float v48 = v7;

  id v8 = [v5 objectForKeyedSubscript:@"MouthSmileLeft"];
  [v8 floatValue];
  float v47 = v9;

  uint64_t v10 = [v5 objectForKeyedSubscript:@"MouthSmileRight"];
  [v10 floatValue];
  float v46 = v11;

  v12 = [v5 objectForKeyedSubscript:@"JawOpen"];
  [v12 floatValue];
  float v45 = v13;

  id v14 = [v5 objectForKeyedSubscript:@"MouthClose"];
  [v14 floatValue];
  float v44 = v15;

  v16 = [v5 objectForKeyedSubscript:@"BrowOuterUpLeft"];
  [v16 floatValue];
  float v43 = v17;

  v18 = [v5 objectForKeyedSubscript:@"BrowOuterUpRight"];
  [v18 floatValue];
  float v20 = v19;

  int v21 = [v5 objectForKeyedSubscript:@"EyeBlinkRight"];
  [v21 floatValue];
  float v23 = v22;

  int v24 = [v5 objectForKeyedSubscript:@"EyeBlinkLeft"];
  [v24 floatValue];
  float v26 = v25;

  id v27 = [v5 objectForKeyedSubscript:@"NoseSneerRight"];
  [v27 floatValue];
  float v29 = v28;

  float v30 = [v5 objectForKeyedSubscript:@"NoseSneerLeft"];
  [v30 floatValue];
  float v32 = v31;

  v33 = [v5 objectForKeyedSubscript:@"MouthRight"];
  [v33 floatValue];
  float v35 = v34;

  float v36 = [v5 objectForKeyedSubscript:@"MouthLeft"];
  [v36 floatValue];
  float v38 = v37;

  v39 = [v5 objectForKeyedSubscript:@"MouthPucker"];

  [v39 floatValue];
  float v41 = v40;

  retstr->var0 = v48;
  retstr->var1 = v47;
  retstr->var2 = v46;
  retstr->var3 = v45;
  retstr->var4 = v44;
  retstr->var5 = v43;
  retstr->var6 = v20;
  retstr->var7 = v23;
  retstr->var8 = v26;
  retstr->var9 = v29;
  retstr->var10 = v32;
  retstr->var11 = v35;
  retstr->var12 = v38;
  retstr->var13 = v41;
  return result;
}

+ (id)processExclaveDetectedExpressions:(id *)a3 previousExpressions:(id)a4 expressionConfiguration:(id)a5 startExpressionsOutSet:(id *)a6 endExpressionsOutSet:(id *)a7
{
  float v11 = (void *)MEMORY[0x1E4F1CA60];
  id v12 = a5;
  id v13 = a4;
  id v14 = [v11 dictionary];
  float v15 = objc_opt_class();
  long long v16 = *(_OWORD *)&a3->var6;
  long long v64 = *(_OWORD *)&a3->var4;
  long long v65 = v16;
  unint64_t var8 = a3->var8;
  long long v17 = *(_OWORD *)&a3->var2;
  long long v62 = *(_OWORD *)&a3->var0;
  long long v63 = v17;
  uint64_t v18 = [v15 _expressionIsActive:4 usingExclaveOutput:&v62 expressionConfiguration:v12];
  float v19 = [NSNumber numberWithBool:v18];
  [v14 setObject:v19 forKey:&unk_1F0C67170];

  float v20 = objc_opt_class();
  long long v21 = *(_OWORD *)&a3->var6;
  long long v64 = *(_OWORD *)&a3->var4;
  long long v65 = v21;
  unint64_t var8 = a3->var8;
  long long v22 = *(_OWORD *)&a3->var2;
  long long v62 = *(_OWORD *)&a3->var0;
  long long v63 = v22;
  uint64_t v23 = [v20 _expressionIsActive:3 usingExclaveOutput:&v62 expressionConfiguration:v12];
  int v24 = [NSNumber numberWithBool:v23];
  [v14 setObject:v24 forKey:&unk_1F0C67140];

  float v25 = objc_opt_class();
  long long v26 = *(_OWORD *)&a3->var6;
  long long v64 = *(_OWORD *)&a3->var4;
  long long v65 = v26;
  unint64_t var8 = a3->var8;
  long long v27 = *(_OWORD *)&a3->var2;
  long long v62 = *(_OWORD *)&a3->var0;
  long long v63 = v27;
  uint64_t v28 = [v25 _expressionIsActive:2 usingExclaveOutput:&v62 expressionConfiguration:v12];
  float v29 = [NSNumber numberWithBool:v28];
  [v14 setObject:v29 forKey:&unk_1F0C67158];

  float v30 = objc_opt_class();
  long long v31 = *(_OWORD *)&a3->var6;
  long long v64 = *(_OWORD *)&a3->var4;
  long long v65 = v31;
  unint64_t var8 = a3->var8;
  long long v32 = *(_OWORD *)&a3->var2;
  long long v62 = *(_OWORD *)&a3->var0;
  long long v63 = v32;
  uint64_t v33 = [v30 _expressionIsActive:1 usingExclaveOutput:&v62 expressionConfiguration:v12];
  float v34 = [NSNumber numberWithBool:v33];
  [v14 setObject:v34 forKey:&unk_1F0C67188];

  float v35 = objc_opt_class();
  long long v36 = *(_OWORD *)&a3->var6;
  long long v64 = *(_OWORD *)&a3->var4;
  long long v65 = v36;
  unint64_t var8 = a3->var8;
  long long v37 = *(_OWORD *)&a3->var2;
  long long v62 = *(_OWORD *)&a3->var0;
  long long v63 = v37;
  uint64_t v38 = [v35 _expressionIsActive:5 usingExclaveOutput:&v62 expressionConfiguration:v12];
  v39 = [NSNumber numberWithBool:v38];
  [v14 setObject:v39 forKey:&unk_1F0C671A0];

  float v40 = objc_opt_class();
  long long v41 = *(_OWORD *)&a3->var6;
  long long v64 = *(_OWORD *)&a3->var4;
  long long v65 = v41;
  unint64_t var8 = a3->var8;
  long long v42 = *(_OWORD *)&a3->var2;
  long long v62 = *(_OWORD *)&a3->var0;
  long long v63 = v42;
  uint64_t v43 = [v40 _expressionIsActive:6 usingExclaveOutput:&v62 expressionConfiguration:v12];
  float v44 = [NSNumber numberWithBool:v43];
  [v14 setObject:v44 forKey:&unk_1F0C671B8];

  float v45 = objc_opt_class();
  long long v46 = *(_OWORD *)&a3->var6;
  long long v64 = *(_OWORD *)&a3->var4;
  long long v65 = v46;
  unint64_t var8 = a3->var8;
  long long v47 = *(_OWORD *)&a3->var2;
  long long v62 = *(_OWORD *)&a3->var0;
  long long v63 = v47;
  uint64_t v48 = [v45 _expressionIsActive:7 usingExclaveOutput:&v62 expressionConfiguration:v12];
  float v49 = [NSNumber numberWithBool:v48];
  [v14 setObject:v49 forKey:&unk_1F0C671D0];

  double v50 = objc_opt_class();
  long long v51 = *(_OWORD *)&a3->var6;
  long long v64 = *(_OWORD *)&a3->var4;
  long long v65 = v51;
  unint64_t var8 = a3->var8;
  long long v52 = *(_OWORD *)&a3->var2;
  long long v62 = *(_OWORD *)&a3->var0;
  long long v63 = v52;
  uint64_t v53 = [v50 _expressionIsActive:8 usingExclaveOutput:&v62 expressionConfiguration:v12];
  int v54 = [NSNumber numberWithBool:v53];
  [v14 setObject:v54 forKey:&unk_1F0C671E8];

  int v55 = objc_opt_class();
  long long v56 = *(_OWORD *)&a3->var6;
  long long v64 = *(_OWORD *)&a3->var4;
  long long v65 = v56;
  unint64_t var8 = a3->var8;
  long long v57 = *(_OWORD *)&a3->var2;
  long long v62 = *(_OWORD *)&a3->var0;
  long long v63 = v57;
  uint64_t v58 = [v55 _expressionIsActive:9 usingExclaveOutput:&v62 expressionConfiguration:v12];

  int v59 = [NSNumber numberWithBool:v58];
  [v14 setObject:v59 forKey:&unk_1F0C67200];

  int v60 = [(id)objc_opt_class() _populateExpressionArraysForProcessedExpressions:v14 previousExpressions:v13 startExpressionsOutSet:a6 endExpressionsOutSet:a7];

  return v60;
}

+ (BOOL)_expressionIsActive:(unint64_t)a3 usingExclaveOutput:(id *)a4 expressionConfiguration:(id)a5
{
  uint64_t v7 = objc_msgSend(a5, "sensitivityForFacialExpression:");
  id v8 = objc_opt_class();
  long long v9 = *(_OWORD *)&a4->var6;
  v15[2] = *(_OWORD *)&a4->var4;
  v15[3] = v9;
  unint64_t var8 = a4->var8;
  long long v10 = *(_OWORD *)&a4->var2;
  v15[0] = *(_OWORD *)&a4->var0;
  v15[1] = v10;
  unint64_t v11 = [v8 _activationForFacialExpression:a3 usingExclaveExpressions:v15];
  BOOL v12 = v11 > 1;
  BOOL v13 = v11 != 0;
  if (v7 != 1) {
    BOOL v13 = 0;
  }
  if (v7 != 2) {
    BOOL v12 = v13;
  }
  if (v7 == 3) {
    return v11 > 2;
  }
  else {
    return v12;
  }
}

+ (unint64_t)_activationForFacialExpression:(unint64_t)a3 usingExclaveExpressions:(id *)a4
{
  switch(a3)
  {
    case 1uLL:
      goto LABEL_11;
    case 2uLL:
      a4 = ($AA6A45B2DFCED8527C3A0E9A46B0D48F *)((char *)a4 + 8);
      goto LABEL_11;
    case 3uLL:
      a4 = ($AA6A45B2DFCED8527C3A0E9A46B0D48F *)((char *)a4 + 16);
      goto LABEL_11;
    case 4uLL:
      a4 = ($AA6A45B2DFCED8527C3A0E9A46B0D48F *)((char *)a4 + 24);
      goto LABEL_11;
    case 5uLL:
      a4 = ($AA6A45B2DFCED8527C3A0E9A46B0D48F *)((char *)a4 + 32);
      goto LABEL_11;
    case 6uLL:
      a4 = ($AA6A45B2DFCED8527C3A0E9A46B0D48F *)((char *)a4 + 40);
      goto LABEL_11;
    case 7uLL:
      a4 = ($AA6A45B2DFCED8527C3A0E9A46B0D48F *)((char *)a4 + 48);
      goto LABEL_11;
    case 8uLL:
      a4 = ($AA6A45B2DFCED8527C3A0E9A46B0D48F *)((char *)a4 + 64);
      goto LABEL_11;
    case 9uLL:
      a4 = ($AA6A45B2DFCED8527C3A0E9A46B0D48F *)((char *)a4 + 56);
LABEL_11:
      unint64_t result = a4->var0;
      break;
    default:
      unint64_t result = 0;
      break;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(AXSSMotionTrackingExpressionConfiguration *)self _facialExpressionToSensitivity];

  if (v4)
  {
    id v5 = [(AXSSMotionTrackingExpressionConfiguration *)self _facialExpressionToSensitivity];
    uint64_t v6 = NSStringFromSelector(sel__facialExpressionToSensitivity);
    [v7 encodeObject:v5 forKey:v6];
  }
}

- (AXSSMotionTrackingExpressionConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(AXSSMotionTrackingExpressionConfiguration *)self init];
  if (v5)
  {
    uint64_t v6 = [(id)objc_opt_class() _defaultSensitivitiesForAllFacialExpressions];
    id v7 = (void *)[v6 mutableCopy];

    id v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    long long v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    unint64_t v11 = NSStringFromSelector(sel__facialExpressionToSensitivity);
    BOOL v12 = [v4 decodeObjectOfClasses:v10 forKey:v11];

    if (v12)
    {
      id v13 = v12;

      id v7 = v13;
    }
    uint64_t v14 = [v7 mutableCopy];
    facialExpressionToSensitivity = v5->__facialExpressionToSensitivity;
    v5->__facialExpressionToSensitivity = (NSMutableDictionary *)v14;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = [(AXSSMotionTrackingExpressionConfiguration *)self plistDictionary];
  id v4 = [[AXSSMotionTrackingExpressionConfiguration alloc] initWithPlistDictionary:v3];

  return v4;
}

- (BOOL)isEqualToMotionTrackingExpressionConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(AXSSMotionTrackingExpressionConfiguration *)self plistDictionary];
  uint64_t v6 = [v4 plistDictionary];

  LOBYTE(v4) = [v5 isEqual:v6];
  return (char)v4;
}

- (unint64_t)hash
{
  id v2 = [(AXSSMotionTrackingExpressionConfiguration *)self plistDictionary];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(AXSSMotionTrackingExpressionConfiguration *)self isEqualToMotionTrackingExpressionConfiguration:v4];

  return v5;
}

+ (id)_defaultSensitivitiesForAllFacialExpressions
{
  if (_defaultSensitivitiesForAllFacialExpressions_onceToken != -1) {
    dispatch_once(&_defaultSensitivitiesForAllFacialExpressions_onceToken, &__block_literal_global_71);
  }
  id v2 = (void *)_defaultSensitivitiesForAllFacialExpressions_facialExpressionToSensitivity;

  return v2;
}

void __89__AXSSMotionTrackingExpressionConfiguration__defaultSensitivitiesForAllFacialExpressions__block_invoke()
{
  v8[9] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (void *)MEMORY[0x1E4F1CA60];
  v7[0] = &unk_1F0C67188;
  v7[1] = &unk_1F0C67158;
  v8[0] = &unk_1F0C67158;
  v8[1] = &unk_1F0C67158;
  v7[2] = &unk_1F0C67140;
  v1 = NSNumber;
  if (_AXSMossdeepEnabled()) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = 2;
  }
  unint64_t v3 = [v1 numberWithUnsignedInteger:v2];
  v8[2] = v3;
  v8[3] = &unk_1F0C67158;
  v7[3] = &unk_1F0C67170;
  v7[4] = &unk_1F0C671A0;
  v8[4] = &unk_1F0C67158;
  v8[5] = &unk_1F0C67158;
  v7[5] = &unk_1F0C671B8;
  v7[6] = &unk_1F0C671D0;
  v8[6] = &unk_1F0C67158;
  v8[7] = &unk_1F0C67158;
  v7[7] = &unk_1F0C67200;
  v7[8] = &unk_1F0C671E8;
  v8[8] = &unk_1F0C67158;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:9];
  uint64_t v5 = [v0 dictionaryWithDictionary:v4];
  uint64_t v6 = (void *)_defaultSensitivitiesForAllFacialExpressions_facialExpressionToSensitivity;
  _defaultSensitivitiesForAllFacialExpressions_facialExpressionToSensitivity = v5;
}

- (void)_safelySetSensitivity:(unint64_t)a3 forFacialExpression:(unint64_t)a4 inDictionary:(id)a5
{
  if (a3 - 1 <= 2 && a4 - 1 <= 8)
  {
    uint64_t v9 = NSNumber;
    id v10 = a5;
    id v12 = [v9 numberWithUnsignedInteger:a3];
    unint64_t v11 = [NSNumber numberWithUnsignedInteger:a4];
    [v10 setObject:v12 forKeyedSubscript:v11];
  }
}

+ (float)_minConfidenceExpressionStarted:(unint64_t)a3 usingExpressionConfiguration:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(id)objc_opt_class() _facialExpressionToSensitivityToValueMapping];
  uint64_t v7 = [v5 sensitivityForFacialExpression:a3];

  id v8 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v9 = [v6 objectForKeyedSubscript:v8];
  id v10 = [NSNumber numberWithUnsignedInteger:v7];
  unint64_t v11 = [v9 objectForKeyedSubscript:v10];
  [v11 floatValue];
  float v13 = v12;

  return v13;
}

+ (id)_facialExpressionToSensitivityToValueMapping
{
  if (_facialExpressionToSensitivityToValueMapping_onceToken != -1) {
    dispatch_once(&_facialExpressionToSensitivityToValueMapping_onceToken, &__block_literal_global_73);
  }
  uint64_t v2 = (void *)_facialExpressionToSensitivityToValueMapping_facialExpressionToSensitivityToValueMapping;

  return v2;
}

void __89__AXSSMotionTrackingExpressionConfiguration__facialExpressionToSensitivityToValueMapping__block_invoke()
{
  v30[9] = *MEMORY[0x1E4F143B8];
  v29[0] = &unk_1F0C67188;
  v27[0] = &unk_1F0C67188;
  v27[1] = &unk_1F0C67158;
  v28[0] = &unk_1F0C67A40;
  v28[1] = &unk_1F0C67A50;
  v27[2] = &unk_1F0C67140;
  v28[2] = &unk_1F0C67A60;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:3];
  v30[0] = v10;
  v29[1] = &unk_1F0C67158;
  v25[0] = &unk_1F0C67188;
  v25[1] = &unk_1F0C67158;
  v26[0] = &unk_1F0C67A70;
  v26[1] = &unk_1F0C67A50;
  v25[2] = &unk_1F0C67140;
  v26[2] = &unk_1F0C67A80;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:3];
  v30[1] = v9;
  v29[2] = &unk_1F0C67140;
  v23[0] = &unk_1F0C67188;
  v23[1] = &unk_1F0C67158;
  v24[0] = &unk_1F0C67A90;
  v24[1] = &unk_1F0C67AA0;
  v23[2] = &unk_1F0C67140;
  v24[2] = &unk_1F0C67AB0;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];
  v30[2] = v8;
  v29[3] = &unk_1F0C67170;
  v21[0] = &unk_1F0C67188;
  v21[1] = &unk_1F0C67158;
  v22[0] = &unk_1F0C67A40;
  v22[1] = &unk_1F0C67AB0;
  v21[2] = &unk_1F0C67140;
  v22[2] = &unk_1F0C67AC0;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
  v30[3] = v7;
  v29[4] = &unk_1F0C671A0;
  v19[0] = &unk_1F0C67188;
  v19[1] = &unk_1F0C67158;
  v20[0] = &unk_1F0C67A50;
  v20[1] = &unk_1F0C67AB0;
  v19[2] = &unk_1F0C67140;
  v20[2] = &unk_1F0C67AD0;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];
  v30[4] = v6;
  v29[5] = &unk_1F0C671B8;
  v17[0] = &unk_1F0C67188;
  v17[1] = &unk_1F0C67158;
  v18[0] = &unk_1F0C67AE0;
  v18[1] = &unk_1F0C67AA0;
  v17[2] = &unk_1F0C67140;
  v18[2] = &unk_1F0C67A80;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];
  v30[5] = v0;
  v29[6] = &unk_1F0C671D0;
  v15[0] = &unk_1F0C67188;
  v15[1] = &unk_1F0C67158;
  v16[0] = &unk_1F0C67AF0;
  v16[1] = &unk_1F0C67A50;
  v15[2] = &unk_1F0C67140;
  v16[2] = &unk_1F0C67B00;
  v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];
  v30[6] = v1;
  v29[7] = &unk_1F0C67200;
  v13[0] = &unk_1F0C67188;
  v13[1] = &unk_1F0C67158;
  v14[0] = &unk_1F0C67B10;
  v14[1] = &unk_1F0C67A50;
  v13[2] = &unk_1F0C67140;
  v14[2] = &unk_1F0C67A80;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  v30[7] = v2;
  v29[8] = &unk_1F0C671E8;
  v11[0] = &unk_1F0C67188;
  v11[1] = &unk_1F0C67158;
  v12[0] = &unk_1F0C67B10;
  v12[1] = &unk_1F0C67A50;
  v11[2] = &unk_1F0C67140;
  v12[2] = &unk_1F0C67A80;
  unint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  v30[8] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:9];
  id v5 = (void *)_facialExpressionToSensitivityToValueMapping_facialExpressionToSensitivityToValueMapping;
  _facialExpressionToSensitivityToValueMapping_facialExpressionToSensitivityToValueMapping = v4;
}

+ (BOOL)_jawOpenStartingWithValue:(float)a3 mouthClose:(float)a4 expressionConfiguration:(id)a5
{
  uint64_t v7 = [a5 sensitivityForFacialExpression:2];
  float v8 = a3 - a4;
  if ((unint64_t)(v7 - 1) <= 1) {
    return v8 >= 0.05;
  }
  return v8 >= 0.1 && v7 == 3;
}

- (NSMutableDictionary)_facialExpressionToSensitivity
{
  return self->__facialExpressionToSensitivity;
}

- (void)set_facialExpressionToSensitivity:(id)a3
{
}

- (void).cxx_destruct
{
}

void __96__AXSSMotionTrackingExpressionConfiguration_Exclave__facialExpressionToActivationToValueMapping__block_invoke()
{
  v30[9] = *MEMORY[0x1E4F143B8];
  v29[0] = &unk_1F0C67260;
  v27[0] = &unk_1F0C67218;
  v27[1] = &unk_1F0C67230;
  v28[0] = &unk_1F0C67B20;
  v28[1] = &unk_1F0C67B30;
  v27[2] = &unk_1F0C67248;
  v28[2] = &unk_1F0C67B40;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:3];
  v30[0] = v10;
  v29[1] = &unk_1F0C67218;
  v25[0] = &unk_1F0C67218;
  v25[1] = &unk_1F0C67230;
  v26[0] = &unk_1F0C67B50;
  v26[1] = &unk_1F0C67B30;
  v25[2] = &unk_1F0C67248;
  v26[2] = &unk_1F0C67B60;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:3];
  v30[1] = v9;
  v29[2] = &unk_1F0C67230;
  v23[0] = &unk_1F0C67218;
  v23[1] = &unk_1F0C67230;
  v24[0] = &unk_1F0C67B70;
  v24[1] = &unk_1F0C67B80;
  v23[2] = &unk_1F0C67248;
  v24[2] = &unk_1F0C67B90;
  float v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];
  v30[2] = v8;
  v29[3] = &unk_1F0C67248;
  v21[0] = &unk_1F0C67218;
  v21[1] = &unk_1F0C67230;
  v22[0] = &unk_1F0C67B20;
  v22[1] = &unk_1F0C67B90;
  v21[2] = &unk_1F0C67248;
  v22[2] = &unk_1F0C67BA0;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
  v30[3] = v7;
  v29[4] = &unk_1F0C67278;
  v19[0] = &unk_1F0C67218;
  v19[1] = &unk_1F0C67230;
  v20[0] = &unk_1F0C67B30;
  v20[1] = &unk_1F0C67B90;
  v19[2] = &unk_1F0C67248;
  v20[2] = &unk_1F0C67BB0;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];
  v30[4] = v6;
  v29[5] = &unk_1F0C67290;
  v17[0] = &unk_1F0C67218;
  v17[1] = &unk_1F0C67230;
  v18[0] = &unk_1F0C67BC0;
  v18[1] = &unk_1F0C67B80;
  v17[2] = &unk_1F0C67248;
  v18[2] = &unk_1F0C67B60;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];
  v30[5] = v0;
  v29[6] = &unk_1F0C672A8;
  v15[0] = &unk_1F0C67218;
  v15[1] = &unk_1F0C67230;
  v16[0] = &unk_1F0C67BD0;
  v16[1] = &unk_1F0C67B30;
  v15[2] = &unk_1F0C67248;
  v16[2] = &unk_1F0C67BE0;
  v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];
  v30[6] = v1;
  v29[7] = &unk_1F0C672C0;
  v13[0] = &unk_1F0C67218;
  v13[1] = &unk_1F0C67230;
  v14[0] = &unk_1F0C67BF0;
  v14[1] = &unk_1F0C67B30;
  v13[2] = &unk_1F0C67248;
  v14[2] = &unk_1F0C67B60;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  v30[7] = v2;
  v29[8] = &unk_1F0C672D8;
  v11[0] = &unk_1F0C67218;
  v11[1] = &unk_1F0C67230;
  v12[0] = &unk_1F0C67BF0;
  v12[1] = &unk_1F0C67B30;
  v11[2] = &unk_1F0C67248;
  v12[2] = &unk_1F0C67B60;
  unint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  v30[8] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:9];
  id v5 = (void *)_facialExpressionToActivationToValueMapping_facialExpressionToSensitivityToValueMapping;
  _facialExpressionToActivationToValueMapping_facialExpressionToSensitivityToValueMapping = v4;
}

- (void)plistDictionary
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = [a1 _facialExpressionToSensitivity];
  int v6 = 138412546;
  uint64_t v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1B3B9D000, a3, OS_LOG_TYPE_ERROR, "ERROR: Couldn't encode object %@, encountered error: %@", (uint8_t *)&v6, 0x16u);
}

@end