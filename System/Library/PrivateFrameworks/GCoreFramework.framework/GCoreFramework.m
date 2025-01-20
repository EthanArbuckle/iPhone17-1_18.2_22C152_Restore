uint64_t create_gcore_with_options(void *a1)
{
  uint64_t v1;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  char **v13;
  size_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  int i;
  mach_port_t v21;
  char **v22;
  char *const *v23;
  unint64_t v24;
  task_t v25;
  uint64_t v26;
  const char *v27;
  char ***v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  unint64_t v32;
  NSObject *v33;
  pid_t v34;
  NSObject *v35;
  int v36;
  int v37;
  NSObject *v38;
  int v39;
  NSObject *v40;
  BOOL v41;
  char *v42;
  int v43;
  char *v44;
  int v45;
  int *v46;
  char *v47;
  NSObject *v48;
  NSObject *v49;
  int v50;
  int v51;
  char *v52;
  uint64_t v54;
  mach_port_t v55;
  uint64_t v56;
  int v57;
  unsigned int v58;
  void *v59;
  long long v60;
  long long v61;
  long long v62;
  long long v63;
  rusage v64;
  uint8_t v65;
  unsigned char v66[15];
  sigset_t v67;
  sigset_t v68;
  posix_spawnattr_t v69;
  mach_port_t init_port_set;
  int __errnum;
  pid_t v72;
  uint8_t v73[128];
  uint8_t buf[4];
  int v75;
  __int16 v76;
  unsigned char v77[10];
  unsigned char v78[6];
  unsigned char v79[10];
  int v80;
  __int16 v81;
  char *v82;
  uint64_t v83;

  v83 = *MEMORY[0x263EF8340];
  *MEMORY[0x263EF89E8] = 1;
  if (create_gcore_with_options_onceToken != -1) {
    dispatch_once(&create_gcore_with_options_onceToken, &__block_literal_global);
  }
  v3 = (void *)MEMORY[0x25335E100]();
  v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v5 = [a1 countByEnumeratingWithState:&v60 objects:v73 count:16];
  if (!v5)
  {
    v21 = 0;
    goto LABEL_50;
  }
  v6 = v5;
  v57 = 0;
  v55 = 0;
  v54 = 0;
  v7 = *(void *)v61;
  v56 = *(void *)v61;
  do
  {
    v8 = 0;
    do
    {
      if (*(void *)v61 != v7) {
        objc_enumerationMutation(a1);
      }
      v9 = *(void **)(*((void *)&v60 + 1) + 8 * v8);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v1 = 22;
        goto LABEL_112;
      }
      if (![v9 compare:@"debug"])
      {
        *(_DWORD *)buf = 0;
        v64.ru_utime.tv_sec = 0;
        if (get_integer_value((uint64_t)v9, a1, &v64.ru_utime.tv_sec, buf))
        {
          v57 = [(id)v64.ru_utime.tv_sec intValue];
LABEL_23:
          v15 = 3;
          goto LABEL_25;
        }
LABEL_24:
        v15 = 1;
        v1 = *(unsigned int *)buf;
        goto LABEL_25;
      }
      if (![v9 compare:@"filedesc"])
      {
        *(_DWORD *)buf = 0;
        v64.ru_utime.tv_sec = 0;
        if (!get_integer_value((uint64_t)v9, a1, &v64.ru_utime.tv_sec, buf))
        {
          v1 = *(unsigned int *)buf;
          goto LABEL_112;
        }
        [(id)v64.ru_utime.tv_sec intValue];
      }
      if (![v9 compare:@"port"])
      {
        *(_DWORD *)buf = 0;
        v64.ru_utime.tv_sec = 0;
        if (get_integer_value((uint64_t)v9, a1, &v64.ru_utime.tv_sec, buf))
        {
          v55 = [(id)v64.ru_utime.tv_sec intValue];
          goto LABEL_23;
        }
        goto LABEL_24;
      }
      if (!v9)
      {
        v1 = 33;
        goto LABEL_112;
      }
      v58 = v1;
      v10 = v3;
      v11 = (const char *)[v9 UTF8String];
      v12 = 0;
      v13 = &off_26532B070;
      while (1)
      {
        v14 = strlen(*(v13 - 1));
        if (!strncmp(v11, *(v13 - 1), v14)) {
          break;
        }
        ++v12;
        v13 += 3;
        if (v12 == 8)
        {
          v1 = 33;
LABEL_48:
          v3 = v10;
          goto LABEL_112;
        }
      }
      if ((0x1BuLL >> v12)) {
        goto LABEL_31;
      }
      v16 = [a1 objectForKeyedSubscript:v9];
      if (!v16)
      {
        v1 = 34;
        goto LABEL_48;
      }
      v17 = v16;
      v18 = v13[1];
      if (strncmp(v18, "NSINTEGER", 9uLL))
      {
        if (!strncmp(v18, "NSSTRING", 8uLL))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v1 = 22;
            goto LABEL_48;
          }
        }
        else
        {
LABEL_31:
          v17 = 0;
        }
LABEL_32:
        objc_msgSend(v4, "addObject:", objc_msgSend(NSString, "stringWithUTF8String:", *v13));
        if (v17) {
          [v4 addObject:v17];
        }
        v3 = v10;
        v1 = v58;
        v7 = v56;
        goto LABEL_35;
      }
      *(_DWORD *)buf = 0;
      v64.ru_utime.tv_sec = 0;
      if ((get_integer_value((uint64_t)v9, a1, &v64.ru_utime.tv_sec, buf) & 1) == 0)
      {
        v1 = *(unsigned int *)buf;
        goto LABEL_48;
      }
      v17 = [(id)v64.ru_utime.tv_sec stringValue];
      if ([v9 compare:@"pid"]) {
        goto LABEL_32;
      }
      v15 = 3;
      v54 = v17;
      v3 = v10;
      v1 = v58;
      v7 = v56;
