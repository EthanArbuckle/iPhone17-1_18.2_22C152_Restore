@interface MISignatureAgnosticHasher
+ (id)packedNumberForCPUType:(int)a3 subtype:(int)a4;
+ (void)unpackPackedCpuTypeAndSubType:(id)a3 cputype:(int *)a4 subtype:(int *)a5;
- (BOOL)hasNamedSection;
- (BOOL)performHashWithError:(id *)a3;
- (MISignatureAgnosticHasher)initWithExecutable:(id)a3 searchForSectionNamed:(id)a4;
- (NSDictionary)hashes;
- (NSString)sectionName;
- (NSURL)url;
- (id)_hashSliceAtOffset:(int64_t)a3 withSize:(int64_t)a4 machHeaderAndCommands:(const mach_header *)a5 dictionaryKey:(id *)a6 error:(id *)a7;
- (int)fd;
- (unsigned)countOfSlicesWithNamedSection;
- (void)dealloc;
- (void)setCountOfSlicesWithNamedSection:(unsigned int)a3;
- (void)setFd:(int)a3;
@end

@implementation MISignatureAgnosticHasher

- (MISignatureAgnosticHasher)initWithExecutable:(id)a3 searchForSectionNamed:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MISignatureAgnosticHasher;
  v9 = [(MISignatureAgnosticHasher *)&v12 init];
  v10 = v9;
  if (v9)
  {
    v9->_fd = -1;
    objc_storeStrong((id *)&v9->_url, a3);
    objc_storeStrong((id *)&v10->_sectionName, a4);
  }

  return v10;
}

- (void)dealloc
{
  if (([(MISignatureAgnosticHasher *)self fd] & 0x80000000) == 0) {
    close([(MISignatureAgnosticHasher *)self fd]);
  }
  v3.receiver = self;
  v3.super_class = (Class)MISignatureAgnosticHasher;
  [(MISignatureAgnosticHasher *)&v3 dealloc];
}

