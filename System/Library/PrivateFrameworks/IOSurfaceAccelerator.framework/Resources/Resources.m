uint64_t start(int a1, char **a2)
{
  int v4;
  mach_error_t v5;
  mach_error_t v7;
  FILE *v8;
  int v9;

  v9 = 0;
  do
    v4 = getopt_long(a1, a2, "fh", (const option *)&off_100008000, &v9);
  while (v4 == 102);
  if (v4 != -1)
  {
    sub_100003BA4(*a2);
    goto LABEL_7;
  }
  v5 = IOSurfaceAcceleratorCreate();
  if (v5)
  {
    v7 = v5;
    puts("Could not create IOSA client");
    v8 = __stderrp;
    mach_error_string(v7);
    fprintf(v8, "%s %s (%#x)\n");
LABEL_7:
    exit(1);
  }
  return 0;
}

uint64_t sub_100003BA4(const char *a1)
{
  fprintf(__stdoutp, "%s options:\n", a1);
  fwrite("\t--file | -f\n", 0xDuLL, 1uLL, __stdoutp);
  fwrite("\t\tWrite diag to file /tmp/com.apple.AppleM2ScalerCSC.IOSADiagnose_YYYY_MM__DD_HH-MM-SS.txt (instead of stdout)\n", 0x6FuLL, 1uLL, __stdoutp);
  fwrite("\t--help | -h\n", 0xDuLL, 1uLL, __stdoutp);
  fwrite("\t\tthis usage\n", 0xDuLL, 1uLL, __stdoutp);
  fputc(10, __stdoutp);
  v1 = __stdoutp;

  return fflush(v1);
}

uint64_t IOSurfaceAcceleratorCreate()
{
  return _IOSurfaceAcceleratorCreate();
}

uint64_t IOSurfaceAcceleratorGetDiag()
{
  return _IOSurfaceAcceleratorGetDiag();
}

void exit(int a1)
{
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

int fflush(FILE *a1)
{
  return _fflush(a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return _fputc(a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

int getopt_long(int a1, char *const *a2, const char *a3, const option *a4, int *a5)
{
  return _getopt_long(a1, a2, a3, a4, a5);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return _localtime_r(a1, a2);
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return _mach_error_string(error_value);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int puts(const char *a1)
{
  return _puts(a1);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return _strftime(a1, a2, a3, a4);
}

time_t time(time_t *a1)
{
  return _time(a1);
}