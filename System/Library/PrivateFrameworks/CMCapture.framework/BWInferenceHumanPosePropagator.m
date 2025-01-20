@interface BWInferenceHumanPosePropagator
- (BOOL)allowsAsyncPropagation;
- (BWInferenceHumanPosePropagator)initWithOutputRequirement:(id)a3;
- (__IOSurface)backingMemoryForMetadataRequirement:(id)a3 bindingName:(id)a4 surfaceProperties:(id)a5;
- (double)calculateIOU:(double)a3 with:(double)a4;
- (uint64_t)keypointsFromModelOutput:(unint64_t)a3 width:(unint64_t)a4 height:(uint64_t)a5 persons:;
- (void)dealloc;
- (void)newMatchesOfHumanPoses:(void *)a3 toTracks:;
- (void)propagateInferenceResultsToInferenceDictionary:(id)a3 usingStorage:(id)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 propagationSampleBuffer:(opaqueCMSampleBuffer *)a6;
@end

@implementation BWInferenceHumanPosePropagator

- (BWInferenceHumanPosePropagator)initWithOutputRequirement:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BWInferenceHumanPosePropagator;
  v4 = [(BWInferenceHumanPosePropagator *)&v6 init];
  if (v4) {
    v4->_outputRequirement = (BWInferenceMetadataRequirement *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  tensorBackingSurface = self->_tensorBackingSurface;
  if (tensorBackingSurface)
  {
    CFRelease(tensorBackingSurface);
    self->_tensorBackingSurface = 0;
  }

  v4.receiver = self;
  v4.super_class = (Class)BWInferenceHumanPosePropagator;
  [(BWInferenceHumanPosePropagator *)&v4 dealloc];
}

- (void)propagateInferenceResultsToInferenceDictionary:(id)a3 usingStorage:(id)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 propagationSampleBuffer:(opaqueCMSampleBuffer *)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v9 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  if (a4)
  {
    outputRequirement = self->_outputRequirement;
    uint64_t v11 = [a4 tensorForRequirement:outputRequirement];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __136__BWInferenceHumanPosePropagator_propagateInferenceResultsToInferenceDictionary_usingStorage_inputSampleBuffer_propagationSampleBuffer___block_invoke;
    v22[3] = &unk_1E5C28EC0;
    v22[4] = self;
    long long v23 = *(_OWORD *)(v11 + 80);
    v12 = (void *)[v22 copy];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v13 = [(BWInferenceMetadataRequirement *)outputRequirement metadataKeys];
    uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v19 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v24 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          v25 = v12;
          objc_msgSend(a3, "addEntriesFromDictionary:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
        }
        uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v15);
    }
  }
  if (*v9 == 1) {
    kdebug_trace();
  }
}

void *__136__BWInferenceHumanPosePropagator_propagateInferenceResultsToInferenceDictionary_usingStorage_inputSampleBuffer_propagationSampleBuffer___block_invoke(void *a1, void *a2)
{
  v3 = a1;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  IOSurfaceLock(*(IOSurfaceRef *)(a1[4] + 24), 5u, 0);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v5 = v3[4];
  BaseAddress = IOSurfaceGetBaseAddress(*(IOSurfaceRef *)(v5 + 24));
  -[BWInferenceHumanPosePropagator keypointsFromModelOutput:width:height:persons:](v5, BaseAddress, v3[5], v3[6], (uint64_t)v4);
  if ([v4 count])
  {
    uint64_t v24 = v3;
    v7 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend((id)objc_msgSend(a2, "observations"), "count"));
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v8 = (void *)[a2 observations];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v26 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          if ([v13 objectKind] == 1000)
          {
            uint64_t v14 = NSNumber;
            [v13 box];
            v29[0] = objc_msgSend(v14, "numberWithDouble:");
            uint64_t v15 = NSNumber;
            [v13 box];
            v29[1] = [v15 numberWithDouble:v16];
            v17 = NSNumber;
            [v13 box];
            v29[2] = [v17 numberWithDouble:v18];
            long long v19 = NSNumber;
            [v13 box];
            v29[3] = [v19 numberWithDouble:v20];
            uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:4];
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v21, objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "identifier")));
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v10);
    }
    if ([v7 count])
    {
      v3 = v24;
      v22 = -[BWInferenceHumanPosePropagator newMatchesOfHumanPoses:toTracks:](v24[4], v4, v7);
    }
    else
    {
      v22 = 0;
      v3 = v24;
    }
  }
  else
  {
    v22 = 0;
  }
  IOSurfaceUnlock(*(IOSurfaceRef *)(v3[4] + 24), 5u, 0);

  return v22;
}

