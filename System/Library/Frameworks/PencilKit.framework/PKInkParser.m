@interface PKInkParser
+ (BOOL)hasDefinitionForIdentifier:(uint64_t)a1;
+ (PKInkBehavior)inkBehaviorVariantWithDictionary:(void *)a3 renderingDescriptor:(void *)a4 identifier:(uint64_t)a5 version:(void *)a6 variant:;
+ (PKInkRenderingDescriptor)inkRenderingDescriptorWithDictionary:(uint64_t)a1;
+ (id)inkBehaviorFromDictionary:(void *)a3 identifier:(uint64_t)a4 version:(void *)a5 variant:;
+ (id)inkBehaviorsWithIdentifer:(uint64_t)a3 version:;
+ (id)plistDictionaryForInk:(uint64_t)a1;
+ (id)plistPathForIdentifier:(uint64_t)a1;
+ (id)v2plistPathForIdentifier:(uint64_t)a1;
+ (void)loadFunction:(void *)a3;
+ (void)loadOutput:(void *)a3;
@end

@implementation PKInkParser

+ (void)loadFunction:(void *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  self;
  id v3 = v12;
  self;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = [v3 allKeys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:buf count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (([&unk_1F200EFB8 containsObject:v8] & 1) == 0) {
          [&unk_1F200EFD0 containsObject:v8];
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:buf count:16];
    }
    while (v5);
  }

  v9 = [v3 objectForKeyedSubscript:@"type"];
  if (![(__CFString *)v9 length])
  {
    v10 = os_log_create("com.apple.pencilkit", "");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C44F8000, v10, OS_LOG_TYPE_DEFAULT, "No function type, assuming piecewise", buf, 2u);
    }

    v9 = @"piecewise";
  }
  if ([(__CFString *)v9 isEqualToString:@"piecewise"]) {
    operator new();
  }
  if ([(__CFString *)v9 isEqualToString:@"identity"]) {
    operator new();
  }
  if ([(__CFString *)v9 isEqualToString:@"constant"])
  {
    v11 = [v3 objectForKeyedSubscript:@"defaultValue"];
    [v11 floatValue];

    operator new();
  }
  *a1 = 0;
}

+ (void)loadOutput:(void *)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  self;
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  v31 = +[PKInkProperties inputNames];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v29;
  uint64_t v4 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v38;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v38 != v5) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v37 + 1) + 8 * v6);
        uint64_t v36 = 0;
        uint64_t v8 = [v7 objectForKeyedSubscript:@"input-mask"];
        v9 = [v8 componentsSeparatedByString:@","];

        LODWORD(v8) = [v9 containsObject:@"touch"];
        int v10 = [v9 containsObject:@"force-touch"];
        unsigned int v11 = [v9 containsObject:@"stylus"];
        uint64_t v12 = 4;
        if (!v8) {
          uint64_t v12 = 0;
        }
        if (v10) {
          uint64_t v13 = 2;
        }
        else {
          uint64_t v13 = 0;
        }
        uint64_t v14 = v13 | v12 | v11;
        if (!v14) {
          uint64_t v14 = 7;
        }
        v33[0] = v14;
        unsigned int v15 = [v9 containsObject:@"phone"];
        if ([v9 containsObject:@"pad"]) {
          uint64_t v16 = 2;
        }
        else {
          uint64_t v16 = 0;
        }
        uint64_t v17 = v16 | v15;
        if (!v17) {
          uint64_t v17 = 3;
        }
        v33[1] = v17;
        uint64_t v34 = 3;
        unsigned int v18 = [v9 containsObject:@"snapped"];
        if ([v9 containsObject:@"unsnapped"]) {
          uint64_t v19 = 2;
        }
        else {
          uint64_t v19 = 0;
        }
        uint64_t v20 = v19 | v18;
        if (!v20) {
          uint64_t v20 = 3;
        }
        uint64_t v34 = v20;
        uint64_t v35 = 0;
        v21 = [v7 objectForKeyedSubscript:@"input"];
        if (v21)
        {
          v22 = [v31 objectForKeyedSubscript:v21];
          v23 = v22;
          if (v22) {
            uint64_t v35 = [v22 integerValue];
          }
        }
        if (v35 != 5)
        {
          v24 = [v7 objectForKeyedSubscript:@"function"];
          +[PKInkParser loadFunction:v24];
          uint64_t v25 = v36;
          uint64_t v36 = v32;
          if (v25) {
            (*(void (**)(uint64_t))(*(void *)v25 + 40))(v25);
          }
        }
        unint64_t v26 = a1[1];
        if (v26 >= a1[2])
        {
          uint64_t v27 = std::vector<PKOutputFunction>::__push_back_slow_path<PKOutputFunction>(a1, (const PKOutputFunction *)v33);
        }
        else
        {
          PKOutputFunction::PKOutputFunction((PKOutputFunction *)a1[1], (const PKOutputFunction *)v33);
          uint64_t v27 = v26 + 40;
          a1[1] = v26 + 40;
        }
        a1[1] = v27;

        uint64_t v28 = v36;
        uint64_t v36 = 0;
        if (v28) {
          (*(void (**)(uint64_t))(*(void *)v28 + 40))(v28);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v4);
  }
}

