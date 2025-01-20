@interface ABVCardActivityAlertSerialization
+ (id)activityAlertWithString:(id)a3;
+ (id)dictionaryWithType:(id)a3 info:(id)a4;
+ (id)infoFromDictionary:(id)a3;
+ (id)stringWithType:(id)a3 info:(id)a4;
+ (id)typeFromDictionary:(id)a3;
+ (void)parseString:(id)a3 intoTypeAndInfo:(id)a4;
@end

@implementation ABVCardActivityAlertSerialization

+ (id)stringWithType:(id)a3 info:(id)a4
{
  uint64_t v4 = [a1 dictionaryWithType:a3 info:a4];
  return +[ABVCardActivityAlertSerializer serializeDictionary:v4];
}

+ (id)dictionaryWithType:(id)a3 info:(id)a4
{
  v6 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  if (a3)
  {
    if ([a3 caseInsensitiveCompare:@"com.apple.activityalert.call"])
    {
      if ([a3 caseInsensitiveCompare:@"com.apple.activityalert.text"]) {
        v7 = (__CFString *)a3;
      }
      else {
        v7 = @"text";
      }
    }
    else
    {
      v7 = @"call";
    }
    [v6 setObject:v7 forKey:@"type"];
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__ABVCardActivityAlertSerialization_dictionaryWithType_info___block_invoke;
  v9[3] = &unk_1E5989A30;
  v9[4] = v6;
  [a4 enumerateKeysAndObjectsUsingBlock:v9];
  return v6;
}

uint64_t __61__ABVCardActivityAlertSerialization_dictionaryWithType_info___block_invoke(uint64_t a1, __CFString *a2, uint64_t a3)
{
  if ([(__CFString *)a2 caseInsensitiveCompare:@"sound"])
  {
    if ([(__CFString *)a2 caseInsensitiveCompare:@"vibration"]) {
      v6 = a2;
    }
    else {
      v6 = @"vib";
    }
  }
  else
  {
    v6 = @"snd";
  }
  v7 = *(void **)(a1 + 32);
  return [v7 setObject:a3 forKey:v6];
}

+ (void)parseString:(id)a3 intoTypeAndInfo:(id)a4
{
  uint64_t v6 = [a1 activityAlertWithString:a3];
  uint64_t v7 = [a1 typeFromDictionary:v6];
  uint64_t v8 = [a1 infoFromDictionary:v6];
  v9 = (void (*)(id, uint64_t, uint64_t))*((void *)a4 + 2);
  v9(a4, v7, v8);
}

+ (id)activityAlertWithString:(id)a3
{
  return +[ABVCardActivityAlertScanner scanAlertValueFromString:a3];
}

+ (id)typeFromDictionary:(id)a3
{
  id result = (id)[a3 objectForKeyedSubscript:@"type"];
  if (result)
  {
    id v4 = result;
    if ([result caseInsensitiveCompare:@"call"])
    {
      if ([v4 caseInsensitiveCompare:@"text"]) {
        return v4;
      }
      else {
        return @"com.apple.activityalert.text";
      }
    }
    else
    {
      return @"com.apple.activityalert.call";
    }
  }
  return result;
}

+ (id)infoFromDictionary:(id)a3
{
  id v4 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__ABVCardActivityAlertSerialization_infoFromDictionary___block_invoke;
  v6[3] = &unk_1E5989A30;
  v6[4] = v4;
  [a3 enumerateKeysAndObjectsUsingBlock:v6];
  return v4;
}

uint64_t __56__ABVCardActivityAlertSerialization_infoFromDictionary___block_invoke(uint64_t a1, __CFString *a2, uint64_t a3)
{
  id v4 = a2;
  uint64_t result = [(__CFString *)a2 caseInsensitiveCompare:@"type"];
  if (result)
  {
    if ([(__CFString *)v4 caseInsensitiveCompare:@"snd"])
    {
      uint64_t result = [(__CFString *)v4 caseInsensitiveCompare:@"vib"];
      if (result)
      {
        if (!v4) {
          return result;
        }
      }
      else
      {
        id v4 = @"vibration";
      }
    }
    else
    {
      id v4 = @"sound";
    }
    uint64_t v7 = *(void **)(a1 + 32);
    return [v7 setObject:a3 forKey:v4];
  }
  return result;
}

@end