- (uint64_t)keypointsFromModelOutput:(unint64_t)a3 width:(unint64_t)a4 height:(uint64_t)a5 persons:
{
  uint64_t v148 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  obint j = (id)[MEMORY[0x1E4F1CA48] array];
  if (!a2) {
    return 0;
  }
  v8 = *(void **)(a1 + 16);
  if (!v8)
  {
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:34 * a4 * a3];
    *(void *)(a1 + 16) = v8;
    if (!v8) {
      return 0;
    }
  }
  uint64_t v9 = (char *)objc_msgSend(v8, "mutableBytes", a5);
  if (!v9) {
    return 0;
  }
  uint64_t v10 = v9;
  memcpy(v9, a2, 34 * a4 * a3);
  uint64_t v11 = 0;
  v12 = v10 - 6;
  unint64_t v122 = a4 * a3;
  LOWORD(v13) = COERCE_UNSIGNED_INT(-1.0);
  do
  {
    if (a4)
    {
      uint64_t v14 = 0;
      LODWORD(v15) = 0;
      double v16 = &v10[2 * v122 * v11];
      int v17 = -3;
      do
      {
        if (a3)
        {
          uint64_t v18 = 0;
          uint64_t v15 = (int)v15;
          long long v19 = v12;
          do
          {
            _H1 = *(short float *)&v16[2 * v15];
            __asm { FCVT            S2, H1 }
            if (_S2 >= 0.1)
            {
              int v25 = -3;
              unsigned int v26 = v17;
              do
              {
                uint64_t v27 = 0;
                unint64_t v28 = (v25 + v14);
                BOOL v30 = (v28 & 0x80000000) != 0 || v28 >= a4;
                while (v30
                     || v18 + v27 - 3 < 0
                     || (v18 + v27 - 3) >= a3
                     || *(short float *)&v19[2 * v27 + 2 * a3 * v26] <= _H1)
                {
                  if (++v27 == 7) {
                    goto LABEL_27;
                  }
                }
                _H1 = _H1 + *(short float *)&v13;
                *(short float *)&v16[2 * v15] = _H1;
LABEL_27:
                ++v25;
                ++v26;
              }
              while (v25 != 4);
            }
            else
            {
              *(short float *)&v16[2 * v15] = _H1 + *(short float *)&v13;
            }
            ++v18;
            ++v15;
            v19 += 2;
          }
          while (v18 != a3);
        }
        ++v14;
        ++v17;
      }
      while (v14 != a4);
    }
    ++v11;
    v12 += 2 * a4 * a3;
  }
  while (v11 != 17);
  v119 = v10;
  uint64_t v31 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", v13);
  uint64_t v125 = 0;
  unint64_t v32 = 0x1E4F28000;
  unint64_t v33 = 0x1E4F1C000;
  do
  {
    if (a4)
    {
      uint64_t v124 = 0;
      LODWORD(v34) = 0;
      v35 = &v119[2 * v122 * v125];
      v120 = v35;
      while (!a3)
      {
LABEL_58:
        if (++v124 == a4) {
          goto LABEL_59;
        }
      }
      uint64_t v36 = 0;
      uint64_t v34 = (int)v34;
      while (1)
      {
        _H0 = *(_WORD *)&v35[2 * v34];
        __asm { FCVT            S0, H0 }
        if (_S0 > 0.1)
        {
          uint64_t v126 = v36;
          _H8 = *((_WORD *)a2 + v122 * (v125 + 17) + v34);
          long long v135 = 0u;
          long long v136 = 0u;
          long long v137 = 0u;
          long long v138 = 0u;
          uint64_t v40 = [v31 countByEnumeratingWithState:&v135 objects:v147 count:16];
          if (v40)
          {
            uint64_t v42 = v40;
            int v43 = 0;
            uint64_t v44 = *(void *)v136;
            __asm { FCVT            S8, H8 }
            LODWORD(v46) = -1;
            _H9 = 31744;
            do
            {
              for (uint64_t i = 0; i != v42; ++i)
              {
                if (*(void *)v136 != v44) {
                  objc_enumerationMutation(v31);
                }
                objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v135 + 1) + 8 * i), "objectAtIndexedSubscript:", 0), "floatValue");
                _S1 = _S8 - v49;
                float v51 = vabds_f32(_S8, v49);
                __asm
                {
                  FCVT            S2, H9
                  FCVT            H1, S1
                }
                short float v53 = fabsl(*(short float *)&_S1);
                if (v51 >= _S2) {
                  uint64_t v46 = v46;
                }
                else {
                  uint64_t v46 = (v43 + i);
                }
                if (v51 < _S2) {
                  *(short float *)&_H9 = v53;
                }
              }
              v43 += v42;
              uint64_t v42 = [v31 countByEnumeratingWithState:&v135 objects:v147 count:16];
            }
            while (v42);
            unint64_t v32 = 0x1E4F28000uLL;
            unint64_t v33 = 0x1E4F1C000uLL;
            v35 = &v119[2 * v122 * v125];
            if ((v46 & 0x80000000) == 0)
            {
              __asm { FCVT            S0, H9 }
              if (_S0 < 0.3)
              {
                v55 = (void *)[obj objectAtIndexedSubscript:v46];
                objc_msgSend((id)objc_msgSend((id)objc_msgSend(v31, "objectAtIndexedSubscript:", v46), "objectAtIndexedSubscript:", 0), "floatValue");
                float v57 = v56;
                objc_msgSend((id)objc_msgSend((id)objc_msgSend(v31, "objectAtIndexedSubscript:", v46), "objectAtIndexedSubscript:", 1), "floatValue");
                float v59 = _S8 + (float)(v57 * v58);
                float v60 = v58 + 1.0;
                *(float *)&double v61 = v59 / (float)(v58 + 1.0);
                v146[0] = [NSNumber numberWithFloat:v61];
                *(float *)&double v62 = v60;
                v146[1] = [NSNumber numberWithFloat:v62];
                objc_msgSend(v31, "setObject:atIndexedSubscript:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v146, 2), v46);
                _H0 = *(_WORD *)&v120[2 * v34];
                __asm { FCVT            S8, H0 }
                objc_msgSend((id)objc_msgSend((id)objc_msgSend(v55, "objectAtIndexedSubscript:", v125), "objectAtIndexedSubscript:", 2), "floatValue");
                uint64_t v36 = v126;
                if (v65 < _S8)
                {
                  v145[0] = [NSNumber numberWithInt:v126];
                  v145[1] = [NSNumber numberWithInt:v124];
                  _H0 = *(_WORD *)&v120[2 * v34];
                  __asm { FCVT            S0, H0 }
                  v145[2] = [NSNumber numberWithFloat:_D0];
                  objc_msgSend(v55, "setObject:atIndexedSubscript:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v145, 3), v125);
                }
                goto LABEL_57;
              }
            }
          }
          else
          {
            __asm { FCVT            S8, H8 }
          }
          *(float *)&double v41 = _S8;
          v144[0] = [*(id *)(v32 + 3792) numberWithFloat:v41];
          v144[1] = &unk_1EFB05968;
          objc_msgSend(v31, "addObject:", objc_msgSend(*(id *)(v33 + 2424), "arrayWithObjects:count:", v144, 2));
          v68 = (void *)[MEMORY[0x1E4F1CA48] array];
          int v69 = 17;
          do
          {
            [v68 addObject:&unk_1EFB03908];
            --v69;
          }
          while (v69);
          uint64_t v36 = v126;
          v143[0] = [*(id *)(v32 + 3792) numberWithInt:v126];
          v143[1] = [*(id *)(v32 + 3792) numberWithInt:v124];
          _H0 = *(_WORD *)&v35[2 * v34];
          __asm { FCVT            S0, H0 }
          v143[2] = [*(id *)(v32 + 3792) numberWithFloat:_D0];
          objc_msgSend(v68, "setObject:atIndexedSubscript:", objc_msgSend(*(id *)(v33 + 2424), "arrayWithObjects:count:", v143, 3), v125);
          [obj addObject:v68];
        }
LABEL_57:
        ++v36;
        ++v34;
        if (v36 == a3) {
          goto LABEL_58;
        }
      }
    }
