@interface SCNCommonProfileProgramGeneratorMetal
- (__C3DFXProgram)_newProgramWithHashCode:(__C3DProgramHashCode *)a3 engineContext:(__C3DEngineContext *)a4 introspectionDataPtr:(void *)a5;
- (__C3DFXProgram)_newProgramWithHashCodeWithFunctionConstants:(__C3DProgramHashCode *)a3 engineContext:(__C3DEngineContext *)a4 introspectionDataPtr:(void *)a5;
- (id)initAllowingHotReload:(BOOL)a3;
- (id)splitInputOutputStructsIfNeededForSourceCode:(id)a3 generatedFromReplacementStrings:(id)a4 perPixelLighting:(BOOL)a5 clipDistanceCount:(unint64_t)a6;
- (int)profile;
- (void)_loadSourceCode;
- (void)collectShaderForProgram:(__C3DFXMetalProgram *)a3 hashCode:(id)a4 newVertexFunctionName:(id)a5 newFragmentFunctionName:(id)a6 sourceCodeBlock:(id)a7 additionalFileBlock:(id)a8;
- (void)dealloc;
- (void)emptyShaderCache;
@end

@implementation SCNCommonProfileProgramGeneratorMetal

- (void)_loadSourceCode
{
}

- (id)initAllowingHotReload:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SCNCommonProfileProgramGeneratorMetal;
  v4 = [(SCNCommonProfileProgramGenerator *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_allowHotReload = a3;
    v4->_useFunctionConstants = C3DStandardShadersUseFunctionConstants();
    [(SCNCommonProfileProgramGeneratorMetal *)v5 _loadSourceCode];
  }
  return v5;
}

- (__C3DFXProgram)_newProgramWithHashCode:(__C3DProgramHashCode *)a3 engineContext:(__C3DEngineContext *)a4 introspectionDataPtr:(void *)a5
{
  v6 = a3;
  *(void *)((char *)&v215[2] + 4) = *MEMORY[0x263EF8340];
  if (self->_useFunctionConstants)
  {
    return [(SCNCommonProfileProgramGeneratorMetal *)self _newProgramWithHashCodeWithFunctionConstants:a3 engineContext:a4 introspectionDataPtr:a5];
  }
  long long v195 = 0u;
  long long v196 = 0u;
  long long v193 = 0u;
  long long v194 = 0u;
  long long v191 = 0u;
  long long v192 = 0u;
  long long v190 = 0u;
  long long v188 = 0u;
  long long v189 = 0u;
  long long v186 = 0u;
  long long v187 = 0u;
  long long v184 = 0u;
  long long v185 = 0u;
  long long v183 = 0u;
  v181 = a3;
  v8 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", 0, a4, a5);
  v182 = v8;
  v9 = 0;
  if (C3DShouldCollectGeneratedShaders())
  {
    v9 = (void *)[MEMORY[0x263EFF9C0] setWithCapacity:0];
    *(void *)&long long v183 = v9;
  }
  *(void *)&long long v187 = [MEMORY[0x263F089D8] stringWithCapacity:0];
  *(void *)&long long v184 = [MEMORY[0x263F089D8] stringWithCapacity:0];
  *((void *)&v184 + 1) = [MEMORY[0x263F089D8] stringWithCapacity:0];
  *((void *)&v187 + 1) = [MEMORY[0x263F089D8] stringWithCapacity:0];
  *(void *)&long long v188 = [MEMORY[0x263F089D8] stringWithCapacity:0];
  *((void *)&v188 + 1) = [MEMORY[0x263F089D8] stringWithCapacity:0];
  *(void *)&long long v189 = [MEMORY[0x263F089D8] stringWithCapacity:0];
  *((void *)&v189 + 1) = [MEMORY[0x263F089D8] stringWithCapacity:0];
  *((void *)&v190 + 1) = [MEMORY[0x263F089D8] stringWithCapacity:0];
  *(void *)&long long v191 = [MEMORY[0x263F089D8] stringWithCapacity:0];
  *(void *)&long long v192 = [MEMORY[0x263F089D8] stringWithCapacity:0];
  *((void *)&v192 + 1) = [MEMORY[0x263F089D8] stringWithCapacity:0];
  *(void *)&long long v193 = [MEMORY[0x263F089D8] stringWithCapacity:0];
  *((void *)&v193 + 1) = [MEMORY[0x263F089D8] stringWithCapacity:0];
  *(void *)&long long v194 = [MEMORY[0x263F089D8] stringWithCapacity:0];
  __int16 Conditioners = C3DProgramHashCodeGetConditioners((uint64_t)v6);
  int IsOpaque = C3DProgramHashCodeIsOpaque((uint64_t)v6);
  int HasTexture = C3DProgramHashCodeGetEffectPropertyHasTexture((uint64_t)v6, 7u);
  int v159 = C3DProgramHashCodeGetEffectPropertyHasTexture((uint64_t)v6, 4u);
  int v12 = C3DProgramHashCodeGetEffectPropertyHasTexture((uint64_t)v6, 5u);
  int IsOne = C3DProgramHashCodeGlobalAlphaIsOne((uint64_t)v6);
  int HasConstantAlpha = C3DProgramHashCodeHasConstantAlpha((uint64_t)v6);
  int LightingEnabled = C3DProgramHashCodeGetLightingEnabled((uint64_t)v6);
  unsigned int CommonProfileHashCode = C3DProgramHashCodeGetCommonProfileHashCode((uint64_t)v6);
  unsigned int NodeHashCode = C3DProgramHashCodeGetNodeHashCode((uint64_t)v6);
  int v163 = IsOne;
  int v161 = IsOpaque;
  int v170 = (NodeHashCode & 4) != 0 && C3DEngineContextHasFeatures((uint64_t)a4, 16);
  __int16 EffectPropertyHashCode = C3DProgramHashCodeGetEffectPropertyHashCode((uint64_t)v6, 2u);
  int v160 = HasTexture;
  BYTE11(v194) = HasTexture | ((CommonProfileHashCode & 0x10) >> 4);
  int RenderMode = C3DProgramHashCodeGetRenderMode((uint64_t)v6);
  uint64_t EyeCount = C3DProgramHashCodeGetEyeCount((uint64_t)v6);
  if (!RenderMode) {
    goto LABEL_23;
  }
  uint64_t v17 = EyeCount;
  if (![v8 objectForKeyedSubscript:@"USE_POSITION"]) {
    [v8 setObject:&unk_26BFC14B0 forKeyedSubscript:@"USE_POSITION"];
  }
  objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedChar:", v17), @"USE_MULTIPLE_RENDERING");
  int MultiVertexOutputStreamGenerator = C3DProgramHashCodeGetMultiVertexOutputStreamGenerator((uint64_t)v6);
  if (MultiVertexOutputStreamGenerator == 2)
  {
    v19 = @"USE_VERTEX_AMPLIFICATION";
    goto LABEL_17;
  }
  if (MultiVertexOutputStreamGenerator == 1)
  {
    v19 = @"USE_INSTANCING";
LABEL_17:
    [v8 setObject:&stru_26BF72F58 forKeyedSubscript:v19];
  }
  if (RenderMode == 1)
  {
    v20 = @"USE_LAYERED_RENDERING";
  }
  else
  {
    if (RenderMode != 2) {
      goto LABEL_23;
    }
    v20 = @"USE_MULTIPLE_VIEWPORTS_RENDERING";
  }
  [v8 setObject:&stru_26BF72F58 forKeyedSubscript:v20];
LABEL_23:
  if (v9)
  {
    [v9 addObject:@"USE_MULTIPLE_RENDERING"];
    [v9 addObject:@"USE_VERTEX_AMPLIFICATION"];
    [v9 addObject:@"USE_INSTANCING"];
    [v9 addObject:@"USE_LAYERED_RENDERING"];
    [v9 addObject:@"USE_MULTIPLE_VIEWPORTS_RENDERING"];
  }
  unint64_t v21 = SCNMetalLanguageVersion();
  unsigned int Status = C3DSceneSourceGetStatus((uint64_t)v6);
  if (v21 <= Status) {
    unint64_t v23 = Status;
  }
  else {
    unint64_t v23 = v21;
  }
  __int16 v24 = CommonProfileHashCode;
  __int16 v25 = Conditioners;
  if ((RenderMode == 2 || RenderMode == 1) && v23 <= 0x20001) {
    unint64_t v23 = 131073;
  }
  int VertexAmplificationEnabled = C3DEngineContextGetVertexAmplificationEnabled((uint64_t)a4);
  uint64_t v27 = 131074;
  if (v23 > 0x20002) {
    uint64_t v27 = v23;
  }
  if (!VertexAmplificationEnabled) {
    uint64_t v27 = v23;
  }
  unint64_t v169 = v27;
  char v28 = __InjectAllModifiersIfNeeded((uint64_t)&v181);
  if ([v182 objectForKeyedSubscript:@"USE_MODIFIER_FRAMEBUFFER_COLOR0"])
  {
    if (C3DEngineContextHasFeatures((uint64_t)a4, 2048))
    {
      [v182 setObject:&unk_26BFC14C8 forKeyedSubscript:@"C3D_SUPPORTS_PROGRAMMABLE_BLENDING"];
    }
    else
    {
      v29 = scn_default_log();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        -[SCNCommonProfileProgramGeneratorMetal _newProgramWithHashCode:engineContext:introspectionDataPtr:]();
      }
    }
  }
  if ((void)v183)
  {
    [(id)v183 addObject:@"USE_MODIFIER_FRAMEBUFFER_COLOR0"];
    [(id)v183 addObject:@"C3D_SUPPORTS_PROGRAMMABLE_BLENDING"];
  }
  int v30 = CommonProfileHashCode & 0xF;
  if ([v182 objectForKeyedSubscript:@"USE_CLIP_DISTANCE3"])
  {
    [v182 setObject:@"4" forKeyedSubscript:@"USE_CLIP_DISTANCE_COUNT"];
    uint64_t v31 = 4;
LABEL_51:
    uint64_t v165 = v31;
    goto LABEL_52;
  }
  if ([v182 objectForKeyedSubscript:@"USE_CLIP_DISTANCE2"])
  {
    [v182 setObject:@"3" forKeyedSubscript:@"USE_CLIP_DISTANCE_COUNT"];
    uint64_t v31 = 3;
    goto LABEL_51;
  }
  if ([v182 objectForKeyedSubscript:@"USE_CLIP_DISTANCE1"])
  {
    [v182 setObject:@"2" forKeyedSubscript:@"USE_CLIP_DISTANCE_COUNT"];
    uint64_t v31 = 2;
    goto LABEL_51;
  }
  if ([v182 objectForKeyedSubscript:@"USE_CLIP_DISTANCE0"])
  {
    [v182 setObject:@"1" forKeyedSubscript:@"USE_CLIP_DISTANCE_COUNT"];
    uint64_t v31 = 1;
    goto LABEL_51;
  }
  uint64_t v165 = 0;
