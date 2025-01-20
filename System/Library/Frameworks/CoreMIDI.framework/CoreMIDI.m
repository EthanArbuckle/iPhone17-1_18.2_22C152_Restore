uint64_t start(int a1, uint64_t a2)
{
  void *v4;
  const char **v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  Dl_info v10;

  openlog("MIDIServer", 9, 8);
  if (dladdr(start, &v10))
  {
    if (a1 >= 2)
    {
      v5 = (const char **)(a2 + 8);
      v6 = a1 - 1;
      do
      {
        v7 = *v5;
        if (strcmp(*v5, "-n")) {
          fprintf(__stderrp, "unknown argument: %s\n", v7);
        }
        ++v5;
        --v6;
      }
      while (v6);
    }
    MIDIServerRun();
    v8 = 0;
  }
  else
  {
    v8 = 1;
    fwrite("dladdr(main) failed\n", 0x14uLL, 1uLL, __stderrp);
  }
  return v8;
}

uint64_t MIDIServerRun()
{
  return _MIDIServerRun();
}

int dladdr(const void *a1, Dl_info *a2)
{
  return _dladdr(a1, a2);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

{
}

{
}

void openlog(const char *a1, int a2, int a3)
{
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}