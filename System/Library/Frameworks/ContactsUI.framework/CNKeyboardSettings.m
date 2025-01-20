@interface CNKeyboardSettings
+ (BOOL)contentsIsSingleValue:(id)a3;
+ (BOOL)usesTextSuggestionDelegate:(id)a3;
+ (id)newKeyboardSettingsForProperty:(id)a3;
+ (int64_t)autocapitalizationTypeFromDictionary:(id)a3;
+ (int64_t)autocorrectionTypeFromDictionary:(id)a3;
+ (int64_t)keyboardTypeFromDictionary:(id)a3;
@end

@implementation CNKeyboardSettings

+ (BOOL)usesTextSuggestionDelegate:(id)a3
{
  v3 = [a3 valueForKey:@"suggest-delegate"];
  v4 = v3;
  if (v3) {
    BOOL v5 = [v3 caseInsensitiveCompare:@"yes"] == 0;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

+ (BOOL)contentsIsSingleValue:(id)a3
{
  v3 = [a3 valueForKey:@"single"];
  v4 = v3;
  if (v3) {
    BOOL v5 = [v3 caseInsensitiveCompare:@"yes"] == 0;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

+ (int64_t)autocapitalizationTypeFromDictionary:(id)a3
{
  v3 = [a3 valueForKey:@"caps"];
  v4 = v3;
  if (!v3) {
    goto LABEL_8;
  }
  if (![v3 caseInsensitiveCompare:@"all"])
  {
    int64_t v5 = 3;
    goto LABEL_11;
  }
  if ([v4 caseInsensitiveCompare:@"word"])
  {
    if ([v4 caseInsensitiveCompare:@"none"])
    {
      if ([v4 caseInsensitiveCompare:@"sentence"]) {
        int64_t v5 = 1;
      }
      else {
        int64_t v5 = 2;
      }
    }
    else
    {
      int64_t v5 = 0;
    }
  }
  else
  {
LABEL_8:
    int64_t v5 = 1;
  }
LABEL_11:

  return v5;
}

+ (int64_t)autocorrectionTypeFromDictionary:(id)a3
{
  v3 = [a3 valueForKey:@"suggest"];
  v4 = v3;
  if (v3)
  {
    if ([v3 caseInsensitiveCompare:@"context"]) {
      int64_t v5 = 1;
    }
    else {
      int64_t v5 = 2;
    }
  }
  else
  {
    int64_t v5 = 1;
  }

  return v5;
}

+ (int64_t)keyboardTypeFromDictionary:(id)a3
{
  v3 = [a3 valueForKey:@"fmt"];
  v4 = v3;
  if (v3 && [v3 caseInsensitiveCompare:@"alpha"])
  {
    if ([v4 caseInsensitiveCompare:@"num"])
    {
      if ([v4 caseInsensitiveCompare:@"phone"])
      {
        if ([v4 caseInsensitiveCompare:@"url"])
        {
          if ([v4 caseInsensitiveCompare:@"email"]) {
            int64_t v5 = 0;
          }
          else {
            int64_t v5 = 7;
          }
        }
        else
        {
          int64_t v5 = 3;
        }
      }
      else
      {
        int64_t v5 = 5;
      }
    }
    else
    {
      int64_t v5 = 2;
    }
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

+ (id)newKeyboardSettingsForProperty:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x1E4F1AEE0]])
  {
    uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"phone", @"none", @"never", &stru_1ED8AC728, @"yes", @"yes", 0);
    goto LABEL_10;
  }
  if ([v3 isEqualToString:*MEMORY[0x1E4F1AED0]])
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1C978]);
    v13 = @" ";
    v6 = @"context";
    v7 = @"sentence";
    goto LABEL_5;
  }
  if ([v3 isEqualToString:*MEMORY[0x1E4F1AFB0]])
  {
    uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"url", @"none", @"never", &stru_1ED8AC728, @"no", @"no", 0);
  }
  else
  {
    if (![v3 isEqualToString:*MEMORY[0x1E4F1ADC8]])
    {
      if ([v3 isEqualToString:*MEMORY[0x1E4F1AE60]])
      {
        id v5 = objc_alloc(MEMORY[0x1E4F1C978]);
      }
      else
      {
        int v12 = [v3 isEqualToString:*MEMORY[0x1E4F1AF78]];
        id v5 = objc_alloc(MEMORY[0x1E4F1C978]);
        if (!v12)
        {
          v13 = &stru_1ED8AC728;
          v6 = @"never";
          v7 = @"word";
          goto LABEL_5;
        }
      }
      v13 = &stru_1ED8AC728;
      v6 = @"never";
      v7 = @"none";
LABEL_5:
      uint64_t v4 = objc_msgSend(v5, "initWithObjects:", @"alpha", v7, v6, v13, @"no", @"no", 0);
      goto LABEL_10;
    }
    uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"email", @"none", @"never", &stru_1ED8AC728, @"no", @"no", 0);
  }
LABEL_10:
  v8 = (void *)v4;
  if (v4)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"fmt", @"caps", @"suggest", @"sep", @"single", @"suggest-delegate", 0);
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithObjects:v8 forKeys:v9];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end