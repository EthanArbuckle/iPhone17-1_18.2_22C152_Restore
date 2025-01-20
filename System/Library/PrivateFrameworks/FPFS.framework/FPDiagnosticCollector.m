@interface FPDiagnosticCollector
+ (unint64_t)getStringCharactersSet:(id)a3;
- (BOOL)_collectFnameAttributesWithError:(id *)a3;
- (BOOL)_collectInodeAttributesWithError:(id *)a3;
- (BOOL)_collectMountAttributesWithError:(id *)a3;
- (BOOL)_collectParentACLCountWithError:(id *)a3;
- (BOOL)_collectPurgeAttributesWithError:(id *)a3;
- (BOOL)_collectXattrAttributesWithError:(id *)a3;
- (BOOL)_collectdocIDAttributesWithError:(id *)a3;
- (BOOL)_performStep:(unint64_t)a3 error:(id *)a4;
- (BOOL)_tryReadFirstByteOfFileWithError:(id *)a3;
- (BOOL)collectDiagnosticDiskAttributesWithError:(id *)a3;
- (FPDiagnosticCollector)initWithFD:(int)a3 trashURL:(id)a4;
- (NSDictionary)diagnostic;
@end

@implementation FPDiagnosticCollector

- (FPDiagnosticCollector)initWithFD:(int)a3 trashURL:(id)a4
{
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FPDiagnosticCollector;
  v8 = [(FPDiagnosticCollector *)&v12 init];
  if (v8)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    diagnostic = v8->_diagnostic;
    v8->_diagnostic = v9;

    v8->_fd = a3;
    objc_storeStrong((id *)&v8->_trashURL, a4);
    v8->_stepsNeeded = 147;
  }

  return v8;
}

- (BOOL)_performStep:(unint64_t)a3 error:(id *)a4
{
  if ((uint64_t)a3 <= 15)
  {
    switch(a3)
    {
      case 1uLL:
        BOOL result = [(FPDiagnosticCollector *)self _collectInodeAttributesWithError:a4];
        break;
      case 2uLL:
        BOOL result = [(FPDiagnosticCollector *)self _collectFnameAttributesWithError:a4];
        break;
      case 4uLL:
        BOOL result = [(FPDiagnosticCollector *)self _collectXattrAttributesWithError:a4];
        break;
      case 8uLL:
        BOOL result = [(FPDiagnosticCollector *)self _collectPurgeAttributesWithError:a4];
        break;
      default:
        goto LABEL_32;
    }
    return result;
  }
  if ((uint64_t)a3 > 63)
  {
    if (a3 == 64)
    {
      return [(FPDiagnosticCollector *)self _tryReadFirstByteOfFileWithError:a4];
    }
    else
    {
      if (a3 != 128) {
        goto LABEL_32;
      }
      return [(FPDiagnosticCollector *)self _collectParentACLCountWithError:a4];
    }
  }
  else
  {
    if (a3 != 16)
    {
      if (a3 == 32)
      {
        return [(FPDiagnosticCollector *)self _collectdocIDAttributesWithError:a4];
      }
LABEL_32:
      objc_msgSend(MEMORY[0x263F087E8], "fp_errorWithPOSIXCode:", 45);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      return 0;
    }
    return [(FPDiagnosticCollector *)self _collectMountAttributesWithError:a4];
  }
}

- (BOOL)collectDiagnosticDiskAttributesWithError:(id *)a3
{
  uint64_t v5 = 0;
  id v6 = 0;
  unint64_t v7 = 1;
  char v8 = 1;
  do
  {
    if ((self->_stepsNeeded & v7) != 0)
    {
      id v23 = 0;
      BOOL v9 = [(FPDiagnosticCollector *)self _performStep:v7 error:&v23];
      id v10 = v23;
      v11 = v10;
      if (v9)
      {
        self->_stepsNeeded &= ~v7;
      }
      else
      {
        v5 |= v7;
        if (!v6) {
          id v6 = v10;
        }
        char v8 = 0;
      }
    }
    BOOL v12 = v7 >= 0x41;
    v7 *= 2;
  }
  while (!v12);
  if ((v8 & 1) == 0)
  {
    if (a3) {
      *a3 = v6;
    }
    v13 = [v6 domain];
    [(NSMutableDictionary *)self->_diagnostic setObject:v13 forKeyedSubscript:*MEMORY[0x263F05178]];

    v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "code"));
    [(NSMutableDictionary *)self->_diagnostic setObject:v14 forKeyedSubscript:*MEMORY[0x263F05170]];

    v15 = [v6 underlyingErrors];
    uint64_t v16 = [v15 count];

    if (v16)
    {
      v17 = [v6 underlyingErrors];
      v18 = [v17 firstObject];

      v19 = [v18 domain];
      [(NSMutableDictionary *)self->_diagnostic setObject:v19 forKeyedSubscript:*MEMORY[0x263F05190]];

      v20 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v18, "code"));
      [(NSMutableDictionary *)self->_diagnostic setObject:v20 forKeyedSubscript:*MEMORY[0x263F05188]];
    }
    v21 = [NSNumber numberWithUnsignedInteger:v5];
    [(NSMutableDictionary *)self->_diagnostic setObject:v21 forKeyedSubscript:*MEMORY[0x263F05180]];
  }
  return v8 & 1;
}