- (id)_hashSliceAtOffset:(int64_t)a3 withSize:(int64_t)a4 machHeaderAndCommands:(const mach_header *)a5 dictionaryKey:(id *)a6 error:(id *)a7
{
  objc_super v12 = self;
  uint64_t v121 = *MEMORY[0x1E4F143B8];
  memset(&c, 0, sizeof(c));
  *(void *)md = 0;
  uint64_t v119 = 0;
  int v120 = 0;
  id v13 = [(MISignatureAgnosticHasher *)self sectionName];
  v14 = (const char *)[v13 UTF8String];

  uint32_t magic = a5->magic;
  if ((int)a5->magic <= -17958195)
  {
    if (magic == -822415874 || magic == -805638658)
    {
      _CreateAndLogError((uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]", 75, @"MIInstallerErrorDomain", 73, 0, 0, @"Header magic indicates non-native-endian slice; that's not allowed.",
        v15,
      v17 = v100);
      goto LABEL_14;
    }
    goto LABEL_11;
  }
  if (magic == -17958194)
  {
    uint64_t v18 = 28;
  }
  else
  {
    if (magic != -17958193)
    {
LABEL_11:
      v20 = [(MISignatureAgnosticHasher *)v12 url];
      v21 = [v20 path];
      _CreateAndLogError((uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]", 87, @"MIInstallerErrorDomain", 73, 0, 0, @"Invalid mach_header.magic in %@ : 0x%08x", v23, (uint64_t)v21);
      goto LABEL_12;
    }
    uint64_t v18 = 32;
  }
  *a6 = [(id)objc_opt_class() packedNumberForCPUType:a5->cputype subtype:a5->cpusubtype];
  uint64_t sizeofcmds = a5->sizeofcmds;
  if (sizeofcmds > 0x1000)
  {
    v20 = [(MISignatureAgnosticHasher *)v12 url];
    v21 = [v20 path];
    _CreateAndLogError((uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]", 95, @"MIInstallerErrorDomain", 73, 0, 0, @"Invalid mach_header.sizeofcmds in %@", v22, (uint64_t)v21);
    v17 = LABEL_12:;

LABEL_13:
LABEL_14:
    v24 = 0;
LABEL_15:
    v25 = 0;
    goto LABEL_16;
  }
  uint64_t v107 = v18;
  off_t v108 = a3;
  v111 = a7;
  v27 = (char *)a5 + v18;
  uint32_t ncmds = a5->ncmds;
  int64_t v105 = a4;
  v106 = v27;
  unsigned int v109 = sizeofcmds;
  if (ncmds)
  {
    v29 = 0;
    char v110 = 0;
    uint64_t v113 = 0;
    v114 = 0;
    v115 = 0;
    uint64_t v112 = 0;
    uint64_t v30 = 0;
    unint64_t v31 = (unint64_t)&v27[8 * sizeofcmds];
    while (1)
    {
      if ((unint64_t)(v27 + 8) > v31
        || (unint64_t v32 = *((unsigned int *)v27 + 1), v33 = &v27[v32], (unint64_t)&v27[v32] > v31))
      {
        v46 = [(MISignatureAgnosticHasher *)v12 url];
        v47 = [v46 path];
        _CreateAndLogError((uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]", 105, @"MIInstallerErrorDomain", 73, 0, 0, @"Load command %d exceeds bounds in %@", v40, v30);
        goto LABEL_73;
      }
      int v34 = *(_DWORD *)v27;
      if (*(_DWORD *)v27 != 29) {
        break;
      }
      if (v32 != 16)
      {
        v46 = [(MISignatureAgnosticHasher *)v12 url];
        v47 = [v46 path];
        _CreateAndLogError((uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]", 169, @"MIInstallerErrorDomain", 73, 0, 0, @"Invalid LC_CODE_SIGNATURE command in %@", v48, (uint64_t)v47);
        goto LABEL_73;
      }
LABEL_55:
      v29 = v27;
      uint64_t v30 = (v30 + 1);
      v27 = v33;
      if (v30 == ncmds) {
        goto LABEL_61;
      }
    }
    if (v34 == 25)
    {
      if (strncmp(v27 + 8, "__LINKEDIT", 0xAuLL))
      {
        if (v14 && !strncmp(v27 + 8, "__DATA", 6uLL))
        {
          v104 = v12;
          uint64_t v37 = *((unsigned int *)v27 + 16);
          if (v37 > 0x1000)
          {
            v46 = [(MISignatureAgnosticHasher *)v104 url];
            v47 = [v46 path];
            _CreateAndLogError((uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]", 150, @"MIInstallerErrorDomain", 73, 0, 0, @"__DATA segment has too many sections in %@", v83, (uint64_t)v47);
            goto LABEL_73;
          }
          if (80 * (unint64_t)v37 + 72 > v32)
          {
            v46 = [(MISignatureAgnosticHasher *)v104 url];
            v47 = [v46 path];
            _CreateAndLogError((uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]", 155, @"MIInstallerErrorDomain", 73, 0, 0, @"__DATA segment exceeds bounds in %@", v85, (uint64_t)v47);
            v17 = LABEL_73:;

LABEL_74:
            v24 = 0;
            goto LABEL_75;
          }
          if (v37)
          {
            v38 = v27 + 72;
            while (strncmp(v38, v14, 0x10uLL))
            {
              v38 += 80;
              if (!--v37) {
                goto LABEL_58;
              }
            }
LABEL_57:
            char v110 = 1;
          }
LABEL_58:
          v27 = v29;
          objc_super v12 = v104;
          goto LABEL_55;
        }
        goto LABEL_54;
      }
      v114 = v27 + 32;
      v115 = v27 + 48;
      uint64_t v112 = 8;
      uint64_t v39 = 8;
    }
    else
    {
      if (v34 != 1)
      {
LABEL_54:
        v27 = v29;
        goto LABEL_55;
      }
      if (strncmp(v27 + 8, "__LINKEDIT", 0xAuLL))
      {
        if (v14 && !strncmp(v27 + 8, "__DATA", 6uLL))
        {
          v104 = v12;
          uint64_t v35 = *((unsigned int *)v27 + 12);
          if (v35 > 0x1000)
          {
            v46 = [(MISignatureAgnosticHasher *)v104 url];
            v47 = [v46 path];
            _CreateAndLogError((uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]", 121, @"MIInstallerErrorDomain", 73, 0, 0, @"__DATA segment has too many sections in %@", v82, (uint64_t)v47);
            goto LABEL_73;
          }
          if (68 * (unint64_t)v35 + 56 > v32)
          {
            v46 = [(MISignatureAgnosticHasher *)v104 url];
            v47 = [v46 path];
            _CreateAndLogError((uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]", 126, @"MIInstallerErrorDomain", 73, 0, 0, @"__DATA segment exceeds bounds in %@", v84, (uint64_t)v47);
            goto LABEL_73;
          }
          if (v35)
          {
            v36 = v27 + 56;
            while (strncmp(v36, v14, 0x10uLL))
            {
              v36 += 68;
              if (!--v35) {
                goto LABEL_58;
              }
            }
            goto LABEL_57;
          }
          goto LABEL_58;
        }
        goto LABEL_54;
      }
      v114 = v27 + 28;
      v115 = v27 + 36;
      uint64_t v112 = 4;
      uint64_t v39 = 4;
    }
    uint64_t v113 = v39;
    goto LABEL_54;
  }
  uint64_t v112 = 0;
  uint64_t v113 = 0;
  v114 = 0;
  v115 = 0;
  char v110 = 0;
  v29 = 0;
LABEL_61:
  if (!v114 || !v113 || !v115 || !v112)
  {
    v46 = [(MISignatureAgnosticHasher *)v12 url];
    v47 = [v46 path];
    _CreateAndLogError((uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]", 178, @"MIInstallerErrorDomain", 73, 0, 0, @"Failed to find __LINKEDIT segment in %@", v43, (uint64_t)v47);
    goto LABEL_73;
  }
  if (!v29)
  {
    v46 = [(MISignatureAgnosticHasher *)v12 url];
    v47 = [v46 path];
    _CreateAndLogError((uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]", 183, @"MIInstallerErrorDomain", 73, 0, 0, @"Failed to find LC_CODE_SIGNATURE load command in %@", v44, (uint64_t)v47);
    goto LABEL_73;
  }
  if (v114 > v29 || v115 > v29)
  {
    v46 = [(MISignatureAgnosticHasher *)v12 url];
    v47 = [v46 path];
    _CreateAndLogError((uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]", 188, @"MIInstallerErrorDomain", 73, 0, 0, @"__LINKEDIT segment found after LC_CODE_SIGNATURE load command in %@", v45, (uint64_t)v47);
    goto LABEL_73;
  }
  uint64_t v41 = *((unsigned int *)v29 + 2);
  if (v41 < v109)
  {
    v46 = [(MISignatureAgnosticHasher *)v12 url];
    v47 = [v46 path];
    _CreateAndLogError((uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]", 193, @"MIInstallerErrorDomain", 73, 0, 0, @"LC_CODE_SIGNATURE command's data offset is less than the size of the mach header in %@", v42, (uint64_t)v47);
    goto LABEL_73;
  }
  v117[0] = &v114[v107] - v106;
  v117[1] = v113;
  v117[2] = &v115[v107] - v106;
  v117[3] = v112;
  uint64_t v49 = *((unsigned int *)v29 + 3);
  v117[4] = &v29[v107 + 12] - v106;
  v117[5] = 4;
  v117[6] = v41;
  v117[7] = v49;
  CC_SHA1_Init(&c);
  if (lseek([(MISignatureAgnosticHasher *)v12 fd], v108, 0) == -1)
  {
    int v63 = *__error();
    v64 = (void *)*MEMORY[0x1E4F28798];
    strerror(v63);
    v66 = _CreateError((uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]", 218, v64, v63, 0, 0, @"lseek to %lld failed: %s", v65, v108);
    v67 = [(MISignatureAgnosticHasher *)v12 url];
    v101 = [v67 path];
    strerror(v63);
    v17 = _CreateAndLogError((uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]", 218, @"MIInstallerErrorDomain", 73, v66, 0, @"Failed to seek to %lld in %@ : %s", v68, v108);

    goto LABEL_74;
  }
  v50 = malloc_type_malloc(0x4000uLL, 0x4E02A280uLL);
  a7 = v111;
  if (!v50)
  {
    int v69 = *__error();
    v70 = (void *)*MEMORY[0x1E4F28798];
    strerror(v69);
    v20 = _CreateError((uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]", 225, v70, v69, 0, 0, @"Failed to allocate %lld bytes : %s", v71, 0x4000);
    v72 = strerror(v69);
    v17 = _CreateAndLogError((uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]", 225, @"MIInstallerErrorDomain", 73, v20, 0, @"Failed to allocate hash read buffer: %s", v73, (uint64_t)v72);
    goto LABEL_13;
  }
  v24 = v50;
  unint64_t v51 = 0;
  uint64_t v52 = 0;
  do
  {
    uint64_t v53 = v117[v51];
    uint64_t v54 = v53 - v52;
    if (v54 >= 1)
    {
      while (1)
      {
        if (v54 >= 0x4000) {
          int64_t v55 = 0x4000;
        }
        else {
          int64_t v55 = v54;
        }
        ssize_t v56 = read([(MISignatureAgnosticHasher *)v12 fd], v24, v55);
        if (v56 < 0)
        {
          int v74 = *__error();
          v75 = (void *)*MEMORY[0x1E4F28798];
          strerror(v74);
          v77 = _CreateError((uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]", 238, v75, v74, 0, 0, @"Failed to read %zu bytes : %s", v76, v55);
          v78 = [(MISignatureAgnosticHasher *)v12 url];
          v79 = [v78 path];
          strerror(v74);
          v17 = _CreateAndLogError((uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]", 238, @"MIInstallerErrorDomain", 73, v77, 0, @"Failed to read file at %@: %s", v80, (uint64_t)v79);

          goto LABEL_97;
        }
        if (v56 != v55) {
          break;
        }
        CC_SHA1_Update(&c, v24, v55);
        BOOL v57 = v54 <= v55;
        v54 -= v55;
        if (v57) {
          goto LABEL_88;
        }
      }
      v77 = [(MISignatureAgnosticHasher *)v12 url];
      v78 = [v77 path];
      v17 = _CreateAndLogError((uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]", 241, @"MIInstallerErrorDomain", 73, 0, 0, @"Expected to read %zu bytes but got %ld bytes when reading %@", v81, v55);
      goto LABEL_97;
    }
LABEL_88:
    uint64_t v58 = *(void *)((char *)v117 + ((8 * v51) | 8));
    if (lseek([(MISignatureAgnosticHasher *)v12 fd], v58, 1) == -1)
    {
      int v86 = *__error();
      v87 = (void *)*MEMORY[0x1E4F28798];
      strerror(v86);
      v77 = _CreateError((uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]", 253, v87, v86, 0, 0, @"lseek to %lld from current offset failed: %s", v88, v58);
      v78 = [(MISignatureAgnosticHasher *)v12 url];
      v102 = [v78 path];
      strerror(v86);
      v17 = _CreateAndLogError((uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]", 253, @"MIInstallerErrorDomain", 73, v77, 0, @"Failed to seek to %lld from current offset in %@ : %s", v89, v58);

      a7 = v111;
LABEL_97:

      goto LABEL_15;
    }
    uint64_t v52 = v53 + v58;
    BOOL v59 = v51 >= 6;
    v51 += 2;
  }
  while (!v59);
  uint64_t v60 = v105 - v52;
  if (v105 < v52)
  {
    v61 = [(MISignatureAgnosticHasher *)v12 url];
    v103 = [v61 path];
    v17 = _CreateAndLogError((uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]", 261, @"MIInstallerErrorDomain", 73, 0, 0, @"Hashed more (%lld) than slice length %llu in %@", v62, v52);

    goto LABEL_15;
  }
  if (v60 < 1)
  {
LABEL_111:
    CC_SHA1_Final(md, &c);
    if (v110) {
      [(MISignatureAgnosticHasher *)v12 setCountOfSlicesWithNamedSection:[(MISignatureAgnosticHasher *)v12 countOfSlicesWithNamedSection] + 1];
    }
    v25 = [MEMORY[0x1E4F1C9B8] dataWithBytes:md length:20];
    v17 = 0;
  }
  else
  {
    while (1)
    {
      if (v60 >= 0x4000) {
        int64_t v90 = 0x4000;
      }
      else {
        int64_t v90 = v60;
      }
      ssize_t v91 = read([(MISignatureAgnosticHasher *)v12 fd], v24, v90);
      if (v91 < 0)
      {
        int v92 = *__error();
        v93 = (void *)*MEMORY[0x1E4F28798];
        strerror(v92);
        v95 = _CreateError((uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]", 271, v93, v92, 0, 0, @"Failed to read %zu bytes : %s", v94, v90);
        v96 = [(MISignatureAgnosticHasher *)v12 url];
        v97 = [v96 path];
        strerror(v92);
        v17 = _CreateAndLogError((uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]", 271, @"MIInstallerErrorDomain", 73, v95, 0, @"Failed to read file at %@: %s", v98, (uint64_t)v97);

        goto LABEL_116;
      }
      if (v91 != v90) {
        break;
      }
      CC_SHA1_Update(&c, v24, v90);
      BOOL v57 = v60 <= v90;
      v60 -= v90;
      if (v57) {
        goto LABEL_111;
      }
    }
    v95 = [(MISignatureAgnosticHasher *)v12 url];
    v96 = [v95 path];
    v17 = _CreateAndLogError((uint64_t)"-[MISignatureAgnosticHasher _hashSliceAtOffset:withSize:machHeaderAndCommands:dictionaryKey:error:]", 274, @"MIInstallerErrorDomain", 73, 0, 0, @"Expected to read %zu bytes but got %ld bytes when reading %@", v99, v90);
LABEL_116:

LABEL_75:
    v25 = 0;
  }
  a7 = v111;
LABEL_16:
  free(v24);
  if (a7 && !v25) {
    *a7 = v17;
  }

  return v25;
}

- (BOOL)performHashWithError:(id *)a3
{
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x3032000000;
  uint64_t v39 = __Block_byref_object_copy__0;
  uint64_t v40 = __Block_byref_object_dispose__0;
  id v41 = 0;
  v5 = objc_opt_new();
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  int v35 = 0;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __50__MISignatureAgnosticHasher_performHashWithError___block_invoke;
  v28[3] = &unk_1E62E6CD8;
  uint64_t v30 = &v36;
  v28[4] = self;
  id v6 = v5;
  id v29 = v6;
  unint64_t v31 = &v32;
  id v7 = (void *)MEMORY[0x1C1878AA0](v28);
  id v8 = [(MISignatureAgnosticHasher *)self url];
  -[MISignatureAgnosticHasher setFd:](self, "setFd:", open((const char *)[v8 fileSystemRepresentation], 256));

  if ([(MISignatureAgnosticHasher *)self fd] < 0)
  {
    uint64_t v13 = *__error();
    id v14 = [(MISignatureAgnosticHasher *)self url];
    uint64_t v15 = [v14 fileSystemRepresentation];
    strerror(v13);
    v17 = _CreateError((uint64_t)"-[MISignatureAgnosticHasher performHashWithError:]", 371, (void *)*MEMORY[0x1E4F28798], v13, 0, 0, @"Failed to open %s: %s", v16, v15);
    uint64_t v18 = [(MISignatureAgnosticHasher *)self url];
    v19 = [v18 path];
    strerror(v13);
    uint64_t v21 = _CreateAndLogError((uint64_t)"-[MISignatureAgnosticHasher performHashWithError:]", 371, @"MIInstallerErrorDomain", 73, v17, 0, @"Failed to open executable for reading at %@ : %s", v20, (uint64_t)v19);
    uint64_t v22 = (void *)v37[5];
    v37[5] = v21;

LABEL_7:
    BOOL v11 = 0;
    goto LABEL_8;
  }
  int v9 = [(MISignatureAgnosticHasher *)self fd];
  id v10 = [(MISignatureAgnosticHasher *)self url];
  LOBYTE(v9) = parse_macho_iterate_slices_fd(v9, [v10 fileSystemRepresentation], (uint64_t)v7);

  if ((v9 & 1) == 0)
  {
    id v14 = [(MISignatureAgnosticHasher *)self url];
    uint64_t v23 = [v14 path];
    uint64_t v25 = _CreateAndLogError((uint64_t)"-[MISignatureAgnosticHasher performHashWithError:]", 376, @"MIInstallerErrorDomain", 73, 0, 0, @"Could not iterate slices in macho %@", v24, (uint64_t)v23);
    v26 = (void *)v37[5];
    v37[5] = v25;

    goto LABEL_7;
  }
  BOOL v11 = v37[5] == 0;
  objc_storeStrong((id *)&self->_hashes, v5);
  unsigned int v12 = [(MISignatureAgnosticHasher *)self countOfSlicesWithNamedSection];
  if (v12 == *((_DWORD *)v33 + 6)) {
    self->_hasNamedSection = 1;
  }
LABEL_8:
  if (a3 && !v11) {
    *a3 = (id) v37[5];
  }
  if (([(MISignatureAgnosticHasher *)self fd] & 0x80000000) == 0)
  {
    close([(MISignatureAgnosticHasher *)self fd]);
    [(MISignatureAgnosticHasher *)self setFd:0xFFFFFFFFLL];
  }

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  return v11;
}

uint64_t __50__MISignatureAgnosticHasher_performHashWithError___block_invoke(uint64_t a1, unsigned int *a2, _DWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = a3[3];
  if (v9 != 2)
  {
    _CreateAndLogError((uint64_t)"-[MISignatureAgnosticHasher performHashWithError:]_block_invoke", 317, @"MIInstallerErrorDomain", 73, 0, 0, @"Mach header specified unknown filetype %u", a8, v9);
    uint64_t v25 = LABEL_11:;
    uint64_t v26 = *(void *)(*(void *)(a1 + 48) + 8);
    v27 = *(void **)(v26 + 40);
    *(void *)(v26 + 40) = v25;

    goto LABEL_12;
  }
  if (a2)
  {
    if (*a2 == a3[1])
    {
      if (a2[1] == a3[2])
      {
        uint64_t v11 = a2[2];
        off_t st_size = a2[3];
        goto LABEL_16;
      }
      _CreateAndLogError((uint64_t)"-[MISignatureAgnosticHasher performHashWithError:]_block_invoke", 342, @"MIInstallerErrorDomain", 73, 0, 0, @"Mismatched cpusubtype between fat_arch and mach_header: fa: %d, mh: %d", a8, a2[1]);
    }
    else
    {
      _CreateAndLogError((uint64_t)"-[MISignatureAgnosticHasher performHashWithError:]_block_invoke", 337, @"MIInstallerErrorDomain", 73, 0, 0, @"Mismatched cputype between fat_arch and mach_header: fa: %d, mh: %d", a8, *a2);
    }
    goto LABEL_11;
  }
  memset(&v41, 0, sizeof(v41));
  if (fstat([*(id *)(a1 + 32) fd], &v41))
  {
    int v13 = *__error();
    id v14 = (void *)*MEMORY[0x1E4F28798];
    uint64_t v15 = [*(id *)(a1 + 32) url];
    uint64_t v16 = [v15 path];
    strerror(v13);
    uint64_t v18 = _CreateError((uint64_t)"-[MISignatureAgnosticHasher performHashWithError:]_block_invoke", 327, v14, v13, 0, 0, @"fstat of %@ failed: %s", v17, (uint64_t)v16);
    v19 = [*(id *)(a1 + 32) url];
    uint64_t v20 = [v19 path];
    strerror(v13);
    uint64_t v22 = _CreateAndLogError((uint64_t)"-[MISignatureAgnosticHasher performHashWithError:]_block_invoke", 327, @"MIInstallerErrorDomain", 73, v18, 0, @"Could not determine size of %@ : %s", v21, (uint64_t)v20);
    uint64_t v23 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v24 = *(void **)(v23 + 40);
    *(void *)(v23 + 40) = v22;

LABEL_12:
    id v28 = 0;
    goto LABEL_13;
  }
  uint64_t v11 = 0;
  off_t st_size = v41.st_size;
LABEL_16:
  unint64_t v31 = *(void **)(a1 + 32);
  uint64_t v32 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v32 + 40);
  id v40 = 0;
  v33 = [v31 _hashSliceAtOffset:v11 withSize:st_size machHeaderAndCommands:a3 dictionaryKey:&v40 error:&obj];
  id v28 = v40;
  objc_storeStrong((id *)(v32 + 40), obj);
  if (v33)
  {
    uint64_t v34 = [*(id *)(a1 + 40) objectForKeyedSubscript:v28];

    if (!v34)
    {
      [*(id *)(a1 + 40) setObject:v33 forKeyedSubscript:v28];
      ++*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);

      uint64_t v29 = 1;
      goto LABEL_14;
    }
    uint64_t v36 = _CreateAndLogError((uint64_t)"-[MISignatureAgnosticHasher performHashWithError:]_block_invoke", 356, @"MIInstallerErrorDomain", 73, 0, 0, @"Already have an entry in hashes dictionary for key %@", v35, (uint64_t)v28);
    uint64_t v37 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v38 = *(void **)(v37 + 40);
    *(void *)(v37 + 40) = v36;
  }
LABEL_13:
  uint64_t v29 = 0;
LABEL_14:

  return v29;
}

+ (id)packedNumberForCPUType:(int)a3 subtype:(int)a4
{
  return (id)[NSNumber numberWithUnsignedLongLong:a4 | (*(void *)&a3 << 32)];
}

+ (void)unpackPackedCpuTypeAndSubType:(id)a3 cputype:(int *)a4 subtype:(int *)a5
{
  uint64_t v7 = [a3 unsignedLongLongValue];
  *a4 = HIDWORD(v7);
  *a5 = v7;
}

- (BOOL)hasNamedSection
{
  return self->_hasNamedSection;
}

- (NSDictionary)hashes
{
  return self->_hashes;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)sectionName
{
  return self->_sectionName;
}

- (int)fd
{
  return self->_fd;
}

- (void)setFd:(int)a3
{
  self->_fd = a3;
}

- (unsigned)countOfSlicesWithNamedSection
{
  return self->_countOfSlicesWithNamedSection;
}

- (void)setCountOfSlicesWithNamedSection:(unsigned int)a3
{
  self->_countOfSlicesWithNamedSection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionName, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_hashes, 0);
}

@end