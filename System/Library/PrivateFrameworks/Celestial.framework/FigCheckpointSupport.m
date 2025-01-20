@interface FigCheckpointSupport
+ (id)makeDictionary;
@end

@implementation FigCheckpointSupport

+ (id)makeDictionary
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  ModelSpecificPropertyList = (void *)FigCreateModelSpecificPropertyList();
  id obj = (id)FigCreateModelSpecificPropertyList();
  if (!ModelSpecificPropertyList)
  {
    id v3 = 0;
    goto LABEL_94;
  }
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = (void *)[ModelSpecificPropertyList objectForKeyedSubscript:@"VideoCodecs"];
  v75 = ModelSpecificPropertyList;
  uint64_t v5 = [ModelSpecificPropertyList objectForKeyedSubscript:@"AudioCodecs"];
  v6 = (void *)MGCopyAnswer();
  if (v6)
  {
    v7 = v6;
    int v8 = [v6 intValue];
  }
  else
  {
    int v8 = -1;
  }
  v9 = (void *)MGCopyAnswer();
  if (v9)
  {
    v10 = v9;
    [v9 intValue];
  }
  v11 = (void *)MGCopyAnswer();
  if (v11)
  {
    v12 = v11;
    [v11 intValue];
  }
  v13 = (void *)MGCopyAnswer();
  if (v13)
  {
    v14 = v13;
    [v13 intValue];
  }
  v15 = (void *)MGCopyAnswer();
  if (v15)
  {
    v16 = v15;
    [v15 intValue];
  }
  v17 = (void *)MGCopyAnswer();
  if (v17)
  {
    v18 = v17;
    int v19 = [v17 intValue];

    BOOL v20 = v19 > 41;
  }
  else
  {
    BOOL v20 = 0;
  }
  v21 = (void *)MGCopyAnswer();
  if (v21)
  {
    v22 = v21;
    int v23 = [v21 intValue];

    BOOL v24 = v23 > 49;
  }
  else
  {
    BOOL v24 = 0;
  }
  v25 = (void *)MGCopyAnswer();
  if (v25)
  {
    v26 = v25;
    int v27 = [v25 intValue];

    BOOL v28 = v27 > 50;
  }
  else
  {
    BOOL v28 = 0;
  }
  v29 = (void *)MGCopyAnswer();
  if (v29)
  {
    v30 = v29;
    int v31 = [v29 intValue];

    BOOL v32 = v31 > 51;
  }
  else
  {
    BOOL v32 = 0;
  }
  v33 = (void *)MGCopyAnswer();
  if (v33)
  {
    v34 = v33;
    int v35 = [v33 intValue];

    BOOL v36 = v35 != 0;
  }
  else
  {
    BOOL v36 = 0;
  }
  v37 = (void *)MGCopyAnswer();
  if (v37)
  {
    v38 = v37;
    [v37 intValue];
  }
  if (v8 != 1)
  {
    v39 = (void *)MGCopyAnswer();
    if (v39)
    {
      v40 = v39;
      [v39 intValue];
    }
  }
  v41 = (void *)MGCopyAnswer();
  if (v41)
  {
    v42 = v41;
    [v41 intValue];
  }
  id v43 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v43)
  {
    if (v32)
    {
      uint64_t v44 = [v4 objectForKeyedSubscript:@"H.264_UHDVideo3"];
      if (v44) {
        [v43 setObject:v44 forKeyedSubscript:@"H.264"];
      }
      uint64_t v45 = [v4 objectForKeyedSubscript:@"H.264M_UHDVideo3"];
      if (v45) {
        [v43 setObject:v45 forKeyedSubscript:@"H.264M"];
      }
      v46 = @"H.264H_UHDVideo3";
    }
    else if (v28)
    {
      uint64_t v47 = [v4 objectForKeyedSubscript:@"H.264_UHDVideo2"];
      if (v47) {
        [v43 setObject:v47 forKeyedSubscript:@"H.264"];
      }
      uint64_t v48 = [v4 objectForKeyedSubscript:@"H.264M_UHDVideo2"];
      if (v48) {
        [v43 setObject:v48 forKeyedSubscript:@"H.264M"];
      }
      v46 = @"H.264H_UHDVideo2";
    }
    else if (v24)
    {
      uint64_t v49 = [v4 objectForKeyedSubscript:@"H.264_UHDVideo"];
      if (v49) {
        [v43 setObject:v49 forKeyedSubscript:@"H.264"];
      }
      uint64_t v50 = [v4 objectForKeyedSubscript:@"H.264M_UHDVideo"];
      if (v50) {
        [v43 setObject:v50 forKeyedSubscript:@"H.264M"];
      }
      v46 = @"H.264H_UHDVideo";
    }
    else
    {
      if (!v20)
      {
LABEL_63:
        uint64_t v54 = [v4 objectForKeyedSubscript:@"H.263"];
        if (v54) {
          [v43 setObject:v54 forKeyedSubscript:@"H.263"];
        }
        uint64_t v55 = [v4 objectForKeyedSubscript:@"MPEG4"];
        if (v55) {
          [v43 setObject:v55 forKeyedSubscript:@"MPEG4"];
        }
        [v3 setObject:v43 forKeyedSubscript:@"VideoCodecs"];
        goto LABEL_68;
      }
      uint64_t v51 = [v4 objectForKeyedSubscript:@"H.264_HDVideo42"];
      if (v51) {
        [v43 setObject:v51 forKeyedSubscript:@"H.264"];
      }
      uint64_t v52 = [v4 objectForKeyedSubscript:@"H.264M_HDVideo42"];
      if (v52) {
        [v43 setObject:v52 forKeyedSubscript:@"H.264M"];
      }
      v46 = @"H.264H_HDVideo42";
    }
    uint64_t v53 = [v4 objectForKeyedSubscript:v46];
    if (v53) {
      [v43 setObject:v53 forKeyedSubscript:@"H.264H"];
    }
    goto LABEL_63;
  }