LABEL_52:
  if (v30 == 5) {
    BYTE11(v194) = 1;
  }
  int IsEnabled = 0;
  if ((CommonProfileHashCode & 0xB) != 0) {
    int v33 = LightingEnabled;
  }
  else {
    int v33 = 0;
  }
  if (v30 == 5) {
    int v34 = 1;
  }
  else {
    int v34 = v33;
  }
  char v156 = v28;
  if ((CommonProfileHashCode & 0xE) == 2 && v34) {
    int IsEnabled = C3DProgramHashCodeGetEffectPropertyIsEnabled((uint64_t)v6, 3u);
  }
  if ([v182 objectForKeyedSubscript:@"USE_SPECULAR"]) {
    int v35 = 1;
  }
  else {
    int v35 = IsEnabled;
  }
  int v164 = v35;
  if (v35 == 1)
  {
    if (BYTE11(v194)) {
      v36 = &unk_26BFC14C8;
    }
    else {
      v36 = &unk_26BFC14B0;
    }
    [v182 setObject:v36 forKeyedSubscript:@"USE_VIEW"];
    if (BYTE11(v194)) {
      v37 = &unk_26BFC14C8;
    }
    else {
      v37 = &unk_26BFC14B0;
    }
    [v182 setObject:v37 forKeyedSubscript:@"USE_SHININESS"];
  }
  BYTE10(v194) = 0;
  WORD4(v194) = 0;
  HIDWORD(v194) = 0;
  BYTE8(v196) = 1;
  Ambientint LightingEnabled = C3DProgramHashCodeGetAmbientLightingEnabled((uint64_t)v6);
  uint64_t v174 = (uint64_t)v6;
  v168 = a4;
  int v172 = v34;
  unsigned int v167 = CommonProfileHashCode & 0xF;
  if (!v34) {
    goto LABEL_190;
  }
  if (*((void *)&v191 + 1))
  {
    uint64_t Declaration = C3DShaderModifierGetDeclaration(*((uint64_t *)&v191 + 1));
    if (Declaration) {
      [(id)v191 appendString:Declaration];
    }
  }
  int v155 = v12;
  if (v30 == 5)
  {
    [v182 setObject:&stru_26BF72F58 forKeyedSubscript:@"USE_PBR"];
    v39 = v182;
    v40 = (__CFString *)&unk_26BFC14C8;
    v41 = @"USE_VIEW";
LABEL_82:
    [v39 setObject:v40 forKeyedSubscript:v41];
    goto LABEL_83;
  }
  if (v30 == 6)
  {
    v39 = v182;
    v40 = &stru_26BF72F58;
    v41 = @"USE_SHADOWONLY";
    goto LABEL_82;
  }
LABEL_83:
  unsigned int LightsMask = C3DProgramHashCodeGetLightsMask((uint64_t)v6);
  unsigned int LightsCount = C3DProgramHashCodeGetLightsCount((uint64_t)v6);
  if (LightsCount)
  {
    uint64_t v44 = 0;
    uint64_t v178 = LightsCount;
    unsigned int v175 = LightsMask;
    while (1)
    {
      if ((LightsMask >> v44))
      {
        unsigned int LightHashCode = C3DProgramHashCodeGetLightHashCode((uint64_t)v181, (unsigned __int16)v44);
        unsigned int v46 = LightHashCode;
        BOOL v47 = (LightHashCode & 5) == 1 && (LightHashCode >> 9) & 1;
        uint64_t v48 = (LightHashCode >> 21) & 7;
        BOOL v49 = v48 > 1 && (LightHashCode >> 25) & 1;
        int v50 = LightHashCode & 7;
        if ((LightHashCode & 7) != 0) {
          break;
        }
      }
LABEL_171:
      if (v178 == ++v44) {
        goto LABEL_179;
      }
    }
    unsigned int v51 = LightHashCode;
    uint64_t v52 = LightHashCode & 0x400;
    if (v52)
    {
      if (BYTE11(v194))
      {
        if (v50 == 2)
        {
          [*((id *)&v193 + 1) appendFormat:@", depthcube<float> u_shadowTexture%d\n", v44];
        }
        else if (v48 < 2)
        {
          [*((id *)&v193 + 1) appendFormat:@", depth2d<float> u_shadowTexture%d\n", v44];
        }
        else
        {
          [*((id *)&v193 + 1) appendFormat:@", depth2d_array<float> u_shadowTexture%d\n", v44];
        }
      }
      else
      {
        [(id)v193 appendFormat:@", depth2d<float> u_shadowTexture%d\n", v44];
        uint64_t v48 = 1;
      }
    }
    C3DProgramHashCodeGetCommonProfileHashCode((uint64_t)v181);
    if (v47)
    {
      if (BYTE11(v194)) {
        uint64_t v53 = 184;
      }
      else {
        uint64_t v53 = 176;
      }
      [*(__C3DProgramHashCode **)((char *)&v181 + v53) appendFormat:@", texture2d<half> u_goboTexture%d\n", v44];
      [*(__C3DProgramHashCode **)((char *)&v181 + v53) appendFormat:@", sampler u_goboTexture%dSampler\n", v44];
    }
    if (v50 == 5)
    {
      v54 = @", texture2d<half> u_iesTexture%d\n";
    }
    else if (v50 != 6 {
           || (v54 = @", device packed_float2* u_areaPolygonPositions%d\n", (unsigned __int16)v46 >> 13 != 4))
    }
    {
LABEL_112:
      uint64_t v55 = HIWORD(v51) & 0x1F;
      int v56 = v50 - 1;
      char v57 = v50 != 1 || v47;
      if (v52) {
        char v57 = 1;
      }
      BYTE8(v194) |= v57;
      BYTE9(v194) |= v52 >> 10;
      int v58 = HIDWORD(v194);
      if (HIDWORD(v194) <= v55) {
        int v58 = v55;
      }
      HIDWORD(v194) = v58;
      if (C3DProgramHashCodeGetRenderMode((uint64_t)v181))
      {
        int v59 = C3DProgramHashCodeGetMultiVertexOutputStreamGenerator((uint64_t)v181);
        if (v59 == 1)
        {
          if (BYTE11(v194)) {
            uint64_t v60 = objc_msgSend(NSString, "stringWithFormat:", @"USE_MULTIPLE_RENDERING * %d + in.sliceIndex", v44);
          }
          else {
            uint64_t v60 = objc_msgSend(NSString, "stringWithFormat:", @"USE_MULTIPLE_RENDERING * %d + out.sliceIndex", v44);
          }
        }
        else if (v59 == 2)
        {
          uint64_t v60 = objc_msgSend(NSString, "stringWithFormat:", @"USE_MULTIPLE_RENDERING * %d + amplificationID", v44);
        }
        else
        {
          v61 = scn_default_log();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
            -[SCNCommonProfileProgramGeneratorMetal _newProgramWithHashCode:engineContext:introspectionDataPtr:](&buf, v198, v61);
          }
          uint64_t v60 = 0;
        }
      }
      else
      {
        uint64_t v60 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v44);
      }
      uint64_t v62 = v46 & 0x1000;
      switch(v56)
      {
        case 0:
          if (v47)
          {
            BYTE10(v194) |= v62 >> 12;
            BOOL v63 = v62 == 0;
            v64 = "true";
            if (v63) {
              v64 = "false";
            }
            objc_msgSend(*((id *)&v190 + 1), "appendFormat:", @"\t_lightingContribution.add_directional(scn_lights[%@], u_goboTexture%d, u_goboTexture%dSampler, %s);\n",
              v60,
              v44,
              v44,
              v64,
              v153,
              v154);
            goto LABEL_170;
          }
          if (!v52)
          {
            objc_msgSend(*((id *)&v190 + 1), "appendFormat:", @"\t_lightingContribution.add_directional(scn_lights[%@]);\n",
              v60,
              v148,
              v149,
              v150,
              v153,
              v154);
            goto LABEL_170;
          }
          if (v48 >= 2)
          {
            v68 = "true";
            if ((v46 & 0x1000000) != 0) {
              v69 = "true";
            }
            else {
              v69 = "false";
            }
            if (!v49) {
              v68 = "false";
            }
            objc_msgSend(*((id *)&v190 + 1), "appendFormat:", @"\t_lightingContribution.add_directional(scn_lights[%@], u_shadowTexture%d, %d, %s, u_shadowKernel, %d, %s);\n",
              v60,
              v44,
              v48,
              v69,
              v55,
              v68);
            goto LABEL_170;
          }
          unsigned int LightsMask = v175;
          if (v55 < 2)
          {
            uint64_t v148 = v44;
            objc_msgSend(*((id *)&v190 + 1), "appendFormat:", @"\t_lightingContribution.add_directional(scn_lights[%@], u_shadowTexture%d);\n",
              v60);
          }
          else
          {
            uint64_t v148 = v44;
            uint64_t v149 = v55;
            if ((v46 & 0x4000000) != 0) {
              objc_msgSend(*((id *)&v190 + 1), "appendFormat:", @"\t_lightingContribution.add_directional(scn_lights[%@], u_shadowTexture%d, %d);\n",
            }
                v60);
            else {
              objc_msgSend(*((id *)&v190 + 1), "appendFormat:", @"\t_lightingContribution.add_directional(scn_lights[%@], u_shadowTexture%d, u_shadowKernel, %d);\n",
            }
                v60);
          }
          goto LABEL_171;
        case 1:
          if (v52 && BYTE8(v196)) {
            objc_msgSend(*((id *)&v190 + 1), "appendFormat:", @"\t_lightingContribution.add_omni(scn_lights[%@], u_shadowTexture%d, u_shadowKernel, %d);\n",
          }
              v60,
              v44,
              v55,
              v150,
              v153,
              v154);
          else {
            objc_msgSend(*((id *)&v190 + 1), "appendFormat:", @"\t_lightingContribution.add_omni(scn_lights[%@]);\n",
          }
              v60,
              v148,
              v149,
              v150,
              v153,
              v154);
          goto LABEL_170;
        case 2:
          char v65 = !v47;
          if ((v46 & 0x1400) != 0x400) {
            char v65 = 1;
          }
          if (v65)
          {
            if (v47)
            {
              BYTE10(v194) |= v62 >> 12;
              BOOL v63 = v62 == 0;
              v67 = "true";
              if (v63) {
                v67 = "false";
              }
              objc_msgSend(*((id *)&v190 + 1), "appendFormat:", @"\t_lightingContribution.add_spot(scn_lights[%@], u_goboTexture%d, u_goboTexture%dSampler, %s);\n",
                v60,
                v44,
                v44,
                v67,
                v153,
                v154);
            }
            else if (v52)
            {
              objc_msgSend(*((id *)&v190 + 1), "appendFormat:", @"\t_lightingContribution.add_spot(scn_lights[%@], u_shadowTexture%d, u_shadowKernel, %d);\n",
                v60,
                v44,
                v55,
                v150,
                v153,
                v154);
            }
            else
            {
              objc_msgSend(*((id *)&v190 + 1), "appendFormat:", @"\t_lightingContribution.add_spot(scn_lights[%@]);\n",
                v60,
                v148,
                v149,
                v150,
                v153,
                v154);
            }
          }
          else
          {
            objc_msgSend(*((id *)&v190 + 1), "appendFormat:", @"\t_lightingContribution.add_spot(scn_lights[%@], u_shadowTexture%d, u_shadowKernel, %d, u_goboTexture%d, u_goboTexture%dSampler);\n",
              v60,
              v44,
              v55,
              v44,
              v44,
              v154);
          }
          goto LABEL_170;
        case 4:
          if (v52) {
            objc_msgSend(*((id *)&v190 + 1), "appendFormat:", @"\t_lightingContribution.add_ies(scn_lights[%@], u_iesTexture%d, u_shadowTexture%d, u_shadowKernel, %d);\n",
          }
              v60,
              v44,
              v44,
              v55,
              v153,
              v154);
          else {
            objc_msgSend(*((id *)&v190 + 1), "appendFormat:", @"\t_lightingContribution.add_ies(scn_lights[%@], u_iesTexture%d);\n",
          }
              v60,
              v44,
              v149,
              v150,
              v153,
              v154);
LABEL_170:
          unsigned int LightsMask = v175;
          break;
        case 5:
          unsigned int LightsMask = v175;
          switch((unsigned __int16)v46 >> 13)
          {
            case 0:
              objc_msgSend(*((id *)&v190 + 1), "appendFormat:", @"\t_lightingContribution.add_area_line(scn_lights[%@], u_areaLightBakedDataTexture);\n",
                v60);
              break;
            case 1:
              objc_msgSend(*((id *)&v190 + 1), "appendFormat:", @"\t_lightingContribution.add_area_rectangle(scn_lights[%@], u_areaLightBakedDataTexture);\n",
                v60);
              break;
            case 2:
              objc_msgSend(*((id *)&v190 + 1), "appendFormat:", @"\t_lightingContribution.add_area_ellipse(scn_lights[%@], u_areaLightBakedDataTexture);\n",
                v60);
              break;
            case 3:
              objc_msgSend(*((id *)&v190 + 1), "appendFormat:", @"\t_lightingContribution.add_area_ellipsoid(scn_lights[%@], u_areaLightBakedDataTexture);\n",
                v60);
              break;
            case 4:
              uint64_t v148 = v44;
              objc_msgSend(*((id *)&v190 + 1), "appendFormat:", @"\t_lightingContribution.add_area_polygon(scn_lights[%@], u_areaLightBakedDataTexture, u_areaPolygonPositions%d);\n",
                v60);
              break;
            default:
              goto LABEL_171;
          }
          break;
        default:
          v66 = scn_default_log();
          unsigned int LightsMask = v175;
          if (os_log_type_enabled(v66, OS_LOG_TYPE_FAULT)) {
            -[SCNCommonProfileProgramGeneratorMetal _newProgramWithHashCode:engineContext:introspectionDataPtr:](v214, v215, v66);
          }
          break;
      }
      goto LABEL_171;
    }
    objc_msgSend(*((id *)&v193 + 1), "appendFormat:", v54, v44);
    goto LABEL_112;
  }
