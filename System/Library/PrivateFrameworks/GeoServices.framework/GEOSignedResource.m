@interface GEOSignedResource
+ (BOOL)_validateResource:(unint64_t)a3 atPath:(id)a4 data:(id *)a5 error:(id *)a6;
+ (BOOL)_validateResource:(unint64_t)a3 withData:(id)a4 data:(id *)a5 error:(id *)a6;
+ (id)loadResource:(unint64_t)a3 atPath:(id)a4 error:(id *)a5;
+ (id)loadResourceAtPath:(id)a3 error:(id *)a4;
+ (id)validateResource:(unint64_t)a3 atPath:(id)a4;
+ (id)validateResource:(unint64_t)a3 withData:(id)a4;
+ (id)validateResourceAtPath:(id)a3;
+ (unint64_t)typeForResourceByFileName:(id)a3;
@end

@implementation GEOSignedResource

+ (id)loadResourceAtPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [a1 typeForResourceByFileName:v6];
  if (v7)
  {
    id v10 = 0;
    [a1 _validateResource:v7 atPath:v6 data:&v10 error:a4];
    id v8 = v10;
  }
  else if (a4)
  {
    [MEMORY[0x1E4F28C58] GEOErrorWithCode:-29 reason:0];
    id v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (unint64_t)typeForResourceByFileName:(id)a3
{
  id v3 = a3;
  v4 = [v3 pathExtension];
  if ([v4 isEqual:@"cms"]
    && ([v3 lastPathComponent],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        [(id)v5 stringByDeletingPathExtension],
        id v6 = objc_claimAutoreleasedReturnValue(),
        (id)v5,
        LOBYTE(v5) = [v6 hasPrefix:@"placecard"],
        v6,
        (v5 & 1) != 0))
  {
    unint64_t v7 = 3;
  }
  else
  {
    id v8 = [v4 componentsSeparatedByString:@"-"];
    if ([v8 count] == 2
      && ([v8 firstObject],
          v9 = objc_claimAutoreleasedReturnValue(),
          int v10 = [v9 isEqualToString:@"cms"],
          v9,
          v10))
    {
      v11 = [v8 lastObject];
      if ([v11 isEqualToString:@"lpr"])
      {
        unint64_t v7 = 1;
      }
      else if ([v11 isEqualToString:@"rap"])
      {
        unint64_t v7 = 2;
      }
      else
      {
        unint64_t v7 = 0;
      }
    }
    else
    {
      unint64_t v7 = 0;
    }
  }
  return v7;
}

+ (id)validateResource:(unint64_t)a3 withData:(id)a4
{
  id v6 = 0;
  [a1 _validateResource:a3 withData:a4 data:0 error:&v6];
  id v4 = v6;

  return v4;
}

+ (BOOL)_validateResource:(unint64_t)a3 atPath:(id)a4 data:(id *)a5 error:(id *)a6
{
  int v10 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:a4 options:0 error:a6];
  if (v10) {
    char v11 = [a1 _validateResource:a3 withData:v10 data:a5 error:a6];
  }
  else {
    char v11 = 0;
  }

  return v11;
}

+ (BOOL)_validateResource:(unint64_t)a3 withData:(id)a4 data:(id *)a5 error:(id *)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v31 = a4;
  switch(a3)
  {
    case 3uLL:
      if (qword_1EB29F548 == -1)
      {
        id v8 = &qword_1EB29F538;
        goto LABEL_10;
      }
      id v8 = &qword_1EB29F538;
      v28 = &qword_1EB29F548;
      v29 = &__block_literal_global_52;
      break;
    case 2uLL:
      if (qword_1EB29F530 == -1)
      {
        id v8 = &qword_1EB29F520;
        goto LABEL_10;
      }
      id v8 = &qword_1EB29F520;
      v28 = &qword_1EB29F530;
      v29 = &__block_literal_global_47;
      break;
    case 1uLL:
      if (qword_1EB29F518 == -1)
      {
        id v8 = &_MergedGlobals_185;
        goto LABEL_10;
      }
      id v8 = &_MergedGlobals_185;
      v28 = &qword_1EB29F518;
      v29 = &__block_literal_global_11;
      break;
    default:
      goto LABEL_15;
  }
  dispatch_once(v28, v29);
LABEL_10:
  uint64_t v9 = *v8;
  unint64_t v10 = v8[1];
  if (v10) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
LABEL_15:
    v12 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid signed resource type %d", a3);
    if (a6)
    {
      *a6 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-29 reason:v12];
    }
    v13 = GEOGetSignedResourcesLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v35 = v12;
      _os_log_impl(&dword_188D96000, v13, OS_LOG_TYPE_ERROR, " - Failed: %@", buf, 0xCu);
    }

LABEL_20:
    BOOL v18 = 0;
    goto LABEL_21;
  }
  v30 = a6;
  uint64_t v15 = 0;
  OSStatus v16 = 0;
  v17 = (uint64_t *)(v9 + 8);
  BOOL v18 = 1;
  do
  {
    v19 = GEOGetSignedResourcesLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v21 = *(v17 - 1);
      uint64_t v20 = *v17;
      *(_DWORD *)buf = 138412546;
      *(void *)v35 = v20;
      *(_WORD *)&v35[8] = 2112;
      *(void *)&v35[10] = v21;
      _os_log_impl(&dword_188D96000, v19, OS_LOG_TYPE_DEBUG, "Checking OIDs ca %@, leaf %@", buf, 0x16u);
    }

    uint64_t ApplePinned = SecPolicyCreateApplePinned();
    if (ApplePinned)
    {
      v23 = (const void *)ApplePinned;
      OSStatus v16 = SecCMSVerifyCopyDataAndAttributes();
      CFRelease(v23);
    }
    if (!v16)
    {
      v24 = GEOGetSignedResourcesLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_188D96000, v24, OS_LOG_TYPE_DEBUG, " - Passed", buf, 2u);
      }
      goto LABEL_34;
    }
    BOOL v18 = ++v15 < v10;
    v17 += 2;
  }
  while (v10 != v15);
  if (!v30) {
    goto LABEL_20;
  }
  v24 = SecCopyErrorMessageString(v16, 0);
  v25 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v32 = *MEMORY[0x1E4F1D140];
  v33 = v24;
  v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
  id *v30 = [v25 errorWithDomain:@"SecError" code:v16 userInfo:v26];

  v27 = GEOGetSignedResourcesLog();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v35 = v16;
    *(_WORD *)&v35[4] = 2112;
    *(void *)&v35[6] = v24;
    _os_log_impl(&dword_188D96000, v27, OS_LOG_TYPE_ERROR, " - Failed (%d): %@", buf, 0x12u);
  }

  BOOL v18 = 0;
LABEL_34:

LABEL_21:
  return v18;
}

+ (id)validateResource:(unint64_t)a3 atPath:(id)a4
{
  id v6 = 0;
  [a1 _validateResource:a3 atPath:a4 data:0 error:&v6];
  id v4 = v6;

  return v4;
}

+ (id)loadResource:(unint64_t)a3 atPath:(id)a4 error:(id *)a5
{
  id v7 = 0;
  [a1 _validateResource:a3 atPath:a4 data:&v7 error:a5];
  id v5 = v7;

  return v5;
}

+ (id)validateResourceAtPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 typeForResourceByFileName:v4];
  if (v5)
  {
    id v9 = 0;
    [a1 _validateResource:v5 atPath:v4 data:0 error:&v9];
    id v6 = v9;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-29 reason:0];
  }
  id v7 = v6;

  return v7;
}

@end