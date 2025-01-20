@interface HapticDictionaryWriter
- (id)eventParamsToArray:(id)a3;
- (id)eventToDictionary:(id)a3 embeddedResourceInfo:(id)a4;
- (id)paramCurveControlPointsToArray:(id)a3;
- (id)paramCurveToDictionary:(id)a3;
- (id)paramToDictionary:(id)a3;
- (id)patternToDictionary:(id)a3 events:(id)a4 parameters:(id)a5 parameterCurves:(id)a6 embeddedResourceInfo:(id)a7 configuration:(id)a8;
@end

@implementation HapticDictionaryWriter

- (id)patternToDictionary:(id)a3 events:(id)a4 parameters:(id)a5 parameterCurves:(id)a6 embeddedResourceInfo:(id)a7 configuration:(id)a8
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v44 = a4;
  id v43 = a5;
  id v42 = a6;
  id v15 = a7;
  id v45 = a8;
  v41 = v14;
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v16 setObject:v14 forKeyedSubscript:CHHapticPatternKeyVersion];
  if (v45)
  {
    v17 = (void *)[v45 copy];
    [v16 setObject:v17 forKeyedSubscript:CHHapticPatternKeyConfiguration];
  }
  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v16 setObject:v18 forKeyedSubscript:CHHapticPatternKeyPattern];

  if ([v44 count])
  {
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v19 = v44;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v54 objects:v60 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v55 != v21) {
            objc_enumerationMutation(v19);
          }
          uint64_t v23 = *(void *)(*((void *)&v54 + 1) + 8 * i);
          v24 = [v16 objectForKeyedSubscript:CHHapticPatternKeyPattern];
          v25 = [(HapticDictionaryWriter *)self eventToDictionary:v23 embeddedResourceInfo:v15];
          [v24 addObject:v25];
        }
        uint64_t v20 = [v19 countByEnumeratingWithState:&v54 objects:v60 count:16];
      }
      while (v20);
    }
  }
  if ([v43 count])
  {
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v26 = v43;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v50 objects:v59 count:16];
    if (v27)
    {
      uint64_t v28 = *(void *)v51;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v51 != v28) {
            objc_enumerationMutation(v26);
          }
          uint64_t v30 = *(void *)(*((void *)&v50 + 1) + 8 * j);
          v31 = [v16 objectForKeyedSubscript:CHHapticPatternKeyPattern];
          v32 = [(HapticDictionaryWriter *)self paramToDictionary:v30];
          [v31 addObject:v32];
        }
        uint64_t v27 = [v26 countByEnumeratingWithState:&v50 objects:v59 count:16];
      }
      while (v27);
    }
  }
  if ([v42 count])
  {
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v33 = v42;
    uint64_t v34 = [v33 countByEnumeratingWithState:&v46 objects:v58 count:16];
    if (v34)
    {
      uint64_t v35 = *(void *)v47;
      do
      {
        for (uint64_t k = 0; k != v34; ++k)
        {
          if (*(void *)v47 != v35) {
            objc_enumerationMutation(v33);
          }
          uint64_t v37 = *(void *)(*((void *)&v46 + 1) + 8 * k);
          v38 = [v16 objectForKeyedSubscript:CHHapticPatternKeyPattern];
          v39 = [(HapticDictionaryWriter *)self paramCurveToDictionary:v37];
          [v38 addObject:v39];
        }
        uint64_t v34 = [v33 countByEnumeratingWithState:&v46 objects:v58 count:16];
      }
      while (v34);
    }
  }

  return v16;
}

