@interface CFCanChangeEUIDs
@end

@implementation CFCanChangeEUIDs

uint64_t ___CFCanChangeEUIDs_block_invoke()
{
  uint64_t v20 = *(void *)off_1ECE0A5B0;
  uid_t v0 = geteuid();
  uid_t v1 = getuid();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  memset(v11, 0, sizeof(v11));
  *(void *)v8 = 0xE00000001;
  int v9 = 1;
  pid_t v10 = getpid();
  size_t v7 = 648;
  uint64_t result = sysctl(v8, 4u, v11, &v7, 0, 0);
  int v3 = HIDWORD(v12);
  if (result) {
    int v3 = -1;
  }
  if (v1) {
    BOOL v4 = v1 == v0;
  }
  else {
    BOOL v4 = 0;
  }
  char v6 = !v4 || v3 != v0;
  if (result) {
    char v6 = 1;
  }
  _CFCanChangeEUIDs_canChangeEUIDs = v6;
  return result;
}

@end