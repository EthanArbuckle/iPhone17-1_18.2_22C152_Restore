@interface GEMagicKit
+ (id)magicForData:(id)a3;
+ (id)magicForData:(id)a3 decompress:(BOOL)a4;
+ (id)magicForFileAtPath:(id)a3;
+ (id)magicForFileAtPath:(id)a3 decompress:(BOOL)a4;
+ (id)magicForFileAtURL:(id)a3;
+ (id)magicForFileAtURL:(id)a3 decompress:(BOOL)a4;
+ (id)magicForObject:(id)a3 decompress:(BOOL)a4;
+ (id)rawMagicOutputForObject:(id)a3 cookie:(magic_set *)a4 flags:(int)a5;
+ (id)typeHierarchyForType:(id)a3;
+ (magic_set)sharedMagicCookie;
@end

@implementation GEMagicKit

+ (id)magicForData:(id)a3 decompress:(BOOL)a4
{
  return +[GEMagicKit magicForObject:a3 decompress:a4];
}

+ (id)magicForFileAtURL:(id)a3 decompress:(BOOL)a4
{
  BOOL v4 = a4;
  if (![a3 isFileURL]) {
    return 0;
  }
  uint64_t v6 = [a3 path];
  return +[GEMagicKit magicForFileAtPath:v6 decompress:v4];
}

+ (id)magicForFileAtPath:(id)a3 decompress:(BOOL)a4
{
  return +[GEMagicKit magicForObject:a3 decompress:a4];
}

+ (id)magicForData:(id)a3
{
  return +[GEMagicKit magicForData:a3 decompress:0];
}

+ (id)magicForFileAtURL:(id)a3
{
  return +[GEMagicKit magicForFileAtURL:a3 decompress:0];
}

+ (id)magicForFileAtPath:(id)a3
{
  return +[GEMagicKit magicForFileAtPath:a3 decompress:0];
}

+ (id)typeHierarchyForType:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = (void *)[(__CFDictionary *)UTTypeCopyDeclaration((CFStringRef)a3) objectForKey:*MEMORY[0x263F019F8]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v4 = (void *)[MEMORY[0x263EFF980] arrayWithArray:v3];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v3);
          }
          objc_msgSend(v4, "addObjectsFromArray:", +[GEMagicKit typeHierarchyForType:](GEMagicKit, "typeHierarchyForType:", *(void *)(*((void *)&v11 + 1) + 8 * i)));
        }
        uint64_t v6 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
    return v4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  v9 = (void *)MEMORY[0x263EFF8C0];
  return (id)[v9 arrayWithObject:v3];
}

+ (id)rawMagicOutputForObject:(id)a3 cookie:(magic_set *)a4 flags:(int)a5
{
  if (a4) {
    *((_DWORD *)a4 + 17) = a5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = (unsigned __int8 *)[a3 bytes];
    uint64_t v8 = [a3 length];
    if (!a4) {
      return 0;
    }
    uint64_t v15 = v8;
    if (file_reset((uint64_t)a4, 1, v9, v10, v11, v12, v13, v14) == -1
      || file_buffer((uint64_t)a4, -1, 0, v7, v15, v16, v17, v18) == -1)
    {
      return 0;
    }
    v19 = file_getbuffer((uint64_t)a4);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [MEMORY[0x263EFF940] raise:@"MagicKit", @"Invalid object (expected data or path string): %@", a3 format];
      return 0;
    }
    v20 = (char *)[a3 fileSystemRepresentation];
    v19 = magic_file((const char *)a4, v20, v21, v22, v23, v24, v25, v26);
  }
  v27 = v19;
  if (!v19) {
    return 0;
  }
  v28 = NSString;
  return (id)[v28 stringWithUTF8String:v27];
}

+ (id)magicForObject:(id)a3 decompress:(BOOL)a4
{
  if (a4) {
    uint64_t v6 = 4;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = +[GEMagicKit sharedMagicCookie];
  uint64_t v8 = [a1 rawMagicOutputForObject:a3 cookie:v7 flags:v6];
  uint64_t v9 = (void *)[a1 rawMagicOutputForObject:a3 cookie:v7 flags:v6 | 0x410];
  if (v8) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10) {
    return 0;
  }
  uint64_t v11 = v9;
  CFStringRef v12 = (const __CFString *)objc_msgSend((id)objc_msgSend(v9, "componentsSeparatedByString:", @";"),
                              "objectAtIndex:",
                              0);
  CFStringRef v13 = (id)UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x263F01918], v12, 0);
  if (!v13) {
    return 0;
  }
  uint64_t v14 = -[GEMagicResult initWithMimeType:description:typeHierarchy:]([GEMagicResult alloc], "initWithMimeType:description:typeHierarchy:", v11, v8, objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObject:", v13), "arrayByAddingObjectsFromArray:", +[GEMagicKit typeHierarchyForType:](GEMagicKit, "typeHierarchyForType:", v13)));
  return v14;
}