LABEL_179:
  [v182 setObject:@"uchar" forKeyedSubscript:@"C3DLightIndexType"];
  [v182 setObject:&stru_26BF72F58 forKeyedSubscript:@"C3D_USE_TEXTURE_FOR_LIGHT_INDICES"];
  v6 = (__C3DProgramHashCode *)v174;
  int v34 = v172;
  int v30 = CommonProfileHashCode & 0xF;
  __int16 v24 = CommonProfileHashCode;
  int v12 = v155;
  __int16 v25 = Conditioners;
  if (C3DProgramHashCodeGetReflectionProbesEnabled(v174))
  {
    if (C3DEngineContextHasFeatures((uint64_t)v168, 256)) {
      [v182 setObject:&stru_26BF72F58 forKeyedSubscript:@"C3D_SUPPORT_CUBE_ARRAY"];
    }
    [v182 setObject:&stru_26BF72F58 forKeyedSubscript:@"C3D_USE_REFLECTION_PROBES"];
  }
  if (*((void *)&v191 + 1))
  {
    v70 = v182;
    Description = @"SCNLightingModelCustom";
  }
  else
  {
    Description = C3DLightingModelGetDescription(v167);
    v70 = v182;
  }
  [v70 setObject:Description forKeyedSubscript:@"LIGHTING_MODEL"];
  if (((C3DProgramHashCodeGetLocalLightingEnabled(v174) & 1) != 0
     || C3DProgramHashCodeGetReflectionProbesEnabled(v174))
    && C3DEngineContextIsClusteredShadingEnabled((uint64_t)v168))
  {
    [v182 setObject:&stru_26BF72F58 forKeyedSubscript:@"USE_CLUSTERED_LIGHTING"];
    [v182 setObject:&unk_26BFC14C8 forKeyedSubscript:@"USE_POSITION"];
  }
LABEL_190:
  if ((void)v183)
  {
    [(id)v183 addObject:@"USE_PBR"];
    [(id)v183 addObject:@"USE_SHADOWONLY"];
    [(id)v183 addObject:@"C3D_USE_TEXTURE_FOR_LIGHT_INDICES"];
    [(id)v183 addObject:@"C3D_SUPPORT_CUBE_ARRAY"];
    [(id)v183 addObject:@"C3D_USE_REFLECTION_PROBES"];
    [(id)v183 addObject:@"LIGHTING_MODEL"];
    [(id)v183 addObject:@"USE_CLUSTERED_LIGHTING"];
  }
  if (v30 == 4 && (v24 & 0x280) != 0) {
    BYTE11(v194) = 1;
  }
  if (C3DProgramHashCodeHasFog((uint64_t)v6))
  {
    [v182 setObject:&stru_26BF72F58 forKeyedSubscript:@"USE_FOG"];
    [v182 setObject:&unk_26BFC14C8 forKeyedSubscript:@"USE_POSITION"];
  }
  if ((v34 & ((v25 & 0x10) >> 4)) == 1)
  {
    [v182 setObject:&stru_26BF72F58 forKeyedSubscript:@"USE_SSAO"];
    [v182 setObject:&unk_26BFC14C8 forKeyedSubscript:@"USE_POSITION"];
  }
  if (C3DProgramHashCodeGetEffectPropertyIsEnabled((uint64_t)v6, 0x13u)
    && C3DProgramHashCodeGetEffectPropertyIsEnabled((uint64_t)v6, 0x14u)
    && C3DProgramHashCodeGetEffectPropertyIsEnabled((uint64_t)v6, 4u))
  {
    [v182 setObject:&stru_26BF72F58 forKeyedSubscript:@"USE_FRESNEL"];
    [v182 setObject:&unk_26BFC14C8 forKeyedSubscript:@"USE_VIEW"];
    [v182 setObject:&unk_26BFC14C8 forKeyedSubscript:@"USE_NORMAL"];
  }
  if ((v34 & ((v24 & 0x40) != 0)) == 1) {
    [v182 setObject:&stru_26BF72F58 forKeyedSubscript:@"AVOID_OVERLIGHTING"];
  }
  if (AmbientLightingEnabled) {
    [v182 setObject:&stru_26BF72F58 forKeyedSubscript:@"USE_AMBIENT_LIGHTING"];
  }
  if ((void)v183)
  {
    [(id)v183 addObject:@"USE_FOG"];
    [(id)v183 addObject:@"USE_SSAO"];
    [(id)v183 addObject:@"USE_FRESNEL"];
    [(id)v183 addObject:@"AVOID_OVERLIGHTING"];
    [(id)v183 addObject:@"USE_AMBIENT_LIGHTING"];
  }
  if (v34)
  {
    uint64_t ProbesLightingOrder = C3DProgramHashCodeGetProbesLightingOrder((uint64_t)v6);
    if (ProbesLightingOrder)
    {
      uint64_t v73 = [NSNumber numberWithUnsignedChar:ProbesLightingOrder];
      [v182 setObject:v73 forKeyedSubscript:@"USE_PROBES_LIGHTING"];
    }
    [v182 setObject:&stru_26BF72F58 forKeyedSubscript:@"USE_LIGHTING"];
    if (BYTE11(v194))
    {
      [v182 setObject:&stru_26BF72F58 forKeyedSubscript:@"USE_PER_PIXEL_LIGHTING"];
      [v182 setObject:&unk_26BFC14C8 forKeyedSubscript:@"USE_NORMAL"];
      if (((BYTE8(v194) == 0) & ~v164) == 0) {
        [v182 setObject:&unk_26BFC14C8 forKeyedSubscript:@"USE_POSITION"];
      }
      if (BYTE10(v194))
      {
        v74 = v182;
        v75 = &unk_26BFC14C8;
        v76 = @"USE_MODULATE";
LABEL_223:
        [v74 setObject:v75 forKeyedSubscript:v76];
      }
    }
    else
    {
      [v182 setObject:&stru_26BF72F58 forKeyedSubscript:@"USE_PER_VERTEX_LIGHTING"];
      if (![v182 objectForKeyedSubscript:@"USE_NORMAL"]) {
        [v182 setObject:&unk_26BFC14B0 forKeyedSubscript:@"USE_NORMAL"];
      }
      if (![v182 objectForKeyedSubscript:@"USE_VIEW"]) {
        [v182 setObject:&unk_26BFC14B0 forKeyedSubscript:@"USE_VIEW"];
      }
      if (![v182 objectForKeyedSubscript:@"USE_POSITION"])
      {
        v74 = v182;
        v75 = &unk_26BFC14B0;
        v76 = @"USE_POSITION";
        goto LABEL_223;
      }
    }
  }
  if ((void)v183)
  {
    [(id)v183 addObject:@"USE_PROBES_LIGHTING"];
    [(id)v183 addObject:@"USE_LIGHTING"];
    [(id)v183 addObject:@"USE_PER_PIXEL_LIGHTING"];
    [(id)v183 addObject:@"USE_PER_VERTEX_LIGHTING"];
  }
  if (C3DProgramHashCodeHasNormals((uint64_t)v6)) {
    [v182 setObject:&stru_26BF72F58 forKeyedSubscript:@"HAS_NORMAL"];
  }
  if ((NodeHashCode & 2) != 0)
  {
    [v182 setObject:&stru_26BF72F58 forKeyedSubscript:@"HAS_VERTEX_COLOR"];
    [v182 setObject:&stru_26BF72F58 forKeyedSubscript:@"USE_VERTEX_COLOR"];
  }
  if (C3DProgramHashCodeUseDynamicBatching((uint64_t)v6)) {
    [v182 setObject:&stru_26BF72F58 forKeyedSubscript:@"USE_INSTANCING"];
  }
  if (C3DProgramHashCodeUsePointRendering((uint64_t)v6))
  {
    [v182 setObject:&unk_26BFC14C8 forKeyedSubscript:@"USE_POSITION"];
    [v182 setObject:&stru_26BF72F58 forKeyedSubscript:@"USE_POINT_RENDERING"];
    if (v25) {
      goto LABEL_234;
    }
  }
  else if (v25)
  {
LABEL_234:
    [v182 setObject:&stru_26BF72F58 forKeyedSubscript:@"DISABLE_LINEAR_RENDERING"];
    if ((v25 & 0x40) != 0) {
      goto LABEL_235;
    }
LABEL_239:
    if ((v25 & 8) == 0) {
      goto LABEL_241;
    }
    goto LABEL_240;
  }
  if ((v25 & 0x40) == 0) {
    goto LABEL_239;
  }
