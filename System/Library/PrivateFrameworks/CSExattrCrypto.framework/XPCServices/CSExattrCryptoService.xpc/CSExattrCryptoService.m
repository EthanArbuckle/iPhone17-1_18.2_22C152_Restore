BOOL isFsType(int a1, const char *a2)
{
  statfs v5;

  bzero(&v5, 0x878uLL);
  return !fstatfs(a1, &v5) && !strcmp(v5.f_fstypename, a2);
}

BOOL isExFat(int a1)
{
  return isFsType(a1, "exfat");
}

BOOL isMsDos(int a1)
{
  return isFsType(a1, "msdos");
}

BOOL isFat32(int a1)
{
  return isFsType(a1, "fat32");
}

unsigned char *fixPath(unsigned char *a1, unsigned char *a2)
{
  char v2 = 0;
  v3 = a2;
  while (1)
  {
    int v4 = *a1;
    if (v4 == 47)
    {
      char v2 = 1;
      goto LABEL_10;
    }
    if (!*a1) {
      break;
    }
    if (v3 - a2 > 1022) {
      return 0;
    }
    if (v2)
    {
      *v3++ = 47;
      if (v3 - a2 > 1022) {
        return 0;
      }
      LOBYTE(v4) = *a1;
    }
    char v2 = 0;
    *v3++ = v4;
LABEL_10:
    ++a1;
  }
  if (v3 == a2 && (v2 & 1) != 0)
  {
    *a2 = 47;
    v3 = a2 + 1;
  }
  unsigned char *v3 = 0;
  return a2;
}

char *separate_path_parent_child(char *__source, char *__s)
{
  if (__s == __source) {
    size_t v3 = strlen(__s);
  }
  else {
    size_t v3 = strlcpy(__s, __source, 0x400uLL);
  }
  size_t v4 = v3;
  size_t v5 = v3 - 1;
  if (v3 - 1 > 0x3FE) {
    return 0;
  }
  v6 = &__s[v5];
  if (__s[v5] != 47 || __s[v3])
  {
    v6 = strrchr(__s, 47);
    if (!v6)
    {
      if (v4 <= 0x3FE)
      {
        v7 = __s + 1;
        memmove(__s + 1, __s, v4 + 1);
        *__s = 0;
        return v7;
      }
      return 0;
    }
  }
  if (v6 == __s)
  {
    if (v4 <= 0x3FE)
    {
      v7 = __s + 2;
      memmove(__s + 2, __s + 1, v4);
      *(_WORD *)__s = 47;
      return v7;
    }
    return 0;
  }
  char *v6 = 0;
  return v6 + 1;
}

char *partial_path(unsigned char *a1, const char *a2, char *__dst)
{
  size_t v3 = __dst;
  size_t v4 = a2;
  int v6 = *a1;
  if (*a1)
  {
    v7 = a1 + 1;
    while (v6 == *(unsigned __int8 *)a2)
    {
      ++a2;
      int v8 = *v7++;
      int v6 = v8;
      if (!v8) {
        goto LABEL_5;
      }
    }
    size_t v3 = 0;
    size_t v9 = -(uint64_t)v4;
  }
  else
  {
LABEL_5:
    size_t v9 = a2 - v4;
    if (a2 && v9 <= 0x3FF && (!a1[v9] && !*a2 || a1[v9 - 1] == 47 || (int v10 = *(unsigned __int8 *)a2, ++a2, v10 == 47))) {
      size_t v9 = strlcpy(__dst, a2, 0x400uLL);
    }
    else {
      size_t v3 = 0;
    }
  }
  if (v9 <= 0x3FF) {
    return v3;
  }
  else {
    return 0;
  }
}

const char *combine_paths(const char *__source, const char *a2, char *__dst)
{
  if (__source)
  {
    size_t v5 = __source;
    if (__source == __dst) {
      size_t v6 = 0;
    }
    else {
      size_t v6 = strlcpy(__dst, __source, 0x400uLL);
    }
    int v7 = *(unsigned __int8 *)a2;
    if (*a2)
    {
      if (strcmp(v5, "/"))
      {
        strlcat(__dst, "/", 0x400uLL);
        int v7 = *(unsigned __int8 *)a2;
      }
      if (v7 == 47) {
        int v8 = a2 + 1;
      }
      else {
        int v8 = a2;
      }
      size_t v6 = strlcat(__dst, v8, 0x400uLL);
    }
    if (v6 <= 0x3FF) {
      return __dst;
    }
    else {
      return 0;
    }
  }
  return __source;
}

uint64_t open_directory_nosymlink(char *a1, uint64_t a2, uint64_t a3, int a4, int a5, int a6, int a7, int a8, unsigned __int16 a9)
{
  return x_openat(-2, a1, 537952260, a4, a5, a6, a7, a8, a9);
}

uint64_t x_openat(int a1, char *a2, int a3, int a4, int a5, int a6, int a7, int a8, unsigned __int16 a9)
{
  if ((a3 & 0x200) != 0) {
    uint64_t v12 = a9;
  }
  else {
    uint64_t v12 = 0;
  }
  uint64_t result = openat(a1, a2, a3, v12);
  if (result == -1)
  {
    v14 = __error();
    uint64_t result = 0xFFFFFFFFLL;
    if ((a3 & 0x20000000) != 0 && *v14 == 22) {
      return openat(a1, a2, a3 & 0xDFFFFFFF, v12);
    }
  }
  return result;
}

unsigned char *faccurate_realpath(int a1, unsigned char *a2)
{
  char v2 = a2;
  if (fcntl(a1, 50, a2) < 0 || !*v2) {
    return 0;
  }
  return v2;
}

unsigned char *accurate_realpath(char *a1, unsigned char *a2)
{
  if (!a1) {
    return 0;
  }
  int v4 = open(a1, 32772);
  if ((v4 & 0x80000000) == 0) {
    goto LABEL_21;
  }
  if (*__error() != 13) {
    return 0;
  }
  if (geteuid()) {
    return 0;
  }
  memset(&v7, 0, sizeof(v7));
  if (md_stat_real(a1, &v7)) {
    return 0;
  }
  if (!v7.st_uid) {
    return 0;
  }
  *(void *)size_t v6 = 0;
  if (pthread_getugid_np(&v6[1], v6) || pthread_setugid_np(v7.st_uid, v7.st_gid)) {
    return 0;
  }
  int v4 = open(a1, 32772);
  if (pthread_setugid_np(v6[1], v6[0])) {
    sub_10000F4DC();
  }
  if (v4 < 0) {
    return 0;
  }
LABEL_21:
  if (fcntl(v4, 50, a2) < 0 || !*a2) {
    a2 = 0;
  }
  close(v4);
  return a2;
}

uint64_t md_stat_real(char *a1, stat *a2)
{
  uint64_t v4 = fstatat(-2, a1, a2, 512);
  if (!v4 || *__error() != 22) {
    return v4;
  }
  return fstatat(-2, a1, a2, 0);
}

unsigned char *accurate_realpath_nocred(const char *a1, unsigned char *a2)
{
  if (!a1) {
    return 0;
  }
  int v3 = open(a1, 32772);
  if (v3 < 0) {
    return 0;
  }
  int v4 = v3;
  if (fcntl(v3, 50, a2) < 0 || !*a2) {
    a2 = 0;
  }
  close(v4);
  return a2;
}

unsigned char *faccurate_firmpath(int a1, unsigned char *a2)
{
  char v2 = a2;
  if (fcntl(a1, 50, a2) < 0 || !*v2) {
    return 0;
  }
  return v2;
}

unsigned char *accurate_firmpath(const char *a1, unsigned char *a2)
{
  if (!a1) {
    return 0;
  }
  int v3 = open(a1, 32772);
  if (v3 < 0) {
    return 0;
  }
  int v4 = v3;
  if (fcntl(v3, 50, a2) < 0 || !*a2) {
    a2 = 0;
  }
  close(v4);
  return a2;
}

uint64_t device_for_path()
{
  memset(&v2, 0, sizeof(v2));
  bzero(__s, 0x400uLL);
  if ((unint64_t)__strlcpy_chk() > 0x3FF) {
    return 0xFFFFFFFFLL;
  }
  while (md_stat_real(__s, &v2))
  {
    v0 = strrchr(__s, 47);
    if (!v0) {
      return 0xFFFFFFFFLL;
    }
    char *v0 = 0;
  }
  return v2.st_dev;
}

char *device_subpath(char *a1)
{
  if (*a1 != 47) {
    return 0;
  }
  v1 = a1;
  memset(&v8, 0, sizeof(v8));
  if (md_stat_real(a1, &v8)) {
    return 0;
  }
  dev_t st_dev = v8.st_dev;
  size_t v5 = v9;
  bzero(v9, 0x400uLL);
  while (1)
  {
    size_t v6 = strchr(v1, 47);
    if (!v6) {
      break;
    }
    stat v2 = v6 + 1;
    size_t v7 = v6 + 1 - v1;
    memcpy(v5, v1, v7);
    v5 += v7;
    *size_t v5 = 0;
    if (md_stat_real(v9, &v8)) {
      return 0;
    }
    v1 = v2;
    if (v8.st_dev == st_dev) {
      return v2;
    }
  }
  return &v1[strlen(v1)];
}

uint64_t create_scratch_directory(char *a1, uid_t a2, gid_t a3, int a4)
{
  memset(&v12, 0, sizeof(v12));
  if (md_stat_real(a1, &v12))
  {
LABEL_2:
    if (!mkdir(a1, a4))
    {
      stat v8 = a1;
      mode_t v9 = a4;
      goto LABEL_11;
    }
    return 0xFFFFFFFFLL;
  }
  int v10 = v12.st_mode & 0xF000;
  if (v10 != 0x4000)
  {
    if (v10 == 0x8000)
    {
      if (unlink(a1)) {
        return 0xFFFFFFFFLL;
      }
      goto LABEL_2;
    }
    return 0;
  }
  if ((v12.st_mode & 0x1FF) == a4) {
    return 0;
  }
  mode_t v9 = a4;
  stat v8 = a1;
LABEL_11:
  if (chmod(v8, v9)) {
    return 0xFFFFFFFFLL;
  }
  if (chown(a1, a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t nosymlink_open(char *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, unsigned __int16 a9)
{
  if ((a2 & 0x200) != 0) {
    unsigned __int16 v9 = a9;
  }
  else {
    unsigned __int16 v9 = 0;
  }
  return x_openat(-1, a1, a2 | 0x20000000u, a4, a5, a6, a7, a8, v9);
}

uint64_t nosymlink_mkdir(unsigned char *a1, mode_t a2)
{
  bzero(__s, 0x400uLL);
  fixed = fixPath(a1, __s);
  if (!fixed || (size_t v5 = separate_path_parent_child(fixed, __s)) == 0)
  {
    uint64_t v14 = 0xFFFFFFFFLL;
    int v15 = 22;
LABEL_10:
    *__error() = v15;
    return v14;
  }
  v11 = v5;
  int v12 = x_openat(-2, __s, 537952260, v6, v7, v8, v9, v10, v17);
  if ((v12 & 0x80000000) == 0)
  {
    int v13 = v12;
    uint64_t v14 = mkdirat(v12, v11, a2);
    if (v14) {
      int v15 = *__error();
    }
    else {
      int v15 = 0;
    }
    close(v13);
    goto LABEL_10;
  }
  return 0xFFFFFFFFLL;
}

uint64_t nosymlink_unlink(const char *a1)
{
  return x_unlinkat(-2, a1, 2048);
}

uint64_t x_unlinkat(int a1, const char *a2, int a3)
{
  uint64_t v6 = unlinkat(a1, a2, a3);
  if (!v6) {
    return v6;
  }
  int v7 = __error();
  if ((a3 & 0x800) == 0 || *v7 != 22) {
    return v6;
  }
  return unlinkat(a1, a2, a3 & 0xFFFFF7FF);
}

uint64_t nosymlink_rmdir(const char *a1)
{
  return x_unlinkat(-2, a1, 2176);
}

uint64_t nosymlink_rename(const char *a1, const char *a2)
{
  return x_renamex_np(a1, a2, 0x10u);
}

uint64_t x_renamex_np(const char *a1, const char *a2, unsigned int a3)
{
  uint64_t v6 = renamex_np(a1, a2, a3);
  if (!v6) {
    return v6;
  }
  int v7 = __error();
  if ((a3 & 0x10) == 0 || *v7 != 22) {
    return v6;
  }
  return renamex_np(a1, a2, a3 & 0xFFFFFFEF);
}

uint64_t md_savedir(int a1, int *a2)
{
  *a2 = -1;
  memset(&v4, 0, sizeof(v4));
  if (md_fstat_real(a1, &v4)) {
    return 0;
  }
  *a2 = open(".", 32772);
  if (!pthread_fchdir_np()) {
    return 1;
  }
  if ((*a2 & 0x80000000) == 0) {
    close(*a2);
  }
  uint64_t result = 0;
  *a2 = -1;
  return result;
}

uint64_t md_fstat_real(int a1, stat *a2)
{
  uint64_t v4 = fstatat(a1, 0, a2, 1536);
  if (!v4 || *__error() != 22) {
    return v4;
  }
  return fstat(a1, a2);
}

uint64_t md_resetdir(int a1)
{
  uint64_t result = pthread_fchdir_np();
  if ((a1 & 0x80000000) == 0)
  {
    return close(a1);
  }
  return result;
}

size_t md_fsgetpath_fast(char *a1, int a2, uint64_t a3)
{
  sprintf(a1, "/.vol/%llu/%llu", a2, a3);
  return strlen(a1);
}

uint64_t md_lstat_real(char *a1, stat *a2)
{
  uint64_t v4 = fstatat(-2, a1, a2, 544);
  if (!v4 || *__error() != 22) {
    return v4;
  }
  return fstatat(-2, a1, a2, 32);
}

uint64_t md_getattrlist_real(const char *a1, void *a2, void *a3, size_t a4, int a5)
{
  return getattrlist(a1, a2, a3, a4, a5 | 0x200);
}

uint64_t md_fgetattrlist_real(int a1, void *a2, void *a3, size_t a4, int a5)
{
  return fgetattrlist(a1, a2, a3, a4, a5 | 0x200);
}

uint64_t md_getattrlistat_real(int a1, const char *a2, void *a3, void *a4, size_t a5, int a6)
{
  return getattrlistat(a1, a2, a3, a4, a5, a6 | 0x200u);
}

uint64_t md_getattrlistbulk_real(int a1, void *a2, void *a3, size_t a4, int a5)
{
  return getattrlistbulk(a1, a2, a3, a4, a5 | 0x200u);
}

uint64_t x_fstatat(int a1, const char *a2, stat *a3, int a4)
{
  uint64_t v8 = fstatat(a1, a2, a3, a4);
  if (!v8) {
    return v8;
  }
  int v9 = __error();
  if ((a4 & 0x800) == 0 || *v9 != 22) {
    return v8;
  }
  return fstatat(a1, a2, a3, a4 & 0xFFFFF7FF);
}

uint64_t x_faccessat(int a1, const char *a2, int a3, int a4)
{
  uint64_t v8 = faccessat(a1, a2, a3, a4);
  if (!v8) {
    return v8;
  }
  int v9 = __error();
  if ((a4 & 0x800) == 0 || *v9 != 22) {
    return v8;
  }
  return faccessat(a1, a2, a3, a4 & 0xFFFFF7FF);
}

uint64_t x_fchownat(int a1, const char *a2, uid_t a3, gid_t a4, int a5)
{
  uint64_t v10 = fchownat(a1, a2, a3, a4, a5);
  if (!v10) {
    return v10;
  }
  v11 = __error();
  if ((a5 & 0x800) == 0 || *v11 != 22) {
    return v10;
  }
  return fchownat(a1, a2, a3, a4, a5 & 0xFFFFF7FF);
}

uint64_t x_linkat(int a1, const char *a2, int a3, const char *a4, int a5)
{
  uint64_t v10 = linkat(a1, a2, a3, a4, a5);
  if (!v10) {
    return v10;
  }
  v11 = __error();
  if ((a5 & 0x800) == 0 || *v11 != 22) {
    return v10;
  }
  return linkat(a1, a2, a3, a4, a5 & 0xFFFFF7FF);
}

uint64_t x_renameatx_np(int a1, const char *a2, int a3, const char *a4, unsigned int a5)
{
  uint64_t v10 = renameatx_np(a1, a2, a3, a4, a5);
  if (!v10) {
    return v10;
  }
  v11 = __error();
  if ((a5 & 0x10) == 0 || *v11 != 22) {
    return v10;
  }
  return renameatx_np(a1, a2, a3, a4, a5 & 0xFFFFFFEF);
}

uint64_t x_getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  uint64_t v10 = getattrlist(a1, a2, a3, a4, a5);
  if (!v10) {
    return v10;
  }
  v11 = __error();
  if ((a5 & 0x800) == 0 || *v11 != 22) {
    return v10;
  }
  return getattrlist(a1, a2, a3, a4, a5 & 0xFFFFF7FF);
}

uint64_t x_getattrlistat(int a1, const char *a2, void *a3, void *a4, size_t a5, unint64_t a6)
{
  uint64_t v12 = getattrlistat(a1, a2, a3, a4, a5, a6);
  if (!v12) {
    return v12;
  }
  int v13 = __error();
  if ((a6 & 0x800) == 0 || *v13 != 22) {
    return v12;
  }
  return getattrlistat(a1, a2, a3, a4, a5, a6 & 0xFFFFFFFFFFFFF7FFLL);
}

uint64_t x2_openat(int a1, char *a2, int a3, int a4, int a5, int a6, int a7, int a8, unsigned __int16 a9)
{
  if (qword_10001A358 != -1) {
    dispatch_once(&qword_10001A358, &stru_100014958);
  }
  if (*a2 == 47)
  {
    uint64_t v12 = 0;
    int v13 = 47;
    while (v13 == a2[v12])
    {
      int v13 = aSystemVolumesD_0[++v12];
      if (v12 == 37)
      {
LABEL_20:
        BOOL v14 = 1;
        goto LABEL_21;
      }
    }
    uint64_t v15 = 0;
    int v16 = 47;
    while (v16 == a2[v15])
    {
      int v16 = aSystemVolumesD_1[++v15];
      if (v15 == 51) {
        goto LABEL_20;
      }
    }
    uint64_t v17 = 0;
    int v18 = 47;
    while (v18 == a2[v17])
    {
      int v18 = aPrivateVarDbSp[++v17];
      if (v17 == 31) {
        goto LABEL_20;
      }
    }
    uint64_t v19 = 0;
    int v20 = 47;
    while (v20 == a2[v19])
    {
      int v20 = aSystemVolumesD_2[++v19];
      if (v19 == 46) {
        goto LABEL_20;
      }
    }
    uint64_t v26 = 0;
    int v27 = 47;
    do
    {
      int v28 = a2[v26];
      BOOL v14 = v27 == v28;
      if (v27 != v28) {
        break;
      }
      int v27 = aPrivateVarDbSp_0[++v26];
    }
    while (v26 != 26);
  }
  else
  {
    BOOL v14 = 0;
  }
LABEL_21:
  if ((a3 & 0x400) != 0) {
    int v21 = a3 & 0xDFFFFBFF | 0x20000000;
  }
  else {
    int v21 = a3 | 0x20000000;
  }
  if ((v21 & 0x200) != 0) {
    unsigned __int16 v22 = a9;
  }
  else {
    unsigned __int16 v22 = 0;
  }
  uint64_t v23 = x_openat(a1, a2, v21, a4, a5, a6, a7, a8, v22);
  uint64_t v24 = v23;
  if ((v23 & 0x80000000) == 0)
  {
    memset(&v29, 0, sizeof(v29));
    if (fstat(v23, &v29)
      || v29.st_nlink != 1
      || (bzero(&v30, 0x878uLL), !v14)
      && (fstatfs(v24, &v30) || *(void *)&v30.f_fsid == qword_10001A348 || *(void *)&v30.f_fsid == qword_10001A350))
    {
      close(v24);
      *__error() = 1;
      return 0xFFFFFFFFLL;
    }
    else if ((a3 & 0x400) != 0)
    {
      ftruncate(v24, 0);
    }
  }
  return v24;
}

void sub_1000054B0(id a1)
{
  bzero(&v1, 0x878uLL);
  statfs("/", &v1);
  qword_10001A348 = (uint64_t)v1.f_fsid;
  statfs("/System/Volumes/Data", &v1);
  qword_10001A350 = (uint64_t)v1.f_fsid;
}

void sub_100005938(void *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  if (a2 == 2)
  {
    objc_begin_catch(exc_buf);
    NSLog(@"%@");

    objc_end_catch();
  }
  else
  {
    objc_begin_catch(exc_buf);
  }
  JUMPOUT(0x100005908);
}

id sub_1000059D8(void *a1)
{
  [a1 setObject:@"com.apple.Spotlight.Metadata" forKey:kSecAttrAccessGroup];
  [a1 setObject:kCFBooleanTrue forKey:kSecAttrSynchronizable];
  [a1 setObject:kCFBooleanTrue forKey:kSecReturnData];
  return [a1 setObject:kSecAttrKeyClassSymmetric forKey:kSecAttrKeyClass];
}

BOOL sub_100005A78(id a1, id a2, unint64_t a3, BOOL *a4)
{
  CFNullRef v4 = (const __CFNull *)objc_msgSend(a2, "objectForKey:", kSecAttrLabel, a4);
  if (v4 == kCFNull) {
    CFNullRef v4 = 0;
  }
  return [(__CFNull *)v4 hasPrefix:@"Spotlight Metadata Privacy"];
}

void sub_100005ACC(uint64_t a1, uint64_t a2)
{
}

void sub_100005ADC(uint64_t a1)
{
}

void sub_100005AE8(uint64_t a1, void *a2)
{
  CFNullRef v4 = (CFNullRef)[a2 objectForKey:kSecAttrApplicationLabel];
  if (v4) {
    BOOL v5 = v4 == kCFNull;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5) {
    return;
  }
  CFNullRef v6 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [objc_alloc((Class)NSUUID) initWithUUIDString:v6];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return;
    }
    if ([(__CFNull *)v6 length] != (id)16)
    {
      id v11 = [objc_alloc((Class)NSString) initWithData:v6 encoding:4];
      id v8 = [objc_alloc((Class)NSUUID) initWithUUIDString:v11];

      goto LABEL_11;
    }
    id v7 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", -[__CFNull bytes](v6, "bytes"));
  }
  id v8 = v7;
  [*(id *)(*(void *)(a1 + 32) + 24) setObject:kCFNull forKey:v7];
LABEL_11:
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  sub_100005C58(v9, a2, v8, v10);
}

