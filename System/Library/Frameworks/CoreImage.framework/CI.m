@interface CI
@end

@implementation CI

size_t __CI_CACHE_PROGRAM_GRAPH_block_invoke()
{
  CI_CACHE_PROGRAM_GRAPH::v = get_BOOL("CI_CACHE_PROGRAM_GRAPH", 1);
  size_t result = CI_PRINT_TREE_dump_timing();
  if (result)
  {
    if (CI_CACHE_PROGRAM_GRAPH::v)
    {
      size_t result = fwrite("Program Graph cache disabled when using CI_PRINT_TREE dump_timing\n", 0x42uLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
      CI_CACHE_PROGRAM_GRAPH::v = 0;
    }
  }
  return result;
}

uint64_t __CI_PRINT_PROGRAM_block_invoke()
{
  string = get_string("CI_PRINT_PROGRAM");
  if (string) {
    uint64_t result = atoi(string);
  }
  else {
    uint64_t result = CI_PRINT_PROGRAM::v;
  }
  CI_PRINT_PROGRAM::v = result;
  return result;
}

void __CI_PRINT_TREE_graphviz_block_invoke()
{
  v0 = (const char *)CI_PRINT_TREE_graphviz::v;
  if (!CI_PRINT_TREE_graphviz::v)
  {
    v0 = "pdf";
    if (!CI_PRINT_TREE_has_string("pdf"))
    {
      v0 = (const char *)CI_PRINT_TREE_graphviz::v;
      if (CI_PRINT_TREE_graphviz::v) {
        goto LABEL_8;
      }
      v0 = "png";
      if (CI_PRINT_TREE_has_string("png")) {
        goto LABEL_8;
      }
      v0 = (const char *)CI_PRINT_TREE_graphviz::v;
    }
  }
  CI_PRINT_TREE_graphviz::v = (uint64_t)v0;
  if (v0) {
    goto LABEL_12;
  }
  v0 = "dot";
  if (CI_PRINT_TREE_has_string("dot")) {
    goto LABEL_12;
  }
  v0 = (const char *)CI_PRINT_TREE_graphviz::v;
LABEL_8:
  CI_PRINT_TREE_graphviz::v = (uint64_t)v0;
  if (!v0)
  {
    if (CI_PRINT_TREE_has_string("graphviz")) {
      v0 = "dot";
    }
    else {
      v0 = (const char *)CI_PRINT_TREE_graphviz::v;
    }
  }
LABEL_12:
  CI_PRINT_TREE_graphviz::v = (uint64_t)v0;
}

const char *__CI_WORKING_FORMAT_block_invoke()
{
  uint64_t result = getenv("CI_WORKING_FORMAT");
  if (result)
  {
    v1 = result;
    uint64_t result = (const char *)strcmp(result, "BGRA8");
    if (result)
    {
      uint64_t result = (const char *)strcmp(v1, "RGBA8");
      if (result)
      {
        uint64_t result = (const char *)strcmp(v1, "RGBAh");
        if (result)
        {
          uint64_t result = (const char *)strcmp(v1, "RGBAf");
          if (result) {
            return result;
          }
          int v2 = 2312;
        }
        else
        {
          int v2 = 2056;
        }
      }
      else
      {
        int v2 = 264;
      }
    }
    else
    {
      int v2 = 266;
    }
    CI_WORKING_FORMAT::v = v2;
  }
  return result;
}

uint64_t __CI_PRINT_TREE_block_invoke()
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  string = get_string("CI_PRINT_TREE");
  v1 = string;
  if (string) {
    uint64_t result = atoi(string);
  }
  else {
    uint64_t result = CI_PRINT_TREE::v;
  }
  CI_PRINT_TREE::v = result;
  if (!result) {
    return result;
  }
  v3 = (FILE **)MEMORY[0x1E4F143C8];
  fwrite("CI_PRINT_TREE options flags:\n", 0x1DuLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
  if (CI_PRINT_TREE::v) {
    v4 = "(set)";
  }
  else {
    v4 = "";
  }
  fprintf(*v3, "%3d  initial graph %s\n", 1, v4);
  if ((CI_PRINT_TREE::v & 2) != 0) {
    v5 = "(set)";
  }
  else {
    v5 = "";
  }
  fprintf(*v3, "%3d  optimized graph %s\n", 2, v5);
  if ((CI_PRINT_TREE::v & 4) != 0) {
    v6 = "(set)";
  }
  else {
    v6 = "";
  }
  fprintf(*v3, "%3d  program graph %s\n", 4, v6);
  v7 = *v3;
  if (strstr(v1, "dump-inputs")) {
    v8 = "(set)";
  }
  else {
    v8 = "";
  }
  fprintf(v7, " dump-inputs %s\n", v8);
  v9 = *v3;
  if (strstr(v1, "dump-intermediates")) {
    v10 = "(set)";
  }
  else {
    v10 = "";
  }
  fprintf(v9, " dump-intermediates %s\n", v10);
  v11 = *v3;
  if (strstr(v1, "dump-raw-intermediates")) {
    v12 = "(set)";
  }
  else {
    v12 = "";
  }
  fprintf(v11, " dump-raw-intermediates %s\n", v12);
  v13 = *v3;
  if (strstr(v1, "dump-bmtl-intermediates")) {
    v14 = "(set)";
  }
  else {
    v14 = "";
  }
  fprintf(v13, " dump-bmtl-intermediates %s\n", v14);
  v15 = *v3;
  if (strstr(v1, "dump-outputs")) {
    v16 = "(set)";
  }
  else {
    v16 = "";
  }
  fprintf(v15, " dump-outputs %s\n", v16);
  v17 = *v3;
  if (strstr(v1, "dump-timing")) {
    v18 = "(set)";
  }
  else {
    v18 = "";
  }
  fprintf(v17, " dump-timing %s\n", v18);
  memset(&__dst[1], 0, 63);
  v19 = CI_PRINT_TREE_has_string("context==");
  if (!v19)
  {
    v19 = CI_PRINT_TREE_has_string("context!=");
    __dst[0] = 0;
    if (!v19)
    {
      fwrite(" context==<name|number>\n", 0x18uLL, 1uLL, *v3);
LABEL_58:
      fwrite(" context!=<name|number>\n", 0x18uLL, 1uLL, *v3);
      goto LABEL_59;
    }
  }
  strncpy(__dst, v19 + 9, 0x40uLL);
  for (uint64_t i = 0; i != 64; i += 8)
  {
    int8x8_t v21 = vceq_s8(*(int8x8_t *)&__dst[i], (int8x8_t)0x2020202020202020);
    if (v21.i8[0]) {
      __dst[i] = 0;
    }
    if (v21.i8[1]) {
      __dst[i + 1] = 0;
    }
    if (v21.i8[2]) {
      __dst[i + 2] = 0;
    }
    if (v21.i8[3]) {
      __dst[i + 3] = 0;
    }
    if (v21.i8[4]) {
      __dst[i + 4] = 0;
    }
    if (v21.i8[5]) {
      __dst[i + 5] = 0;
    }
    if (v21.i8[6]) {
      __dst[i + 6] = 0;
    }
    if (v21.i8[7]) {
      __dst[i + 7] = 0;
    }
  }
  v22 = *v3;
  if (v19[7] == 61) {
    fprintf(v22, " context==<name|number> (set %s)\n", __dst);
  }
  else {
    fwrite(" context==<name|number>\n", 0x18uLL, 1uLL, v22);
  }
  if (v19[7] != 33) {
    goto LABEL_58;
  }
  fprintf(*v3, " context!=<name|number> (set %s)\n", __dst);
LABEL_59:
  if (CI_PRINT_TREE_frame::didCheck != -1) {
    dispatch_once(&CI_PRINT_TREE_frame::didCheck, &__block_literal_global_58_0);
  }
  snprintf(__str, 0x40uLL, "(set frame-%d)", CI_PRINT_TREE_frame::v);
  v23 = *v3;
  if (CI_PRINT_TREE_frame::didCheck != -1) {
    dispatch_once(&CI_PRINT_TREE_frame::didCheck, &__block_literal_global_58_0);
  }
  v24 = __str;
  if (!CI_PRINT_TREE_frame::v) {
    v24 = "";
  }
  fprintf(v23, " frame-<number> %s\n", v24);
  if (CI_PRINT_TREE_graphviz::didCheck != -1) {
    dispatch_once(&CI_PRINT_TREE_graphviz::didCheck, &__block_literal_global_61_0);
  }
  snprintf(v27, 0x40uLL, "(set %s)", (const char *)CI_PRINT_TREE_graphviz::v);
  v25 = *v3;
  if (CI_PRINT_TREE_graphviz::didCheck != -1) {
    dispatch_once(&CI_PRINT_TREE_graphviz::didCheck, &__block_literal_global_61_0);
  }
  v26 = v27;
  if (!CI_PRINT_TREE_graphviz::v) {
    v26 = "";
  }
  fprintf(v25, " <dot|pdf|png> %s\n", v26);
  return fputc(10, *v3);
}

size_t __CI_PRINT_TIME_block_invoke()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  string = get_string("CI_PRINT_TIME");
  if (string) {
    size_t result = atoi(string);
  }
  else {
    size_t result = CI_PRINT_TIME::v;
  }
  CI_PRINT_TIME::v = result;
  if (result)
  {
    int v2 = (FILE **)MEMORY[0x1E4F143C8];
    fwrite("CI_PRINT_TIME options flags:\n", 0x1DuLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
    fprintf(*v2, " depth=%d\n", CI_PRINT_TIME::v);
    memset(&__dst[1], 0, 63);
    v3 = CI_PRINT_TIME_has_string("context==");
    if (v3 || (v3 = CI_PRINT_TIME_has_string("context!="), __dst[0] = 0, v3))
    {
      strncpy(__dst, v3 + 9, 0x40uLL);
      for (uint64_t i = 0; i != 64; i += 8)
      {
        int8x8_t v5 = vceq_s8(*(int8x8_t *)&__dst[i], (int8x8_t)0x2020202020202020);
        if (v5.i8[0]) {
          __dst[i] = 0;
        }
        if (v5.i8[1]) {
          __dst[i + 1] = 0;
        }
        if (v5.i8[2]) {
          __dst[i + 2] = 0;
        }
        if (v5.i8[3]) {
          __dst[i + 3] = 0;
        }
        if (v5.i8[4]) {
          __dst[i + 4] = 0;
        }
        if (v5.i8[5]) {
          __dst[i + 5] = 0;
        }
        if (v5.i8[6]) {
          __dst[i + 6] = 0;
        }
        if (v5.i8[7]) {
          __dst[i + 7] = 0;
        }
      }
      v6 = *v2;
      if (v3[7] == 61) {
        fprintf(v6, " context==<name|number> (set %s)\n", __dst);
      }
      else {
        fwrite(" context==<name|number>\n", 0x18uLL, 1uLL, v6);
      }
      if (v3[7] == 33) {
        return fprintf(*v2, " context!=<name|number> (set %s)\n", __dst);
      }
    }
    else
    {
      fwrite(" context==<name|number>\n", 0x18uLL, 1uLL, *v2);
    }
    return fwrite(" context!=<name|number>\n", 0x18uLL, 1uLL, *v2);
  }
  return result;
}

uint64_t __CI_ENABLE_METAL_GPU_block_invoke()
{
  v0 = getenv("CI_ENABLE_METAL_GPU");
  if (v0) {
    uint64_t result = atoi(v0);
  }
  else {
    uint64_t result = CI_ENABLE_METAL_GPU::v;
  }
  CI_ENABLE_METAL_GPU::v = result;
  return result;
}

FILE *__CI_LOG_FILE_block_invoke()
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  string = get_string("CI_LOG_FILE");
  if (!string)
  {
LABEL_7:
    uint64_t result = (FILE *)CI_LOG_FILE::fp;
    if (CI_LOG_FILE::fp) {
      return result;
    }
    goto LABEL_8;
  }
  v1 = string;
  if (!strcmp(string, "stderr"))
  {
    int8x8_t v5 = (FILE **)MEMORY[0x1E4F143C8];
LABEL_12:
    uint64_t result = *v5;
    goto LABEL_13;
  }
  if (!strcmp(v1, "stdout"))
  {
    int8x8_t v5 = (FILE **)MEMORY[0x1E4F143D8];
    goto LABEL_12;
  }
  if (strcmp(v1, "oslog"))
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    *(_OWORD *)__str = 0u;
    long long v9 = 0u;
    int v2 = CI_TEMP_DIR();
    snprintf(__str, 0xFFuLL, "%s/%s", v2, v1);
    CI_LOG_FILE::fp = (uint64_t)fopen(__str, "a");
    v3 = ci_logger_general();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v7 = __str;
      _os_log_impl(&dword_193671000, v3, OS_LOG_TYPE_DEFAULT, "CI_LOG_FILE path: %s", buf, 0xCu);
    }
    goto LABEL_7;
  }
  uint64_t result = funopen(&CI_LOG_FILE::cookie, 0, (int (__cdecl *)(void *, const char *, int))memstream_write, 0, 0);
