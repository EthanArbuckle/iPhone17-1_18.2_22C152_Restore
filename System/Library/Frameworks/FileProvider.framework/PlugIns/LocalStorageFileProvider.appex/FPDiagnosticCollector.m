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
    v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
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
      *a4 = +[NSError fp_errorWithPOSIXCode:45];
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
      unsigned __int8 v9 = [(FPDiagnosticCollector *)self _performStep:v7 error:&v23];
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
    [(NSMutableDictionary *)self->_diagnostic setObject:v13 forKeyedSubscript:FPDiagnosticAttributeKeyDiagErrorDomain];

    v14 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 code]);
    [(NSMutableDictionary *)self->_diagnostic setObject:v14 forKeyedSubscript:FPDiagnosticAttributeKeyDiagErrorCode];

    v15 = [v6 underlyingErrors];
    id v16 = [v15 count];

    if (v16)
    {
      v17 = [v6 underlyingErrors];
      v18 = [v17 firstObject];

      v19 = [v18 domain];
      [(NSMutableDictionary *)self->_diagnostic setObject:v19 forKeyedSubscript:FPDiagnosticAttributeKeyDiagUnderlyingErrorDomain];

      v20 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v18 code]);
      [(NSMutableDictionary *)self->_diagnostic setObject:v20 forKeyedSubscript:FPDiagnosticAttributeKeyDiagUnderlyingErrorCode];
    }
    v21 = +[NSNumber numberWithUnsignedInteger:v5];
    [(NSMutableDictionary *)self->_diagnostic setObject:v21 forKeyedSubscript:FPDiagnosticAttributeKeyDiagFailuresBitmap];
  }
  return v8 & 1;
}