- (BOOL)_collectInodeAttributesWithError:(id *)a3
{
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v44 = xmmword_24DCCEB20;
  uint64_t v45 = 0x60000001601;
  size_t v6 = getpagesize();
  unint64_t v7 = (unsigned __int16 *)malloc_type_malloc(v6, 0xB1658410uLL);
  if (!v7)
  {
    objc_msgSend(MEMORY[0x263F087E8], "fp_errorWithPOSIXCode:", *__error());
    BOOL v12 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_69;
  }
  char v8 = v7;
  if (fgetattrlist(self->_fd, &v44, v7, v6, 0x28u) < 0)
  {
    v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v11 = *__error();
    id v10 = v13;
    goto LABEL_9;
  }
  int v9 = *((_DWORD *)v8 + 1);
  if ((v9 & 4) != 0)
  {
    self->_fsid = (fsid)*((void *)v8 + 3);
    int v9 = *((_DWORD *)v8 + 1);
  }
  if ((v9 & 8) == 0)
  {
    id v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v11 = 9;
LABEL_9:
    objc_msgSend(v10, "fp_errorWithPOSIXCode:", v11);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    free(v8);
    BOOL v12 = 0;
    goto LABEL_69;
  }
  int v14 = *((_DWORD *)v8 + 8) - 1;
  if (v14 > 6) {
    int v15 = 0;
  }
  else {
    int v15 = word_24DCCEB50[v14];
  }
  if ((v9 & 0x20000) != 0)
  {
    uint64_t v16 = [NSNumber numberWithUnsignedShort:v15 | v8[52]];
    [v5 setObject:v16 forKeyedSubscript:*MEMORY[0x263F05278]];

    int v9 = *((_DWORD *)v8 + 1);
    if ((v9 & 0x200) == 0)
    {
LABEL_15:
      if ((v9 & 0x400) == 0) {
        goto LABEL_16;
      }
      goto LABEL_24;
    }
  }
  else if ((v9 & 0x200) == 0)
  {
    goto LABEL_15;
  }
  v17 = [NSNumber numberWithLong:*(void *)(v8 + 18)];
  [v5 setObject:v17 forKeyedSubscript:*MEMORY[0x263F05210]];

  v18 = [NSNumber numberWithBool:fpfs_is_busy_date()];
  [v5 setObject:v18 forKeyedSubscript:*MEMORY[0x263F05218]];

  int v9 = *((_DWORD *)v8 + 1);
  if ((v9 & 0x400) == 0)
  {
LABEL_16:
    if ((v9 & 0x4000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_25;
  }
LABEL_24:
  v19 = [NSNumber numberWithLong:*(void *)(v8 + 26)];
  [v5 setObject:v19 forKeyedSubscript:*MEMORY[0x263F05280]];

  int v9 = *((_DWORD *)v8 + 1);
  if ((v9 & 0x4000) == 0)
  {
LABEL_17:
    if ((v9 & 0x8000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_26;
  }
LABEL_25:
  v20 = [NSNumber numberWithUnsignedShort:bswap32(v8[38]) >> 16];
  [v5 setObject:v20 forKeyedSubscript:*MEMORY[0x263F05248]];

  int v9 = *((_DWORD *)v8 + 1);
  if ((v9 & 0x8000) == 0)
  {
LABEL_18:
    if ((v9 & 0x40000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_27;
  }
LABEL_26:
  v21 = [NSNumber numberWithUnsignedInt:*((unsigned int *)v8 + 25)];
  [v5 setObject:v21 forKeyedSubscript:*MEMORY[0x263F052A0]];

  v22 = [NSNumber numberWithUnsignedInt:geteuid()];
  [v5 setObject:v22 forKeyedSubscript:*MEMORY[0x263F052C0]];

  int v9 = *((_DWORD *)v8 + 1);
  if ((v9 & 0x40000) == 0)
  {
LABEL_19:
    if ((v9 & 0x80000) == 0) {
      goto LABEL_20;
    }
LABEL_28:
    v24 = [NSNumber numberWithUnsignedInt:*((unsigned int *)v8 + 28)];
    [v5 setObject:v24 forKeyedSubscript:*MEMORY[0x263F05250]];

    int v9 = *((_DWORD *)v8 + 1);
    if ((v9 & 0x100000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_29;
  }
LABEL_27:
  id v23 = [NSNumber numberWithUnsignedInt:*((unsigned int *)v8 + 27)];
  [v5 setObject:v23 forKeyedSubscript:*MEMORY[0x263F05208]];

  int v9 = *((_DWORD *)v8 + 1);
  if ((v9 & 0x80000) != 0) {
    goto LABEL_28;
  }
LABEL_20:
  if ((v9 & 0x100000) == 0) {
    goto LABEL_31;
  }
LABEL_29:
  if (*((_DWORD *)v8 + 29))
  {
    self->_stepsNeeded |= 0x20uLL;
    self->_docid = *((_DWORD *)v8 + 29);
    v25 = [NSNumber numberWithUnsignedInt:*((unsigned int *)v8 + 29)];
    [v5 setObject:v25 forKeyedSubscript:*MEMORY[0x263F05238]];

    int v9 = *((_DWORD *)v8 + 1);
  }
LABEL_31:
  if ((v9 & 0x400000) != 0)
  {
    v26 = (_DWORD *)((char *)v8 + *((int *)v8 + 30) + 120);
    if (*v26 == 19710317 && (v26[9] + 1) >= 2)
    {
      v27 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
      [v5 setObject:v27 forKeyedSubscript:*MEMORY[0x263F05268]];

      int v9 = *((_DWORD *)v8 + 1);
    }
  }
  if ((v9 & 0x2000000) != 0)
  {
    self->_ino = *((void *)v8 + 16);
    v28 = [NSNumber numberWithUnsignedLongLong:*((void *)v8 + 16)];
    [v5 setObject:v28 forKeyedSubscript:*MEMORY[0x263F05240]];

    int v9 = *((_DWORD *)v8 + 1);
  }
  if ((v9 & 0x40000000) != 0)
  {
    v29 = [NSNumber numberWithUnsignedInt:*((unsigned int *)v8 + 34)];
    [v5 setObject:v29 forKeyedSubscript:*MEMORY[0x263F05228]];
  }
  int v30 = *((_DWORD *)v8 + 8);
  if (v30 != 1) {
    goto LABEL_51;
  }
  int v31 = *((_DWORD *)v8 + 4);
  if (v31)
  {
    v40 = [NSNumber numberWithInt:*((_DWORD *)v8 + 35) > 1u];
    [v5 setObject:v40 forKeyedSubscript:*MEMORY[0x263F05258]];

    int v31 = *((_DWORD *)v8 + 4);
    if ((v31 & 0x200) == 0)
    {
LABEL_42:
      if ((v31 & 0x400) == 0) {
        goto LABEL_43;
      }
LABEL_72:
      v42 = [NSNumber numberWithLongLong:*((void *)v8 + 19)];
      [v5 setObject:v42 forKeyedSubscript:*MEMORY[0x263F05290]];

      if ((*((_DWORD *)v8 + 4) & 0x1000) == 0) {
        goto LABEL_45;
      }
      goto LABEL_44;
    }
  }
  else if ((v31 & 0x200) == 0)
  {
    goto LABEL_42;
  }
  v41 = [NSNumber numberWithLongLong:*((void *)v8 + 18)];
  [v5 setObject:v41 forKeyedSubscript:*MEMORY[0x263F05270]];

  int v31 = *((_DWORD *)v8 + 4);
  if ((v31 & 0x400) != 0) {
    goto LABEL_72;
  }
LABEL_43:
  if ((v31 & 0x1000) != 0)
  {
LABEL_44:
    v32 = [NSNumber numberWithLongLong:*((void *)v8 + 20)];
    [v5 setObject:v32 forKeyedSubscript:*MEMORY[0x263F05298]];
  }
LABEL_45:
  if ((*((unsigned char *)v8 + 21) & 2) != 0)
  {
    uint64_t v33 = *((void *)v8 + 21);
    if ((v33 & 8) != 0)
    {
      self->_stepsNeeded |= 8uLL;
      uint64_t v33 = *((void *)v8 + 21);
    }
    if ((v33 & 2) == 0) {
      self->_stepsNeeded |= 4uLL;
    }
  }
  int v30 = *((_DWORD *)v8 + 8);
LABEL_51:
  if (v30 == 2)
  {
    if ((v8[6] & 2) != 0)
    {
      v34 = [NSNumber numberWithUnsignedInt:*((unsigned int *)v8 + 35)];
      [v5 setObject:v34 forKeyedSubscript:*MEMORY[0x263F05230]];
    }
    if ((*((unsigned char *)v8 + 21) & 2) != 0)
    {
      uint64_t v35 = *((void *)v8 + 18);
      if ((v35 & 8) != 0)
      {
        self->_stepsNeeded |= 8uLL;
        uint64_t v35 = *((void *)v8 + 18);
      }
      if ((v35 & 2) == 0) {
        self->_stepsNeeded |= 4uLL;
      }
    }
    if ((*((unsigned char *)v8 + 21) & 4) != 0)
    {
      v36 = [NSNumber numberWithInt:*((void *)v8 + 19) != 0];
      [v5 setObject:v36 forKeyedSubscript:*MEMORY[0x263F05260]];
    }
  }
  v37 = [NSNumber numberWithInt:v6];
  [v5 setObject:v37 forKeyedSubscript:*MEMORY[0x263F052B0]];

  if (*((_DWORD *)v8 + 8) == 1
    && *((uint64_t *)v8 + 18) >= 1
    && (v8[54] & 0x20) == 0
    && (*((_DWORD *)v8 + 34) - 1) >= 2)
  {
    self->_stepsNeeded |= 0x40uLL;
  }
  uint64_t v43 = 0;
  if (!ffsctl(self->_fd, 0x40084A4AuLL, &v43, 0))
  {
    v38 = [NSNumber numberWithUnsignedLongLong:v43];
    [v5 setObject:v38 forKeyedSubscript:*MEMORY[0x263F05220]];
  }
  free(v8);
  [(NSMutableDictionary *)self->_diagnostic addEntriesFromDictionary:v5];
  BOOL v12 = 1;
LABEL_69:

  return v12;
}

+ (unint64_t)getStringCharactersSet:(id)a3
{
  uint64_t v3 = getStringCharactersSet__onceToken[0];
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(getStringCharactersSet__onceToken, &__block_literal_global_1);
  }
  id v5 = [MEMORY[0x263F08708] controlCharacterSet];
  unint64_t v6 = [v4 rangeOfCharacterFromSet:v5] != 0x7FFFFFFFFFFFFFFFLL;

  unint64_t v7 = [MEMORY[0x263F08708] illegalCharacterSet];
  uint64_t v8 = [v4 rangeOfCharacterFromSet:v7];

  if (v8 != 0x7FFFFFFFFFFFFFFFLL) {
    v6 |= 2uLL;
  }
  int v9 = [MEMORY[0x263F08708] nonBaseCharacterSet];
  uint64_t v10 = [v4 rangeOfCharacterFromSet:v9];

  if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
    v6 |= 4uLL;
  }
  uint64_t v11 = [MEMORY[0x263F08708] symbolCharacterSet];
  uint64_t v12 = [v4 rangeOfCharacterFromSet:v11];

  if (v12 != 0x7FFFFFFFFFFFFFFFLL) {
    v6 |= 8uLL;
  }
  v13 = [MEMORY[0x263F08708] _emojiCharacterSet];
  uint64_t v14 = [v4 rangeOfCharacterFromSet:v13];

  if (v14 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v15 = v6;
  }
  else {
    unint64_t v15 = v6 | 0x10;
  }
  uint64_t v16 = [v4 rangeOfCharacterFromSet:getStringCharactersSet__nonLatinCharacterSet];

  if (v16 == 0x7FFFFFFFFFFFFFFFLL) {
    return v15;
  }
  else {
    return v15 | 0x20;
  }
}

void __48__FPDiagnosticCollector_getStringCharactersSet___block_invoke()
{
  objc_msgSend(MEMORY[0x263F08708], "characterSetWithRange:", 0, 591);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v2 invertedSet];
  v1 = (void *)getStringCharactersSet__nonLatinCharacterSet;
  getStringCharactersSet__nonLatinCharacterSet = v0;
}

- (BOOL)_collectFnameAttributesWithError:(id *)a3
{
  v45[5] = *MEMORY[0x263EF8340];
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  unint64_t v6 = (char *)malloc_type_malloc(0x2000uLL, 0x746420E7uLL);
  if (!v6)
  {
    objc_msgSend(MEMORY[0x263F087E8], "fp_errorWithPOSIXCode:", *__error());
    BOOL v12 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_29;
  }
  unint64_t v7 = v6;
  if (fsgetpath(v6, 0x2000uLL, &self->_fsid, self->_ino) < 0)
  {
    objc_msgSend(MEMORY[0x263F087E8], "fp_errorWithPOSIXCode:", *__error());
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    free(v7);
    BOOL v12 = 0;
    goto LABEL_29;
  }
  uint64_t v8 = [NSString stringWithUTF8String:v7];
  int v9 = [v8 lastPathComponent];
  uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "length"));
  [v5 setObject:v10 forKeyedSubscript:*MEMORY[0x263F051C0]];

  if ([v9 hasPrefix:@"._"])
  {
    uint64_t v11 = (void *)MEMORY[0x263F051A8];
LABEL_9:
    [v5 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*v11];
    goto LABEL_10;
  }
  if ([v9 hasPrefix:@"."])
  {
    uint64_t v11 = (void *)MEMORY[0x263F051B0];
    goto LABEL_9;
  }
LABEL_10:
  v13 = [v9 getUnicodeNormalization];
  [v5 setObject:v13 forKeyedSubscript:*MEMORY[0x263F051E0]];

  uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "length"));
  [v5 setObject:v14 forKeyedSubscript:*MEMORY[0x263F051D0]];

  unint64_t v15 = NSNumber;
  uint64_t v16 = [v8 pathComponents];
  v17 = objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v16, "count"));
  [v5 setObject:v17 forKeyedSubscript:*MEMORY[0x263F051C8]];

  v18 = [v9 pathExtension];
  if ([v18 length]) {
    [v5 setObject:v18 forKeyedSubscript:*MEMORY[0x263F051A0]];
  }
  unint64_t v19 = +[FPDiagnosticCollector getStringCharactersSet:v9];
  if (v19)
  {
    v20 = [NSNumber numberWithUnsignedInteger:v19];
    [v5 setObject:v20 forKeyedSubscript:*MEMORY[0x263F05198]];
  }
  v21 = [NSURL fileURLWithPath:v8];
  id v43 = 0;
  int v22 = [v21 getResourceValue:&v43 forKey:*MEMORY[0x263EFF608] error:0];
  id v23 = v43;
  if (v22)
  {
    v36 = v18;
    v37 = v9;
    v38 = v8;
    uint64_t v24 = *MEMORY[0x263F1DA68];
    v45[0] = *MEMORY[0x263F1DC10];
    v45[1] = v24;
    uint64_t v25 = *MEMORY[0x263F1DCD0];
    v45[2] = *MEMORY[0x263F1D968];
    v45[3] = v25;
    v45[4] = *MEMORY[0x263F1DA48];
    [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:5];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v26 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v27 = [v26 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v40;
      while (2)
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v40 != v29) {
            objc_enumerationMutation(v26);
          }
          int v31 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          if ([v23 conformsToType:v31])
          {
            v32 = [v31 identifier];
            [v5 setObject:v32 forKeyedSubscript:*MEMORY[0x263F051D8]];

            goto LABEL_25;
          }
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v39 objects:v44 count:16];
        if (v28) {
          continue;
        }
        break;
      }
    }
