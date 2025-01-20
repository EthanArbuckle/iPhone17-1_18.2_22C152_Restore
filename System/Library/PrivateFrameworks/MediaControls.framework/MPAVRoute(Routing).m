@interface MPAVRoute(Routing)
- (id)routingBatteryTextWithFormatter:()Routing;
- (id)routingPairedDeviceText;
@end

@implementation MPAVRoute(Routing)

- (id)routingBatteryTextWithFormatter:()Routing
{
  id v4 = a3;
  v5 = [a1 batteryLevel];
  v6 = [v5 leftPercentage];
  if (v6)
  {
    v7 = [v5 rightPercentage];
    if (v7)
    {
      v8 = [v5 leftPercentage];
      [v8 floatValue];
      float v10 = v9;
      v11 = [v5 rightPercentage];
      [v11 floatValue];
      BOOL v13 = vabds_f32(v10, v12) >= 0.1;
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  uint64_t v14 = [v5 leftPercentage];
  if (!v14
    || ((v15 = (void *)v14,
         [v5 rightPercentage],
         (v16 = objc_claimAutoreleasedReturnValue()) != 0)
      ? (BOOL v17 = v13)
      : (BOOL v17 = 0),
        v16,
        v15,
        !v17))
  {
    uint64_t v23 = [v5 leftPercentage];
    if (v23)
    {
      v24 = (void *)v23;
      v25 = [v5 rightPercentage];

      if (v25)
      {
        v26 = [v5 leftPercentage];
        [v26 floatValue];
        float v28 = v27;
        v29 = [v5 rightPercentage];
        [v29 floatValue];
        if (v28 < v30) {
          [v5 leftPercentage];
        }
        else {
        v18 = [v5 rightPercentage];
        }

LABEL_23:
        v19 = [v4 stringFromNumber:v18];
        uint64_t v32 = +[MRUStringsProvider accessoryBatteryLevelSingle:v19];
        goto LABEL_24;
      }
    }
    v31 = [v5 leftPercentage];

    if (v31)
    {
      v18 = [v5 leftPercentage];
      v19 = [v4 stringFromNumber:v18];
      uint64_t v32 = +[MRUStringsProvider accessoryBatteryLevelLeft:v19];
    }
    else
    {
      v33 = [v5 rightPercentage];

      if (!v33)
      {
        v22 = [v5 singlePercentage];

        if (!v22) {
          goto LABEL_26;
        }
        v18 = [v5 singlePercentage];
        goto LABEL_23;
      }
      v18 = [v5 rightPercentage];
      v19 = [v4 stringFromNumber:v18];
      uint64_t v32 = +[MRUStringsProvider accessoryBatteryLevelRight:v19];
    }
LABEL_24:
    v22 = (void *)v32;
    goto LABEL_25;
  }
  v18 = [v5 leftPercentage];
  v19 = [v4 stringFromNumber:v18];
  v20 = [v5 rightPercentage];
  v21 = [v4 stringFromNumber:v20];
  v22 = +[MRUStringsProvider accessoryBatteryLevelCombinedLeft:v19 right:v21];

LABEL_25:
LABEL_26:
  v34 = [v5 casePercentage];

  if (!v34) {
    goto LABEL_30;
  }
  v35 = [v5 casePercentage];
  v36 = [v4 stringFromNumber:v35];
  v34 = +[MRUStringsProvider accessoryBatteryLevelCase:v36];

  if (!v22) {
    goto LABEL_30;
  }
  if (v34)
  {
    id v37 = [NSString stringWithFormat:@"%@  %@", v22, v34];
  }
  else
  {
LABEL_30:
    id v37 = v22;
  }
  v38 = v37;

  return v38;
}

- (id)routingPairedDeviceText
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (![a1 isPickedOnPairedDevice])
  {
    float v10 = 0;
    goto LABEL_18;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = objc_msgSend(a1, "auxiliaryDevices", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v3)
  {

    goto LABEL_15;
  }
  uint64_t v4 = v3;
  id v5 = 0;
  uint64_t v6 = *(void *)v13;
LABEL_4:
  uint64_t v7 = 0;
  v8 = v5;
  while (1)
  {
    if (*(void *)v13 != v6) {
      objc_enumerationMutation(v2);
    }
    id v5 = *(id *)(*((void *)&v12 + 1) + 8 * v7);

    if ([v5 isPlaying]) {
      break;
    }
    ++v7;
    v8 = v5;
    if (v4 == v7)
    {
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v4) {
        goto LABEL_4;
      }
      break;
    }
  }

  if (!v5)
  {
LABEL_15:
    float v9 = [a1 playingPairedDeviceName];
    if (!v9) {
      goto LABEL_12;
    }
LABEL_16:
    float v10 = +[MRUStringsProvider routingInUseOnPairedDevice:v9];
    goto LABEL_17;
  }
  float v9 = [v5 deviceName];

  if (v9) {
    goto LABEL_16;
  }
LABEL_12:
  float v10 = 0;
LABEL_17:

LABEL_18:

  return v10;
}

@end