+ (magic_set)sharedMagicCookie
{
  uint64_t v255 = *MEMORY[0x263EF8340];
  v2 = &classUIPrintFormatter;
  if (sharedMagicCookie_sharedCookie) {
    return (magic_set *)v2[453];
  }
  v3 = malloc_type_calloc(1uLL, 0x120uLL, 0x10700403DB5B4F0uLL);
  BOOL v4 = v3;
  if (v3)
  {
    *((_DWORD *)v3 + 17) = 0;
    v3[5] = 0;
    v3[6] = 0;
    v3[4] = 0;
    v3[2] = 10;
    uint64_t v5 = malloc_type_malloc(0xA0uLL, 0x816EEC7DuLL);
    v4[3] = v5;
    if (v5)
    {
      *((_DWORD *)v4 + 18) = 0;
      *((_DWORD *)v4 + 16) = -1;
      *BOOL v4 = 0;
      v4[1] = 0;
      v4[10] = "unknown";
      v4[11] = 0;
      v4[33] = 0x800800000320032;
      *((_DWORD *)v4 + 68) = 536871168;
      v4[35] = 0x100000;
    }
    else
    {
      free(v4);
      BOOL v4 = 0;
    }
  }
  sharedMagicCookie_sharedCookie = (uint64_t)v4;
  uint64_t v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "pathForResource:ofType:", @"magic", @"mgc"), "fileSystemRepresentation");
  CFStringRef v13 = (void **)sharedMagicCookie_sharedCookie;
  if (!sharedMagicCookie_sharedCookie)
  {
LABEL_243:
    v238 = (void *)MEMORY[0x263EFF940];
    v239 = __error();
    objc_msgSend(v238, "raise:format:", @"MagicKit", @"There was an error opening the magic database: %s", strerror(*v239));
    v2 = &classUIPrintFormatter;
    return (magic_set *)v2[453];
  }
  uint64_t v14 = (char *)v6;
  file_reset(sharedMagicCookie_sharedCookie, 0, v7, v8, v9, v10, v11, v12);
  if (v14) {
    goto LABEL_24;
  }
  uint64_t v14 = getenv("MAGIC");
  if (v14) {
    goto LABEL_24;
  }
  if (get_default_magic_default_magic)
  {
    free((void *)get_default_magic_default_magic);
    get_default_magic_default_magic = 0;
  }
  uint64_t v15 = getenv("HOME");
  if (!v15) {
    goto LABEL_23;
  }
  uint64_t v16 = v15;
  v253[0] = 0;
  memset(&v250, 0, sizeof(v250));
  if (asprintf(v253, "%s/.magic.mgc", v15) < 0) {
    goto LABEL_23;
  }
  uint64_t v17 = v253[0];
  if (stat(v253[0], &v250) != -1) {
    goto LABEL_14;
  }
  free(v17);
  if ((asprintf(v253, "%s/.magic", v16) & 0x80000000) == 0)
  {
    uint64_t v17 = v253[0];
    if (stat(v253[0], &v250) == -1)
    {
LABEL_22:
      get_default_magic_default_magic = 0;
      free(v17);
      goto LABEL_23;
    }
    if ((v250.st_mode & 0xF000) != 0x4000)
    {
LABEL_14:
      if ((asprintf((char **)&get_default_magic_default_magic, "%s:%s", v17, "/etc/magic") & 0x80000000) == 0)
      {
        free(v17);
        uint64_t v14 = (char *)get_default_magic_default_magic;
        if (!get_default_magic_default_magic) {
          goto LABEL_243;
        }
        goto LABEL_24;
      }
      goto LABEL_22;
    }
    free(v17);
    if ((asprintf(v253, "%s/%s", v16, "/.magic/magic.mgc") & 0x80000000) == 0)
    {
      uint64_t v17 = v253[0];
      if (access(v253[0], 4) == -1) {
        goto LABEL_22;
      }
      goto LABEL_14;
    }
  }
