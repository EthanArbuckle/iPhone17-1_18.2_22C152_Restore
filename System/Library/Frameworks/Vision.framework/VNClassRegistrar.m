@interface VNClassRegistrar
+ (BOOL)getClassCode:(unsigned int *)a3 forClass:(Class)a4 error:(id *)a5;
+ (BOOL)getClassCode:(unsigned int *)a3 forClassName:(id)a4 error:(id *)a5;
+ (BOOL)observationBoundsAreNormalizedToROIForRequestClassCode:(unsigned int)a3 revision:(unint64_t)a4;
+ (BOOL)validateRequestClassName:(id)a3 error:(id *)a4;
+ (Class)classForClassCode:(unsigned int)a3 error:(id *)a4;
+ (id)classNameForClassCode:(unsigned int)a3 error:(id *)a4;
+ (unsigned)entryTypeForClassCode:(unsigned int)a3;
+ (unsigned)entryTypeForClassName:(id)a3;
+ (void)enumerateEntriesUsingBlock:(id)a3;
@end

@implementation VNClassRegistrar

+ (BOOL)getClassCode:(unsigned int *)a3 forClassName:(id)a4 error:(id *)a5
{
  id v7 = a4;
  if (getClassCode_forClassName_error__onceToken != -1) {
    dispatch_once(&getClassCode_forClassName_error__onceToken, &__block_literal_global_41);
  }
  v8 = [(id)getClassCode_forClassName_error__ourClassCodeForNameDictionary objectForKeyedSubscript:v7];
  v9 = v8;
  if (v8)
  {
    *a3 = [v8 unsignedIntValue];
  }
  else if (a5)
  {
    v10 = [NSString stringWithFormat:@"%@ does not have a registry entry", v7];
    *a5 = +[VNError errorForDataUnavailableWithLocalizedDescription:v10];
  }
  return v9 != 0;
}

+ (BOOL)getClassCode:(unsigned int *)a3 forClass:(Class)a4 error:(id *)a5
{
  v8 = NSStringFromClass(a4);
  LOBYTE(a5) = [a1 getClassCode:a3 forClassName:v8 error:a5];

  return (char)a5;
}

void __52__VNClassRegistrar_getClassCode_forClassName_error___block_invoke()
{
  v0 = (void *)MEMORY[0x1A6257080]();
  v1 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:182];
  unint64_t v2 = 0xFFFFFFFFFFFFEEF0;
  do
  {
    v3 = (void *)[[NSString alloc] initWithUTF8String:*(void *)&kVNClassRegistry[v2 + 4376]];
    v4 = [NSNumber numberWithUnsignedInt:*(unsigned int *)&kVNClassRegistry[v2 + 4368]];
    [v1 setObject:v4 forKeyedSubscript:v3];

    v2 += 24;
  }
  while (v2);
  uint64_t v5 = [v1 copy];
  v6 = (void *)getClassCode_forClassName_error__ourClassCodeForNameDictionary;
  getClassCode_forClassName_error__ourClassCodeForNameDictionary = v5;
}

+ (BOOL)validateRequestClassName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int v11 = 0;
  int v7 = [a1 getClassCode:&v11 forClassName:v6 error:a4];
  BOOL v8 = 0;
  if (v7)
  {
    if ([v6 hasPrefix:@"VN"]
      && ([v6 hasSuffix:@"Request"] & 1) != 0
      || ([v6 isEqualToString:@"VNVYvzEtX1JlUdu8xx5qhDI"] & 1) != 0
      || ([v6 isEqualToString:@"VN6kBnCOr2mZlSV6yV1dLwB"] & 1) != 0
      || ([v6 isEqualToString:@"VN5kJNH3eYuyaLxNpZr5Z7zi"] & 1) != 0
      || ([v6 isEqualToString:@"VN6Mb1ME89lyW3HpahkEygIG"] & 1) != 0
      || ([v6 isEqualToString:@"VN1JC7R3k4455fKQz0dY1VhQ"] & 1) != 0)
    {
      BOOL v8 = 1;
    }
    else
    {
      if (a4)
      {
        v10 = [NSString stringWithFormat:@"%@ is not a VNRequest subclass", v6];
        *a4 = +[VNError errorForInvalidArgumentWithLocalizedDescription:v10];
      }
      BOOL v8 = 0;
    }
  }

  return v8;
}

+ (id)classNameForClassCode:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  if (classNameForClassCode_error__onceToken != -1) {
    dispatch_once(&classNameForClassCode_error__onceToken, &__block_literal_global_34);
  }
  id v6 = [NSNumber numberWithUnsignedInt:v5];
  int v7 = [(id)classNameForClassCode_error__ourClassNameForCodeMap objectForKeyedSubscript:v6];
  BOOL v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else if (a4)
  {
    v10 = [NSString stringWithFormat:@"%@ is not a registered class code", VisionCoreFourCharCodeToString()];
    *a4 = +[VNError errorForDataUnavailableWithLocalizedDescription:v10];
  }

  return v8;
}

void __48__VNClassRegistrar_classNameForClassCode_error___block_invoke()
{
  v0 = (void *)MEMORY[0x1A6257080]();
  v1 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:182];
  unint64_t v2 = 0xFFFFFFFFFFFFEEF0;
  do
  {
    v3 = [NSNumber numberWithUnsignedInt:*(unsigned int *)&kVNClassRegistry[v2 + 4368]];
    v4 = (void *)[[NSString alloc] initWithUTF8String:*(void *)&kVNClassRegistry[v2 + 4376]];
    [v1 setObject:v4 forKeyedSubscript:v3];

    v2 += 24;
  }
  while (v2);
  uint64_t v5 = [v1 copy];
  id v6 = (void *)classNameForClassCode_error__ourClassNameForCodeMap;
  classNameForClassCode_error__ourClassNameForCodeMap = v5;
}

