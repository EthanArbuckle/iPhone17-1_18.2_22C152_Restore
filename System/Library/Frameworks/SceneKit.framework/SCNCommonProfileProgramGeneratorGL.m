@interface SCNCommonProfileProgramGeneratorGL
- (SCNCommonProfileProgramGeneratorGL)init;
- (SCNCommonProfileProgramGeneratorGL)initWithProfile:(int)a3;
- (__C3DFXProgram)_newProgramWithHashCode:(__C3DProgramHashCode *)a3 engineContext:(__C3DEngineContext *)a4 introspectionDataPtr:(void *)a5;
- (int)profile;
@end

@implementation SCNCommonProfileProgramGeneratorGL

- (SCNCommonProfileProgramGeneratorGL)initWithProfile:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SCNCommonProfileProgramGeneratorGL;
  result = [(SCNCommonProfileProgramGenerator *)&v5 init];
  if (result) {
    result->_profile = a3;
  }
  return result;
}

- (SCNCommonProfileProgramGeneratorGL)init
{
  v3.receiver = self;
  v3.super_class = (Class)SCNCommonProfileProgramGeneratorGL;
  return [(SCNCommonProfileProgramGenerator *)&v3 init];
}

- (__C3DFXProgram)_newProgramWithHashCode:(__C3DProgramHashCode *)a3 engineContext:(__C3DEngineContext *)a4 introspectionDataPtr:(void *)a5
{
  *(void *)((char *)&v184[2] + 4) = *MEMORY[0x263EF8340];
  CFAllocatorRef alloc = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 100, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  unsigned int CommonProfileHashCode = C3DProgramHashCodeGetCommonProfileHashCode((uint64_t)a3);
  unsigned int cf = C3DProgramHashCodeGetNodeHashCode((uint64_t)a3);
  int HasTexture = C3DProgramHashCodeGetEffectPropertyHasTexture((uint64_t)a3, 7u);
  int v142 = C3DProgramHashCodeGetEffectPropertyHasTexture((uint64_t)a3, 4u);
  int IsOpaque = C3DProgramHashCodeIsOpaque((uint64_t)a3);
  int v146 = C3DProgramHashCodeGetEffectPropertyHasTexture((uint64_t)a3, 5u);
  int v160 = CommonProfileHashCode & 0xF;
  if (v160 == 5)
  {
    v9 = scn_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SCNCommonProfileProgramGeneratorGL _newProgramWithHashCode:engineContext:introspectionDataPtr:].cold.6();
    }
    int v160 = 2;
  }
  __int16 v10 = CommonProfileHashCode;
  EffectPropertyHashuint64_t Code = C3DProgramHashCodeGetEffectPropertyHashCode((uint64_t)a3, 2u);
  int IsOne = C3DProgramHashCodeGlobalAlphaIsOne((uint64_t)a3);
  int HasConstantAlpha = C3DProgramHashCodeHasConstantAlpha((uint64_t)a3);
  memset(v182, 0, sizeof(v182));
  uint64_t v11 = C3DProgramHashCodeCopyShaderModifiersForEntryPoint((uint64_t)a3, 0, 1, (uint64_t)v182, 32);
  memset(v181, 0, sizeof(v181));
  uint64_t v12 = C3DProgramHashCodeCopyShaderModifiersForEntryPoint((uint64_t)a3, 1, 1, (uint64_t)v181, 32);
  memset(v180, 0, sizeof(v180));
  uint64_t v13 = C3DProgramHashCodeCopyShaderModifiersForEntryPoint((uint64_t)a3, 2, 1, (uint64_t)v180, 32);
  uint64_t v177 = 0;
  uint64_t v14 = C3DProgramHashCodeCopyShaderModifiersForEntryPoint((uint64_t)a3, 3, 1, (uint64_t)&v177, 1);
  if (v14 >= 2)
  {
    v15 = scn_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[SCNCommonProfileProgramGeneratorGL _newProgramWithHashCode:engineContext:introspectionDataPtr:].cold.5();
    }
    uint64_t v14 = 1;
  }
  __AppendModifierDefines(Mutable, v182, v11);
  __AppendModifierDefines(Mutable, v181, v12);
  __AppendModifierDefines(Mutable, (uint64_t *)v180, v13);
  __AppendModifierDefines(Mutable, &v177, v14);
  uint64_t v136 = v13;
  char ModifierFlag = __GetModifierFlag((uint64_t *)v180, v13);
  char v132 = __GetModifierFlag(v181, v12);
  int LightsCount = C3DProgramHashCodeGetLightsCount((uint64_t)a3);
  theDict = Mutable;
  uint64_t v151 = v12;
  if ((v160 & 0xFFFFFFFB) != 0) {
    int LightingEnabled = C3DProgramHashCodeGetLightingEnabled((uint64_t)a3);
  }
  else {
    int LightingEnabled = 0;
  }
  int IsEnabled = 0;
  if ((v160 & 0xE) == 2 && LightingEnabled) {
    int IsEnabled = C3DProgramHashCodeGetEffectPropertyIsEnabled((uint64_t)a3, 3u);
  }
  int appendedString = (CommonProfileHashCode >> 4) & 1 | HasTexture;
  int v18 = IsEnabled | CheckDefineUsageInModifiers((uint64_t)v181, v12, @"USE_SPECULAR");
  int v19 = v18 | CheckDefineUsageInModifiers((uint64_t)&v177, v14, @"USE_SPECULAR");
  v20 = theDict;
  if (v19 == 1)
  {
    if (appendedString)
    {
      CFDictionarySetValue(theDict, @"USE_VIEW", @"2");
      CFDictionarySetValue(theDict, @"USE_SHININESS", @"2");
    }
    else
    {
      CFDictionaryAddValue(theDict, @"USE_VIEW", @"1");
      CFDictionaryAddValue(theDict, @"USE_SHININESS", @"1");
    }
  }
  int AmbientLightingEnabled = C3DProgramHashCodeGetAmbientLightingEnabled((uint64_t)a3);
  v168 = CFStringCreateMutable(alloc, 0);
  v21 = CFStringCreateMutable(alloc, 0);
  CFDictionaryRef v152 = CFDictionaryCreateMutable(alloc, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFMutableStringRef theString = v21;
  __int16 v148 = CommonProfileHashCode;
  __int16 v140 = CommonProfileHashCode;
  uint64_t v135 = v11;
  if (!LightingEnabled)
  {
    int v26 = 0;
    int LightsCount = 0;
    int v154 = 0;
LABEL_91:
    int v45 = AmbientLightingEnabled;
    goto LABEL_92;
  }
  if (v177)
  {
    CFStringRef Declaration = (const __CFString *)C3DShaderModifierGetDeclaration(v177);
    if (Declaration) {
      CFStringAppend(v21, Declaration);
    }
  }
  CFStringRef v23 = (const __CFString *)C3DGetTextResourceWithNameAllowingHotReload(@"SCNShaderLightDecl.glsl");
  CFStringAppend(v21, v23);
  if (!LightsCount)
  {
    int v26 = 0;
    int v154 = 0;
    __int16 v10 = CommonProfileHashCode;
    goto LABEL_91;
  }
  int v138 = 0;
  int v139 = v19;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  int v157 = 0;
  int v26 = 0;
  v27 = v168;
  do
  {
    uint64_t v28 = v177;
    unsigned int LightHashCode = C3DProgramHashCodeGetLightHashCode((uint64_t)a3, (unsigned __int16)v24);
    int v30 = LightHashCode & 7;
    if ((LightHashCode & 7) != 0)
    {
      unint64_t v31 = LightHashCode;
      CFStringRef v32 = CFStringCreateWithFormat(alloc, 0, @"u_light%hu", v24);
      CFStringAppend(v27, @"{\n");
      CFStringAppend(v27, @"    SCNShaderLight _light;\n");
      if ((v31 & 0x1000) != 0)
      {
        CFStringAppend(v27, @"    _light.intensity = vec4(1.);\n");
      }
      else
      {
        CFStringAppendFormat(theString, 0, @"uniform vec4 %@_color;\n", v32);
        CFStringAppendFormat(v27, 0, @"    _light.intensity = %@_color;\n", v32);
      }
      uint64_t v33 = (v31 >> 3) & 7;
      switch(v30)
      {
        case 1:
          CFStringAppendFormat(theString, 0, @"uniform vec4 %@_direction;\n", v32);
          v34 = v168;
          CFStringAppendFormat(v168, 0, @"    _light.direction = %@_direction.xyz;\n", v32);
          goto LABEL_38;
        case 2:
          CFStringAppendFormat(theString, 0, @"uniform vec4 %@_position;\n", v32);
          if (v33)
          {
            CFStringAppendFormat(v168, 0, @"    vec3 _D = %@_position.xyz - _surface.position;\n", v32);
            CFStringAppendFormat(v168, 0, @"    _light.dist = length(_D);\n");
            CFStringAppendFormat(v168, 0, @"    _light.direction = _D / _light.dist;\n");
            CFStringAppendFormat(v168, 0, @"    _light._att = 1.;\n");
            int v26 = 1;
LABEL_39:
            CFStringAppendFormat(theString, 0, @"uniform vec4 %@_attenuation;\n", v32);
            CFStringAppendFormat(v168, 0, @"    vec3 _att = %@_attenuation.xyz;\n", v32);
            switch((int)v33)
            {
              case 1:
                v35 = v168;
                CFStringRef v36 = @"    _light._att *= step(_light.dist, _att.x);\n";
                goto LABEL_44;
              case 2:
                v35 = v168;
                CFStringRef v36 = @"    _light._att *= clamp(_light.dist * _att.x + _att.y, 0.0, 1.0);\n";
                goto LABEL_44;
              case 3:
                v35 = v168;
                CFStringRef v36 = @"    float _dstatt = clamp(_light.dist * _att.x + _att.y, 0.0, 1.0);\n    _light._att *= (_dstatt  * _dstatt);\n";
                goto LABEL_44;
              case 4:
                v35 = v168;
                CFStringRef v36 = @"    _light._att *= pow(clamp(_light.dist * _att.x + _att.y, 0.0, 1.0), _att.z);\n";
LABEL_44:
                CFStringAppend(v35, v36);
                break;
              default:
                break;
            }
          }
          else
          {
            CFStringAppendFormat(v168, 0, @"    _light.direction = normalize(%@_position.xyz - _surface.position);\n",
              v32);
            CFStringAppendFormat(v168, 0, @"    _light._att = 1.;\n");
            int v26 = 1;
          }
LABEL_45:
          uint64_t v37 = (v31 >> 6) & 7;
          v27 = v168;
          if (v37)
          {
            CFStringAppendFormat(theString, 0, @"uniform vec4 %@_spotAttenuation;\n", v32);
            CFStringAppendFormat(v168, 0, @"    vec3 _spot = %@_spotAttenuation.xyz;\n", v32);
            if ((v37 - 1) <= 3) {
              CFStringAppend(v168, off_264009A90[v37 - 1]);
            }
          }
          if ((v31 & 0x400) != 0)
          {
            CFStringAppendFormat(theString, 0, @"uniform sampler2DShadow %@_shadow;\n", v32);
            CFStringAppendFormat(theString, 0, @"uniform mat4 %@_shadowMatrix;\n", v32);
            unsigned int v38 = WORD1(v31) & 0x1F;
            if (v38 < 2)
            {
              CFStringAppendFormat(v168, 0, @"    float _shadowingTerm = __shadow2DProj(%@_shadow, (%@_shadowMatrix * vec4(_surface.position, 1.)));\n",
                v32,
                v32,
                v129,
                v130,
                v131);
            }
            else
            {
              if (v25 <= v38) {
                uint64_t v25 = WORD1(v31) & 0x1F;
              }
              CFStringAppendFormat(theString, 0, @"uniform float %@_shadowRadius;\n", v32);
              CFStringAppendFormat(v168, 0, @"    float _shadowingTerm = 0.0;\n    vec4 _lightScreen = (%@_shadowMatrix * vec4(_surface.position, 1.));\n    float _filteringSizeFactor = %@_shadowRadius * _lightScreen.w;\n    for (int i=0; i < %d; i++){\n        _shadowingTerm += __shadow2DProj(%@_shadow, _lightScreen + (u_shadowKernel[i] * _filteringSizeFactor));\n    }\n    _shadowingTerm /= float(%d);\n",
                v32,
                v32,
                WORD1(v31) & 0x1F,
                v32,
                WORD1(v31) & 0x1F);
            }
            if ((v31 & 0x800) != 0)
            {
              CFStringAppendFormat(theString, 0, @"uniform vec4 %@_shadowColor;\n", v32);
              CFStringAppendFormat(v168, 0, @"    _light._att *= (1. - _shadowingTerm * %@_shadowColor.a);\n",
                v32);
            }
            else
            {
              CFStringAppendFormat(v168, 0, @"    _light._att *= (1. - _shadowingTerm);\n", v128);
            }
            int v26 = 1;
            int v157 = 1;
LABEL_63:
            if (v28) {
              goto LABEL_64;
            }
            if ((v31 & 0x1000) != 0) {
              goto LABEL_79;
            }
            goto LABEL_70;
          }
          if ((v31 & 5) != 1 || (v31 & 0x200) == 0) {
            goto LABEL_63;
          }
          CFStringAppendFormat(theString, 0, @"uniform sampler2D %@_gobo;\n", v32);
          CFStringAppendFormat(theString, 0, @"uniform mat4 %@_goboMatrix;\n", v32);
          CFStringAppendFormat(theString, 0, @"uniform float %@_goboIntensity;\n", v32);
          if ((v31 & 0x1000) != 0)
          {
            CFStringAppendFormat(v168, 0, @"    _light.intensity *= mix(vec4(1.), texture2DProj(%@_gobo, (%@_goboMatrix * vec4(_surface.position, 1.))), %@_goboIntensity);\n",
              v32,
              v32,
              v32);
            int v26 = 1;
            if (v28)
            {
LABEL_64:
              uint64_t Code = C3DShaderModifierGetCode(v28);
              if (!Code)
              {
                v40 = scn_default_log();
                if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT)) {
                  -[SCNCommonProfileProgramGeneratorGL _newProgramWithHashCode:engineContext:introspectionDataPtr:].cold.4(v183, v184, v40);
                }
              }
              v27 = v168;
              v41 = v168;
              CFStringRef v42 = (const __CFString *)Code;
              goto LABEL_68;
            }
LABEL_79:
            CFStringAppend(v168, @"    _lightingContribution.modulate *= _light._att * _light.intensity.rgb;\n");
            int v138 = 1;
            goto LABEL_80;
          }
          CFStringAppendFormat(v168, 0, @"    _light.intensity *= %@_goboIntensity * texture2DProj(%@_gobo, (%@_goboMatrix * vec4(_surface.position, 1.)));\n",
            v32,
            v32,
            v32);
          int v26 = 1;
          if (v28) {
            goto LABEL_64;
          }
LABEL_70:
          int v43 = C3DProgramHashCodeGetCommonProfileHashCode((uint64_t)a3) & 0xF;
          if (v43 == 5)
          {
            v44 = scn_default_log();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
              -[SCNCommonProfileProgramGeneratorGL _newProgramWithHashCode:engineContext:introspectionDataPtr:](&buf, v179, v44);
            }
            int v43 = 2;
          }
          CFStringAppend(v168, @"    _light.intensity.rgb *= _light._att * max(0.0, dot(_surface.normal, _light.direction));\n    _lightingContribution.diffuse += _light.intensity.rgb;\n");
          if (v139)
          {
            if (v43 == 3)
            {
              v41 = v168;
              CFStringRef v42 = @"    vec3 _halfVector = normalize(_light.direction + _surface.view);\n    _lightingContribution.specular += pow(max(0.0, dot(_surface.normal, _halfVector)), _surface.shininess) * _light.intensity.rgb;\n";
              goto LABEL_68;
            }
            if (v43 == 2)
            {
              v41 = v168;
              CFStringRef v42 = @"    vec3 _R = reflect(-_light.direction, _surface.normal);\n    _lightingContribution.specular += pow(max(0.0, dot(_R, _surface.view)), _surface.shininess) * _light.intensity.rgb;\n";
LABEL_68:
              CFStringAppend(v41, v42);
            }
          }
LABEL_80:
          CFStringAppend(v27, @"}\n");
          CFRelease(v32);
          break;
        case 3:
        case 5:
          CFStringAppendFormat(theString, 0, @"uniform vec4 %@_position;\n", v32);
          CFStringAppendFormat(theString, 0, @"uniform vec4 %@_direction;\n", v32);
          v34 = v168;
          if (v33)
          {
            CFStringAppendFormat(v168, 0, @"    vec3 _D = %@_position.xyz - _surface.position;\n", v32);
            CFStringAppendFormat(v168, 0, @"    _light.dist = length(_D);\n");
            CFStringAppendFormat(v168, 0, @"    _light.direction = _D / _light.dist;\n", v127);
          }
          else
          {
            CFStringAppendFormat(v168, 0, @"    _light.direction = normalize(%@_position.xyz - _surface.position);\n",
              v32);
          }
          CFStringAppendFormat(v168, 0, @"    _light.dir = %@_direction.xyz;\n", v32);
          int v26 = 1;
          goto LABEL_38;
        default:
          v34 = v168;
          CFStringAppend(v168, @"//Unsupported\n");
LABEL_38:
          CFStringAppendFormat(v34, 0, @"    _light._att = 1.;\n");
          if (v33) {
            goto LABEL_39;
          }
          goto LABEL_45;
      }
    }
    uint64_t v24 = (v24 + 1);
  }
  while (LightsCount != v24);
  LOWORD(CommonProfileHashCode) = v140;
  int v45 = AmbientLightingEnabled;
  if (v157)
  {
    CFStringAppend(theString, @"float __shadow2DProj(sampler2DShadow tex, vec4 coord) {return shadow2DProjEXT( tex, coord);}\n");
    __int16 v10 = v148;
    int LightsCount = v138;
    if (v25 >= 2) {
      CFStringAppendFormat(theString, 0, @"uniform vec4 u_shadowKernel[%d];\n", v25);
    }
    int v154 = 1;
    v20 = theDict;
    int v19 = v139;
  }
  else
  {
    int v154 = 0;
    v20 = theDict;
    __int16 v10 = v148;
    int LightsCount = v138;
    int v19 = v139;
  }