void sub_100005C58(uint64_t a1, void *a2, void *a3, id *a4)
{
  id v6 = [a2 objectForKey:kSecAttrCreationDate];
  if (!*(void *)(a1 + 8))
  {
    *(void *)(a1 + 8) = a3;
    goto LABEL_5;
  }
  if ([*a4 compare:v6] == (id)1)
  {

    *(void *)(a1 + 8) = a3;
LABEL_5:
    *a4 = v6;
    return;
  }
}

id sub_100005DC4(uint64_t a1)
{
  id result = objc_alloc_init(*(Class *)(a1 + 32));
  qword_10001A368 = (uint64_t)result;
  return result;
}

void sub_100005F28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100005F40(uint64_t a1)
{
  id result = [*(id *)(*(void *)(a1 + 32) + 24) allKeys];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

void sub_100006044(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:*(void *)(a1 + 40)];
  if (*(const CFNullRef *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) == kCFNull)
  {
    v5[0] = 0;
    v5[1] = 0;
    [*(id *)(a1 + 40) getUUIDBytes:v5];
    stat v2 = +[NSData dataWithBytes:v5 length:16];
    int v3 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", kSecMatchLimitOne, kSecMatchLimit, kSecClassKey, kSecClass, kSecAttrKeyClassSymmetric, kSecAttrKeyClass, v2, kSecAttrApplicationLabel, kCFBooleanTrue, kSecReturnRef, 0, 0);

    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    SecItemCopyMatching((CFDictionaryRef)v3, (CFTypeRef *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    if (v4)
    {
      [*(id *)(*(void *)(a1 + 32) + 24) setObject:v4 forKey:*(void *)(a1 + 40)];
      CFRelease(*(CFTypeRef *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
    }
  }
}

uint64_t sub_10000628C(uint64_t a1)
{
  [*(id *)(a1 + 32) getKey:*(void *)(a1 + 48)];
  stat v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

CFDataRef sub_100006C10(CCOperation a1, const void *a2, size_t a3, void *a4, int a5, int a6)
{
  size_t dataOutAvailable = a3 + 16;
  id v13 = [objc_alloc((Class)NSMutableData) initWithCapacity:a3 + 16];
  CFIndex length = 0;
  iv[0] = a5;
  iv[1] = a6;
  uint64_t v21 = 0;
  CCCryptorStatus v14 = CCCrypt(a1, 0, 1u, [a4 bytes], (size_t)objc_msgSend(a4, "length"), iv, a2, a3, objc_msgSend(v13, "bytes"), dataOutAvailable, (size_t *)&length);
  if (v14)
  {
    int v15 = v14;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10000F6AC(v15);
    }
    CFDataRef v16 = 0;
  }
  else
  {
    uint64_t v17 = (const UInt8 *)[v13 bytes];
    CFDataRef v16 = CFDataCreate(kCFAllocatorDefault, v17, length);
  }

  return v16;
}

void sub_100006D68(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

char *sub_100006D84(int a1, char *__s1)
{
  return strdup(__s1);
}

void sub_100006D8C(int a1, void *a2)
{
}

BOOL sub_100006D94(const char *a1, const char *a2)
{
  return strcmp(a1, a2) == 0;
}

uint64_t sub_100006DB4(char *a1)
{
  unsigned int v2 = strlen(a1);
  return MDHash((unsigned __int8 *)a1, v2, -1640531527);
}

void *sub_100006DF0(uint64_t a1, void *a2)
{
  id result = malloc_type_malloc(8uLL, 0x100004000313F17uLL);
  *id result = *a2;
  return result;
}

void sub_100006E30(int a1, void *a2)
{
}

BOOL sub_100006E38(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_100006E4C(uint64_t a1)
{
  return MDHashQuick64(a1);
}

dispatch_object_t sub_100006E68(int a1, dispatch_object_t object)
{
  return object;
}

void sub_100006E94(int a1, dispatch_object_t object)
{
}

xpc_object_t sub_100006E9C(int a1, xpc_object_t object)
{
  return object;
}

void sub_100006EC8(int a1, xpc_object_t object)
{
}

CFTypeRef kCFContainerRetainCallBack(int a1, CFTypeRef cf)
{
  return cf;
}

void kCFContainerReleaseCallBack(int a1, CFTypeRef cf)
{
}

uint64_t XPCUtil_CopyXPCObjectFromCF()
{
  uint64_t result = _MDPlistBytesCreateMutableUsingMalloc();
  if (result)
  {
    statfs v1 = (const void *)result;
    _MDPlistBytesAppendPlist();
    ByteVector = (const void *)_MDPlistBytesGetByteVector();
    unsigned int ByteVectorCount = _MDPlistBytesGetByteVectorCount();
    xpc_object_t v4 = xpc_data_create(ByteVector, ByteVectorCount);
    CFRelease(v1);
    return (uint64_t)v4;
  }
  return result;
}

void XPCUtil_PackCFIntoArray(void *a1, size_t a2)
{
  uint64_t MutableUsingMalloc = _MDPlistBytesCreateMutableUsingMalloc();
  if (MutableUsingMalloc)
  {
    BOOL v5 = (const void *)MutableUsingMalloc;
    _MDPlistBytesAppendPlist();
    ByteVector = (const void *)_MDPlistBytesGetByteVector();
    unsigned int ByteVectorCount = _MDPlistBytesGetByteVectorCount();
    xpc_array_set_data(a1, a2, ByteVector, ByteVectorCount);
    CFRelease(v5);
  }
}

void XPCUtil_PackCFIntoDictionary(void *a1, const char *a2)
{
  uint64_t MutableUsingMalloc = _MDPlistBytesCreateMutableUsingMalloc();
  if (MutableUsingMalloc)
  {
    BOOL v5 = (const void *)MutableUsingMalloc;
    _MDPlistBytesAppendPlist();
    ByteVector = (const void *)_MDPlistBytesGetByteVector();
    unsigned int ByteVectorCount = _MDPlistBytesGetByteVectorCount();
    xpc_dictionary_set_data(a1, a2, ByteVector, ByteVectorCount);
    CFRelease(v5);
  }
}

uint64_t XPCUtil_CopyCFFromObject(void *a1)
{
  xpc_data_get_bytes_ptr(a1);
  xpc_data_get_length(a1);
  unsigned int v2 = (const void *)_MDPlistBytesCreate();
  uint64_t v3 = _MDPlistBytesCopyPlistAtIndex();
  CFRelease(v2);
  return v3;
}

uint64_t XPCUtil_CopyCFFromArray(void *a1, size_t a2)
{
  size_t length = 0;
  xpc_array_get_data(a1, a2, &length);
  unsigned int v2 = (const void *)_MDPlistBytesCreate();
  uint64_t v3 = _MDPlistBytesCopyPlistAtIndex();
  CFRelease(v2);
  return v3;
}

uint64_t XPCUtil_CopyCFFromDictionary(void *a1, const char *a2)
{
  size_t length = 0;
  xpc_dictionary_get_data(a1, a2, &length);
  unsigned int v2 = (const void *)_MDPlistBytesCreate();
  uint64_t v3 = _MDPlistBytesCopyPlistAtIndex();
  CFRelease(v2);
  return v3;
}

CFAllocatorRef BWA_Create()
{
  context.version = 0;
  context.info = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, 0, &kCFTypeDictionaryValueCallBacks);
  context.retain = (CFAllocatorRetainCallBack)&_CFRetain;
  context.release = (CFAllocatorReleaseCallBack)&_CFRelease;
  context.copyDescription = 0;
  context.allocate = (CFAllocatorAllocateCallBack)sub_1000072A4;
  context.reallocate = 0;
  context.deallocate = (CFAllocatorDeallocateCallBack)sub_1000072AC;
  context.preferredSize = (CFAllocatorPreferredSizeCallBack)nullsub_3;
  return CFAllocatorCreate(kCFAllocatorDefault, &context);
}

uint64_t sub_1000072A4()
{
  return 0;
}

void sub_1000072AC(void *key, CFDictionaryRef theDict)
{
  Value = (void (**)(const void *, void *))CFDictionaryGetValue(theDict, key);
  if (Value)
  {
    Value[2](Value, key);
    CFDictionaryRemoveValue(theDict, key);
  }
}

void BWA_DataAllocate(const __CFAllocator *a1, const void *a2, const void *a3)
{
  memset(&theDict, 0, sizeof(theDict));
  CFAllocatorGetContext(a1, &theDict);
  if ((void (*)(void *, CFDictionaryRef))theDict.deallocate == sub_1000072AC)
  {
    BOOL v5 = _Block_copy(a3);
    CFDictionaryAddValue((CFMutableDictionaryRef)theDict.info, a2, v5);
    _Block_release(v5);
  }
}

void BWA_DataDeallocate(const __CFAllocator *a1, void *a2)
{
  memset(&theDict, 0, sizeof(theDict));
  CFAllocatorGetContext(a1, &theDict);
  if ((void (*)(void *, CFDictionaryRef))theDict.deallocate == sub_1000072AC) {
    sub_1000072AC(a2, (CFDictionaryRef)theDict.info);
  }
}

uint64_t MDGetCurrentTimeSpec(__darwin_time_t *a1)
{
  v4.tv_sec = 0;
  *(void *)&v4.tv_usec = 0;
  gettimeofday(&v4, 0);
  uint64_t v2 = 1000 * v4.tv_usec;
  *a1 = v4.tv_sec;
  a1[1] = v2;
  return 0;
}

uint64_t CF_RangeUnion(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result >= a3) {
    return a3;
  }
  return result;
}

uint64_t CF_RangeIntersection(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result <= a3) {
    return a3;
  }
  return result;
}

uint64_t CF_MaxRange(uint64_t a1, uint64_t a2)
{
  return a1 + a2;
}

uint64_t mdBufferSprintf(char **a1, size_t *a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t result = vsnprintf(*a1, *a2, a3, &a9);
  if ((result & 0x80000000) == 0)
  {
    if (*a2 >= result)
    {
      *a2 -= result;
      *a1 += result;
    }
    else
    {
      *a2 = 0;
    }
  }
  return result;
}

BOOL isValidUUID(const char *a1)
{
  int v11 = -1;
  int v12 = -1;
  int v9 = -1;
  int v10 = -1;
  int v8 = -1;
  char v7 = 0;
  return sscanf(a1, "%*[0-9a-fA-F]%n-%*[0-9a-fA-F]%n-%*[0-9a-fA-F]%n-%*[0-9a-fA-F]%n-%*[0-9a-fA-F]%n%c", &v12, &v11, &v10, &v9, &v8, &v7) == -1&& v12 == 8&& v11 == 13&& v10 == 18&& v9 == 23&& v8 == 36;
}

unsigned __int8 *str_prefix(unsigned char *a1, unsigned __int8 *a2)
{
  int v2 = *a1;
  if (*a1)
  {
    uint64_t v3 = a1 + 1;
    while (v2 == *a2)
    {
      ++a2;
      int v4 = *v3++;
      int v2 = v4;
      if (!v4) {
        return a2;
      }
    }
    return 0;
  }
  return a2;
}

unsigned char *str_common(unsigned char *result, unsigned __int8 *a2)
{
  int v2 = *result;
  if (!*result) {
    return 0;
  }
  while (v2 == *a2)
  {
    int v3 = *++result;
    int v2 = v3;
    ++a2;
    if (!v3) {
      return 0;
    }
  }
  return result;
}

uint64_t strcmp_prefix(unsigned __int8 *a1, unsigned char *a2)
{
  unsigned __int8 v2 = *a1;
  if (*a1)
  {
    int v3 = a1 + 1;
    while (1)
    {
      int v4 = *a2;
      if (v4 != v2) {
        return (2 * ((char)v2 - (char)v4));
      }
      ++a2;
      int v5 = *v3++;
      unsigned __int8 v2 = v5;
      if (!v5) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    if (*a2) {
      return 0xFFFFFFFFLL;
    }
    else {
      return 0;
    }
  }
}

uint64_t strcmp_nocase(unsigned char *a1, char *a2)
{
  char v3 = *a1;
  if (*a1)
  {
    int v4 = a1 + 1;
    while (1)
    {
      __darwin_ct_rune_t v5 = __tolower(v3);
      if (v5 != __tolower(*a2)) {
        break;
      }
      ++a2;
      int v6 = *v4++;
      char v3 = v6;
      if (!v6) {
        goto LABEL_5;
      }
    }
    __darwin_ct_rune_t v7 = (char)*(v4 - 1);
  }
  else
  {
LABEL_5:
    __darwin_ct_rune_t v7 = 0;
  }
  int v8 = __tolower(v7);
  return v8 - __tolower(*a2);
}

unsigned char *findExtension(unsigned char *result, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  uint64_t v2 = a2 - 1;
  if (a2 != 1)
  {
    while ((result[v2] & 0xFE) != 0x2E)
    {
      if (!--v2) {
        goto LABEL_7;
      }
    }
  }
  result += v2;
LABEL_7:
  if (*result != 46) {
    return 0;
  }
  return result;
}

char *findNameAndExtension(char *__s, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  uint64_t v2 = __s;
  uint64_t v3 = a2 - 1;
  if (a2 == 1)
  {
    uint64_t v2 = &__s[v3];
LABEL_8:
    if (*v2 != 47) {
      return 0;
    }
  }
  else
  {
    while (__s[v3] != 47)
    {
      if (!--v3) {
        goto LABEL_8;
      }
    }
    uint64_t v2 = &__s[v3];
  }
  if (strlen(v2) > 1) {
    return v2 + 1;
  }
  else {
    return 0;
  }
}

uint64_t bsearch_aux(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t), void *a6)
{
  uint64_t v6 = a3 - 1;
  if (a3 - 1 < 0)
  {
    uint64_t v18 = 0;
    uint64_t v16 = 0;
  }
  else
  {
    int v20 = a6;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    do
    {
      uint64_t v14 = v6 + v13;
      if (v6 + v13 < 0 != __OFADD__(v6, v13)) {
        ++v14;
      }
      uint64_t v15 = v14 >> 1;
      uint64_t v16 = a2 + (v14 >> 1) * a4;
      int v17 = a5(a1, v16);
      if (!v17)
      {
        uint64_t v11 = 0;
        uint64_t v12 = v16;
        a6 = v20;
        goto LABEL_17;
      }
      uint64_t v18 = v17;
      if (v17 < 0) {
        uint64_t v6 = v15 - 1;
      }
      else {
        uint64_t v13 = v15 + 1;
      }
      if (v17 >= 0)
      {
        uint64_t v12 = v16;
        uint64_t v11 = v17;
      }
    }
    while (v13 <= v6);
    a6 = v20;
    if (v11) {
      goto LABEL_17;
    }
  }
  uint64_t v11 = v18;
  uint64_t v12 = v16;
LABEL_17:
  *a6 = v11;
  return v12;
}

uint64_t path_bundle_index(uint64_t a1)
{
  if (qword_10001A370 != -1) {
    dispatch_once(&qword_10001A370, &stru_100014AA0);
  }
  if (dword_10001A1F8 < 0) {
    return 0xFFFFFFFFLL;
  }
  else {
    return fcntl(dword_10001A1F8, 52, a1);
  }
}

void sub_1000078D4(id a1)
{
  dword_10001A1F8 = open("/System/Library", 4);
}

uint64_t MDRunningOnPhysicalIntel()
{
  return 1;
}

uint64_t MDRunningOnPhysicalPPC()
{
  return 0;
}

uint64_t MDRunningOnEffectivePPC()
{
  return 0;
}

uint64_t MDRunningIntel32()
{
  return 0;
}

uint64_t MDRunningIntel64()
{
  return 0;
}

uint64_t MDRunningInRosetta()
{
  if (byte_10001A378 == 1) {
    return byte_10001A379;
  }
  int v2 = 0;
  size_t v1 = 4;
  *(void *)uint64_t v3 = 0x2C00000001;
  pid_t v4 = getpid();
  int v5 = 0;
  sysctl(v3, 3u, &v2, &v1, 0, 0);
  if (v2)
  {
    uint64_t result = 1;
    byte_10001A379 = 1;
  }
  else
  {
    uint64_t result = byte_10001A379;
  }
  byte_10001A378 = 1;
  return result;
}

void *MDAddNanoseconds(void *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *result + a2;
  uint64_t v4 = result[1] + a3;
  *uint64_t result = v3;
  result[1] = v4;
  if (v4 >= 1000000000)
  {
    *uint64_t result = v3 + 1;
    result[1] = v4 - 1000000000;
  }
  return result;
}

uint64_t MDElapsedTime(uint64_t result, uint64_t a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(a2 + 8);
  int v4 = *(_DWORD *)(result + 8);
  BOOL v5 = __OFSUB__(v3, v4);
  int v6 = v3 - v4;
  uint64_t v7 = 0xFFFFFFFFLL;
  if (v6 < 0 != v5)
  {
    int v8 = 1000000;
  }
  else
  {
    uint64_t v7 = 0;
    int v8 = 0;
  }
  *(void *)a3 = *(void *)a2 - *(void *)result + v7;
  *(_DWORD *)(a3 + 8) = v6 + v8;
  return result;
}

time_t MDTimeSinceBoot()
{
  v3[1] = 0;
  time_t v4 = 0;
  *(void *)int v6 = 0x1500000001;
  v3[0] = 0;
  size_t v5 = 16;
  time(&v4);
  int v0 = sysctl(v6, 2u, v3, &v5, 0, 0);
  if (v3[0]) {
    BOOL v1 = v0 == -1;
  }
  else {
    BOOL v1 = 1;
  }
  if (v1) {
    return 0;
  }
  else {
    return v4 - v3[0];
  }
}

uint64_t MDBootTime()
{
  *(void *)size_t v5 = 0x1500000001;
  v3[0] = 0;
  v3[1] = 0;
  size_t v4 = 16;
  int v0 = sysctl(v5, 2u, v3, &v4, 0, 0);
  if (v3[0]) {
    BOOL v1 = v0 == -1;
  }
  else {
    BOOL v1 = 1;
  }
  if (v1) {
    return 0;
  }
  else {
    return v3[0];
  }
}

uint64_t MDGetPhysicalRAMSize()
{
  uint64_t result = qword_10001A380;
  if (!qword_10001A380)
  {
    long long v5 = 0u;
    long long v6 = 0u;
    *(_OWORD *)host_info_out = 0u;
    mach_port_t v1 = mach_host_self();
    mach_msg_type_number_t host_info_outCnt = 12;
    mach_error_t v2 = host_info(v1, 1, host_info_out, &host_info_outCnt);
    if (v2)
    {
      mach_error("flushsize", v2);
      exit(1);
    }
    uint64_t result = *((void *)&v6 + 1);
    qword_10001A380 = *((void *)&v6 + 1);
  }
  return result;
}

unint64_t MDSecondsToMachAbsoluteTime(double a1)
{
  if (qword_10001A388 != -1) {
    dispatch_once(&qword_10001A388, &stru_100014AE0);
  }
  return (unint64_t)(*(double *)&qword_10001A390 * a1);
}

void sub_100007C78(id a1)
{
  mach_timebase_info info = 0;
  if (!mach_timebase_info(&info))
  {
    LODWORD(v2) = info.numer;
    LODWORD(v1) = info.denom;
    *(double *)&qword_10001A390 = (double)v1 * 1000000000.0 / (double)v2;
  }
}

double MDMachAbsoluteTimeDiff(uint64_t a1, uint64_t a2)
{
  if (qword_10001A388 != -1) {
    dispatch_once(&qword_10001A388, &stru_100014B20);
  }
  return (double)(unint64_t)(a2 - a1) / *(double *)&qword_10001A390;
}

void sub_100007D28(id a1)
{
  mach_timebase_info info = 0;
  if (!mach_timebase_info(&info))
  {
    LODWORD(v2) = info.numer;
    LODWORD(v1) = info.denom;
    *(double *)&qword_10001A390 = (double)v1 * 1000000000.0 / (double)v2;
  }
}

uint64_t MDSRegisterSystemLoadAdvisory()
{
  return notify_register_check("com.apple.system.powermanagement.SystemLoadAdvisory", &dword_10001A398);
}

uint64_t MDSUnregisterSystemLoadAdvisory()
{
  return notify_cancel(dword_10001A398);
}

uint64_t MDSGetSystemLoadAdvisory()
{
  int check = 0;
  notify_check(dword_10001A398, &check);
  if (!check) {
    return qword_10001A200;
  }
  notify_get_state(dword_10001A398, (uint64_t *)&qword_10001A200);
  uint64_t result = qword_10001A200;
  if (!qword_10001A200)
  {
    uint64_t result = 2;
    qword_10001A200 = 2;
  }
  return result;
}

BOOL MDSetProcessIOPolicy(int a1)
{
  return setiopolicy_np(0, 0, a1) == 0;
}

BOOL MDSetThreadIOPolicy(int a1)
{
  return setiopolicy_np(0, 1, a1) == 0;
}

uint64_t MDGetProcessIOPolicy()
{
  return getiopolicy_np(0, 0);
}

uint64_t MDGetThreadIOPolicy()
{
  return getiopolicy_np(0, 1);
}

uint64_t MDSetThreadPriority(integer_t a1)
{
  policy_mach_timebase_info info = a1;
  thread_act_t v1 = mach_thread_self();
  uint64_t v2 = thread_policy_set(v1, 3u, &policy_info, 1u);
  mach_port_deallocate(mach_task_self_, v1);
  return v2;
}

uint64_t MDSetThreadVNodeRapidAging(int a1)
{
  *(void *)size_t v4 = 0x4400000001;
  if (a1) {
    int v1 = 2;
  }
  else {
    int v1 = 4;
  }
  int v3 = v1;
  return sysctl(v4, 2u, 0, 0, &v3, 4uLL);
}

uint64_t MDSetProcessVNodeRapidAging(int a1)
{
  *(void *)size_t v4 = 0x4400000001;
  if (a1) {
    int v1 = 1;
  }
  else {
    int v1 = 3;
  }
  int v3 = v1;
  return sysctl(v4, 2u, 0, 0, &v3, 4uLL);
}

uint64_t allow_COW_exempt()
{
  if (qword_10001A3B8 != -1) {
    dispatch_once(&qword_10001A3B8, &stru_100014BE0);
  }
  return byte_10001A3C0;
}

BOOL MDKillTask(mach_port_name_t a1)
{
  kern_return_t v1;
  BOOL result;
  int x;

  x = 0;
  int v1 = pid_for_task(a1, &x);
  uint64_t result = 0;
  if (!v1) {
    return kill(x, 9) == 0;
  }
  return result;
}

__CFString *MDCopyMachPortDescription(const __CFAllocator *a1, uint64_t a2)
{
  Mutable = CFStringCreateMutable(a1, 0);
  if (Mutable)
  {
    *(void *)int v8 = 0;
    *(void *)refs = 0;
    mach_port_urefs_t v7 = 0;
    uint64_t v4 = mach_port_get_refs(mach_task_self_, a2, 1u, &refs[1]);
    if (v4 || (uint64_t v4 = mach_port_get_refs(mach_task_self_, a2, 0, refs), v4))
    {
      long long v6 = mach_error_string(v4);
      CFStringAppendFormat(Mutable, 0, @"port:%#010x kr:%u (%s)", a2, v4, v6);
    }
    else
    {
      mach_port_get_refs(mach_task_self_, a2, 2u, &v8[1]);
      mach_port_get_refs(mach_task_self_, a2, 4u, v8);
      mach_port_get_refs(mach_task_self_, a2, 3u, &v7);
      CFStringAppendFormat(Mutable, 0, @"port:%#010x receiveRefs:%u sendRefs:%u sendOnceRefs:%u deadNameRefs:%u portSetRefs:%u", a2, refs[1], refs[0], v8[1], v8[0], v7);
    }
  }
  return Mutable;
}

uint64_t _MDIsAppleInternal()
{
  if (qword_10001A3A0 != -1) {
    dispatch_once(&qword_10001A3A0, &stru_100014B60);
  }
  return 0;
}

CFDataRef CFDataCreateWithContentsOfURL(const __CFAllocator *a1, const __CFURL *a2)
{
  bzero(buffer, 0x400uLL);
  if (!CFURLGetFileSystemRepresentation(a2, 1u, buffer, 1024)) {
    return 0;
  }
  memset(&v10.st_size, 0, 48);
  int v4 = open((const char *)buffer, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  if (v4 == -1) {
    return 0;
  }
  int v5 = v4;
  CFDataRef v6 = 0;
  if (!fstat(v4, &v10) && v10.st_size <= 0xFFFFFF)
  {
    mach_port_urefs_t v7 = (UInt8 *)CFAllocatorAllocate(a1, v10.st_size, 0);
    off_t st_size = v10.st_size;
    if (st_size == pread(v5, v7, v10.st_size, 0))
    {
      CFDataRef v6 = CFDataCreateWithBytesNoCopy(a1, v7, v10.st_size, a1);
    }
    else
    {
      CFAllocatorDeallocate(a1, v7);
      CFDataRef v6 = 0;
    }
  }
  close(v5);
  return v6;
}

char *cStringFromCFString(const __CFString *a1, char *a2, CFIndex a3, CFStringEncoding a4)
{
  if (CFStringGetCString(a1, a2, a3, a4)) {
    return a2;
  }
  else {
    return 0;
  }
}

BOOL MDTimeInfoCollect(task_info_t task_info_out)
{
  mach_msg_type_number_t task_info_outCnt = 8;
  return task_info(mach_task_self_, 1u, task_info_out, &task_info_outCnt) == 0;
}

int64x2_t MDTimeInfoDifference(int64x2_t *a1, int64x2_t *a2, int64x2_t *a3)
{
  int64x2_t result = vsubq_s64(*a2, *a1);
  *a3 = result;
  return result;
}

int64x2_t MDTimeInfoSum(int64x2_t *a1, int64x2_t *a2, int64x2_t *a3)
{
  int64x2_t result = vaddq_s64(*a2, *a1);
  *a3 = result;
  return result;
}

uint64_t MDTimeInfoEnd(int64x2_t *a1)
{
  memset(v3, 0, sizeof(v3));
  mach_msg_type_number_t task_info_outCnt = 8;
  if (task_info(mach_task_self_, 1u, v3[0].i32, &task_info_outCnt)) {
    return 0;
  }
  *a1 = vsubq_s64(v3[0], *a1);
  return 1;
}

CFNumberRef MDNumberCreateInt32(int a1)
{
  int valuePtr = a1;
  return CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
}

CFNumberRef MDNumberCreateInt64(uint64_t a1)
{
  uint64_t valuePtr = a1;
  return CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &valuePtr);
}

CFNumberRef MDNumberCreateDouble(double a1)
{
  double valuePtr = a1;
  return CFNumberCreate(kCFAllocatorDefault, kCFNumberDoubleType, &valuePtr);
}

CFNumberRef MDNumberGetInt32(const __CFNumber *result)
{
  unsigned int valuePtr = 0;
  if (result)
  {
    CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr);
    return (const __CFNumber *)valuePtr;
  }
  return result;
}

CFNumberRef MDNumberGetInt64(const __CFNumber *result)
{
  uint64_t valuePtr = 0;
  if (result)
  {
    CFNumberGetValue(result, kCFNumberSInt64Type, &valuePtr);
    return (const __CFNumber *)valuePtr;
  }
  return result;
}

double MDNumberGetDouble(const __CFNumber *a1)
{
  double valuePtr = 0.0;
  if (!a1) {
    return 0.0;
  }
  CFNumberGetValue(a1, kCFNumberDoubleType, &valuePtr);
  return valuePtr;
}

CFMutableDictionaryRef MDDictionaryCreateMutable()
{
  return CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
}

CFMutableArrayRef MDArrayCreateMutable()
{
  return CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
}

CFMutableSetRef MDSetCreateMutable()
{
  return CFSetCreateMutable(kCFAllocatorDefault, 0, &kCFTypeSetCallBacks);
}

void MDDictionaryIterate(const __CFDictionary *a1, void *context)
{
}

uint64_t sub_1000085E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a3 + 16))(a3, a1, a2);
}

