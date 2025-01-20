@interface ATXTypes
+ (BOOL)isActionSpotlightConsumerSubType:(unsigned __int8)a3;
+ (id)consumerMapping;
+ (id)consumerSubtypeMapping;
+ (id)inverseConsumerSubtypeMapping;
+ (id)safeStringForConsumerSubtype:(unsigned __int8)a3;
+ (id)stringForConsumerSubtype:(unsigned __int8)a3;
+ (id)stringForConsumerType:(unint64_t)a3;
+ (id)stringForEngagementType:(unint64_t)a3;
+ (id)uiTypeForActionConsumerSubType:(unsigned __int8)a3;
+ (id)validConsumerSubTypeList;
+ (id)validConsumerSubTypes;
+ (id)validConsumerTypeList;
+ (id)validConsumerTypes;
+ (unint64_t)consumerTypeForString:(id)a3 found:(BOOL *)a4;
+ (unint64_t)consumerTypeForSubType:(unsigned __int8)a3;
+ (unint64_t)engagementTypeForString:(id)a3 found:(BOOL *)a4;
+ (unsigned)consumerSubtypeForString:(id)a3 found:(BOOL *)a4;
+ (void)iterConsumerSubTypesWithBlock:(id)a3;
+ (void)iterConsumerTypesWithBlock:(id)a3;
@end

@implementation ATXTypes

+ (id)stringForConsumerSubtype:(unsigned __int8)a3
{
  unsigned int v3 = a3;
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a3 < 0x30u) {
    return off_1E68A34B0[(char)a3];
  }
  v5 = __atxlog_handle_default();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v7 = v3;
    _os_log_error_impl(&dword_1D0F2B000, v5, OS_LOG_TYPE_ERROR, "stringForConsumerSubtype called with invalid ATXConsumerSubType value of %lu", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"stringForConsumerSubtype called with invalid ATXConsumerSubType value of %lu", v3);
  return @"Error";
}

+ (id)stringForEngagementType:(unint64_t)a3
{
  if (a3 < 7) {
    return off_1E68A33C8[a3];
  }
  v5 = __atxlog_handle_default();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    +[ATXTypes stringForEngagementType:](a3, v5);
  }

  objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"stringForConsumerType called with invalid ATXEngagementType value of %lu", a3);
  return @"Error";
}

+ (id)stringForConsumerType:(unint64_t)a3
{
  if (a3 < 0x16) {
    return off_1E68A3400[a3];
  }
  v5 = __atxlog_handle_default();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    +[ATXTypes stringForConsumerType:](a3, v5);
  }

  objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"stringForConsumerType called with invalid ATXConsumerType value of %lu", a3);
  return @"Error";
}

+ (id)safeStringForConsumerSubtype:(unsigned __int8)a3
{
  switch(a3)
  {
    case '&':
      v5 = @"ActionSuggestionAvocado";
      break;
    case '%':
      v5 = @"AppSuggestionAvocado";
      break;
    case '#':
      v5 = @"Dewey";
      break;
    default:
      v5 = +[ATXTypes stringForConsumerSubtype:v3];
      break;
  }
  return v5;
}

+ (id)consumerMapping
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:22];
  for (uint64_t i = 0; i != 22; ++i)
  {
    v5 = [a1 stringForConsumerType:i];
    v6 = [NSNumber numberWithUnsignedInteger:i];
    [v3 setObject:v5 forKeyedSubscript:v6];
  }
  return v3;
}

+ (id)consumerSubtypeMapping
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:48];
  int v4 = 0;
  do
  {
    unsigned int v5 = v4;
    v6 = [a1 stringForConsumerSubtype:v4];
    uint64_t v7 = [NSNumber numberWithUnsignedChar:v4];
    [v3 setObject:v6 forKeyedSubscript:v7];

    ++v4;
  }
  while (v5 < 0x2F);
  return v3;
}

+ (id)inverseConsumerSubtypeMapping
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:48];
  int v4 = 0;
  do
  {
    unsigned int v5 = v4;
    v6 = [NSNumber numberWithUnsignedChar:v4];
    uint64_t v7 = [a1 stringForConsumerSubtype:v4];
    [v3 setObject:v6 forKeyedSubscript:v7];

    ++v4;
  }
  while (v5 < 0x2F);
  return v3;
}

+ (id)validConsumerTypes
{
  v2 = objc_opt_new();
  for (uint64_t i = 0; i != 22; ++i)
  {
    int v4 = +[ATXTypes stringForConsumerType:i];
    [v2 addObject:v4];
  }
  return v2;
}

+ (id)validConsumerTypeList
{
  v2 = [(id)objc_opt_class() validConsumerTypes];
  uint64_t v3 = objc_opt_new();
  if ([v2 count])
  {
    unint64_t v4 = 0;
    do
    {
      unsigned int v5 = [v2 objectAtIndexedSubscript:v4];
      [v3 appendString:v5];

      if ([v2 count] - 1 > v4) {
        [v3 appendString:@", "];
      }
      ++v4;
    }
    while ([v2 count] > v4);
  }

  return v3;
}

+ (id)validConsumerSubTypes
{
  v2 = objc_opt_new();
  int v3 = 0;
  do
  {
    unsigned int v4 = v3;
    unsigned int v5 = +[ATXTypes stringForConsumerSubtype:v3];
    [v2 addObject:v5];

    ++v3;
  }
  while (v4 < 0x2F);
  return v2;
}

