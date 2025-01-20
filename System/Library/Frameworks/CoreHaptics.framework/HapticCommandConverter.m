@interface HapticCommandConverter
- (HapticCommandConverter)initWithServerConfig:(id)a3;
- (HapticServerConfig)serverConfig;
- (float)limitDynamicParameter:(id)a3 value:(float)a4 parameter:(id)a5;
- (float)limitEventParameter:(id)a3 value:(float)a4 parameter:(id)a5 eventType:(id)a6;
- (id)CHtoAVParameterCurve:(id)a3;
- (id)eventForAudioEventType:(unint64_t)a3 time:(double)a4 eventParams:(id)a5 duration:(double)a6;
- (id)eventForContinuousHapticEventType:(int)a3 time:(double)a4 params:(id)a5 duration:(double)a6;
- (id)eventForDynamicParameterEntry:(id)a3;
- (id)eventForEventEntry:(id)a3 engine:(id)a4 privileged:(BOOL)a5;
- (id)eventForLegacyTransientHapticAtTime:(double)a3 params:(id)a4 duration:(double)a5;
- (id)eventForParameterCurveEntry:(id)a3;
- (id)eventForSPIEventType:(unint64_t)a3 time:(double)a4 eventParams:(id)a5 duration:(double)a6;
- (id)eventForTransientHapticAtTime:(double)a3 params:(id)a4 duration:(double)a5;
- (unint64_t)continuousHapticEventTypeForDefaultSharpness:(BOOL)a3;
- (unint64_t)continuousHapticEventTypeFromSharpness:(float)a3 sustained:(BOOL)a4;
- (unint64_t)eventTypeForBuiltInAudioEventType:(unint64_t)a3;
- (unint64_t)transientHapticEventTypeForDefaultSharpness;
- (unint64_t)transientHapticEventTypeFromSharpness:(float)a3;
@end

@implementation HapticCommandConverter

- (id)eventForTransientHapticAtTime:(double)a3 params:(id)a4 duration:(double)a5
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v58 = a4;
  if (kHAPIScope)
  {
    if (*(unsigned char *)(kHAPIScope + 8))
    {
      id v8 = *(id *)kHAPIScope;
      if (v8)
      {
        v9 = v8;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136316418;
          v72 = "HapticCommandConverter.mm";
          __int16 v73 = 1024;
          int v74 = 212;
          __int16 v75 = 2080;
          v76 = "-[HapticCommandConverter eventForTransientHapticAtTime:params:duration:]";
          __int16 v77 = 2048;
          double v78 = a3;
          __int16 v79 = 2048;
          double v80 = a5;
          __int16 v81 = 1024;
          int v82 = [v58 count];
          _os_log_impl(&dword_1BA902000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Time: %.2f secs dur %.2f secs %u event params", buf, 0x36u);
        }
      }
    }
  }
  __p = 0;
  v68 = 0;
  v69 = 0;
  v62 = +[CHHapticEngine capabilitiesForHardware];
  v10 = [(HapticCommandConverter *)self serverConfig];
  [v10 defaultHapticTransientEventIntensity];
  float v12 = v11;

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id obj = v58;
  uint64_t v13 = [obj countByEnumeratingWithState:&v63 objects:v70 count:16];
  if (v13)
  {
    unint64_t v60 = 0;
    char v59 = 0;
    uint64_t v14 = *(void *)v64;
    while (1)
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v64 != v14) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v63 + 1) + 8 * v15);
        if (kHAPIScope)
        {
          if (*(unsigned char *)(kHAPIScope + 8))
          {
            id v17 = *(id *)kHAPIScope;
            if (v17)
            {
              v18 = v17;
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
              {
                double v19 = [v16 parameterID];
                [v16 value];
                *(_DWORD *)buf = 136316162;
                v72 = "HapticCommandConverter.mm";
                __int16 v73 = 1024;
                int v74 = 221;
                __int16 v75 = 2080;
                v76 = "-[HapticCommandConverter eventForTransientHapticAtTime:params:duration:]";
                __int16 v77 = 2112;
                double v78 = v19;
                __int16 v79 = 2048;
                double v80 = v20;
                _os_log_impl(&dword_1BA902000, v18, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Fixed Param '%@': value: %f", buf, 0x30u);
              }
            }
          }
        }
        [v16 value];
        int v22 = v21;
        v23 = [v16 parameterID];
        LODWORD(v24) = v22;
        [(HapticCommandConverter *)self limitEventParameter:v62 value:v23 parameter:CHHapticEventTypeHapticTransient eventType:v24];
        float v26 = v25;

        v27 = [v16 parameterID];
        char v28 = [v27 isEqualToString:CHHapticEventParameterIDHapticIntensity];

        if (v28)
        {
          float v12 = v26;
          goto LABEL_40;
        }
        v29 = [v16 parameterID];
        int v30 = [v29 isEqualToString:CHHapticEventParameterIDHapticSharpness];

        if (v30)
        {
          *(float *)&double v31 = v26;
          unint64_t v60 = [(HapticCommandConverter *)self transientHapticEventTypeFromSharpness:v31];
          if (kHAPIScope)
          {
            if (*(unsigned char *)(kHAPIScope + 8))
            {
              v32 = *(id *)kHAPIScope;
              if (v32)
              {
                v33 = v32;
                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 136316162;
                  v72 = "HapticCommandConverter.mm";
                  __int16 v73 = 1024;
                  int v74 = 229;
                  __int16 v75 = 2080;
                  v76 = "-[HapticCommandConverter eventForTransientHapticAtTime:params:duration:]";
                  __int16 v77 = 2048;
                  double v78 = v26;
                  __int16 v79 = 1024;
                  LODWORD(v80) = v60;
                  _os_log_impl(&dword_1BA902000, v33, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Normalized sharpness %f -> event type %u", buf, 0x2Cu);
                }
                char v59 = 1;
LABEL_38:

                goto LABEL_40;
              }
            }
          }
          char v59 = 1;
          goto LABEL_40;
        }
        v34 = [v16 parameterID];
        if ([v34 isEqualToString:CHHapticEventParameterIDAttackTime]) {
          goto LABEL_32;
        }
        v35 = [v16 parameterID];
        if ([v35 isEqualToString:CHHapticEventParameterIDDecayTime]) {
          goto LABEL_31;
        }
        v36 = [v16 parameterID];
        if ([v36 isEqualToString:CHHapticEventParameterIDReleaseTime])
        {

LABEL_31:
LABEL_32:

          goto LABEL_33;
        }
        v38 = [v16 parameterID];
        char v39 = [v38 isEqualToString:CHHapticEventParameterIDSustained];

        if ((v39 & 1) == 0)
        {
          if (kHAPIScope)
          {
            id v51 = *(id *)kHAPIScope;
            if (!v51) {
              goto LABEL_79;
            }
          }
          else
          {
            id v51 = (id)MEMORY[0x1E4F14500];
            id v54 = MEMORY[0x1E4F14500];
          }
          v55 = v51;
          if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
          {
            double v56 = [v16 parameterID];
            *(_DWORD *)buf = 136315906;
            v72 = "HapticCommandConverter.mm";
            __int16 v73 = 1024;
            int v74 = 239;
            __int16 v75 = 2080;
            v76 = "-[HapticCommandConverter eventForTransientHapticAtTime:params:duration:]";
            __int16 v77 = 2112;
            double v78 = v56;
            _os_log_impl(&dword_1BA902000, v55, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Unknown event param type: %@", buf, 0x26u);
          }
LABEL_79:
          Haptic_RaiseException(&cfstr_Corehapticinva.isa, &cfstr_UnknownEventPa.isa, -4820);
        }
LABEL_33:
        if (kHAPIScope)
        {
          if (*(unsigned char *)(kHAPIScope + 8))
          {
            v37 = *(id *)kHAPIScope;
            if (v37)
            {
              v33 = v37;
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315650;
                v72 = "HapticCommandConverter.mm";
                __int16 v73 = 1024;
                int v74 = 236;
                __int16 v75 = 2080;
                v76 = "-[HapticCommandConverter eventForTransientHapticAtTime:params:duration:]";
                _os_log_impl(&dword_1BA902000, v33, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Ignoring for HapticTransient", buf, 0x1Cu);
              }
              goto LABEL_38;
            }
          }
        }
LABEL_40:
        ++v15;
      }
      while (v13 != v15);
      uint64_t v40 = [obj countByEnumeratingWithState:&v63 objects:v70 count:16];
      uint64_t v13 = v40;
      if (!v40)
      {

        if (v59) {
          goto LABEL_54;
        }
        goto LABEL_48;
      }
    }
  }

LABEL_48:
  unint64_t v60 = [(HapticCommandConverter *)self transientHapticEventTypeForDefaultSharpness];
  if (kHAPIScope)
  {
    if (*(unsigned char *)(kHAPIScope + 8))
    {
      v41 = *(id *)kHAPIScope;
      if (v41)
      {
        v42 = v41;
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315906;
          v72 = "HapticCommandConverter.mm";
          __int16 v73 = 1024;
          int v74 = 246;
          __int16 v75 = 2080;
          v76 = "-[HapticCommandConverter eventForTransientHapticAtTime:params:duration:]";
          __int16 v77 = 1024;
          LODWORD(v78) = v60;
          _os_log_impl(&dword_1BA902000, v42, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Event has no HapticSharpness EventParameter. Default event type: %u", buf, 0x22u);
        }
      }
    }
  }
LABEL_54:
  if (v12 == 1.0)
  {
    v45 = 0;
    v50 = 0;
  }
  else
  {
    if (kHAPIScope)
    {
      if (*(unsigned char *)(kHAPIScope + 8))
      {
        v43 = *(id *)kHAPIScope;
        if (v43)
        {
          v44 = v43;
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315906;
            v72 = "HapticCommandConverter.mm";
            __int16 v73 = 1024;
            int v74 = 250;
            __int16 v75 = 2080;
            v76 = "-[HapticCommandConverter eventForTransientHapticAtTime:params:duration:]";
            __int16 v77 = 2048;
            double v78 = v12;
            _os_log_impl(&dword_1BA902000, v44, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Adding event param for haptic gain: %.2f", buf, 0x26u);
          }
        }
      }
    }
    v45 = (float *)std::__allocate_at_least[abi:ne180100]<std::allocator<AVHapticPlayerFixedParameter>>((uint64_t)&v69, 1uLL);
    v46 = (char *)__p;
    v47 = v68;
    v49 = &v45[4 * v48];
    *(void *)v45 = 2000;
    v45[2] = v12;
    v50 = v45 + 4;
    if (v47 != v46)
    {
      do
      {
        *((_OWORD *)v45 - 1) = *((_OWORD *)v47 - 1);
        v45 -= 4;
        v47 -= 16;
      }
      while (v47 != v46);
      v46 = (char *)__p;
    }
    __p = v45;
    v68 = (char *)v50;
    v69 = v49;
    if (v46)
    {
      operator delete(v46);
      v45 = (float *)__p;
    }
    v68 = (char *)v50;
  }
  if (v50 == v45) {
    v52 = 0;
  }
  else {
    v52 = v45;
  }
  v53 = [MEMORY[0x1E4F4EAC0] eventWithEventType:v60 time:v52 parameters:((char *)v50 - (char *)v45) >> 4 count:a3 duration:a5];

  if (__p)
  {
    v68 = (char *)__p;
    operator delete(__p);
  }

  return v53;
}