void MDSetIterate(const __CFSet *a1, void *context)
{
}

uint64_t sub_100008614(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, a1);
}

void MDArrayIterate(const __CFArray *a1, void *a2)
{
  v4.size_t length = CFArrayGetCount(a1);
  v4.location = 0;
  CFArrayApplyFunction(a1, v4, (CFArrayApplierFunction)sub_100008684, a2);
}

uint64_t sub_100008684(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, a1);
}

uint64_t GetSystemBuildVersionStringLocal()
{
  if (qword_10001A3B0 != -1) {
    dispatch_once(&qword_10001A3B0, &stru_100014BA0);
  }
  return qword_10001A3A8;
}

void sub_1000086E0(id a1)
{
  CFDictionaryRef v1 = (const __CFDictionary *)_CFCopySystemVersionDictionary();
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v1, _kCFSystemVersionBuildVersionKey);
  qword_10001A3A8 = (uint64_t)Value;
  if (Value) {
    qword_10001A3A8 = (uint64_t)CFStringCreateCopy(kCFAllocatorDefault, Value);
  }
  CFRelease(v1);
  if (!qword_10001A3A8) {
    qword_10001A3A8 = (uint64_t)&stru_100015150;
  }
}

void sub_100008754(id a1)
{
  byte_10001A3C0 = 1;
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3 = objc_opt_new();
  CFRange v4 = +[NSXPCListener serviceListener];
  [(NSXPCListener *)v4 setDelegate:v3];
  [(NSXPCListener *)v4 resume];
  return 0;
}

uint64_t _MDLabelUUIDEncode(unint64_t a1, unint64_t a2, uint64_t a3)
{
  *(unsigned char *)a3 = aAbcdefghijklmn[a1 >> 3];
  *(unsigned char *)(a3 + 1) = aAbcdefghijklmn[((unsigned __int16)a1 >> 14) & 0xFFFFFFFFFFFFFFE3 | (4 * (a1 & 7))];
  *(unsigned char *)(a3 + 2) = aAbcdefghijklmn[(a1 >> 9) & 0x1F];
  *(unsigned char *)(a3 + 3) = aAbcdefghijklmn[(unint64_t)(BYTE2(a1) & 0xF0 | (a1 & 0x100)) >> 4];
  *(unsigned char *)(a3 + 4) = aAbcdefghijklmn[(a1 >> 15) & 0x1E | (a1 >> 31)];
  *(unsigned char *)(a3 + 5) = aAbcdefghijklmn[(a1 >> 26) & 0x1F];
  *(unsigned char *)(a3 + 6) = aAbcdefghijklmn[(a1 >> 21) & 0x18 | (a1 >> 37) & 7];
  *(unsigned char *)(a3 + 7) = aAbcdefghijklmn[HIDWORD(a1) & 0x1F];
  *(unsigned char *)(a3 + 8) = aAbcdefghijklmn[(a1 >> 43) & 0x1F];
  *(unsigned char *)(a3 + 9) = aAbcdefghijklmn[(a1 >> 38) & 0x1C | (a1 >> 54) & 3];
  *(unsigned char *)(a3 + 10) = aAbcdefghijklmn[(a1 >> 49) & 0x1F];
  *(unsigned char *)(a3 + 11) = aAbcdefghijklmn[(a1 >> 44) & 0x10 | (a1 >> 60)];
  *(unsigned char *)(a3 + 12) = aAbcdefghijklmn[(a1 >> 55) & 0x1E | (a2 >> 7) & 1];
  *(unsigned char *)(a3 + 13) = aAbcdefghijklmn[(a2 >> 2) & 0x1F];
  uint64_t result = HIWORD(a2) & 0x1F;
  *(unsigned char *)(a3 + 14) = aAbcdefghijklmn[((unsigned __int16)a2 >> 13) & 0xFFFFFFFFFFFFFFE7 | (8 * (a2 & 3))];
  *(unsigned char *)(a3 + 15) = aAbcdefghijklmn[(a2 >> 8) & 0x1F];
  *(unsigned char *)(a3 + 16) = aAbcdefghijklmn[(a2 >> 19) & 0x1F];
  *(unsigned char *)(a3 + 17) = aAbcdefghijklmn[(a2 >> 14) & 0x1C | (a2 >> 30)];
  *(unsigned char *)(a3 + 18) = aAbcdefghijklmn[(a2 >> 25) & 0x1F];
  *(unsigned char *)(a3 + 19) = aAbcdefghijklmn[(a2 >> 20) & 0x10 | (a2 >> 36) & 0xF];
  *(unsigned char *)(a3 + 20) = aAbcdefghijklmn[(a2 >> 31) & 0x1E | (a2 >> 47) & 1];
  *(unsigned char *)(a3 + 21) = aAbcdefghijklmn[(a2 >> 42) & 0x1F];
  *(unsigned char *)(a3 + 22) = aAbcdefghijklmn[(a2 >> 37) & 0x18 | (a2 >> 53) & 7];
  *(unsigned char *)(a3 + 23) = aAbcdefghijklmn[result];
  *(unsigned char *)(a3 + 24) = aAbcdefghijklmn[a2 >> 59];
  *(_WORD *)(a3 + 25) = aAbcdefghijklmn[(a2 >> 54) & 0x1C];
  return result;
}

uint64_t _MDPrivateXattrUUIDsGetter()
{
  if (qword_10001A3D0 != -1) {
    dispatch_once(&qword_10001A3D0, &stru_100014C20);
  }
  return qword_10001A3C8;
}

void sub_100008C0C(id a1)
{
  CFUUIDRef v1 = CFUUIDGetConstantUUIDWithBytes(kCFAllocatorSystemDefault, 0x71u, 0x9Fu, 0xB8u, 0xCAu, 0x18u, 0x13u, 0x49u, 0xB0u, 0x8Bu, 0x20u, 0x36u, 0x5Eu, 0xEBu, 0xC3u, 0xEDu, 0x57u);
  CFUUIDGetUUIDBytes(v1);
  qword_10001A3C8 = xpc_create_with_format();
}

CFTypeID MDLabelGetTypeID(void)
{
  if (qword_10001A3E0 != -1) {
    dispatch_once(&qword_10001A3E0, &stru_100014CA0);
  }
  return qword_10001A3D8;
}

CFStringRef sub_100008CD8(uint64_t a1)
{
  return CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"<MDLabel %p [%@]>", a1, *(void *)(a1 + 16));
}

void sub_100008D1C(id a1)
{
  qword_10001A3D8 = _CFRuntimeRegisterClass();
}

uint64_t MDHash(unsigned __int8 *a1, unsigned int a2, int a3)
{
  unsigned int v3 = -1640531527;
  if (a2 < 0xC)
  {
    int v5 = -1640531527;
    unsigned int v4 = a2;
  }
  else
  {
    unsigned int v4 = a2;
    int v5 = -1640531527;
    do
    {
      unsigned int v6 = *((_DWORD *)a1 + 1) + v3;
      unsigned int v7 = *((_DWORD *)a1 + 2) + a3;
      int v8 = (*(_DWORD *)a1 + v5 - (v6 + v7)) ^ (v7 >> 13);
      unsigned int v9 = (v6 - v7 - v8) ^ (v8 << 8);
      unsigned int v10 = (v7 - v8 - v9) ^ (v9 >> 13);
      int v11 = (v8 - v9 - v10) ^ (v10 >> 12);
      unsigned int v12 = (v9 - v10 - v11) ^ (v11 << 16);
      unsigned int v13 = (v10 - v11 - v12) ^ (v12 >> 5);
      int v5 = (v11 - v12 - v13) ^ (v13 >> 3);
      unsigned int v3 = (v12 - v13 - v5) ^ (v5 << 10);
      a3 = (v13 - v5 - v3) ^ (v3 >> 15);
      a1 += 12;
      v4 -= 12;
    }
    while (v4 > 0xB);
  }
  unsigned int v14 = a3 + a2;
  switch(v4)
  {
    case 1u:
      goto LABEL_17;
    case 2u:
      goto LABEL_16;
    case 3u:
      goto LABEL_15;
    case 4u:
      goto LABEL_14;
    case 5u:
      goto LABEL_13;
    case 6u:
      goto LABEL_12;
    case 7u:
      goto LABEL_11;
    case 8u:
      goto LABEL_10;
    case 9u:
      goto LABEL_9;
    case 0xAu:
      goto LABEL_8;
    case 0xBu:
      v14 += a1[10] << 24;
LABEL_8:
      v14 += a1[9] << 16;
LABEL_9:
      v14 += a1[8] << 8;
LABEL_10:
      v3 += a1[7] << 24;
LABEL_11:
      v3 += a1[6] << 16;
LABEL_12:
      v3 += a1[5] << 8;
LABEL_13:
      v3 += a1[4];
LABEL_14:
      v5 += a1[3] << 24;
LABEL_15:
      v5 += a1[2] << 16;
LABEL_16:
      v5 += a1[1] << 8;
LABEL_17:
      v5 += *a1;
      break;
    default:
      break;
  }
  int v15 = (v5 - v3 - v14) ^ (v14 >> 13);
  unsigned int v16 = (v3 - v14 - v15) ^ (v15 << 8);
  unsigned int v17 = (v14 - v15 - v16) ^ (v16 >> 13);
  int v18 = (v15 - v16 - v17) ^ (v17 >> 12);
  unsigned int v19 = (v16 - v17 - v18) ^ (v18 << 16);
  unsigned int v20 = (v17 - v18 - v19) ^ (v19 >> 5);
  int v21 = (v18 - v19 - v20) ^ (v20 >> 3);
  return (v20 - v21 - ((v19 - v20 - v21) ^ (v21 << 10))) ^ (((v19 - v20 - v21) ^ (v21 << 10)) >> 15);
}

