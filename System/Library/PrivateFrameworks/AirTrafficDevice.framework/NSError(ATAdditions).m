@interface NSError(ATAdditions)
+ (id)_ATErrorFromAMSError:()ATAdditions;
+ (id)_ATErrorFromBLError:()ATAdditions;
+ (id)_ATErrorFromCoreMediaError:()ATAdditions;
+ (id)_ATErrorFromICError:()ATAdditions;
+ (id)_ATErrorFromICServerError:()ATAdditions;
+ (id)_ATErrorFromMBError:()ATAdditions;
+ (id)at_ATErrorFromError:()ATAdditions;
@end

@implementation NSError(ATAdditions)

+ (id)_ATErrorFromCoreMediaError:()ATAdditions
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 code] == -17760) {
    uint64_t v4 = 8;
  }
  else {
    uint64_t v4 = 27;
  }
  v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = *MEMORY[0x1E4F28A50];
  v10[0] = v3;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v7 = [v5 errorWithDomain:@"ATError" code:v4 userInfo:v6];

  return v7;
}

+ (id)_ATErrorFromMBError:()ATAdditions
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 code];
  if (v4 > 201)
  {
    uint64_t v5 = 2;
    switch(v4)
    {
      case 202:
        goto LABEL_17;
      case 203:
      case 206:
      case 209:
      case 211:
      case 212:
      case 213:
      case 214:
      case 215:
      case 216:
      case 217:
      case 218:
        goto LABEL_16;
      case 204:
      case 205:
      case 210:
        goto LABEL_8;
      case 207:
LABEL_12:
        uint64_t v5 = 4;
        goto LABEL_17;
      case 208:
        uint64_t v5 = 20;
        goto LABEL_17;
      case 219:
        uint64_t v5 = 31;
        goto LABEL_17;
      case 220:
        goto LABEL_7;
      default:
        switch(v4)
        {
          case 300:
          case 302:
          case 304:
          case 308:
            goto LABEL_7;
          case 303:
            goto LABEL_11;
          case 305:
            goto LABEL_12;
          case 306:
            goto LABEL_8;
          default:
            goto LABEL_16;
        }
    }
  }
  v6 = 0;
  switch(v4)
  {
    case 0:
      goto LABEL_18;
    case 1:
    case 2:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 14:
    case 16:
    case 21:
    case 22:
      goto LABEL_16;
    case 3:
    case 18:
    case 19:
    case 20:
LABEL_7:
      uint64_t v5 = 8;
      goto LABEL_17;
    case 4:
    case 13:
LABEL_8:
      uint64_t v5 = 10;
      goto LABEL_17;
    case 15:
      uint64_t v5 = 7;
      goto LABEL_17;
    case 17:
      uint64_t v5 = 25;
      goto LABEL_17;
    case 23:
      uint64_t v5 = 24;
      goto LABEL_17;
    default:
      if (v4 == 105 || v4 == 106) {
LABEL_11:
      }
        uint64_t v5 = 14;
      else {
LABEL_16:
      }
        uint64_t v5 = 0;
LABEL_17:
      v7 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v10 = *MEMORY[0x1E4F28A50];
      v11[0] = v3;
      v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
      v6 = [v7 errorWithDomain:@"ATError" code:v5 userInfo:v8];

LABEL_18:
      return v6;
  }
}

+ (id)_ATErrorFromAMSError:()ATAdditions
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 code];
  uint64_t v5 = (void *)MEMORY[0x1E4F28A50];
  if (v4 > 99)
  {
    if (v4 == 101)
    {
      uint64_t v7 = 4;
      goto LABEL_19;
    }
    if (v4 != 100)
    {
      uint64_t v7 = 0;
      goto LABEL_19;
    }
    v8 = [v3 userInfo];
    uint64_t v9 = [v8 objectForKey:*v5];

    if (v9)
    {
      uint64_t v10 = [v9 domain];
      if ([v10 isEqualToString:*MEMORY[0x1E4F4DA40]])
      {
        uint64_t v11 = [v9 code];

        if (v11 == 6) {
          uint64_t v7 = 2;
        }
        else {
          uint64_t v7 = 4;
        }
        goto LABEL_18;
      }
    }
    uint64_t v7 = 4;
LABEL_18:

    goto LABEL_19;
  }
  uint64_t v6 = 2;
  if (v4 != 6) {
    uint64_t v6 = 0;
  }
  if (v4 == 1) {
    uint64_t v7 = 7;
  }
  else {
    uint64_t v7 = v6;
  }
LABEL_19:
  v12 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v16 = *v5;
  v17[0] = v3;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
  v14 = [v12 errorWithDomain:@"ATError" code:v7 userInfo:v13];

  return v14;
}

+ (id)_ATErrorFromBLError:()ATAdditions
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 code];
  uint64_t v5 = 14;
  uint64_t v6 = 2;
  if (v4 != 16) {
    uint64_t v6 = 0;
  }
  if (v4 != 103) {
    uint64_t v5 = v6;
  }
  if (v4 == 4) {
    uint64_t v7 = 4;
  }
  else {
    uint64_t v7 = v5;
  }
  v8 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v12 = *MEMORY[0x1E4F28A50];
  v13[0] = v3;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  uint64_t v10 = [v8 errorWithDomain:@"ATError" code:v7 userInfo:v9];

  return v10;
}

