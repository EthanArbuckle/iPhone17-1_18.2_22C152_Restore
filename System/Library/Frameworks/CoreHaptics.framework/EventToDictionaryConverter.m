@interface EventToDictionaryConverter
+ (id)convertEvents:(id)a3;
+ (id)eventTypeToNSString:(unint64_t)a3;
+ (id)paramTypeToNSString:(unint64_t)a3;
@end

@implementation EventToDictionaryConverter

+ (id)eventTypeToNSString:(unint64_t)a3
{
  v42[33] = *MEMORY[0x1E4F143B8];
  {
    v40 = [NSNumber numberWithUnsignedLong:32514];
    v41[0] = v40;
    v42[0] = @"AudioSineTransient";
    v39 = [NSNumber numberWithUnsignedLong:32513];
    v41[1] = v39;
    v42[1] = @"AudioSine";
    v38 = [NSNumber numberWithUnsignedLong:32611];
    v41[2] = v38;
    v42[2] = @"HapticSineTransient";
    v37 = [NSNumber numberWithUnsignedLong:32610];
    v41[3] = v37;
    v42[3] = @"HapticSine";
    v36 = [NSNumber numberWithUnsignedLong:15713];
    v41[4] = v36;
    v42[4] = @"HapticSineLow";
    v35 = [NSNumber numberWithUnsignedLong:15969];
    v41[5] = v35;
    v42[5] = @"HapticSineLowMid";
    v34 = [NSNumber numberWithUnsignedLong:16225];
    v41[6] = v34;
    v42[6] = @"HapticSineMid";
    v33 = [NSNumber numberWithUnsignedLong:16481];
    v41[7] = v33;
    v42[7] = @"HapticSineMidHigh";
    v32 = [NSNumber numberWithUnsignedLong:16737];
    v41[8] = v32;
    v42[8] = @"HapticSineHigh";
    v31 = [NSNumber numberWithUnsignedLong:8021];
    v41[9] = v31;
    v42[9] = @"HapticMicroTap2";
    v30 = [NSNumber numberWithUnsignedLong:11093];
    v41[10] = v30;
    v42[10] = @"HapticMicroTap3";
    v29 = [NSNumber numberWithUnsignedLong:14165];
    v41[11] = v29;
    v42[11] = @"HapticMicroTap4";
    v28 = [NSNumber numberWithUnsignedLong:17237];
    v41[12] = v28;
    v42[12] = @"HapticMicroTap5";
    v27 = [NSNumber numberWithUnsignedLong:20309];
    v41[13] = v27;
    v42[13] = @"HapticMicroTap6";
    v26 = [NSNumber numberWithUnsignedLong:23381];
    v41[14] = v26;
    v42[14] = @"HapticMicroTap7";
    v25 = [NSNumber numberWithUnsignedLong:26453];
    v41[15] = v25;
    v42[15] = @"HapticMicroTap8";
    v24 = [NSNumber numberWithUnsignedLong:29525];
    v41[16] = v24;
    v42[16] = @"HapticMicroTap9";
    v23 = [NSNumber numberWithUnsignedLong:8022];
    v41[17] = v23;
    v42[17] = @"HapticMiniTap2";
    v22 = [NSNumber numberWithUnsignedLong:11094];
    v41[18] = v22;
    v42[18] = @"HapticMiniTap3";
    v21 = [NSNumber numberWithUnsignedLong:14166];
    v41[19] = v21;
    v42[19] = @"HapticMiniTap4";
    v20 = [NSNumber numberWithUnsignedLong:17238];
    v41[20] = v20;
    v42[20] = @"HapticMiniTap5";
    v19 = [NSNumber numberWithUnsignedLong:20310];
    v41[21] = v19;
    v42[21] = @"HapticMiniTap6";
    v18 = [NSNumber numberWithUnsignedLong:23382];
    v41[22] = v18;
    v42[22] = @"HapticMiniTap7";
    v17 = [NSNumber numberWithUnsignedLong:26454];
    v41[23] = v17;
    v42[23] = @"HapticMiniTap8";
    v16 = [NSNumber numberWithUnsignedLong:29526];
    v41[24] = v16;
    v42[24] = @"HapticMiniTap9";
    v15 = [NSNumber numberWithUnsignedLong:8023];
    v41[25] = v15;
    v42[25] = @"HapticFullTap2";
    v8 = [NSNumber numberWithUnsignedLong:11095];
    v41[26] = v8;
    v42[26] = @"HapticFullTap3";
    v9 = [NSNumber numberWithUnsignedLong:14167];
    v41[27] = v9;
    v42[27] = @"HapticFullTap4";
    v10 = [NSNumber numberWithUnsignedLong:17239];
    v41[28] = v10;
    v42[28] = @"HapticFullTap5";
    v11 = [NSNumber numberWithUnsignedLong:20311];
    v41[29] = v11;
    v42[29] = @"HapticFullTap6";
    v12 = [NSNumber numberWithUnsignedLong:23383];
    v41[30] = v12;
    v42[30] = @"HapticFullTap7";
    v13 = [NSNumber numberWithUnsignedLong:26455];
    v41[31] = v13;
    v42[31] = @"HapticFullTap8";
    v14 = [NSNumber numberWithUnsignedLong:29527];
    v41[32] = v14;
    v42[32] = @"HapticFullTap9";
    +[EventToDictionaryConverter eventTypeToNSString:]::eventDict = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:33];
  }
  v4 = (void *)+[EventToDictionaryConverter eventTypeToNSString:]::eventDict;
  v5 = [NSNumber numberWithUnsignedLong:a3];
  v6 = [v4 objectForKey:v5];

  return v6;
}