LABEL_25:

    int v9 = v37;
    uint64_t v8 = v38;
    v18 = v36;
  }
  uint64_t v33 = [v21 URLByDeletingLastPathComponent];
  parentURL = self->_parentURL;
  self->_parentURL = v33;

  if (![(NSURL *)self->_trashURL fp_relationshipToItemAtURL:v21]) {
    [v5 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F051B8]];
  }
  free(v7);
  [(NSMutableDictionary *)self->_diagnostic addEntriesFromDictionary:v5];

  BOOL v12 = 1;
LABEL_29:

  return v12;
}

- (BOOL)_collectXattrAttributesWithError:(id *)a3
{
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  size_t v6 = getpagesize();
  unint64_t v7 = (char *)malloc_type_malloc(v6, 0x848B0D9FuLL);
  if (!v7)
  {
    objc_msgSend(MEMORY[0x263F087E8], "fp_errorWithPOSIXCode:", *__error());
    BOOL v12 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_29;
  }
  uint64_t v8 = v7;
  unint64_t v9 = flistxattr(self->_fd, v7, v6, 32);
  if ((v9 & 0x8000000000000000) != 0)
  {
    v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v11 = *__error();
    uint64_t v10 = v13;
    goto LABEL_7;
  }
  if (v9 > v6)
  {
    uint64_t v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v11 = 12;
LABEL_7:
    objc_msgSend(v10, "fp_errorWithPOSIXCode:", v11);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    free(v8);
    BOOL v12 = 0;
    goto LABEL_29;
  }
  if (!v9)
  {
    uint64_t v24 = [NSNumber numberWithInt:0];
    uint64_t v25 = (void *)MEMORY[0x263F052D0];
    goto LABEL_27;
  }
  uint64_t v27 = self;
  LODWORD(self) = 0;
  char v31 = 0;
  uint64_t v14 = &v8[v9];
  uint64_t v28 = *MEMORY[0x263F052D8];
  uint64_t v29 = *MEMORY[0x263F052E8];
  uint64_t v30 = *MEMORY[0x263F052E0];
  uint64_t v15 = MEMORY[0x263EFFA88];
  uint64_t v16 = *MEMORY[0x263F052F0];
  v17 = v8;
  do
  {
    size_t v18 = strlen(v17);
    if (!strcmp(v17, "com.apple.quarantine"))
    {
      unint64_t v19 = v5;
      uint64_t v20 = v15;
      uint64_t v21 = v16;
    }
    else if (!strcmp(v17, "com.apple.fileprovider.dir#N"))
    {
      unint64_t v19 = v5;
      uint64_t v20 = v15;
      uint64_t v21 = v30;
    }
    else if (!strcmp(v17, "com.apple.fileprovider.fpfs#P"))
    {
      unint64_t v19 = v5;
      uint64_t v20 = v15;
      uint64_t v21 = v29;
    }
    else
    {
      if (strcmp(v17, "com.apple.fileprovider.before-bounce#P"))
      {
        v31 |= strcmp(v17, "com.apple.decmpfs") == 0;
        goto LABEL_20;
      }
      unint64_t v19 = v5;
      uint64_t v20 = v15;
      uint64_t v21 = v28;
    }
    [v19 setObject:v20 forKeyedSubscript:v21];
LABEL_20:
    v17 += v18 + 1;
    self = (FPDiagnosticCollector *)(self + 1);
  }
  while (v17 < v14);
  int v22 = [NSNumber numberWithInt:self];
  [v5 setObject:v22 forKeyedSubscript:*MEMORY[0x263F052D0]];

  self = v27;
  if (v31)
  {
    uint64_t v23 = fpfs_fget_decmpf_type();
    if (v23 < 0) {
      [NSNumber numberWithInt:-*__error()];
    }
    else {
    uint64_t v24 = [NSNumber numberWithLong:v23];
    }
    uint64_t v25 = (void *)MEMORY[0x263F052C8];
LABEL_27:
    [v5 setObject:v24 forKeyedSubscript:*v25];
  }
  free(v8);
  [(NSMutableDictionary *)self->_diagnostic addEntriesFromDictionary:v5];
  BOOL v12 = 1;
LABEL_29:

  return v12;
}