- (BOOL)_collectInodeAttributesWithError:(id *)a3
{
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  long long v42 = xmmword_100975B68;
  uint64_t v43 = 0x60000001601;
  size_t v6 = getpagesize();
  unint64_t v7 = (unsigned __int16 *)malloc_type_malloc(v6, 0xB1658410uLL);
  if (!v7)
  {
    +[NSError fp_errorWithPOSIXCode:*__error()];
    BOOL v11 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_69;
  }
  char v8 = v7;
  if (fgetattrlist(self->_fd, &v42, v7, v6, 0x28u) < 0)
  {
    uint64_t v10 = *__error();
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
    uint64_t v10 = 9;
LABEL_9:
    *a3 = +[NSError fp_errorWithPOSIXCode:v10];
    free(v8);
    BOOL v11 = 0;
    goto LABEL_69;
  }
  int v12 = *((_DWORD *)v8 + 8) - 1;
  if (v12 > 6) {
    int v13 = 0;
  }
  else {
    int v13 = word_100975B98[v12];
  }
  if ((v9 & 0x20000) != 0)
  {
    v14 = +[NSNumber numberWithUnsignedShort:v13 | v8[52]];
    [v5 setObject:v14 forKeyedSubscript:FPDiagnosticAttributeKeyStatMode];

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
  v15 = +[NSNumber numberWithLong:*(void *)(v8 + 18)];
  [v5 setObject:v15 forKeyedSubscript:FPDiagnosticAttributeKeyStatBtime];

  id v16 = +[NSNumber numberWithBool:fpfs_is_busy_date()];
  [v5 setObject:v16 forKeyedSubscript:FPDiagnosticAttributeKeyStatBtimeIsBusy];

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
  v17 = +[NSNumber numberWithLong:*(void *)(v8 + 26)];
  [v5 setObject:v17 forKeyedSubscript:FPDiagnosticAttributeKeyStatMtime];

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
  v18 = +[NSNumber numberWithUnsignedShort:bswap32(v8[38]) >> 16];
  [v5 setObject:v18 forKeyedSubscript:FPDiagnosticAttributeKeyStatFinderInfoFlags];

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
  v19 = +[NSNumber numberWithUnsignedInt:*((unsigned int *)v8 + 25)];
  [v5 setObject:v19 forKeyedSubscript:FPDiagnosticAttributeKeyStatUID];

  v20 = +[NSNumber numberWithUnsignedInt:geteuid()];
  [v5 setObject:v20 forKeyedSubscript:FPDiagnosticAttributeKeySysUID];

  int v9 = *((_DWORD *)v8 + 1);
  if ((v9 & 0x40000) == 0)
  {
LABEL_19:
    if ((v9 & 0x80000) == 0) {
      goto LABEL_20;
    }
LABEL_28:
    v22 = +[NSNumber numberWithUnsignedInt:*((unsigned int *)v8 + 28)];
    [v5 setObject:v22 forKeyedSubscript:FPDiagnosticAttributeKeyStatGencount];

    int v9 = *((_DWORD *)v8 + 1);
    if ((v9 & 0x100000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_29;
  }
LABEL_27:
  v21 = +[NSNumber numberWithUnsignedInt:*((unsigned int *)v8 + 27)];
  [v5 setObject:v21 forKeyedSubscript:FPDiagnosticAttributeKeyStatBSDFlags];

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
    id v23 = +[NSNumber numberWithUnsignedInt:*((unsigned int *)v8 + 29)];
    [v5 setObject:v23 forKeyedSubscript:FPDiagnosticAttributeKeyStatDocID];

    int v9 = *((_DWORD *)v8 + 1);
  }
LABEL_31:
  if ((v9 & 0x400000) != 0)
  {
    v24 = (_DWORD *)((char *)v8 + *((int *)v8 + 30) + 120);
    if (*v24 == 19710317 && (v24[9] + 1) >= 2)
    {
      v25 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:");
      [v5 setObject:v25 forKeyedSubscript:FPDiagnosticAttributeKeyStatItemACLCount];

      int v9 = *((_DWORD *)v8 + 1);
    }
  }
  if ((v9 & 0x2000000) != 0)
  {
    self->_ino = *((void *)v8 + 16);
    v26 = +[NSNumber numberWithUnsignedLongLong:*((void *)v8 + 16)];
    [v5 setObject:v26 forKeyedSubscript:FPDiagnosticAttributeKeyStatFileID];

    int v9 = *((_DWORD *)v8 + 1);
  }
  if ((v9 & 0x40000000) != 0)
  {
    v27 = +[NSNumber numberWithUnsignedInt:*((unsigned int *)v8 + 34)];
    [v5 setObject:v27 forKeyedSubscript:FPDiagnosticAttributeKeyStatDataProtectionClass];
  }
  int v28 = *((_DWORD *)v8 + 8);
  if (v28 != 1) {
    goto LABEL_51;
  }
  int v29 = *((_DWORD *)v8 + 4);
  if (v29)
  {
    v38 = +[NSNumber numberWithInt:*((_DWORD *)v8 + 35) > 1u];
    [v5 setObject:v38 forKeyedSubscript:FPDiagnosticAttributeKeyStatHasMoreLinks];

    int v29 = *((_DWORD *)v8 + 4);
    if ((v29 & 0x200) == 0)
    {
LABEL_42:
      if ((v29 & 0x400) == 0) {
        goto LABEL_43;
      }
LABEL_72:
      v40 = +[NSNumber numberWithLongLong:*((void *)v8 + 19)];
      [v5 setObject:v40 forKeyedSubscript:FPDiagnosticAttributeKeyStatPhysicalSize];

      if ((*((_DWORD *)v8 + 4) & 0x1000) == 0) {
        goto LABEL_45;
      }
      goto LABEL_44;
    }
  }
  else if ((v29 & 0x200) == 0)
  {
    goto LABEL_42;
  }
  v39 = +[NSNumber numberWithLongLong:*((void *)v8 + 18)];
  [v5 setObject:v39 forKeyedSubscript:FPDiagnosticAttributeKeyStatLogicalSize];

  int v29 = *((_DWORD *)v8 + 4);
  if ((v29 & 0x400) != 0) {
    goto LABEL_72;
  }
LABEL_43:
  if ((v29 & 0x1000) != 0)
  {
LABEL_44:
    v30 = +[NSNumber numberWithLongLong:*((void *)v8 + 20)];
    [v5 setObject:v30 forKeyedSubscript:FPDiagnosticAttributeKeyStatResourceForkSize];
  }
LABEL_45:
  if ((*((unsigned char *)v8 + 21) & 2) != 0)
  {
    uint64_t v31 = *((void *)v8 + 21);
    if ((v31 & 8) != 0)
    {
      self->_stepsNeeded |= 8uLL;
      uint64_t v31 = *((void *)v8 + 21);
    }
    if ((v31 & 2) == 0) {
      self->_stepsNeeded |= 4uLL;
    }
  }
  int v28 = *((_DWORD *)v8 + 8);
LABEL_51:
  if (v28 == 2)
  {
    if ((v8[6] & 2) != 0)
    {
      v32 = +[NSNumber numberWithUnsignedInt:*((unsigned int *)v8 + 35)];
      [v5 setObject:v32 forKeyedSubscript:FPDiagnosticAttributeKeyStatDirEntryCount];
    }
    if ((*((unsigned char *)v8 + 21) & 2) != 0)
    {
      uint64_t v33 = *((void *)v8 + 18);
      if ((v33 & 8) != 0)
      {
        self->_stepsNeeded |= 8uLL;
        uint64_t v33 = *((void *)v8 + 18);
      }
      if ((v33 & 2) == 0) {
        self->_stepsNeeded |= 4uLL;
      }
    }
    if ((*((unsigned char *)v8 + 21) & 4) != 0)
    {
      v34 = +[NSNumber numberWithInt:*((void *)v8 + 19) != 0];
      [v5 setObject:v34 forKeyedSubscript:FPDiagnosticAttributeKeyStatIsDirstatEnabled];
    }
  }
  v35 = +[NSNumber numberWithInt:v6];
  [v5 setObject:v35 forKeyedSubscript:FPDiagnosticAttributeKeySysPageSize];

  if (*((_DWORD *)v8 + 8) == 1
    && *((uint64_t *)v8 + 18) >= 1
    && (v8[54] & 0x20) == 0
    && (*((_DWORD *)v8 + 34) - 1) >= 2)
  {
    self->_stepsNeeded |= 0x40uLL;
  }
  uint64_t v41 = 0;
  if (!ffsctl(self->_fd, 0x40084A4AuLL, &v41, 0))
  {
    v36 = +[NSNumber numberWithUnsignedLongLong:v41];
    [v5 setObject:v36 forKeyedSubscript:FPDiagnosticAttributeKeyStatClosestSyncroot];
  }
  free(v8);
  [(NSMutableDictionary *)self->_diagnostic addEntriesFromDictionary:v5];
  BOOL v11 = 1;
LABEL_69:

  return v11;
}

+ (unint64_t)getStringCharactersSet:(id)a3
{
  uint64_t v3 = qword_100AE2AD8[0];
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(qword_100AE2AD8, &stru_100A69BC0);
  }
  id v5 = +[NSCharacterSet controlCharacterSet];
  unint64_t v6 = [v4 rangeOfCharacterFromSet:v5] != (id)0x7FFFFFFFFFFFFFFFLL;

  unint64_t v7 = +[NSCharacterSet illegalCharacterSet];
  id v8 = [v4 rangeOfCharacterFromSet:v7];

  if (v8 != (id)0x7FFFFFFFFFFFFFFFLL) {
    v6 |= 2uLL;
  }
  int v9 = +[NSCharacterSet nonBaseCharacterSet];
  id v10 = [v4 rangeOfCharacterFromSet:v9];

  if (v10 != (id)0x7FFFFFFFFFFFFFFFLL) {
    v6 |= 4uLL;
  }
  BOOL v11 = +[NSCharacterSet symbolCharacterSet];
  id v12 = [v4 rangeOfCharacterFromSet:v11];

  if (v12 != (id)0x7FFFFFFFFFFFFFFFLL) {
    v6 |= 8uLL;
  }
  int v13 = +[NSCharacterSet _emojiCharacterSet];
  id v14 = [v4 rangeOfCharacterFromSet:v13];

  if (v14 == (id)0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v15 = v6;
  }
  else {
    unint64_t v15 = v6 | 0x10;
  }
  id v16 = [v4 rangeOfCharacterFromSet:qword_100AE2AD0];

  if (v16 == (id)0x7FFFFFFFFFFFFFFFLL) {
    return v15;
  }
  else {
    return v15 | 0x20;
  }
}

- (BOOL)_collectFnameAttributesWithError:(id *)a3
{
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  unint64_t v6 = (char *)malloc_type_malloc(0x2000uLL, 0x746420E7uLL);
  if (!v6)
  {
    +[NSError fp_errorWithPOSIXCode:*__error()];
    BOOL v12 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_29;
  }
  unint64_t v7 = v6;
  if (fsgetpath(v6, 0x2000uLL, &self->_fsid, self->_ino) < 0)
  {
    *a3 = +[NSError fp_errorWithPOSIXCode:*__error()];
    free(v7);
    BOOL v12 = 0;
    goto LABEL_29;
  }
  id v8 = +[NSString stringWithUTF8String:v7];
  int v9 = [v8 lastPathComponent];
  id v10 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v9 length]);
  [v5 setObject:v10 forKeyedSubscript:FPDiagnosticAttributeKeyNameLength];

  if ([v9 hasPrefix:@"._"])
  {
    BOOL v11 = &FPDiagnosticAttributeKeyNameIsAppleDouble;
LABEL_9:
    [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:*v11];
    goto LABEL_10;
  }
  if ([v9 hasPrefix:@"."])
  {
    BOOL v11 = &FPDiagnosticAttributeKeyNameIsDotFile;
    goto LABEL_9;
  }