uint64_t MDHashQuick32(int a1)
{
  unsigned int v1 = (-1640531527 - a1) ^ ((a1 - 4) << 8);
  unsigned int v2 = (8 - a1 - v1) ^ (v1 >> 13);
  int v3 = (a1 - 4 - v1 - v2) ^ (v2 >> 12);
  unsigned int v4 = (v1 - v2 - v3) ^ (v3 << 16);
  unsigned int v5 = (v2 - v3 - v4) ^ (v4 >> 5);
  int v6 = (v3 - v4 - v5) ^ (v5 >> 3);
  return (v5 - v6 - ((v4 - v5 - v6) ^ (v6 << 10))) ^ (((v4 - v5 - v6) ^ (v6 << 10)) >> 15);
}

uint64_t MDHashQuick32Pair(int a1, int a2)
{
  int v2 = a1 - a2 - 8;
  unsigned int v3 = (a2 - (a1 - a2) - 1640531527) ^ (v2 << 8);
  unsigned int v4 = (16 - (a1 - a2) - v3) ^ (v3 >> 13);
  int v5 = (v2 - v3 - v4) ^ (v4 >> 12);
  unsigned int v6 = (v3 - v4 - v5) ^ (v5 << 16);
  unsigned int v7 = (v4 - v5 - v6) ^ (v6 >> 5);
  int v8 = (v5 - v6 - v7) ^ (v7 >> 3);
  return (v7 - v8 - ((v6 - v7 - v8) ^ (v8 << 10))) ^ (((v6 - v7 - v8) ^ (v8 << 10)) >> 15);
}

uint64_t MDHashQuick64(uint64_t a1)
{
  int v1 = HIDWORD(a1) - a1 - 8;
  unsigned int v2 = (a1 - (HIDWORD(a1) - a1) - 1640531527) ^ (v1 << 8);
  unsigned int v3 = (16 - (HIDWORD(a1) - a1) - v2) ^ (v2 >> 13);
  int v4 = (v1 - v2 - v3) ^ (v3 >> 12);
  unsigned int v5 = (v2 - v3 - v4) ^ (v4 << 16);
  unsigned int v6 = (v3 - v4 - v5) ^ (v5 >> 5);
  int v7 = (v4 - v5 - v6) ^ (v6 >> 3);
  return (v6 - v7 - ((v5 - v6 - v7) ^ (v7 << 10))) ^ (((v5 - v6 - v7) ^ (v7 << 10)) >> 15);
}

uint64_t MDHashQuickPtrAsInt(uint64_t a1)
{
  int v1 = HIDWORD(a1) - a1 - 8;
  unsigned int v2 = (a1 - (HIDWORD(a1) - a1) - 1640531527) ^ (v1 << 8);
  unsigned int v3 = (16 - (HIDWORD(a1) - a1) - v2) ^ (v2 >> 13);
  int v4 = (v1 - v2 - v3) ^ (v3 >> 12);
  unsigned int v5 = (v2 - v3 - v4) ^ (v4 << 16);
  unsigned int v6 = (v3 - v4 - v5) ^ (v5 >> 5);
  int v7 = (v4 - v5 - v6) ^ (v6 >> 3);
  return (v6 - v7 - ((v5 - v6 - v7) ^ (v7 << 10))) ^ (((v5 - v6 - v7) ^ (v7 << 10)) >> 15);
}

unint64_t MDHash64Quick64(uint64_t a1)
{
  int v1 = HIDWORD(a1) - a1 + 608135808;
  unsigned int v2 = (a1 - (HIDWORD(a1) - a1) + 2046299953) ^ (v1 << 8);
  unsigned int v3 = (-608135800 - (HIDWORD(a1) - a1) - v2) ^ (v2 >> 13);
  int v4 = (v1 - v2 - v3) ^ (v3 >> 12);
  unsigned int v5 = (v2 - v3 - v4) ^ (v4 << 16);
  unsigned int v6 = (v3 - v4 - v5) ^ (v5 >> 5);
  int v7 = (v4 - v5 - v6) ^ (v6 >> 3);
  uint64_t v8 = (v6 - v7 - ((v5 - v6 - v7) ^ (v7 << 10))) ^ (((v5 - v6 - v7) ^ (v7 << 10)) >> 15);
  int v9 = a1 + 608135808 - HIDWORD(a1);
  unsigned int v10 = (HIDWORD(a1) - (v9 + 8) - 1640531527) ^ (v9 << 8);
  unsigned int v11 = (8 - v9 - v10) ^ (v10 >> 13);
  int v12 = (v9 - v10 - v11) ^ (v11 >> 12);
  unsigned int v13 = (v10 - v11 - v12) ^ (v12 << 16);
  unsigned int v14 = (v11 - v12 - v13) ^ (v13 >> 5);
  int v15 = (v12 - v13 - v14) ^ (v14 >> 3);
  return v8 | ((unint64_t)((v14 - v15 - ((v13 - v14 - v15) ^ (v15 << 10))) ^ (((v13 - v14 - v15) ^ (v15 << 10)) >> 15)) << 32);
}

unint64_t MDUHash32(int a1)
{
  unsigned int v1 = (2 * a1 + 2046299953) ^ ((608135808 - a1) << 8);
  unsigned int v2 = (a1 - 608135800 - v1) ^ (v1 >> 13);
  int v3 = (608135808 - a1 - v1 - v2) ^ (v2 >> 12);
  unsigned int v4 = (v1 - v2 - v3) ^ (v3 << 16);
  unsigned int v5 = (v2 - v3 - v4) ^ (v4 >> 5);
  int v6 = (v3 - v4 - v5) ^ (v5 >> 3);
  uint64_t v7 = (v5 - v6 - ((v4 - v5 - v6) ^ (v6 << 10))) ^ (((v4 - v5 - v6) ^ (v6 << 10)) >> 15);
  unsigned int v8 = (2046299953 - a1) ^ ((a1 + 608135808) << 8);
  unsigned int v9 = (-608135800 - a1 - v8) ^ (v8 >> 13);
  int v10 = (a1 + 608135808 - v8 - v9) ^ (v9 >> 12);
  unsigned int v11 = (v8 - v9 - v10) ^ (v10 << 16);
  unsigned int v12 = (v9 - v10 - v11) ^ (v11 >> 5);
  int v13 = (v10 - v11 - v12) ^ (v12 >> 3);
  return v7 | ((unint64_t)((v12 - v13 - ((v11 - v12 - v13) ^ (v13 << 10))) ^ (((v11 - v12 - v13) ^ (v13 << 10)) >> 15)) << 32);
}

unint64_t MDUHash64(uint64_t a1)
{
  int v1 = HIDWORD(a1) - a1 + 608135808;
  unsigned int v2 = (a1 - (HIDWORD(a1) - a1) + 2046299953) ^ (v1 << 8);
  unsigned int v3 = (-608135800 - (HIDWORD(a1) - a1) - v2) ^ (v2 >> 13);
  int v4 = (v1 - v2 - v3) ^ (v3 >> 12);
  unsigned int v5 = (v2 - v3 - v4) ^ (v4 << 16);
  unsigned int v6 = (v3 - v4 - v5) ^ (v5 >> 5);
  int v7 = (v4 - v5 - v6) ^ (v6 >> 3);
  uint64_t v8 = (v6 - v7 - ((v5 - v6 - v7) ^ (v7 << 10))) ^ (((v5 - v6 - v7) ^ (v7 << 10)) >> 15);
  int v9 = a1 + 608135808 - HIDWORD(a1);
  unsigned int v10 = (HIDWORD(a1) - (v9 + 8) - 1640531527) ^ (v9 << 8);
  unsigned int v11 = (8 - v9 - v10) ^ (v10 >> 13);
  int v12 = (v9 - v10 - v11) ^ (v11 >> 12);
  unsigned int v13 = (v10 - v11 - v12) ^ (v12 << 16);
  unsigned int v14 = (v11 - v12 - v13) ^ (v13 >> 5);
  int v15 = (v12 - v13 - v14) ^ (v14 >> 3);
  return v8 | ((unint64_t)((v14 - v15 - ((v13 - v14 - v15) ^ (v15 << 10))) ^ (((v13 - v14 - v15) ^ (v15 << 10)) >> 15)) << 32);
}

unint64_t MDUHashIntPtr(uint64_t a1)
{
  int v1 = HIDWORD(a1) - a1 + 608135808;
  unsigned int v2 = (a1 - (HIDWORD(a1) - a1) + 2046299953) ^ (v1 << 8);
  unsigned int v3 = (-608135800 - (HIDWORD(a1) - a1) - v2) ^ (v2 >> 13);
  int v4 = (v1 - v2 - v3) ^ (v3 >> 12);
  unsigned int v5 = (v2 - v3 - v4) ^ (v4 << 16);
  unsigned int v6 = (v3 - v4 - v5) ^ (v5 >> 5);
  int v7 = (v4 - v5 - v6) ^ (v6 >> 3);
  uint64_t v8 = (v6 - v7 - ((v5 - v6 - v7) ^ (v7 << 10))) ^ (((v5 - v6 - v7) ^ (v7 << 10)) >> 15);
  int v9 = a1 + 608135808 - HIDWORD(a1);
  unsigned int v10 = (HIDWORD(a1) - (v9 + 8) - 1640531527) ^ (v9 << 8);
  unsigned int v11 = (8 - v9 - v10) ^ (v10 >> 13);
  int v12 = (v9 - v10 - v11) ^ (v11 >> 12);
  unsigned int v13 = (v10 - v11 - v12) ^ (v12 << 16);
  unsigned int v14 = (v11 - v12 - v13) ^ (v13 >> 5);
  int v15 = (v12 - v13 - v14) ^ (v14 >> 3);
  return v8 | ((unint64_t)((v14 - v15 - ((v13 - v14 - v15) ^ (v15 << 10))) ^ (((v13 - v14 - v15) ^ (v15 << 10)) >> 15)) << 32);
}

void sub_1000099CC(id a1)
{
  qword_10001A410 = objc_alloc_init(MDPrivateXattrServices);
  qword_10001A418 = (uint64_t)dispatch_queue_create("com.apple.metadata.MDPrivateXattrServices.gImportQueue", 0);
}

id sub_100009B20(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = *(void **)(a1 + 32);
  id v4 = objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:");
  return [v3 setObject:v4 forKey:a2];
}

id sub_100009BD8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _restoreAttributesFromDictionary:a2 intoDictionary:*(void *)(a1 + 40)];
}

int64_t sub_10000A700(id a1, NSDictionary *a2, NSDictionary *a3)
{
  id v4 = [(NSDictionary *)a2 objectForKey:@"mod_date"];
  id v5 = [(NSDictionary *)a3 objectForKey:@"mod_date"];
  return (int64_t)[v4 compare:v5];
}

NSData *__cdecl sub_10000ABAC(id a1, NSUUID *a2, unsigned int a3, unsigned int a4, NSData *a5, int a6)
{
  uint64_t v8 = *(void *)&a4;
  uint64_t v9 = *(void *)&a3;
  id v11 = +[MDKeyRing defaultKeyRing];
  if (a6 == 1)
  {
    return (NSData *)[v11 copyEncryptedData:a5 withKeyUUID:a2 iv1:v9 iv2:v8];
  }
  else
  {
    return (NSData *)[v11 copyDecryptedData:a5 withKeyUUID:a2 iv1:v9 iv2:v8];
  }
}