+ (id)_ATErrorFromICServerError:()ATAdditions
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 code];
  uint64_t v5 = 0;
  if (v4 <= 2033)
  {
    if ((unint64_t)(v4 - 1003) >= 2 && v4 != 2002) {
      goto LABEL_8;
    }
LABEL_7:
    uint64_t v5 = 4;
    goto LABEL_8;
  }
  if (v4 == 2070 || v4 == 2034) {
    goto LABEL_7;
  }
LABEL_8:
  uint64_t v6 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v10 = *MEMORY[0x1E4F28A50];
  v11[0] = v3;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  v8 = [v6 errorWithDomain:@"ATError" code:v5 userInfo:v7];

  return v8;
}

+ (id)_ATErrorFromICError:()ATAdditions
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 code];
  uint64_t v6 = (void *)MEMORY[0x1E4F28A50];
  if (v5 <= -7102)
  {
    if (v5 > -7403)
    {
      uint64_t v18 = 3;
      if (v5 != -7104) {
        uint64_t v18 = 0;
      }
      if (v5 == -7402) {
        uint64_t v12 = 4;
      }
      else {
        uint64_t v12 = v18;
      }
    }
    else if (v5 == -8302)
    {
      uint64_t v12 = 27;
    }
    else if (v5 == -7403)
    {
      v13 = [v4 userInfo];
      v14 = [v13 objectForKey:*v6];

      if (v14
        && ([v14 domain],
            v15 = objc_claimAutoreleasedReturnValue(),
            int v16 = [v15 isEqualToString:*MEMORY[0x1E4F4DA40]],
            v15,
            v16))
      {
        v17 = [a1 _ATErrorFromAMSError:v14];
        uint64_t v12 = [v17 code];
      }
      else
      {
        uint64_t v12 = 4;
      }
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v7 = 7;
    if (v5 != -7003) {
      uint64_t v7 = 0;
    }
    if (v5 == -7004) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = v7;
    }
    if (v5 == -7006) {
      uint64_t v9 = 20;
    }
    else {
      uint64_t v9 = v8;
    }
    uint64_t v10 = 8;
    if (v5 != -7100) {
      uint64_t v10 = 0;
    }
    if (v5 == -7101) {
      uint64_t v11 = 23;
    }
    else {
      uint64_t v11 = v10;
    }
    if (v5 <= -7007) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = v9;
    }
  }
  v19 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v23 = *v6;
  v24[0] = v4;
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
  v21 = [v19 errorWithDomain:@"ATError" code:v12 userInfo:v20];

  return v21;
}

+ (id)at_ATErrorFromError:()ATAdditions
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 domain];
  uint64_t v6 = v5;
  if (!v4)
  {
    uint64_t v7 = 0;
    goto LABEL_9;
  }
  uint64_t v7 = v4;
  if ([v5 isEqualToString:@"ATError"]) {
    goto LABEL_9;
  }
  if ([v6 isEqualToString:*MEMORY[0x1E4FB8410]])
  {
    uint64_t v8 = [a1 _ATErrorFromICError:v4];
LABEL_8:
    uint64_t v7 = (void *)v8;

    goto LABEL_9;
  }
  if ([v6 isEqualToString:*MEMORY[0x1E4FB8508]])
  {
    uint64_t v8 = [a1 _ATErrorFromICServerError:v4];
    goto LABEL_8;
  }
  if ([v6 isEqualToString:*MEMORY[0x1E4FB8428]])
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = *MEMORY[0x1E4F28A50];
    id v25 = v4;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    uint64_t v7 = [v10 errorWithDomain:@"ATError" code:27 userInfo:v11];
  }
  else
  {
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2020000000;
    uint64_t v12 = (void *)getBLErrorDomainSymbolLoc_ptr;
    uint64_t v21 = getBLErrorDomainSymbolLoc_ptr;
    if (!getBLErrorDomainSymbolLoc_ptr)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v27 = __getBLErrorDomainSymbolLoc_block_invoke;
      v28 = &unk_1E6B88D48;
      v29 = &v18;
      __getBLErrorDomainSymbolLoc_block_invoke(&buf);
      uint64_t v12 = (void *)v19[3];
    }
    _Block_object_dispose(&v18, 8);
    if (!v12)
    {
      int v16 = [MEMORY[0x1E4F28B00] currentHandler];
      v17 = [NSString stringWithUTF8String:"NSString *getBLErrorDomain(void)"];
      objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, @"NSError+ATAdditions.m", 19, @"%s", dlerror());

      __break(1u);
    }
    if ([v6 isEqualToString:*v12])
    {
      uint64_t v7 = [a1 _ATErrorFromBLError:v4];
    }
    else if ([v6 isEqualToString:*MEMORY[0x1E4F4DA40]])
    {
      uint64_t v7 = [a1 _ATErrorFromAMSError:v4];
    }
    else if ([v6 isEqualToString:@"MBErrorDomain"])
    {
      uint64_t v7 = [a1 _ATErrorFromMBError:v4];
    }
    else if ([v6 isEqualToString:@"CoreMediaErrorDomain"])
    {
      uint64_t v7 = [a1 _ATErrorFromCoreMediaError:v4];
    }
    else
    {
      v13 = _ATLogCategoryFramework();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v4;
        _os_log_impl(&dword_1D9A2D000, v13, OS_LOG_TYPE_DEFAULT, "Mapping error from unknown domain: %{public}@", (uint8_t *)&buf, 0xCu);
      }

      v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v22 = *MEMORY[0x1E4F28A50];
      id v23 = v4;
      v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      uint64_t v7 = [v14 errorWithDomain:@"ATError" code:0 userInfo:v15];
    }
  }
LABEL_9:

  return v7;
}

@end