LABEL_10:
  int v13 = [v9 getUnicodeNormalization];
  [v5 setObject:v13 forKeyedSubscript:FPDiagnosticAttributeKeyNameUnicodeNorm];

  id v14 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 length]);
  [v5 setObject:v14 forKeyedSubscript:FPDiagnosticAttributeKeyNamePathLength];

  unint64_t v15 = [v8 pathComponents];
  id v16 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v15 count]);
  [v5 setObject:v16 forKeyedSubscript:FPDiagnosticAttributeKeyNamePathDepth];

  v17 = [v9 pathExtension];
  if ([v17 length]) {
    [v5 setObject:v17 forKeyedSubscript:FPDiagnosticAttributeKeyNameExtension];
  }
  unint64_t v18 = +[FPDiagnosticCollector getStringCharactersSet:v9];
  if (v18)
  {
    v19 = +[NSNumber numberWithUnsignedInteger:v18];
    [v5 setObject:v19 forKeyedSubscript:FPDiagnosticAttributeKeyNameCharacterSets];
  }
  v20 = +[NSURL fileURLWithPath:v8];
  id v40 = 0;
  unsigned int v21 = [v20 getResourceValue:&v40 forKey:NSURLContentTypeKey error:0];
  id v22 = v40;
  if (v21)
  {
    uint64_t v33 = v17;
    v34 = v9;
    v35 = v8;
    v42[0] = UTTypePackage;
    v42[1] = UTTypeDirectory;
    v42[2] = UTTypeAliasFile;
    v42[3] = UTTypeSymbolicLink;
    v42[4] = UTTypeData;
    +[NSArray arrayWithObjects:v42 count:5];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    id v24 = [v23 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v37;
      while (2)
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          if (*(void *)v37 != v26) {
            objc_enumerationMutation(v23);
          }
          int v28 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          if ([v22 conformsToType:v28])
          {
            int v29 = [v28 identifier];
            [v5 setObject:v29 forKeyedSubscript:FPDiagnosticAttributeKeyNameUTType];

            goto LABEL_25;
          }
        }
        id v25 = [v23 countByEnumeratingWithState:&v36 objects:v41 count:16];
        if (v25) {
          continue;
        }
        break;
      }
    }