LABEL_13:
  CI_LOG_FILE::fp = (uint64_t)result;
  if (!result) {
LABEL_8:
  }
    CI_LOG_FILE::fp = *MEMORY[0x1E4F143C8];
  return result;
}

char *__CI_PRINT_TIME_context_block_invoke()
{
  uint64_t result = CI_PRINT_TIME_has_string("context");
  if (!result) {
    return result;
  }
  int v1 = result[7];
  if (v1 == 33)
  {
    BOOL v2 = 0;
    CI_PRINT_TIME_context::nequal = result[8] == 61;
  }
  else
  {
    BOOL v2 = 0;
    CI_PRINT_TIME_context::nequal = 0;
    if (v1 == 61) {
      BOOL v2 = result[8] == 61;
    }
  }
  CI_PRINT_TIME_context::equal = v2;
  unsigned int v5 = result[9];
  v4 = result + 9;
  unsigned int v3 = v5;
  if ((v5 & 0x80000000) != 0)
  {
    uint64_t result = (char *)__maskrune(v3, 0x100uLL);
    if (result)
    {
LABEL_8:
      uint64_t result = strncpy(&CI_PRINT_TIME_context::name, v4, 0x40uLL);
      for (uint64_t i = 0; i != 64; i += 8)
      {
        int8x8_t v7 = vceq_s8(*(int8x8_t *)&result[i], (int8x8_t)0x2020202020202020);
        if (v7.i8[0]) {
          result[i] = 0;
        }
        if (v7.i8[1]) {
          result[i + 1] = 0;
        }
        if (v7.i8[2]) {
          result[i + 2] = 0;
        }
        if (v7.i8[3]) {
          result[i + 3] = 0;
        }
        if (v7.i8[4]) {
          result[i + 4] = 0;
        }
        if (v7.i8[5]) {
          result[i + 5] = 0;
        }
        if (v7.i8[6]) {
          result[i + 6] = 0;
        }
        if (v7.i8[7]) {
          result[i + 7] = 0;
        }
      }
      return result;
    }
  }
  else
  {
    uint64_t result = (char *)(*(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v3 + 60) & 0x100);
    if (result) {
      goto LABEL_8;
    }
  }
  if ((*v4 & 0x80000000) == 0 && (*(_DWORD *)(MEMORY[0x1E4F14390] + 4 * *(unsigned __int8 *)v4 + 60) & 0x400) != 0)
  {
    uint64_t result = (char *)atoi(v4);
    CI_PRINT_TIME_context::v = (int)result;
  }
  return result;
}