+ (id)validConsumerSubTypeList
{
  v2 = [(id)objc_opt_class() validConsumerSubTypes];
  int v3 = objc_opt_new();
  if ([v2 count])
  {
    unint64_t v4 = 0;
    do
    {
      unsigned int v5 = [v2 objectAtIndexedSubscript:v4];
      [v3 appendString:v5];

      if ([v2 count] - 1 > v4) {
        [v3 appendString:@", "];
      }
      ++v4;
    }
    while ([v2 count] > v4);
  }

  return v3;
}

+ (id)uiTypeForActionConsumerSubType:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  char v5 = a3 - 16;
  if (a3 - 16) < 0x19 && ((0x1D0007Fu >> v5)) {
    return off_1E68A3630[v5];
  }
  v6 = __atxlog_handle_default();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    +[ATXTypes uiTypeForActionConsumerSubType:v6];
  }

  uint64_t v7 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v8 = *MEMORY[0x1E4F1C3B8];
  v9 = [a1 stringForConsumerSubtype:v3];
  [v7 raise:v8, @"unsupported consumerSubType of %@ passed into uiTypeForActionConsumerSubType", v9 format];

  return @"SPOTLIGHT";
}

+ (unint64_t)engagementTypeForString:(id)a3 found:(BOOL *)a4
{
  id v6 = a3;
  unint64_t v7 = 0;
  while (1)
  {
    uint64_t v8 = [a1 stringForEngagementType:v7];
    int v9 = [v8 isEqualToString:v6];

    if (v9) {
      break;
    }
    if (++v7 == 7)
    {
      unint64_t v7 = 0;
      if (!a4) {
        goto LABEL_9;
      }
      BOOL v10 = 0;
      goto LABEL_8;
    }
  }
  if (!a4) {
    goto LABEL_9;
  }
  BOOL v10 = 1;
LABEL_8:
  *a4 = v10;
LABEL_9:

  return v7;
}

+ (unint64_t)consumerTypeForString:(id)a3 found:(BOOL *)a4
{
  id v6 = a3;
  unint64_t v7 = 0;
  while (1)
  {
    uint64_t v8 = [a1 stringForConsumerType:v7];
    int v9 = [v8 isEqualToString:v6];

    if (v9) {
      break;
    }
    if (++v7 == 22)
    {
      unint64_t v7 = 0;
      if (!a4) {
        goto LABEL_9;
      }
      BOOL v10 = 0;
      goto LABEL_8;
    }
  }
  if (!a4) {
    goto LABEL_9;
  }
  BOOL v10 = 1;
LABEL_8:
  *a4 = v10;
LABEL_9:

  return v7;
}

+ (unsigned)consumerSubtypeForString:(id)a3 found:(BOOL *)a4
{
  id v6 = a3;
  unsigned __int8 v7 = 0;
  while (1)
  {
    unsigned int v8 = v7;
    int v9 = [a1 stringForConsumerSubtype:v7];
    int v10 = [v9 isEqualToString:v6];

    if (v10) {
      break;
    }
    ++v7;
    if (v8 >= 0x2F)
    {
      BOOL v11 = 0;
      unsigned __int8 v7 = 0;
      if (!a4) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  if (!a4) {
    goto LABEL_9;
  }
  BOOL v11 = 1;
LABEL_8:
  *a4 = v11;
LABEL_9:

  return v7;
}

+ (unint64_t)consumerTypeForSubType:(unsigned __int8)a3
{
  if (a3 > 0x30u) {
    return 0;
  }
  else {
    return qword_1D0F3BB48[(char)a3];
  }
}

+ (BOOL)isActionSpotlightConsumerSubType:(unsigned __int8)a3
{
  return (a3 & 0xFE) == 0x12 || (a3 & 0xFE) == 20;
}

+ (void)iterConsumerTypesWithBlock:(id)a3
{
  uint64_t v3 = (void (**)(id, uint64_t, unsigned __int8 *))a3;
  uint64_t v4 = 0;
  unsigned __int8 v8 = 0;
  do
  {
    char v5 = (void *)MEMORY[0x1D25F3B80]();
    v3[2](v3, v4, &v8);
    int v6 = v8;
    if (v6) {
      BOOL v7 = 1;
    }
    else {
      BOOL v7 = v4 == 21;
    }
    ++v4;
  }
  while (!v7);
}

+ (void)iterConsumerSubTypesWithBlock:(id)a3
{
  uint64_t v3 = (void (**)(id, void, unsigned __int8 *))a3;
  uint64_t v4 = 0;
  unsigned __int8 v8 = 0;
  do
  {
    char v5 = (void *)MEMORY[0x1D25F3B80]();
    v3[2](v3, v4, &v8);
    int v6 = v8;
    if (v6) {
      break;
    }
  }
  while (v4++ != 47);
}

+ (void)stringForEngagementType:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0F2B000, a2, OS_LOG_TYPE_ERROR, "stringForConsumerType called with invalid ATXEngagementType value of %lu", (uint8_t *)&v2, 0xCu);
}

+ (void)stringForConsumerType:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0F2B000, a2, OS_LOG_TYPE_ERROR, "stringForConsumerType called with invalid ATXConsumerType value of %lu", (uint8_t *)&v2, 0xCu);
}

+ (void)uiTypeForActionConsumerSubType:(NSObject *)a3 .cold.1(void *a1, unsigned __int8 a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 stringForConsumerSubtype:a2];
  int v5 = 138412290;
  int v6 = v4;
  _os_log_error_impl(&dword_1D0F2B000, a3, OS_LOG_TYPE_ERROR, "unsupported consumerSubType of %@ passed into uiTypeForActionConsumerSubType", (uint8_t *)&v5, 0xCu);
}

@end