+ (Class)classForClassCode:(unsigned int)a3 error:(id *)a4
{
  objc_msgSend(a1, "classNameForClassCode:error:", *(void *)&a3);
  uint64_t v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  id v6 = v5;
  if (v5)
  {
    Class v7 = NSClassFromString(v5);
    Class v8 = v7;
    if (a4 && !v7)
    {
      id v9 = [NSString stringWithFormat:@"%@ is no longer supported by Vision", v6];
      *a4 = +[VNError errorForDataUnavailableWithLocalizedDescription:v9];
    }
    v10 = v8;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (unsigned)entryTypeForClassCode:(unsigned int)a3
{
  self;
  if (_entryForClassCode__onceToken != -1) {
    dispatch_once(&_entryForClassCode__onceToken, &__block_literal_global_27);
  }
  value = 0;
  if (!NSMapMember((NSMapTable *)_entryForClassCode__ourClassCodeToRegistryEntryTable, (const void *)a3, 0, &value)
    || value == 0)
  {
    return 0;
  }
  else
  {
    return *((unsigned char *)value + 16);
  }
}

void __39__VNClassRegistrar__entryForClassCode___block_invoke()
{
  uint64_t v0 = 182;
  uint64_t v1 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:1282 valueOptions:2 capacity:182];
  unint64_t v2 = (void *)_entryForClassCode__ourClassCodeToRegistryEntryTable;
  _entryForClassCode__ourClassCodeToRegistryEntryTable = v1;

  v3 = "fgla";
  v4 = "fgla";
  do
  {
    unsigned int v5 = *(_DWORD *)v4;
    v4 += 24;
    NSMapInsertKnownAbsent((NSMapTable *)_entryForClassCode__ourClassCodeToRegistryEntryTable, (const void *)v5, v3);
    v3 = v4;
    --v0;
  }
  while (v0);
}

+ (unsigned)entryTypeForClassName:(id)a3
{
  id v3 = a3;
  self;
  if (_entryForClassName__onceToken != -1) {
    dispatch_once(&_entryForClassName__onceToken, &__block_literal_global_514);
  }
  value = 0;
  v4 = (NSMapTable *)_entryForClassName__ourClassNameToRegistryEntryTable;
  id v5 = v3;
  id v6 = (const void *)[v5 UTF8String];

  BOOL v7 = NSMapMember(v4, v6, 0, &value);
  unsigned __int8 result = 0;
  if (v7)
  {
    if (value) {
      return *((unsigned char *)value + 16);
    }
  }
  return result;
}

void __39__VNClassRegistrar__entryForClassName___block_invoke()
{
  uint64_t v0 = 182;
  uint64_t v1 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:770 valueOptions:2 capacity:182];
  unint64_t v2 = (void *)_entryForClassName__ourClassNameToRegistryEntryTable;
  _entryForClassName__ourClassNameToRegistryEntryTable = v1;

  id v3 = (const void **)"fgla";
  do
  {
    NSMapInsertKnownAbsent((NSMapTable *)_entryForClassName__ourClassNameToRegistryEntryTable, v3[1], v3);
    v3 += 3;
    --v0;
  }
  while (v0);
}

+ (void)enumerateEntriesUsingBlock:(id)a3
{
  id v3 = (void (**)(id, uint64_t, uint64_t, void *, char *))a3;
  v4 = (void *)MEMORY[0x1A6257080]();
  char v12 = 0;
  uint64_t v5 = 181;
  id v6 = &off_1E5B1AD30;
  do
  {
    uint64_t v7 = *((unsigned __int8 *)v6 + 8);
    uint64_t v8 = *((unsigned int *)v6 - 2);
    id v9 = *v6;
    v6 += 3;
    v10 = [NSString stringWithUTF8String:v9];
    v3[2](v3, v7, v8, v10, &v12);

    if (v12) {
      BOOL v11 = 1;
    }
    else {
      BOOL v11 = v5 == 0;
    }
    --v5;
  }
  while (!v11);
}

+ (BOOL)observationBoundsAreNormalizedToROIForRequestClassCode:(unsigned int)a3 revision:(unint64_t)a4
{
  BOOL result = 0;
  if ((int)a3 > 1146386547)
  {
    if ((int)a3 <= 1196384850)
    {
      if (a3 == 1146386548) {
        return result;
      }
      if (a3 == 1195471955)
      {
        BOOL result = 0;
        uint64_t v6 = -61441;
LABEL_22:
        if (a4 + (v6 & 0xFFFFFFFF0000FFFFLL | 0x21350000) >= 2 && a4 != 1) {
          return 1;
        }
        return result;
      }
      int v5 = 1195994451;
    }
    else
    {
      if ((int)a3 <= 1752327526)
      {
        if (a3 != 1196384851)
        {
          int v5 = 1380019817;
          goto LABEL_18;
        }
        BOOL result = 0;
        uint64_t v6 = -61440;
        goto LABEL_22;
      }
      if (a3 == 1752327527) {
        return result;
      }
      int v5 = 1768777584;
    }
LABEL_18:
    if (a3 == v5) {
      return result;
    }
    return 1;
  }
  if ((int)a3 <= 1145463138)
  {
    if (a3 == 1145201010) {
      return a4 != 1;
    }
    if (a3 == 1145455441) {
      return result;
    }
    int v5 = 1145457773;
    goto LABEL_18;
  }
  if (a3 != 1145463139 && a3 != 1145599314)
  {
    int v5 = 1146250595;
    goto LABEL_18;
  }
  return result;
}

@end