LABEL_235:
  [v182 setObject:&stru_26BF72F58 forKeyedSubscript:@"DISABLE_SPECULAR"];
  if ((v25 & 8) != 0) {
LABEL_240:
  }
    [v182 setObject:&stru_26BF72F58 forKeyedSubscript:@"USE_MOTIONBLUR"];
LABEL_241:
  if ((void)v183)
  {
    [(id)v183 addObject:@"HAS_NORMAL"];
    [(id)v183 addObject:@"HAS_VERTEX_COLOR"];
    [(id)v183 addObject:@"USE_VERTEX_COLOR"];
    [(id)v183 addObject:@"USE_INSTANCING"];
    [(id)v183 addObject:@"USE_POINT_RENDERING"];
    [(id)v183 addObject:@"DISABLE_LINEAR_RENDERING"];
    [(id)v183 addObject:@"DISABLE_SPECULAR"];
    [(id)v183 addObject:@"USE_MOTIONBLUR"];
  }
  if ((v25 & 0x80) != 0)
  {
    [v182 setObject:&stru_26BF72F58 forKeyedSubscript:@"USE_COLOR1_OUTPUT"];
    if ((v25 & 2) == 0)
    {
LABEL_245:
      if ((v25 & 4) == 0) {
        goto LABEL_246;
      }
      goto LABEL_255;
    }
  }
  else if ((v25 & 2) == 0)
  {
    goto LABEL_245;
  }
  [v182 setObject:&unk_26BFC14C8 forKeyedSubscript:@"USE_NORMAL"];
  [v182 setObject:&stru_26BF72F58 forKeyedSubscript:@"USE_NORMALS_OUTPUT"];
  if ((v25 & 4) == 0)
  {
LABEL_246:
    if ((v25 & 0x100) == 0) {
      goto LABEL_247;
    }
    goto LABEL_256;
  }
LABEL_255:
  [v182 setObject:&stru_26BF72F58 forKeyedSubscript:@"USE_REFLECTANCE_ROUGHNESS_OUTPUT"];
  if ((v25 & 0x100) == 0)
  {
LABEL_247:
    if ((v25 & 0x20) == 0) {
      goto LABEL_249;
    }
    goto LABEL_248;
  }
LABEL_256:
  [v182 setObject:&stru_26BF72F58 forKeyedSubscript:@"USE_RADIANCE_OUTPUT"];
  if ((v25 & 0x20) != 0)
  {
LABEL_248:
    [v182 setObject:&stru_26BF72F58 forKeyedSubscript:@"USE_OUTLINE"];
    [v182 setObject:&stru_26BF72F58 forKeyedSubscript:@"USE_MODELTRANSFORM"];
  }
LABEL_249:
  if ((void)v183)
  {
    [(id)v183 addObject:@"USE_COLOR1_OUTPUT"];
    [(id)v183 addObject:@"USE_NORMALS_OUTPUT"];
    [(id)v183 addObject:@"USE_REFLECTANCE_ROUGHNESS_OUTPUT"];
    [(id)v183 addObject:@"USE_RADIANCE_OUTPUT"];
    [(id)v183 addObject:@"USE_OUTLINE"];
  }
  if (C3DProgramHashCodeGetEffectPropertyHasTexture((uint64_t)v6, 8u))
  {
    __AddProperty((uint64_t)&v181, 8u, 1, 1);
    [v182 setObject:&stru_26BF72F58 forKeyedSubscript:@"USE_AMBIENT_AS_AMBIENTOCCLUSION"];
  }
  else
  {
    if (v24 >= 0) {
      int v77 = AmbientLightingEnabled;
    }
    else {
      int v77 = 0;
    }
    __AddProperty((uint64_t)&v181, 1u, 1, v77);
  }
  __AddProperty((uint64_t)&v181, 2u, 2, 1);
  __AddProperty((uint64_t)&v181, 3u, 3, v164 | v159);
  __AddProperty((uint64_t)&v181, 9u, 9, 1);
  __AddProperty((uint64_t)&v181, 0, 0, 1);
  __AddProperty((uint64_t)&v181, 6u, 6, 1);
  __AddProperty((uint64_t)&v181, 7u, 7, v160);
  if (BYTE8(v183))
  {
    [v182 setObject:&unk_26BFC14C8 forKeyedSubscript:@"USE_TANGENT"];
    [v182 setObject:&unk_26BFC14C8 forKeyedSubscript:@"USE_BITANGENT"];
  }
  __AddProperty((uint64_t)&v181, 0xAu, 10, v30 == 5);
  __AddProperty((uint64_t)&v181, 0xBu, 11, v30 == 5);
  if (v30 == 5) {
    int v78 = C3DProgramHashCodeGetEffectPropertyIsEnabled((uint64_t)v6, 0xCu);
  }
  else {
    int v78 = 0;
  }
  __AddProperty((uint64_t)&v181, 0xCu, 12, v78);
  __AddProperty((uint64_t)&v181, 0xDu, 13, v78);
  __AddProperty((uint64_t)&v181, 0xEu, 14, v78);
  if (BYTE8(v183))
  {
    [v182 setObject:&unk_26BFC14C8 forKeyedSubscript:@"USE_TANGENT"];
    [v182 setObject:&unk_26BFC14C8 forKeyedSubscript:@"USE_BITANGENT"];
  }
  __AddProperty((uint64_t)&v181, 4u, 4, 1);
  if (BYTE8(v183))
  {
    [v182 setObject:&unk_26BFC14C8 forKeyedSubscript:@"USE_VIEW"];
    [v182 setObject:&unk_26BFC14C8 forKeyedSubscript:@"USE_NORMAL"];
    [v182 setObject:&unk_26BFC14C8 forKeyedSubscript:@"USE_POSITION"];
  }
  int v79 = v12 & (v161 ^ 1);
  int v80 = (CommonProfileHashCode >> 11) & 0xF;
  if (C3DProgramHashCodeGetEffectPropertyIsEnabled((uint64_t)v6, 2u))
  {
    unsigned int v81 = C3DProgramHashCodeGetEffectPropertyHashCode((uint64_t)v6, 2u);
    if (v81)
    {
      unint64_t v83 = ((unint64_t)v81 >> 5) & 1;
      int v82 = v83;
    }
    else
    {
      int v82 = 0;
      LOBYTE(v83) = (v81 & 8) == 0;
    }
  }
  else
  {
    LOBYTE(v83) = 0;
    int v82 = 0;
  }
  if (v80 == 1) {
    int v84 = v163;
  }
  else {
    int v84 = 0;
  }
  if ((v84 | v79)) {
    int v85 = v84 ^ 1;
  }
  else {
    int v85 = v82 | HasConstantAlpha ^ 1;
  }
  __AddProperty((uint64_t)&v181, 5u, 5, v85);
  if (v80 == 1 && [v182 objectForKeyedSubscript:@"USE_TRANSPARENT"]) {
    [v182 setObject:&stru_26BF72F58 forKeyedSubscript:@"USE_TRANSPARENCY_RGBZERO"];
  }
  if (v30 == 5)
  {
    int v86 = C3DPBROpacityIsEnabled();
    if (v80 != 1 && v86) {
      [v182 setObject:&stru_26BF72F58 forKeyedSubscript:@"USE_PBR_TRANSPARENCY"];
    }
    if (C3DWasLinkedBeforeMajorOSYear2023()) {
      [v182 setObject:&stru_26BF72F58 forKeyedSubscript:@"USE_PBR_LAMBERTIAN_REFLECTION"];
    }
  }
  if ((v24 & 0x8000) == 0)
  {
    if ((v24 & 0x20) != 0) {
      goto LABEL_296;
    }
LABEL_295:
    if (v80 != 3) {
      goto LABEL_297;
    }
    goto LABEL_296;
  }
  [v182 setObject:&stru_26BF72F58 forKeyedSubscript:@"LOCK_AMBIENT_WITH_DIFFUSE"];
  if ((v24 & 0x20) == 0) {
    goto LABEL_295;
  }
