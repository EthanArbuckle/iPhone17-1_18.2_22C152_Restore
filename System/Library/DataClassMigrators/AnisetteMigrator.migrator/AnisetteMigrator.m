char *_iterate_path(char *result, uint64_t a2, uint64_t a3)
{
  FTS *v5;
  FTSENT *v6;
  FTSENT *v7;
  int fts_info;
  char *v9[2];

  if (result)
  {
    v9[0] = result;
    v9[1] = 0;
    result = (char *)fts_open(v9, 84, 0);
    if (result)
    {
      v5 = (FTS *)result;
      v6 = fts_read((FTS *)result);
      if (v6)
      {
        v7 = v6;
        do
        {
          fts_info = v7->fts_info;
          if (fts_info != 6)
          {
            if (fts_info == 1)
            {
              if (a2)
              {
                if (((*(uint64_t (**)(uint64_t, FTSENT *))(a2 + 16))(a2, v7) & 1) == 0) {
                  fts_set(v5, v7, 4);
                }
              }
            }
            else if (a3 && fts_info == 8)
            {
              (*(void (**)(uint64_t, FTSENT *))(a3 + 16))(a3, v7);
            }
          }
          v7 = fts_read(v5);
        }
        while (v7);
      }
      return (char *)fts_close(v5);
    }
  }
  return result;
}

uint64_t _set_path_class(const char *a1, int a2, int a3, char a4)
{
  uint64_t v16 = 0;
  long long v15 = xmmword_3DA0;
  uint64_t v14 = 0;
  if (getattrlist(a1, &v15, &v14, 8uLL, 0)) {
    return *__error();
  }
  if (HIDWORD(v14) == a3 || a2 != -1 && HIDWORD(v14) != a2) {
    return 0;
  }
  if (a2 == -1)
  {
    if (a4) {
      fprintf(__stdoutp, "%s set %i\n");
    }
  }
  else if (a4)
  {
    fprintf(__stdoutp, "%s update %i -> %i\n");
  }
  int v13 = a3;
  if (!setattrlist(a1, &v15, &v13, 4uLL, 0)) {
    return 0;
  }
  v8 = __error();
  uint64_t v9 = *v8;
  v10 = __stderrp;
  v11 = strerror(*v8);
  fprintf(v10, "failed (%s) to update class for %s\n", v11, a1);
  return v9;
}

uint64_t aks_migrate_path(const char *a1, int a2, int a3, int a4)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  bzero(v18, 0x400uLL);
  if (!realpath_DARWIN_EXTSN(a1, v18)) {
    return 0xFFFFFFFFLL;
  }
  int v8 = a2 | 0x18;
  if ((a2 & 0x1C) != 0) {
    int v8 = a2;
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 0x40000000;
  v14[2] = __aks_migrate_path_block_invoke;
  v14[3] = &__block_descriptor_tmp;
  int v15 = v8;
  int v16 = a3;
  int v17 = a4;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 0x40000000;
  v10[2] = __aks_migrate_path_block_invoke_2;
  v10[3] = &__block_descriptor_tmp_16;
  int v11 = a3;
  int v12 = v8;
  int v13 = a4;
  _iterate_path(v18, (uint64_t)v14, (uint64_t)v10);
  return 0;
}

uint64_t __aks_migrate_path_block_invoke(_DWORD *a1, uint64_t a2)
{
  int v2 = a1[8];
  if ((v2 & 4) != 0)
  {
    v6 = *(const char **)(a2 + 48);
    int v4 = a1[9];
    int v5 = a1[10];
    v3 = v6;
    goto LABEL_5;
  }
  if ((v2 & 8) != 0)
  {
    v3 = *(const char **)(a2 + 48);
    int v4 = -1;
    int v5 = 0;
LABEL_5:
    _set_path_class(v3, v4, v5, v2);
  }
  return 1;
}

_DWORD *__aks_migrate_path_block_invoke_2(_DWORD *result, uint64_t a2)
{
  int v3 = result[8];
  if (v3)
  {
    int v4 = result[9];
    if ((v4 & 0x10) != 0)
    {
      if (result[10]) {
        int v5 = result[10];
      }
      else {
        int v5 = 3;
      }
      return (_DWORD *)_set_path_class(*(const char **)(a2 + 48), v3, v5, v4);
    }
  }
  return result;
}

int *__error(void)
{
  return ___error();
}

void bzero(void *a1, size_t a2)
{
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

int fts_close(FTS *a1)
{
  return _fts_close(a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return _fts_open(a1, a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return _fts_read(a1);
}

int fts_set(FTS *a1, FTSENT *a2, int a3)
{
  return _fts_set(a1, a2, a3);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return _getattrlist(a1, a2, a3, a4, a5);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

int setattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return _setattrlist(a1, a2, a3, a4, a5);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}