+ (PKInkRenderingDescriptor)inkRenderingDescriptorWithDictionary:(uint64_t)a1
{
  v62[2] = *MEMORY[0x1E4F143B8];
  id v53 = a2;
  self;
  id v2 = v53;
  self;
  id v3 = (void *)MEMORY[0x1E4F1CA48];
  v62[0] = @"type";
  v62[1] = @"blend-mode";
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:2];
  uint64_t v5 = [v3 arrayWithArray:v4];

  uint64_t v6 = (void *)MEMORY[0x1E4F1CA48];
  v61[0] = @"particle-spacing";
  v61[1] = @"particle-count";
  v61[2] = @"particle-width";
  v61[3] = @"particle-height";
  v61[4] = @"texture";
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:5];
  uint64_t v8 = [v6 arrayWithArray:v7];

  v9 = (void *)MEMORY[0x1E4F1CA48];
  v60[0] = @"particle-rotation";
  v60[1] = @"particle-spacing-function";
  v60[2] = @"particle-adjust-end-cap-alpha";
  v60[3] = @"is-object-eraser";
  int v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:4];
  unsigned int v11 = [v9 arrayWithArray:v10];

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  uint64_t v12 = [v2 allKeys];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v55 objects:v59 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v56 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = *(void *)(*((void *)&v55 + 1) + 8 * i);
        char v17 = [v5 containsObject:v16];
        unsigned int v18 = v5;
        if ((v17 & 1) == 0)
        {
          char v19 = [v8 containsObject:v16];
          unsigned int v18 = v8;
          if ((v19 & 1) == 0)
          {
            int v20 = [v11 containsObject:v16];
            unsigned int v18 = v11;
            if (!v20) {
              continue;
            }
          }
        }
        [v18 removeObject:v16];
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v55 objects:v59 count:16];
    }
    while (v13);
  }

  [v5 count];
  if ([v8 count])
  {
    v21 = [v2 objectForKeyedSubscript:@"type"];
    [v21 isEqual:@"particle"];
  }
  v22 = [v2 objectForKeyedSubscript:@"blend-mode"];
  if (v22)
  {
    v23 = [v2 objectForKeyedSubscript:@"blend-mode"];
    v24 = [&unk_1F200F448 objectForKeyedSubscript:v23];
    uint64_t v25 = [v24 unsignedIntegerValue];
  }
  else
  {
    uint64_t v25 = 0;
  }

  unint64_t v26 = [v2 objectForKeyedSubscript:@"type"];
  uint64_t v27 = [&unk_1F200F470 objectForKeyedSubscript:v26];
  uint64_t v28 = [v27 unsignedIntegerValue];

  if (v28 == 1)
  {
    id v29 = [v2 objectForKeyedSubscript:@"texture"];
    v30 = [v2 objectForKeyedSubscript:@"particle-spacing"];
    [v30 floatValue];
    float v32 = v31;

    v33 = [v2 objectForKeyedSubscript:@"particle-count"];
    if (v33)
    {
      uint64_t v34 = [v2 objectForKeyedSubscript:@"particle-count"];
      uint64_t v35 = [v34 unsignedIntegerValue];
    }
    else
    {
      uint64_t v35 = 1;
    }

    long long v37 = [v2 objectForKeyedSubscript:@"particle-width"];
    [v37 floatValue];
    float v39 = v38;
    long long v40 = [v2 objectForKeyedSubscript:@"particle-height"];
    [v40 floatValue];
    float v42 = v41;

    v43 = [v2 objectForKeyedSubscript:@"particle-rotation"];
    v44 = [&unk_1F200F498 objectForKeyedSubscript:v43];
    uint64_t v45 = [v44 unsignedIntegerValue];

    v46 = [v2 objectForKeyedSubscript:@"particle-adjust-end-cap-alpha"];
    uint64_t v47 = [v46 BOOLValue];

    uint64_t v36 = +[PKInkParticleDescriptor particleDescriptorWithName:particleSpacing:particleCount:particleSize:particleRotation:](PKInkParticleDescriptor, "particleDescriptorWithName:particleSpacing:particleCount:particleSize:particleRotation:", v29, v35, v45, v32, v39, v42);
    [v36 setAdjustEndCapParticleAlpha:v47];
    v48 = [v2 objectForKeyedSubscript:@"particle-spacing-function"];

    if (v48)
    {
      v49 = [v2 objectForKeyedSubscript:@"particle-spacing-function"];
      +[PKInkParser loadFunction:v49];
      [v36 setParticleSpacingFunction:&v54];
      uint64_t v50 = v54;
      uint64_t v54 = 0;
      if (v50) {
        (*(void (**)(uint64_t))(*(void *)v50 + 40))(v50);
      }
    }
  }
  else
  {
    uint64_t v36 = 0;
  }
  v51 = [[PKInkRenderingDescriptor alloc] initWithType:v28 blendMode:v25 alternateMode:0 particleDescriptor:v36 secondaryParticleDescriptor:0];

  return v51;
}

