@interface ATAudioSessionUtils
+ (__CFString)getAudioSessionPortType:(id)a3 forInput:(BOOL)a4;
+ (id)KVOProperties;
+ (id)categories;
+ (id)getAVASCategory:(unsigned int)a3;
+ (id)getAVASMode:(unsigned int)a3;
+ (id)getAVASProperty:(unsigned int)a3;
+ (id)getMappedObjectOf:(id)a3 inside:(id)a4 ofType:(int)a5;
+ (id)getPort:(id)a3 forInput:(BOOL)a4;
+ (id)getPorts:(id)a3 forInput:(BOOL)a4;
+ (id)getRouteDescriptionFromAVASRouteDescription:(id)a3;
+ (id)getRouteStringFromAVASRouteDescription:(id)a3;
+ (id)inputPortTypes;
+ (id)modes;
+ (id)outputPortTypes;
+ (unint64_t)getCategoryOptionFromPropertyID:(unsigned int)a3;
+ (unsigned)getAudioSessionCategory:(id)a3;
+ (unsigned)getAudioSessionMode:(id)a3;
+ (unsigned)getAudioSessionProperty:(id)a3;
@end

@implementation ATAudioSessionUtils

+ (id)getPort:(id)a3 forInput:(BOOL)a4
{
  BOOL v4 = a4;
  v10[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v9 = @"RouteDetailedDescription_PortType";
  v6 = [v5 portType];
  v10[0] = +[ATAudioSessionUtils getAudioSessionPortType:v6 forInput:v4];
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];

  return v7;
}

+ (id)getPorts:(id)a3 forInput:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = objc_msgSend(a1, "getPort:forInput:", *(void *)(*((void *)&v14 + 1) + 8 * i), v4, (void)v14);
        [v7 addObject:v12];
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v7;
}

+ (id)getRouteStringFromAVASRouteDescription:(id)a3
{
  id v4 = a3;
  id v5 = [v4 inputs];
  id v6 = [a1 getPorts:v5 forInput:1];

  if ([v6 count])
  {
    id v7 = [v6 firstObject];
    id v8 = [v7 objectForKey:@"RouteDetailedDescription_PortType"];
  }
  else
  {
    id v8 = &stru_1EF7378D0;
  }
  uint64_t v9 = [v4 outputs];
  uint64_t v10 = [a1 getPorts:v9 forInput:0];

  if ([v10 count])
  {
    v11 = [v10 firstObject];
    v12 = [v11 objectForKey:@"RouteDetailedDescription_PortType"];
    if ([(__CFString *)v8 length])
    {
      v13 = [NSString stringWithFormat:@"%@+%@", v8, v12];
    }
    else
    {
      v13 = v12;
    }
    long long v14 = v13;

    id v8 = v14;
  }

  return v8;
}

+ (id)getRouteDescriptionFromAVASRouteDescription:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v6 = [v4 inputs];
  id v7 = [a1 getPorts:v6 forInput:1];

  if (v7) {
    [v5 setObject:v7 forKeyedSubscript:@"RouteDetailedDescription_Inputs"];
  }
  id v8 = [v4 outputs];
  uint64_t v9 = [a1 getPorts:v8 forInput:0];

  if (v9) {
    [v5 setObject:v9 forKeyedSubscript:@"RouteDetailedDescription_Outputs"];
  }

  return v5;
}

+ (id)outputPortTypes
{
  v31[9] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F4E9A0];
  v30[0] = @"LineOut";
  v30[1] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
  v31[0] = v3;
  uint64_t v4 = *MEMORY[0x1E4F4E988];
  v29[0] = @"Headphones";
  v29[1] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
  v31[1] = v5;
  uint64_t v6 = *MEMORY[0x1E4F4E940];
  v28[0] = @"BluetoothHFPOutput";
  v28[1] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
  v31[2] = v7;
  uint64_t v8 = *MEMORY[0x1E4F4E938];
  v27[0] = @"BluetoothA2DPOutput";
  v27[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
  v31[3] = v9;
  uint64_t v10 = *MEMORY[0x1E4F4E960];
  v26[0] = @"Receiver";
  v26[1] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  v31[4] = v11;
  uint64_t v12 = *MEMORY[0x1E4F4E968];
  v25[0] = @"Speaker";
  v25[1] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  v31[5] = v13;
  uint64_t v14 = *MEMORY[0x1E4F4E9A8];
  v24[0] = @"USBOutput";
  v24[1] = v14;
  long long v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
  v31[6] = v15;
  uint64_t v16 = *MEMORY[0x1E4F4E980];
  v23[0] = @"HDMIOutput";
  v23[1] = v16;
  long long v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  v31[7] = v17;
  uint64_t v18 = *MEMORY[0x1E4F4E930];
  v22[0] = @"AirPlay";
  v22[1] = v18;
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  v31[8] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:9];

  return v20;
}