LABEL_25:
      if (v15 != 3) {
        goto LABEL_112;
      }
LABEL_35:
      ++v8;
    }
    while (v8 != v6);
    v19 = [a1 countByEnumeratingWithState:&v60 objects:v73 count:16];
    v6 = v19;
  }
  while (v19);
  for (i = v57; i; --i)
    [v4 addObject:@"-d"];
  if (v54) {
    objc_msgSend(v4, "addObject:");
  }
  v21 = v55;
LABEL_50:
  v22 = (char **)malloc_type_malloc(8 * [v4 count] + 16, 0x10040436913F5uLL);
  if (!v22)
  {
    v1 = 12;
    goto LABEL_112;
  }
  v23 = v22;
  *v22 = strdup("gcore");
  if ([v4 count])
  {
    v24 = 1;
    do
    {
      v23[v24] = strdup((const char *)objc_msgSend((id)objc_msgSend(v4, "objectAtIndexedSubscript:", v24 - 1), "UTF8String"));
      ++v24;
    }
    while (v24 <= [v4 count]);
  }
  v23[[v4 count] + 1] = 0;
  if ((int)[v4 count] < 1)
  {
    v1 = 22;
    goto LABEL_80;
  }
  v72 = 0;
  if (v21 - 1 <= 0xFFFFFFFD)
  {
    v25 = *MEMORY[0x263EF8960];
    init_port_set = v21;
    v26 = mach_ports_register(v25, &init_port_set, 1u);
    if (v26)
    {
      v1 = v26;
      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR)) {
        create_gcore_with_options_cold_10();
      }
      goto LABEL_80;
    }
  }
  v59 = v3;
  v69 = 0;
  posix_spawnattr_init(&v69);
  if (posix_spawnattr_setflags(&v69, 2) && os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR)) {
    create_gcore_with_options_cold_9();
  }
  if (posix_spawnattr_setflags(&v69, 0x4000) && os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR)) {
    create_gcore_with_options_cold_8();
  }
  if (posix_spawnattr_setflags(&v69, 12) && os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR)) {
    create_gcore_with_options_cold_7();
  }
  v68 = -1;
  v67 = 0;
  if (posix_spawnattr_setsigdefault(&v69, &v68) && os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR)) {
    create_gcore_with_options_cold_6();
  }
  if (posix_spawnattr_setsigmask(&v69, &v67) && os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR)) {
    create_gcore_with_options_cold_5();
  }
  v27 = *v23;
  v28 = _NSGetEnviron();
  v29 = posix_spawnp(&v72, v27, 0, &v69, v23, *v28);
  __errnum = v29;
  posix_spawnattr_destroy(&v69);
  v30 = logger;
  if (v29)
  {
    v31 = v29;
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR)) {
      create_gcore_with_options_cold_4(v30);
    }
    goto LABEL_78;
  }
  if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEBUG)) {
    create_gcore_with_options_cold_3(&v72, v30);
  }
  v31 = 0;
  while (2)
  {
    v33 = logger;
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEBUG)) {
      create_gcore_with_options_cold_2(&v65, v66, v33);
    }
    *__error() = 0;
    memset(&v64, 0, sizeof(v64));
    v34 = wait4(v72, &__errnum, 0, &v64);
    v35 = logger;
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEBUG))
    {
      v50 = __errnum;
      v51 = BYTE1(__errnum);
      v52 = strerror(__errnum);
      *(_DWORD *)buf = 67110146;
      v75 = v50;
      v76 = 1024;
      *(_DWORD *)v77 = v34;
      *(_WORD *)&v77[4] = 1024;
      *(_DWORD *)&v77[6] = v50;
      *(_WORD *)v78 = 1024;
      *(_DWORD *)&v78[2] = v51;
      *(_WORD *)v79 = 2080;
      *(void *)&v79[2] = v52;
      _os_log_debug_impl(&dword_24F44D000, v35, OS_LOG_TYPE_DEBUG, "leaving waitpid status=%d wait_ret_value=%d WEXITSTATUS(%d)  errno %d (\"%s\")\n", buf, 0x24u);
    }
    if (v34 != -1)
    {
      v36 = __errnum;
      v37 = __errnum & 0x7F;
      if (v37 == 127)
      {
        if (__errnum >> 8 == 19)
        {
          puts("continued");
        }
        else
        {
          v49 = logger;
          if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            v75 = v36 >> 8;
            _os_log_error_impl(&dword_24F44D000, v49, OS_LOG_TYPE_ERROR, "gcore stopped by signal %d\n", buf, 8u);
            v36 = __errnum;
          }
          printf("stopped by signal %d\n", v36 >> 8);
        }
      }
      else if ((__errnum & 0x7F) != 0)
      {
        v48 = logger;
        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          v75 = v37;
          _os_log_error_impl(&dword_24F44D000, v48, OS_LOG_TYPE_ERROR, "gcore killed by signal %d\n", buf, 8u);
        }
        v31 = 4;
      }
      else
      {
        v31 = BYTE1(__errnum);
        v38 = logger;
        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109632;
          v75 = v36;
          v76 = 1024;
          *(_DWORD *)v77 = v34;
          *(_WORD *)&v77[4] = 1024;
          *(_DWORD *)&v77[6] = v36;
          _os_log_debug_impl(&dword_24F44D000, v38, OS_LOG_TYPE_DEBUG, "gcore exited, status=%d wait_ret_value=%d WEXITSTATUS(%d)\n", buf, 0x14u);
        }
      }
      goto LABEL_108;
    }
    v39 = *__error();
    v40 = logger;
    v41 = os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR);
    if (!v39)
    {
      if (v41)
      {
        v42 = strerror(-1);
        v43 = __errnum;
        v44 = strerror(__errnum);
        v45 = *__error();
        v46 = __error();
        v47 = strerror(*v46);
        *(_DWORD *)buf = 67110402;
        v75 = -1;
        v76 = 2080;
        *(void *)v77 = v42;
        *(_WORD *)&v77[8] = 1024;
        *(_DWORD *)v78 = v43;
        *(_WORD *)&v78[4] = 2080;
        *(void *)v79 = v44;
        *(_WORD *)&v79[8] = 1024;
        v80 = v45;
        v81 = 2080;
        v82 = v47;
        _os_log_error_impl(&dword_24F44D000, v40, OS_LOG_TYPE_ERROR, "Wait finished with result %d (\"%s\") child_ret_value %d \"%s\" errno %d (\"%s\") but no error, trying again", buf, 0x32u);
      }
LABEL_108:
      if ((~__errnum & 0x7F) != 0) {
        goto LABEL_78;
      }
      continue;
    }
    break;
  }
  if (v41) {
    create_gcore_with_options_cold_1(&__errnum, v40);
  }
  v31 = 0xFFFFFFFFLL;