id copyUpdatedData(uint64_t a1)
{
  uint64_t v1 = __chkstk_darwin(a1);
  uint64_t v155 = v2;
  v156 = v3;
  id v5 = v4;
  char v7 = v6;
  int v9 = v8;
  id v11 = v10;
  uint64_t v13 = v12;
  unsigned int v14 = (void *)v1;
  id v15 = [v10 objectForKey:@"keys"];
  id v16 = [v11 objectForKey:@"values"];
  id v166 = 0;
  unsigned int v17 = &CCCrypt_ptr;
  if (v13)
  {
    id v18 = objc_msgSend(+[MDPrivateXattrServices defaultServices](MDPrivateXattrServices, "defaultServices"), "copyPrivateXattrsFromData:decryptedXids:", v13, &v166);
    if ([v18 count])
    {
      id v19 = objc_alloc((Class)NSMutableDictionary);
      v188[0] = [v18 allKeys];
      v188[1] = [v18 allValues];
      unsigned int v20 = +[NSArray arrayWithObjects:v188 count:2];
      int v21 = v19;
      unsigned int v17 = &CCCrypt_ptr;
      id v22 = [v21 initWithObjects:v20 forKeys:&off_100015990];

      if (v22) {
        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  id v22 = objc_alloc_init((Class)v17[251]);
LABEL_7:
  id v23 = objc_msgSend(+[MDKeyRing defaultKeyRing](MDKeyRing, "defaultKeyRing"), "copyDesignatedKeyUUID");
  id v24 = [v11 objectForKey:@"uuid"];
  id v159 = v23;
  int v157 = v9;
  if (!v9)
  {
    id v74 = [v22 objectForKey:@"uuid"];
    if (!v74 || ![v24 isEqual:v74]) {
      goto LABEL_84;
    }
    id v25 = sub_10000BADC(v22, v15, v16, v7);
LABEL_83:
    if (v25) {
      goto LABEL_85;
    }
    goto LABEL_84;
  }
  id v25 = sub_10000BADC(v22, v15, v16, v7);
  if (qword_10001A438 != -1) {
    dispatch_once(&qword_10001A438, &stru_100014ED0);
  }
  if (![v15 count]
    || !objc_msgSend((id)qword_10001A430, "containsObject:", objc_msgSend(v15, "objectAtIndexedSubscript:", 0)))
  {
    goto LABEL_83;
  }
  id v153 = v24;
  id v26 = [v25 objectForKey:@"keys"];
  id v152 = [v25 objectForKey:@"values"];
  id v151 = [v25 objectForKey:@"mod_date"];
  if (![v15 count]) {
    goto LABEL_144;
  }
  id v27 = [v26 count];
  if (v27 != [v152 count] || !objc_msgSend(v26, "count")) {
    goto LABEL_144;
  }
  v145 = v11;
  v146 = v14;
  id v160 = v25;
  v149 = v26;
  id v28 = [objc_alloc((Class)NSMutableDictionary) initWithObjects:v152 forKeys:v26];
  long long v183 = 0u;
  long long v184 = 0u;
  long long v185 = 0u;
  long long v186 = 0u;
  id v29 = [v15 countByEnumeratingWithState:&v183 objects:v195 count:16];
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = *(void *)v184;
    uint64_t v32 = -1;
LABEL_17:
    uint64_t v33 = 0;
    while (1)
    {
      if (*(void *)v184 != v31) {
        objc_enumerationMutation(v15);
      }
      id v34 = [v28 objectForKeyedSubscript:*(void *)(*((void *)&v183 + 1) + 8 * v33)];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_143;
      }
      id v35 = [v34 count];
      if (v32 == -1)
      {
        uint64_t v32 = (uint64_t)v35;
        if (!v35) {
          goto LABEL_143;
        }
      }
      else if ((id)v32 != v35)
      {
        goto LABEL_143;
      }
      if (v30 == (id)++v33)
      {
        id v30 = [v15 countByEnumeratingWithState:&v183 objects:v195 count:16];
        if (v30) {
          goto LABEL_17;
        }
        break;
      }
    }
  }
  id v36 = objc_msgSend(v28, "objectForKeyedSubscript:", objc_msgSend(v15, "objectAtIndexedSubscript:", 0));
  long long v179 = 0u;
  long long v180 = 0u;
  long long v181 = 0u;
  long long v182 = 0u;
  id v37 = [v36 countByEnumeratingWithState:&v179 objects:v193 count:16];
  if (v37)
  {
    id v38 = v37;
    uint64_t v39 = *(void *)v180;
LABEL_29:
    uint64_t v40 = 0;
    while (1)
    {
      if (*(void *)v180 != v39) {
        objc_enumerationMutation(v36);
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      if (v38 == (id)++v40)
      {
        id v38 = [v36 countByEnumeratingWithState:&v179 objects:v193 count:16];
        if (v38) {
          goto LABEL_29;
        }
        goto LABEL_35;
      }
    }
LABEL_143:

    id v23 = v159;
    id v25 = v160;
    id v11 = v145;
    unsigned int v14 = v146;
    goto LABEL_144;
  }
LABEL_35:
  id v142 = v22;
  v143 = v5;
  v144 = +[NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
  v41 = (char *)[v36 count];
  id v148 = [v36 lastObject];
  id v150 = +[NSMutableSet set];
  id v42 = +[NSMutableDictionary dictionary];
  if (v41)
  {
    id v147 = v36;
    do
    {
      v43 = (NSDate *)[v36 objectAtIndexedSubscript:--v41];
      [v148 timeIntervalSinceDate:v43];
      if (v44 > 0.0)
      {
        if (v44 >= *(double *)"")
        {
          if (v44 >= 2678400.0)
          {
            if (v44 >= 94867200.0) {
              uint64_t v45 = 4;
            }
            else {
              uint64_t v45 = 12;
            }
          }
          else
          {
            uint64_t v45 = 28;
          }
        }
        else
        {
          uint64_t v45 = 60;
        }
        v43 = [(NSCalendar *)v144 dateFromComponents:[(NSCalendar *)v144 components:v45 fromDate:v43]];
      }
      id v46 = +[NSMutableDictionary dictionary];
      long long v175 = 0u;
      long long v176 = 0u;
      long long v177 = 0u;
      long long v178 = 0u;
      id v47 = [v15 countByEnumeratingWithState:&v175 objects:&v191 count:16];
      if (v47)
      {
        id v48 = v47;
        uint64_t v49 = *(void *)v176;
        do
        {
          for (i = 0; i != v48; i = (char *)i + 1)
          {
            if (*(void *)v176 != v49) {
              objc_enumerationMutation(v15);
            }
            id v51 = *(id *)(*((void *)&v175 + 1) + 8 * i);
            id v52 = [v15 objectAtIndexedSubscript:0];
            v53 = v43;
            if (v51 != v52) {
              v53 = (NSDate *)objc_msgSend(objc_msgSend(v28, "objectForKeyedSubscript:", v51), "objectAtIndexedSubscript:", v41);
            }
            [v46 setObject:v53 forKeyedSubscript:v51];
          }
          id v48 = [v15 countByEnumeratingWithState:&v175 objects:&v191 count:16];
        }
        while (v48);
      }
      if (([v150 containsObject:v46] & 1) == 0)
      {
        [v150 addObject:v46];
        long long v173 = 0u;
        long long v174 = 0u;
        long long v171 = 0u;
        long long v172 = 0u;
        id v54 = [v15 countByEnumeratingWithState:&v171 objects:v190 count:16];
        if (v54)
        {
          id v55 = v54;
          uint64_t v56 = *(void *)v172;
          do
          {
            for (j = 0; j != v55; j = (char *)j + 1)
            {
              if (*(void *)v172 != v56) {
                objc_enumerationMutation(v15);
              }
              uint64_t v58 = *(void *)(*((void *)&v171 + 1) + 8 * (void)j);
              id v59 = [v42 objectForKeyedSubscript:v58];
              if (!v59)
              {
                id v59 = +[NSMutableArray array];
                [v42 setObject:v59 forKeyedSubscript:v58];
              }
              objc_msgSend(v59, "addObject:", objc_msgSend(v46, "objectForKeyedSubscript:", v58));
            }
            id v55 = [v15 countByEnumeratingWithState:&v171 objects:v190 count:16];
          }
          while (v55);
        }
      }
      id v36 = v147;
    }
    while (v41);
  }
  id v60 = objc_alloc_init((Class)NSMutableArray);
  id v61 = objc_alloc_init((Class)NSMutableArray);
  long long v167 = 0u;
  long long v168 = 0u;
  long long v169 = 0u;
  long long v170 = 0u;
  id v62 = [v15 countByEnumeratingWithState:&v167 objects:v189 count:16];
  if (v62)
  {
    id v63 = v62;
    uint64_t v64 = *(void *)v168;
    do
    {
      for (k = 0; k != v63; k = (char *)k + 1)
      {
        if (*(void *)v168 != v64) {
          objc_enumerationMutation(v15);
        }
        uint64_t v66 = *(void *)(*((void *)&v167 + 1) + 8 * (void)k);
        id v67 = [v42 objectForKeyedSubscript:v66];
        [v60 addObject:v66];
        objc_msgSend(v61, "addObject:", objc_msgSend(objc_msgSend(v67, "reverseObjectEnumerator"), "allObjects"));
      }
      id v63 = [v15 countByEnumeratingWithState:&v167 objects:v189 count:16];
    }
    while (v63);
  }
  id v68 = [objc_alloc((Class)NSSet) initWithArray:v15];
  v69 = (char *)[v149 count];
  int v9 = v157;
  id v22 = v142;
  if (v69)
  {
    v70 = v69;
    for (m = 0; m != v70; ++m)
    {
      id v72 = [v149 objectAtIndexedSubscript:m];
      if (([v68 containsObject:v72] & 1) == 0)
      {
        [v60 addObject:v72];
        objc_msgSend(v61, "addObject:", objc_msgSend(v152, "objectAtIndexedSubscript:", m));
      }
    }
  }
  id v73 = objc_alloc_init((Class)NSMutableDictionary);
  [v73 setObject:v60 forKeyedSubscript:@"keys"];
  [v73 setObject:v61 forKeyedSubscript:@"values"];

  id v23 = v159;
  id v25 = v160;
  id v5 = v143;
  id v11 = v145;
  unsigned int v14 = v146;
  if (v73)
  {
    [v73 setObject:v151 forKey:@"mod_date"];
    goto LABEL_145;
  }
LABEL_144:
  id v73 = [v25 copy];
LABEL_145:

  id v25 = v73;
  id v24 = v153;
  if (!v25)
  {
LABEL_84:
    id v25 = [v11 mutableCopy];
    [v25 removeObjectForKey:@"uuid"];
    objc_msgSend(v25, "setObject:forKey:", +[NSDate date](NSDate, "date"), @"mod_date");
  }
LABEL_85:
  id v161 = v25;

  memset(v193, 0, sizeof(v193));
  int v194 = 0;
  if (v9) {
    id v75 = v23;
  }
  else {
    id v75 = v24;
  }
  unint64_t v192 = 0;
  unint64_t v191 = 0;
  [v14 digestUUIDBytesWithKey:v23 forUUID:v75 uuidBytes:&v191];
  _MDLabelUUIDEncode(v191, v192, (uint64_t)v193);
  id v76 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"%s%s", "com.apple.metadata:kMDLabel_", v193);
  *id v5 = v76;
  [v76 UTF8String];
  id v77 = objc_alloc((Class)NSMutableArray);
  id v78 = objc_msgSend(v77, "initWithCapacity:", objc_msgSend(v166, "count"));
  long long v162 = 0u;
  long long v163 = 0u;
  long long v164 = 0u;
  long long v165 = 0u;
  id v79 = v166;
  id v80 = [v166 countByEnumeratingWithState:&v162 objects:v187 count:16];
  if (v80)
  {
    id v81 = v80;
    uint64_t v82 = *(void *)v163;
    do
    {
      for (n = 0; n != v81; n = (char *)n + 1)
      {
        if (*(void *)v163 != v82) {
          objc_enumerationMutation(v79);
        }
        v84 = *(void **)(*((void *)&v162 + 1) + 8 * (void)n);
        if ([v84 hasPrefix:@"com.apple.metadata:kMDLabel_"])
        {
          id v85 = v84;
LABEL_97:
          v90 = v85;
          goto LABEL_99;
        }
        if ([v84 hasPrefix:@"com.apple.metadata"])
        {
          id v86 = v78;
          v87 = v5;
          id v88 = objc_alloc((Class)NSString);
          id v141 = [v84 substringFromIndex:19];
          v89 = v88;
          id v5 = v87;
          id v78 = v86;
          id v85 = [v89 initWithFormat:@"%s%@", "com.apple.metadata:kMDLabel_", v141];
          goto LABEL_97;
        }
        v90 = 0;
LABEL_99:
        if (([v90 isEqual:*v5] & 1) == 0) {
          [v78 addObject:v90];
        }
      }
      id v81 = [v79 countByEnumeratingWithState:&v162 objects:v187 count:16];
    }
    while (v81);
  }

  v91 = v25;
  if (!objc_msgSend(objc_msgSend(v25, "objectForKey:", @"keys"), "count"))
  {
    [v78 addObject:*v5];
    id v110 = 0;
    v106 = v159;
    goto LABEL_139;
  }
  bzero(v195, 0x2000uLL);
  if (v157) {
    char v92 = -14;
  }
  else {
    char v92 = -15;
  }
  uint64_t v93 = arc4random();
  uint64_t v94 = arc4random();
  uint64_t v95 = v94;
  v189[0] = 0;
  if (v157)
  {
    v96 = (int *)sub_10000CC80(v25, (uint64_t)v195, 0x2000uLL, v189);
    if (!v96)
    {
      v97 = malloc_type_malloc(0x10000uLL, 0xEB9CD638uLL);
      v96 = (int *)sub_10000CC80(v25, (uint64_t)v97, 0x10000uLL, v189);
      if (!v96) {
        sub_10000F808(0, v98, v99, v100, v101, v102, v103, v104);
      }
    }
    uint64_t v105 = v189[0];
    v106 = v159;
    if (v189[0]) {
      goto LABEL_111;
    }
LABEL_127:
    if (v96 != (int *)v195) {
      free(v96);
    }
    goto LABEL_133;
  }
  unsigned int v154 = v94;
  char v158 = v92;
  uint64_t v111 = v93;
  id v112 = [v25 objectForKey:@"uuid"];
  id v113 = [v25 objectForKey:@"keys"];
  id v114 = [v25 objectForKey:@"values"];
  uint64_t v115 = (uint64_t)[v113 count];
  id v116 = [v114 count];
  size_t v117 = 24 * v115 + 20;
  if (v117 <= 0x2000)
  {
    v118 = &v196;
    v96 = (int *)v195;
  }
  else
  {
    v96 = (int *)malloc_type_malloc(v117, 0xCB951BACuLL);
    v118 = v96 + 1;
  }
  int *v96 = 1279345228;
  v190[0] = v118;
  uint64_t v119 = sub_10000CEF4(v112, v190);
  if (!v119) {
    sub_10000F844(v119, v120, v121, v122, v123, v124, v125, v126);
  }
  if (v115 >= 1)
  {
    for (uint64_t ii = 0; ii != v115; ++ii)
    {
      if (sub_10000CEF4([v113 objectAtIndex:ii], v190))
      {
        CFAbsoluteTime AbsoluteTime = 0.0;
        if (ii < (uint64_t)v116)
        {
          id v129 = [v114 objectAtIndex:ii];
          CFTypeID v130 = CFGetTypeID(v129);
          if (v130 == CFDateGetTypeID()) {
            CFAbsoluteTime AbsoluteTime = CFDateGetAbsoluteTime((CFDateRef)v129);
          }
        }
        uint64_t v131 = v190[0];
        *(CFAbsoluteTime *)v190[0] = AbsoluteTime;
        v190[0] = v131 + 8;
      }
    }
  }
  uint64_t v105 = v190[0] - (void)v96;
  v189[0] = v190[0] - (void)v96;
  v106 = v159;
  v91 = v161;
  uint64_t v93 = v111;
  char v92 = v158;
  uint64_t v95 = v154;
  if (v190[0] == (void)v96) {
    goto LABEL_127;
  }
LABEL_111:
  id v107 = objc_alloc((Class)NSData);
  uint64_t v108 = v105 + 9;
  if (v96 == (int *)v195) {
    id v109 = [v107 initWithBytes:v195 length:v108];
  }
  else {
    id v109 = [v107 initWithBytesNoCopy:v96 length:v108 freeWhenDone:1];
  }
  v132 = v109;
  v133 = (void *)(*(uint64_t (**)(uint64_t, void *, uint64_t, uint64_t, id, uint64_t))(v155 + 16))(v155, v106, v93, v95, v109, 1);

  if (!v133)
  {
LABEL_133:
    id v110 = 0;
    goto LABEL_139;
  }
  v134 = (char *)[v133 length];
  v135 = v134 + 9;
  if ((unint64_t)(v134 + 9) <= 0x2000)
  {
    v137 = v197;
    v136 = v195;
  }
  else
  {
    v136 = malloc_type_malloc((size_t)(v134 + 9), 0x6D1169EFuLL);
    v137 = v136 + 9;
  }
  unsigned char *v136 = v92;
  *(_DWORD *)(v136 + 1) = v93;
  *(_DWORD *)(v136 + 5) = v95;
  memcpy(v137, [v133 bytes], (size_t)objc_msgSend(v133, "length"));
  id v138 = objc_alloc((Class)NSData);
  if (v136 == v195) {
    id v139 = [v138 initWithBytes:v195 length:v135];
  }
  else {
    id v139 = [v138 initWithBytesNoCopy:v136 length:v135 freeWhenDone:1];
  }
  id v110 = v139;
  v106 = v159;
  v91 = v161;

LABEL_139:
  if ([v78 count]) {
    void *v156 = v78;
  }
  else {

  }
  return v110;
}

id sub_10000BADC(void *a1, void *a2, void *a3, char a4)
{
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  id v9 = [a1 objectForKey:@"keys"];
  id v10 = [a1 objectForKey:@"values"];
  id v11 = +[NSMutableArray arrayWithCapacity:0];
  uint64_t v12 = +[NSMutableArray arrayWithCapacity:0];
  id v13 = [a2 mutableCopy];
  id v14 = [a3 mutableCopy];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000C95C;
  v17[3] = &unk_100014E88;
  v17[4] = v13;
  v17[5] = v14;
  char v18 = a4;
  v17[6] = v10;
  v17[7] = v11;
  v17[8] = v12;
  [v9 enumerateObjectsUsingBlock:v17];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000CB24;
  v16[3] = &unk_100014EB0;
  v16[4] = v14;
  v16[5] = v11;
  v16[6] = v12;
  [v13 enumerateObjectsUsingBlock:v16];

  [v8 setObject:v11 forKey:@"keys"];
  [v8 setObject:v12 forKey:@"values"];
  objc_msgSend(v8, "setObject:forKey:", +[NSDate date](NSDate, "date"), @"mod_date");
  return v8;
}

id sub_10000BF60(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  memset(v9, 0, sizeof(v9));
  int v10 = 0;
  unint64_t v7 = 0;
  unint64_t v8 = 0;
  [a1 digestUUIDBytesWithKey:a2 forUUID:a3 uuidBytes:&v7];
  _MDLabelUUIDEncode(v7, v8, (uint64_t)v9);
  return [a4 setObject:a2, +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.metadata.%s", v9) forKey];
}

uint64_t sub_10000C26C(void *a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  id v5 = (void *)a1[6];
  memset(v9, 0, sizeof(v9));
  int v10 = 0;
  unint64_t v7 = 0;
  unint64_t v8 = 0;
  [v3 digestUUIDBytesWithKey:v4 forXPCUUID:a3 uuidBytes:&v7];
  _MDLabelUUIDEncode(v7, v8, (uint64_t)v9);
  [v5 setObject:v4, +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"com.apple.metadata.%s", v9) forKey];
  return 1;
}

void sub_10000C4CC(id a1)
{
  CFUUIDRef v1 = CFUUIDGetConstantUUIDWithBytes(kCFAllocatorSystemDefault, 0xFEu, 0x65u, 0x61u, 0x5Bu, 0xFu, 0xF3u, 0x4Eu, 0x3Du, 0xBBu, 0x10u, 0xA7u, 0xACu, 0x81u, 0x62u, 0x22u, 0x6Eu);
  CFUUIDBytes v2 = CFUUIDGetUUIDBytes(v1);
  qword_10001A420 = (uint64_t)[objc_alloc((Class)NSUUID) initWithUUIDBytes:&v2];
}

void sub_10000C554(uint64_t a1, void *a2, unint64_t a3, unint64_t a4)
{
  if (!(a3 | a4))
  {
    (*(void (**)(void, id))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), [objc_alloc((Class)NSError) initWithDomain:NSPOSIXErrorDomain code:32 userInfo:0]);
    goto LABEL_24;
  }
  if ([(id)a3 length] && objc_msgSend(a2, "length"))
  {
    int v8 = *(_DWORD *)(a1 + 56);
    id v9 = (const char *)[a2 UTF8String];
    if ([(id)a3 length])
    {
      id v10 = [(id)a3 bytes];
      id v11 = [(id)a3 length];
      if (!strcmp(v9, "com.apple.metadata:kMDItemIsShared"))
      {
        id v13 = "com.apple.metadata:kMDItemIsShared#PS";
      }
      else
      {
        if (strcmp(v9, "com.apple.metadata:kMDItemSharedItemCurrentUserRole"))
        {
          int v12 = v8;
          id v13 = v9;
LABEL_13:
          fsetxattr(v12, v13, v10, (size_t)v11, 0, 0);
          goto LABEL_14;
        }
        id v13 = "com.apple.metadata:kMDItemSharedItemCurrentUserRole#PS";
      }
      int v12 = v8;
      goto LABEL_13;
    }
    fremovexattr(v8, v9, 0);
  }
LABEL_14:
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v14 = [(id)a4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation((id)a4);
        }
        char v18 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (([a2 isEqual:v18] & 1) == 0) {
          fremovexattr(*(_DWORD *)(a1 + 56), (const char *)[v18 UTF8String], 0);
        }
      }
      id v15 = [(id)a4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v15);
  }
  (*(void (**)(void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), 0);
LABEL_24:
  close(*(_DWORD *)(a1 + 56));
}

void sub_10000C81C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v7 = copyUpdatedData(*(void *)(a1 + 32));
  (*(void (**)(uint64_t, void, id))(a6 + 16))(a6, 0, v7);
}

NSData *__cdecl sub_10000C8B4(id a1, NSUUID *a2, unsigned int a3, unsigned int a4, NSData *a5, int a6)
{
  uint64_t v8 = *(void *)&a4;
  uint64_t v9 = *(void *)&a3;
  id v11 = +[MDKeyRing defaultKeyRing];
  if (a6 == 1)
  {
    return (NSData *)[v11 copyEncryptedData:a5 withKeyUUID:a2 iv1:v9 iv2:v8];
  }
  else
  {
    return (NSData *)[v11 copyDecryptedData:a5 withKeyUUID:a2 iv1:v9 iv2:v8];
  }
}

CFNullRef sub_10000C95C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = [*(id *)(a1 + 32) indexOfObject:a2];
  if (v6 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    CFNullRef result = (const __CFNull *)[*(id *)(a1 + 48) objectAtIndex:a3];
    if (result != kCFNull)
    {
      CFNullRef v8 = result;
      [*(id *)(a1 + 56) addObject:a2];
      uint64_t v9 = *(void **)(a1 + 64);
      return (const __CFNull *)[v9 addObject:v8];
    }
  }
  else
  {
    id v10 = v6;
    CFNullRef v11 = (const __CFNull *)[*(id *)(a1 + 40) objectAtIndex:v6];
    if (v11 != kCFNull)
    {
      int v12 = (NSArray *)v11;
      if (*(unsigned char *)(a1 + 72))
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v13 = (NSArray *)[*(id *)(a1 + 48) objectAtIndex:a3];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v14 = v13;
          }
          else
          {
            id v15 = v13;
            id v14 = +[NSArray arrayWithObjects:&v15 count:1];
          }
          int v12 = [(NSArray *)v14 arrayByAddingObjectsFromArray:v12];
        }
      }
      [*(id *)(a1 + 56) addObject:a2];
      [*(id *)(a1 + 64) addObject:v12];
    }
    [*(id *)(a1 + 32) removeObjectAtIndex:v10];
    return (const __CFNull *)[*(id *)(a1 + 40) removeObjectAtIndex:v10];
  }
  return result;
}

CFNullRef sub_10000CB24(uint64_t a1, uint64_t a2)
{
  CFNullRef result = (const __CFNull *)objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:");
  if (result != kCFNull)
  {
    CFNullRef v5 = result;
    [*(id *)(a1 + 40) addObject:a2];
    id v6 = *(void **)(a1 + 48);
    return (const __CFNull *)[v6 addObject:v5];
  }
  return result;
}

void sub_10000CBA4(id a1)
{
  v1[0] = @"kMDItemUserSharedSentDate";
  v1[1] = @"kMDItemUserSharedReceivedDate";
  v1[2] = @"kMDItemUserPrintedDate";
  v1[3] = @"kMDItemUserDownloadedDate";
  v1[4] = @"kMDItemUserModifiedDate";
  v1[5] = @"kMDItemUserCreatedDate";
  qword_10001A430 = (uint64_t)objc_msgSend(objc_alloc((Class)NSSet), "initWithArray:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v1, 6));
}

uint64_t sub_10000CC80(void *a1, uint64_t a2, unint64_t a3, void *a4)
{
  if (qword_10001A448 != -1) {
    dispatch_once(&qword_10001A448, &stru_100014EF0);
  }
  id v7 = [a1 objectForKey:@"keys"];
  id v8 = [a1 objectForKey:@"values"];
  CFStringRef v19 = (const __CFString *)[a1 objectForKey:@"mod_date"];
  id v9 = [v7 count];
  id v10 = [v7 count];
  if ((uint64_t)v9 >= (uint64_t)v10) {
    uint64_t v11 = (uint64_t)v10;
  }
  else {
    uint64_t v11 = (uint64_t)v9;
  }
  unint64_t v20 = 0;
  if (v11 >= 1)
  {
    uint64_t v12 = 0;
    do
    {
      CFStringRef v13 = (const __CFString *)[v7 objectAtIndex:v12];
      uint64_t v14 = qword_10001A440;
      if (v14 == CFGetTypeID(v13))
      {
        CFNullRef v15 = (const __CFNull *)[v8 objectAtIndex:v12];
        if (v15 != kCFNull)
        {
          CFStringRef v16 = (const __CFString *)v15;
          if (!sub_10000CF84(a2, &v20, a3, v13) || !sub_10000D1F0(a2, &v20, a3, v16)) {
            return 0;
          }
        }
      }
    }
    while (v11 != ++v12);
  }
  if (!sub_10000CF84(a2, &v20, a3, @"mod_date") || !sub_10000D1F0(a2, &v20, a3, v19)) {
    return 0;
  }
  *a4 = v20;
  return a2;
}

void sub_10000CE34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  v9[0] = 0;
  v9[1] = &a9;
  vasprintf((char **)v9, "%s:%u: failed assertion '%s' %s ", &a9);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v11 = v9[0];
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
  }
  free(v9[0]);
}