char *__CI_PRINT_TREE_context_block_invoke()
{
  uint64_t result = CI_PRINT_TREE_has_string("context");
  if (!result) {
    return result;
  }
  int v1 = result[7];
  if (v1 == 33)
  {
    BOOL v2 = 0;
    CI_PRINT_TREE_context::nequal = result[8] == 61;
  }
  else
  {
    BOOL v2 = 0;
    CI_PRINT_TREE_context::nequal = 0;
    if (v1 == 61) {
      BOOL v2 = result[8] == 61;
    }
  }
  CI_PRINT_TREE_context::equal = v2;
  unsigned int v5 = result[9];
  v4 = result + 9;
  unsigned int v3 = v5;
  if ((v5 & 0x80000000) != 0)
  {
    uint64_t result = (char *)__maskrune(v3, 0x100uLL);
    if (result)
    {
LABEL_8:
      uint64_t result = strncpy(&CI_PRINT_TREE_context::name, v4, 0x40uLL);
      for (uint64_t i = 0; i != 64; i += 8)
      {
        int8x8_t v7 = vceq_s8(*(int8x8_t *)&result[i], (int8x8_t)0x2020202020202020);
        if (v7.i8[0]) {
          result[i] = 0;
        }
        if (v7.i8[1]) {
          result[i + 1] = 0;
        }
        if (v7.i8[2]) {
          result[i + 2] = 0;
        }
        if (v7.i8[3]) {
          result[i + 3] = 0;
        }
        if (v7.i8[4]) {
          result[i + 4] = 0;
        }
        if (v7.i8[5]) {
          result[i + 5] = 0;
        }
        if (v7.i8[6]) {
          result[i + 6] = 0;
        }
        if (v7.i8[7]) {
          result[i + 7] = 0;
        }
      }
      return result;
    }
  }
  else
  {
    uint64_t result = (char *)(*(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v3 + 60) & 0x100);
    if (result) {
      goto LABEL_8;
    }
  }
  if ((*v4 & 0x80000000) == 0 && (*(_DWORD *)(MEMORY[0x1E4F14390] + 4 * *(unsigned __int8 *)v4 + 60) & 0x400) != 0)
  {
    uint64_t result = (char *)atoi(v4);
    CI_PRINT_TREE_context::v = (int)result;
  }
  return result;
}