- (id)eventToDictionary:(id)a3 embeddedResourceInfo:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v8 setObject:v9 forKeyedSubscript:CHHapticPatternKeyEvent];

  v10 = [v8 objectForKeyedSubscript:CHHapticPatternKeyEvent];
  v11 = [v6 type];
  int v12 = [v11 isEqualToString:CHHapticEventTypeAudioCustom];

  if (v12)
  {
    if (kHAPIScope)
    {
      v13 = *(id *)kHAPIScope;
      if (!v13) {
        goto LABEL_9;
      }
    }
    else
    {
      v13 = MEMORY[0x1E4F14500];
      id v14 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v31 = 136315650;
      v32 = "HapticDictionaryWriter.mm";
      __int16 v33 = 1024;
      int v34 = 74;
      __int16 v35 = 2080;
      v36 = "-[HapticDictionaryWriter eventToDictionary:embeddedResourceInfo:]";
      _os_log_impl(&dword_1BA902000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Cannot export AudioCustom events", (uint8_t *)&v31, 0x1Cu);
    }

LABEL_9:
    Haptic_RaiseException(&cfstr_Corehapticsope.isa, &cfstr_CannotExportAu.isa, -4806);
  }
  id v15 = [v6 type];
  int v16 = [v15 isEqualToString:CHHapticEventTypeAudioResourceIndex];

  if (v16)
  {
    [v10 setObject:CHHapticEventTypeAudioCustom forKeyedSubscript:CHHapticPatternKeyEventType];
    v17 = objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v6, "audioResID"));
    id v18 = [v17 url];
    id v19 = [v18 path];
    [v10 setObject:v19 forKeyedSubscript:CHHapticPatternKeyEventWaveformPath];

    uint64_t v20 = objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v6, "audioResID"));
    uint64_t v21 = [v20 options];

    if (v21)
    {
      v22 = [v21 objectForKey:CHHapticPatternKeyEventWaveformUseVolumeEnvelope];
      if (([v22 BOOLValue] & 1) == 0) {
        [v10 setObject:v22 forKeyedSubscript:CHHapticPatternKeyEventWaveformUseVolumeEnvelope];
      }
      uint64_t v23 = [v21 objectForKey:CHHapticPatternKeyEventWaveformLoopEnabled];

      if ([v23 BOOLValue]) {
        [v10 setObject:v23 forKeyedSubscript:CHHapticPatternKeyEventWaveformLoopEnabled];
      }
    }
  }
  else
  {
    uint64_t v21 = [v6 type];
    [v10 setObject:v21 forKeyedSubscript:CHHapticPatternKeyEventType];
  }

  v24 = NSNumber;
  [v6 relativeTime];
  v25 = objc_msgSend(v24, "numberWithDouble:");
  [v10 setObject:v25 forKeyedSubscript:CHHapticPatternKeyTime];

  id v26 = NSNumber;
  [v6 duration];
  uint64_t v27 = objc_msgSend(v26, "numberWithDouble:");
  [v10 setObject:v27 forKeyedSubscript:CHHapticPatternKeyEventDuration];

  uint64_t v28 = [v6 eventParameters];
  v29 = [(HapticDictionaryWriter *)self eventParamsToArray:v28];
  [v10 setObject:v29 forKeyedSubscript:CHHapticPatternKeyEventParameters];

  return v8;
}

- (id)eventParamsToArray:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  obuint64_t j = v13;
  uint64_t v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16, v13);
  if (v4)
  {
    uint64_t v5 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        id v9 = [v7 parameterID];
        [v8 setObject:v9 forKeyedSubscript:CHHapticPatternKeyParameterID];

        v10 = NSNumber;
        [v7 value];
        v11 = objc_msgSend(v10, "numberWithFloat:");
        [v8 setObject:v11 forKeyedSubscript:CHHapticPatternKeyParameterValue];

        [v3 addObject:v8];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }

  return v3;
}

- (id)paramToDictionary:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v4 setObject:v5 forKeyedSubscript:CHHapticPatternKeyParameter];

  id v6 = [v4 objectForKeyedSubscript:CHHapticPatternKeyParameter];
  id v7 = [v3 parameterID];
  [v6 setObject:v7 forKeyedSubscript:CHHapticPatternKeyParameterID];

  id v8 = NSNumber;
  [v3 relativeTime];
  id v9 = objc_msgSend(v8, "numberWithDouble:");
  [v6 setObject:v9 forKeyedSubscript:CHHapticPatternKeyTime];

  v10 = NSNumber;
  [v3 value];
  v11 = objc_msgSend(v10, "numberWithFloat:");
  [v6 setObject:v11 forKeyedSubscript:CHHapticPatternKeyParameterValue];

  return v4;
}

- (id)paramCurveToDictionary:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v5 setObject:v6 forKeyedSubscript:CHHapticPatternKeyParameterCurve];

  id v7 = [v5 objectForKeyedSubscript:CHHapticPatternKeyParameterCurve];
  id v8 = [v4 parameterID];
  [v7 setObject:v8 forKeyedSubscript:CHHapticPatternKeyParameterID];

  id v9 = NSNumber;
  [v4 relativeTime];
  v10 = objc_msgSend(v9, "numberWithDouble:");
  [v7 setObject:v10 forKeyedSubscript:CHHapticPatternKeyTime];

  v11 = [v4 controlPoints];
  int v12 = [(HapticDictionaryWriter *)self paramCurveControlPointsToArray:v11];
  [v7 setObject:v12 forKeyedSubscript:CHHapticPatternKeyParameterCurveControlPoints];

  return v5;
}

- (id)paramCurveControlPointsToArray:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  obuint64_t j = v14;
  uint64_t v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v22, 16, v14);
  if (v4)
  {
    uint64_t v5 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v20[0] = CHHapticPatternKeyTime;
        id v8 = NSNumber;
        [v7 relativeTime];
        id v9 = objc_msgSend(v8, "numberWithDouble:");
        v20[1] = CHHapticPatternKeyParameterValue;
        v21[0] = v9;
        v10 = NSNumber;
        [v7 value];
        v11 = objc_msgSend(v10, "numberWithFloat:");
        v21[1] = v11;
        int v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];

        [v3 addObject:v12];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v4);
  }

  return v3;
}

@end