LABEL_92:
  BOOL v46 = (v10 & 0x280) != 0 && v160 == 4;
  int v47 = appendedString;
  if (v46) {
    int v47 = 1;
  }
  int v158 = v47;
  if (C3DProgramHashCodeHasFog((uint64_t)a3))
  {
    CFDictionaryAddValue(v20, @"USE_FOG", &stru_26BF72F58);
    CFDictionaryAddValue(v20, @"USE_POSITION", @"2");
  }
  if (C3DProgramHashCodeGetEffectPropertyIsEnabled((uint64_t)a3, 0x13u)
    && C3DProgramHashCodeGetEffectPropertyIsEnabled((uint64_t)a3, 0x14u)
    && C3DProgramHashCodeGetEffectPropertyIsEnabled((uint64_t)a3, 4u))
  {
    CFDictionaryAddValue(v20, @"USE_FRESNEL", &stru_26BF72F58);
    CFDictionaryAddValue(v20, @"USE_VIEW", @"2");
    CFDictionaryAddValue(v20, @"USE_NORMAL", @"2");
    CFDictionaryAddValue(v20, @"USE_POSITION", @"2");
  }
  if ((LightingEnabled & ((v10 & 0x40) != 0)) == 1) {
    CFDictionaryAddValue(v20, @"AVOID_OVERLIGHTING", &stru_26BF72F58);
  }
  if (v45) {
    CFDictionaryAddValue(v20, @"USE_AMBIENT_LIGHTING", &stru_26BF72F58);
  }
  if (LightingEnabled)
  {
    CFDictionaryAddValue(v20, @"USE_LIGHTING", &stru_26BF72F58);
    if (v158)
    {
      CFDictionaryAddValue(v20, @"USE_PER_PIXEL_LIGHTING", &stru_26BF72F58);
      CFDictionarySetValue(v20, @"USE_NORMAL", @"2");
      if (((v26 == 0) & ~v19) == 0) {
        CFDictionarySetValue(v20, @"USE_POSITION", @"2");
      }
      if (LightsCount)
      {
        v48 = @"USE_MODULATE";
        v49 = @"2";
        goto LABEL_118;
      }
    }
    else
    {
      CFDictionaryAddValue(v20, @"USE_NORMAL", @"1");
      CFDictionaryAddValue(v20, @"USE_PER_VERTEX_LIGHTING", &stru_26BF72F58);
      if (!CFDictionaryGetValue(v20, @"USE_VIEW")) {
        CFDictionarySetValue(v20, @"USE_VIEW", @"1");
      }
      if (!CFDictionaryGetValue(v20, @"USE_POSITION"))
      {
        v48 = @"USE_POSITION";
        v49 = @"1";
LABEL_118:
        CFDictionarySetValue(v20, v48, v49);
      }
    }
  }
  if ((cf & 2) != 0) {
    CFDictionaryAddValue(v20, @"USE_VERTEX_COLOR", &stru_26BF72F58);
  }
  v175 = a3;
  uint64_t v176 = 0;
  v169 = v20;
  CFStringRef v171 = CFStringCreateMutable(alloc, 0);
  CFStringRef v172 = CFStringCreateMutable(alloc, 0);
  CFTypeRef v173 = CFStringCreateMutable(alloc, 0);
  CFTypeRef v174 = CFStringCreateMutable(alloc, 0);
  CFStringRef v50 = (const __CFString *)C3DGetTextResourceWithNameAllowingHotReload(@"SCNShaderSurfaceDecl.glsl");
  CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(alloc, 0, v50);
  if (C3DProgramHashCodeGetEffectPropertyHasTexture((uint64_t)a3, 8u))
  {
    __AddTextureProperty((uint64_t)&v169, 8u, 1, v45);
    CFDictionaryAddValue(v20, @"USE_AMBIENT_AS_AMBIENTOCCLUSION", &stru_26BF72F58);
  }
  else
  {
    if ((CommonProfileHashCode & 0x8000u) == 0) {
      int v51 = v45;
    }
    else {
      int v51 = 0;
    }
    __AddTextureProperty((uint64_t)&v169, 1u, 1, v51);
  }
  __AddTextureProperty((uint64_t)&v169, 2u, 2, 1);
  __AddTextureProperty((uint64_t)&v169, 3u, 3, v19 | v142);
  if (C3DProgramHashCodeGetEffectPropertyIsEnabled((uint64_t)a3, 9u))
  {
    __AddTextureProperty((uint64_t)&v169, 9u, 0, 1);
    CFDictionaryAddValue(v20, @"USE_EMISSION_AS_SELFILLUMINATION", &stru_26BF72F58);
  }
  else
  {
    __AddTextureProperty((uint64_t)&v169, 0, 0, 1);
  }
  __AddTextureProperty((uint64_t)&v169, 6u, 6, 1);
  __AddTextureProperty((uint64_t)&v169, 7u, 7, 1);
  if ((_BYTE)v176)
  {
    CFDictionarySetValue(v20, @"USE_TANGENT", @"2");
    CFDictionarySetValue(v20, @"USE_BITANGENT", @"2");
  }
  __AddTextureProperty((uint64_t)&v169, 4u, 4, 1);
  if ((_BYTE)v176)
  {
    CFDictionarySetValue(v20, @"USE_VIEW", @"2");
    CFDictionarySetValue(v20, @"USE_NORMAL", @"2");
    CFDictionarySetValue(v20, @"USE_POSITION", @"2");
  }
  int v52 = v146 & (IsOpaque ^ 1);
  if (C3DProgramHashCodeGetEffectPropertyIsEnabled((uint64_t)a3, 2u))
  {
    unsigned int v53 = C3DProgramHashCodeGetEffectPropertyHashCode((uint64_t)a3, 2u);
    if (v53)
    {
      unint64_t v147 = ((unint64_t)v53 >> 5) & 1;
      int v54 = v147;
    }
    else
    {
      int v54 = 0;
      LOBYTE(v147) = (v53 & 8) == 0;
    }
  }
  else
  {
    LOBYTE(v147) = 0;
    int v54 = 0;
  }
  int v55 = IsOne;
  if ((CommonProfileHashCode & 0x7800) != 0x800) {
    int v55 = 0;
  }
  int v145 = CommonProfileHashCode & 0x7800;
  int v161 = v52;
  if ((v55 | v52)) {
    int v56 = v55 ^ 1;
  }
  else {
    int v56 = v54 | HasConstantAlpha ^ 1;
  }
  __AddTextureProperty((uint64_t)&v169, 5u, 5, v56);
  uint64_t CustomSlotCount = C3DProgramHashCodeGetCustomSlotCount((uint64_t)a3);
  if (CustomSlotCount >= 1)
  {
    uint64_t v58 = CustomSlotCount;
    uint64_t v59 = 0;
    v60 = MutableCopy;
    v61 = (__CFString *)v174;
    do
    {
      CustomSlotSortedName = C3DProgramHashCodeGetCustomSlotSortedName((uint64_t)a3, v59);
      uint64_t CustomSlotUVSet = C3DProgramHashCodeGetCustomSlotUVSet((uint64_t)a3, v59);
      if (CustomSlotUVSet != -1)
      {
        uint64_t v64 = CustomSlotUVSet;
        CFStringAppendFormat(v60, 0, @"    vec2 %@Texcoord;\n", CustomSlotSortedName);
        CFStringAppendFormat(v61, 0, @"    _surface.%@Texcoord = v_texcoord%d;\n", CustomSlotSortedName, v64);
      }
      ++v59;
    }
    while (v58 != v59);
  }
  v65 = theDict;
  int v143 = v161 | v54;
  if ((v161 | v54)) {
    CFDictionarySetValue(theDict, @"USE_DISCARD", @"2");
  }
  CFStringRef appendedStringa = MutableCopy;
  CFStringAppend(MutableCopy, @"\n} _surface;\n");
  uint64_t UVSetsCount = C3DProgramHashCodeGetUVSetsCount((uint64_t)a3);
  uint64_t v67 = UVSetsCount;
  CFStringRef v68 = v168;
  CFTypeRef v162 = (CFTypeRef)UVSetsCount;
  if (UVSetsCount)
  {
    if (UVSetsCount < 1)
    {
      uint64_t v70 = 0;
    }
    else
    {
      uint64_t v69 = 0;
      uint64_t v70 = 0;
      v71 = (__CFString *)v171;
      v72 = (__CFString *)v172;
      v73 = (__CFString *)v173;
      do
      {
        unsigned int UVSetInfo = C3DProgramHashCodeGetUVSetInfo((uint64_t)a3, v69);
        __int16 v75 = UVSetInfo;
        int v76 = ~(UVSetInfo >> 8);
        CFStringAppendFormat(v71, 0, @"varying vec2 v_texcoord%d;\n", v69);
        if (v76)
        {
          if (v75 >> 8 > 20) {
            v77 = C3DProgramHashCodeGetCustomSlotSortedName((uint64_t)a3, SHIBYTE(v75) - 27);
          }
          else {
            v77 = __stringForProperty();
          }
          v79 = v77;
          CFStringAppendFormat(v72, 0, @"uniform mat4 u_%@TextureMatrix;\n", v77);
          uint64_t v78 = v75;
          CFStringAppendFormat(v73, 0, @"v_texcoord%d = (u_%@TextureMatrix * vec4(_geometry.texcoords[%d], 0., 1.)).xy;\n",
            v69,
            v79,
            v75);
        }
        else
        {
          uint64_t v78 = v75;
          CFStringAppendFormat(v73, 0, @"v_texcoord%d = _geometry.texcoords[%d];\n",
            v69,
            v75,
            v129);
        }
        CFStringRef v80 = CFStringCreateWithFormat(alloc, 0, @"NEED_IN_TEXCOORD%d", v78);
        v65 = theDict;
        CFDictionaryAddValue(theDict, v80, &stru_26BF72F58);
        CFRelease(v80);
        if (v70 <= (v78 + 1)) {
          uint64_t v70 = (v78 + 1);
        }
        ++v69;
        uint64_t v67 = (uint64_t)v162;
      }
      while (v162 != (CFTypeRef)v69);
    }
    CFDictionaryAddValue(v65, @"USE_TEXCOORD", &stru_26BF72F58);
    CFStringRef v68 = v168;
  }
  else
  {
    uint64_t v70 = 0;
  }
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v65, @"USE_VIEW");
  if (Value && CFEqual(Value, @"2")) {
    CFDictionarySetValue(v65, @"USE_POSITION", @"2");
  }
  v82 = CFStringCreateMutable(alloc, 0);
  v83 = v82;
  if (v154) {
    CFStringAppend(v82, @"#extension GL_EXT_shadow_samplers : require\n\n");
  }
  CFStringRef v84 = (const __CFString *)C3DGetTextResourceWithNameAllowingHotReload(@"C3D-UberShader.vsh");
  if (v84)
  {
    CFMutableStringRef v85 = CFStringCreateMutableCopy(alloc, 0, v84);
    CFMutableStringRef v86 = CFStringCreateMutable(alloc, 0);
    CFStringRef v87 = (const __CFString *)C3DGetTextResourceWithNameAllowingHotReload(@"SCNShaderGeometryDecl.glsl");
    CFStringAppend(v86, v87);
    CFStringAppend(v86, appendedStringa);
    if ((v158 & 1) == 0) {
      CFStringAppend(v86, @"struct SCNShaderLightingContribution {vec3 ambient; vec3 diffuse; vec3 specular; vec3 modulate;} _lightingContribution;\n");
    }
    CFDictionaryRef v88 = v65;
    v89 = CFDictionaryCreateMutableCopy(alloc, 0, v65);
    v90 = CFDictionaryCreateMutable(alloc, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    if (CFDictionaryContainsKey(v88, @"USE_POSITION")
      || CFDictionaryContainsKey(v88, @"USE_VIEW")
      || ((LightingEnabled ^ 1 | v158) & 1) == 0)
    {
      CFDictionarySetValue(v90, @"u_modelViewTransform", @"mat4");
      CFDictionarySetValue(v90, @"u_projectionTransform", @"mat4");
      CFDictionarySetValue(v89, @"SEPARATE_PROJECTION", @"1");
      if (!CFDictionaryGetValue(v88, @"USE_POSITION"))
      {
        v91 = @"USE_POSITION";
        v92 = @"1";
        v93 = v88;
        goto LABEL_183;
      }
    }
    else
    {
      v91 = @"u_modelViewProjectionTransform";
      v92 = @"mat4";
      v93 = v90;
LABEL_183:
      CFDictionarySetValue(v93, v91, v92);
    }
    if (CFDictionaryContainsKey(v88, @"USE_NORMAL")
      || CFDictionaryContainsKey(theDict, @"USE_TANGENT")
      || CFDictionaryContainsKey(theDict, @"USE_PER_VERTEX_LIGHTING"))
    {
      CFDictionarySetValue(v90, @"u_normalTransform", @"mat4");
    }
    uint64_t v95 = cf >> 28;
    if (v162)
    {
      CFStringAppend(v86, v172);
      CFStringAppend(v86, v171);
      CFStringRef v96 = (const __CFString *)v173;
      v187.length = CFStringGetLength(v85);
      v187.location = 0;
      CFStringFindAndReplace(v85, @"__DoTexcoord__", v96, v187, 0);
    }
    CFStringAppendFormat(v86, 0, @"#define kSCNTexcoordCount %ld\n", v70);
    if (v95)
    {
      CFDictionaryAddValue(v89, @"USE_SKINNING", &stru_26BF72F58);
      CFStringRef v97 = CFStringCreateWithFormat(alloc, 0, @"%ld", v95);
      CFDictionaryAddValue(v89, @"MAX_BONE_INFLUENCES", v97);
      CFRelease(v97);
    }
    if (v135)
    {
      CFDictionaryAddValue(v89, @"USE_GEOMETRY_MODIFIER", &stru_26BF72F58);
      __ReplaceCodeWithModifiers(v182, v135, v85, v86, v89, v90, @"__DoGeometryModifier__");
    }
    if (((LightingEnabled ^ 1 | v158) & 1) == 0)
    {
      CFStringAppend(v86, theString);
      CFDictionaryApplyFunction(v152, (CFDictionaryApplierFunction)__appendDictionary_0, v90);
      v188.length = CFStringGetLength(v85);
      v188.location = 0;
      CFStringFindAndReplace(v85, @"__DoLighting__", v68, v188, 0);
    }
    CFDictionaryApplyFunction(v90, (CFDictionaryApplierFunction)__AppendUniformsDeclaration, v83);
    CFMutableStringRef cfa = v85;
    CFStringAppend(v86, v85);
    CFIndex Count = CFDictionaryGetCount(v89);
    v99 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
    v100 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
    CFDictionaryGetKeysAndValues(v89, v99, v100);
    if (Count >= 1)
    {
      v101 = v99;
      v102 = v100;
      do
      {
        uint64_t v104 = (uint64_t)*v101++;
        uint64_t v103 = v104;
        uint64_t v105 = (uint64_t)*v102++;
        CFStringAppendFormat(v83, 0, @"#define %@ %@\n", v103, v105);
        --Count;
      }
      while (Count);
    }
    free(v99);
    free(v100);
    CFStringAppend(v83, v86);
    CFRelease(v89);
    CFRelease(v90);
    CFRelease(v86);
    CFRelease(cfa);
    uint64_t v67 = (uint64_t)v162;
    v65 = theDict;
    CFStringRef v68 = v168;
  }
  else
  {
    v94 = scn_default_log();
    if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR)) {
      -[SCNCommonProfileProgramGeneratorGL _newProgramWithHashCode:engineContext:introspectionDataPtr:]();
    }
  }
  v106 = CFStringCreateMutable(alloc, 0);
  v107 = v106;
  if (v154) {
    CFStringAppend(v106, @"#extension GL_EXT_shadow_samplers : require\n\n");
  }
  CFStringAppend(v107, @"#extension GL_OES_standard_derivatives : enable\n\n");
  CFStringRef v108 = (const __CFString *)C3DGetTextResourceWithNameAllowingHotReload(@"C3D-UberShader.fsh");
  CFMutableStringRef v109 = theString;
  if (v108)
  {
    CFMutableStringRef v110 = CFStringCreateMutableCopy(alloc, 0, v108);
    CFMutableStringRef v111 = CFStringCreateMutable(alloc, 0);
    CFStringAppend(v111, appendedStringa);
    CFStringAppend(v111, @"struct SCNShaderLightingContribution {vec3 ambient; vec3 diffuse; vec3 specular; vec3 modulate;} _lightingContribution;\n");
    v112 = CFDictionaryCreateMutableCopy(alloc, 0, v65);
    CFMutableDictionaryRef v113 = CFDictionaryCreateMutable(alloc, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    if (v151)
    {
      CFDictionaryAddValue(v112, @"USE_SURFACE_MODIFIER", &stru_26BF72F58);
      __ReplaceCodeWithModifiers(v181, v151, v110, v111, v112, v113, @"__DoSurfaceModifier__");
    }
    if (v136)
    {
      CFDictionaryAddValue(v112, @"USE_FRAGMENT_MODIFIER", &stru_26BF72F58);
      __ReplaceCodeWithModifiers((uint64_t *)v180, v136, v110, v111, v112, v113, @"__DoFragmentModifier__");
    }
    if (v140 < 0) {
      CFDictionaryAddValue(v112, @"LOCK_AMBIENT_WITH_DIFFUSE", &stru_26BF72F58);
    }
    if ((v148 & 0x20) != 0) {
      CFDictionaryAddValue(v112, @"USE_DOUBLE_SIDED", &stru_26BF72F58);
    }
    if ((IsOne & 1) == 0)
    {
      if ((v143 | (((v132 | ModifierFlag) & 2) >> 1)) == 1) {
        CFDictionaryAddValue(v112, @"USE_TRANSPARENCY", &stru_26BF72F58);
      }
      if (v145 == 2048) {
        CFDictionaryAddValue(v112, @"USE_NODE_OPACITY", &stru_26BF72F58);
      }
    }
    if ((EffectPropertyHashCode & 0x400) != 0) {
      char v114 = 0;
    }
    else {
      char v114 = v147;
    }
    if ((v114 & 1) == 0) {
      CFDictionaryAddValue(v112, @"DIFFUSE_PREMULTIPLIED", &stru_26BF72F58);
    }
    if (v145 == 2048) {
      CFDictionaryAddValue(v112, @"USE_TRANSPARENCY_RGBZERO", &stru_26BF72F58);
    }
    if (v67)
    {
      CFStringAppend(v111, v171);
      CFStringRef v115 = (const __CFString *)v174;
      CFRange v185 = CFStringFind(v110, @"__DoTexcoord__", 0);
      CFStringReplace(v110, v185, v115);
    }
    if ((LightingEnabled & v158) == 1)
    {
      CFStringAppend(v111, theString);
      CFDictionaryApplyFunction(v152, (CFDictionaryApplierFunction)__appendDictionary_0, v113);
      CFRange v186 = CFStringFind(v110, @"__DoLighting__", 0);
      CFStringReplace(v110, v186, v68);
    }
    CFStringAppend(v107, @"precision highp float;\n");
    CFMutableDictionaryRef v163 = v113;
    CFDictionaryApplyFunction(v113, (CFDictionaryApplierFunction)__AppendUniformsDeclaration, v107);
    CFAllocatorRef alloca = (CFAllocatorRef)v110;
    CFStringAppend(v111, v110);
    CFIndex v116 = CFDictionaryGetCount(v112);
    v117 = (const void **)malloc_type_malloc(8 * v116, 0x80040B8603338uLL);
    v118 = (const void **)malloc_type_malloc(8 * v116, 0x80040B8603338uLL);
    CFDictionaryGetKeysAndValues(v112, v117, v118);
    if (v116 >= 1)
    {
      v119 = v117;
      v120 = v118;
      do
      {
        uint64_t v122 = (uint64_t)*v119++;
        uint64_t v121 = v122;
        uint64_t v123 = (uint64_t)*v120++;
        CFStringAppendFormat(v107, 0, @"#define %@ %@\n", v121, v123);
        --v116;
      }
      while (v116);
    }
    free(v117);
    free(v118);
    CFStringAppend(v107, v111);
    CFRelease(v112);
    CFRelease(v163);
    CFRelease(v111);
    CFRelease(alloca);
    v65 = theDict;
    CFMutableStringRef v109 = theString;
    CFStringRef v68 = v168;
  }
  else
  {
    v124 = scn_default_log();
    if (os_log_type_enabled(v124, OS_LOG_TYPE_ERROR)) {
      -[SCNCommonProfileProgramGeneratorGL _newProgramWithHashCode:engineContext:introspectionDataPtr:]();
    }
  }
  CFRelease(v171);
  CFRelease(v172);
  CFRelease(v173);
  CFRelease(v174);
  CFRelease(appendedStringa);
  v125 = (__C3DFXProgram *)C3DFXGLSLProgramCreateWithSources(v83, v107);
  C3DFXProgramSetProfile((uint64_t)v125, 0);
  C3DCommonProfileShaderAssignAttributesAndUniformsIndexes(v125);
  CFRelease(v83);
  CFRelease(v107);
  CFRelease(v152);
  CFRelease(v68);
  CFRelease(v109);
  CFRelease(v65);
  return v125;
}