LABEL_296:
  [v182 setObject:&stru_26BF72F58 forKeyedSubscript:@"USE_DOUBLE_SIDED"];
LABEL_297:
  if ((v163 & 1) == 0)
  {
    if (((v79 | v82) & 1) != 0 || (v156 & 2) != 0) {
      [v182 setObject:&stru_26BF72F58 forKeyedSubscript:@"USE_TRANSPARENCY"];
    }
    if ((HasConstantAlpha & 1) == 0) {
      [v182 setObject:&stru_26BF72F58 forKeyedSubscript:@"USE_NODE_OPACITY"];
    }
  }
  if ((EffectPropertyHashCode & 0x400) != 0) {
    char v87 = 0;
  }
  else {
    char v87 = v83;
  }
  if ((v87 & 1) == 0) {
    [v182 setObject:&stru_26BF72F58 forKeyedSubscript:@"DIFFUSE_PREMULTIPLIED"];
  }
  if ((void)v183)
  {
    [(id)v183 addObject:@"USE_TRANSPARENCY_RGBZERO"];
    [(id)v183 addObject:@"LOCK_AMBIENT_WITH_DIFFUSE"];
    [(id)v183 addObject:@"USE_DOUBLE_SIDED"];
    [(id)v183 addObject:@"USE_TRANSPARENCY"];
    [(id)v183 addObject:@"USE_PBR_TRANSPARENCY"];
    [(id)v183 addObject:@"USE_PBR_LAMBERTIAN_REFLECTION"];
    [(id)v183 addObject:@"USE_NODE_OPACITY"];
    [(id)v183 addObject:@"DIFFUSE_PREMULTIPLIED"];
  }
  uint64_t CustomSlotCount = C3DProgramHashCodeGetCustomSlotCount((uint64_t)v6);
  if (CustomSlotCount >= 1)
  {
    uint64_t v89 = CustomSlotCount;
    for (uint64_t i = 0; i != v89; ++i)
    {
      CustomSlotSortedName = C3DProgramHashCodeGetCustomSlotSortedName((uint64_t)v6, i);
      uint64_t CustomSlotUVSet = C3DProgramHashCodeGetCustomSlotUVSet((uint64_t)v6, i);
      if (CustomSlotUVSet != -1)
      {
        uint64_t v93 = CustomSlotUVSet;
        [(id)v187 appendFormat:@"    float2 %@Texcoord;\n", CustomSlotSortedName];
        objc_msgSend(*((id *)&v189 + 1), "appendFormat:", @"    _surface.%@Texcoord = in.texcoord%d;\n",
          CustomSlotSortedName,
          v93);
      }
    }
  }
  if ((v79 | v82) == 1) {
    [v182 setObject:&unk_26BFC14C8 forKeyedSubscript:@"USE_DISCARD"];
  }
  unint64_t v94 = 0x263F08000;
  if ((void)v183) {
    [(id)v183 addObject:@"USE_DISCARD"];
  }
  uint64_t UVSetsCount = C3DProgramHashCodeGetUVSetsCount((uint64_t)v181);
  if (UVSetsCount)
  {
    if (UVSetsCount < 1)
    {
      uint64_t v97 = 0;
    }
    else
    {
      uint64_t v96 = 0;
      uint64_t v97 = 0;
      if (UVSetsCount >= 8) {
        uint64_t v98 = 8;
      }
      else {
        uint64_t v98 = UVSetsCount;
      }
      do
      {
        __int16 UVSetInfo = C3DProgramHashCodeGetUVSetInfo((uint64_t)v181, v96);
        [*((id *)&v187 + 1) appendString:g_varyingTexCoordDecl[v96]];
        if (HIBYTE(UVSetInfo) == 255)
        {
          int v100 = UVSetInfo;
          objc_msgSend(*((id *)&v188 + 1), "appendFormat:", @"out.texcoord%d = _geometry.texcoords[%d].xy;\n",
            v96,
            UVSetInfo,
            v149);
        }
        else
        {
          uint64_t v101 = v190;
          LODWORD(v190) = v190 + 1;
          int v100 = UVSetInfo;
          objc_msgSend(*((id *)&v188 + 1), "appendFormat:", @"out.texcoord%d = (scn_commonprofile.textureTransforms[%d] * float4(_geometry.texcoords[%d], 0., 1.)).xy;\n",
            v96,
            v101,
            UVSetInfo);
        }
        [v182 setObject:&stru_26BF72F58 forKeyedSubscript:g_NeedTexCoordDefines[v100]];
        if (v97 <= (v100 + 1)) {
          uint64_t v97 = (v100 + 1);
        }
        ++v96;
      }
      while (v98 != v96);
    }
    [v182 setObject:&stru_26BF72F58 forKeyedSubscript:@"USE_TEXCOORD"];
    v6 = (__C3DProgramHashCode *)v174;
    unint64_t v94 = 0x263F08000uLL;
  }
  else
  {
    uint64_t v97 = 0;
  }
  if (v190)
  {
    uint64_t v102 = objc_msgSend(*(id *)(v94 + 2584), "numberWithUnsignedInt:");
    [v182 setObject:v102 forKeyedSubscript:@"TEXTURE_TRANSFORM_COUNT"];
  }
  uint64_t v103 = [*(id *)(v94 + 2584) numberWithLong:v97];
  [v182 setObject:v103 forKeyedSubscript:@"kSCNTexcoordCount"];
  if ((void)v183)
  {
    [(id)v183 addObject:@"USE_TEXCOORD"];
    [(id)v183 addObject:@"TEXTURE_TRANSFORM_COUNT"];
    for (uint64_t j = 0; j != 8; ++j)
      [(id)v183 addObject:g_NeedTexCoordDefines[j]];
  }
  int v105 = C3DProgramHashCodeGetEffectPropertyHasTexture((uint64_t)v6, 0xFu);
  __AddProperty((uint64_t)&v181, 0xFu, 15, v105);
  if (v105)
  {
    [v182 setObject:&unk_26BFC14C8 forKeyedSubscript:@"USE_NORMAL"];
    [v182 setObject:&unk_26BFC14C8 forKeyedSubscript:@"USE_TANGENT"];
    [v182 setObject:&unk_26BFC14C8 forKeyedSubscript:@"USE_BITANGENT"];
  }
  if (objc_msgSend((id)objc_msgSend(v182, "objectForKeyedSubscript:", @"USE_VIEW"), "intValue") == 2) {
    [v182 setObject:&unk_26BFC14C8 forKeyedSubscript:@"USE_POSITION"];
  }
  if ([v182 objectForKeyedSubscript:@"USE_NORMAL"]
    && ![v182 objectForKeyedSubscript:@"HAS_NORMAL"])
  {
    [v182 setObject:&unk_26BFC14C8 forKeyedSubscript:@"USE_POSITION"];
  }
  v106 = @"USE_MODELVIEWTRANSFORM";
  if (![v182 objectForKeyedSubscript:@"USE_POSITION"]
    && ![v182 objectForKeyedSubscript:@"USE_INSTANCING"])
  {
    v106 = @"USE_MODELVIEWPROJECTIONTRANSFORM";
  }
  [v182 setObject:&stru_26BF72F58 forKeyedSubscript:v106];
  if ([v182 objectForKeyedSubscript:@"USE_NORMAL"]
    || [v182 objectForKeyedSubscript:@"USE_TANGENT"]
    || [v182 objectForKeyedSubscript:@"USE_BITANGENT"])
  {
    [v182 setObject:&stru_26BF72F58 forKeyedSubscript:@"USE_MODELVIEWTRANSFORM"];
  }
  if ((NodeHashCode & 0x8000000) != 0)
  {
    [(id)v194 appendString:@"float2 bezierCurveUV [[ sample_perspective ]];\n"];
    [*((id *)&v193 + 1) appendString:@", device void const *scn_bezier_curve_data\n"];
    [*((id *)&v193 + 1) appendString:@", device packed_float3 const *scn_bezier_curve_controlPoints\n"];
    [v182 setObject:&stru_26BF72F58 forKeyedSubscript:@"NEED_IN_TEXCOORD0"];
    [v182 setObject:&stru_26BF72F58 forKeyedSubscript:@"IS_BEZIER_CURVE"];
    int v107 = v169;
    if (v169 <= 0x20003) {
      int v107 = 131075;
    }
    LODWORD(v169) = v107;
    int v179 = 1;
  }
  else
  {
    int v179 = 0;
  }
  if ((void)v183) {
    [(id)v183 addObject:@"IS_BEZIER_CURVE"];
  }
  if ([(id)v184 length]) {
    [v182 setObject:&stru_26BF72F58 forKeyedSubscript:@"USE_SHADER_MODIFIERS"];
  }
  if ([(id)v187 length]) {
    [v182 setObject:&stru_26BF72F58 forKeyedSubscript:@"USE_SURFACE_EXTRA_DECL"];
  }
  if ([(id)v194 length]) {
    [v182 setObject:&stru_26BF72F58 forKeyedSubscript:@"USE_EXTRA_VARYINGS"];
  }
  if ((void)v183)
  {
    [(id)v183 addObject:@"USE_SHADER_MODIFIERS"];
    [(id)v183 addObject:@"USE_SURFACE_EXTRA_DECL"];
    [(id)v183 addObject:@"USE_EXTRA_VARYINGS"];
  }
  v108 = C3DGetTextResourceWithNameAllowingHotReload(@"scn_metal");
  v109 = C3DGetTextResourceWithNameAllowingHotReload(@"scn_util.h");
  if (v167 == 5 || self->_useFunctionConstants) {
    v110 = (__CFString *)C3DGetTextResourceWithNameAllowingHotReload(@"C3D-PBR.metal");
  }
  else {
    v110 = &stru_26BF72F58;
  }
  __configureOpenSubdivSupport((uint64_t)&v181, v170, (uint64_t)v6);
  if ([v182 objectForKeyedSubscript:@"HAS_NORMAL"]
    || [v182 objectForKeyedSubscript:@"USE_OPENSUBDIV"])
  {
    [v182 setObject:@"1" forKeyedSubscript:@"HAS_OR_GENERATES_NORMAL"];
  }
  v112 = &stru_26BF72F58;
  if (v170)
  {
    [v182 setObject:&stru_26BF72F58 forKeyedSubscript:@"USE_TESSELLATION"];
    v112 = (__CFString *)C3DGetTextResourceWithNameAllowingHotReload(@"scn_tessellation.h");
    int v113 = (NodeHashCode >> 3) & 3;
    if (v113 == 1)
    {
      v114 = @"TESSELLATION_SMOOTHING_MODE_PN_TRIANGLE";
    }
    else
    {
      if (v113 != 2) {
        goto LABEL_381;
      }
      v114 = @"TESSELLATION_SMOOTHING_MODE_PHONG";
    }
    [v182 setObject:&stru_26BF72F58 forKeyedSubscript:v114];
  }