LABEL_59:
    ++v125;
  }
  while (v125 != 17);
  long long v133 = 0u;
  long long v134 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  uint64_t v72 = [obj countByEnumeratingWithState:&v131 objects:v142 count:16];
  if (v72)
  {
    uint64_t v73 = v72;
    uint64_t v74 = *(void *)v132;
LABEL_62:
    uint64_t v75 = 0;
    while (1)
    {
      if (*(void *)v132 != v74) {
        objc_enumerationMutation(obj);
      }
      v76 = *(void **)(*((void *)&v131 + 1) + 8 * v75);
      if ([v76 count] != 17) {
        break;
      }
      if ([v76 count])
      {
        unint64_t v77 = 0;
        do
        {
          v78 = (void *)[v76 objectAtIndexedSubscript:v77];
          objc_msgSend((id)objc_msgSend(v78, "objectAtIndexedSubscript:", 2), "floatValue");
          if (v79 > 0.1)
          {
            int v80 = objc_msgSend((id)objc_msgSend(v78, "objectAtIndexedSubscript:", 0), "intValue");
            int v81 = objc_msgSend((id)objc_msgSend(v78, "objectAtIndexedSubscript:", 1), "intValue");
            float v83 = 0.0;
            int v84 = -3;
            float v85 = 0.0;
            double v86 = 0.0;
            do
            {
              unint64_t v87 = (v84 + v81);
              unint64_t v88 = v87 * a3;
              *(float *)&double v82 = (float)(int)v87;
              BOOL v90 = (v87 & 0x80000000) != 0 || v87 >= a4;
              for (int j = -3; j != 4; ++j)
              {
                unint64_t v92 = (v80 + j);
                char v93 = (v92 & 0x80000000) != 0 || v90;
                if ((v93 & 1) == 0 && v92 < a3)
                {
                  _H2 = *((_WORD *)a2 + v122 * v77 + v88 + v92);
                  __asm { FCVT            S2, H2 }
                  if (_S2 > 0.05)
                  {
                    float v83 = v83 + _S2;
                    *(float *)&double v86 = *(float *)&v86 + (float)(_S2 * (float)(int)v92);
                    float v85 = v85 + (float)(_S2 * *(float *)&v82);
                  }
                }
              }
              ++v84;
            }
            while (v84 != 4);
            if (v83 > 0.0)
            {
              *(float *)&double v86 = (float)(*(float *)&v86 / v83) + 0.5;
              v141[0] = objc_msgSend(NSNumber, "numberWithFloat:", v86, v82);
              *(float *)&double v96 = (float)(v85 / v83) + 0.5;
              v141[1] = [NSNumber numberWithFloat:v96];
              v141[2] = [v78 objectAtIndexedSubscript:2];
              objc_msgSend(v76, "setObject:atIndexedSubscript:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v141, 3), v77);
            }
          }
          ++v77;
        }
        while ([v76 count] > v77);
      }
      if (++v75 == v73)
      {
        uint64_t v73 = [obj countByEnumeratingWithState:&v131 objects:v142 count:16];
        if (v73) {
          goto LABEL_62;
        }
        goto LABEL_91;
      }
    }
  }
  else
  {
LABEL_91:
    long long v129 = 0u;
    long long v130 = 0u;
    long long v127 = 0u;
    long long v128 = 0u;
    uint64_t v97 = [obj countByEnumeratingWithState:&v127 objects:v140 count:16];
    if (v97)
    {
      uint64_t v98 = v97;
      uint64_t v99 = *(void *)v128;
      float v100 = (float)a3;
      float v101 = (float)a4;
      while (2)
      {
        for (uint64_t k = 0; k != v98; ++k)
        {
          if (*(void *)v128 != v99) {
            objc_enumerationMutation(obj);
          }
          v103 = *(void **)(*((void *)&v127 + 1) + 8 * k);
          if ([v103 count])
          {
            uint64_t v105 = 0;
            float v106 = 0.0;
            float v107 = 0.0;
            while (objc_msgSend((id)objc_msgSend(v103, "objectAtIndexedSubscript:", v105), "count") == 3)
            {
              v108 = NSNumber;
              objc_msgSend((id)objc_msgSend((id)objc_msgSend(v103, "objectAtIndexedSubscript:", v105), "objectAtIndexedSubscript:", 0), "floatValue");
              *(float *)&double v110 = v109 / v100;
              v139[0] = [v108 numberWithFloat:v110];
              v111 = NSNumber;
              objc_msgSend((id)objc_msgSend((id)objc_msgSend(v103, "objectAtIndexedSubscript:", v105), "objectAtIndexedSubscript:", 1), "floatValue");
              *(float *)&double v113 = v112 / v101;
              v139[1] = [v111 numberWithFloat:v113];
              v139[2] = objc_msgSend((id)objc_msgSend(v103, "objectAtIndexedSubscript:", v105), "objectAtIndexedSubscript:", 2);
              objc_msgSend(v103, "setObject:atIndexedSubscript:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v139, 3), v105);
              objc_msgSend((id)objc_msgSend((id)objc_msgSend(v103, "objectAtIndexedSubscript:", v105), "objectAtIndexedSubscript:", 2), "floatValue");
              if (v114 > 0.1)
              {
                objc_msgSend((id)objc_msgSend((id)objc_msgSend(v103, "objectAtIndexedSubscript:", v105), "objectAtIndexedSubscript:", 2), "floatValue");
                float v107 = v107 + v115;
                float v106 = v106 + 1.0;
              }
              if ([v103 count] <= (unint64_t)++v105)
              {
                if (v106 > 4.0)
                {
                  *(float *)&double v104 = v107 / v106;
                  if ((float)(v107 / v106) > 0.1) {
                    objc_msgSend(v118, "addObject:", v103, v104);
                  }
                }
                goto LABEL_105;
              }
            }
            return 0;
          }
LABEL_105:
          ;
        }
        uint64_t v98 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v127, v140, 16, v104);
        if (v98) {
          continue;
        }
        break;
      }
    }
  }
  return 0;
}