LABEL_25:

    int v9 = v34;
    id v8 = v35;
    v17 = v33;
  }
  v30 = [v20 URLByDeletingLastPathComponent];
  parentURL = self->_parentURL;
  self->_parentURL = v30;

  if (![(NSURL *)self->_trashURL fp_relationshipToItemAtURL:v20]) {
    [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:FPDiagnosticAttributeKeyNameIsTrashed];
  }
  free(v7);
  [(NSMutableDictionary *)self->_diagnostic addEntriesFromDictionary:v5];

  BOOL v12 = 1;
LABEL_29:

  return v12;
}

- (BOOL)_collectXattrAttributesWithError:(id *)a3
{
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  size_t v6 = getpagesize();
  unint64_t v7 = (char *)malloc_type_malloc(v6, 0x848B0D9FuLL);
  if (!v7)
  {
    +[NSError fp_errorWithPOSIXCode:*__error()];
    BOOL v11 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_29;
  }
  id v8 = v7;
  unint64_t v9 = flistxattr(self->_fd, v7, v6, 32);
  if ((v9 & 0x8000000000000000) != 0)
  {
    uint64_t v10 = *__error();
    goto LABEL_7;
  }
  if (v9 > v6)
  {
    uint64_t v10 = 12;
LABEL_7:
    *a3 = +[NSError fp_errorWithPOSIXCode:v10];
    free(v8);
    BOOL v11 = 0;
    goto LABEL_29;
  }
  if (!v9)
  {
    v20 = +[NSNumber numberWithInt:0];
    unsigned int v21 = &FPDiagnosticAttributeKeyXattrCount;
    goto LABEL_27;
  }
  id v23 = self;
  LODWORD(self) = 0;
  char v27 = 0;
  BOOL v12 = &v8[v9];
  uint64_t v24 = FPDiagnosticAttributeKeyXattrHasBeforeBounce;
  uint64_t v25 = FPDiagnosticAttributeKeyXattrHasPromotion;
  uint64_t v26 = FPDiagnosticAttributeKeyXattrHasDemotion;
  uint64_t v13 = FPDiagnosticAttributeKeyXattrIsQuarantined;
  id v14 = v8;
  do
  {
    size_t v15 = strlen(v14);
    if (!strcmp(v14, "com.apple.quarantine"))
    {
      id v16 = v5;
      uint64_t v17 = v13;
    }
    else if (!strcmp(v14, "com.apple.fileprovider.dir#N"))
    {
      id v16 = v5;
      uint64_t v17 = v26;
    }
    else if (!strcmp(v14, "com.apple.fileprovider.fpfs#P"))
    {
      id v16 = v5;
      uint64_t v17 = v25;
    }
    else
    {
      if (strcmp(v14, "com.apple.fileprovider.before-bounce#P"))
      {
        v27 |= strcmp(v14, "com.apple.decmpfs") == 0;
        goto LABEL_20;
      }
      id v16 = v5;
      uint64_t v17 = v24;
    }
    [v16 setObject:&__kCFBooleanTrue forKeyedSubscript:v17];
LABEL_20:
    v14 += v15 + 1;
    self = (FPDiagnosticCollector *)(self + 1);
  }
  while (v14 < v12);
  unint64_t v18 = +[NSNumber numberWithInt:self];
  [v5 setObject:v18 forKeyedSubscript:FPDiagnosticAttributeKeyXattrCount];

  self = v23;
  if (v27)
  {
    uint64_t v19 = fpfs_fget_decmpf_type();
    if (v19 < 0) {
      +[NSNumber numberWithInt:-*__error()];
    }
    else {
    v20 = +[NSNumber numberWithLong:v19];
    }
    unsigned int v21 = &FPDiagnosticAttributeKeyXattrCompressionType;
LABEL_27:
    [v5 setObject:v20 forKeyedSubscript:*v21];
  }
  free(v8);
  [(NSMutableDictionary *)self->_diagnostic addEntriesFromDictionary:v5];
  BOOL v11 = 1;
LABEL_29:

  return v11;
}