- (BOOL)_collectPurgeAttributesWithError:(id *)a3
{
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  int v6 = ffsctl(self->_fd, 0x40304A6DuLL, &v12, 0);
  if (v6 < 0)
  {
    objc_msgSend(MEMORY[0x263F087E8], "fp_errorWithPOSIXCode:", *__error());
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unint64_t v7 = [NSNumber numberWithUnsignedLongLong:(void)v12];
    [v5 setObject:v7 forKeyedSubscript:*MEMORY[0x263F051F0]];

    uint64_t v8 = [NSNumber numberWithUnsignedLongLong:*((void *)&v13 + 1)];
    [v5 setObject:v8 forKeyedSubscript:*MEMORY[0x263F051F8]];

    unint64_t v9 = [NSNumber numberWithUnsignedLongLong:(unint64_t)v13 / 0x3B9ACA00];
    [v5 setObject:v9 forKeyedSubscript:*MEMORY[0x263F051E8]];

    uint64_t v10 = [NSNumber numberWithUnsignedLongLong:(void)v14];
    [v5 setObject:v10 forKeyedSubscript:*MEMORY[0x263F05200]];

    [(NSMutableDictionary *)self->_diagnostic addEntriesFromDictionary:v5];
  }

  return v6 >= 0;
}

- (BOOL)_collectMountAttributesWithError:(id *)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  bzero(&v12, 0x878uLL);
  int v6 = fstatfs(self->_fd, &v12);
  if (v6 < 0)
  {
    objc_msgSend(MEMORY[0x263F087E8], "fp_errorWithPOSIXCode:", 12);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unint64_t v7 = [NSNumber numberWithUnsignedLongLong:v12.f_bavail * v12.f_bsize];
    [v5 setObject:v7 forKeyedSubscript:*MEMORY[0x263F05068]];

    uint64_t v8 = [NSNumber numberWithUnsignedInt:v12.f_flags];
    [v5 setObject:v8 forKeyedSubscript:*MEMORY[0x263F05080]];

    unint64_t v9 = [NSNumber numberWithUnsignedInt:v12.f_bsize];
    [v5 setObject:v9 forKeyedSubscript:*MEMORY[0x263F05070]];

    if (!APFSVolumeRole())
    {
      uint64_t v10 = [NSNumber numberWithUnsignedShort:0];
      [v5 setObject:v10 forKeyedSubscript:*MEMORY[0x263F05088]];
    }
    [v5 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F05078]];
    [(NSMutableDictionary *)self->_diagnostic addEntriesFromDictionary:v5];
  }

  return v6 >= 0;
}