+ (id)inputPortTypes
{
  v19[5] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F4E998];
  v18[0] = @"LineIn";
  v18[1] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  v19[0] = v3;
  uint64_t v4 = *MEMORY[0x1E4F4E950];
  v17[0] = @"MicrophoneBuiltIn";
  v17[1] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  v19[1] = v5;
  uint64_t v6 = *MEMORY[0x1E4F4E990];
  v16[0] = @"MicrophoneWired";
  v16[1] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  v19[2] = v7;
  uint64_t v8 = *MEMORY[0x1E4F4E940];
  v15[0] = @"MicrophoneBluetooth";
  v15[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  v19[3] = v9;
  uint64_t v10 = *MEMORY[0x1E4F4E9A8];
  v14[0] = @"USBInput";
  v14[1] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  v19[4] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:5];

  return v12;
}

+ (id)modes
{
  v31[28] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F4E8A8];
  v30[0] = &unk_1EF73FA88;
  v30[1] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
  v31[0] = v3;
  uint64_t v4 = *MEMORY[0x1E4F4E910];
  v29[0] = &unk_1EF73FAA0;
  v29[1] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
  v31[1] = v5;
  uint64_t v6 = *MEMORY[0x1E4F4E908];
  v28[0] = &unk_1EF73FAB8;
  v28[1] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
  v31[2] = v7;
  uint64_t v8 = *MEMORY[0x1E4F4E8C8];
  v27[0] = &unk_1EF73FAD0;
  v27[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
  v31[3] = v9;
  uint64_t v10 = *MEMORY[0x1E4F4E8B8];
  v26[0] = &unk_1EF73FAE8;
  v26[1] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  v31[4] = v11;
  uint64_t v12 = *MEMORY[0x1E4F4E900];
  v25[0] = &unk_1EF73FB00;
  v25[1] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  v31[5] = v13;
  v31[6] = &unk_1EF73FF98;
  uint64_t v14 = *MEMORY[0x1E4F4E8D0];
  v24[0] = &unk_1EF73FB30;
  v24[1] = v14;
  long long v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
  v31[7] = v15;
  uint64_t v16 = *MEMORY[0x1E4F4E8F8];
  v23[0] = &unk_1EF73FB48;
  v23[1] = v16;
  long long v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  v31[8] = v17;
  uint64_t v18 = *MEMORY[0x1E4F4E928];
  v22[0] = &unk_1EF73FB60;
  v22[1] = v18;
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  v31[9] = v19;
  v31[10] = &unk_1EF73FFB0;
  void v31[11] = &unk_1EF73FFC8;
  v31[12] = &unk_1EF73FFE0;
  v31[13] = &unk_1EF73FFF8;
  v31[14] = &unk_1EF740010;
  v31[15] = &unk_1EF740028;
  v31[16] = &unk_1EF740040;
  v31[17] = &unk_1EF740058;
  v31[18] = &unk_1EF740070;
  v31[19] = &unk_1EF740088;
  v31[20] = &unk_1EF7400A0;
  v31[21] = &unk_1EF7400B8;
  v31[22] = &unk_1EF7400D0;
  v31[23] = &unk_1EF7400E8;
  v31[24] = &unk_1EF740100;
  v31[25] = &unk_1EF740118;
  v31[26] = &unk_1EF740130;
  v31[27] = &unk_1EF740148;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:28];

  return v20;
}

+ (id)categories
{
  v23[8] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F4E7E0];
  v22[0] = &unk_1EF73F9C8;
  v22[1] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  v23[0] = v3;
  uint64_t v4 = *MEMORY[0x1E4F4E820];
  v21[0] = &unk_1EF73F9E0;
  v21[1] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  v23[1] = v5;
  uint64_t v6 = *MEMORY[0x1E4F4E7F8];
  v20[0] = &unk_1EF73F9F8;
  v20[1] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  void v23[2] = v7;
  uint64_t v8 = *MEMORY[0x1E4F4E808];
  v19[0] = &unk_1EF73FA10;
  v19[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  v23[3] = v9;
  uint64_t v10 = *MEMORY[0x1E4F4E7F0];
  v18[0] = &unk_1EF73FA28;
  v18[1] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  v23[4] = v11;
  v23[5] = &unk_1EF73FF80;
  v17[0] = &unk_1EF73FA58;
  v17[1] = v2;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  v23[6] = v12;
  v16[0] = &unk_1EF73FA70;
  v16[1] = v6;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  v23[7] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:8];

  return v14;
}