+ (PKInkBehavior)inkBehaviorVariantWithDictionary:(void *)a3 renderingDescriptor:(void *)a4 identifier:(uint64_t)a5 version:(void *)a6 variant:
{
  uint64_t v170 = *MEMORY[0x1E4F143B8];
  id v10 = a2;
  id v125 = a3;
  id v122 = a4;
  id v123 = a6;
  self;
  id v126 = v10;
  self;
  unsigned int v11 = (void *)MEMORY[0x1E4F1CA48];
  v145 = (PKOutputFunction *)@"stylusSmoothing";
  v146 = (PKOutputFunction *)@"touch-smoothing";
  v147 = @"velocitySmoothing";
  v148 = @"angleSmoothing";
  v149 = @"end-cap-fade";
  v150 = @"end-cap-time";
  v151 = @"start-cap-fade";
  v152 = @"start-cap-time";
  v153 = @"blendAlpha";
  v154 = @"targetMultiple";
  v155 = @"base-alpha";
  v156 = @"weight-function";
  v157 = @"unclamped-weight";
  v158 = @"supports-combining-strokes";
  v159 = @"radius";
  v160 = @"opacity";
  v161 = @"edge-width";
  v162 = @"aspect-ratio";
  v163 = @"ruler-offset-scale";
  v164 = @"ruler-offset-constant";
  v165 = @"variable-snapped-width";
  v166 = @"brush-opacity";
  v167 = @"show-brush-indicator";
  v168 = @"animation";
  v169 = @"ink-transform";
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v145 count:25];
  uint64_t v13 = [v11 arrayWithArray:v12];

  long long v141 = 0u;
  long long v142 = 0u;
  long long v139 = 0u;
  long long v140 = 0u;
  uint64_t v14 = [v126 allKeys];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v139 objects:&v143 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v140;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v140 != v16) {
          objc_enumerationMutation(v14);
        }
        uint64_t v18 = *(void *)(*((void *)&v139 + 1) + 8 * i);
        if ([v13 containsObject:v18]) {
          [v13 removeObject:v18];
        }
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v139 objects:&v143 count:16];
    }
    while (v15);
  }

  char v19 = [v126 objectForKeyedSubscript:@"stylusSmoothing"];
  if (v19)
  {
    int v20 = [v126 objectForKeyedSubscript:@"stylusSmoothing"];
    [v20 floatValue];
    double v22 = v21;
  }
  else
  {
    double v22 = 0.12;
  }

  v23 = [v126 objectForKeyedSubscript:@"touch-smoothing"];
  if (v23)
  {
    v24 = [v126 objectForKeyedSubscript:@"touch-smoothing"];
    [v24 floatValue];
    double v26 = v25;
  }
  else
  {
    double v26 = 0.16;
  }

  uint64_t v27 = [v126 objectForKeyedSubscript:@"velocitySmoothing"];
  if (v27)
  {
    uint64_t v28 = [v126 objectForKeyedSubscript:@"velocitySmoothing"];
    [v28 floatValue];
    double v30 = v29;
  }
  else
  {
    double v30 = 0.05;
  }

  float v31 = [v126 objectForKeyedSubscript:@"angleSmoothing"];
  if (v31)
  {
    float v32 = [v126 objectForKeyedSubscript:@"angleSmoothing"];
    [v32 floatValue];
    double v34 = v33;
  }
  else
  {
    double v34 = 0.0;
  }

  v121 = [[PKInkSmoothingDescriptor alloc] initWithStylusSmoothing:v22 touch:v26 velocity:v30 angle:v34 radius:0.0];
  uint64_t v35 = [v126 objectForKeyedSubscript:@"show-brush-indicator"];
  char v36 = [v35 BOOLValue];

  long long v37 = [v126 objectForKeyedSubscript:@"ruler-offset-scale"];
  if (v37)
  {
    float v38 = [v126 objectForKeyedSubscript:@"ruler-offset-scale"];
    [v38 floatValue];
    double v40 = v39;
  }
  else
  {
    double v40 = 1.0;
  }

  float v41 = [v126 objectForKeyedSubscript:@"ruler-offset-constant"];
  if (v41)
  {
    float v42 = [v126 objectForKeyedSubscript:@"ruler-offset-constant"];
    [v42 floatValue];
    double v44 = v43;
  }
  else
  {
    double v44 = 0.0;
  }

  uint64_t v45 = [v126 objectForKeyedSubscript:@"end-cap-fade"];
  [v45 floatValue];
  float v47 = v46;

  v48 = [v126 objectForKeyedSubscript:@"end-cap-time"];
  [v48 floatValue];
  float v50 = v49;

  v51 = [v126 objectForKeyedSubscript:@"start-cap-fade"];
  [v51 floatValue];
  float v53 = v52;

  uint64_t v54 = [v126 objectForKeyedSubscript:@"start-cap-time"];
  [v54 floatValue];
  double v56 = v55;

  v120 = +[PKInkFeatheringDescriptor descriptorWithStartCapTime:v56 startCapFade:v53 endCapTime:v50 endCapFade:v47];
  double v57 = 0.0;
  double v58 = 0.0;
  if ([v125 blendMode] == 1)
  {
    v59 = [v126 objectForKeyedSubscript:@"blendAlpha"];
    [v59 floatValue];
    float v61 = v60;

    v62 = [v126 objectForKeyedSubscript:@"targetMultiple"];
    [v62 floatValue];
    double v57 = v61;
    double v58 = v63;
  }
  v64 = [v126 objectForKeyedSubscript:@"base-alpha"];
  [v64 floatValue];
  float v66 = v65;

  v67 = [v126 objectForKeyedSubscript:@"unclamped-weight"];
  uint64_t v68 = [v67 BOOLValue];

  v69 = [v126 objectForKeyedSubscript:@"supports-combining-strokes"];
  char v70 = [v69 BOOLValue];
  float v115 = v66;
  double v113 = v58;
  double v114 = v57;
  double v116 = v44;
  double v117 = v40;

  v71 = [v126 objectForKeyedSubscript:@"ink-transform"];
  uint64_t v72 = *MEMORY[0x1E4F1DAB8];
  uint64_t v73 = *(void *)(MEMORY[0x1E4F1DAB8] + 8);
  uint64_t v75 = *(void *)(MEMORY[0x1E4F1DAB8] + 16);
  uint64_t v74 = *(void *)(MEMORY[0x1E4F1DAB8] + 24);
  uint64_t v76 = *(void *)(MEMORY[0x1E4F1DAB8] + 32);
  uint64_t v77 = *(void *)(MEMORY[0x1E4F1DAB8] + 40);
  v124 = v71;
  if (v71 && [v71 count] == 6)
  {
    v78 = [v124 objectAtIndexedSubscript:0];
    [v78 doubleValue];
    uint64_t v72 = v79;

    v80 = [v124 objectAtIndexedSubscript:1];
    [v80 doubleValue];
    uint64_t v73 = v81;

    v82 = [v124 objectAtIndexedSubscript:2];
    [v82 doubleValue];
    uint64_t v75 = v83;

    v84 = [v124 objectAtIndexedSubscript:3];
    [v84 doubleValue];
    uint64_t v74 = v85;

    v86 = [v124 objectAtIndexedSubscript:4];
    [v86 doubleValue];
    uint64_t v76 = v87;

    v88 = [v124 objectAtIndexedSubscript:5];
    [v88 doubleValue];
    uint64_t v77 = v89;
  }
  v90 = [v126 objectForKeyedSubscript:@"weight-function"];

  if (v90)
  {
    v91 = [v126 objectForKeyedSubscript:@"weight-function"];
    +[PKInkParser loadFunction:v91];
    v92 = v145;
  }
  else
  {
    v92 = 0;
  }
  v93 = [v126 objectForKeyedSubscript:@"animation"];
  v118 = v93;
  if (v93)
  {
    v94 = [v93 objectForKeyedSubscript:@"duration"];
    [v94 floatValue];
    float v96 = v95;

    v97 = [v118 objectForKeyedSubscript:@"size-delta"];
    [v97 floatValue];
    float v99 = v98;

    v119 = [[PKInkAnimationDescriptor alloc] initWithDuration:v96 sizeDelta:v99];
  }
  else
  {
    v119 = 0;
  }
  v100 = [v126 objectForKeyedSubscript:@"radius"];
  +[PKInkParser loadOutput:v100];

  v101 = [v126 objectForKeyedSubscript:@"opacity"];
  +[PKInkParser loadOutput:v101];

  v102 = [v126 objectForKeyedSubscript:@"edge-width"];
  +[PKInkParser loadOutput:v102];

  v103 = [v126 objectForKeyedSubscript:@"aspect-ratio"];
  +[PKInkParser loadOutput:v103];

  v104 = [v126 objectForKeyedSubscript:@"brush-opacity"];
  +[PKInkParser loadOutput:v104];

  v105 = [PKInkBehavior alloc];
  v133[0] = v72;
  v133[1] = v73;
  v133[2] = v75;
  v133[3] = v74;
  v133[4] = v76;
  v133[5] = v77;
  memset(v132, 0, sizeof(v132));
  std::vector<PKOutputFunction>::__init_with_size[abi:ne180100]<PKOutputFunction*,PKOutputFunction*>((PKOutputFunction *)v132, v145, v146, 0xCCCCCCCCCCCCCCCDLL * ((v146 - v145) >> 3));
  memset(v131, 0, sizeof(v131));
  memset(v130, 0, sizeof(v130));
  std::vector<PKOutputFunction>::__init_with_size[abi:ne180100]<PKOutputFunction*,PKOutputFunction*>((PKOutputFunction *)v130, v143, v144, 0xCCCCCCCCCCCCCCCDLL * ((v144 - v143) >> 3));
  memset(v129, 0, sizeof(v129));
  std::vector<PKOutputFunction>::__init_with_size[abi:ne180100]<PKOutputFunction*,PKOutputFunction*>((PKOutputFunction *)v129, (PKOutputFunction *)v139, *((PKOutputFunction **)&v139 + 1), 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*((void *)&v139 + 1) - v139) >> 3));
  memset(v128, 0, sizeof(v128));
  std::vector<PKOutputFunction>::__init_with_size[abi:ne180100]<PKOutputFunction*,PKOutputFunction*>((PKOutputFunction *)v128, v136, v137, 0xCCCCCCCCCCCCCCCDLL * ((v137 - v136) >> 3));
  memset(v127, 0, sizeof(v127));
  std::vector<PKOutputFunction>::__init_with_size[abi:ne180100]<PKOutputFunction*,PKOutputFunction*>((PKOutputFunction *)v127, v134, v135, 0xCCCCCCCCCCCCCCCDLL * ((v135 - v134) >> 3));
  BYTE1(v112) = v70;
  LOBYTE(v112) = v36;
  v106 = -[PKInkBehavior initWithRenderingDescriptor:blendAlpha:targetMultiple:baseAlpha:inkTransform:useUnclampedWeight:smoothingDescriptor:featheringDescriptor:pencilFeatheringDescriptor:animationDescriptor:identifier:version:variant:uiWidths:defaultWidth:showBrushIndicator:supportsCombiningStrokes:rulerOffsetScale:rulerOffsetConstant:weightFunction:radiusOutput:radius2Output:opacityOutput:edgeWidthOutput:aspectRatioOutput:brushOpacityOutput:](v105, "initWithRenderingDescriptor:blendAlpha:targetMultiple:baseAlpha:inkTransform:useUnclampedWeight:smoothingDescriptor:featheringDescriptor:pencilFeatheringDescriptor:animationDescriptor:identifier:version:variant:uiWidths:defaultWidth:showBrushIndicator:supportsCombiningStrokes:rulerOffsetScale:rulerOffsetConstant:weightFunction:radiusOutput:radius2Output:opacityOutput:edgeWidthOutput:aspectRatioOutput:brushOpacityOutput:", v125, v133, v68, v121, v120, 0, v114, v113, v115, 0.0, v117, v116, v119, v122,
           a5,
           v123,
           MEMORY[0x1E4F1CBF0],
           v112,
           v92,
           v132,
           v131,
           v130,
           v129,
           v128,
           v127);
  v138 = (void ***)v127;
  std::vector<PKOutputFunction>::__destroy_vector::operator()[abi:ne180100]((void ***)&v138);
  v138 = (void ***)v128;
  std::vector<PKOutputFunction>::__destroy_vector::operator()[abi:ne180100]((void ***)&v138);
  v138 = (void ***)v129;
  std::vector<PKOutputFunction>::__destroy_vector::operator()[abi:ne180100]((void ***)&v138);
  v138 = (void ***)v130;
  std::vector<PKOutputFunction>::__destroy_vector::operator()[abi:ne180100]((void ***)&v138);
  v138 = (void ***)v131;
  std::vector<PKOutputFunction>::__destroy_vector::operator()[abi:ne180100]((void ***)&v138);
  v138 = (void ***)v132;
  std::vector<PKOutputFunction>::__destroy_vector::operator()[abi:ne180100]((void ***)&v138);
  v107 = v106;
  self;
  v108 = [(PKInkBehavior *)v107 renderingDescriptor];
  BOOL v109 = [v108 type] == 1;

  if (v109)
  {
    [(PKInkBehavior *)v107 particleDescriptor];
  }
  v110 = [(PKInkBehavior *)v107 renderingDescriptor];
  [v110 blendMode];

  v138 = (void ***)&v134;
  std::vector<PKOutputFunction>::__destroy_vector::operator()[abi:ne180100]((void ***)&v138);
  v134 = (PKOutputFunction *)&v136;
  std::vector<PKOutputFunction>::__destroy_vector::operator()[abi:ne180100]((void ***)&v134);
  v136 = (PKOutputFunction *)&v139;
  std::vector<PKOutputFunction>::__destroy_vector::operator()[abi:ne180100]((void ***)&v136);
  *(void *)&long long v139 = &v143;
  std::vector<PKOutputFunction>::__destroy_vector::operator()[abi:ne180100]((void ***)&v139);
  v143 = (PKOutputFunction *)&v145;
  std::vector<PKOutputFunction>::__destroy_vector::operator()[abi:ne180100]((void ***)&v143);

  return v107;
}