+ (id)paramTypeToNSString:(unint64_t)a3
{
  v21[11] = *MEMORY[0x1E4F143B8];
  {
    unint64_t v16 = a3;
    v19 = [NSNumber numberWithUnsignedLong:1000];
    v20[0] = v19;
    v21[0] = @"AudioVolume";
    v18 = [NSNumber numberWithUnsignedLong:1001];
    v20[1] = v18;
    v21[1] = @"AudioTransposition";
    v17 = [NSNumber numberWithUnsignedLong:1010];
    v20[2] = v17;
    v21[2] = @"AudioAttackTime";
    v8 = [NSNumber numberWithUnsignedLong:1011];
    v20[3] = v8;
    v21[3] = @"AudioDecayTime";
    v9 = [NSNumber numberWithUnsignedLong:1012];
    v20[4] = v9;
    v21[4] = @"AudioReleaseTime";
    v10 = [NSNumber numberWithUnsignedLong:1013];
    v20[5] = v10;
    v21[5] = @"AudioLPFilterCutoff";
    v11 = [NSNumber numberWithUnsignedLong:2000];
    v20[6] = v11;
    v21[6] = @"HapticVolume";
    v12 = [NSNumber numberWithUnsignedLong:2001];
    v20[7] = v12;
    v21[7] = @"HapticTransposition";
    v13 = [NSNumber numberWithUnsignedLong:2010];
    v20[8] = v13;
    v21[8] = @"HapticAttackTime";
    v14 = [NSNumber numberWithUnsignedLong:2011];
    v20[9] = v14;
    v21[9] = @"HapticDecayTime";
    v15 = [NSNumber numberWithUnsignedLong:2012];
    v20[10] = v15;
    v21[10] = @"HapticReleaseTime";
    +[EventToDictionaryConverter paramTypeToNSString:]::paramDict = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:11];

    a3 = v16;
  }
  v4 = (void *)+[EventToDictionaryConverter paramTypeToNSString:]::paramDict;
  v5 = [NSNumber numberWithUnsignedLong:a3];
  v6 = [v4 objectForKey:v5];

  return v6;
}