- (BOOL)_collectPurgeAttributesWithError:(id *)a3
{
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  int v6 = ffsctl(self->_fd, 0x40304A6DuLL, &v12, 0);
  if (v6 < 0)
  {
    *a3 = +[NSError fp_errorWithPOSIXCode:*__error()];
  }
  else
  {
    unint64_t v7 = +[NSNumber numberWithUnsignedLongLong:(void)v12];
    [v5 setObject:v7 forKeyedSubscript:FPDiagnosticAttributeKeyPurgeFlags];

    id v8 = +[NSNumber numberWithUnsignedLongLong:*((void *)&v13 + 1)];
    [v5 setObject:v8 forKeyedSubscript:FPDiagnosticAttributeKeyPurgeGencount];

    unint64_t v9 = +[NSNumber numberWithUnsignedLongLong:(unint64_t)v13 / 0x3B9ACA00];
    [v5 setObject:v9 forKeyedSubscript:FPDiagnosticAttributeKeyPurgeAtime];

    uint64_t v10 = +[NSNumber numberWithUnsignedLongLong:(void)v14];
    [v5 setObject:v10 forKeyedSubscript:FPDiagnosticAttributeKeyPurgeSyncroot];

    [(NSMutableDictionary *)self->_diagnostic addEntriesFromDictionary:v5];
  }

  return v6 >= 0;
}

