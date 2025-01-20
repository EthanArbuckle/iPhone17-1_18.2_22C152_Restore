@interface CNAbstractActivityAlertDescription
- (BOOL)canUnifyValue:(id)a3 withValue:(id)a4;
- (Class)valueClass;
- (id)CNMutableValueForABMultivalue;
- (id)CNValueFromABValue:(void *)a3;
- (void)ABValueFromCNValue:(id)a3;
@end

@implementation CNAbstractActivityAlertDescription

- (BOOL)canUnifyValue:(id)a3 withValue:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [v6 sound];
  v8 = [v5 sound];
  if (v7) {
    v9 = v7;
  }
  else {
    v9 = &stru_1EE052B80;
  }
  if (v8) {
    v10 = v8;
  }
  else {
    v10 = &stru_1EE052B80;
  }
  uint64_t v11 = [(__CFString *)v9 localizedCaseInsensitiveCompare:v10];

  v12 = [v6 vibration];
  v13 = [v5 vibration];
  if (v12) {
    v14 = v12;
  }
  else {
    v14 = &stru_1EE052B80;
  }
  if (v13) {
    v15 = v13;
  }
  else {
    v15 = &stru_1EE052B80;
  }
  uint64_t v16 = [(__CFString *)v14 localizedCaseInsensitiveCompare:v15];

  char v17 = [v6 ignoreMute];
  char v18 = [v5 ignoreMute];

  char v19 = v17 ^ v18 ^ 1;
  if (v16) {
    char v19 = 0;
  }
  if (v11) {
    return 0;
  }
  else {
    return v19;
  }
}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (id)CNMutableValueForABMultivalue
{
  v2 = objc_opt_new();

  return v2;
}

- (id)CNValueFromABValue:(void *)a3
{
  v4 = CFDictionaryGetValue((CFDictionaryRef)a3, @"tone");
  id v5 = CFDictionaryGetValue((CFDictionaryRef)a3, @"vibration");
  id v6 = CFDictionaryGetValue((CFDictionaryRef)a3, @"ignoreMute");
  uint64_t v7 = *MEMORY[0x1E4F5A298];
  if ((*(unsigned int (**)(void, void *))(*MEMORY[0x1E4F5A298] + 16))(*MEMORY[0x1E4F5A298], v4)
    && (*(unsigned int (**)(uint64_t, void *))(v7 + 16))(v7, v5)
    && ((*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v6) & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    v8 = -[CNActivityAlert initWithSound:vibration:ignoreMute:]([CNActivityAlert alloc], "initWithSound:vibration:ignoreMute:", v4, v5, [v6 isEqualToString:@"YES"]);
  }

  return v8;
}

- (void)ABValueFromCNValue:(id)a3
{
  id v3 = a3;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 2, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  id v5 = [v3 sound];
  uint64_t v6 = [v5 length];

  if (v6) {
    CFDictionarySetValue(Mutable, @"tone", (const void *)[v3 sound]);
  }
  uint64_t v7 = [v3 vibration];
  uint64_t v8 = [v7 length];

  if (v8) {
    CFDictionarySetValue(Mutable, @"vibration", (const void *)[v3 vibration]);
  }
  if ([v3 ignoreMute]) {
    CFDictionarySetValue(Mutable, @"ignoreMute", @"YES");
  }
  if (Mutable) {
    Mutable = (__CFDictionary *)CFAutorelease(Mutable);
  }

  return Mutable;
}

@end