LABEL_78:
  v3 = v59;
  v1 = v31;
LABEL_80:
  if ([v4 count] != -2)
  {
    v32 = 0;
    do
      free(v23[v32++]);
    while (v32 < [v4 count] + 2);
  }
LABEL_112:
  return v1;
}

os_log_t __create_gcore_with_options_block_invoke()
{
  os_log_t result = os_log_create("com.apple.system_cmds", "gcore_framework");
  logger = (uint64_t)result;
  return result;
}

uint64_t get_integer_value(uint64_t a1, void *a2, uint64_t *a3, _DWORD *a4)
{
  uint64_t v6 = [a2 objectForKeyedSubscript:a1];
  if (a4) {
    *a4 = 0;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    *a3 = v6;
  }
  else if (a4)
  {
    *a4 = 34;
  }
  return isKindOfClass & 1;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void create_gcore_with_options_cold_1(_DWORD *a1, NSObject *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v4 = strerror(-1);
  LODWORD(a1) = *a1;
  v5 = strerror((int)a1);
  int v6 = *__error();
  v7 = __error();
  v8 = strerror(*v7);
  v9[0] = 67110402;
  v9[1] = -1;
  __int16 v10 = 2080;
  v11 = v4;
  __int16 v12 = 1024;
  int v13 = (int)a1;
  __int16 v14 = 2080;
  v15 = v5;
  __int16 v16 = 1024;
  int v17 = v6;
  __int16 v18 = 2080;
  v19 = v8;
  _os_log_error_impl(&dword_24F44D000, a2, OS_LOG_TYPE_ERROR, "Wait finished with result %d (\"%s\") child_ret_value %d \"%s\" errno %d (\"%s\")", (uint8_t *)v9, 0x32u);
}

void create_gcore_with_options_cold_2(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_24F44D000, log, OS_LOG_TYPE_DEBUG, "entering in waitpid", buf, 2u);
}