uint64_t __CI_PRINT_TREE_frame_block_invoke()
{
  v0 = CI_PRINT_TREE_has_string("frame-");
  if (v0) {
    uint64_t result = atoi(v0 + 6);
  }
  else {
    uint64_t result = CI_PRINT_TREE_frame::v;
  }
  CI_PRINT_TREE_frame::v = result;
  return result;
}

char *__CI_PRINT_PROGRAM_context_block_invoke()
{
  uint64_t result = get_string("CI_PRINT_PROGRAM");
  if (!result) {
    return result;
  }
  uint64_t result = strstr(result, "context");
  if (!result) {
    return result;
  }
  int v1 = result[7];
  if (v1 == 33)
  {
    BOOL v2 = 0;
    CI_PRINT_PROGRAM_context::nequal = result[8] == 61;
  }
  else
  {
    BOOL v2 = 0;
    CI_PRINT_PROGRAM_context::nequal = 0;
    if (v1 == 61) {
      BOOL v2 = result[8] == 61;
    }
  }
  CI_PRINT_PROGRAM_context::equal = v2;
  unsigned int v5 = result[9];
  v4 = result + 9;
  unsigned int v3 = v5;
  if ((v5 & 0x80000000) != 0)
  {
    uint64_t result = (char *)__maskrune(v3, 0x100uLL);
    if (result)
    {
LABEL_9:
      uint64_t result = strncpy(&CI_PRINT_PROGRAM_context::name, v4, 0x40uLL);
      for (uint64_t i = 0; i != 64; i += 8)
      {
        int8x8_t v7 = vceq_s8(*(int8x8_t *)&result[i], (int8x8_t)0x2020202020202020);
        if (v7.i8[0]) {
          result[i] = 0;
        }
        if (v7.i8[1]) {
          result[i + 1] = 0;
        }
        if (v7.i8[2]) {
          result[i + 2] = 0;
        }
        if (v7.i8[3]) {
          result[i + 3] = 0;
        }
        if (v7.i8[4]) {
          result[i + 4] = 0;
        }
        if (v7.i8[5]) {
          result[i + 5] = 0;
        }
        if (v7.i8[6]) {
          result[i + 6] = 0;
        }
        if (v7.i8[7]) {
          result[i + 7] = 0;
        }
      }
      return result;
    }
  }
  else
  {
    uint64_t result = (char *)(*(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v3 + 60) & 0x100);
    if (result) {
      goto LABEL_9;
    }
  }
  if ((*v4 & 0x80000000) == 0 && (*(_DWORD *)(MEMORY[0x1E4F14390] + 4 * *(unsigned __int8 *)v4 + 60) & 0x400) != 0)
  {
    uint64_t result = (char *)atoi(v4);
    CI_PRINT_PROGRAM_context::v = (int)result;
  }
  return result;
}

