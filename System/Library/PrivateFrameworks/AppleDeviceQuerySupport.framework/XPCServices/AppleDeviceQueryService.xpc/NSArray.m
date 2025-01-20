@interface NSArray
+ (id)arrayFromShellCommandString:(id)a3;
+ (id)graphicInfoArrayFromArray:(id)a3;
@end

@implementation NSArray

+ (id)graphicInfoArrayFromArray:(id)a3
{
  id v3 = a3;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  if (v3)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v8 = v3;
    id v9 = [v8 countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v27;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v27 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v17 = [v13 objectForKeyedSubscript:@"sppci_model"];
            if (!v17)
            {
              ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/NSArray+ZhuGe.m", "+[NSArray(ZhuGe) graphicInfoArrayFromArray:]", 33, @"One graphic in graphics array does not contain \"sppci_model\"", v18, v19, v20, v25);

              v23 = 0;
              goto LABEL_16;
            }
            v21 = (void *)v17;
            v30[0] = @"Chipset Model";
            v30[1] = @"Device ID";
            v31[0] = v17;
            v31[1] = &stru_1000148A0;
            v30[2] = @"VRAM Size";
            v30[3] = @"ROM Revision";
            v31[2] = &stru_1000148A0;
            v31[3] = &stru_1000148A0;
            v30[4] = @"VBIOS Version";
            v30[5] = @"Option ROM Version";
            v31[4] = &stru_1000148A0;
            v31[5] = &stru_1000148A0;
            v22 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:6];
            [v7 addObject:v22];
          }
          else
          {
            ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/NSArray+ZhuGe.m", "+[NSArray(ZhuGe) graphicInfoArrayFromArray:]", 27, @"One graphic in graphics array is not a dictionary, ignore it.", v14, v15, v16, v25);
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v26 objects:v32 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    v23 = +[NSArray arrayWithArray:v7];
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/NSArray+ZhuGe.m", "+[NSArray(ZhuGe) graphicInfoArrayFromArray:]", 20, @"graphicsArray pointer is nil!", v4, v5, v6, v25);
    v23 = 0;
  }
LABEL_16:

  return v23;
}

+ (id)arrayFromShellCommandString:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  if (!v3)
  {
    id v25 = 0;
    goto LABEL_45;
  }
  id v27 = v3;
  uint64_t v5 = (const char *)[v3 UTF8String];
  int64_t v6 = strlen(v5);
  if (v6 < 1)
  {
LABEL_42:
    id v25 = v4;
    goto LABEL_43;
  }
  int v10 = 0;
  unint64_t v11 = (unint64_t)&v5[v6];
  long long v28 = &v5[v6];
  while (*v5 == 32)
  {
    v12 = v5;
LABEL_41:
    uint64_t v5 = v12 + 1;
    if ((unint64_t)(v12 + 1) >= v11) {
      goto LABEL_42;
    }
  }
  if ((unint64_t)v5 >= v11)
  {
    char v13 = 0;
    v12 = v5;
  }
  else
  {
    char v13 = 0;
    int64_t v14 = v28 - v5;
    v12 = v5;
    do
    {
      int v15 = *(unsigned __int8 *)v12;
      if (v15 == 32 && v10 == 0) {
        goto LABEL_26;
      }
      if (v15 == 39 || v15 == 34)
      {
        int v17 = v15 == v10 ? 0 : v10;
        BOOL v18 = v10 == 0;
        int v10 = (_BYTE)v10 ? v17 : *(unsigned __int8 *)v12;
        if (v18) {
          char v13 = 1;
        }
      }
      ++v12;
      --v14;
    }
    while (v14);
    v12 = v28;
  }
  if (!(_BYTE)v10)
  {
LABEL_26:
    int64_t v19 = v12 - v5;
    id v20 = +[NSMutableData dataWithLength:v12 - v5 + 1];
    id v21 = [v20 mutableBytes];

    bzero(v21, v12 - v5 + 1);
    if (v13)
    {
      if (v5 < v12)
      {
        int v10 = 0;
        v22 = v21;
        while (1)
        {
          int v23 = *(unsigned __int8 *)v5;
          if (v23 != 39 && v23 != 34) {
            break;
          }
          if ((_BYTE)v10)
          {
            if (v23 != v10) {
              break;
            }
            int v10 = 0;
          }
          else
          {
            int v10 = *(unsigned __int8 *)v5;
          }
LABEL_36:
          ++v5;
          if (!--v19) {
            goto LABEL_40;
          }
        }
        *v22++ = v23;
        goto LABEL_36;
      }
    }
    else
    {
      memcpy(v21, v5, v12 - v5);
    }
    int v10 = 0;
LABEL_40:
    v24 = +[NSString stringWithUTF8String:v21];
    [v4 addObject:v24];

    goto LABEL_41;
  }
  ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/NSArray+ZhuGe.m", "+[NSArray(ZhuGe) arrayFromShellCommandString:]", 98, @"Quotation \"%c\" is not paired in command \"%@\"!", v7, v8, v9, (char)v10);
  id v25 = 0;
LABEL_43:
  id v3 = v27;
LABEL_45:

  return v25;
}

@end