+ (BOOL)hasDefinitionForIdentifier:(uint64_t)a1
{
  id v2 = a2;
  self;
  id v3 = +[PKInkParser plistPathForIdentifier:]((uint64_t)PKInkParser, v2);
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    uint64_t v5 = +[PKInkParser v2plistPathForIdentifier:]((uint64_t)PKInkParser, v2);
    BOOL v4 = v5 != 0;
  }
  return v4;
}

+ (id)inkBehaviorsWithIdentifer:(uint64_t)a3 version:
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = self;
  float v33 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v5 = [NSString stringWithFormat:@"%@.%lu", v3, a3];
  float v31 = +[PKInkParser v2plistPathForIdentifier:](v4, v3);
  if (v31
    && ([MEMORY[0x1E4F1CB10] fileURLWithPath:v31],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        +[PKInkBehavior loadInkV2WithURL:v6],
        v7 = objc_claimAutoreleasedReturnValue(),
        v6,
        v7))
  {
    double v34 = v7;
    if ([v7 version] == a3)
    {
      uint64_t v8 = [PKInkKey alloc];
      uint64_t v9 = [v7 version];
      id v10 = [v7 variant];
      unsigned int v11 = -[PKInkKey initWithIdentifier:version:variant:](v8, v3, v9, v10);

      uint64_t v45 = v11;
      v46[0] = v7;
      id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:&v45 count:1];
    }
    else
    {
      unsigned int v11 = os_log_create("com.apple.pencilkit", "");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        float v42 = (__CFString *)a3;
        __int16 v43 = 2112;
        double v44 = v3;
        _os_log_impl(&dword_1C44F8000, v11, OS_LOG_TYPE_DEFAULT, "Couldn't find version: %lu for V2 ink: %@", buf, 0x16u);
      }
      id v12 = 0;
    }
  }
  else
  {
    uint64_t v13 = +[PKInkParser plistDictionaryForInk:]((uint64_t)PKInkParser, v3);
    if (v13)
    {
      uint64_t v14 = v3;
    }
    else
    {
      uint64_t v15 = os_log_create("com.apple.pencilkit", "");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        float v42 = v3;
        _os_log_fault_impl(&dword_1C44F8000, v15, OS_LOG_TYPE_FAULT, "Could not find ink for %@", buf, 0xCu);
      }

      uint64_t v14 = @"com.apple.ink.pen";
      uint64_t v13 = +[PKInkParser plistDictionaryForInk:]((uint64_t)PKInkParser, v14);
    }
    double v34 = v13;
    uint64_t v16 = [v13 objectForKeyedSubscript:v5];
    BOOL v17 = v16 == 0;

    if (v17)
    {
      uint64_t v18 = os_log_create("com.apple.pencilkit", "");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        float v42 = (__CFString *)a3;
        __int16 v43 = 2112;
        double v44 = v14;
        _os_log_impl(&dword_1C44F8000, v18, OS_LOG_TYPE_DEFAULT, "Couldn't find version: %lu for ink: %@", buf, 0x16u);
      }

      uint64_t v19 = [NSString stringWithFormat:@"%@.%lu", v14, 0];

      uint64_t v5 = (void *)v19;
    }
    int v20 = [v34 objectForKeyedSubscript:v5];
    float v32 = +[PKInkParser inkRenderingDescriptorWithDictionary:]((uint64_t)PKInkParser, v20);

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    float v21 = [v34 allKeys];
    uint64_t v22 = [v21 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v37 != v23) {
            objc_enumerationMutation(v21);
          }
          float v25 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          if (([v25 isEqualToString:v5] & 1) == 0 && objc_msgSend(v25, "hasPrefix:", v5))
          {
            double v26 = objc_msgSend(v25, "substringFromIndex:", objc_msgSend(v5, "length") + 1);
            uint64_t v27 = [v34 objectForKeyedSubscript:v25];
            uint64_t v28 = +[PKInkParser inkBehaviorVariantWithDictionary:renderingDescriptor:identifier:version:variant:]((uint64_t)PKInkParser, v27, v32, v14, a3, v26);
            float v29 = -[PKInkKey initWithIdentifier:version:variant:]([PKInkKey alloc], v14, a3, v26);
            [v33 setObject:v28 forKeyedSubscript:v29];
          }
        }
        uint64_t v22 = [v21 countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v22);
    }

    id v12 = v33;
    id v3 = v14;
    unsigned int v11 = v32;
  }

  return v12;
}