LABEL_23:
  uint64_t v14 = "/etc/magic";
LABEL_24:
  if ((init_file_tables_done & 1) == 0)
  {
    init_file_tables_done = 1;
    uint64_t v18 = "invalid";
    do
    {
      uint64_t v19 = *((int *)v18 + 6);
      if ((int)v19 >= 51) {
        __assert_rtn("init_file_tables", "apprentice.c", 407, "p->type < FILE_NAMES_SIZE");
      }
      file_names[v19] = v18;
      file_formats[v19] = *((_DWORD *)v18 + 7);
      v20 = v18 + 32;
      uint64_t v21 = *((void *)v18 + 6);
      v18 += 32;
    }
    while (v21);
    if (v20 - "invalid" != 1632) {
      __assert_rtn("init_file_tables", "apprentice.c", 411, "p - type_tbl == FILE_NAMES_SIZE");
    }
  }
  uint64_t v22 = strdup(v14);
  if (!v22)
  {
    char v220 = strlen(v14);
    int v221 = *__error();
    file_error((int)v13, v221, "cannot allocate %zu bytes", v222, v223, v224, v225, v226, v220);
    goto LABEL_243;
  }
  __s = v22;
  uint64_t v23 = 0;
  char v24 = 1;
  do
  {
    char v25 = v24;
    mlist_free(v13[v23]);
    uint64_t v26 = malloc_type_calloc(1uLL, 0x28uLL, 0x10A00403F8C4432uLL);
    if (!v26)
    {
      v13[v23] = 0;
      v227 = __error();
      file_error((int)v13, *v227, "cannot allocate %zu bytes", v228, v229, v230, v231, v232, 40);
      if ((v25 & 1) == 0)
      {
        mlist_free(*v13);
        *CFStringRef v13 = 0;
      }
      free(__s);
      goto LABEL_243;
    }
    char v24 = 0;
    v26[3] = v26;
    v26[4] = v26;
    v13[v23] = v26;
    uint64_t v23 = 1;
  }
  while ((v25 & 1) != 0);
  int v27 = -1;
  v28 = __s;
  do
  {
    int v244 = v27;
    v29 = v28;
    v30 = strchr(v28, 58);
    if (v30) {
      *v30++ = 0;
    }
    if (!*v29)
    {
      int v27 = v244;
      break;
    }
    v243 = v30;
    memset(&v250, 0, sizeof(v250));
    v31 = malloc_type_calloc(1uLL, 0x30uLL, 0x10A0040EA71619DuLL);
    v32 = v31;
    if (!v31)
    {
      v38 = __error();
      file_error((int)v13, *v38, "cannot allocate %zu bytes", v39, v40, v41, v42, v43, 48);
LABEL_64:
      v37 = 0;
      goto LABEL_65;
    }
    v31[4] = 0;
    v253[0] = 0;
    v33 = v29 - 1;
    while (*++v33)
      ;
    if (v33 >= v29)
    {
      v44 = "c";
      while (1)
      {
        v45 = v44;
        if (v44[1] != *v33) {
          break;
        }
        --v33;
        if (v44 >= ".mgc")
        {
          --v44;
          if (v33 >= v29) {
            continue;
          }
        }
        if (v45 >= ".mgc") {
          break;
        }
        goto LABEL_43;
      }
    }
    --v33;
    while (*++v33)
      ;
LABEL_43:
    int v36 = v33 - v29 + 1;
    if ((*((_WORD *)v13 + 34) & 0x410) != 0)
    {
      if (asprintf(v253, "%.*s.mime%s", v36, v29, ".mgc") < 0) {
        goto LABEL_64;
      }
      v37 = v253[0];
      if (access(v253[0], 4) != -1)
      {
        *((_DWORD *)v13 + 17) &= 0x10u;
        if (!v37) {
          goto LABEL_65;
        }
        goto LABEL_60;
      }
      free(v37);
    }
    if (asprintf(v253, "%.*s%s", v36, v29, ".mgc") < 0) {
      goto LABEL_64;
    }
    if (strstr(v29, ".mime")) {
      *((_DWORD *)v13 + 17) &= 0x10u;
    }
    v37 = v253[0];
    if (!v253[0]) {
      goto LABEL_65;
    }
LABEL_60:
    int v46 = open(v37, 0);
    if (v46 != -1)
    {
      int v47 = v46;
      if (fstat(v46, &v250) == -1)
      {
        int v142 = *__error();
      }
      else
      {
        size_t st_size = v250.st_size;
        if (v250.st_size >= 8)
        {
          *((void *)v32 + 1) = v250.st_size;
          v32[4] = 1;
          v151 = malloc_type_malloc(st_size, 0xC8C2B308uLL);
          *(void *)v32 = v151;
          uint64_t v152 = *((void *)v32 + 1);
          if (v151)
          {
            if (read(v47, v151, *((void *)v32 + 1)) == *((void *)v32 + 1))
            {
              close(v47);
              v158 = *(unsigned int **)v32;
              int v159 = **(_DWORD **)v32;
              if (v159 == -249691108)
              {
                unsigned int v160 = v158[1];
              }
              else
              {
                if (v159 != 470032113)
                {
                  goto LABEL_65;
                }
                unsigned int v160 = bswap32(v158[1]);
              }
              if (v160 == 16)
              {
                unint64_t v187 = *((void *)v32 + 1);
                if (376 * (v187 / 0x178) == v187)
                {
                  unint64_t v188 = v187 / 0x178;
                  v189 = v158 + 94;
                  *((void *)v32 + 3) = v158 + 94;
                  unsigned int v190 = v158[2];
                  unsigned int v191 = bswap32(v190);
                  if (v159 != -249691108) {
                    unsigned int v190 = v191;
                  }
                  v32[10] = v190;
                  unsigned int v192 = v158[3];
                  unsigned int v193 = bswap32(v192);
                  if (v159 != -249691108) {
                    unsigned int v192 = v193;
                  }
                  v32[11] = v192;
                  *((void *)v32 + 4) = &v189[94 * v190];
                  if (v192 + v190 + 1 == v188)
                  {
                    if (v159 != -249691108)
                    {
                      uint64_t v194 = 0;
                      char v195 = 1;
                      do
                      {
                        char v196 = v195;
                        uint64_t v197 = v32[v194 + 10];
                        if (v197)
                        {
                          v198 = (int8x16_t *)(*(void *)&v32[2 * v194 + 6] + 24);
                          do
                          {
                            v198[-2].i16[4] = bswap32(v198[-2].u16[4]) >> 16;
                            *(int8x8_t *)((char *)v198[-1].i64 + 4) = vrev32_s8(*(int8x8_t *)((char *)v198[-1].i64 + 4));
                            v198[-1].i32[3] = bswap32(v198[-1].u32[3]);
                            unsigned int v199 = v198[-2].u8[14];
                            BOOL v150 = v199 > 0x2E;
                            uint64_t v200 = (1 << v199) & 0x6200001E2020;
                            if (v150 || v200 == 0) {
                              int8x16_t *v198 = vrev64q_s8(*v198);
                            }
                            else {
                              *(int8x8_t *)v198->i8 = vrev32_s8(*(int8x8_t *)v198->i8);
                            }
                            v198 = (int8x16_t *)((char *)v198 + 376);
                            --v197;
                          }
                          while (v197);
                        }
                        char v195 = 0;
                        uint64_t v194 = 1;
                      }
                      while ((v196 & 1) != 0);
                    }
                    free(v37);
LABEL_220:
                    uint64_t v202 = 0;
                    char v203 = 1;
                    while (1)
                    {
                      v204 = v13[v202];
                      v204[2] = 0;
                      v205 = malloc_type_malloc(0x28uLL, 0x10A00403F8C4432uLL);
                      if (!v205) {
                        break;
                      }
                      int v91 = v203 & 1;
                      if (v203) {
                        v206 = v32;
                      }
                      else {
                        v206 = 0;
                      }
                      v205[2] = v206;
                      void *v205 = *(void *)&v32[2 * v202 + 6];
                      *((_DWORD *)v205 + 2) = v32[v202 + 10];
                      uint64_t v207 = v204[4];
                      *(void *)(v207 + 24) = v205;
                      v205[3] = v204;
                      v205[4] = v207;
                      v204[4] = v205;
                      uint64_t v202 = 1;
                      char v203 = 0;
                      if (!v91) {
                        goto LABEL_96;
                      }
                    }
                    if (v203)
                    {
                      apprentice_unmap(v32);
                    }
                    else
                    {
                      mlist_free(*v13);
                      *CFStringRef v13 = 0;
                      mlist_free(v13[1]);
                      v13[1] = 0;
                    }
                    int v27 = v244;
                    v208 = __error();
                    file_error((int)v13, *v208, "cannot allocate %zu bytes", v209, v210, v211, v212, v213, 40);
                    int v91 = -1;
                    goto LABEL_97;
                  }
                }
                else
                {
                }
              }
              else
              {
              }
              goto LABEL_65;
            }
            int v181 = *__error();
            file_error((int)v13, v181, "error reading", v182, v183, v184, v185, v186, v241);
          }
          else
          {
            int v175 = *__error();
            file_error((int)v13, v175, "cannot allocate %zu bytes", v176, v177, v178, v179, v180, v152);
          }
        }
        else
        {
        }
      }
      close(v47);
    }
LABEL_65:
    apprentice_unmap(v32);
    free(v37);
    int v60 = *((_DWORD *)v13 + 17);
    if ((v60 & 0x40) != 0)
    {
      int v60 = *((_DWORD *)v13 + 17);
    }
    int v252 = 0;
    *(_OWORD *)v253 = 0u;
    long long v254 = 0u;
    *((_DWORD *)v13 + 17) = v60 | 0x40;
    v61 = malloc_type_calloc(1uLL, 0x30uLL, 0x10A0040EA71619DuLL);
    if (!v61)
    {
      v85 = __error();
      file_error((int)v13, *v85, "cannot allocate %zu bytes", v86, v87, v88, v89, v90, 48);
      goto LABEL_95;
    }
    v32 = v61;
    memset(&v250, 0, sizeof(v250));
    v61[4] = 1;
    v251 = 0;
    if (stat(v29, &v250) || (v250.st_mode & 0xF000) != 0x4000)
    {
      load_1((uint64_t)v13, v29, &v252, (uint64_t)v253);
    }
    else
    {
      v62 = opendir(v29);
      if (!v62)
      {
        v64 = 0;
        int v252 = 1;
        goto LABEL_85;
      }
      v63 = v62;
      v64 = 0;
      size_t v65 = 0;
      unint64_t v66 = 0;
      while (1)
      {
        v67 = readdir(v63);
        if (!v67) {
          break;
        }
        d_name = v67->d_name;
        if (v67->d_name[0] != 46)
        {
          if (asprintf(&v251, "%s/%s", v29, v67->d_name) < 0)
          {
            char v167 = strlen(v29);
            char v168 = v167 + strlen(d_name) + 2;
            v169 = __error();
            file_error((int)v13, *v169, "cannot allocate %zu bytes", v170, v171, v172, v173, v174, v168);
            ++v252;
            closedir(v63);
            goto LABEL_85;
          }
          v69 = v251;
          if (stat(v251, &v250) != -1 && (v250.st_mode & 0xF000) == 0x8000)
          {
            if (v65 >= v66)
            {
              unint64_t v66 = 2 * v66 + 2;
              v70 = malloc_type_realloc(v64, 8 * v66, 0x40669993uLL);
              if (!v70)
              {
                v214 = __error();
                file_error((int)v13, *v214, "cannot allocate %zu bytes", v215, v216, v217, v218, v219, 8 * v66);
                free(v251);
                closedir(v63);
                goto LABEL_192;
              }
              v69 = v251;
              v64 = v70;
            }
            *((void *)v64 + v65++) = v69;
          }
          else
          {
            free(v69);
          }
        }
      }
      closedir(v63);
      if (v64)
      {
        qsort(v64, v65, 8uLL, (int (__cdecl *)(const void *, const void *))cmpstrp);
        if (v65)
        {
          uint64_t v148 = 0;
          unsigned int v149 = 1;
          do
          {
            load_1((uint64_t)v13, *((char **)v64 + v148), &v252, (uint64_t)v253);
            free(*((void **)v64 + v148));
            uint64_t v148 = v149;
            BOOL v150 = v65 > v149++;
          }
          while (v150);
        }
        free(v64);
      }
    }
    if (v252) {
      goto LABEL_84;
    }
    uint64_t v92 = 0;
    char v93 = 1;
    v245 = v32;
    do
    {
      char v248 = v93;
      unint64_t v94 = (unint64_t)&v253[2 * v92];
      unsigned int v95 = *(_DWORD *)(v94 + 8);
      v96 = *(unsigned int **)v94;
      if (!v95) {
        goto LABEL_154;
      }
      v246 = (void **)&v253[2 * v92];
      uint64_t v247 = v92;
      unsigned int v97 = 0;
      v249 = (unsigned int *)(v94 | 8);
      do
      {
        uint64_t v98 = v97;
        v99 = (unsigned __int8 **)&v96[4 * v97];
        v100 = *v99;
        if (*(_WORD *)*v99)
        {
          ++v97;
          continue;
        }
        unint64_t v101 = v95;
        if (v95 <= v97 + 1) {
          ++v97;
        }
        else {
          unsigned int v97 = v95;
        }
        v102 = &v96[4 * v98];
        do
        {
          unsigned int v103 = v100[6];
          if (v103 <= 0x32)
          {
            v104 = *v99;
            if (((1 << v103) & 0x71C7FFFE1DFD6) != 0)
            {
              unsigned __int8 v105 = v104[2];
              goto LABEL_113;
            }
            if (((1 << v103) & 0xC2020) != 0)
            {
              unsigned __int8 v105 = v104[2];
              if ((v104[28] & 0x20) != 0)
              {
                unsigned __int8 v106 = v105 | 0x40;
                goto LABEL_114;
              }
LABEL_113:
              unsigned __int8 v106 = v105 | 0x20;
LABEL_114:
              v104[2] = v106;
              goto LABEL_115;
            }
            if (((1 << v103) & 0x120000) != 0)
            {
              unsigned int v117 = *((_DWORD *)v104 + 7);
              int v118 = v104[2];
              int v119 = (v117 >> 1) & 0x20 | (((v117 >> 5) & 1) << 6) | v118;
              if ((v117 & 0x60) != 0)
              {
                v104[2] = (*((_DWORD *)v104 + 7) >> 1) & 0x20 | (((*((_DWORD *)v104 + 7) & 0x20) != 0) << 6) | v118;
                v118 |= (v117 >> 1) & 0x20 | (((v117 >> 5) & 1) << 6);
              }
              if ((v119 & 0x60) == 0)
              {
                if ((int)file_looks_utf8((uint64_t)(v100 + 32), v100[5], 0, 0) <= 0) {
                  unsigned __int8 v120 = v118 | 0x20;
                }
                else {
                  unsigned __int8 v120 = v118 | 0x40;
                }
                v104[2] = v120;
              }
            }
          }
LABEL_115:
          if (*((unsigned char *)v13 + 68))
          {
            int v108 = v100[224];
            v107 = (const char *)(v100 + 224);
            v109 = v107 - 64;
            v110 = "; ";
            if (!v108) {
              v110 = "";
            }
            if (!*(v107 - 64)) {
              v109 = "(no description)";
            }
            v111 = "binary";
            if ((*(v107 - 222) & 0x20) == 0) {
              v111 = "text";
            }
            fprintf((FILE *)*MEMORY[0x263EF8348], "%s%s%s: %s\n", v107, v110, v109, v111);
            uint64_t v112 = *(void *)v102;
            if ((*(unsigned char *)(*(void *)v102 + 2) & 0x20) != 0)
            {
              v113 = strstr((char *)(v112 + 160), "text");
              if (v113)
              {
                v114 = v113;
                if (v113 != (char *)(v112 + 160))
                {
                  int v115 = *(v113 - 1);
                  uint64_t v116 = *(v113 - 1);
                  if (v115 < 0)
                  {
                    if (!__maskrune(v116, 0x4000uLL)) {
                      goto LABEL_144;
                    }
                  }
                  else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v116 + 60) & 0x4000) == 0)
                  {
                    goto LABEL_144;
                  }
                  uint64_t v112 = *(void *)v102;
                }
                v121 = v114 + 5;
                if (&v114[-v112 + 5] == (char *)288) {
                  goto LABEL_143;
                }
                uint64_t v122 = *v121;
                if (!*v121) {
                  goto LABEL_143;
                }
                if ((v122 & 0x80) == 0)
                {
                  if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v122 + 60) & 0x4000) == 0) {
                    goto LABEL_144;
                  }
LABEL_143:
                  fwrite("*** Possible binary test for text type\n", 0x27uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
                  goto LABEL_144;
                }
                if (__maskrune(v122, 0x4000uLL)) {
                  goto LABEL_143;
                }
              }
            }
          }