LABEL_381:
  if ((void)v183)
  {
    C3DSubdivisionOsdGPUGetAllPossibleMacros((void *)v183, v111);
    [(id)v183 addObject:@"HAS_OR_GENERATES_NORMAL"];
    [(id)v183 addObject:@"USE_TESSELLATION"];
  }
  v213[0] = v187;
  v213[1] = v192;
  if (*((void *)&v186 + 1)) {
    v115 = (__CFString *)*((void *)&v186 + 1);
  }
  else {
    v115 = &stru_26BF72F58;
  }
  v213[2] = v115;
  id v116 = -[NSString scn_stringByReplacingCharactersInRanges:withStrings:](self->_originalLightingSourceCode, "scn_stringByReplacingCharactersInRanges:withStrings:", self->_lightingInjectionPointRanges, [MEMORY[0x263EFF8C0] arrayWithObjects:v213 count:3]);
  v199[0] = v108;
  v199[1] = v109;
  v199[2] = v110;
  v199[3] = v112;
  v199[4] = *((void *)&v187 + 1);
  v199[5] = v194;
  v199[6] = v184;
  v199[7] = v116;
  long long v200 = v195;
  uint64_t v201 = v196;
  uint64_t v202 = v193;
  if ((void)v185) {
    v117 = (__CFString *)v185;
  }
  else {
    v117 = &stru_26BF72F58;
  }
  uint64_t v203 = v189;
  v204 = v117;
  if (BYTE11(v194)) {
    int v118 = v172 ^ 1;
  }
  else {
    int v118 = 1;
  }
  v119 = (__CFString *)*((void *)&v190 + 1);
  if ((v172 & (BYTE11(v194) == 0)) != 0) {
    v120 = (__CFString *)*((void *)&v190 + 1);
  }
  else {
    v120 = &stru_26BF72F58;
  }
  v205 = v120;
  uint64_t v206 = *((void *)&v188 + 1);
  uint64_t v207 = *((void *)&v193 + 1);
  uint64_t v208 = *((void *)&v189 + 1);
  v121 = (__CFString *)*((void *)&v185 + 1);
  if (!*((void *)&v185 + 1)) {
    v121 = &stru_26BF72F58;
  }
  v209 = v121;
  uint64_t v210 = *((void *)&v192 + 1);
  if (v118) {
    v119 = &stru_26BF72F58;
  }
  if ((void)v186) {
    v122 = (__CFString *)v186;
  }
  else {
    v122 = &stru_26BF72F58;
  }
  v211 = v119;
  v212 = v122;
  v123 = self;
  v124 = (void *)[MEMORY[0x263EFF8C0] arrayWithObjects:v199 count:22];
  id v125 = [(NSString *)self->_originalSourceCode scn_stringByReplacingCharactersInRanges:self->_injectionPointRanges withStrings:v124];
  id v126 = [(SCNCommonProfileProgramGeneratorMetal *)self splitInputOutputStructsIfNeededForSourceCode:v125 generatedFromReplacementStrings:v124 perPixelLighting:BYTE11(v194) clipDistanceCount:v165];
  if (C3DShouldCollectGeneratedShaders())
  {
    id v176 = v126;
    v127 = (void *)[v124 mutableCopy];
    NSUInteger v128 = [(NSArray *)self->_injectionPointRanges count];
    if (v128)
    {
      NSUInteger v129 = v128;
      uint64_t v130 = 0;
      while (1)
      {
        uint64_t v131 = objc_msgSend(-[NSArray objectAtIndexedSubscript:](v123->_injectionPointRanges, "objectAtIndexedSubscript:", v130), "rangeValue");
        v133 = -[NSString substringWithRange:](v123->_originalSourceCode, "substringWithRange:", v131, v132);
        if (![(__CFString *)v133 hasPrefix:@"#import"]) {
          break;
        }
        if (([(__CFString *)v133 containsString:@"C3D-Lighting.metal"] & 1) == 0)
        {
          uint64_t v134 = [v124 objectAtIndexedSubscript:v130];
          v135 = NSString;
          v151 = v133;
          goto LABEL_411;
        }
LABEL_416:
        if (v129 == ++v130) {
          goto LABEL_417;
        }
      }
      if ([(id)v196 length]
        && [(__CFString *)v133 containsString:@"__OpenSubdivDeclShared__"])
      {
        uint64_t v134 = [v124 objectAtIndexedSubscript:v130];
        v135 = NSString;
        v151 = @"#generate \"__OpenSubdivDeclShared__.metal\"";
LABEL_411:
        uint64_t v136 = [v135 stringWithFormat:@"%@%@\n%@%@\n%@", @"#if 1 // SHADER_COLLECTION_PREFERS_MONOLITHIC_FILES\n", v134, @"#else // SHADER_COLLECTION_PREFERS_MONOLITHIC_FILES\n", v151, @"#endif // SHADER_COLLECTION_PREFERS_MONOLITHIC_FILES\n"];
      }
      else
      {
        if (![*((id *)&v195 + 1) length]
          || ![(__CFString *)v133 containsString:@"__OpenSubdivDeclPerPatchType__"])
        {
          goto LABEL_416;
        }
        uint64_t v137 = [v124 objectAtIndexedSubscript:v130];
        v138 = NSString;
        uint64_t v152 = objc_msgSend(NSString, "stringWithFormat:", @"#generate \"__OpenSubdivDeclShared__patchType%d.metal\"", C3DProgramHashCodeOpenSubdivPatchType(v174));
        v139 = v138;
        v123 = self;
        uint64_t v136 = [v139 stringWithFormat:@"%@%@\n%@%@\n%@", @"#if 1 // SHADER_COLLECTION_PREFERS_MONOLITHIC_FILES\n", v137, @"#else // SHADER_COLLECTION_PREFERS_MONOLITHIC_FILES\n", v152, @"#endif // SHADER_COLLECTION_PREFERS_MONOLITHIC_FILES\n"];
      }
      [v127 setObject:v136 atIndexedSubscript:v130];
      goto LABEL_416;
    }
LABEL_417:
    uint64_t v140 = [(NSString *)v123->_originalSourceCode scn_stringByReplacingCharactersInRanges:v123->_injectionPointRanges withStrings:v127];
    id v141 = [(SCNCommonProfileProgramGeneratorMetal *)v123 splitInputOutputStructsIfNeededForSourceCode:v140 generatedFromReplacementStrings:v127 perPixelLighting:BYTE11(v194) clipDistanceCount:v165];

    id v126 = v176;
  }
  else
  {
    id v141 = 0;
  }
  if ([(id)v193 length]) {
    [v182 setObject:&stru_26BF72F58 forKeyedSubscript:@"USE_VERTEX_EXTRA_ARGUMENTS"];
  }
  if ([*((id *)&v193 + 1) length]) {
    [v182 setObject:&stru_26BF72F58 forKeyedSubscript:@"USE_FRAGMENT_EXTRA_ARGUMENTS"];
  }
  [v182 setObject:&unk_26BFC14B0 forKeyedSubscript:@"METAL"];
  if ((C3DEngineContextGetCoordinatesSystemOptions((uint64_t)v168) & 8) != 0) {
    [v182 setObject:&unk_26BFC14B0 forKeyedSubscript:@"USE_REVERSE_Z"];
  }
  CFDictionaryRef RenderingOptionForKey = C3DEngineContextGetRenderingOptionForKey((uint64_t)v168, @"debugRendering");
  if (RenderingOptionForKey)
  {
    int valuePtr = 0;
    CFNumberGetValue(RenderingOptionForKey, kCFNumberSInt32Type, &valuePtr);
    if (valuePtr)
    {
      uint64_t v143 = objc_msgSend(NSNumber, "numberWithInt:");
      [v182 setObject:v143 forKeyedSubscript:@"DEBUG_PIXEL"];
    }
  }
  if ((void)v183)
  {
    [(id)v183 addObject:@"USE_VERTEX_EXTRA_ARGUMENTS"];
    [(id)v183 addObject:@"USE_FRAGMENT_EXTRA_ARGUMENTS"];
    [(id)v183 addObject:@"USE_ARGUMENT_BUFFERS"];
    [(id)v183 addObject:@"USE_REVERSE_Z"];
    [(id)v183 addObject:@"DEBUG_PIXEL"];
  }
  v144 = (void *)[MEMORY[0x263F089D8] stringWithCapacity:0];
  [v144 appendString:@"////////////////////////////////////////////////\n"];
  objc_msgSend(v144, "appendFormat:", @"// CommonProfile Shader v%d\n", 2);
  v145 = (const void *)[v144 stringByAppendingString:v126];
  if (C3DShouldCollectGeneratedShaders()) {
    id v141 = (id)[v144 stringByAppendingString:v141];
  }
  v146 = (__C3DFXProgram *)C3DFXMetalProgramCreateFromSource(@"commonprofile_vert", @"commonprofile_frag", v179, v145, v141, v182, (const void *)v183, v169, 0);
  HashCode = (const void *)C3DProgramHashCodeGetHashCode(v174);
  C3DFXMetalProgramUpdateHashWithCommonProfileHashCode((uint64_t)v146, HashCode);
  return v146;
}