char *__CI_FORCE_GPU_PRIORITY_block_invoke()
{
  uint64_t result = getenv("CI_FORCE_GPU_PRIORITY");
  if (result)
  {
    int v1 = *result;
    char v2 = v1 - 48;
    if ((v1 - 48) <= 0x3E)
    {
      if (((1 << v2) & 0x100000001000001) == 0)
      {
        if (((1 << v2) & 0x1000000010000004) == 0)
        {
          if (((1 << v2) & 0x4000000040000002) == 0) {
            return result;
          }
          goto LABEL_10;
        }
        CI_FORCE_GPU_PRIORITY::v = 76;
        if (v1 != 72 && v1 != 104)
        {
          if (v1 != 78) {
            return result;
          }
LABEL_10:
          CI_FORCE_GPU_PRIORITY::v = 78;
          if ((v1 | 0x20) != 0x68) {
            return result;
          }
        }
      }
      CI_FORCE_GPU_PRIORITY::v = 72;
    }
  }
  return result;
}

const char *__CI_DISABLE_LOADING_ARCHIVES_BY_NAME_block_invoke()
{
  uint64_t result = get_string("CI_DISABLE_LOADING_ARCHIVES_BY_NAME");
  if (result)
  {
    uint64_t result = (const char *)strlcpy(CI_DISABLE_LOADING_ARCHIVES_BY_NAME::archives_name, result, 0x400uLL);
    CI_DISABLE_LOADING_ARCHIVES_BY_NAME::is_set = 1;
  }
  return result;
}