- (BOOL)_collectMountAttributesWithError:(id *)a3
{
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  bzero(&v12, 0x878uLL);
  int v6 = fstatfs(self->_fd, &v12);
  if (v6 < 0)
  {
    *a3 = +[NSError fp_errorWithPOSIXCode:12];
  }
  else
  {
    unint64_t v7 = +[NSNumber numberWithUnsignedLongLong:v12.f_bavail * v12.f_bsize];
    [v5 setObject:v7 forKeyedSubscript:FPDiagnosticAttributeKeyAPFSAvailableSpace];

    id v8 = +[NSNumber numberWithUnsignedInt:v12.f_flags];
    [v5 setObject:v8 forKeyedSubscript:FPDiagnosticAttributeKeyAPFSFlags];

    unint64_t v9 = +[NSNumber numberWithUnsignedInt:v12.f_bsize];
    [v5 setObject:v9 forKeyedSubscript:FPDiagnosticAttributeKeyAPFSBlockSize];

    if (!APFSVolumeRole())
    {
      uint64_t v10 = +[NSNumber numberWithUnsignedShort:0];
      [v5 setObject:v10 forKeyedSubscript:FPDiagnosticAttributeKeyAPFSRole];
    }
    [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:FPDiagnosticAttributeKeyAPFSEncrypted];
    [(NSMutableDictionary *)self->_diagnostic addEntriesFromDictionary:v5];
  }

  return v6 >= 0;
}

- (BOOL)_collectdocIDAttributesWithError:(id *)a3
{
  if (GSLibraryResolveDocumentId2() == self->_ino) {
    id v4 = &__kCFBooleanTrue;
  }
  else {
    id v4 = &__kCFBooleanFalse;
  }
  [(NSMutableDictionary *)self->_diagnostic setObject:v4 forKeyedSubscript:FPDiagnosticAttributeKeySysDocIDResolutionOK];
  return 1;
}

- (BOOL)_tryReadFirstByteOfFileWithError:(id *)a3
{
  char __buf = 0;
  if (pread(self->_fd, &__buf, 1uLL, 0) < 0)
  {
    id v4 = +[NSNumber numberWithInt:*__error()];
    [(NSMutableDictionary *)self->_diagnostic setObject:v4 forKeyedSubscript:FPDiagnosticAttributeKeySysReadErrno];
  }
  else
  {
    [(NSMutableDictionary *)self->_diagnostic setObject:&off_100AA88B8 forKeyedSubscript:FPDiagnosticAttributeKeySysReadErrno];
  }
  return 1;
}

- (BOOL)_collectParentACLCountWithError:(id *)a3
{
  if (!self->_parentURL) {
    return 1;
  }
  uint64_t v13 = 0;
  long long v12 = xmmword_100975B80;
  size_t v5 = getpagesize();
  int v6 = malloc_type_malloc(v5, 0xD19B5ADFuLL);
  if (v6)
  {
    unint64_t v7 = v6;
    if ((getattrlist([(NSURL *)self->_parentURL fileSystemRepresentation], &v12, v6, v5, 0x20u) & 0x80000000) == 0)
    {
      if ((v7[6] & 0x40) != 0)
      {
        id v8 = &v7[*((int *)v7 + 6) + 24];
        if (*v8 == 19710317 && (v8[9] + 1) >= 2)
        {
          unint64_t v9 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:");
          [(NSMutableDictionary *)self->_diagnostic setObject:v9 forKeyedSubscript:FPDiagnosticAttributeKeyStatParentACLCount];
        }
      }
      free(v7);
      return 1;
    }
    *a3 = +[NSError fp_errorWithPOSIXCode:*__error()];
    free(v7);
    return 0;
  }
  else
  {
    +[NSError fp_errorWithPOSIXCode:](NSError, "fp_errorWithPOSIXCode:", *__error(), v12, v13);
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