- (id)splitInputOutputStructsIfNeededForSourceCode:(id)a3 generatedFromReplacementStrings:(id)a4 perPixelLighting:(BOOL)a5 clipDistanceCount:(unint64_t)a6
{
  v49[4] = *MEMORY[0x263EF8340];
  if (a6)
  {
    BOOL v8 = a5;
    NSUInteger v9 = self->_commonProfileIORange.length + self->_commonProfileIORange.location;
    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x3010000000;
    uint64_t v44 = &unk_20B6AE426;
    _NSRange commonProfileIORange = self->_commonProfileIORange;
    injectionPointRanges = self->_injectionPointRanges;
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __153__SCNCommonProfileProgramGeneratorMetal_splitInputOutputStructsIfNeededForSourceCode_generatedFromReplacementStrings_perPixelLighting_clipDistanceCount___block_invoke;
    v40[3] = &unk_26400A020;
    v40[4] = self;
    v40[5] = a4;
    v40[6] = &v41;
    v40[7] = v9;
    [(NSArray *)injectionPointRanges enumerateObjectsUsingBlock:v40];
    uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"    float clipDistance [[clip_distance]] [%d];\n} commonprofile_io_vert;\n\n",
            a6);
    int v12 = objc_msgSend(a3, "substringWithRange:", v42[4], v42[5]);
    uint64_t v13 = objc_msgSend(v12, "stringByReplacingCharactersInRange:withString:", objc_msgSend(v12, "length") - 19, 19, v11);
    uint64_t v14 = v42[5] + v42[4];
    uint64_t v15 = objc_msgSend(a3, "rangeOfString:options:range:", @"vertex commonprofile_io", 0, v14, objc_msgSend(a3, "length") - v14);
    uint64_t v17 = v16;
    uint64_t v19 = objc_msgSend(a3, "rangeOfString:options:range:", @"commonprofile_io out;",
            0,
            v15 + v17,
            [a3 length] - (v15 + v17));
    uint64_t v20 = v18;
    if (v8)
    {
      uint64_t v21 = v18;
      uint64_t v22 = objc_msgSend(a3, "rangeOfString:options:range:", @"commonprofile_io out;",
              0,
              v14,
              [a3 length] - v14);
      uint64_t v24 = v23;
      v49[0] = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v42[4], 0);
      v49[1] = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v22, v24);
      v49[2] = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v15, v17);
      v49[3] = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v19, v21);
      uint64_t v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v49 count:4];
      v48[0] = v13;
      v48[1] = @"commonprofile_io_vert out;";
      v48[2] = @"vertex commonprofile_io_vert";
      v48[3] = @"commonprofile_io_vert out;";
      v26 = objc_msgSend(a3, "scn_stringByReplacingCharactersInRanges:withStrings:", v25, objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v48, 4));
    }
    else
    {
      uint64_t v27 = objc_msgSend(a3, "rangeOfString:options:range:", @"commonprofile_io out;",
              0,
              v14,
              [a3 length] - v14);
      uint64_t v29 = v28;
      uint64_t v38 = v19;
      uint64_t v39 = v20;
      uint64_t v30 = objc_msgSend(a3, "rangeOfString:options:range:", @"commonprofile_io in;",
              0,
              v14,
              [a3 length] - v14);
      uint64_t v32 = v31;
      uint64_t v33 = objc_msgSend(a3, "rangeOfString:options:range:", @"commonprofile_io io", 0, v14, objc_msgSend(a3, "length") - v14);
      uint64_t v35 = v34;
      v47[0] = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v42[4], 0);
      v47[1] = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v27, v29);
      v47[2] = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v30, v32);
      v47[3] = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v33, v35);
      v47[4] = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v15, v17);
      v47[5] = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v38, v39);
      uint64_t v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:v47 count:6];
      v46[0] = v13;
      v46[1] = @"commonprofile_io_vert out;";
      v46[2] = @"commonprofile_io_vert in;";
      v46[3] = @"commonprofile_io_vert io";
      v46[4] = @"vertex commonprofile_io_vert";
      v46[5] = @"commonprofile_io_vert out;";
      v26 = objc_msgSend(a3, "scn_stringByReplacingCharactersInRanges:withStrings:", v36, objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v46, 6));
    }
    a3 = v26;
    _Block_object_dispose(&v41, 8);
  }
  return a3;
}

- (int)profile
{
  return 0;
}

- (void)emptyShaderCache
{
  [(SCNCommonProfileProgramGeneratorMetal *)self _loadSourceCode];
  v3.receiver = self;
  v3.super_class = (Class)SCNCommonProfileProgramGeneratorMetal;
  [(SCNCommonProfileProgramGenerator *)&v3 emptyShaderCache];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SCNCommonProfileProgramGeneratorMetal;
  [(SCNCommonProfileProgramGenerator *)&v3 dealloc];
}

- (__C3DFXProgram)_newProgramWithHashCodeWithFunctionConstants:(__C3DProgramHashCode *)a3 engineContext:(__C3DEngineContext *)a4 introspectionDataPtr:(void *)a5
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  uint64_t v44 = 0;
  long long v43 = 0u;
  long long v42 = 0u;
  long long v41 = 0u;
  long long v40 = 0u;
  long long v39 = 0u;
  long long v38 = 0u;
  long long v37 = 0u;
  long long v36 = 0u;
  long long v35 = 0u;
  long long v34 = 0u;
  int64x2_t v33 = 0u;
  long long v32 = 0u;
  long long v31 = 0u;
  long long v30 = 0u;
  uint64_t v29 = a3;
  uint64_t ShaderModifiers = C3DProgramHashCodeGetShaderModifiers((uint64_t)a3, 0);
  BOOL v8 = 0;
  if (ShaderModifiers | C3DProgramHashCodeGetShaderModifiers((uint64_t)a3, 1))
  {
    *(void *)&long long v30 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:0];
    *((void *)&v31 + 1) = [MEMORY[0x263F089D8] stringWithCapacity:0];
    *(void *)&long long v32 = [MEMORY[0x263F089D8] stringWithCapacity:0];
    *((void *)&v40 + 1) = [MEMORY[0x263F089D8] stringWithCapacity:0];
    *(void *)&long long v41 = [MEMORY[0x263F089D8] stringWithCapacity:0];
    *((void *)&v41 + 1) = [MEMORY[0x263F089D8] stringWithCapacity:0];
    __InjectAllModifiersIfNeeded((uint64_t)&v29);
    NSUInteger v9 = C3DGetTextResourceWithNameAllowingHotReload(@"scn_metal");
    v10 = C3DGetTextResourceWithNameAllowingHotReload(@"scn_util.h");
    uint64_t v11 = C3DGetTextResourceWithNameAllowingHotReload(@"scn_standard_lighting.h");
    int v12 = C3DGetTextResourceWithNameAllowingHotReload(@"scn_standard_constants.h");
    uint64_t v13 = C3DGetTextResourceWithNameAllowingHotReload(@"C3D-PBR.metal");
    uint64_t v14 = C3DGetTextResourceWithNameAllowingHotReload(@"C3D-Lighting.metal");
    v45[0] = v9;
    v45[1] = v10;
    v45[2] = v11;
    v45[3] = v12;
    v45[4] = v13;
    v45[5] = v14;
    uint64_t v15 = (__CFString *)*((void *)&v41 + 1);
    if (!*((void *)&v41 + 1)) {
      uint64_t v15 = &stru_26BF72F58;
    }
    uint64_t v16 = (__CFString *)*((void *)&v31 + 1);
    uint64_t v17 = (__CFString *)*((void *)&v32 + 1);
    if (!*((void *)&v31 + 1)) {
      uint64_t v16 = &stru_26BF72F58;
    }
    v45[6] = v15;
    v45[7] = v16;
    uint64_t v18 = (__CFString *)*((void *)&v40 + 1);
    if (!*((void *)&v40 + 1)) {
      uint64_t v18 = &stru_26BF72F58;
    }
    if (!*((void *)&v32 + 1)) {
      uint64_t v17 = &stru_26BF72F58;
    }
    v45[8] = v18;
    v45[9] = v17;
    if ((void)v41) {
      uint64_t v19 = (__CFString *)v41;
    }
    else {
      uint64_t v19 = &stru_26BF72F58;
    }
    v45[10] = v19;
    int8x16_t v46 = vbslq_s8((int8x16_t)vceqzq_s64(v33), (int8x16_t)vdupq_n_s64((unint64_t)&stru_26BF72F58), (int8x16_t)v33);
    id v20 = -[NSString scn_stringByReplacingCharactersInRanges:withStrings:](self->_originalSourceCode, "scn_stringByReplacingCharactersInRanges:withStrings:", self->_injectionPointRanges, [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:13]);
    if ([*((id *)&v40 + 1) length]) {
      [(id)v30 setObject:&stru_26BF72F58 forKeyedSubscript:@"USE_VERTEX_EXTRA_ARGUMENTS"];
    }
    if ([(id)v41 length]) {
      [(id)v30 setObject:&stru_26BF72F58 forKeyedSubscript:@"USE_FRAGMENT_EXTRA_ARGUMENTS"];
    }
    if ([*((id *)&v31 + 1) length]) {
      [(id)v30 setObject:&stru_26BF72F58 forKeyedSubscript:@"USE_SHADER_MODIFIERS"];
    }
    if (*((void *)&v30 + 1))
    {
      [*((id *)&v30 + 1) addObject:@"USE_VERTEX_EXTRA_ARGUMENTS"];
      [*((id *)&v30 + 1) addObject:@"USE_FRAGMENT_EXTRA_ARGUMENTS"];
      [*((id *)&v30 + 1) addObject:@"USE_SHADER_MODIFIERS"];
    }
    [(id)v30 setObject:&unk_26BFC14B0 forKeyedSubscript:@"METAL"];
    uint64_t v21 = (void *)[MEMORY[0x263F089D8] stringWithCapacity:0];
    [v21 appendString:@"////////////////////////////////////////////////\n"];
    objc_msgSend(v21, "appendFormat:", @"// CommonProfile Shader v%d\n", 2);
    BOOL v8 = (const void *)[v21 stringByAppendingString:v20];
  }
  char NodeHashCode = C3DProgramHashCodeGetNodeHashCode((uint64_t)a3);
  if ((NodeHashCode & 0x20) != 0)
  {
    uint64_t v23 = scn_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[SCNCommonProfileProgramGeneratorMetal _newProgramWithHashCodeWithFunctionConstants:engineContext:introspectionDataPtr:]();
    }
  }
  ConstantsValues = (const void *)C3DProgramHashCodeGetConstantsValues((uint64_t)a3);
  uint64_t v25 = &kStandardPostTessellationVertexEntryPoint;
  if ((NodeHashCode & 4) == 0) {
    uint64_t v25 = kStandardVertexEntryPoint;
  }
  v26 = (__C3DFXProgram *)C3DFXMetalProgramCreateFromSourceWithConstants(*v25, @"standard_frag", 0, v8, (const void *)v30, *((const void **)&v30 + 1), ConstantsValues, 0);
  HashCode = (const void *)C3DProgramHashCodeGetHashCode((uint64_t)a3);
  C3DFXMetalProgramUpdateHashWithCommonProfileHashCode((uint64_t)v26, HashCode);
  return v26;
}