void create_gcore_with_options_cold_3(int *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_24F44D000, a2, OS_LOG_TYPE_DEBUG, "gCore PID %d", (uint8_t *)v3, 8u);
}

void create_gcore_with_options_cold_4(NSObject *a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = __error();
  v3 = strerror(*v2);
  int v4 = 136315138;
  v5 = v3;
  _os_log_error_impl(&dword_24F44D000, a1, OS_LOG_TYPE_ERROR, "Error spawning \"%s\"", (uint8_t *)&v4, 0xCu);
}

void create_gcore_with_options_cold_5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_24F44D000, v0, v1, "Expr posix_spawnattr_setsigmask(&spawnattr, &no_signals) failed with result %d", v2, v3, v4, v5, v6);
}

void create_gcore_with_options_cold_6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_24F44D000, v0, v1, "Expr posix_spawnattr_setsigdefault(&spawnattr, &all_signals) failed with result %d", v2, v3, v4, v5, v6);
}

void create_gcore_with_options_cold_7()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_24F44D000, v0, v1, "Expr posix_spawnattr_setflags(&spawnattr, POSIX_SPAWN_SETSIGDEF | POSIX_SPAWN_SETSIGMASK) failed with result %d", v2, v3, v4, v5, v6);
}

void create_gcore_with_options_cold_8()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_24F44D000, v0, v1, "Expr posix_spawnattr_setflags(&spawnattr, POSIX_SPAWN_CLOEXEC_DEFAULT) failed with result %d", v2, v3, v4, v5, v6);
}

void create_gcore_with_options_cold_9()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_24F44D000, v0, v1, "Expr posix_spawnattr_setflags(&spawnattr, POSIX_SPAWN_SETPGROUP) failed with result %d", v2, v3, v4, v5, v6);
}

void create_gcore_with_options_cold_10()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_24F44D000, v0, v1, "Cannot register corpse port err %d", v2, v3, v4, v5, v6);
}

char ***_NSGetEnviron(void)
{
  return (char ***)MEMORY[0x270ED7D08]();
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

kern_return_t mach_ports_register(task_t target_task, mach_port_array_t init_port_set, mach_msg_type_number_t init_port_setCnt)
{
  return MEMORY[0x270EDA258](*(void *)&target_task, init_port_set, *(void *)&init_port_setCnt);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

void objc_enumerationMutation(id obj)
{
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int posix_spawnattr_destroy(posix_spawnattr_t *a1)
{
  return MEMORY[0x270EDACA8](a1);
}

int posix_spawnattr_init(posix_spawnattr_t *a1)
{
  return MEMORY[0x270EDACB8](a1);
}

int posix_spawnattr_setflags(posix_spawnattr_t *a1, __int16 a2)
{
  return MEMORY[0x270EDACC8](a1, a2);
}

int posix_spawnattr_setsigdefault(posix_spawnattr_t *a1, const sigset_t *a2)
{
  return MEMORY[0x270EDACE0](a1, a2);
}

int posix_spawnattr_setsigmask(posix_spawnattr_t *a1, const sigset_t *a2)
{
  return MEMORY[0x270EDACE8](a1, a2);
}

int posix_spawnp(pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return MEMORY[0x270EDACF0](a1, a2, a3, a4, __argv, __envp);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

int puts(const char *a1)
{
  return MEMORY[0x270EDB098](a1);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

pid_t wait4(pid_t a1, int *a2, int a3, rusage *a4)
{
  return MEMORY[0x270EDBB40](*(void *)&a1, a2, *(void *)&a3, a4);
}