const char *__CI_HARVESTING_SPECIFIC_LIBRARY_LIST_block_invoke()
{
  uint64_t result = get_string("CI_HARVESTING_SPECIFIC_LIBRARY_LIST");
  if (result)
  {
    uint64_t result = (const char *)strlcpy(CI_HARVESTING_SPECIFIC_LIBRARY_LIST::archives_name, result, 0x400uLL);
    CI_HARVESTING_SPECIFIC_LIBRARY_LIST::is_set = 1;
  }
  return result;
}

const char *__CI_HARVEST_PROCESS_NAME_LIST_block_invoke()
{
  uint64_t result = get_string("CI_HARVEST_PROCESS_NAME_LIST");
  if (result)
  {
    uint64_t result = (const char *)strlcpy(CI_HARVEST_PROCESS_NAME_LIST::archives_name, result, 0x400uLL);
    CI_HARVEST_PROCESS_NAME_LIST::is_set = 1;
  }
  return result;
}

const char *__CI_HARVEST_BIN_ARCHIVE_ABSOLUTE_PATH_block_invoke()
{
  uint64_t result = getenv("CI_HARVEST_BIN_ARCHIVE_ABSOLUTE_PATH");
  if (result)
  {
    uint64_t result = (const char *)strlcpy(CI_HARVEST_BIN_ARCHIVE_ABSOLUTE_PATH::harvesting_path, result, 0x80uLL);
    CI_HARVEST_BIN_ARCHIVE_ABSOLUTE_PATH::is_set = 1;
  }
  return result;
}

const char *__CI_HARVEST_BIN_ARCHIVE_FOLDER_NAME_block_invoke()
{
  uint64_t result = getenv("CI_HARVEST_BIN_ARCHIVE_FOLDER_NAME");
  if (result)
  {
    uint64_t result = (const char *)strlcpy(CI_HARVEST_BIN_ARCHIVE_FOLDER_NAME::harvesting_dir, result, 0x80uLL);
    CI_HARVEST_BIN_ARCHIVE_FOLDER_NAME::is_set = 1;
  }
  return result;
}

CFArrayRef __CI_DOCS_DIR_block_invoke()
{
  MainBundle = CFBundleGetMainBundle();
  CFArrayRef result = (const __CFArray *)CFBundleGetValueForInfoDictionaryKey(MainBundle, @"UIFileSharingEnabled");
  if (result == (const __CFArray *)*MEMORY[0x1E4F1CFD0])
  {
    CFArrayRef result = (const __CFArray *)NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
    if (result)
    {
      CFArrayRef result = (const __CFArray *)CFArrayGetValueAtIndex(result, 0);
      if (result)
      {
        CFStringGetCString((CFStringRef)result, &CI_DOCS_DIR::directory, 256, 0x8000100u);
        int v2 = stat(&CI_DOCS_DIR::directory, &v4);
        mode_t st_mode = v4.st_mode;
        CFArrayRef result = (const __CFArray *)access(&CI_DOCS_DIR::directory, 2);
        if (result | v2 || (st_mode & 0x4000) == 0) {
          CI_DOCS_DIR::directory = 0;
        }
      }
    }
  }
  return result;
}

NSString *__CI_TEMP_DIR_block_invoke()
{
  CFArrayRef result = NSTemporaryDirectory();
  if (result)
  {
    int v1 = [(NSString *)result UTF8String];
    return (NSString *)strlcpy(CI_TEMP_DIR::temporaryDirectory, v1, 0x200uLL);
  }
  return result;
}

uint64_t __CI_TRASH_SURFACES_ON_SETVOLATILE_block_invoke()
{
  v0 = getenv("CI_TRASH_SURFACES_ON_SETVOLATILE");
  if (v0) {
    uint64_t result = atoi(v0);
  }
  else {
    uint64_t result = CI_TRASH_SURFACES_ON_SETVOLATILE_v;
  }
  CI_TRASH_SURFACES_ON_SETVOLATILE_v = result;
  return result;
}

@end