LABEL_144:
          if (++v98 >= v101) {
            goto LABEL_151;
          }
          v123 = (unsigned __int8 *)*((void *)v102 + 2);
          v102 += 4;
          v100 = v123;
        }
        while (*(_WORD *)v123);
        unsigned int v97 = v98;
LABEL_151:
        unsigned int v95 = *v249;
      }
      while (v97 < v95);
      v32 = v245;
      v96 = (unsigned int *)*v246;
      uint64_t v92 = v247;
LABEL_154:
      unint64_t v124 = v95;
      if (v96) {
        qsort(v96, v95, 0x10uLL, (int (__cdecl *)(const void *, const void *))apprentice_sort);
      }
      if (!v124)
      {
        v139 = malloc_type_malloc(0, 0xCFC100B3uLL);
        *(void *)&v32[2 * v92 + 6] = v139;
        if (v139)
        {
          unsigned int v137 = 0;
          goto LABEL_169;
        }
        char v134 = 0;
LABEL_191:
        v161 = __error();
        file_error((int)v13, *v161, "cannot allocate %zu bytes", v162, v163, v164, v165, v166, v134);
        v64 = 0;
LABEL_192:
        ++v252;
        goto LABEL_85;
      }
      uint64_t v125 = 0;
      v126 = v96;
      while (1)
      {
        uint64_t v127 = v125 + 1;
        if (!**(_WORD **)v126 && *(unsigned char *)(*(void *)v126 + 6) == 3) {
          break;
        }
        v126 += 4;
        ++v125;
        if (v124 == v127) {
          goto LABEL_161;
        }
      }
      if (v124 > v127) {
        LODWORD(v127) = v124;
      }
      uint64_t v140 = 4;
      while (++v125 < v124)
      {
        int v141 = **(unsigned __int16 **)&v126[v140];
        v140 += 4;
        if (!v141)
        {
          LODWORD(v127) = v125;
          break;
        }
      }
      if (v127 != v124)
      {
        v13[11] = (void *)*(unsigned int *)(*(void *)&v96[4 * v127] + 20);
        file_magwarn((uint64_t)v13, "level 0 \"default\" did not sort last", v71, v72, v73, v74, v75, v76, v241);
      }