+ (id)KVOProperties
{
  return &unk_1EF73FF68;
}

+ (id)getMappedObjectOf:(id)a3 inside:(id)a4 ofType:(int)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF contains [c] %@", v7];
  uint64_t v10 = [v8 filteredArrayUsingPredicate:v9];
  v11 = v10;
  if (v10 && [v10 count])
  {
    uint64_t v12 = [v11 objectAtIndexedSubscript:0];
    v13 = [v12 objectAtIndexedSubscript:a5];

    goto LABEL_11;
  }
  if (kAudioSessionClientLogSubsystem)
  {
    v13 = *(id *)kAudioSessionClientLogSubsystem;
    if (!v13) {
      goto LABEL_11;
    }
  }
  else
  {
    v13 = MEMORY[0x1E4F14500];
    id v14 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    long long v17 = "ATAudioSessionUtils.mm";
    __int16 v18 = 1024;
    int v19 = 111;
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_impl(&dword_1A3931000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: Invalid item requested %@", buf, 0x1Cu);
  }

  v13 = 0;
LABEL_11:

  return v13;
}

+ (__CFString)getAudioSessionPortType:(id)a3 forInput:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = (__CFString *)a3;
  if (v4) {
    [a1 inputPortTypes];
  }
  else {
  id v7 = [a1 outputPortTypes];
  }
  id v8 = [a1 getMappedObjectOf:v6 inside:v7 ofType:0];

  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = v6;
  }

  return v9;
}

+ (unsigned)getAudioSessionMode:(id)a3
{
  id v4 = a3;
  id v5 = [a1 modes];
  uint64_t v6 = [a1 getMappedObjectOf:v4 inside:v5 ofType:0];
  unsigned int v7 = [v6 unsignedIntValue];

  return v7;
}

+ (id)getAVASMode:(unsigned int)a3
{
  id v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  id v5 = [a1 modes];
  uint64_t v6 = [a1 getMappedObjectOf:v4 inside:v5 ofType:1];

  return v6;
}

+ (unsigned)getAudioSessionCategory:(id)a3
{
  id v4 = a3;
  id v5 = [a1 categories];
  uint64_t v6 = [a1 getMappedObjectOf:v4 inside:v5 ofType:0];
  unsigned int v7 = [v6 unsignedIntValue];

  return v7;
}

+ (id)getAVASCategory:(unsigned int)a3
{
  id v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  id v5 = [a1 categories];
  uint64_t v6 = [a1 getMappedObjectOf:v4 inside:v5 ofType:1];

  return v6;
}

+ (unsigned)getAudioSessionProperty:(id)a3
{
  id v4 = a3;
  id v5 = [a1 KVOProperties];
  uint64_t v6 = [a1 getMappedObjectOf:v4 inside:v5 ofType:0];
  unsigned int v7 = [v6 unsignedIntValue];

  return v7;
}

+ (id)getAVASProperty:(unsigned int)a3
{
  id v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  id v5 = [a1 KVOProperties];
  uint64_t v6 = [a1 getMappedObjectOf:v4 inside:v5 ofType:1];

  return v6;
}

+ (unint64_t)getCategoryOptionFromPropertyID:(unsigned int)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ((int)a3 > 1668509802)
  {
    if (a3 == 1668509803) {
      return 8;
    }
    if (a3 == 1685414763) {
      return 2;
    }
  }
  else
  {
    if (a3 == 1667394677) {
      return 4;
    }
    if (a3 == 1668114808) {
      return 1;
    }
  }
  if (kAudioSessionClientLogSubsystem)
  {
    unint64_t result = (unint64_t)*(id *)kAudioSessionClientLogSubsystem;
    id v4 = result;
    if (!result) {
      return result;
    }
  }
  else
  {
    id v4 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    unsigned int v7 = "ATAudioSessionUtils.mm";
    __int16 v8 = 1024;
    int v9 = 39;
    _os_log_impl(&dword_1A3931000, v4, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid Category option requested", (uint8_t *)&v6, 0x12u);
  }

  return 0;
}

@end