- (float)limitEventParameter:(id)a3 value:(float)a4 parameter:(id)a5 eventType:(id)a6
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v7 = [a3 attributesForEventParameter:a5 eventType:a6 error:0];
  id v8 = v7;
  if (!v7)
  {
    if (kHAPIScope)
    {
      uint64_t v13 = *(id *)kHAPIScope;
      if (!v13)
      {
LABEL_14:
        float v12 = 0.0;
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v13 = MEMORY[0x1E4F14500];
      id v14 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136315650;
      id v17 = "HapticCommandConverter.mm";
      __int16 v18 = 1024;
      int v19 = 99;
      __int16 v20 = 2080;
      int v21 = "-[HapticCommandConverter limitEventParameter:value:parameter:eventType:]";
      _os_log_impl(&dword_1BA902000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Invalid event parameter ID.", (uint8_t *)&v16, 0x1Cu);
    }

    goto LABEL_14;
  }
  [v7 minValue];
  float v10 = v9;
  [v8 maxValue];
  if (v11 >= a4) {
    float v11 = a4;
  }
  if (v11 >= v10) {
    float v12 = v11;
  }
  else {
    float v12 = v10;
  }
LABEL_15:

  return v12;
}

- (id)eventForLegacyTransientHapticAtTime:(double)a3 params:(id)a4 duration:(double)a5
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  id v74 = a4;
  if (kHAPIScope)
  {
    if (*(unsigned char *)(kHAPIScope + 8))
    {
      id v7 = *(id *)kHAPIScope;
      if (v7)
      {
        id v8 = v7;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136316418;
          v90 = "HapticCommandConverter.mm";
          __int16 v91 = 1024;
          int v92 = 270;
          __int16 v93 = 2080;
          v94 = "-[HapticCommandConverter eventForLegacyTransientHapticAtTime:params:duration:]";
          __int16 v95 = 2048;
          double v96 = a3;
          __int16 v97 = 2048;
          double v98 = a5;
          __int16 v99 = 1024;
          int v100 = [v74 count];
          _os_log_impl(&dword_1BA902000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Time: %.2f secs dur %.2f secs %u event params", buf, 0x36u);
        }
      }
    }
  }
  __p = 0;
  v86 = 0;
  v87 = 0;
  __int16 v79 = +[CHHapticEngine capabilitiesForHardware];
  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id obj = v74;
  uint64_t v9 = [obj countByEnumeratingWithState:&v81 objects:v88 count:16];
  if (!v9)
  {

    int v57 = 1;
    int v56 = 3;
    goto LABEL_90;
  }
  char v10 = 0;
  uint64_t v11 = *(void *)v82;
  int v76 = 3;
  char v77 = 0;
  int v75 = 1;
  do
  {
    uint64_t v12 = 0;
    do
    {
      if (*(void *)v82 != v11) {
        objc_enumerationMutation(obj);
      }
      uint64_t v13 = *(void **)(*((void *)&v81 + 1) + 8 * v12);
      if (kHAPIScope)
      {
        if (*(unsigned char *)(kHAPIScope + 8))
        {
          id v14 = *(id *)kHAPIScope;
          if (v14)
          {
            uint64_t v15 = v14;
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            {
              int v16 = [v13 parameterID];
              [v13 value];
              *(_DWORD *)buf = 136316162;
              v90 = "HapticCommandConverter.mm";
              __int16 v91 = 1024;
              int v92 = 276;
              __int16 v93 = 2080;
              v94 = "-[HapticCommandConverter eventForLegacyTransientHapticAtTime:params:duration:]";
              __int16 v95 = 2112;
              double v96 = *(double *)&v16;
              __int16 v97 = 2048;
              double v98 = v17;
              _os_log_impl(&dword_1BA902000, v15, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Fixed Param '%@': value: %f", buf, 0x30u);
            }
          }
        }
      }
      __int16 v18 = [v13 parameterID];
      int v19 = [v18 isEqualToString:CHHapticEventParameterIDHapticIntensity];

      if (v19)
      {
        [v13 value];
        int v21 = v20;
        uint64_t v22 = [v13 parameterID];
        LODWORD(v23) = v21;
        [(HapticCommandConverter *)self limitEventParameter:v79 value:v22 parameter:CHHapticEventTypeHapticTransient eventType:v23];
        int v25 = v24;

        float v26 = v86;
        if (v86 >= v87)
        {
          char v39 = (char *)__p;
          uint64_t v40 = (v86 - (unsigned char *)__p) >> 4;
          unint64_t v41 = v40 + 1;
          if ((unint64_t)(v40 + 1) >> 60) {
            std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v42 = v87 - (unsigned char *)__p;
          if ((v87 - (unsigned char *)__p) >> 3 > v41) {
            unint64_t v41 = v42 >> 3;
          }
          if ((unint64_t)v42 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v43 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v43 = v41;
          }
          if (v43)
          {
            v44 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<AVHapticPlayerFixedParameter>>((uint64_t)&v87, v43);
            char v39 = (char *)__p;
            float v26 = v86;
          }
          else
          {
            v44 = 0;
          }
          v47 = &v44[16 * v40];
          *(void *)v47 = 2000;
          *((_DWORD *)v47 + 2) = v25;
          uint64_t v48 = v47;
          if (v26 != v39)
          {
            do
            {
              *((_OWORD *)v48 - 1) = *((_OWORD *)v26 - 1);
              v48 -= 16;
              v26 -= 16;
            }
            while (v26 != v39);
            char v39 = (char *)__p;
          }
          v27 = v47 + 16;
          __p = v48;
          v86 = v47 + 16;
          v87 = &v44[16 * v43];
          if (v39) {
            operator delete(v39);
          }
        }
        else
        {
          *(void *)v86 = 2000;
          *((_DWORD *)v26 + 2) = v25;
          v27 = v26 + 16;
        }
        v86 = v27;
        goto LABEL_64;
      }
      char v28 = [v13 parameterID];
      int v29 = [v28 isEqualToString:CHHapticEventParameterIDHapticSharpnessSelect];

      if (v29)
      {
        if ((v10 & 1) == 0)
        {
          [v13 value];
          if (v30 > 1.0) {
            float v30 = 1.0;
          }
          if (v30 < -1.0) {
            float v30 = -1.0;
          }
          float v31 = (v30 + 1.0) * 0.5;
          int v76 = (int)((float)(v31 * 7.0) + 0.5);
          if (kHAPIScope)
          {
            if (*(unsigned char *)(kHAPIScope + 8))
            {
              v32 = *(id *)kHAPIScope;
              if (v32)
              {
                v33 = v32;
                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 136316162;
                  v90 = "HapticCommandConverter.mm";
                  __int16 v91 = 1024;
                  int v92 = 291;
                  __int16 v93 = 2080;
                  v94 = "-[HapticCommandConverter eventForLegacyTransientHapticAtTime:params:duration:]";
                  __int16 v95 = 2048;
                  double v96 = v31;
                  __int16 v97 = 1024;
                  LODWORD(v98) = (int)((float)(v31 * 7.0) + 0.5);
                  _os_log_impl(&dword_1BA902000, v33, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Normalized value %f -> sharpness index %d", buf, 0x2Cu);
                }
                goto LABEL_44;
              }
            }
          }
          goto LABEL_45;
        }
        if (kHAPIScope)
        {
          long long v63 = *(id *)kHAPIScope;
          if (!v63)
          {
LABEL_97:
            int v64 = -4830;
            long long v65 = @"Cannot mix privileged and unprivileged Sharpness parameters";
            goto LABEL_114;
          }
        }
        else
        {
          long long v63 = MEMORY[0x1E4F14500];
          id v66 = MEMORY[0x1E4F14500];
        }
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v90 = "HapticCommandConverter.mm";
          __int16 v91 = 1024;
          int v92 = 283;
          __int16 v93 = 2080;
          v94 = "-[HapticCommandConverter eventForLegacyTransientHapticAtTime:params:duration:]";
          goto LABEL_104;
        }
        goto LABEL_105;
      }
      v34 = [v13 parameterID];
      int v35 = [v34 isEqualToString:CHHapticEventParameterIDHapticFullnessSelect];

      if (v35)
      {
        if (v10)
        {
          if (kHAPIScope)
          {
            long long v63 = *(id *)kHAPIScope;
            if (!v63)
            {
              int v64 = -4830;
              long long v65 = @"Cannot mix Fullness with unprivileged Sharpness parameter";
              goto LABEL_114;
            }
          }
          else
          {
            long long v63 = MEMORY[0x1E4F14500];
            id v67 = MEMORY[0x1E4F14500];
          }
          if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v90 = "HapticCommandConverter.mm";
            __int16 v91 = 1024;
            int v92 = 296;
            __int16 v93 = 2080;
            v94 = "-[HapticCommandConverter eventForLegacyTransientHapticAtTime:params:duration:]";
            _os_log_impl(&dword_1BA902000, v63, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Cannot mix Fullness with unprivileged Sharpness parameter", buf, 0x1Cu);
          }
          int v64 = -4830;
          long long v65 = @"Cannot mix Fullness with unprivileged Sharpness parameter";
          goto LABEL_113;
        }
        [v13 value];
        if (v36 > 1.0) {
          float v36 = 1.0;
        }
        if (v36 < -1.0) {
          float v36 = -1.0;
        }
        float v37 = (v36 + 1.0) * 0.5;
        int v75 = (int)((float)(v37 + v37) + 0.5);
        if (kHAPIScope)
        {
          if (*(unsigned char *)(kHAPIScope + 8))
          {
            v38 = *(id *)kHAPIScope;
            if (v38)
            {
              v33 = v38;
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136316162;
                v90 = "HapticCommandConverter.mm";
                __int16 v91 = 1024;
                int v92 = 304;
                __int16 v93 = 2080;
                v94 = "-[HapticCommandConverter eventForLegacyTransientHapticAtTime:params:duration:]";
                __int16 v95 = 2048;
                double v96 = v37;
                __int16 v97 = 1024;
                LODWORD(v98) = (int)((float)(v37 + v37) + 0.5);
                _os_log_impl(&dword_1BA902000, v33, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Normalized value %f -> fullness index %d", buf, 0x2Cu);
              }
LABEL_44:
            }
          }
        }
LABEL_45:
        char v10 = 0;
        char v77 = 1;
        goto LABEL_64;
      }
      v45 = [v13 parameterID];
      int v46 = [v45 isEqualToString:CHHapticEventParameterIDHapticSharpness];

      if (v46)
      {
        if ((v77 & 1) == 0)
        {
          char v77 = 0;
          char v10 = 1;
          goto LABEL_64;
        }
        if (kHAPIScope)
        {
          long long v63 = *(id *)kHAPIScope;
          if (!v63) {
            goto LABEL_97;
          }
        }
        else
        {
          long long v63 = MEMORY[0x1E4F14500];
          id v69 = MEMORY[0x1E4F14500];
        }
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v90 = "HapticCommandConverter.mm";
          __int16 v91 = 1024;
          int v92 = 309;
          __int16 v93 = 2080;
          v94 = "-[HapticCommandConverter eventForLegacyTransientHapticAtTime:params:duration:]";
LABEL_104:
          _os_log_impl(&dword_1BA902000, v63, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Cannot mix privileged and unprivileged Sharpness parameters", buf, 0x1Cu);
        }
LABEL_105:
        int v64 = -4830;
        long long v65 = @"Cannot mix privileged and unprivileged Sharpness parameters";
        goto LABEL_113;
      }
      v49 = [v13 parameterID];
      if (([v49 isEqualToString:CHHapticEventParameterIDAttackTime] & 1) == 0)
      {
        v50 = [v13 parameterID];
        if (([v50 isEqualToString:CHHapticEventParameterIDDecayTime] & 1) == 0)
        {
          id v51 = [v13 parameterID];
          if (![v51 isEqualToString:CHHapticEventParameterIDReleaseTime])
          {
            id v54 = [v13 parameterID];
            char v73 = [v54 isEqualToString:CHHapticEventParameterIDSustained];

            if ((v73 & 1) == 0)
            {
              if (kHAPIScope)
              {
                id v70 = *(id *)kHAPIScope;
                if (!v70)
                {
                  int v64 = -4820;
                  long long v65 = @"Unknown event parameter type";
LABEL_114:
                  Haptic_RaiseException(&cfstr_Corehapticsbad.isa, &v65->isa, v64);
                }
              }
              else
              {
                id v70 = (id)MEMORY[0x1E4F14500];
                id v71 = MEMORY[0x1E4F14500];
              }
              long long v63 = v70;
              if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
              {
                v72 = [v13 parameterID];
                *(_DWORD *)buf = 136315906;
                v90 = "HapticCommandConverter.mm";
                __int16 v91 = 1024;
                int v92 = 324;
                __int16 v93 = 2080;
                v94 = "-[HapticCommandConverter eventForLegacyTransientHapticAtTime:params:duration:]";
                __int16 v95 = 2112;
                double v96 = *(double *)&v72;
                _os_log_impl(&dword_1BA902000, v63, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Unknown event parameter type: %@", buf, 0x26u);
              }
              int v64 = -4820;
              long long v65 = @"Unknown event parameter type";
LABEL_113:

              goto LABEL_114;
            }
            goto LABEL_72;
          }
        }
      }

LABEL_72:
      if (kHAPIScope)
      {
        if (*(unsigned char *)(kHAPIScope + 8))
        {
          v52 = *(id *)kHAPIScope;
          if (v52)
          {
            v53 = v52;
            if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315650;
              v90 = "HapticCommandConverter.mm";
              __int16 v91 = 1024;
              int v92 = 321;
              __int16 v93 = 2080;
              v94 = "-[HapticCommandConverter eventForLegacyTransientHapticAtTime:params:duration:]";
              _os_log_impl(&dword_1BA902000, v53, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Ignoring for HapticTransient", buf, 0x1Cu);
            }
          }
        }
      }
LABEL_64:
      ++v12;
    }
    while (v12 != v9);
    uint64_t v55 = [obj countByEnumeratingWithState:&v81 objects:v88 count:16];
    uint64_t v9 = v55;
  }
  while (v55);

  int v56 = v76;
  int v57 = v75;
  if ((v10 & 1) == 0)
  {
LABEL_90:
    if (v86 == __p) {
      v61 = 0;
    }
    else {
      v61 = __p;
    }
    uint64_t v60 = [MEMORY[0x1E4F4EAC0] eventWithEventType:sLegacyHapticTapTypes[8 * (uint64_t)v57 + v56] time:v61 parameters:(v86 - (unsigned char *)__p) >> 4 count:a3 duration:a5];
    goto LABEL_94;
  }
  if (kHAPIScope)
  {
    if (*(unsigned char *)(kHAPIScope + 8))
    {
      id v58 = *(id *)kHAPIScope;
      if (v58)
      {
        char v59 = v58;
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          v90 = "HapticCommandConverter.mm";
          __int16 v91 = 1024;
          int v92 = 333;
          __int16 v93 = 2080;
          v94 = "-[HapticCommandConverter eventForLegacyTransientHapticAtTime:params:duration:]";
          _os_log_impl(&dword_1BA902000, v59, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Handling as a non-privileged event", buf, 0x1Cu);
        }
      }
    }
  }
  uint64_t v60 = [(HapticCommandConverter *)self eventForTransientHapticAtTime:obj params:a3 duration:a5];
LABEL_94:
  v62 = (void *)v60;

  if (__p)
  {
    v86 = (char *)__p;
    operator delete(__p);
  }

  return v62;
}

- (unint64_t)transientHapticEventTypeFromSharpness:(float)a3
{
  v4 = [(HapticCommandConverter *)self serverConfig];
  v5 = v4;
  if (v4)
  {
    [v4 hapticTransientIDs];
  }
  else
  {
    uint64_t v9 = 0;
    char v10 = 0;
  }

  if (v9 != (void *)v10)
  {
    unint64_t v6 = v9[(int)((float)((float)(unint64_t)(((v10 - (unsigned char *)v9) >> 3) - 1) * a3) + 0.5)];
LABEL_7:
    operator delete(v9);
    return v6;
  }
  unint64_t v6 = 0;
  unint64_t v7 = 0;
  if (v9) {
    goto LABEL_7;
  }
  return v7;
}

- (HapticServerConfig)serverConfig
{
  return (HapticServerConfig *)objc_getProperty(self, a2, 8, 1);
}

- (HapticCommandConverter)initWithServerConfig:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HapticCommandConverter;
  unint64_t v6 = [(HapticCommandConverter *)&v9 init];
  unint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_serverConfig, a3);
  }

  return v7;
}