+ (id)plistDictionaryForInk:(uint64_t)a1
{
  id v2 = a2;
  uint64_t v3 = self;
  uint64_t v4 = +[PKInkParser plistPathForIdentifier:](v3, v2);
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v4];
    uint64_t v6 = [MEMORY[0x1E4F28F98] propertyListWithData:v5 options:0 format:0 error:0];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

+ (id)v2plistPathForIdentifier:(uint64_t)a1
{
  id v2 = a2;
  self;
  if ([(__CFString *)v2 isEqualToString:@"com.apple.ink.future"])
  {
    uint64_t v3 = @"com.apple.ink.crayon";

    id v2 = v3;
  }
  uint64_t v4 = +[PKMetalResourceHandler inkBundle]();
  uint64_t v5 = [(__CFString *)v2 stringByAppendingString:@".v2"];
  uint64_t v6 = [v4 pathForResource:v5 ofType:@"plist"];

  return v6;
}

+ (id)plistPathForIdentifier:(uint64_t)a1
{
  id v2 = a2;
  self;
  uint64_t v3 = +[PKMetalResourceHandler inkBundle]();
  uint64_t v4 = [v3 pathForResource:v2 ofType:@"plist"];

  return v4;
}

+ (id)inkBehaviorFromDictionary:(void *)a3 identifier:(uint64_t)a4 version:(void *)a5 variant:
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a5;
  self;
  unsigned int v11 = [v8 objectForKeyedSubscript:v9];
  id v12 = +[PKInkParser inkRenderingDescriptorWithDictionary:]((uint64_t)PKInkParser, v11);

  uint64_t v13 = [v8 objectForKeyedSubscript:v10];
  uint64_t v14 = +[PKInkParser inkBehaviorVariantWithDictionary:renderingDescriptor:identifier:version:variant:]((uint64_t)PKInkParser, v13, v12, v9, a4, v10);

  return v14;
}

@end