- (int)profile
{
  return self->_profile;
}

- (void)_newProgramWithHashCode:engineContext:introspectionDataPtr:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: failed to load fragment uber shader.", v2, v3, v4, v5, v6);
}

- (void)_newProgramWithHashCode:engineContext:introspectionDataPtr:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: failed to load vertex uber shader.", v2, v3, v4, v5, v6);
}

- (void)_newProgramWithHashCode:(uint8_t *)buf engineContext:(unsigned char *)a2 introspectionDataPtr:(os_log_t)log .cold.3(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: Physically based lighting model is not supported by the OpenGL renderer, using Phong instead (2)", buf, 2u);
}

- (void)_newProgramWithHashCode:(uint8_t *)buf engineContext:(void *)a2 introspectionDataPtr:(os_log_t)log .cold.4(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)uint8_t buf = 136315138;
  *a2 = "modCode";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Null argument", buf, 0xCu);
}

- (void)_newProgramWithHashCode:engineContext:introspectionDataPtr:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: cannot handle more than one lighting modifier", v2, v3, v4, v5, v6);
}

- (void)_newProgramWithHashCode:engineContext:introspectionDataPtr:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Physically based lighting model is not supported by the OpenGL renderer, using Phong instead (3)", v2, v3, v4, v5, v6);
}

@end