- (id)eventForEventEntry:(id)a3 engine:(id)a4 privileged:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  char v10 = [v8 eventParameters];
  [v8 relativeTime];
  double v12 = v11;
  [v8 duration];
  double v14 = v13;
  uint64_t v15 = [v9 serverConfig];
  [v15 hapticContinuousTimeLimit];
  float v17 = v16;

  if (kHAPIScope)
  {
    if (*(unsigned char *)(kHAPIScope + 8))
    {
      id v18 = *(id *)kHAPIScope;
      if (v18)
      {
        int v19 = v18;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          int v20 = [v8 type];
          int v65 = 136315906;
          id v66 = "HapticCommandConverter.mm";
          __int16 v67 = 1024;
          int v68 = 479;
          __int16 v69 = 2080;
          id v70 = "-[HapticCommandConverter eventForEventEntry:engine:privileged:]";
          __int16 v71 = 2112;
          double v72 = *(double *)&v20;
          _os_log_impl(&dword_1BA902000, v19, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Event type '%@':", (uint8_t *)&v65, 0x26u);
        }
      }
    }
  }
  if (v12 < 0.0)
  {
    if (kHAPIScope)
    {
      int v21 = *(id *)kHAPIScope;
      if (!v21)
      {
        int v22 = -4822;
        double v23 = @"Illegal time value";
        int v24 = @"CoreHapticInvalidEventTimeException";
        goto LABEL_35;
      }
    }
    else
    {
      int v21 = MEMORY[0x1E4F14500];
      id v28 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      int v65 = 136315906;
      id v66 = "HapticCommandConverter.mm";
      __int16 v67 = 1024;
      int v68 = 481;
      __int16 v69 = 2080;
      id v70 = "-[HapticCommandConverter eventForEventEntry:engine:privileged:]";
      __int16 v71 = 2048;
      double v72 = v12;
      _os_log_impl(&dword_1BA902000, v21, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Illegal time value: %f", (uint8_t *)&v65, 0x26u);
    }
    int v22 = -4822;
    double v23 = @"Illegal time value";
    int v24 = @"CoreHapticInvalidEventTimeException";
    goto LABEL_34;
  }
  if (v14 < 0.0)
  {
    if (kHAPIScope)
    {
      int v21 = *(id *)kHAPIScope;
      if (!v21)
      {
        int v22 = -4823;
        double v23 = @"Illegal event duration";
        int v24 = @"CoreHapticInvalidEventDurationException";
        goto LABEL_35;
      }
    }
    else
    {
      int v21 = MEMORY[0x1E4F14500];
      id v32 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      int v65 = 136315906;
      id v66 = "HapticCommandConverter.mm";
      __int16 v67 = 1024;
      int v68 = 486;
      __int16 v69 = 2080;
      id v70 = "-[HapticCommandConverter eventForEventEntry:engine:privileged:]";
      __int16 v71 = 2048;
      double v72 = v14;
      _os_log_impl(&dword_1BA902000, v21, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Illegal duration value: %f", (uint8_t *)&v65, 0x26u);
    }
    int v22 = -4823;
    double v23 = @"Illegal event duration";
    int v24 = @"CoreHapticInvalidEventDurationException";
LABEL_34:

LABEL_35:
    Haptic_RaiseException(&v24->isa, &v23->isa, v22);
  }
  int v25 = [v8 type];
  int v26 = [v25 isEqualToString:CHHapticEventTypeHapticTransient];

  if (!v26)
  {
    int v29 = [v8 type];
    int v30 = [v29 isEqualToString:CHHapticEventTypeHapticContinuous];

    if (!v30)
    {
      v34 = [v8 type];
      int v35 = [v34 isEqualToString:CHHapticEventTypeAudioContinuous];

      if (v35)
      {
        uint64_t v37 = [(HapticCommandConverter *)self eventTypeForBuiltInAudioEventType:32513];
        if (v10 && [v10 indexOfObjectPassingTest:&__block_literal_global_43] != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v37 = [(HapticCommandConverter *)self eventTypeForBuiltInAudioEventType:32514];
        }
        else if (v14 == 0.0)
        {
          v38 = CALog::LogObjIfEnabled((CALog *)1, kHAPIScope, v36);
          char v39 = v38;
          if (v38 && os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            int v65 = 136315650;
            id v66 = "HapticCommandConverter.mm";
            __int16 v67 = 1024;
            int v68 = 535;
            __int16 v69 = 2080;
            id v70 = "-[HapticCommandConverter eventForEventEntry:engine:privileged:]";
            _os_log_impl(&dword_1BA902000, v39, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Continuous audio event has a missing or zero-length duration", (uint8_t *)&v65, 0x1Cu);
          }

          Haptic_RaiseException(&cfstr_Corehapticinva_1.isa, &cfstr_IllegalOrMissi.isa, -4823);
        }
      }
      else
      {
        uint64_t v40 = [v8 type];
        int v41 = [v40 isEqualToString:CHHapticEventTypeAudioCustom];

        if (!v41)
        {
          if (v5)
          {
            v52 = [v8 type];
            int v53 = [v52 isEqualToString:CHHapticEventTypeWheelsOfTime];

            if (v53)
            {
              uint64_t v27 = [(HapticCommandConverter *)self eventForSPIEventType:[(HapticCommandConverter *)self eventTypeForBuiltInAudioEventType:32556] time:v10 eventParams:v12 duration:v14];
              goto LABEL_82;
            }
            uint64_t v60 = [v8 type];
            int v61 = [v60 isEqualToString:CHHapticEventTypeAudioClick];

            if (v61)
            {
              uint64_t v27 = [(HapticCommandConverter *)self eventForSPIEventType:[(HapticCommandConverter *)self eventTypeForBuiltInAudioEventType:32555] time:v10 eventParams:v12 duration:v14];
              goto LABEL_82;
            }
            long long v63 = CALog::LogObjIfEnabled((CALog *)1, kHAPIScope, v62);
            int v21 = v63;
            if (v63)
            {
              int v21 = v63;
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                int v64 = [v8 type];
                int v65 = 136315906;
                id v66 = "HapticCommandConverter.mm";
                __int16 v67 = 1024;
                int v68 = 573;
                __int16 v69 = 2080;
                id v70 = "-[HapticCommandConverter eventForEventEntry:engine:privileged:]";
                __int16 v71 = 2112;
                double v72 = *(double *)&v64;
                _os_log_impl(&dword_1BA902000, v21, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Unknown privileged event type: %@", (uint8_t *)&v65, 0x26u);
              }
            }
            int v22 = -4821;
            double v23 = @"Unknown privileged event type";
          }
          else
          {
            id v58 = CALog::LogObjIfEnabled((CALog *)1, kHAPIScope, v42);
            int v21 = v58;
            if (v58)
            {
              int v21 = v58;
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                char v59 = [v8 type];
                int v65 = 136315906;
                id v66 = "HapticCommandConverter.mm";
                __int16 v67 = 1024;
                int v68 = 579;
                __int16 v69 = 2080;
                id v70 = "-[HapticCommandConverter eventForEventEntry:engine:privileged:]";
                __int16 v71 = 2112;
                double v72 = *(double *)&v59;
                _os_log_impl(&dword_1BA902000, v21, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Unknown event type: %@", (uint8_t *)&v65, 0x26u);
              }
            }
            int v22 = -4821;
            double v23 = @"Unknown event type";
          }
          int v24 = @"CoreHapticInvalidEventTypeException";
          goto LABEL_34;
        }
        uint64_t v37 = [v8 audioResID];
        if (v37 == -1
          || !+[CHHapticEngine resourceIsRegistered:v37])
        {
          id v54 = CALog::LogObjIfEnabled((CALog *)1, kHAPIScope, v43);
          uint64_t v55 = v54;
          if (v54 && os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
          {
            int v65 = 136315906;
            id v66 = "HapticCommandConverter.mm";
            __int16 v67 = 1024;
            int v68 = 559;
            __int16 v69 = 2080;
            id v70 = "-[HapticCommandConverter eventForEventEntry:engine:privileged:]";
            __int16 v71 = 1024;
            LODWORD(v72) = v37;
            _os_log_impl(&dword_1BA902000, v55, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Invalid or missing audio resource with ID %u", (uint8_t *)&v65, 0x22u);
          }

          Haptic_RaiseException(&cfstr_Corehapticinva_2.isa, &cfstr_InvalidOrMissi.isa, -4824);
        }
        if (v14 == 0.0 && [v9 isResourceLoopEnabled:v37])
        {
          v45 = CALog::LogObjIfEnabled((CALog *)1, kHAPIScope, v44);
          int v46 = v45;
          if (v45 && os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            int v65 = 136315906;
            id v66 = "HapticCommandConverter.mm";
            __int16 v67 = 1024;
            int v68 = 548;
            __int16 v69 = 2080;
            id v70 = "-[HapticCommandConverter eventForEventEntry:engine:privileged:]";
            __int16 v71 = 1024;
            LODWORD(v72) = v37;
            _os_log_impl(&dword_1BA902000, v46, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Audio resource with ID %u has looping enabled but the event does not specify a duration", (uint8_t *)&v65, 0x22u);
          }

          Haptic_RaiseException(&cfstr_Corehapticinva_1.isa, &cfstr_LoopedCustomAu.isa, -4823);
        }
        if (v14 < 0.000000999999997)
        {
          [v9 getDurationForResource:v37];
          objc_msgSend(v8, "setDuration:");
          [v8 duration];
          double v14 = v47;
        }
      }
      uint64_t v27 = [(HapticCommandConverter *)self eventForAudioEventType:v37 time:v10 eventParams:v12 duration:v14];
      goto LABEL_82;
    }
    if (v10 && [v10 indexOfObjectPassingTest:&__block_literal_global] != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v48 = 2;
    }
    else
    {
      if (v14 == 0.0)
      {
        if (kHAPIScope)
        {
          float v31 = *(id *)kHAPIScope;
          if (!v31) {
            goto LABEL_79;
          }
        }
        else
        {
          float v31 = MEMORY[0x1E4F14500];
          id v56 = MEMORY[0x1E4F14500];
        }
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          int v65 = 136315650;
          id v66 = "HapticCommandConverter.mm";
          __int16 v67 = 1024;
          int v68 = 510;
          __int16 v69 = 2080;
          id v70 = "-[HapticCommandConverter eventForEventEntry:engine:privileged:]";
          _os_log_impl(&dword_1BA902000, v31, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Continuous haptic event has a missing or zero-length duration", (uint8_t *)&v65, 0x1Cu);
        }

LABEL_79:
        Haptic_RaiseException(&cfstr_Corehapticinva_1.isa, &cfstr_IllegalOrMissi.isa, -4823);
      }
      uint64_t v48 = 1;
      if (v17 > 0.0)
      {
        double v49 = v17;
        if (v14 > v49)
        {
          v50 = CALog::LogObjIfEnabled((CALog *)6, kHAPIScope, (const CALog::Scope *)1);
          id v51 = v50;
          if (v50 && os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
          {
            int v65 = 136315906;
            id v66 = "HapticCommandConverter.mm";
            __int16 v67 = 1024;
            int v68 = 516;
            __int16 v69 = 2080;
            id v70 = "-[HapticCommandConverter eventForEventEntry:engine:privileged:]";
            __int16 v71 = 2048;
            double v72 = v49;
            _os_log_impl(&dword_1BA902000, v51, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Haptic event duration capped at %f seconds", (uint8_t *)&v65, 0x26u);
          }

          uint64_t v48 = 1;
          double v14 = v49;
        }
      }
    }
    uint64_t v27 = [(HapticCommandConverter *)self eventForContinuousHapticEventType:v48 time:v10 params:v12 duration:v14];
    goto LABEL_82;
  }
  if (v5) {
    [(HapticCommandConverter *)self eventForLegacyTransientHapticAtTime:v10 params:v12 duration:v14];
  }
  else {
  uint64_t v27 = [(HapticCommandConverter *)self eventForTransientHapticAtTime:v10 params:v12 duration:v14];
  }
LABEL_82:
  int v57 = (void *)v27;

  return v57;
}

- (void).cxx_destruct
{
}

- (float)limitDynamicParameter:(id)a3 value:(float)a4 parameter:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  unint64_t v6 = [a3 attributesForDynamicParameter:a5 error:0];
  unint64_t v7 = v6;
  if (!v6)
  {
    if (kHAPIScope)
    {
      double v12 = *(id *)kHAPIScope;
      if (!v12)
      {
LABEL_14:
        float v11 = 0.0;
        goto LABEL_15;
      }
    }
    else
    {
      double v12 = MEMORY[0x1E4F14500];
      id v13 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315650;
      float v16 = "HapticCommandConverter.mm";
      __int16 v17 = 1024;
      int v18 = 117;
      __int16 v19 = 2080;
      int v20 = "-[HapticCommandConverter limitDynamicParameter:value:parameter:]";
      _os_log_impl(&dword_1BA902000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Invalid dynamic parameter ID", (uint8_t *)&v15, 0x1Cu);
    }

    goto LABEL_14;
  }
  [v6 minValue];
  float v9 = v8;
  [v7 maxValue];
  if (v10 >= a4) {
    float v10 = a4;
  }
  if (v10 >= v9) {
    float v11 = v10;
  }
  else {
    float v11 = v9;
  }
LABEL_15:

  return v11;
}

- (id)eventForAudioEventType:(unint64_t)a3 time:(double)a4 eventParams:(id)a5 duration:(double)a6
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  id v81 = a5;
  if (kHAPIScope)
  {
    if (*(unsigned char *)(kHAPIScope + 8))
    {
      id v10 = *(id *)kHAPIScope;
      if (v10)
      {
        float v11 = v10;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136316674;
          int v92 = "HapticCommandConverter.mm";
          __int16 v93 = 1024;
          int v94 = 129;
          __int16 v95 = 2080;
          double v96 = "-[HapticCommandConverter eventForAudioEventType:time:eventParams:duration:]";
          __int16 v97 = 1024;
          *(_DWORD *)double v98 = a3;
          *(_WORD *)&v98[4] = 2048;
          *(double *)&v98[6] = a4;
          *(_WORD *)&v98[14] = 2048;
          *(double *)&v98[16] = a6;
          __int16 v99 = 1024;
          int v100 = [v81 count];
          _os_log_impl(&dword_1BA902000, v11, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Type %u time: %.2f secs dur: %.2f secs %u event params", buf, 0x3Cu);
        }
      }
    }
  }
  if ([v81 count])
  {
    unint64_t v80 = a3;
    __p = 0;
    v88 = 0;
    v89 = 0;
    double v12 = +[CHHapticEngine capabilitiesForHardware];
    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    id obj = v81;
    uint64_t v13 = [obj countByEnumeratingWithState:&v83 objects:v90 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v84;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v84 != v14) {
            objc_enumerationMutation(obj);
          }
          float v16 = *(void **)(*((void *)&v83 + 1) + 8 * i);
          if (kHAPIScope)
          {
            if (*(unsigned char *)(kHAPIScope + 8))
            {
              id v17 = *(id *)kHAPIScope;
              if (v17)
              {
                int v18 = v17;
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
                {
                  __int16 v19 = [v16 parameterID];
                  [v16 value];
                  *(_DWORD *)buf = 136316162;
                  int v92 = "HapticCommandConverter.mm";
                  __int16 v93 = 1024;
                  int v94 = 134;
                  __int16 v95 = 2080;
                  double v96 = "-[HapticCommandConverter eventForAudioEventType:time:eventParams:duration:]";
                  __int16 v97 = 2112;
                  *(void *)double v98 = v19;
                  *(_WORD *)&v98[8] = 2048;
                  *(double *)&v98[10] = v20;
                  _os_log_impl(&dword_1BA902000, v18, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Fixed Param '%@': value %f", buf, 0x30u);
                }
              }
            }
          }
          [v16 value];
          int v22 = v21;
          double v23 = [v16 parameterID];
          LODWORD(v24) = v22;
          [(HapticCommandConverter *)self limitEventParameter:v12 value:v23 parameter:CHHapticEventTypeAudioContinuous eventType:v24];
          int v26 = v25;

          uint64_t v27 = [v16 parameterID];
          int v28 = [v27 isEqualToString:CHHapticEventParameterIDAudioVolume];

          if (v28)
          {
            int v29 = v88;
            if (v88 < v89)
            {
              uint64_t v30 = 1000;
              goto LABEL_92;
            }
            v33 = __p;
            uint64_t v34 = (v88 - (unsigned char *)__p) >> 4;
            unint64_t v35 = v34 + 1;
            if ((unint64_t)(v34 + 1) >> 60) {
              std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v36 = v89 - (unsigned char *)__p;
            if ((v89 - (unsigned char *)__p) >> 3 > v35) {
              unint64_t v35 = v36 >> 3;
            }
            if ((unint64_t)v36 >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v37 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v37 = v35;
            }
            if (v37)
            {
              v38 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<AVHapticPlayerFixedParameter>>((uint64_t)&v89, v37);
              v33 = __p;
              int v29 = v88;
            }
            else
            {
              v38 = 0;
            }
            int v46 = &v38[16 * v34];
            *(void *)int v46 = 1000;
            *((_DWORD *)v46 + 2) = v26;
            double v47 = v46;
            if (v29 != v33)
            {
              do
              {
                *((_OWORD *)v47 - 1) = *((_OWORD *)v29 - 1);
                v47 -= 16;
                v29 -= 4;
              }
              while (v29 != v33);
              goto LABEL_126;
            }
LABEL_127:
            long long v63 = v46 + 16;
            __p = v47;
            v88 = v46 + 16;
            v89 = &v38[16 * v37];
            if (v33) {
              operator delete(v33);
            }
LABEL_129:
            v88 = v63;
            continue;
          }
          float v31 = [v16 parameterID];
          int v32 = [v31 isEqualToString:CHHapticEventParameterIDAudioPan];

          if (v32)
          {
            int v29 = v88;
            if (v88 < v89)
            {
              uint64_t v30 = 1015;
LABEL_92:
              *(void *)int v29 = v30;
              v29[2] = v26;
              long long v63 = v29 + 4;
              goto LABEL_129;
            }
            v33 = __p;
            uint64_t v41 = (v88 - (unsigned char *)__p) >> 4;
            unint64_t v42 = v41 + 1;
            if ((unint64_t)(v41 + 1) >> 60) {
              std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v43 = v89 - (unsigned char *)__p;
            if ((v89 - (unsigned char *)__p) >> 3 > v42) {
              unint64_t v42 = v43 >> 3;
            }
            if ((unint64_t)v43 >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v37 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v37 = v42;
            }
            if (v37)
            {
              v38 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<AVHapticPlayerFixedParameter>>((uint64_t)&v89, v37);
              v33 = __p;
              int v29 = v88;
            }
            else
            {
              v38 = 0;
            }
            int v46 = &v38[16 * v41];
            *(void *)int v46 = 1015;
            *((_DWORD *)v46 + 2) = v26;
            double v47 = v46;
            if (v29 == v33) {
              goto LABEL_127;
            }
            do
            {
              *((_OWORD *)v47 - 1) = *((_OWORD *)v29 - 1);
              v47 -= 16;
              v29 -= 4;
            }
            while (v29 != v33);
            goto LABEL_126;
          }
          char v39 = [v16 parameterID];
          int v40 = [v39 isEqualToString:CHHapticEventParameterIDAudioBrightness];

          if (v40)
          {
            int v29 = v88;
            if (v88 < v89)
            {
              uint64_t v30 = 1013;
              goto LABEL_92;
            }
            v33 = __p;
            uint64_t v48 = (v88 - (unsigned char *)__p) >> 4;
            unint64_t v49 = v48 + 1;
            if ((unint64_t)(v48 + 1) >> 60) {
              std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v50 = v89 - (unsigned char *)__p;
            if ((v89 - (unsigned char *)__p) >> 3 > v49) {
              unint64_t v49 = v50 >> 3;
            }
            if ((unint64_t)v50 >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v37 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v37 = v49;
            }
            if (v37)
            {
              v38 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<AVHapticPlayerFixedParameter>>((uint64_t)&v89, v37);
              v33 = __p;
              int v29 = v88;
            }
            else
            {
              v38 = 0;
            }
            int v46 = &v38[16 * v48];
            *(void *)int v46 = 1013;
            *((_DWORD *)v46 + 2) = v26;
            double v47 = v46;
            if (v29 == v33) {
              goto LABEL_127;
            }
            do
            {
              *((_OWORD *)v47 - 1) = *((_OWORD *)v29 - 1);
              v47 -= 16;
              v29 -= 4;
            }
            while (v29 != v33);
LABEL_126:
            v33 = __p;
            goto LABEL_127;
          }
          v44 = [v16 parameterID];
          int v45 = [v44 isEqualToString:CHHapticEventParameterIDAudioPitch];

          if (v45)
          {
            int v29 = v88;
            if (v88 < v89)
            {
              uint64_t v30 = 1001;
              goto LABEL_92;
            }
            v33 = __p;
            uint64_t v53 = (v88 - (unsigned char *)__p) >> 4;
            unint64_t v54 = v53 + 1;
            if ((unint64_t)(v53 + 1) >> 60) {
              std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v55 = v89 - (unsigned char *)__p;
            if ((v89 - (unsigned char *)__p) >> 3 > v54) {
              unint64_t v54 = v55 >> 3;
            }
            if ((unint64_t)v55 >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v37 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v37 = v54;
            }
            if (v37)
            {
              v38 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<AVHapticPlayerFixedParameter>>((uint64_t)&v89, v37);
              v33 = __p;
              int v29 = v88;
            }
            else
            {
              v38 = 0;
            }
            int v46 = &v38[16 * v53];
            *(void *)int v46 = 1001;
            *((_DWORD *)v46 + 2) = v26;
            double v47 = v46;
            if (v29 == v33) {
              goto LABEL_127;
            }
            do
            {
              *((_OWORD *)v47 - 1) = *((_OWORD *)v29 - 1);
              v47 -= 16;
              v29 -= 4;
            }
            while (v29 != v33);
            goto LABEL_126;
          }
          id v51 = [v16 parameterID];
          int v52 = [v51 isEqualToString:CHHapticEventParameterIDAttackTime];

          if (v52)
          {
            int v29 = v88;
            if (v88 < v89)
            {
              uint64_t v30 = 1010;
              goto LABEL_92;
            }
            v33 = __p;
            uint64_t v58 = (v88 - (unsigned char *)__p) >> 4;
            unint64_t v59 = v58 + 1;
            if ((unint64_t)(v58 + 1) >> 60) {
              std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v60 = v89 - (unsigned char *)__p;
            if ((v89 - (unsigned char *)__p) >> 3 > v59) {
              unint64_t v59 = v60 >> 3;
            }
            if ((unint64_t)v60 >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v37 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v37 = v59;
            }
            if (v37)
            {
              v38 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<AVHapticPlayerFixedParameter>>((uint64_t)&v89, v37);
              v33 = __p;
              int v29 = v88;
            }
            else
            {
              v38 = 0;
            }
            int v46 = &v38[16 * v58];
            *(void *)int v46 = 1010;
            *((_DWORD *)v46 + 2) = v26;
            double v47 = v46;
            if (v29 == v33) {
              goto LABEL_127;
            }
            do
            {
              *((_OWORD *)v47 - 1) = *((_OWORD *)v29 - 1);
              v47 -= 16;
              v29 -= 4;
            }
            while (v29 != v33);
            goto LABEL_126;
          }
          id v56 = [v16 parameterID];
          int v57 = [v56 isEqualToString:CHHapticEventParameterIDDecayTime];

          if (v57)
          {
            int v29 = v88;
            if (v88 < v89)
            {
              uint64_t v30 = 1011;
              goto LABEL_92;
            }
            v33 = __p;
            uint64_t v64 = (v88 - (unsigned char *)__p) >> 4;
            unint64_t v65 = v64 + 1;
            if ((unint64_t)(v64 + 1) >> 60) {
              std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v66 = v89 - (unsigned char *)__p;
            if ((v89 - (unsigned char *)__p) >> 3 > v65) {
              unint64_t v65 = v66 >> 3;
            }
            if ((unint64_t)v66 >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v37 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v37 = v65;
            }
            if (v37)
            {
              v38 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<AVHapticPlayerFixedParameter>>((uint64_t)&v89, v37);
              v33 = __p;
              int v29 = v88;
            }
            else
            {
              v38 = 0;
            }
            int v46 = &v38[16 * v64];
            *(void *)int v46 = 1011;
            *((_DWORD *)v46 + 2) = v26;
            double v47 = v46;
            if (v29 == v33) {
              goto LABEL_127;
            }
            do
            {
              *((_OWORD *)v47 - 1) = *((_OWORD *)v29 - 1);
              v47 -= 16;
              v29 -= 4;
            }
            while (v29 != v33);
            goto LABEL_126;
          }
          int v61 = [v16 parameterID];
          int v62 = [v61 isEqualToString:CHHapticEventParameterIDReleaseTime];

          if (v62)
          {
            int v29 = v88;
            if (v88 < v89)
            {
              uint64_t v30 = 1012;
              goto LABEL_92;
            }
            v33 = __p;
            uint64_t v70 = (v88 - (unsigned char *)__p) >> 4;
            unint64_t v71 = v70 + 1;
            if ((unint64_t)(v70 + 1) >> 60) {
              std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v72 = v89 - (unsigned char *)__p;
            if ((v89 - (unsigned char *)__p) >> 3 > v71) {
              unint64_t v71 = v72 >> 3;
            }
            if ((unint64_t)v72 >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v37 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v37 = v71;
            }
            if (v37)
            {
              v38 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<AVHapticPlayerFixedParameter>>((uint64_t)&v89, v37);
              v33 = __p;
              int v29 = v88;
            }
            else
            {
              v38 = 0;
            }
            int v46 = &v38[16 * v70];
            *(void *)int v46 = 1012;
            *((_DWORD *)v46 + 2) = v26;
            double v47 = v46;
            if (v29 == v33) {
              goto LABEL_127;
            }
            do
            {
              *((_OWORD *)v47 - 1) = *((_OWORD *)v29 - 1);
              v47 -= 16;
              v29 -= 4;
            }
            while (v29 != v33);
            goto LABEL_126;
          }
          __int16 v67 = [v16 parameterID];
          int v68 = [v67 isEqualToString:CHHapticEventParameterIDSustained];

          if ((v68 & 1) == 0)
          {
            int v76 = CALog::LogObjIfEnabled((CALog *)1, kHAPIScope, v69);
            char v77 = v76;
            if (v76)
            {
              double v78 = v76;
              if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
              {
                __int16 v79 = [v16 parameterID];
                *(_DWORD *)buf = 136315906;
                int v92 = "HapticCommandConverter.mm";
                __int16 v93 = 1024;
                int v94 = 164;
                __int16 v95 = 2080;
                double v96 = "-[HapticCommandConverter eventForAudioEventType:time:eventParams:duration:]";
                __int16 v97 = 2112;
                *(void *)double v98 = v79;
                _os_log_impl(&dword_1BA902000, v78, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Unknown event param type: %@", buf, 0x26u);
              }
            }

            Haptic_RaiseException(&cfstr_Corehapticinva.isa, &cfstr_UnknownEventPa.isa, -4820);
          }
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v83 objects:v90 count:16];
      }
      while (v13);
    }

    if (v88 == __p) {
      uint64_t v73 = 0;
    }
    else {
      uint64_t v73 = __p;
    }
    id v74 = [MEMORY[0x1E4F4EAC0] eventWithEventType:v80 time:v73 parameters:(v88 - (unsigned char *)__p) >> 4 count:a4 duration:a6];

    if (__p)
    {
      v88 = __p;
      operator delete(__p);
    }
  }
  else
  {
    id v74 = [MEMORY[0x1E4F4EAC0] eventWithEventType:a3 time:a4 duration:a6];
  }

  return v74;
}

- (unint64_t)transientHapticEventTypeForDefaultSharpness
{
  v3 = [(HapticCommandConverter *)self serverConfig];
  [v3 defaultHapticTransientEventSharpness];
  unint64_t v4 = -[HapticCommandConverter transientHapticEventTypeFromSharpness:](self, "transientHapticEventTypeFromSharpness:");

  return v4;
}

- (unint64_t)eventTypeForBuiltInAudioEventType:(unint64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = [(HapticCommandConverter *)self serverConfig];
  BOOL v5 = [v4 builtInAudioEventIDs];
  unint64_t v6 = [NSNumber numberWithUnsignedInt:a3];
  unint64_t v7 = [v5 objectForKey:v6];

  if (v7)
  {
    a3 = [v7 unsignedIntegerValue];
  }
  else if (kHAPIScope)
  {
    if (*(unsigned char *)(kHAPIScope + 8))
    {
      float v9 = *(id *)kHAPIScope;
      if (v9)
      {
        id v10 = v9;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          int v11 = 136316162;
          double v12 = "HapticCommandConverter.mm";
          int v14 = 203;
          __int16 v15 = 2080;
          __int16 v13 = 1024;
          float v16 = "-[HapticCommandConverter eventTypeForBuiltInAudioEventType:]";
          __int16 v17 = 1024;
          int v18 = a3;
          __int16 v19 = 1024;
          int v20 = a3;
          _os_log_impl(&dword_1BA902000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: No altered event ID for original event ID %u. Returning original event ID %u", (uint8_t *)&v11, 0x28u);
        }
      }
    }
  }

  return a3;
}

- (unint64_t)continuousHapticEventTypeFromSharpness:(float)a3 sustained:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v6 = [(HapticCommandConverter *)self serverConfig];
  unint64_t v7 = v6;
  if (v4)
  {
    if (v6)
    {
      [v6 hapticContinuousSustainedIDs];
      goto LABEL_7;
    }
  }
  else if (v6)
  {
    [v6 hapticContinuousNonsustainedIDs];
    goto LABEL_7;
  }
  int v11 = 0;
  double v12 = 0;
LABEL_7:

  if (v11 != (void *)v12)
  {
    unint64_t v8 = v11[(int)((float)((float)(unint64_t)(((v12 - (unsigned char *)v11) >> 3) - 1) * a3) + 0.5)];
LABEL_10:
    operator delete(v11);
    return v8;
  }
  unint64_t v8 = 0;
  unint64_t v9 = 0;
  if (v11) {
    goto LABEL_10;
  }
  return v9;
}

- (unint64_t)continuousHapticEventTypeForDefaultSharpness:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(HapticCommandConverter *)self serverConfig];
  [v5 defaultHapticContinuousEventSharpness];
  unint64_t v6 = -[HapticCommandConverter continuousHapticEventTypeFromSharpness:sustained:](self, "continuousHapticEventTypeFromSharpness:sustained:", v3);

  return v6;
}

- (id)eventForContinuousHapticEventType:(int)a3 time:(double)a4 params:(id)a5 duration:(double)a6
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v80 = a5;
  if (kHAPIScope)
  {
    if (*(unsigned char *)(kHAPIScope + 8))
    {
      id v9 = *(id *)kHAPIScope;
      if (v9)
      {
        id v10 = v9;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136316674;
          __int16 v95 = "HapticCommandConverter.mm";
          __int16 v96 = 1024;
          int v97 = 372;
          __int16 v98 = 2080;
          __int16 v99 = "-[HapticCommandConverter eventForContinuousHapticEventType:time:params:duration:]";
          __int16 v100 = 1024;
          *(_DWORD *)uint64_t v101 = a3;
          *(_WORD *)&v101[4] = 2048;
          *(double *)&v101[6] = a4;
          *(_WORD *)&v101[14] = 2048;
          *(double *)&v101[16] = a6;
          __int16 v102 = 1024;
          int v103 = [v80 count];
          _os_log_impl(&dword_1BA902000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Type %u time: %.2f secs duration: %.2f secs %u client event params", buf, 0x3Cu);
        }
      }
    }
  }
  __p = 0;
  __int16 v91 = 0;
  int v92 = 0;
  long long v85 = +[CHHapticEngine capabilitiesForHardware];
  int v11 = [(HapticCommandConverter *)self serverConfig];
  [v11 defaultHapticContinuousEventIntensity];
  float v13 = v12;

  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  id obj = v81;
  uint64_t v14 = [obj countByEnumeratingWithState:&v86 objects:v93 count:16];
  if (v14)
  {
    char v82 = 0;
    unint64_t v15 = 0;
    uint64_t v16 = *(void *)v87;
    while (1)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v87 != v16) {
          objc_enumerationMutation(obj);
        }
        int v18 = *(void **)(*((void *)&v86 + 1) + 8 * i);
        if (kHAPIScope)
        {
          if (*(unsigned char *)(kHAPIScope + 8))
          {
            id v19 = *(id *)kHAPIScope;
            if (v19)
            {
              int v20 = v19;
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v21 = [v18 parameterID];
                [v18 value];
                *(_DWORD *)buf = 136316162;
                __int16 v95 = "HapticCommandConverter.mm";
                __int16 v96 = 1024;
                int v97 = 381;
                __int16 v98 = 2080;
                __int16 v99 = "-[HapticCommandConverter eventForContinuousHapticEventType:time:params:duration:]";
                __int16 v100 = 2112;
                *(void *)uint64_t v101 = v21;
                *(_WORD *)&v101[8] = 2048;
                *(double *)&v101[10] = v22;
                _os_log_impl(&dword_1BA902000, v20, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Fixed Param '%@': value %f", buf, 0x30u);
              }
            }
          }
        }
        [v18 value];
        int v24 = v23;
        int v25 = [v18 parameterID];
        LODWORD(v26) = v24;
        [(HapticCommandConverter *)self limitEventParameter:v85 value:v25 parameter:CHHapticEventTypeHapticContinuous eventType:v26];
        float v28 = v27;

        int v29 = [v18 parameterID];
        char v30 = [v29 isEqualToString:CHHapticEventParameterIDHapticIntensity];

        if (v30)
        {
          float v13 = v28;
          continue;
        }
        float v31 = [v18 parameterID];
        int v32 = [v31 isEqualToString:CHHapticEventParameterIDHapticSharpness];

        if (v32)
        {
          *(float *)&double v33 = v28;
          unint64_t v15 = [(HapticCommandConverter *)self continuousHapticEventTypeFromSharpness:a3 == 1 sustained:v33];
          char v82 = 1;
          continue;
        }
        uint64_t v34 = [v18 parameterID];
        int v35 = [v34 isEqualToString:CHHapticEventParameterIDAttackTime];

        if (v35)
        {
          uint64_t v36 = (float *)v91;
          if (v91 < v92)
          {
            uint64_t v37 = 2010;
            goto LABEL_39;
          }
          int v40 = (float *)__p;
          uint64_t v41 = (v91 - (unsigned char *)__p) >> 4;
          unint64_t v42 = v41 + 1;
          if ((unint64_t)(v41 + 1) >> 60) {
            std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v43 = v92 - (unsigned char *)__p;
          if ((v92 - (unsigned char *)__p) >> 3 > v42) {
            unint64_t v42 = v43 >> 3;
          }
          if ((unint64_t)v43 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v44 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v44 = v42;
          }
          if (v44)
          {
            int v45 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<AVHapticPlayerFixedParameter>>((uint64_t)&v92, v44);
            int v40 = (float *)__p;
            uint64_t v36 = (float *)v91;
          }
          else
          {
            int v45 = 0;
          }
          unint64_t v54 = &v45[16 * v41];
          *(void *)unint64_t v54 = 2010;
          *((float *)v54 + 2) = v28;
          uint64_t v55 = v54;
          if (v36 != v40)
          {
            do
            {
              *((_OWORD *)v55 - 1) = *((_OWORD *)v36 - 1);
              v55 -= 16;
              v36 -= 4;
            }
            while (v36 != v40);
            goto LABEL_69;
          }
LABEL_70:
          uint64_t v48 = v54 + 16;
          __p = v55;
          __int16 v91 = v54 + 16;
          int v92 = &v45[16 * v44];
          if (v40) {
            operator delete(v40);
          }
LABEL_72:
          __int16 v91 = v48;
          continue;
        }
        v38 = [v18 parameterID];
        int v39 = [v38 isEqualToString:CHHapticEventParameterIDDecayTime];

        if (v39)
        {
          uint64_t v36 = (float *)v91;
          if (v91 < v92)
          {
            uint64_t v37 = 2011;
LABEL_39:
            *(void *)uint64_t v36 = v37;
            v36[2] = v28;
            uint64_t v48 = (char *)(v36 + 4);
            goto LABEL_72;
          }
          int v40 = (float *)__p;
          uint64_t v49 = (v91 - (unsigned char *)__p) >> 4;
          unint64_t v50 = v49 + 1;
          if ((unint64_t)(v49 + 1) >> 60) {
            std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v51 = v92 - (unsigned char *)__p;
          if ((v92 - (unsigned char *)__p) >> 3 > v50) {
            unint64_t v50 = v51 >> 3;
          }
          if ((unint64_t)v51 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v44 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v44 = v50;
          }
          if (v44)
          {
            int v45 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<AVHapticPlayerFixedParameter>>((uint64_t)&v92, v44);
            int v40 = (float *)__p;
            uint64_t v36 = (float *)v91;
          }
          else
          {
            int v45 = 0;
          }
          unint64_t v54 = &v45[16 * v49];
          *(void *)unint64_t v54 = 2011;
          *((float *)v54 + 2) = v28;
          uint64_t v55 = v54;
          if (v36 == v40) {
            goto LABEL_70;
          }
          do
          {
            *((_OWORD *)v55 - 1) = *((_OWORD *)v36 - 1);
            v55 -= 16;
            v36 -= 4;
          }
          while (v36 != v40);
          goto LABEL_69;
        }
        int v46 = [v18 parameterID];
        int v47 = [v46 isEqualToString:CHHapticEventParameterIDReleaseTime];

        if (v47)
        {
          uint64_t v36 = (float *)v91;
          if (v91 < v92)
          {
            uint64_t v37 = 2012;
            goto LABEL_39;
          }
          int v40 = (float *)__p;
          uint64_t v56 = (v91 - (unsigned char *)__p) >> 4;
          unint64_t v57 = v56 + 1;
          if ((unint64_t)(v56 + 1) >> 60) {
            std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v58 = v92 - (unsigned char *)__p;
          if ((v92 - (unsigned char *)__p) >> 3 > v57) {
            unint64_t v57 = v58 >> 3;
          }
          if ((unint64_t)v58 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v44 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v44 = v57;
          }
          if (v44)
          {
            int v45 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<AVHapticPlayerFixedParameter>>((uint64_t)&v92, v44);
            int v40 = (float *)__p;
            uint64_t v36 = (float *)v91;
          }
          else
          {
            int v45 = 0;
          }
          unint64_t v54 = &v45[16 * v56];
          *(void *)unint64_t v54 = 2012;
          *((float *)v54 + 2) = v28;
          uint64_t v55 = v54;
          if (v36 == v40) {
            goto LABEL_70;
          }
          do
          {
            *((_OWORD *)v55 - 1) = *((_OWORD *)v36 - 1);
            v55 -= 16;
            v36 -= 4;
          }
          while (v36 != v40);
LABEL_69:
          int v40 = (float *)__p;
          goto LABEL_70;
        }
        int v52 = [v18 parameterID];
        int v53 = [v52 isEqualToString:CHHapticEventParameterIDSustained];

        if ((v53 & 1) == 0)
        {
          if (kHAPIScope)
          {
            id v65 = *(id *)kHAPIScope;
            if (!v65) {
              goto LABEL_109;
            }
          }
          else
          {
            id v65 = (id)MEMORY[0x1E4F14500];
            id v72 = MEMORY[0x1E4F14500];
          }
          uint64_t v73 = v65;
          if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
          {
            id v74 = [v18 parameterID];
            *(_DWORD *)buf = 136315906;
            __int16 v95 = "HapticCommandConverter.mm";
            __int16 v96 = 1024;
            int v97 = 404;
            __int16 v98 = 2080;
            __int16 v99 = "-[HapticCommandConverter eventForContinuousHapticEventType:time:params:duration:]";
            __int16 v100 = 2112;
            *(void *)uint64_t v101 = v74;
            _os_log_impl(&dword_1BA902000, v73, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Unknown event param type: %@", buf, 0x26u);
          }
LABEL_109:
          Haptic_RaiseException(&cfstr_Corehapticinva.isa, &cfstr_UnknownEventPa.isa, -4820);
        }
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v86 objects:v93 count:16];
      if (!v14)
      {

        if (v82) {
          goto LABEL_84;
        }
        goto LABEL_78;
      }
    }
  }

LABEL_78:
  unint64_t v15 = [(HapticCommandConverter *)self continuousHapticEventTypeForDefaultSharpness:a3 == 1];
  if (kHAPIScope)
  {
    if (*(unsigned char *)(kHAPIScope + 8))
    {
      unint64_t v59 = *(id *)kHAPIScope;
      if (v59)
      {
        uint64_t v60 = v59;
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315906;
          __int16 v95 = "HapticCommandConverter.mm";
          __int16 v96 = 1024;
          int v97 = 411;
          __int16 v98 = 2080;
          __int16 v99 = "-[HapticCommandConverter eventForContinuousHapticEventType:time:params:duration:]";
          __int16 v100 = 1024;
          *(_DWORD *)uint64_t v101 = v15;
          _os_log_impl(&dword_1BA902000, v60, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Event has no HapticSharpness EventParameter. Using default event ID %u", buf, 0x22u);
        }
      }
    }
  }
LABEL_84:
  if (v13 == 1.0)
  {
    uint64_t v64 = v91;
  }
  else
  {
    if (kHAPIScope)
    {
      if (*(unsigned char *)(kHAPIScope + 8))
      {
        int v61 = *(id *)kHAPIScope;
        if (v61)
        {
          int v62 = v61;
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315906;
            __int16 v95 = "HapticCommandConverter.mm";
            __int16 v96 = 1024;
            int v97 = 414;
            __int16 v98 = 2080;
            __int16 v99 = "-[HapticCommandConverter eventForContinuousHapticEventType:time:params:duration:]";
            __int16 v100 = 2048;
            *(double *)uint64_t v101 = v13;
            _os_log_impl(&dword_1BA902000, v62, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Adding event param for continuous haptic intensity: %.2f", buf, 0x26u);
          }
        }
      }
    }
    long long v63 = (float *)v91;
    if (v91 >= v92)
    {
      uint64_t v66 = (float *)__p;
      uint64_t v67 = (v91 - (unsigned char *)__p) >> 4;
      unint64_t v68 = v67 + 1;
      if ((unint64_t)(v67 + 1) >> 60) {
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v69 = v92 - (unsigned char *)__p;
      if ((v92 - (unsigned char *)__p) >> 3 > v68) {
        unint64_t v68 = v69 >> 3;
      }
      if ((unint64_t)v69 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v70 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v70 = v68;
      }
      if (v70)
      {
        unint64_t v71 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<AVHapticPlayerFixedParameter>>((uint64_t)&v92, v70);
        uint64_t v66 = (float *)__p;
        long long v63 = (float *)v91;
      }
      else
      {
        unint64_t v71 = 0;
      }
      int v75 = (float *)&v71[16 * v67];
      int v76 = &v71[16 * v70];
      *(void *)int v75 = 2000;
      v75[2] = v13;
      uint64_t v64 = (char *)(v75 + 4);
      if (v63 != v66)
      {
        do
        {
          *((_OWORD *)v75 - 1) = *((_OWORD *)v63 - 1);
          v75 -= 4;
          v63 -= 4;
        }
        while (v63 != v66);
        uint64_t v66 = (float *)__p;
      }
      __p = v75;
      __int16 v91 = v64;
      int v92 = v76;
      if (v66) {
        operator delete(v66);
      }
    }
    else
    {
      *(void *)__int16 v91 = 2000;
      v63[2] = v13;
      uint64_t v64 = (char *)(v63 + 4);
    }
    __int16 v91 = v64;
  }
  if (v64 == __p) {
    char v77 = 0;
  }
  else {
    char v77 = __p;
  }
  double v78 = [MEMORY[0x1E4F4EAC0] eventWithEventType:v15 time:v77 parameters:(v64 - (unsigned char *)__p) >> 4 count:a4 duration:a6];

  if (__p)
  {
    __int16 v91 = (char *)__p;
    operator delete(__p);
  }

  return v78;
}

- (id)eventForSPIEventType:(unint64_t)a3 time:(double)a4 eventParams:(id)a5 duration:(double)a6
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v66 = a5;
  if (kHAPIScope)
  {
    if (*(unsigned char *)(kHAPIScope + 8))
    {
      id v9 = *(id *)kHAPIScope;
      if (v9)
      {
        id v10 = v9;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136316674;
          double v78 = "HapticCommandConverter.mm";
          __int16 v79 = 1024;
          int v80 = 433;
          __int16 v81 = 2080;
          char v82 = "-[HapticCommandConverter eventForSPIEventType:time:eventParams:duration:]";
          __int16 v83 = 1024;
          *(_DWORD *)long long v84 = a3;
          *(_WORD *)&v84[4] = 2048;
          *(double *)&v84[6] = a4;
          *(_WORD *)&v84[14] = 2048;
          *(double *)&v84[16] = a6;
          __int16 v85 = 1024;
          int v86 = [v66 count];
          _os_log_impl(&dword_1BA902000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Type %u time: %.2f secs dur: %.2f secs %u event params", buf, 0x3Cu);
        }
      }
    }
  }
  __p = 0;
  id v74 = 0;
  int v75 = 0;
  if ([v66 count])
  {
    int v11 = +[CHHapticEngine capabilitiesForHardware];
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id obj = v66;
    uint64_t v12 = [obj countByEnumeratingWithState:&v69 objects:v76 count:16];
    if (!v12) {
      goto LABEL_71;
    }
    uint64_t v13 = *(void *)v70;
    while (1)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v70 != v13) {
          objc_enumerationMutation(obj);
        }
        unint64_t v15 = *(void **)(*((void *)&v69 + 1) + 8 * i);
        if (kHAPIScope)
        {
          if (*(unsigned char *)(kHAPIScope + 8))
          {
            id v16 = *(id *)kHAPIScope;
            if (v16)
            {
              __int16 v17 = v16;
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
              {
                int v18 = [v15 parameterID];
                [v15 value];
                *(_DWORD *)buf = 136316162;
                double v78 = "HapticCommandConverter.mm";
                __int16 v79 = 1024;
                int v80 = 438;
                __int16 v81 = 2080;
                char v82 = "-[HapticCommandConverter eventForSPIEventType:time:eventParams:duration:]";
                __int16 v83 = 2112;
                *(void *)long long v84 = v18;
                *(_WORD *)&v84[8] = 2048;
                *(double *)&v84[10] = v19;
                _os_log_impl(&dword_1BA902000, v17, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Fixed Param '%@': value %f", buf, 0x30u);
              }
            }
          }
        }
        int v20 = [v15 parameterID];
        int v21 = [v20 isEqualToString:CHHapticEventParameterIDAudioVolume];

        if (v21)
        {
          [v15 value];
          int v23 = v22;
          int v24 = [v15 parameterID];
          LODWORD(v25) = v23;
          [(HapticCommandConverter *)self limitEventParameter:v11 value:v24 parameter:CHHapticEventTypeAudioContinuous eventType:v25];
          int v27 = v26;

          float v28 = v74;
          if (v74 < v75)
          {
            uint64_t v29 = 1000;
            goto LABEL_29;
          }
          int v45 = __p;
          uint64_t v46 = (v74 - (unsigned char *)__p) >> 4;
          unint64_t v47 = v46 + 1;
          if ((unint64_t)(v46 + 1) >> 60) {
            std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v48 = v75 - (unsigned char *)__p;
          if ((v75 - (unsigned char *)__p) >> 3 > v47) {
            unint64_t v47 = v48 >> 3;
          }
          if ((unint64_t)v48 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v49 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v49 = v47;
          }
          if (v49)
          {
            unint64_t v50 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<AVHapticPlayerFixedParameter>>((uint64_t)&v75, v49);
            int v45 = __p;
            float v28 = v74;
          }
          else
          {
            unint64_t v50 = 0;
          }
          unint64_t v54 = &v50[16 * v46];
          *(void *)unint64_t v54 = 1000;
          *((_DWORD *)v54 + 2) = v27;
          uint64_t v55 = v54;
          if (v28 != v45)
          {
            do
            {
              *((_OWORD *)v55 - 1) = *((_OWORD *)v28 - 1);
              v55 -= 16;
              v28 -= 4;
            }
            while (v28 != v45);
            goto LABEL_65;
          }
          goto LABEL_66;
        }
        char v30 = [v15 parameterID];
        int v31 = [v30 isEqualToString:CHHapticEventParameterIDAudioPitch];

        if (v31)
        {
          [v15 value];
          int v33 = v32;
          uint64_t v34 = [v15 parameterID];
          LODWORD(v35) = v33;
          [(HapticCommandConverter *)self limitEventParameter:v11 value:v34 parameter:CHHapticEventTypeAudioContinuous eventType:v35];
          int v27 = v36;

          float v28 = v74;
          if (v74 < v75)
          {
            uint64_t v29 = 1001;
            goto LABEL_29;
          }
          int v45 = __p;
          uint64_t v51 = (v74 - (unsigned char *)__p) >> 4;
          unint64_t v52 = v51 + 1;
          if ((unint64_t)(v51 + 1) >> 60) {
            std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v53 = v75 - (unsigned char *)__p;
          if ((v75 - (unsigned char *)__p) >> 3 > v52) {
            unint64_t v52 = v53 >> 3;
          }
          if ((unint64_t)v53 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v49 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v49 = v52;
          }
          if (v49)
          {
            unint64_t v50 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<AVHapticPlayerFixedParameter>>((uint64_t)&v75, v49);
            int v45 = __p;
            float v28 = v74;
          }
          else
          {
            unint64_t v50 = 0;
          }
          unint64_t v54 = &v50[16 * v51];
          *(void *)unint64_t v54 = 1001;
          *((_DWORD *)v54 + 2) = v27;
          uint64_t v55 = v54;
          if (v28 != v45)
          {
            do
            {
              *((_OWORD *)v55 - 1) = *((_OWORD *)v28 - 1);
              v55 -= 16;
              v28 -= 4;
            }
            while (v28 != v45);
            goto LABEL_65;
          }
          goto LABEL_66;
        }
        uint64_t v37 = [v15 parameterID];
        int v38 = [v37 isEqualToString:CHHapticEventParameterIDHapticIntensity];

        if (!v38)
        {
          if (kHAPIScope)
          {
            id v61 = *(id *)kHAPIScope;
            if (!v61) {
              goto LABEL_83;
            }
          }
          else
          {
            id v61 = (id)MEMORY[0x1E4F14500];
            id v62 = MEMORY[0x1E4F14500];
          }
          long long v63 = v61;
          if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
          {
            uint64_t v64 = [v15 parameterID];
            *(_DWORD *)buf = 136315906;
            double v78 = "HapticCommandConverter.mm";
            __int16 v79 = 1024;
            int v80 = 456;
            __int16 v81 = 2080;
            char v82 = "-[HapticCommandConverter eventForSPIEventType:time:eventParams:duration:]";
            __int16 v83 = 2112;
            *(void *)long long v84 = v64;
            _os_log_impl(&dword_1BA902000, v63, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Unsupported event param type: %@", buf, 0x26u);
          }
LABEL_83:
          Haptic_RaiseException(&cfstr_Corehapticinva.isa, &cfstr_UnsupportedEve.isa, -4820);
        }
        if ([(HapticCommandConverter *)self eventTypeForBuiltInAudioEventType:32556] != a3)
        {
          [v15 value];
          int v40 = v39;
          uint64_t v41 = [v15 parameterID];
          LODWORD(v42) = v40;
          [(HapticCommandConverter *)self limitEventParameter:v11 value:v41 parameter:CHHapticEventTypeHapticTransient eventType:v42];
          int v27 = v43;

          float v28 = v74;
          if (v74 < v75)
          {
            uint64_t v29 = 2000;
LABEL_29:
            *(void *)float v28 = v29;
            v28[2] = v27;
            unint64_t v44 = v28 + 4;
LABEL_68:
            id v74 = v44;
            continue;
          }
          int v45 = __p;
          uint64_t v56 = (v74 - (unsigned char *)__p) >> 4;
          unint64_t v57 = v56 + 1;
          if ((unint64_t)(v56 + 1) >> 60) {
            std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v58 = v75 - (unsigned char *)__p;
          if ((v75 - (unsigned char *)__p) >> 3 > v57) {
            unint64_t v57 = v58 >> 3;
          }
          if ((unint64_t)v58 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v49 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v49 = v57;
          }
          if (v49)
          {
            unint64_t v50 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<AVHapticPlayerFixedParameter>>((uint64_t)&v75, v49);
            int v45 = __p;
            float v28 = v74;
          }
          else
          {
            unint64_t v50 = 0;
          }
          unint64_t v54 = &v50[16 * v56];
          *(void *)unint64_t v54 = 2000;
          *((_DWORD *)v54 + 2) = v27;
          uint64_t v55 = v54;
          if (v28 != v45)
          {
            do
            {
              *((_OWORD *)v55 - 1) = *((_OWORD *)v28 - 1);
              v55 -= 16;
              v28 -= 4;
            }
            while (v28 != v45);
LABEL_65:
            int v45 = __p;
          }
LABEL_66:
          unint64_t v44 = v54 + 16;
          __p = v55;
          id v74 = v54 + 16;
          int v75 = &v50[16 * v49];
          if (v45) {
            operator delete(v45);
          }
          goto LABEL_68;
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v69 objects:v76 count:16];
      if (!v12)
      {
LABEL_71:

        break;
      }
    }
  }
  if (v74 == __p) {
    unint64_t v59 = 0;
  }
  else {
    unint64_t v59 = __p;
  }
  uint64_t v60 = [MEMORY[0x1E4F4EAC0] eventWithEventType:a3 time:v59 parameters:(v74 - (unsigned char *)__p) >> 4 count:a4 duration:a6];
  if (__p)
  {
    id v74 = __p;
    operator delete(__p);
  }

  return v60;
}

uint64_t __63__HapticCommandConverter_eventForEventEntry_engine_privileged___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v5 = a2;
  unint64_t v6 = [v5 parameterID];
  if (![v6 isEqualToString:CHHapticEventParameterIDSustained])
  {

    goto LABEL_5;
  }
  [v5 value];
  float v8 = v7;

  if (v8 != 0.0)
  {
LABEL_5:
    uint64_t v9 = 0;
    goto LABEL_6;
  }
  uint64_t v9 = 1;
  *a4 = 1;
LABEL_6:

  return v9;
}

uint64_t __63__HapticCommandConverter_eventForEventEntry_engine_privileged___block_invoke_41(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v5 = a2;
  unint64_t v6 = [v5 parameterID];
  if (![v6 isEqualToString:CHHapticEventParameterIDSustained])
  {

    goto LABEL_5;
  }
  [v5 value];
  float v8 = v7;

  if (v8 != 0.0)
  {
LABEL_5:
    uint64_t v9 = 0;
    goto LABEL_6;
  }
  uint64_t v9 = 1;
  *a4 = 1;
LABEL_6:

  return v9;
}

- (id)eventForDynamicParameterEntry:(id)a3
{
  uint64_t v111 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 value];
  float v6 = v5;
  [v4 relativeTime];
  uint64_t v8 = v7;
  if (kHAPIScope)
  {
    if (*(unsigned char *)(kHAPIScope + 8))
    {
      id v9 = *(id *)kHAPIScope;
      if (v9)
      {
        id v10 = v9;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          double v11 = [v4 parameterID];
          int v101 = 136315906;
          __int16 v102 = "HapticCommandConverter.mm";
          __int16 v103 = 1024;
          int v104 = 590;
          __int16 v105 = 2080;
          v106 = "-[HapticCommandConverter eventForDynamicParameterEntry:]";
          __int16 v107 = 2112;
          double v108 = v11;
          _os_log_impl(&dword_1BA902000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Dynamic parameter ID '%@':", (uint8_t *)&v101, 0x26u);
        }
      }
    }
  }
  uint64_t v12 = +[CHHapticEngine capabilitiesForHardware];
  uint64_t v13 = [v4 parameterID];
  int v14 = [v13 isEqualToString:CHHapticDynamicParameterIDHapticIntensityControl];

  if (v14)
  {
    if (kHAPIScope)
    {
      if (*(unsigned char *)(kHAPIScope + 8))
      {
        unint64_t v15 = *(id *)kHAPIScope;
        if (v15)
        {
          id v16 = v15;
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            int v101 = 136316162;
            __int16 v102 = "HapticCommandConverter.mm";
            __int16 v103 = 1024;
            int v104 = 593;
            __int16 v105 = 2080;
            v106 = "-[HapticCommandConverter eventForDynamicParameterEntry:]";
            __int16 v107 = 2048;
            double v108 = v6;
            __int16 v109 = 2048;
            uint64_t v110 = v8;
            _os_log_impl(&dword_1BA902000, v16, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Creating event for haptic volume %f for time %f seconds", (uint8_t *)&v101, 0x30u);
          }
        }
      }
    }
    __int16 v17 = (void *)MEMORY[0x1E4F4EAC0];
    int v18 = [v4 parameterID];
    *(float *)&double v19 = v6;
    [(HapticCommandConverter *)self limitDynamicParameter:v12 value:v18 parameter:v19];
    uint64_t v20 = objc_msgSend(v17, "eventWithParameter:value:time:", 2000);
  }
  else
  {
    int v21 = [v4 parameterID];
    int v22 = [v21 isEqualToString:CHHapticDynamicParameterIDHapticSharpnessControl];

    if (v22)
    {
      if (kHAPIScope)
      {
        if (*(unsigned char *)(kHAPIScope + 8))
        {
          int v23 = *(id *)kHAPIScope;
          if (v23)
          {
            int v24 = v23;
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              int v101 = 136316162;
              __int16 v102 = "HapticCommandConverter.mm";
              __int16 v103 = 1024;
              int v104 = 597;
              __int16 v105 = 2080;
              v106 = "-[HapticCommandConverter eventForDynamicParameterEntry:]";
              __int16 v107 = 2048;
              double v108 = v6;
              __int16 v109 = 2048;
              uint64_t v110 = v8;
              _os_log_impl(&dword_1BA902000, v24, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Creating event for haptic transposition %f for time %f seconds", (uint8_t *)&v101, 0x30u);
            }
          }
        }
      }
      double v25 = (void *)MEMORY[0x1E4F4EAC0];
      int v18 = [v4 parameterID];
      *(float *)&double v26 = v6;
      [(HapticCommandConverter *)self limitDynamicParameter:v12 value:v18 parameter:v26];
      uint64_t v20 = objc_msgSend(v25, "eventWithParameter:value:time:", 2001);
    }
    else
    {
      int v27 = [v4 parameterID];
      int v28 = [v27 isEqualToString:CHHapticDynamicParameterIDHapticAttackTimeControl];

      if (v28)
      {
        if (kHAPIScope)
        {
          if (*(unsigned char *)(kHAPIScope + 8))
          {
            uint64_t v29 = *(id *)kHAPIScope;
            if (v29)
            {
              char v30 = v29;
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
              {
                int v101 = 136316162;
                __int16 v102 = "HapticCommandConverter.mm";
                __int16 v103 = 1024;
                int v104 = 601;
                __int16 v105 = 2080;
                v106 = "-[HapticCommandConverter eventForDynamicParameterEntry:]";
                __int16 v107 = 2048;
                double v108 = v6;
                __int16 v109 = 2048;
                uint64_t v110 = v8;
                _os_log_impl(&dword_1BA902000, v30, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Creating event for haptic attack time %f for time %f seconds", (uint8_t *)&v101, 0x30u);
              }
            }
          }
        }
        int v31 = (void *)MEMORY[0x1E4F4EAC0];
        int v18 = [v4 parameterID];
        *(float *)&double v32 = v6;
        [(HapticCommandConverter *)self limitDynamicParameter:v12 value:v18 parameter:v32];
        uint64_t v20 = objc_msgSend(v31, "eventWithParameter:value:time:", 2010);
      }
      else
      {
        int v33 = [v4 parameterID];
        int v34 = [v33 isEqualToString:CHHapticDynamicParameterIDHapticDecayTimeControl];

        if (v34)
        {
          if (kHAPIScope)
          {
            if (*(unsigned char *)(kHAPIScope + 8))
            {
              double v35 = *(id *)kHAPIScope;
              if (v35)
              {
                int v36 = v35;
                if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
                {
                  int v101 = 136316162;
                  __int16 v102 = "HapticCommandConverter.mm";
                  __int16 v103 = 1024;
                  int v104 = 605;
                  __int16 v105 = 2080;
                  v106 = "-[HapticCommandConverter eventForDynamicParameterEntry:]";
                  __int16 v107 = 2048;
                  double v108 = v6;
                  __int16 v109 = 2048;
                  uint64_t v110 = v8;
                  _os_log_impl(&dword_1BA902000, v36, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Creating event for haptic decay time %f for time %f seconds", (uint8_t *)&v101, 0x30u);
                }
              }
            }
          }
          uint64_t v37 = (void *)MEMORY[0x1E4F4EAC0];
          int v18 = [v4 parameterID];
          *(float *)&double v38 = v6;
          [(HapticCommandConverter *)self limitDynamicParameter:v12 value:v18 parameter:v38];
          uint64_t v20 = objc_msgSend(v37, "eventWithParameter:value:time:", 2011);
        }
        else
        {
          int v39 = [v4 parameterID];
          int v40 = [v39 isEqualToString:CHHapticDynamicParameterIDHapticReleaseTimeControl];

          if (v40)
          {
            if (kHAPIScope)
            {
              if (*(unsigned char *)(kHAPIScope + 8))
              {
                uint64_t v41 = *(id *)kHAPIScope;
                if (v41)
                {
                  double v42 = v41;
                  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
                  {
                    int v101 = 136316162;
                    __int16 v102 = "HapticCommandConverter.mm";
                    __int16 v103 = 1024;
                    int v104 = 609;
                    __int16 v105 = 2080;
                    v106 = "-[HapticCommandConverter eventForDynamicParameterEntry:]";
                    __int16 v107 = 2048;
                    double v108 = v6;
                    __int16 v109 = 2048;
                    uint64_t v110 = v8;
                    _os_log_impl(&dword_1BA902000, v42, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Creating event for haptic release time %f for time %f seconds", (uint8_t *)&v101, 0x30u);
                  }
                }
              }
            }
            int v43 = (void *)MEMORY[0x1E4F4EAC0];
            int v18 = [v4 parameterID];
            *(float *)&double v44 = v6;
            [(HapticCommandConverter *)self limitDynamicParameter:v12 value:v18 parameter:v44];
            uint64_t v20 = objc_msgSend(v43, "eventWithParameter:value:time:", 2012);
          }
          else
          {
            int v45 = [v4 parameterID];
            int v46 = [v45 isEqualToString:CHHapticDynamicParameterIDAudioVolumeControl];

            if (v46)
            {
              uint64_t v48 = CALog::LogObjIfEnabled((CALog *)6, kHAPIScope, v47);
              unint64_t v49 = v48;
              if (v48 && os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
              {
                int v101 = 136316162;
                __int16 v102 = "HapticCommandConverter.mm";
                __int16 v103 = 1024;
                int v104 = 613;
                __int16 v105 = 2080;
                v106 = "-[HapticCommandConverter eventForDynamicParameterEntry:]";
                __int16 v107 = 2048;
                double v108 = v6;
                __int16 v109 = 2048;
                uint64_t v110 = v8;
                _os_log_impl(&dword_1BA902000, v49, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Creating event for audio volume %f for time %f seconds", (uint8_t *)&v101, 0x30u);
              }

              unint64_t v50 = (void *)MEMORY[0x1E4F4EAC0];
              int v18 = [v4 parameterID];
              *(float *)&double v51 = v6;
              [(HapticCommandConverter *)self limitDynamicParameter:v12 value:v18 parameter:v51];
              uint64_t v20 = objc_msgSend(v50, "eventWithParameter:value:time:", 1000);
            }
            else
            {
              unint64_t v52 = [v4 parameterID];
              int v53 = [v52 isEqualToString:CHHapticDynamicParameterIDAudioBrightnessControl];

              if (v53)
              {
                uint64_t v55 = CALog::LogObjIfEnabled((CALog *)6, kHAPIScope, v54);
                uint64_t v56 = v55;
                if (v55 && os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
                {
                  int v101 = 136316162;
                  __int16 v102 = "HapticCommandConverter.mm";
                  __int16 v103 = 1024;
                  int v104 = 617;
                  __int16 v105 = 2080;
                  v106 = "-[HapticCommandConverter eventForDynamicParameterEntry:]";
                  __int16 v107 = 2048;
                  double v108 = v6;
                  __int16 v109 = 2048;
                  uint64_t v110 = v8;
                  _os_log_impl(&dword_1BA902000, v56, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Creating event for audio brightness %f for time %f seconds", (uint8_t *)&v101, 0x30u);
                }

                unint64_t v57 = (void *)MEMORY[0x1E4F4EAC0];
                int v18 = [v4 parameterID];
                *(float *)&double v58 = v6;
                [(HapticCommandConverter *)self limitDynamicParameter:v12 value:v18 parameter:v58];
                uint64_t v20 = objc_msgSend(v57, "eventWithParameter:value:time:", 1013);
              }
              else
              {
                unint64_t v59 = [v4 parameterID];
                int v60 = [v59 isEqualToString:CHHapticDynamicParameterIDAudioPanControl];

                if (v60)
                {
                  id v62 = CALog::LogObjIfEnabled((CALog *)6, kHAPIScope, v61);
                  long long v63 = v62;
                  if (v62 && os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
                  {
                    int v101 = 136316162;
                    __int16 v102 = "HapticCommandConverter.mm";
                    __int16 v103 = 1024;
                    int v104 = 621;
                    __int16 v105 = 2080;
                    v106 = "-[HapticCommandConverter eventForDynamicParameterEntry:]";
                    __int16 v107 = 2048;
                    double v108 = v6;
                    __int16 v109 = 2048;
                    uint64_t v110 = v8;
                    _os_log_impl(&dword_1BA902000, v63, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Creating event for audio pan %f for time %f seconds", (uint8_t *)&v101, 0x30u);
                  }

                  uint64_t v64 = (void *)MEMORY[0x1E4F4EAC0];
                  int v18 = [v4 parameterID];
                  *(float *)&double v65 = v6;
                  [(HapticCommandConverter *)self limitDynamicParameter:v12 value:v18 parameter:v65];
                  uint64_t v20 = objc_msgSend(v64, "eventWithParameter:value:time:", 1015);
                }
                else
                {
                  id v66 = [v4 parameterID];
                  int v67 = [v66 isEqualToString:CHHapticDynamicParameterIDAudioPitchControl];

                  if (v67)
                  {
                    long long v69 = CALog::LogObjIfEnabled((CALog *)6, kHAPIScope, v68);
                    long long v70 = v69;
                    if (v69 && os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
                    {
                      int v101 = 136316162;
                      __int16 v102 = "HapticCommandConverter.mm";
                      __int16 v103 = 1024;
                      int v104 = 625;
                      __int16 v105 = 2080;
                      v106 = "-[HapticCommandConverter eventForDynamicParameterEntry:]";
                      __int16 v107 = 2048;
                      double v108 = v6;
                      __int16 v109 = 2048;
                      uint64_t v110 = v8;
                      _os_log_impl(&dword_1BA902000, v70, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Creating event for audio transposition %f for time %f seconds", (uint8_t *)&v101, 0x30u);
                    }

                    long long v71 = (void *)MEMORY[0x1E4F4EAC0];
                    int v18 = [v4 parameterID];
                    *(float *)&double v72 = v6;
                    [(HapticCommandConverter *)self limitDynamicParameter:v12 value:v18 parameter:v72];
                    uint64_t v20 = objc_msgSend(v71, "eventWithParameter:value:time:", 1001);
                  }
                  else
                  {
                    uint64_t v73 = [v4 parameterID];
                    int v74 = [v73 isEqualToString:CHHapticDynamicParameterIDAudioAttackTimeControl];

                    if (v74)
                    {
                      int v76 = CALog::LogObjIfEnabled((CALog *)6, kHAPIScope, v75);
                      char v77 = v76;
                      if (v76 && os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
                      {
                        int v101 = 136316162;
                        __int16 v102 = "HapticCommandConverter.mm";
                        __int16 v103 = 1024;
                        int v104 = 629;
                        __int16 v105 = 2080;
                        v106 = "-[HapticCommandConverter eventForDynamicParameterEntry:]";
                        __int16 v107 = 2048;
                        double v108 = v6;
                        __int16 v109 = 2048;
                        uint64_t v110 = v8;
                        _os_log_impl(&dword_1BA902000, v77, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Creating event for audio attack time %f for time %f seconds", (uint8_t *)&v101, 0x30u);
                      }

                      double v78 = (void *)MEMORY[0x1E4F4EAC0];
                      int v18 = [v4 parameterID];
                      *(float *)&double v79 = v6;
                      [(HapticCommandConverter *)self limitDynamicParameter:v12 value:v18 parameter:v79];
                      uint64_t v20 = objc_msgSend(v78, "eventWithParameter:value:time:", 1010);
                    }
                    else
                    {
                      int v80 = [v4 parameterID];
                      int v81 = [v80 isEqualToString:CHHapticDynamicParameterIDAudioDecayTimeControl];

                      if (v81)
                      {
                        __int16 v83 = CALog::LogObjIfEnabled((CALog *)6, kHAPIScope, v82);
                        long long v84 = v83;
                        if (v83 && os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
                        {
                          int v101 = 136316162;
                          __int16 v102 = "HapticCommandConverter.mm";
                          __int16 v103 = 1024;
                          int v104 = 633;
                          __int16 v105 = 2080;
                          v106 = "-[HapticCommandConverter eventForDynamicParameterEntry:]";
                          __int16 v107 = 2048;
                          double v108 = v6;
                          __int16 v109 = 2048;
                          uint64_t v110 = v8;
                          _os_log_impl(&dword_1BA902000, v84, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Creating event for audio decay time %f for time %f seconds", (uint8_t *)&v101, 0x30u);
                        }

                        __int16 v85 = (void *)MEMORY[0x1E4F4EAC0];
                        int v18 = [v4 parameterID];
                        *(float *)&double v86 = v6;
                        [(HapticCommandConverter *)self limitDynamicParameter:v12 value:v18 parameter:v86];
                        uint64_t v20 = objc_msgSend(v85, "eventWithParameter:value:time:", 1011);
                      }
                      else
                      {
                        uint64_t v87 = [v4 parameterID];
                        int v88 = [v87 isEqualToString:CHHapticDynamicParameterIDAudioReleaseTimeControl];

                        if (!v88)
                        {
                          __int16 v96 = CALog::LogObjIfEnabled((CALog *)1, kHAPIScope, v89);
                          int v97 = v96;
                          if (v96)
                          {
                            __int16 v98 = v96;
                            if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
                            {
                              *(double *)&uint64_t v99 = [v4 parameterID];
                              int v101 = 136315906;
                              __int16 v102 = "HapticCommandConverter.mm";
                              __int16 v103 = 1024;
                              int v104 = 640;
                              __int16 v105 = 2080;
                              v106 = "-[HapticCommandConverter eventForDynamicParameterEntry:]";
                              __int16 v107 = 2112;
                              double v108 = *(double *)&v99;
                              __int16 v100 = (void *)v99;
                              _os_log_impl(&dword_1BA902000, v98, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Unrecognized dynamic parameter: %@", (uint8_t *)&v101, 0x26u);
                            }
                          }

                          Haptic_RaiseException(&cfstr_Corehapticinva.isa, &cfstr_UnknownDynamic.isa, -4820);
                        }
                        v90 = CALog::LogObjIfEnabled((CALog *)6, kHAPIScope, v89);
                        __int16 v91 = v90;
                        if (v90 && os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
                        {
                          int v101 = 136316162;
                          __int16 v102 = "HapticCommandConverter.mm";
                          __int16 v103 = 1024;
                          int v104 = 637;
                          __int16 v105 = 2080;
                          v106 = "-[HapticCommandConverter eventForDynamicParameterEntry:]";
                          __int16 v107 = 2048;
                          double v108 = v6;
                          __int16 v109 = 2048;
                          uint64_t v110 = v8;
                          _os_log_impl(&dword_1BA902000, v91, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Creating event for audio release time %f for time %f seconds", (uint8_t *)&v101, 0x30u);
                        }

                        int v92 = (void *)MEMORY[0x1E4F4EAC0];
                        int v18 = [v4 parameterID];
                        *(float *)&double v93 = v6;
                        [(HapticCommandConverter *)self limitDynamicParameter:v12 value:v18 parameter:v93];
                        uint64_t v20 = objc_msgSend(v92, "eventWithParameter:value:time:", 1012);
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  int v94 = (void *)v20;

  return v94;
}

- (id)eventForParameterCurveEntry:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (kHAPIScope)
  {
    if (*(unsigned char *)(kHAPIScope + 8))
    {
      id v5 = *(id *)kHAPIScope;
      if (v5)
      {
        float v6 = v5;
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v7 = [v4 parameterID];
          [v4 relativeTime];
          int v12 = 136316162;
          uint64_t v13 = "HapticCommandConverter.mm";
          __int16 v14 = 1024;
          int v15 = 647;
          __int16 v16 = 2080;
          __int16 v17 = "-[HapticCommandConverter eventForParameterCurveEntry:]";
          __int16 v18 = 2112;
          double v19 = v7;
          __int16 v20 = 2048;
          uint64_t v21 = v8;
          _os_log_impl(&dword_1BA902000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Parameter curve ID: '%@', relative time: %f", (uint8_t *)&v12, 0x30u);
        }
      }
    }
  }
  id v9 = [(HapticCommandConverter *)self CHtoAVParameterCurve:v4];
  id v10 = [MEMORY[0x1E4F4EAC0] eventWithParameterCurve:v9];

  return v10;
}

- (id)CHtoAVParameterCurve:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 controlPoints];
  unint64_t v6 = [v5 count];

  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v6];
  uint64_t v8 = +[CHHapticEngine capabilitiesForHardware];
  if (v6)
  {
    uint64_t v9 = 0;
    unsigned int v10 = 1;
    do
    {
      double v11 = [v4 controlPoints];
      int v12 = [v11 objectAtIndex:v9];
      [v12 relativeTime];
      double v14 = v13;

      int v15 = [v4 controlPoints];
      __int16 v16 = [v15 objectAtIndex:v9];
      [v16 value];
      int v18 = v17;

      double v19 = [v4 parameterID];
      LODWORD(v20) = v18;
      [(HapticCommandConverter *)self limitDynamicParameter:v8 value:v19 parameter:v20];
      int v22 = v21;

      id v23 = objc_alloc(MEMORY[0x1E4F4EAD0]);
      LODWORD(v24) = v22;
      double v25 = (void *)[v23 initWithTime:v14 value:v24];
      [v7 addObject:v25];

      uint64_t v9 = v10;
    }
    while (v6 > v10++);
  }
  int v27 = [v4 parameterID];
  char v28 = [v27 isEqualToString:CHHapticDynamicParameterIDAudioVolumeControl];

  if (v28)
  {
    uint64_t v29 = 1000;
  }
  else
  {
    char v30 = [v4 parameterID];
    char v31 = [v30 isEqualToString:CHHapticDynamicParameterIDAudioPanControl];

    if (v31)
    {
      uint64_t v29 = 1015;
    }
    else
    {
      double v32 = [v4 parameterID];
      char v33 = [v32 isEqualToString:CHHapticDynamicParameterIDAudioBrightnessControl];

      if (v33)
      {
        uint64_t v29 = 1013;
      }
      else
      {
        int v34 = [v4 parameterID];
        char v35 = [v34 isEqualToString:CHHapticDynamicParameterIDAudioPitchControl];

        if (v35)
        {
          uint64_t v29 = 1001;
        }
        else
        {
          int v36 = [v4 parameterID];
          char v37 = [v36 isEqualToString:CHHapticDynamicParameterIDHapticIntensityControl];

          if (v37)
          {
            uint64_t v29 = 2000;
          }
          else
          {
            double v38 = [v4 parameterID];
            char v39 = [v38 isEqualToString:CHHapticDynamicParameterIDHapticSharpnessControl];

            if ((v39 & 1) == 0)
            {
              double v44 = CALog::LogObjIfEnabled((CALog *)1, kHAPIScope, v40);
              int v45 = v44;
              if (v44)
              {
                int v46 = v44;
                if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
                {
                  unint64_t v47 = [v4 parameterID];
                  int v48 = 136315906;
                  unint64_t v49 = "HapticCommandConverter.mm";
                  __int16 v50 = 1024;
                  int v51 = 691;
                  __int16 v52 = 2080;
                  int v53 = "-[HapticCommandConverter CHtoAVParameterCurve:]";
                  __int16 v54 = 2112;
                  uint64_t v55 = v47;
                  _os_log_impl(&dword_1BA902000, v46, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: ID %@ is not supported by parameter curves", (uint8_t *)&v48, 0x26u);
                }
              }

              Haptic_RaiseException(&cfstr_Corehapticinva.isa, &cfstr_InvalidDynamic.isa, -4820);
            }
            uint64_t v29 = 2001;
          }
        }
      }
    }
  }
  id v41 = objc_alloc(MEMORY[0x1E4F4EAC8]);
  [v4 relativeTime];
  double v42 = objc_msgSend(v41, "initWithType:relativeTime:shape:controlPoints:", v29, 1, v7);

  return v42;
}

@end