unint64_t __153__SCNCommonProfileProgramGeneratorMetal_splitInputOutputStructsIfNeededForSourceCode_generatedFromReplacementStrings_perPixelLighting_clipDistanceCount___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  unint64_t result = [a2 rangeValue];
  uint64_t v7 = v6;
  if (result >= *(void *)(*(void *)(a1 + 32) + 56))
  {
    if (result >= *(void *)(a1 + 56)) {
      return result;
    }
    unint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a3), "length");
    BOOL v8 = (void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  }
  else
  {
    unint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a3), "length");
    BOOL v8 = (void *)(*(void *)(*(void *)(a1 + 48) + 8) + 32);
  }
  *v8 += result - v7;
  return result;
}

- (void)collectShaderForProgram:(__C3DFXMetalProgram *)a3 hashCode:(id)a4 newVertexFunctionName:(id)a5 newFragmentFunctionName:(id)a6 sourceCodeBlock:(id)a7 additionalFileBlock:(id)a8
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  PreprocessorsMacros = (void *)C3DFXMetalProgramGetPreprocessorsMacros(a3);
  cf = a3;
  SourceCodeForShaderCollection = (void *)C3DFXMetalProgramGetSourceCodeForShaderCollection(a3);
  uint64_t v12 = [SourceCodeForShaderCollection length];
  uint64_t v13 = (void *)[SourceCodeForShaderCollection mutableCopy];
  objc_msgSend(v13, "replaceOccurrencesOfString:withString:options:range:", @"commonprofile_vert", a5, 0, 0, v12);
  objc_msgSend(v13, "replaceOccurrencesOfString:withString:options:range:", @"commonprofile_frag", a6, 0, 0, v12);
  uint64_t v14 = [v13 length];
  uint64_t v15 = objc_msgSend(v13, "rangeOfString:options:range:", @"#if 1 // SHADER_COLLECTION_PREFERS_MONOLITHIC_FILES\n", 2, 0, v14);
  if (v15 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v17 = v15;
    int v56 = v13;
    do
    {
      uint64_t v18 = v17 + v16;
      uint64_t v19 = v13;
      uint64_t v20 = objc_msgSend(v13, "rangeOfString:options:range:", @"#else // SHADER_COLLECTION_PREFERS_MONOLITHIC_FILES\n", 2, v17 + v16, v14 - (v17 + v16));
      uint64_t v22 = v20 + v21;
      uint64_t v23 = objc_msgSend(v19, "rangeOfString:options:range:", @"#endif // SHADER_COLLECTION_PREFERS_MONOLITHIC_FILES\n", 2, v20 + v21, v14 - (v20 + v21));
      uint64_t v58 = v24;
      uint64_t v59 = v23;
      uint64_t v25 = v23 - v22;
      v26 = objc_msgSend(v19, "substringWithRange:", v22, v23 - v22);
      if ([v26 hasPrefix:@"#import"])
      {
        uint64_t v27 = objc_msgSend(v26, "substringFromIndex:", objc_msgSend(v26, "rangeOfString:", @"\"") + 1);
        uint64_t v28 = objc_msgSend(v27, "substringToIndex:", objc_msgSend(v27, "rangeOfString:", @"\""));
        uint64_t v29 = [NSString stringWithFormat:@"_import/%@", v28];
        uint64_t v30 = [NSString stringWithFormat:@"#import \"%@\"", v29];
        long long v31 = C3DGetTextResourceWithNameAllowingHotReload(v28);
        (*((void (**)(id, const void *, uint64_t))a8 + 2))(a8, v31, v29);
        uint64_t v13 = v56;
      }
      else
      {
        if (![v26 hasPrefix:@"#generate"]) {
          -[SCNCommonProfileProgramGeneratorMetal collectShaderForProgram:hashCode:newVertexFunctionName:newFragmentFunctionName:sourceCodeBlock:additionalFileBlock:]();
        }
        long long v32 = objc_msgSend(v26, "substringFromIndex:", objc_msgSend(v26, "rangeOfString:", @"\"") + 1);
        uint64_t v33 = objc_msgSend(v32, "substringToIndex:", objc_msgSend(v32, "rangeOfString:", @"\""));
        uint64_t v34 = [NSString stringWithFormat:@"_import/%@", v33];
        uint64_t v30 = [NSString stringWithFormat:@"#import \"%@\"", v34];
        uint64_t v35 = v20 - v18;
        uint64_t v13 = v56;
        (*((void (**)(id, uint64_t, uint64_t))a8 + 2))(a8, objc_msgSend(v56, "substringWithRange:", v18, v35), v34);
      }
      objc_msgSend(v13, "replaceCharactersInRange:withString:", v59, v58, &stru_26BF72F58);
      objc_msgSend(v13, "replaceCharactersInRange:withString:", v22, v25, v30);
      objc_msgSend(v13, "replaceCharactersInRange:withString:", v17, v22 - v17, &stru_26BF72F58);
      uint64_t v14 = [v13 length];
      uint64_t v17 = objc_msgSend(v13, "rangeOfString:options:range:", @"#if 1 // SHADER_COLLECTION_PREFERS_MONOLITHIC_FILES\n", 2, 0, v14);
    }
    while (v17 != 0x7FFFFFFFFFFFFFFFLL);
  }
  id v36 = objc_alloc_init(MEMORY[0x263F089D8]);
  long long v37 = v13;
  [v13 insertString:@"\n" atIndex:0];
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v38 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(PreprocessorsMacros, "allKeys"), "sortedArrayUsingSelector:"), "reverseObjectEnumerator");
  uint64_t v39 = [v38 countByEnumeratingWithState:&v65 objects:v70 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v66;
    do
    {
      for (uint64_t i = 0; i != v40; ++i)
      {
        if (*(void *)v66 != v41) {
          objc_enumerationMutation(v38);
        }
        uint64_t v43 = *(void *)(*((void *)&v65 + 1) + 8 * i);
        uint64_t v44 = (void *)[PreprocessorsMacros objectForKeyedSubscript:v43];
        [v37 insertString:objc_msgSend(NSString, "stringWithFormat:", @"#define %@ %@\n", v43, v44, cf), 0 atIndex];
        if ([v44 isEqual:&stru_26BF72F58]) {
          [v36 appendFormat:@" -D%@", v43, v52];
        }
        else {
          [v36 appendFormat:@" -D%@=%@", v43, v44];
        }
      }
      uint64_t v40 = [v38 countByEnumeratingWithState:&v65 objects:v70 count:16];
    }
    while (v40);
  }
  PreprocessorAllPossibleMacros = (void *)C3DFXMetalProgramGetPreprocessorAllPossibleMacros(cf);
  if ([PreprocessorAllPossibleMacros count])
  {
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    int8x16_t v46 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(PreprocessorAllPossibleMacros, "allObjects"), "sortedArrayUsingSelector:", sel_compare_), "reverseObjectEnumerator");
    uint64_t v47 = [v46 countByEnumeratingWithState:&v61 objects:v69 count:16];
    if (v47)
    {
      uint64_t v48 = v47;
      uint64_t v49 = *(void *)v62;
      do
      {
        for (uint64_t j = 0; j != v48; ++j)
        {
          if (*(void *)v62 != v49) {
            objc_enumerationMutation(v46);
          }
          uint64_t v51 = *(void *)(*((void *)&v61 + 1) + 8 * j);
          if (![PreprocessorsMacros objectForKeyedSubscript:v51]) {
            [v36 appendFormat:@" -U%@", v51];
          }
        }
        uint64_t v48 = [v46 countByEnumeratingWithState:&v61 objects:v69 count:16];
      }
      while (v48);
    }
  }
  (*((void (**)(id, id, uint64_t))a8 + 2))(a8, v36, [NSString stringWithFormat:@"_unifdef/%@.h", a4]);

  (*((void (**)(id, void *))a7 + 2))(a7, v37);
}

- (void)_newProgramWithHashCodeWithFunctionConstants:engineContext:introspectionDataPtr:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Unreachable code: OpenSubdiv support not implemented yet for constant shaders", v2, v3, v4, v5, v6);
}

- (void)_newProgramWithHashCode:(uint8_t *)a1 engineContext:(void *)a2 introspectionDataPtr:(NSObject *)a3 .cold.1(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "0";
  OUTLINED_FUNCTION_0_2(&dword_20B249000, (int)a2, a3, "Assertion '%s' failed. Infinite lights can only be dir or unranged omni", a1);
}

- (void)_newProgramWithHashCode:(uint8_t *)buf engineContext:(unsigned char *)a2 introspectionDataPtr:(os_log_t)log .cold.2(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Unreachable code: Multiple rendering is lacking a multiple output vertex streams generator", buf, 2u);
}

- (void)_newProgramWithHashCode:engineContext:introspectionDataPtr:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Invalid shader modifier: programmable blending is not supported by this device", v2, v3, v4, v5, v6);
}

- (void)collectShaderForProgram:hashCode:newVertexFunctionName:newFragmentFunctionName:sourceCodeBlock:additionalFileBlock:.cold.1()
{
}

@end