uint64_t sub_10000CEF4(void *a1, void *a2)
{
  CFTypeID v4 = CFGetTypeID(a1);
  if (v4 == CFUUIDGetTypeID())
  {
    CFUUIDBytes v6 = CFUUIDGetUUIDBytes((CFUUIDRef)a1);
    uint64_t v5 = *(void *)&v6.byte0;
    *(CFUUIDBytes *)a2 = v6;
LABEL_5:
    *a2 = v5 + 16;
    return 1;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [a1 getUUIDBytes:*a2];
    uint64_t v5 = *a2;
    goto LABEL_5;
  }
  return 0;
}

uint64_t sub_10000CF84(uint64_t a1, unint64_t *a2, unint64_t a3, const __CFString *key)
{
  unint64_t v4 = *a2;
  if (*a2 >= a3) {
    return 0;
  }
  CFStringRef Value = CFDictionaryGetValue((CFDictionaryRef)qword_10001A468, key);
  if (!Value)
  {
    *(unsigned char *)(a1 + v4) = 1;
    CFIndex Length = CFStringGetLength(key);
    CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
    CFIndex v15 = MaximumSizeForEncoding + 1;
    if (MaximumSizeForEncoding < 1024) {
      CFStringRef v16 = v24;
    }
    else {
      CFStringRef v16 = (char *)malloc_type_malloc(MaximumSizeForEncoding + 1, 0x8BA2A102uLL);
    }
    unint64_t v17 = v4 + 1;
    bzero(v24, 0x400uLL);
    if (!CFStringGetCString(key, v16, v15, 0x8000100u)) {
      *CFStringRef v16 = 0;
    }
    size_t v18 = strlen(v16) + 1;
    unint64_t v19 = v18 + v17;
    if (v18 + v17 < a3)
    {
      memcpy((void *)(a1 + v17), v16, v18);
      if (v16 != v24) {
        free(v16);
      }
      *a2 = v19;
      return 1;
    }
    if (v16 != v24) {
      free(v16);
    }
    return 0;
  }
  unint64_t v10 = *a2;
  if (*a2 >= a3) {
    return 0;
  }
  unint64_t v11 = v10 + 1;
  *(unsigned char *)(a1 + v10) = 4;
  if (Value >= 0x80)
  {
    if (Value >= 0x4000)
    {
      uint64_t v20 = 4;
      if (Value >> 28) {
        uint64_t v20 = 5;
      }
      if (Value < 0x200000) {
        uint64_t v20 = 3;
      }
      if (v11 + v20 < a3)
      {
        if (Value >> 21)
        {
          if (Value >> 28)
          {
            *(unsigned char *)(a1 + v11) = -16;
            *(_DWORD *)(v10 + a1 + 2) = Value;
            unint64_t v12 = v10 + 6;
          }
          else
          {
            *(unsigned char *)(a1 + v11) = BYTE3(Value) | 0xE0;
            id v23 = (unsigned char *)(v10 + a1);
            v23[2] = BYTE2(Value);
            v23[3] = BYTE1(Value);
            unint64_t v12 = v10 + 5;
            v23[4] = (_BYTE)Value;
          }
        }
        else
        {
          *(unsigned char *)(a1 + v11) = BYTE2(Value) | 0xC0;
          uint64_t v21 = v10 + a1;
          *(unsigned char *)(v21 + 2) = BYTE1(Value);
          unint64_t v12 = v10 + 4;
          *(unsigned char *)(v21 + 3) = (_BYTE)Value;
        }
        goto LABEL_32;
      }
    }
    else
    {
      unint64_t v12 = v10 + 3;
      if (v10 + 3 < a3)
      {
        *(unsigned char *)(a1 + v11) = BYTE1(Value) | 0x80;
        *(unsigned char *)(v10 + a1 + 2) = (_BYTE)Value;
        goto LABEL_32;
      }
    }
    return 0;
  }
  unint64_t v12 = v10 + 2;
  if (v10 + 2 >= a3) {
    return 0;
  }
  *(unsigned char *)(a1 + v11) = (_BYTE)Value;
LABEL_32:
  *a2 = v12;
  return 1;
}

uint64_t sub_10000D1F0(uint64_t a1, unint64_t *a2, unint64_t a3, const __CFString *a4)
{
  CFTypeID v8 = CFGetTypeID(a4);
  if (qword_10001A440 != v8)
  {
    if (qword_10001A450 == v8)
    {
      unint64_t v10 = *a2;
      if (*a2 < a3)
      {
        *(unsigned char *)(a1 + v10) = 5;
        double AbsoluteTime = CFDateGetAbsoluteTime((CFDateRef)a4);
        unint64_t v12 = v10 + 9;
        if (v10 + 9 < a3)
        {
          *(double *)(v10 + a1 + 1) = AbsoluteTime;
LABEL_9:
          *a2 = v12;
          return 1;
        }
      }
    }
    else if (qword_10001A458 == v8)
    {
      unint64_t v14 = *a2;
      if (*a2 < a3)
      {
        unint64_t v15 = v14 + 1;
        *(unsigned char *)(a1 + v14) = 2;
        *a2 = v14 + 1;
        unsigned int Count = CFArrayGetCount((CFArrayRef)a4);
        if (Count >= 0x80)
        {
          if (Count >= 0x4000)
          {
            uint64_t v29 = 4;
            if (Count >> 28) {
              uint64_t v29 = 5;
            }
            if (Count < 0x200000) {
              uint64_t v29 = 3;
            }
            if (v29 + v15 >= a3) {
              return 0;
            }
            if (Count >> 21)
            {
              if (Count >> 28)
              {
                *(unsigned char *)(a1 + v15) = -16;
                *(_DWORD *)(v14 + a1 + 2) = Count;
                uint64_t v27 = v14 + 6;
              }
              else
              {
                *(unsigned char *)(a1 + v15) = HIBYTE(Count) | 0xE0;
                id v34 = (unsigned char *)(v14 + a1);
                v34[2] = BYTE2(Count);
                v34[3] = BYTE1(Count);
                uint64_t v27 = v14 + 5;
                v34[4] = Count;
              }
            }
            else
            {
              *(unsigned char *)(a1 + v15) = BYTE2(Count) | 0xC0;
              unint64_t v30 = v14 + a1;
              *(unsigned char *)(v30 + 2) = BYTE1(Count);
              uint64_t v27 = v14 + 4;
              *(unsigned char *)(v30 + 3) = Count;
            }
          }
          else
          {
            uint64_t v27 = v14 + 3;
            if (v14 + 3 >= a3) {
              return 0;
            }
            *(unsigned char *)(a1 + v15) = BYTE1(Count) | 0x80;
            *(unsigned char *)(v14 + a1 + 2) = Count;
          }
          uint64_t valuePtr = v27;
        }
        else
        {
          unint64_t v12 = v14 + 2;
          if (v14 + 2 >= a3) {
            return 0;
          }
          *(unsigned char *)(a1 + v15) = Count;
          uint64_t valuePtr = v14 + 2;
          if (!Count) {
            goto LABEL_9;
          }
        }
        CFIndex v36 = 0;
        uint64_t v37 = Count;
        while (1)
        {
          ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a4, v36);
          if ((sub_10000D1F0(a1, &valuePtr, a3, ValueAtIndex) & 1) == 0) {
            break;
          }
          if (v37 == ++v36)
          {
            unint64_t v12 = valuePtr;
            goto LABEL_9;
          }
        }
      }
    }
    else if (qword_10001A478 == v8)
    {
      unint64_t v17 = *a2;
      if (*a2 < a3)
      {
        unint64_t Length = CFDataGetLength((CFDataRef)a4);
        size_t v19 = Length;
        if (Length >= 0x80)
        {
          if (Length >= 0x4000)
          {
            if (Length >= 0x200000)
            {
              if (Length >> 28)
              {
                unint64_t v39 = Length >> 35;
                unint64_t v40 = Length >> 42;
                uint64_t v41 = 7;
                unint64_t v42 = Length >> 49;
                uint64_t v43 = 8;
                if (HIBYTE(Length)) {
                  uint64_t v43 = 9;
                }
                if (v42) {
                  uint64_t v41 = v43;
                }
                if (!v40) {
                  uint64_t v41 = 6;
                }
                if (!v39) {
                  uint64_t v41 = 5;
                }
                unint64_t v44 = v17 + 1;
                if (Length + v41 + v17 + 1 >= a3) {
                  return 0;
                }
                *(unsigned char *)(a1 + v17) = 6;
                if (v39)
                {
                  if (v40)
                  {
                    if (v42)
                    {
                      unint64_t v53 = v17 + 2;
                      if (HIBYTE(Length))
                      {
                        *(unsigned char *)(a1 + v44) = -1;
                        *(void *)(a1 + v53) = Length;
                        unint64_t v20 = v17 + 10;
                      }
                      else
                      {
                        *(unsigned char *)(a1 + v44) = -2;
                        uint64x2_t v54 = (uint64x2_t)vdupq_n_s64(Length);
                        int16x8_t v55 = (int16x8_t)vshlq_u64(v54, (uint64x2_t)xmmword_1000119C0);
                        *(int32x2_t *)v54.i8 = vmovn_s64((int64x2_t)vshlq_u64(v54, (uint64x2_t)xmmword_1000119D0));
                        *(int32x2_t *)v55.i8 = vmovn_s64((int64x2_t)v55);
                        v55.i16[1] = v55.i16[2];
                        v55.i16[2] = v54.i16[0];
                        v55.i16[3] = v54.i16[2];
                        *(_DWORD *)(a1 + v53) = vmovn_s16(v55).u32[0];
                        uint64_t v56 = (unsigned char *)(v17 + a1);
                        v56[6] = BYTE2(Length);
                        v56[7] = BYTE1(Length);
                        unint64_t v20 = v17 + 9;
                        v56[8] = Length;
                      }
                    }
                    else
                    {
                      *(unsigned char *)(a1 + v44) = BYTE6(Length) | 0xFC;
                      uint64x2_t v49 = (uint64x2_t)vdupq_n_s64(Length);
                      int32x2_t v50 = vmovn_s64((int64x2_t)vshlq_u64(v49, (uint64x2_t)xmmword_1000119F0));
                      int16x8_t v51 = (int16x8_t)vshlq_u64(v49, (uint64x2_t)xmmword_1000119E0);
                      *(int32x2_t *)v51.i8 = vmovn_s64((int64x2_t)v51);
                      v51.i16[1] = v51.i16[2];
                      v51.i16[2] = v50.i16[0];
                      v51.i16[3] = v50.i16[2];
                      unint64_t v52 = v17 + a1;
                      *(_DWORD *)(v52 + 2) = vmovn_s16(v51).u32[0];
                      *(unsigned char *)(v52 + 6) = BYTE1(Length);
                      unint64_t v20 = v17 + 8;
                      *(unsigned char *)(v52 + 7) = Length;
                    }
                  }
                  else
                  {
                    *(unsigned char *)(a1 + v44) = BYTE5(Length) | 0xF8;
                    uint64x2_t v46 = (uint64x2_t)vdupq_n_s64(Length);
                    int16x8_t v47 = (int16x8_t)vshlq_u64(v46, (uint64x2_t)xmmword_1000119D0);
                    unint64_t v48 = v17 + a1;
                    *(int32x2_t *)v46.i8 = vmovn_s64((int64x2_t)vshlq_u64(v46, (uint64x2_t)xmmword_100011A00));
                    *(int32x2_t *)v47.i8 = vmovn_s64((int64x2_t)v47);
                    v47.i16[1] = v47.i16[2];
                    v47.i16[2] = v46.i16[0];
                    v47.i16[3] = v46.i16[2];
                    *(_DWORD *)(v48 + 2) = vmovn_s16(v47).u32[0];
                    unint64_t v20 = v17 + 7;
                    *(unsigned char *)(v48 + 6) = Length;
                  }
                }
                else
                {
                  *(unsigned char *)(a1 + v44) = BYTE4(Length) | 0xF0;
                  uint64_t v45 = (unsigned char *)(v17 + a1);
                  v45[2] = BYTE3(Length);
                  v45[3] = BYTE2(Length);
                  v45[4] = BYTE1(Length);
                  unint64_t v20 = v17 + 6;
                  v45[5] = Length;
                }
              }
              else
              {
                if (Length + v17 + 1 + 4 >= a3) {
                  return 0;
                }
                id v35 = (unsigned char *)(a1 + v17);
                *id v35 = 6;
                *(unsigned char *)(a1 + v17 + 1) = BYTE3(Length) | 0xE0;
                v35[2] = BYTE2(Length);
                v35[3] = BYTE1(Length);
                unint64_t v20 = v17 + 5;
                v35[4] = Length;
              }
            }
            else
            {
              unint64_t v20 = v17 + 4;
              if (v17 + 4 + Length >= a3) {
                return 0;
              }
              uint64_t v31 = (unsigned char *)(a1 + v17);
              *uint64_t v31 = 6;
              v31[1] = BYTE2(Length) | 0xC0;
              v31[2] = BYTE1(Length);
              v31[3] = Length;
            }
          }
          else
          {
            unint64_t v20 = v17 + 3;
            if (v17 + 3 + Length >= a3) {
              return 0;
            }
            id v28 = (unsigned char *)(a1 + v17);
            *id v28 = 6;
            v28[1] = BYTE1(Length) | 0x80;
            v28[2] = Length;
          }
        }
        else
        {
          unint64_t v20 = v17 + 2;
          if (Length + v17 + 2 >= a3) {
            return 0;
          }
          uint64_t v21 = (unsigned char *)(a1 + v17);
          *uint64_t v21 = 6;
          v21[1] = Length;
        }
        BytePtr = CFDataGetBytePtr((CFDataRef)a4);
        memcpy((void *)(a1 + v20), BytePtr, v19);
        unint64_t v12 = v20 + v19;
        goto LABEL_9;
      }
    }
    else
    {
      unint64_t v22 = *a2;
      if (qword_10001A460 == v8)
      {
        BOOL v13 = v22 + 10 < a3;
        if (v22 + 10 < a3)
        {
          int IsFloatType = CFNumberIsFloatType((CFNumberRef)a4);
          char v24 = IsFloatType;
          if (IsFloatType)
          {
            uint64_t valuePtr = 0x7FF8000000000000;
            CFNumberRef v25 = (const __CFNumber *)a4;
            CFNumberType v26 = kCFNumberFloat64Type;
          }
          else
          {
            uint64_t valuePtr = 0;
            CFNumberRef v25 = (const __CFNumber *)a4;
            CFNumberType v26 = kCFNumberSInt64Type;
          }
          CFNumberGetValue(v25, v26, &valuePtr);
          uint64_t v32 = valuePtr;
          unint64_t v33 = a1 + v22;
          *(unsigned char *)unint64_t v33 = 7;
          *(unsigned char *)(v33 + 1) = v24;
          *(void *)(v33 + 2) = v32;
          *a2 = v22 + 10;
        }
        return v13;
      }
      if (v22 < a3)
      {
        unint64_t v12 = v22 + 1;
        *(unsigned char *)(a1 + v22) = 3;
        goto LABEL_9;
      }
    }
    return 0;
  }
  return sub_10000CF84(a1, a2, a3, a4);
}

void sub_10000D7F4(id a1)
{
  qword_10001A440 = CFStringGetTypeID();
  qword_10001A450 = CFDateGetTypeID();
  qword_10001A458 = CFArrayGetTypeID();
  CFNullGetTypeID();
  qword_10001A460 = CFNumberGetTypeID();
  qword_10001A468 = (uint64_t)CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, 0);
  qword_10001A470 = (uint64_t)CFDictionaryCreateMutable(kCFAllocatorDefault, 0, 0, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_10001A468, @"kMDItemOriginApplicationIdentifier", (const void *)1);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_10001A470, (const void *)1, @"kMDItemOriginApplicationIdentifier");
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_10001A468, @"kMDItemOriginSenderHandle", (const void *)2);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_10001A470, (const void *)2, @"kMDItemOriginSenderHandle");
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_10001A468, @"kMDItemOriginSenderDisplayName", (const void *)3);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_10001A470, (const void *)3, @"kMDItemOriginSenderDisplayName");
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_10001A468, @"kMDItemOriginSubject", (const void *)4);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_10001A470, (const void *)4, @"kMDItemOriginSubject");
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_10001A468, @"kMDItemDestinationRecipients", (const void *)5);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_10001A470, (const void *)5, @"kMDItemDestinationRecipients");
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_10001A468, @"kMDItemOriginMessageID", (const void *)6);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_10001A470, (const void *)6, @"kMDItemOriginMessageID");
  qword_10001A478 = CFDataGetTypeID();
}

uint64_t sub_10000D9AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v8 = [objc_alloc((Class)NSData) initWithBytesNoCopy:a4 + 9 length:a5 - 9 freeWhenDone:0];
  uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t, void, void, id, void))(a1 + 16))(a1, a3, *(unsigned int *)(a2 + 1), *(unsigned int *)(a2 + 5), v8, 0);

  return v9;
}

