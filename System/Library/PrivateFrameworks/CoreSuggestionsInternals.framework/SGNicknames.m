@interface SGNicknames
+ (id)nicknamesForName:(id)a3;
@end

@implementation SGNicknames

+ (id)nicknamesForName:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, a1, @"SGNicknames.m", 78, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__SGNicknames_nicknamesForName___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (nicknamesForName__onceToken != -1) {
    dispatch_once(&nicknamesForName__onceToken, block);
  }
  if (!nicknamesForName__dataFile) {
    goto LABEL_16;
  }
  id v6 = +[SGWords normalizeWord:v5];
  v7 = (unsigned char *)[v6 UTF8String];
  v8 = v7;
  char v9 = *v7;
  if (*v7)
  {
    v10 = v7 + 1;
    unsigned int v11 = 5381;
    do
    {
      unsigned int v11 = 33 * v11 + v9;
      int v12 = *v10++;
      char v9 = v12;
    }
    while (v12);
  }
  else
  {
    unsigned int v11 = 5381;
  }
  unsigned int v13 = v11 % nicknamesForName__nicks_0;
  uint64_t v14 = nicknamesForName__nicks_1;
  unsigned int v15 = *(unsigned __int16 *)(nicknamesForName__nicks_1 + 2 * (v11 % nicknamesForName__nicks_0));
  if (!*(_WORD *)(nicknamesForName__nicks_1 + 2 * v13))
  {
LABEL_15:

LABEL_16:
    v20 = [MEMORY[0x1E4F1CAD0] set];
    goto LABEL_17;
  }
  uint64_t v16 = nicknamesForName__nicks_3;
  uint64_t v17 = nicknamesForName__nicks_2;
  int v18 = nicknamesForName__nicks_0 != 1;
  while (1)
  {
    unsigned int v19 = v15 >> 1;
    if (!strcmp(v8, (const char *)(v16 + *(unsigned __int16 *)(v17 + 2 * ((v15 >> 1) + 1))))) {
      break;
    }
    v13 += v18;
    unsigned int v15 = *(unsigned __int16 *)(v14 + 2 * v13);
    if (!*(_WORD *)(v14 + 2 * v13)) {
      goto LABEL_15;
    }
  }
  v22 = (_WORD *)(v17 + 2 * v19);

  v20 = objc_opt_new();
  unsigned __int16 v23 = *v22 - 1;
  if (*v22 != 1)
  {
    int v24 = 0;
    v25 = v22 + 2;
    do
    {
      unsigned int v26 = *v25++;
      v27 = (void *)[[NSString alloc] initWithBytesNoCopy:nicknamesForName__nicks_3 + v26 length:strlen((const char *)(nicknamesForName__nicks_3 + v26)) encoding:4 freeWhenDone:0];
      [v20 addObject:v27];

      ++v24;
    }
    while ((unsigned __int16)v24 < v23);
  }
LABEL_17:

  return v20;
}

void __32__SGNicknames_nicknamesForName___block_invoke()
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v1 = [v0 pathForResource:@"nicknames" ofType:@"dat"];

  if (v1)
  {
    id v9 = 0;
    uint64_t v2 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v1 options:1 error:&v9];
    id v3 = v9;
    v4 = (void *)nicknamesForName__dataFile;
    nicknamesForName__dataFile = v2;
  }
  else
  {
    id v3 = 0;
  }
  if (nicknamesForName__dataFile)
  {
    id v5 = (unsigned int *)[ (id) nicknamesForName__dataFile bytes];
    uint64_t v6 = *v5;
    uint64_t v7 = v5[1];
    nicknamesForName__nicks_0 = (v6 - 8) >> 1;
    nicknamesForName__nicks_1 = (uint64_t)(v5 + 2);
    nicknamesForName__nicks_2 = (uint64_t)v5 + v6;
    nicknamesForName__nicks_3 = (uint64_t)v5 + v7;
  }
  else
  {
    v8 = sgLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      unsigned int v11 = v1;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_error_impl(&dword_1CA650000, v8, OS_LOG_TYPE_ERROR, "Could not load nicknames from %@: %@", buf, 0x16u);
    }
  }
}

@end