LABEL_68:

  v56 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v5];
  v57 = v56;
  if (v5)
  {
    if (!v36)
    {
      [v56 removeObjectForKey:@"AC3"];
      [v57 removeObjectForKey:@"EnhancedAC3"];
    }
    [v3 setObject:v57 forKeyedSubscript:@"AudioCodecs"];
  }

  if (obj)
  {
    if (v3)
    {
      long long v79 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      uint64_t v77 = [obj countByEnumeratingWithState:&v79 objects:v83 count:16];
      if (v77)
      {
        uint64_t v76 = *(void *)v80;
        do
        {
          for (uint64_t i = 0; i != v77; ++i)
          {
            if (*(void *)v80 != v76) {
              objc_enumerationMutation(obj);
            }
            v59 = *(void **)(*((void *)&v79 + 1) + 8 * i);
            [v59 stringByAppendingFormat:@".plist"];
            v60 = (void *)FigCreateModelSpecificPropertyList();
            v61 = (void *)[obj objectForKeyedSubscript:v59];
            v62 = (void *)[v61 objectForKeyedSubscript:@"VideoCodecs"];
            if (v62)
            {
              v63 = v62;
              if ([v62 count])
              {
                unint64_t v64 = 0;
                do
                {
                  uint64_t v65 = [v63 objectAtIndexedSubscript:v64];
                  uint64_t v66 = objc_msgSend((id)objc_msgSend(v60, "objectForKeyedSubscript:", @"VideoCodecs"), "objectForKeyedSubscript:", v65);
                  v67 = (void *)[v3 objectForKeyedSubscript:@"VideoCodecs"];
                  if (v66) {
                    [v67 setObject:v66 forKey:v65];
                  }
                  ++v64;
                }
                while (v64 < [v63 count]);
              }
            }
            v68 = (void *)[v61 objectForKeyedSubscript:@"AudioCodecs"];
            if (v68)
            {
              v69 = v68;
              if ([v68 count])
              {
                unint64_t v70 = 0;
                do
                {
                  uint64_t v71 = [v69 objectAtIndexedSubscript:v70];
                  uint64_t v72 = objc_msgSend((id)objc_msgSend(v60, "objectForKeyedSubscript:", @"AudioCodecs"), "objectForKeyedSubscript:", v71);
                  v73 = (void *)[v3 objectForKeyedSubscript:@"AudioCodecs"];
                  if (v72) {
                    [v73 setObject:v72 forKey:v71];
                  }
                  ++v70;
                }
                while (v70 < [v69 count]);
              }
            }
          }
          uint64_t v77 = [obj countByEnumeratingWithState:&v79 objects:v83 count:16];
        }
        while (v77);
      }
    }
  }
  ModelSpecificPropertyList = v75;
LABEL_94:

  return v3;
}

@end