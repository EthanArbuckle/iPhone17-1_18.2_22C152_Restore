BOOL ARFileDescriptorIsTTY(FILE *a1)
{
  int v2;
  BOOL v3;

  if (ARFileDescriptorIsTTY_onceToken != -1) {
    dispatch_once(&ARFileDescriptorIsTTY_onceToken, &__block_literal_global);
  }
  v2 = fileno(a1);
  if (isatty(v2)) {
    v3 = ARFileDescriptorIsTTY_isSSHTTY == 0;
  }
  else {
    v3 = 1;
  }
  return !v3;
}

void __ARFileDescriptorIsTTY_block_invoke()
{
  id v2 = [MEMORY[0x263F08AB0] processInfo];
  v0 = [v2 environment];
  v1 = [v0 objectForKey:@"SSH_TTY"];
  ARFileDescriptorIsTTY_isSSHTTY = v1 != 0;
}

void _printFormat(FILE *a1, void *a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v5 = (objc_class *)NSString;
  id v6 = a2;
  v7 = (void *)[[v5 alloc] initWithFormat:v6 arguments:a3];

  id v8 = v7;
  fprintf(a1, "%s\n", (const char *)[v8 UTF8String]);
  v9 = _ARLogGeneral();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v8;
    _os_log_impl(&dword_21FAFB000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
}

id _ARLogGeneral()
{
  if (_ARLogGeneral_onceToken != -1) {
    dispatch_once(&_ARLogGeneral_onceToken, &__block_literal_global_58);
  }
  v0 = (void *)_ARLogGeneral_logObj;

  return v0;
}

void _printMessageWithColor(FILE *a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (ARFileDescriptorIsTTY(a1))
  {
    fputs((const char *)[v5 UTF8String], a1);
    fputs((const char *)[v6 UTF8String], a1);
    v7 = (const char *)[@"\x1B[0m" UTF8String];
  }
  else
  {
    v7 = (const char *)&unk_21FAFCBF9;
    fputs((const char *)&unk_21FAFCBF9, a1);
    fputs((const char *)[v6 UTF8String], a1);
  }
  fprintf(a1, "%s\n", v7);
  id v8 = _ARLogGeneral();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v10 = v6;
    _os_log_impl(&dword_21FAFB000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
}

void printMessage(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void _printMessage(void *a1, uint64_t a2)
{
}

double printVector3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  printMessage(@"%s: (%f, %f, %f)", a2, a3, a4, a5, a6, a7, a8, a1);
  return result;
}

void printError(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void _printError(void *a1, uint64_t a2)
{
  v3 = (objc_class *)NSString;
  id v4 = a1;
  id v5 = [v3 alloc];
  id v6 = [NSString stringWithFormat:@"%@", v4];

  id v8 = (id)[v5 initWithFormat:v6 arguments:a2];
  v7 = [NSString stringWithFormat:@"❌  ERROR: %@\n", v8];
  _printMessageWithColor((FILE *)*MEMORY[0x263EF8348], @"\x1B[1;35m", v7);
}

void printInfo(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void _printInfo(void *a1, uint64_t a2)
{
  v3 = (objc_class *)NSString;
  id v4 = a1;
  id v5 = [v3 alloc];
  id v6 = [NSString stringWithFormat:@"%@", v4];

  id v8 = (id)[v5 initWithFormat:v6 arguments:a2];
  v7 = [NSString stringWithFormat:@"ℹ️  INFO: %@\n", v8];
  _printMessageWithColor((FILE *)*MEMORY[0x263EF8358], @"\x1B[1;35m", v7);
}

void printWarning(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void _printWarning(void *a1, uint64_t a2)
{
  v3 = (objc_class *)NSString;
  id v4 = a1;
  id v5 = [v3 alloc];
  id v6 = [NSString stringWithFormat:@"%@", v4];

  id v8 = (id)[v5 initWithFormat:v6 arguments:a2];
  v7 = [NSString stringWithFormat:@"⚠️  WARNING: %@\n", v8];
  _printMessageWithColor((FILE *)*MEMORY[0x263EF8358], @"\x1B[1;35m", v7);
}

void printColoredMessage(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void _printColoredMessage(void *a1, void *a2, uint64_t a3)
{
  id v5 = (objc_class *)NSString;
  id v6 = a2;
  id v7 = a1;
  id v8 = [v5 alloc];
  v9 = [NSString stringWithFormat:@"%@", v6];

  id v10 = (id)[v8 initWithFormat:v9 arguments:a3];
  _printMessageWithColor((FILE *)*MEMORY[0x263EF8358], v7, v10);
}

void ARPrintUsageStrings(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  printColoredMessage(@"\x1B[1m", @"Usage:", a3, a4, a5, a6, a7, a8, vars0);

  printMessage(@" arkitctl <COMMAND> [help]\n", v9, v10, v11, v12, v13, v14, v15, a9);
}

uint64_t ARPrintToiTerm(void *a1)
{
  id v1 = a1;
  printf("\x1B]1337;File=[size=%lld;inline=1;preserveAspectRatio=1]:", [v1 length]);
  id v2 = [v1 base64EncodedStringWithOptions:0];

  id v3 = v2;
  puts((const char *)[v3 UTF8String]);

  return puts("\a");
}

uint64_t ARPrintEscapeEnableAlternativeBuffer()
{
  printf("%s", "\x1B[?1049h");
  v0 = (FILE *)*MEMORY[0x263EF8358];

  return fflush(v0);
}

uint64_t ARPrintEscapeDisableAlternativeBuffer()
{
  printf("%s", "\x1B[?1049l");
  v0 = (FILE *)*MEMORY[0x263EF8358];

  return fflush(v0);
}

uint64_t ARPrintEscapeEraseScreen()
{
  printf("%s", "\x1B[2J");
  v0 = (FILE *)*MEMORY[0x263EF8358];

  return fflush(v0);
}

uint64_t ARPrintEscapeMoveToLocation(int a1, int a2)
{
  printf("\x1B[%d;%dH", a1, a2);
  id v2 = (FILE *)*MEMORY[0x263EF8358];

  return fflush(v2);
}

id ARKitBuildVersionString()
{
  v0 = [MEMORY[0x263F086E0] _bundleWithIdentifier:@"com.apple.ARKit" andLibraryName:@"ARKit"];
  id v1 = [v0 infoDictionary];
  id v2 = [v1 objectForKeyedSubscript:@"CFBundleVersion"];

  return v2;
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

int fflush(FILE *a1)
{
  return MEMORY[0x270ED9938](a1);
}

int fileno(FILE *a1)
{
  return MEMORY[0x270ED9978](a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x270ED9A20](a1, a2);
}

int isatty(int a1)
{
  return MEMORY[0x270ED9EF0](*(void *)&a1);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

int puts(const char *a1)
{
  return MEMORY[0x270EDB098](a1);
}