__CFArray *sub_10000DA3C(uint64_t a1, unint64_t *a2, unint64_t a3)
{
  unint64_t v4 = *a2;
  unint64_t v33 = v4;
  if (v4 >= a3)
  {
LABEL_67:
    Mutable = 0;
  }
  else
  {
    unint64_t v6 = v4 + 1;
    unint64_t v33 = v4 + 1;
    switch(*(unsigned char *)(a1 + v4))
    {
      case 1:
        id v8 = (const char *)(a1 + v6);
        if (v6 <= a3) {
          uint64_t v9 = a3;
        }
        else {
          uint64_t v9 = v4 + 1;
        }
        break;
      case 2:
        if (v6 >= a3) {
          goto LABEL_67;
        }
        if (*(char *)(a1 + v6) < 0)
        {
          unsigned int v23 = *(unsigned __int8 *)(a1 + v6);
          if (v23 >= 0xC0)
          {
            if (v23 >= 0xE0)
            {
              BOOL v25 = v23 >= 0xF0;
              uint64_t v13 = 4;
              if (v25) {
                uint64_t v13 = 5;
              }
            }
            else
            {
              uint64_t v13 = 3;
            }
          }
          else
          {
            uint64_t v13 = 2;
          }
        }
        else
        {
          uint64_t v13 = 1;
        }
        if (v13 + v6 >= a3) {
          goto LABEL_67;
        }
        Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
        int v26 = sub_10000DDFC(a1, (uint64_t *)&v33);
        if (v26)
        {
          int v27 = v26;
          do
          {
            id v28 = (const void *)sub_10000DA3C(a1, &v33, a3);
            if (v28)
            {
              uint64_t v29 = v28;
              CFArrayAppendValue(Mutable, v28);
              CFRelease(v29);
            }
            --v27;
          }
          while (v27);
        }
        goto LABEL_68;
      case 3:
        goto LABEL_52;
      case 4:
        uint64_t v14 = v4 + 2;
        int v15 = *(char *)(a1 + v6);
        unsigned int v16 = *(unsigned __int8 *)(a1 + v6);
        if (v15 < 0)
        {
          if (v16 > 0xBF)
          {
            if (v16 > 0xDF)
            {
              if (v16 > 0xEF)
              {
                unsigned int v16 = *(_DWORD *)(a1 + v14);
                uint64_t v14 = v4 + 6;
              }
              else
              {
                unsigned int v16 = ((v16 & 0xF) << 24) | (*(unsigned __int8 *)(a1 + v14) << 16) | (*(unsigned __int8 *)(v4 + a1 + 3) << 8) | *(unsigned __int8 *)(v4 + a1 + 4);
                uint64_t v14 = v4 + 5;
              }
            }
            else
            {
              unsigned int v16 = ((v16 & 0x1F) << 16) | (*(unsigned __int8 *)(a1 + v14) << 8) | *(unsigned __int8 *)(v4 + a1 + 3);
              uint64_t v14 = v4 + 4;
            }
          }
          else
          {
            int v17 = *(unsigned __int8 *)(a1 + v14) | ((v16 & 0x3F) << 8);
            uint64_t v14 = v4 + 3;
            unsigned int v16 = v17;
          }
        }
        unint64_t v33 = v14;
        Mutable = (__CFArray *)CFDictionaryGetValue((CFDictionaryRef)qword_10001A470, (const void *)v16);
        if (Mutable) {
          goto LABEL_68;
        }
LABEL_52:
        unint64_t v12 = (__CFArray *)CFRetain(kCFNull);
        goto LABEL_53;
      case 5:
        uint64_t v18 = v4 + 9;
        if (v4 + 9 <= a3)
        {
          CFDateRef v22 = CFDateCreate(kCFAllocatorDefault, *(CFAbsoluteTime *)(a1 + v6));
LABEL_27:
          Mutable = v22;
        }
        else
        {
          Mutable = 0;
        }
        unint64_t v33 = v18;
        goto LABEL_68;
      case 6:
        if (v6 >= a3) {
          goto LABEL_67;
        }
        if (*(char *)(a1 + v6) < 0)
        {
          unsigned int v24 = *(unsigned __int8 *)(a1 + v6);
          if (v24 >= 0xC0)
          {
            if (v24 >= 0xE0)
            {
              if (v24 >= 0xF0)
              {
                if (v24 >= 0xF8)
                {
                  if (v24 >= 0xFC)
                  {
                    if (v24 >= 0xFE)
                    {
                      BOOL v30 = v24 == 255;
                      uint64_t v20 = 8;
                      if (v30) {
                        uint64_t v20 = 9;
                      }
                    }
                    else
                    {
                      uint64_t v20 = 7;
                    }
                  }
                  else
                  {
                    uint64_t v20 = 6;
                  }
                }
                else
                {
                  uint64_t v20 = 5;
                }
              }
              else
              {
                uint64_t v20 = 4;
              }
            }
            else
            {
              uint64_t v20 = 3;
            }
          }
          else
          {
            uint64_t v20 = 2;
          }
        }
        else
        {
          uint64_t v20 = 1;
        }
        if (v20 + v6 >= a3) {
          goto LABEL_67;
        }
        CFIndex v31 = sub_10000DE98(a1, (uint64_t *)&v33);
        uint64_t v18 = v33 + v31;
        if (v33 + v31 >= a3) {
          goto LABEL_67;
        }
        CFDateRef v22 = CFDataCreate(kCFAllocatorDefault, (const UInt8 *)(a1 + v33), v31);
        goto LABEL_27;
      case 7:
        uint64_t v18 = v4 + 10;
        if (v4 + 10 >= a3) {
          goto LABEL_67;
        }
        if (*(unsigned char *)(a1 + v6)) {
          CFNumberType v21 = kCFNumberFloat64Type;
        }
        else {
          CFNumberType v21 = kCFNumberSInt64Type;
        }
        CFDateRef v22 = CFNumberCreate(kCFAllocatorDefault, v21, (const void *)(v4 + a1 + 2));
        goto LABEL_27;
      default:
        goto LABEL_67;
    }
    do
    {
      if (v9 == v6)
      {
        Mutable = 0;
        unint64_t v33 = v9;
        goto LABEL_68;
      }
      uint64_t v10 = v6 + 1;
    }
    while (*(unsigned __int8 *)(a1 + v6++));
    unint64_t v33 = v10;
    unint64_t v12 = (__CFArray *)CFStringCreateWithCString(kCFAllocatorDefault, v8, 0x8000100u);
LABEL_53:
    Mutable = v12;
  }
LABEL_68:
  *a2 = v33;
  return Mutable;
}

uint64_t sub_10000DDFC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *a2 + 1;
  int v5 = *(char *)(a1 + *a2);
  uint64_t result = *(unsigned __int8 *)(a1 + *a2);
  if (v5 < 0)
  {
    if (result > 0xBF)
    {
      if (result > 0xDF)
      {
        if (result > 0xEF)
        {
          uint64_t result = *(unsigned int *)(a1 + v4);
          uint64_t v4 = v3 + 5;
        }
        else
        {
          uint64_t result = ((result & 0xF) << 24) | (*(unsigned __int8 *)(a1 + v4) << 16) | (*(unsigned __int8 *)(v3 + a1 + 2) << 8) | *(unsigned __int8 *)(v3 + a1 + 3);
          uint64_t v4 = v3 + 4;
        }
      }
      else
      {
        uint64_t result = ((result & 0x1F) << 16) | (*(unsigned __int8 *)(a1 + v4) << 8) | *(unsigned __int8 *)(v3 + a1 + 2);
        uint64_t v4 = v3 + 3;
      }
    }
    else
    {
      uint64_t v7 = *(unsigned __int8 *)(a1 + v4) | ((result & 0x3F) << 8);
      uint64_t v4 = v3 + 2;
      uint64_t result = v7;
    }
  }
  *a2 = v4;
  return result;
}

unint64_t sub_10000DE98(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *a2 + 1;
  int v5 = *(char *)(a1 + *a2);
  unint64_t result = *(unsigned __int8 *)(a1 + *a2);
  if (v5 < 0)
  {
    if (v5 > 0xBFu)
    {
      if (v5 > 0xDFu)
      {
        if (v5 > 0xEFu)
        {
          if (v5 > 0xF7u)
          {
            if (v5 > 0xFBu)
            {
              if (v5 > 0xFDu)
              {
                if (v5 == 255)
                {
                  unint64_t result = *(void *)(a1 + v4);
                  uint64_t v4 = v3 + 9;
                }
                else
                {
                  unint64_t v9 = (unint64_t)*(unsigned __int8 *)(a1 + v4) << 48;
                  uint64_t v10 = (unsigned __int8 *)(v3 + a1);
                  unint64_t result = v9 | ((unint64_t)v10[2] << 40) | ((unint64_t)v10[3] << 32) | ((unint64_t)v10[4] << 24) | ((unint64_t)v10[5] << 16) | ((unint64_t)v10[6] << 8) | v10[7];
                  uint64_t v4 = v3 + 8;
                }
              }
              else
              {
                unint64_t v7 = ((result & 1) << 48) | ((unint64_t)*(unsigned __int8 *)(a1 + v4) << 40);
                id v8 = (unsigned __int8 *)(v3 + a1);
                unint64_t result = v7 | ((unint64_t)v8[2] << 32) | ((unint64_t)v8[3] << 24) | ((unint64_t)v8[4] << 16) | ((unint64_t)v8[5] << 8) | v8[6];
                uint64_t v4 = v3 + 7;
              }
            }
            else
            {
              unint64_t result = ((result & 3) << 40) | ((unint64_t)*(unsigned __int8 *)(a1 + v4) << 32) | ((unint64_t)*(unsigned __int8 *)(v3 + a1 + 2) << 24) | ((unint64_t)*(unsigned __int8 *)(v3 + a1 + 3) << 16) | ((unint64_t)*(unsigned __int8 *)(v3 + a1 + 4) << 8) | *(unsigned __int8 *)(v3 + a1 + 5);
              uint64_t v4 = v3 + 6;
            }
          }
          else
          {
            unint64_t result = ((result & 7) << 32) | ((unint64_t)*(unsigned __int8 *)(a1 + v4) << 24) | ((unint64_t)*(unsigned __int8 *)(v3 + a1 + 2) << 16) | ((unint64_t)*(unsigned __int8 *)(v3 + a1 + 3) << 8) | *(unsigned __int8 *)(v3 + a1 + 4);
            uint64_t v4 = v3 + 5;
          }
        }
        else
        {
          unint64_t result = ((result & 0xF) << 24) | ((unint64_t)*(unsigned __int8 *)(a1 + v4) << 16) | ((unint64_t)*(unsigned __int8 *)(v3 + a1 + 2) << 8) | *(unsigned __int8 *)(v3 + a1 + 3);
          uint64_t v4 = v3 + 4;
        }
      }
      else
      {
        unint64_t result = ((result & 0x1F) << 16) | ((unint64_t)*(unsigned __int8 *)(a1 + v4) << 8) | *(unsigned __int8 *)(v3 + a1 + 2);
        uint64_t v4 = v3 + 3;
      }
    }
    else
    {
      unint64_t result = *(unsigned __int8 *)(a1 + v4) | ((result & 0x3F) << 8);
      uint64_t v4 = v3 + 2;
    }
  }
  *a2 = v4;
  return result;
}

void sub_10000E044()
{
  MEMORY[0xBAD] = -559038737;
  abort();
}

id MDUtiTypeConformsToPedigree(void *a1, const char *a2)
{
  return [a1 containsObject:a2];
}

CFMutableDictionaryRef MDFSOnlyMDDictionaryCreateMutable()
{
  return CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
}

void MDFSOnlyMDDictionaryIterate(const __CFDictionary *a1, void *context)
{
}

uint64_t sub_10000E0A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a3 + 16))(a3, a1, a2);
}

CFNumberRef MDFSOnlyMDNumberCreateInt64(uint64_t a1)
{
  uint64_t valuePtr = a1;
  return CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &valuePtr);
}

CFNumberRef MDFSOnlyMDNumberCreateInt32(int a1)
{
  int valuePtr = a1;
  return CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
}

CFNumberRef MDFSOnlyMDNumberGetInt64(const __CFNumber *result)
{
  uint64_t valuePtr = 0;
  if (result)
  {
    CFNumberGetValue(result, kCFNumberSInt64Type, &valuePtr);
    return (const __CFNumber *)valuePtr;
  }
  return result;
}

CFNumberRef MDFSOnlyMDNumberGetInt32(const __CFNumber *result)
{
  unsigned int valuePtr = 0;
  if (result)
  {
    CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr);
    return (const __CFNumber *)valuePtr;
  }
  return result;
}

CFNumberRef MDFSOnlyMDNumberGetBool(const __CFNumber *result)
{
  uint64_t valuePtr = 0;
  if (result)
  {
    CFNumberGetValue(result, kCFNumberSInt64Type, &valuePtr);
    return (const __CFNumber *)(valuePtr != 0);
  }
  return result;
}

CFNullRef MDCopyDecodedXattrFromData(void *a1, CFNullRef cf)
{
  CFNullRef v4 = kCFNull;
  CFNullRef result = cf;
  if (kCFNull == cf)
  {
LABEL_4:
    if (result) {
      return result;
    }
    goto LABEL_5;
  }
  CFTypeID v6 = CFGetTypeID(cf);
  if (v6 == CFDataGetTypeID())
  {
    CFNullRef result = (CFNullRef)MDPropertyCopyDecodedValue();
    goto LABEL_4;
  }
LABEL_5:
  if (![a1 isEqualToString:@"com.apple.metadata:_kMDItemUserTags"]) {
    return 0;
  }
  if (qword_10001A480 != -1) {
    dispatch_once(&qword_10001A480, &stru_100014F10);
  }
  uint64_t v25 = 0;
  id v7 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:qword_10001A488 fromData:cf error:&v25];
  uint64_t v8 = v25;
  if (v25)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v27 = v8;
      __int16 v28 = 2112;
      uint64_t v29 = a1;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Decoding error: %@ for %@", buf, 0x16u);
    }
    return v4;
  }
  unint64_t v9 = v7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  if (!objc_msgSend(objc_msgSend(v9, "objectForKeyedSubscript:", @"v"), "isEqual:", &off_1000159A8)) {
    return 0;
  }
  id v10 = [v9 objectForKeyedSubscript:@"t"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v11 = (uint64_t)[v10 count];
  uint64_t v12 = v11;
  if (v11 > 99) {
    return 0;
  }
  uint64_t v13 = 8 * v11;
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v14 = (id *)((char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  bzero(v14, 8 * v12);
  __chkstk_darwin(objc_msgSend(v10, "getObjects:range:", v14, 0, v12));
  int v15 = v14;
  bzero(v14, 8 * v12);
  if (v12 < 1) {
    return 0;
  }
  uint64_t v16 = 0;
  do
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v18 = *v14;
    if ((isKindOfClass & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_32;
      }
      id v21 = *v14;
      goto LABEL_31;
    }
    id v19 = [*v14 count];
    if (v19 == (id)2)
    {
      [v18 objectAtIndexedSubscript:0];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_32;
      }
      id v21 = [v18 objectAtIndexedSubscript:0];
      id v22 = [v18 objectAtIndexedSubscript:1];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v23 = [v22 intValue];
        if ((v23 - 1) <= 6)
        {
          id v20 = objc_msgSend(v21, "stringByAppendingFormat:", @"\n%d", v23);
LABEL_23:
          id v21 = v20;
        }
      }
      if (!v21) {
        goto LABEL_32;
      }
LABEL_31:
      v15[v16++] = v21;
      goto LABEL_32;
    }
    if (v19 == (id)1)
    {
      [v18 objectAtIndexedSubscript:0];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v20 = [v18 objectAtIndexedSubscript:0];
        goto LABEL_23;
      }
    }
LABEL_32:
    ++v14;
    --v12;
  }
  while (v12);
  if (v16 > 0) {
    return (CFNullRef)[objc_alloc((Class)NSArray) initWithObjects:v15 count:v16];
  }
  return 0;
}

void sub_10000E5E0(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    if (a2 == 2)
    {
      objc_end_catch();
      JUMPOUT(0x10000E57CLL);
    }
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_10000E658(id a1)
{
  id v1 = objc_alloc((Class)NSSet);
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  qword_10001A488 = (uint64_t)objc_msgSend(v1, "initWithObjects:", v2, v3, v4, objc_opt_class(), 0);
}

CFNullRef MDFSOnlyCopyExtendedAttributesFromFd(uint64_t a1)
{
  int v1 = __chkstk_darwin(a1);
  uint64_t v3 = v2;
  int v5 = v4;
  int v6 = v1;
  id v7 = value;
  bzero(value, 0x1000uLL);
  ssize_t v8 = fgetxattr(v6, v5, value, 0x1000uLL, 0, 0);
  if (v8 == -1)
  {
    if (*__error() != 34) {
      return 0;
    }
    ssize_t v9 = fgetxattr(v6, v5, 0, 0, 0, 0);
    id v7 = (unsigned __int8 *)malloc_type_malloc(v9, 0x588B3D04uLL);
    ssize_t v8 = fgetxattr(v6, v5, v7, v9, 0, 0);
  }
  else
  {
    ssize_t v9 = v8;
  }
  CFNullRef v10 = 0;
  if (v9 >= 1 && v8 == v9)
  {
    if (((char)*v7 & 0x80000000) == 0)
    {
LABEL_8:
      CFNullRef v11 = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, v7, v9, kCFAllocatorNull);
      uint64_t v12 = (__CFString *)CFStringCreateWithCString(kCFAllocatorDefault, v5, 0x8000100u);
      CFNullRef v10 = MDCopyDecodedXattrFromData(v12, v11);
      CFRelease(v11);
      CFRelease(v12);
      goto LABEL_9;
    }
    int v14 = *v7;
    if ((v14 - 241) >= 2)
    {
      if (v14 != 129) {
        goto LABEL_8;
      }
      if (v9 != 9) {
        goto LABEL_8;
      }
      CFNullRef v10 = CFDateCreate(kCFAllocatorDefault, *(CFAbsoluteTime *)(v7 + 1));
      if (!v10) {
        goto LABEL_8;
      }
    }
    else if (v3)
    {
      unsigned char *v3 = 1;
      CFNullRef v10 = CFDataCreate(kCFAllocatorDefault, v7, v9);
    }
    else
    {
      CFNullRef v10 = 0;
    }
  }
LABEL_9:
  if (v7 != value) {
    free(v7);
  }
  return v10;
}