+ (id)convertEvents:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v39 = a3;
  id v40 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v39;
  uint64_t v3 = [obj countByEnumeratingWithState:&v44 objects:v56 count:16];
  if (v3)
  {
    uint64_t v43 = *(void *)v45;
    do
    {
      uint64_t v4 = 0;
      uint64_t v42 = v3;
      do
      {
        if (*(void *)v45 != v43) {
          objc_enumerationMutation(obj);
        }
        v5 = *(void **)(*((void *)&v44 + 1) + 8 * v4);
        if ([v5 eventCategory] == 1)
        {
          v6 = +[EventToDictionaryConverter paramTypeToNSString:](EventToDictionaryConverter, "paramTypeToNSString:", [v5 paramType]);
          if (v6)
          {
            v7 = (void *)MEMORY[0x1E4F1C9E8];
            v8 = NSNumber;
            [v5 value];
            v9 = objc_msgSend(v8, "numberWithFloat:");
            v10 = NSNumber;
            [v5 time];
            *(float *)&double v11 = v11;
            v12 = [v10 numberWithFloat:v11];
            v13 = objc_msgSend(v7, "dictionaryWithObjectsAndKeys:", v6, @"Type", v9, @"Value", v12, @"Time", 0);

            v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v13 forKey:@"Param"];
            [v40 addObject:v14];
            goto LABEL_38;
          }
          if (kHAPIScope)
          {
            id v28 = *(id *)kHAPIScope;
            if (v28) {
              goto LABEL_28;
            }
            goto LABEL_39;
          }
          v29 = (void *)MEMORY[0x1E4F14500];
          id v30 = MEMORY[0x1E4F14500];
          id v28 = v29;
LABEL_28:
          v14 = v28;
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            int v31 = [v5 paramType];
            *(_DWORD *)buf = 136315906;
            v49 = "EventToDictionaryConverter.mm";
            __int16 v50 = 1024;
            int v51 = 111;
            __int16 v52 = 2080;
            v53 = "+[EventToDictionaryConverter convertEvents:]";
            __int16 v54 = 1024;
            int v55 = v31;
            v32 = v14;
LABEL_36:
            _os_log_impl(&dword_1BA902000, v32, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Unknown param type: %u", buf, 0x22u);
            goto LABEL_37;
          }
          goto LABEL_37;
        }
        if ([v5 eventCategory]) {
          goto LABEL_40;
        }
        v6 = +[EventToDictionaryConverter eventTypeToNSString:](EventToDictionaryConverter, "eventTypeToNSString:", [v5 eventType]);
        if (v6)
        {
          v15 = (void *)MEMORY[0x1E4F1CA60];
          unint64_t v16 = NSNumber;
          [v5 time];
          *(float *)&double v17 = v17;
          v18 = [v16 numberWithFloat:v17];
          v13 = objc_msgSend(v15, "dictionaryWithObjectsAndKeys:", v6, @"Type", v18, @"Time", 0);

          for (unsigned int i = 0; ; unsigned int i = v20 + 1)
          {
            uint64_t v20 = i;
            if ([v5 fixedParamCount] <= i)
            {
              v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v13 forKey:@"Event"];
              [v40 addObject:v14];
              goto LABEL_38;
            }
            uint64_t v21 = [v5 fixedParams];
            v22 = (void *)(v21 + 16 * i);
            v23 = +[EventToDictionaryConverter paramTypeToNSString:*v22];
            if (v23) {
              break;
            }
            if (!kHAPIScope)
            {
              v25 = MEMORY[0x1E4F14500];
              id v26 = MEMORY[0x1E4F14500];
LABEL_21:
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                uint64_t v27 = *v22;
                *(_DWORD *)buf = 136315906;
                v49 = "EventToDictionaryConverter.mm";
                __int16 v50 = 1024;
                int v51 = 128;
                __int16 v52 = 2080;
                v53 = "+[EventToDictionaryConverter convertEvents:]";
                __int16 v54 = 1024;
                int v55 = v27;
                _os_log_impl(&dword_1BA902000, v25, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Unknown event param type: %u", buf, 0x22u);
              }
LABEL_15:

              goto LABEL_16;
            }
            v25 = *(id *)kHAPIScope;
            if (v25) {
              goto LABEL_21;
            }
LABEL_16:
          }
          LODWORD(v24) = *(_DWORD *)(v21 + 16 * v20 + 8);
          v25 = [NSNumber numberWithFloat:v24];
          [v13 setObject:v25 forKeyedSubscript:v23];
          goto LABEL_15;
        }
        if (!kHAPIScope)
        {
          v34 = (void *)MEMORY[0x1E4F14500];
          id v35 = MEMORY[0x1E4F14500];
          id v33 = v34;
LABEL_34:
          v14 = v33;
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            int v36 = [v5 eventType];
            *(_DWORD *)buf = 136315906;
            v49 = "EventToDictionaryConverter.mm";
            __int16 v50 = 1024;
            int v51 = 134;
            __int16 v52 = 2080;
            v53 = "+[EventToDictionaryConverter convertEvents:]";
            __int16 v54 = 1024;
            int v55 = v36;
            v32 = v14;
            goto LABEL_36;
          }
LABEL_37:
          v13 = v14;
LABEL_38:

          goto LABEL_39;
        }
        id v33 = *(id *)kHAPIScope;
        if (v33) {
          goto LABEL_34;
        }
LABEL_39:

        uint64_t v3 = v42;
LABEL_40:
        ++v4;
      }
      while (v4 != v3);
      uint64_t v3 = [obj countByEnumeratingWithState:&v44 objects:v56 count:16];
    }
    while (v3);
  }

  v37 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v40, @"Pattern", 0);

  return v37;
}

@end