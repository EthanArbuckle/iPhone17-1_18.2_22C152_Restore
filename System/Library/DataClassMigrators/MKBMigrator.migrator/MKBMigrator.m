uint64_t MKBKeyBagMigrateFS()
{
  return _MKBKeyBagMigrateFS();
}

void NSLog(NSString *format, ...)
{
}

int *__error(void)
{
  return ___error();
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return _close(a1);
}

char *__cdecl ctime(const time_t *a1)
{
  return _ctime(a1);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return _open_dprotected_np(a1, a2, a3, a4);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}
__s, v5 + 1) == -1)
    {
      v6 = __error();
      v7 = strerror(*v6);
      NSLog(@"aks: failed to write aks marker (%s)", v7);
    }
    close(v4);
  }
  v10 = MKBKeyBagMigrateFS();
  if (v10) {
    NSLog(@"aks: error during migration of %s %i", "/private/var", v10);
  }
  return 1;
}

- (float)estimatedDuration
{
  return 5.0;
}

- (float)migrationProgress
{
  return 0.0;
}

@end