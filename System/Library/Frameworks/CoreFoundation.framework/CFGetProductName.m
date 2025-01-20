@interface CFGetProductName
@end

@implementation CFGetProductName

void ___CFGetProductName_block_invoke()
{
  uint64_t v13 = *(void *)off_1ECE0A5B0;
  v0 = getenv("CLASSIC_SUFFIX");
  if (v0)
  {
    v1 = v0;
    if (!strncmp(v0, "iphone", 6uLL))
    {
      v4 = _CFBundleResourceLogger();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
        ___CFGetProductName_block_invoke_cold_2(v4);
      }
      goto LABEL_16;
    }
    if (!strncmp(v1, "ipad", 4uLL))
    {
      v9 = _CFBundleResourceLogger();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        ___CFGetProductName_block_invoke_cold_3(v9);
      }
LABEL_39:
      v5 = @"ipad";
      goto LABEL_41;
    }
  }
  memset(v12, 0, sizeof(v12));
  size_t v11 = 256;
  int v2 = sysctlbyname("hw.machine", v12, &v11, 0, 0);
  if (v2 && (v2 != -1 || *__error() != 12)) {
    goto LABEL_42;
  }
  if (v11 >= 6)
  {
    if (LODWORD(v12[0]) != 1869107305 || WORD2(v12[0]) != 25966) {
      goto LABEL_18;
    }
LABEL_16:
    v5 = @"iphone";
LABEL_41:
    _CFGetProductName__cfBundlePlatform = (uint64_t)v5;
    goto LABEL_42;
  }
  if (v11 < 4) {
    goto LABEL_42;
  }
LABEL_18:
  if (LODWORD(v12[0]) == 1685016681)
  {
    v5 = @"ipod";
    goto LABEL_41;
  }
  if (LODWORD(v12[0]) == 1684099177) {
    goto LABEL_39;
  }
  if (v11 < 5) {
    goto LABEL_42;
  }
  if (LODWORD(v12[0]) == 1668571479 && BYTE4(v12[0]) == 104)
  {
    v5 = @"applewatch";
    goto LABEL_41;
  }
  if (v11 < 7) {
    goto LABEL_42;
  }
  if (LODWORD(v12[0]) == 1819308097 && *(_DWORD *)((char *)v12 + 3) == 1448371564)
  {
    v5 = @"appletv";
    goto LABEL_41;
  }
  if (v11 >= 0xD && *(void *)&v12[0] == 0x447974696C616552 && *(void *)((char *)v12 + 5) == 0x6563697665447974)
  {
    v5 = @"applevision";
    goto LABEL_41;
  }
LABEL_42:
  v10 = _CFBundleResourceLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    ___CFGetProductName_block_invoke_cold_1(v10);
  }
}

void ___CFGetProductName_block_invoke_cold_1(os_log_t log)
{
  uint64_t v3 = *(void *)off_1ECE0A5B0;
  int v1 = 138412290;
  uint64_t v2 = _CFGetProductName__cfBundlePlatform;
  _os_log_debug_impl(&dword_182B90000, log, OS_LOG_TYPE_DEBUG, "Using ~%@ resources", (uint8_t *)&v1, 0xCu);
}

void ___CFGetProductName_block_invoke_cold_2(os_log_t log)
{
  uint64_t v2 = *(void *)off_1ECE0A5B0;
  *(_WORD *)int v1 = 0;
  _os_log_debug_impl(&dword_182B90000, log, OS_LOG_TYPE_DEBUG, "Using ~iphone resources (classic)", v1, 2u);
}

void ___CFGetProductName_block_invoke_cold_3(os_log_t log)
{
  uint64_t v2 = *(void *)off_1ECE0A5B0;
  *(_WORD *)int v1 = 0;
  _os_log_debug_impl(&dword_182B90000, log, OS_LOG_TYPE_DEBUG, "Using ~ipad resources (classic)", v1, 2u);
}

@end