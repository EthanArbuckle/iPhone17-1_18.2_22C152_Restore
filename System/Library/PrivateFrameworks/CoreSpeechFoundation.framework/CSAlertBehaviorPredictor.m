@interface CSAlertBehaviorPredictor
+ (int64_t)predictStartAlertBehaviorFor:(int64_t)a3 avSystemController:(id)a4 hasAOP:(BOOL)a5 supportVibrator:(BOOL)a6 isiOS:(BOOL)a7 isWatchOS:(BOOL)a8 isHorseman:(BOOL)a9 isBridgeOS:(BOOL)a10 recordRoute:(id)a11 playbackRoute:(id)a12;
+ (int64_t)predictStartAlertBehaviorFor:(int64_t)a3 recordRoute:(id)a4 playbackRoute:(id)a5;
@end

@implementation CSAlertBehaviorPredictor

+ (int64_t)predictStartAlertBehaviorFor:(int64_t)a3 avSystemController:(id)a4 hasAOP:(BOOL)a5 supportVibrator:(BOOL)a6 isiOS:(BOOL)a7 isWatchOS:(BOOL)a8 isHorseman:(BOOL)a9 isBridgeOS:(BOOL)a10 recordRoute:(id)a11 playbackRoute:(id)a12
{
  BOOL v12 = a8;
  BOOL v13 = a7;
  BOOL v36 = a6;
  BOOL v14 = a5;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v16 = a4;
  id v17 = a11;
  id v37 = a12;
  v38 = v17;
  int v18 = [v17 isEqualToString:*MEMORY[0x1E4F150E8]];
  int v19 = v18;
  int v20 = !v13 || a9;
  if (v14) {
    int v21 = (a10 | ~v20) & v18;
  }
  else {
    int v21 = 0;
  }
  v22 = (void *)MEMORY[0x1E4F74B30];
  if (v16
    && ([v16 attributeForKey:*MEMORY[0x1E4F74B30]],
        v23 = objc_claimAutoreleasedReturnValue(),
        char v24 = [v23 BOOLValue],
        v23,
        (v24 & 1) != 0))
  {
    int v25 = 1;
  }
  else
  {
    v26 = [MEMORY[0x1E4F74F60] sharedAVSystemController];
    v27 = [v26 attributeForKey:*v22];
    int v28 = [v27 BOOLValue];

    int v25 = v28 | v21;
  }
  v29 = v37;
  v30 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v40 = "+[CSAlertBehaviorPredictor predictStartAlertBehaviorFor:avSystemController:hasAOP:supportVibrator:isiOS:isWatc"
          "hOS:isHorseman:isBridgeOS:recordRoute:playbackRoute:]";
    __int16 v41 = 1026;
    int v42 = a3;
    __int16 v43 = 2114;
    v44 = v38;
    __int16 v45 = 2114;
    id v46 = v37;
    __int16 v47 = 1026;
    int v48 = v19;
    __int16 v49 = 1026;
    int v50 = v25;
    _os_log_impl(&dword_1BA1A5000, v30, OS_LOG_TYPE_DEFAULT, "%s Context(%{public}d) recordRoute(%{public}@) playbackRoute(%{public}@) isRouteToBuiltInMic(%{public}d) isZLLAvailable(%{public}d)", buf, 0x32u);
  }
  if (!v12)
  {
    if (v20)
    {
      int64_t v31 = a9 - 1;
      goto LABEL_21;
    }
    if ((unint64_t)a3 <= 0x1B)
    {
      if (((1 << a3) & 0xCD09C40) != 0) {
        goto LABEL_20;
      }
      if (((1 << a3) & 0x12) != 0)
      {
        if ([v37 isEqualToString:*MEMORY[0x1E4F15100]]) {
          int v33 = 0;
        }
        else {
          int v33 = [v37 isEqualToString:*MEMORY[0x1E4F15110]] ^ 1;
        }
        v34 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v40 = "+[CSAlertBehaviorPredictor predictStartAlertBehaviorFor:avSystemController:hasAOP:supportVibrator:isiOS:"
                "isWatchOS:isHorseman:isBridgeOS:recordRoute:playbackRoute:]";
          __int16 v41 = 1026;
          int v42 = v33;
          __int16 v43 = 1026;
          LODWORD(v44) = v36;
          _os_log_impl(&dword_1BA1A5000, v34, OS_LOG_TYPE_DEFAULT, "%s isHandsFree = %{public}d hasHaptic = %{public}d", buf, 0x18u);
        }
        if ((v36 | v25) == 1)
        {
          uint64_t v35 = 1;
          if (v33) {
            uint64_t v35 = 2;
          }
          if (v25) {
            int64_t v31 = 0;
          }
          else {
            int64_t v31 = v35;
          }
        }
        else
        {
          int64_t v31 = 2;
        }
        v29 = v37;
        goto LABEL_21;
      }
      if (a3 == 7)
      {
        if (v25) {
          int64_t v31 = 0;
        }
        else {
          int64_t v31 = 2;
        }
        goto LABEL_21;
      }
    }
    int64_t v31 = 2;
    goto LABEL_21;
  }
  if ((unint64_t)a3 > 0xF)
  {
LABEL_15:
    int64_t v31 = 1;
    goto LABEL_21;
  }
  if (((1 << a3) & 0x8E40) != 0)
  {
LABEL_20:
    int64_t v31 = 0;
    goto LABEL_21;
  }
  if ((1 << a3) & 0x1A) == 0 || ([v37 isEqualToString:*MEMORY[0x1E4F15100]]) {
    goto LABEL_15;
  }
  if ([v37 isEqualToString:*MEMORY[0x1E4F15110]]) {
    int64_t v31 = 1;
  }
  else {
    int64_t v31 = 2;
  }
LABEL_21:

  return v31;
}

+ (int64_t)predictStartAlertBehaviorFor:(int64_t)a3 recordRoute:(id)a4 playbackRoute:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  if (CSHasAOP_onceToken != -1) {
    dispatch_once(&CSHasAOP_onceToken, &__block_literal_global_38);
  }
  int v9 = CSHasAOP_hasAOP;
  if (CSSupportsVibrator_onceToken != -1) {
    dispatch_once(&CSSupportsVibrator_onceToken, &__block_literal_global_43);
  }
  int v10 = CSSupportsVibrator_hasHaptic;
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  LOWORD(v13) = CSIsHorseman_isHorseman;
  int64_t v11 = +[CSAlertBehaviorPredictor predictStartAlertBehaviorFor:avSystemController:hasAOP:supportVibrator:isiOS:isWatchOS:isHorseman:isBridgeOS:recordRoute:playbackRoute:](CSAlertBehaviorPredictor, "predictStartAlertBehaviorFor:avSystemController:hasAOP:supportVibrator:isiOS:isWatchOS:isHorseman:isBridgeOS:recordRoute:playbackRoute:", a3, 0, v9 != 0, v10 != 0, 1, 0, v13, v8, v7);

  return v11;
}

@end