- (void)newMatchesOfHumanPoses:(void *)a3 toTracks:
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  id v6 = objc_alloc(MEMORY[0x1E4F1CA60]);
  obint j = a2;
  unint64_t v7 = [a2 count];
  BOOL v8 = v7 >= [a3 count];
  uint64_t v9 = a2;
  if (v8) {
    uint64_t v10 = a3;
  }
  else {
    uint64_t v10 = a2;
  }
  v50 = objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v10, "count"));
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  uint64_t v53 = [a3 countByEnumeratingWithState:&v63 objects:v71 count:16];
  if (v53)
  {
    uint64_t v52 = *(void *)v64;
    float v51 = a3;
    do
    {
      for (uint64_t i = 0; i != v53; ++i)
      {
        if (*(void *)v64 != v52) {
          objc_enumerationMutation(a3);
        }
        uint64_t v55 = *(void *)(*((void *)&v63 + 1) + 8 * i);
        v12 = objc_msgSend(a3, "objectForKeyedSubscript:");
        objc_msgSend((id)objc_msgSend(v12, "objectAtIndexedSubscript:", 0), "floatValue");
        float v14 = v13;
        objc_msgSend((id)objc_msgSend(v12, "objectAtIndexedSubscript:", 1), "floatValue");
        float v16 = v15;
        objc_msgSend((id)objc_msgSend(v12, "objectAtIndexedSubscript:", 2), "floatValue");
        float v18 = v17;
        objc_msgSend((id)objc_msgSend(v12, "objectAtIndexedSubscript:", 3), "floatValue");
        float v20 = v19;
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        uint64_t v21 = [v9 countByEnumeratingWithState:&v59 objects:v70 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v54 = i;
          int v23 = 0;
          int v24 = 0;
          double v57 = v18;
          double v58 = v20;
          double v25 = v16;
          double v26 = v14;
          uint64_t v27 = *(void *)v60;
          float v28 = 0.0;
          do
          {
            uint64_t v29 = 0;
            int v30 = v23;
            do
            {
              if (*(void *)v60 != v27) {
                objc_enumerationMutation(obj);
              }
              unint64_t v31 = 0;
              unint64_t v32 = *(void **)(*((void *)&v59 + 1) + 8 * v29);
              float v33 = 1.0;
              float v34 = 0.0;
              float v35 = 0.0;
              float v36 = 1.0;
              do
              {
                if (v31 < 9 || (v31 - 11) <= 1)
                {
                  v37 = (void *)[v32 objectAtIndexedSubscript:v31];
                  objc_msgSend((id)objc_msgSend(v37, "objectAtIndexedSubscript:", 2), "floatValue");
                  if (v38 > 0.1)
                  {
                    objc_msgSend((id)objc_msgSend(v37, "objectAtIndexedSubscript:", 0), "floatValue");
                    float v36 = fminf(v36, v39);
                    objc_msgSend((id)objc_msgSend(v37, "objectAtIndexedSubscript:", 1), "floatValue");
                    float v33 = fminf(v33, v40);
                    objc_msgSend((id)objc_msgSend(v37, "objectAtIndexedSubscript:", 0), "floatValue");
                    float v35 = fmaxf(v35, v41);
                    objc_msgSend((id)objc_msgSend(v37, "objectAtIndexedSubscript:", 1), "floatValue");
                    float v34 = fmaxf(v34, v42);
                  }
                }
                ++v31;
              }
              while (v31 != 13);
              double v43 = -[BWInferenceHumanPosePropagator calculateIOU:with:](a1, v26, v25, v57, v58, v36, v33, (float)(v35 - v36), (float)(v34 - v33));
              if (*(float *)&v43 > v28)
              {
                float v28 = *(float *)&v43;
                int v24 = v30;
              }
              ++v30;
              ++v29;
            }
            while (v29 != v22);
            v23 += v22;
            uint64_t v9 = obj;
            uint64_t v22 = [obj countByEnumeratingWithState:&v59 objects:v70 count:16];
          }
          while (v22);
          a3 = v51;
          uint64_t i = v54;
          if (v28 > 0.2)
          {
            uint64_t v44 = (void *)[obj objectAtIndexedSubscript:v24];
            v45 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v44, "count"));
            uint64_t v46 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v44, "count"));
            v47 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v44, "count"));
            if ([v44 count])
            {
              unint64_t v48 = 0;
              do
              {
                objc_msgSend(v45, "addObject:", objc_msgSend((id)objc_msgSend(v44, "objectAtIndexedSubscript:", v48), "objectAtIndexedSubscript:", 0));
                objc_msgSend(v46, "addObject:", objc_msgSend((id)objc_msgSend(v44, "objectAtIndexedSubscript:", v48), "objectAtIndexedSubscript:", 1));
                objc_msgSend(v47, "addObject:", objc_msgSend((id)objc_msgSend(v44, "objectAtIndexedSubscript:", v48++), "objectAtIndexedSubscript:", 2));
              }
              while (v48 < [v44 count]);
            }
            v67[2] = v47;
            v68 = @"human_pose";
            v67[0] = v45;
            v67[1] = v46;
            uint64_t v69 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:3];
            objc_msgSend(v50, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1), v55);
          }
        }
      }
      uint64_t v53 = [a3 countByEnumeratingWithState:&v63 objects:v71 count:16];
    }
    while (v53);
  }
  return v50;
}

- (BOOL)allowsAsyncPropagation
{
  return 1;
}

- (__IOSurface)backingMemoryForMetadataRequirement:(id)a3 bindingName:(id)a4 surfaceProperties:(id)a5
{
  result = self->_tensorBackingSurface;
  if (!result)
  {
    result = IOSurfaceCreate((CFDictionaryRef)a5);
    self->_tensorBackingSurface = result;
  }
  return result;
}

- (double)calculateIOU:(double)a3 with:(double)a4
{
  if (!a1) {
    return 0.0;
  }
  float v9 = fmax(a2, a6);
  float v10 = fmax(a3, a7);
  float v11 = fmin(a2 + a4, a6 + a8);
  float v12 = fmin(a3 + a5, a7 + a9);
  double result = fmax((float)(v11 - v9), 0.0) * fmax((float)(v12 - v10), 0.0);
  *(float *)&double result = result;
  float v13 = a4 * a5;
  float v14 = a8 * a9;
  *(float *)&double result = *(float *)&result / (float)((float)((float)(v13 + v14) - *(float *)&result) + 1.0e-12);
  return result;
}

@end