LABEL_161:
      unsigned int v128 = 0;
      v129 = v96 + 2;
      v130 = (int *)(v96 + 2);
      unint64_t v131 = v124;
      do
      {
        int v132 = *v130;
        v130 += 4;
        v128 += v132;
        --v131;
      }
      while (v131);
      v133 = &v32[2 * v92];
      char v134 = 120 * v128;
      v135 = malloc_type_malloc(376 * v128, 0xCFC100B3uLL);
      *((void *)v133 + 3) = v135;
      v136 = v133 + 6;
      if (!v135) {
        goto LABEL_191;
      }
      unsigned int v137 = 0;
      do
      {
        memcpy((void *)(*v136 + 376 * v137), *((const void **)v129 - 1), 376 * *v129);
        int v138 = *v129;
        v129 += 4;
        v137 += v138;
        --v124;
      }
      while (v124);
LABEL_169:
      char v93 = 0;
      v32[v92 + 10] = v137;
      uint64_t v92 = 1;
    }
    while ((v248 & 1) != 0);
LABEL_84:
    v64 = 0;
LABEL_85:
    free(v64);
    uint64_t v77 = 0;
    char v78 = 1;
    do
    {
      char v79 = v78;
      v80 = &v253[2 * v77];
      v81 = *v80;
      if (*v80)
      {
        uint64_t v82 = *((unsigned int *)v80 + 2);
        if (v82)
        {
          v83 = (void **)*v80;
          do
          {
            v84 = *v83;
            v83 += 2;
            free(v84);
            --v82;
          }
          while (v82);
        }
        free(v81);
      }
      char v78 = 0;
      uint64_t v77 = 1;
    }
    while ((v79 & 1) != 0);
    if (!v252) {
      goto LABEL_220;
    }
    apprentice_unmap(v32);
LABEL_95:
    int v91 = -1;
LABEL_96:
    int v27 = v244;
LABEL_97:
    v28 = v243;
    if (v27 <= v91) {
      int v27 = v91;
    }
  }
  while (v243);
  free(__s);
  v2 = &classUIPrintFormatter;
  if (v27 == -1)
  {
    mlist_free(*v13);
    *CFStringRef v13 = 0;
    mlist_free(v13[1]);
    v13[1] = 0;
    file_error((int)v13, 0, "could not find any valid magic files!", v233, v234, v235, v236, v237, v241);
    goto LABEL_243;
  }
  return (magic_set *)v2[453];
}

@end