CFMutableDictionaryRef MDFSOnlyMDCopyXattrsDictionaryForFD(uint64_t a1)
{
  uint64_t v1 = __chkstk_darwin(a1);
  int v3 = v2;
  char v5 = v4;
  uint64_t v6 = v1;
  id v7 = namebuff;
  bzero(namebuff, 0x1000uLL);
  ssize_t v8 = flistxattr(v6, namebuff, 0x1000uLL, 0);
  if (v8 < 0)
  {
    if (*__error() != 34) {
      return CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    }
    ssize_t v9 = flistxattr(v6, 0, 0, 0);
    uint64_t v37 = (char *)malloc_type_malloc(v9, 0x87B0ECC2uLL);
    if (!v37) {
      return 0;
    }
    id v7 = v37;
    if (flistxattr(v6, v37, v9, 0) < 0) {
      return 0;
    }
  }
  else
  {
    ssize_t v9 = v8;
  }
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (v9 >= 1)
  {
    int v39 = v3;
    __s1 = v7;
    id v11 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:&unk_100011A18];
    id v12 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithObjects:", v11, 0);

    id v41 = objc_alloc_init((Class)NSMutableArray);
    id v40 = objc_alloc_init((Class)NSMutableArray);
    if ((unint64_t)v9 >= 3)
    {
      uint64_t v13 = __s1;
      do
      {
        if (!*v13) {
          break;
        }
        if (!strncmp(v13, "com.apple.metadata", 0x12uLL))
        {
          int v20 = v13[18];
          LOBYTE(valuePtr) = 0;
          if (v20 == 58) {
            goto LABEL_20;
          }
          if (v20 == 46)
          {
            LOBYTE(valuePtr) = 1;
LABEL_20:
            CFNullRef v17 = MDFSOnlyCopyExtendedAttributesFromFd(v6);
            if (!v17 || (_BYTE)valuePtr)
            {
              if ((_BYTE)valuePtr && !strncmp(v13, "com.apple.metadata:kMDLabel_", 0x1CuLL))
              {
                bzero(&value, 0x400uLL);
                snprintf((char *)&value, 0x400uLL, "%s.%s", "com.apple.metadata", v13 + 28);
                objc_msgSend(v40, "addObject:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", &value));
                [v41 addObject:v17];
              }
              if (!v17) {
                goto LABEL_47;
              }
            }
            else if ((v5 & 1) == 0)
            {
              CFStringRef v21 = CFStringCreateWithCString(kCFAllocatorDefault, v13 + 19, 0x8000100u);
              if (v21)
              {
                CFStringRef v22 = v21;
                CFDictionaryAddValue(Mutable, v21, v17);
                CFRelease(v22);
              }
            }
LABEL_36:
            CFRelease(v17);
          }
        }
        else if ((v5 & 1) == 0)
        {
          if (!strcmp(v13, "com.apple.lastuseddate#PS"))
          {
            uint64_t value = 0;
            uint64_t v53 = 0;
            uint64_t v54 = 0;
            if (v6 == -1) {
              goto LABEL_46;
            }
            ssize_t v23 = fgetxattr(v6, "com.apple.lastuseddate#PS", &value, 0x18uLL, 0, 0);
            if ((v23 & 0x8000000000000000) == 0)
            {
              if (v23 != 16)
              {
LABEL_46:
                *__error() = 22;
                goto LABEL_47;
              }
              if (value)
              {
                CFNullRef v17 = CFDateCreate(kCFAllocatorDefault, (double)v53 / 1000000000.0 + (double)value - kCFAbsoluteTimeIntervalSince1970);
                id v18 = Mutable;
                CFStringRef v19 = @"kMDItemLastUsedDate";
                goto LABEL_35;
              }
            }
          }
          else if (!strcmp(v13, "com.apple.TextEncoding"))
          {
            p_uint64_t value = &value;
            bzero(&value, 0x400uLL);
            if (fgetxattr(v6, v13, &value, 0x400uLL, 0, 0) > 0) {
              goto LABEL_40;
            }
            if (*__error() == 34)
            {
              ssize_t v25 = fgetxattr(v6, v13, 0, 0, 0, 0);
              p_uint64_t value = (uint64_t *)malloc_type_calloc(1uLL, v25 + 1, 0x53B656AAuLL);
              fgetxattr(v6, v13, p_value, v25, 0, 0);
LABEL_40:
              int v26 = strchr((char *)p_value, 59);
              if (v26)
              {
                CFStringEncoding encoding = 0;
                if (sscanf(v26 + 1, "%u", &encoding) == 1)
                {
                  if (CFStringIsEncodingAvailable(encoding))
                  {
                    CFStringEncoding valuePtr = encoding;
                    CFNumberRef v27 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
                    CFDictionarySetValue(Mutable, @"--_kMDItemTextEncodingHint", v27);
                    CFRelease(v27);
                  }
                }
              }
              if (p_value != &value) {
                free(p_value);
              }
            }
          }
          else if (!strncmp(v13, "com.apple.SharedWithYou", 0x17uLL))
          {
            int v14 = &value;
            bzero(&value, 0x400uLL);
            if (fgetxattr(v6, v13, &value, 0x400uLL, 0, 0) <= 0)
            {
              if (*__error() != 34) {
                goto LABEL_47;
              }
              ssize_t v15 = fgetxattr(v6, v13, 0, 0, 0, 0);
              int v14 = (uint64_t *)malloc_type_calloc(1uLL, v15 + 1, 0xFCE0A9DFuLL);
              fgetxattr(v6, v13, v14, v15, 0, 0);
            }
            CFStringRef v16 = CFStringCreateWithCString(kCFAllocatorDefault, (const char *)v14, 0x8000100u);
            if (v16)
            {
              CFNullRef v17 = (CFNullRef)v16;
              id v18 = Mutable;
              CFStringRef v19 = @"com.apple.SharedWithYou";
LABEL_35:
              CFDictionarySetValue(v18, v19, v17);
              goto LABEL_36;
            }
          }
        }
LABEL_47:
        size_t v28 = strlen(v13) + 1;
        v13 += v28;
        v9 -= v28;
      }
      while (v9 > 2);
    }
    if ([v40 count])
    {
      if (v39)
      {
        uint64_t v29 = (const void *)_MDPlistContainerCreateMutable();
        _MDPlistContainerBeginContainer();
        _MDPlistContainerBeginDictionary();
        _MDPlistContainerAddCString();
        _MDPlistContainerAddObject();
        _MDPlistContainerAddCString();
        _MDPlistContainerBeginArray();
        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        id v30 = [v12 countByEnumeratingWithState:&v43 objects:v51 count:16];
        if (v30)
        {
          id v31 = v30;
          uint64_t v32 = *(void *)v44;
          do
          {
            for (i = 0; i != v31; i = (char *)i + 1)
            {
              if (*(void *)v44 != v32) {
                objc_enumerationMutation(v12);
              }
              [*(id *)(*((void *)&v43 + 1) + 8 * i) UUIDString];
              _MDPlistContainerAddObject();
            }
            id v31 = [v12 countByEnumeratingWithState:&v43 objects:v51 count:16];
          }
          while (v31);
        }
        _MDPlistContainerEndArray();
        _MDPlistContainerAddCString();
        _MDPlistContainerAddObject();
        _MDPlistContainerEndDictionary();
        _MDPlistContainerEndContainer();
        id v34 = objc_alloc((Class)NSData);
        uint64_t Bytes = _MDPlistContainerGetBytes();
        id v36 = [v34 initWithBytes:Bytes length:_MDPlistContainerGetLength()];
        CFDictionarySetValue(Mutable, @"_kMDItemEncryptedData", v36);

        CFRelease(v29);
      }
      else
      {
        v49[0] = @"xids";
        v49[1] = @"uuids";
        v50[0] = v40;
        v50[1] = v12;
        v49[2] = @"datas";
        v50[2] = v41;
        CFDictionarySetValue(Mutable, @"_kMDItemEncryptedDataDictionary", +[NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:3]);
      }
    }

    if (__s1 != namebuff) {
      free(__s1);
    }
  }
  return Mutable;
}

CFMutableDictionaryRef MDFSOnlyMDCopyXattrsDictionary(const char *a1)
{
  uint64_t v1 = open(a1, 33024);
  if (v1 == -1) {
    return 0;
  }
  int v2 = v1;
  CFMutableDictionaryRef v3 = MDFSOnlyMDCopyXattrsDictionaryForFD(v1);
  close(v2);
  return v3;
}

void sub_10000F1EC(id a1)
{
  qword_10001A498 = objc_alloc_init(CSExattrCryptoService);
}

NSData *__cdecl sub_10000F2D4(id a1, NSUUID *a2, unsigned int a3, unsigned int a4, NSData *a5, int a6)
{
  uint64_t v8 = *(void *)&a4;
  uint64_t v9 = *(void *)&a3;
  id v11 = +[MDKeyRing defaultKeyRing];
  if (a6 == 1)
  {
    return (NSData *)[v11 copyEncryptedData:a5 withKeyUUID:a2 iv1:v9 iv2:v8];
  }
  else
  {
    return (NSData *)[v11 copyDecryptedData:a5 withKeyUUID:a2 iv1:v9 iv2:v8];
  }
}

void sub_10000F4DC()
{
  __assert_rtn("accurate_realpath", "MDFileUtil.c", 394, "rc == 0");
}

void sub_10000F508(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000F544(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000F580(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000F5BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000F5F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000F634(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000F670(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000F6AC(int a1)
{
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "_copyCryptedDataWithKey() failed. CCCrypt() returned %d.", (uint8_t *)v1, 8u);
}

void sub_10000F72C()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Connection lacks entitlement", v0, 2u);
}

void sub_10000F774(uint64_t a1)
{
  int v1 = 136315394;
  int v2 = "-[_MDLabel initWithUUID:attributes:forUserUUID:]";
  __int16 v3 = 2112;
  uint64_t v4 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s: can't extract attributeBits from label attributes %@", (uint8_t *)&v1, 0x16u);
}

void sub_10000F808(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000F844(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

CCCryptorStatus CCCrypt(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return _CCCrypt(op, alg, options, key, keyLength, iv, dataIn, dataInLength, dataOut, dataOutAvailable, dataOutMoved);
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return _CC_MD5_Final(md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return _CC_MD5_Init(c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return _CC_MD5_Update(c, data, len);
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return _CFAllocatorAllocate(allocator, size, hint);
}

CFAllocatorRef CFAllocatorCreate(CFAllocatorRef allocator, CFAllocatorContext *context)
{
  return _CFAllocatorCreate(allocator, context);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
}

void CFAllocatorGetContext(CFAllocatorRef allocator, CFAllocatorContext *context)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return _CFArrayGetTypeID();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return _CFDataCreate(allocator, bytes, length);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return _CFDataCreateWithBytesNoCopy(allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return _CFDataGetTypeID();
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return _CFDateCreate(allocator, at);
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  return _CFDateGetAbsoluteTime(theDate);
}

CFTypeID CFDateGetTypeID(void)
{
  return _CFDateGetTypeID();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return _CFDictionaryCreateMutableCopy(allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return _CFDictionaryGetCount(theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return _CFHash(cf);
}

CFTypeRef CFMakeCollectable(CFTypeRef cf)
{
  return _CFMakeCollectable(cf);
}

CFTypeID CFNullGetTypeID(void)
{
  return _CFNullGetTypeID();
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return _CFNumberIsFloatType(number);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return _CFSetCreateMutable(allocator, capacity, callBacks);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return _CFStringCreateCopy(alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return _CFStringCreateMutable(alloc, maxLength);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return _CFStringCreateWithFormat(alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return _CFStringGetMaximumSizeForEncoding(length, encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

Boolean CFStringIsEncodingAvailable(CFStringEncoding encoding)
{
  return _CFStringIsEncodingAvailable(encoding);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return _CFURLGetFileSystemRepresentation(url, resolveAgainstBase, buffer, maxBufLen);
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return _CFUUIDCreateFromUUIDBytes(alloc, bytes);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return _CFUUIDGetConstantUUIDWithBytes(alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6, byte7, byte8, byte9, byte10, byte11, byte12, byte13, byte14, byte15);
}

CFTypeID CFUUIDGetTypeID(void)
{
  return _CFUUIDGetTypeID();
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  CFUUIDBytes v3 = _CFUUIDGetUUIDBytes(uuid);
  uint64_t v2 = *(void *)&v3.byte8;
  uint64_t v1 = *(void *)&v3.byte0;
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

uint64_t MDPropertyCopyDecodedValue()
{
  return _MDPropertyCopyDecodedValue();
}

void NSLog(NSString *format, ...)
{
}

CFStringRef SecCreateSharedWebCredentialPassword(void)
{
  return _SecCreateSharedWebCredentialPassword();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return _SecItemAdd(attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return _SecItemCopyMatching(query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return _SecItemDelete(query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return _SecItemUpdate(query, attributesToUpdate);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFCopySystemVersionDictionary()
{
  return __CFCopySystemVersionDictionary();
}

uint64_t _CFRuntimeRegisterClass()
{
  return __CFRuntimeRegisterClass();
}

uint64_t _MDPlistBytesAppendPlist()
{
  return __MDPlistBytesAppendPlist();
}

uint64_t _MDPlistBytesCopyPlistAtIndex()
{
  return __MDPlistBytesCopyPlistAtIndex();
}

uint64_t _MDPlistBytesCreate()
{
  return __MDPlistBytesCreate();
}

uint64_t _MDPlistBytesCreateMutableUsingMalloc()
{
  return __MDPlistBytesCreateMutableUsingMalloc();
}

uint64_t _MDPlistBytesGetByteVector()
{
  return __MDPlistBytesGetByteVector();
}

uint64_t _MDPlistBytesGetByteVectorCount()
{
  return __MDPlistBytesGetByteVectorCount();
}

uint64_t _MDPlistContainerAddCString()
{
  return __MDPlistContainerAddCString();
}

uint64_t _MDPlistContainerAddObject()
{
  return __MDPlistContainerAddObject();
}

uint64_t _MDPlistContainerBeginArray()
{
  return __MDPlistContainerBeginArray();
}

uint64_t _MDPlistContainerBeginContainer()
{
  return __MDPlistContainerBeginContainer();
}

uint64_t _MDPlistContainerBeginDictionary()
{
  return __MDPlistContainerBeginDictionary();
}

uint64_t _MDPlistContainerCopyObject()
{
  return __MDPlistContainerCopyObject();
}

uint64_t _MDPlistContainerCreateMutable()
{
  return __MDPlistContainerCreateMutable();
}

uint64_t _MDPlistContainerEndArray()
{
  return __MDPlistContainerEndArray();
}

uint64_t _MDPlistContainerEndContainer()
{
  return __MDPlistContainerEndContainer();
}

uint64_t _MDPlistContainerEndDictionary()
{
  return __MDPlistContainerEndDictionary();
}

uint64_t _MDPlistContainerGetBytes()
{
  return __MDPlistContainerGetBytes();
}

uint64_t _MDPlistContainerGetLength()
{
  return __MDPlistContainerGetLength();
}

uint64_t _MDPlistDictionaryGetPlistObjectForKey()
{
  return __MDPlistDictionaryGetPlistObjectForKey();
}

uint64_t _MDPlistGetPlistObjectType()
{
  return __MDPlistGetPlistObjectType();
}

uint64_t _MDPlistGetRootPlistObjectFromBytes()
{
  return __MDPlistGetRootPlistObjectFromBytes();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return ___error();
}

uint64_t __strlcpy_chk()
{
  return ___strlcpy_chk();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return ___tolower(a1);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

uint32_t arc4random(void)
{
  return _arc4random();
}

void bzero(void *a1, size_t a2)
{
}

int chmod(const char *a1, mode_t a2)
{
  return _chmod(a1, a2);
}

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return _chown(a1, a2, a3);
}

int close(int a1)
{
  return _close(a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

int dup(int a1)
{
  return _dup(a1);
}

void exit(int a1)
{
}

int faccessat(int a1, const char *a2, int a3, int a4)
{
  return _faccessat(a1, a2, a3, a4);
}

int fchownat(int a1, const char *a2, uid_t a3, gid_t a4, int a5)
{
  return _fchownat(a1, a2, a3, a4, a5);
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

int fgetattrlist(int a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return _fgetattrlist(a1, a2, a3, a4, a5);
}

ssize_t fgetxattr(int fd, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return _fgetxattr(fd, name, value, size, position, options);
}

ssize_t flistxattr(int fd, char *namebuff, size_t size, int options)
{
  return _flistxattr(fd, namebuff, size, options);
}

void free(void *a1)
{
}

int fremovexattr(int fd, const char *name, int options)
{
  return _fremovexattr(fd, name, options);
}

int fsetxattr(int fd, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return _fsetxattr(fd, name, value, size, position, options);
}

ssize_t fsgetpath(char *a1, size_t a2, fsid_t *a3, uint64_t a4)
{
  return _fsgetpath(a1, a2, a3, a4);
}

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
}

int fstatat(int a1, const char *a2, stat *a3, int a4)
{
  return _fstatat(a1, a2, a3, a4);
}

int fstatfs(int a1, statfs *a2)
{
  return _fstatfs(a1, a2);
}

int ftruncate(int a1, off_t a2)
{
  return _ftruncate(a1, a2);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return _getattrlist(a1, a2, a3, a4, a5);
}

int getattrlistat(int a1, const char *a2, void *a3, void *a4, size_t a5, unint64_t a6)
{
  return _getattrlistat(a1, a2, a3, a4, a5, a6);
}

int getattrlistbulk(int a1, void *a2, void *a3, size_t a4, uint64_t a5)
{
  return _getattrlistbulk(a1, a2, a3, a4, a5);
}

uid_t geteuid(void)
{
  return _geteuid();
}

int getiopolicy_np(int a1, int a2)
{
  return _getiopolicy_np(a1, a2);
}

pid_t getpid(void)
{
  return _getpid();
}

int gettimeofday(timeval *a1, void *a2)
{
  return _gettimeofday(a1, a2);
}

kern_return_t host_info(host_t host, host_flavor_t flavor, host_info_t host_info_out, mach_msg_type_number_t *host_info_outCnt)
{
  return _host_info(host, flavor, host_info_out, host_info_outCnt);
}

int kill(pid_t a1, int a2)
{
  return _kill(a1, a2);
}

int linkat(int a1, const char *a2, int a3, const char *a4, int a5)
{
  return _linkat(a1, a2, a3, a4, a5);
}

void mach_error(const char *str, mach_error_t error_value)
{
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return _mach_error_string(error_value);
}

mach_port_t mach_host_self(void)
{
  return _mach_host_self();
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return _mach_port_deallocate(task, name);
}

kern_return_t mach_port_get_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_urefs_t *refs)
{
  return _mach_port_get_refs(task, name, right, refs);
}

mach_port_t mach_thread_self(void)
{
  return _mach_thread_self();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return _mkdir(a1, a2);
}

int mkdirat(int a1, const char *a2, mode_t a3)
{
  return _mkdirat(a1, a2, a3);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_check(int token, int *check)
{
  return _notify_check(token, check);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return _notify_get_state(token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return _notify_register_check(name, out_token);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_terminate(void)
{
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

int openat(int a1, const char *a2, int a3, ...)
{
  return _openat(a1, a2, a3);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

kern_return_t pid_for_task(mach_port_name_t t, int *x)
{
  return _pid_for_task(t, x);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return _pread(__fd, __buf, __nbyte, a4);
}

uint64_t pthread_fchdir_np()
{
  return _pthread_fchdir_np();
}

int pthread_getugid_np(uid_t *a1, gid_t *a2)
{
  return _pthread_getugid_np(a1, a2);
}

int pthread_setugid_np(uid_t a1, gid_t a2)
{
  return _pthread_setugid_np(a1, a2);
}

qos_class_t qos_class_self(void)
{
  return _qos_class_self();
}

int renameatx_np(int a1, const char *a2, int a3, const char *a4, unsigned int a5)
{
  return _renameatx_np(a1, a2, a3, a4, a5);
}

int renamex_np(const char *a1, const char *a2, unsigned int a3)
{
  return _renamex_np(a1, a2, a3);
}

int setiopolicy_np(int a1, int a2, int a3)
{
  return _setiopolicy_np(a1, a2, a3);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int sprintf(char *a1, const char *a2, ...)
{
  return _sprintf(a1, a2);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return _sscanf(a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return _statfs(a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return _strchr(__s, __c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return _strlcat(__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return _strlcpy(__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return _strrchr(__s, __c);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return _task_info(target_task, flavor, task_info_out, task_info_outCnt);
}

kern_return_t thread_policy_set(thread_act_t thread, thread_policy_flavor_t flavor, thread_policy_t policy_info, mach_msg_type_number_t policy_infoCnt)
{
  return _thread_policy_set(thread, flavor, policy_info, policy_infoCnt);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

int unlinkat(int a1, const char *a2, int a3)
{
  return _unlinkat(a1, a2, a3);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return _vasprintf(a1, a2, a3);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return _vsnprintf(__str, __size, __format, a4);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return _xpc_array_apply(xarray, applier);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return _xpc_array_get_count(xarray);
}

const void *__cdecl xpc_array_get_data(xpc_object_t xarray, size_t index, size_t *length)
{
  return _xpc_array_get_data(xarray, index, length);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return _xpc_array_get_string(xarray, index);
}

const uint8_t *__cdecl xpc_array_get_uuid(xpc_object_t xarray, size_t index)
{
  return _xpc_array_get_uuid(xarray, index);
}

void xpc_array_set_data(xpc_object_t xarray, size_t index, const void *bytes, size_t length)
{
}

uint64_t xpc_create_with_format()
{
  return _xpc_create_with_format();
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return _xpc_data_create(bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return _xpc_data_get_bytes_ptr(xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return _xpc_data_get_length(xdata);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return _xpc_dictionary_get_data(xdict, key, length);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return _xpc_retain(object);
}

const uint8_t *__cdecl xpc_uuid_get_bytes(xpc_object_t xuuid)
{
  return _xpc_uuid_get_bytes(xuuid);
}

id objc_msgSend_MDUUIDData(void *a1, const char *a2, ...)
{
  return [a1 MDUUIDData];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend_allKeyUUIDs(void *a1, const char *a2, ...)
{
  return [a1 allKeyUUIDs];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cleanAttrs(void *a1, const char *a2, ...)
{
  return [a1 cleanAttrs];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_copyDesignatedKeyUUID(void *a1, const char *a2, ...)
{
  return [a1 copyDesignatedKeyUUID];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createRandomAESKey(void *a1, const char *a2, ...)
{
  return [a1 createRandomAESKey];
}

id objc_msgSend_createRandomUUID(void *a1, const char *a2, ...)
{
  return [a1 createRandomUUID];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultKeyRing(void *a1, const char *a2, ...)
{
  return [a1 defaultKeyRing];
}

id objc_msgSend_defaultServices(void *a1, const char *a2, ...)
{
  return [a1 defaultServices];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return [a1 distantPast];
}

id objc_msgSend_exportedInterface(void *a1, const char *a2, ...)
{
  return [a1 exportedInterface];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_keysByUUID(void *a1, const char *a2, ...)
{
  return [a1 keysByUUID];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 reverseObjectEnumerator];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_xidDictWithXPCUUIDs_allKeyUUIDs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xidDictWithXPCUUIDs:allKeyUUIDs:");
}