- (BOOL)_collectdocIDAttributesWithError:(id *)a3
{
  if (GSLibraryResolveDocumentId2() == self->_ino) {
    uint64_t v4 = MEMORY[0x263EFFA88];
  }
  else {
    uint64_t v4 = MEMORY[0x263EFFA80];
  }
  [(NSMutableDictionary *)self->_diagnostic setObject:v4 forKeyedSubscript:*MEMORY[0x263F052A8]];
  return 1;
}

- (BOOL)_tryReadFirstByteOfFileWithError:(id *)a3
{
  char __buf = 0;
  if (pread(self->_fd, &__buf, 1uLL, 0) < 0)
  {
    uint64_t v4 = [NSNumber numberWithInt:*__error()];
    [(NSMutableDictionary *)self->_diagnostic setObject:v4 forKeyedSubscript:*MEMORY[0x263F052B8]];
  }
  else
  {
    [(NSMutableDictionary *)self->_diagnostic setObject:&unk_26FFEFE30 forKeyedSubscript:*MEMORY[0x263F052B8]];
  }
  return 1;
}

- (BOOL)_collectParentACLCountWithError:(id *)a3
{
  if (!self->_parentURL) {
    return 1;
  }
  uint64_t v13 = 0;
  long long v12 = xmmword_24DCCEB38;
  size_t v5 = getpagesize();
  int v6 = malloc_type_malloc(v5, 0xD19B5ADFuLL);
  if (v6)
  {
    unint64_t v7 = v6;
    if ((getattrlist([(NSURL *)self->_parentURL fileSystemRepresentation], &v12, v6, v5, 0x20u) & 0x80000000) == 0)
    {
      if ((v7[6] & 0x40) != 0)
      {
        uint64_t v8 = &v7[*((int *)v7 + 6) + 24];
        if (*v8 == 19710317 && (v8[9] + 1) >= 2)
        {
          unint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
          [(NSMutableDictionary *)self->_diagnostic setObject:v9 forKeyedSubscript:*MEMORY[0x263F05288]];
        }
      }
      free(v7);
      return 1;
    }
    objc_msgSend(MEMORY[0x263F087E8], "fp_errorWithPOSIXCode:", *__error());
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    free(v7);
    return 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x263F087E8], "fp_errorWithPOSIXCode:", *__error(), v12, v13);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    BOOL result = 0;
    *a3 = v11;
  }
  return result;
}

- (NSDictionary)diagnostic
{
  return &self->_diagnostic->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trashURL, 0);
  objc_storeStrong((id *)&self->_parentURL, 0);

  objc_storeStrong((id *)&self->_diagnostic, 0);
}

@end