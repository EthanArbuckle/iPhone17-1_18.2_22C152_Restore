@interface CNTextAlertDescription
- (BOOL)abPropertyID:(int *)a3;
- (BOOL)applyABMultivalueValueBytes:(char *)a3 length:(unint64_t)a4 identifier:(id)a5 legacyIdentifier:(int)a6 label:(id)a7 toCNMultivalueRepresentation:(id)a8;
- (BOOL)isEqualForContact:(id)a3 other:(id)a4;
- (BOOL)setABValue:(void *)a3 onABPerson:(void *)a4 error:(__CFError *)a5;
- (CNTextAlertDescription)init;
- (id)CNValueForContact:(id)a3;
- (void)ABValueForABPerson:(void *)a3;
- (void)decodeUsingCoder:(id)a3 contact:(id)a4;
- (void)encodeUsingCoder:(id)a3 contact:(id)a4;
- (void)setCNValue:(id)a3 onContact:(id)a4;
@end

@implementation CNTextAlertDescription

- (void)setCNValue:(id)a3 onContact:(id)a4
{
}

- (id)CNValueForContact:(id)a3
{
  return (id)[a3 textAlert];
}

- (BOOL)abPropertyID:(int *)a3
{
  if (a3) {
    *a3 = *MEMORY[0x1E4F49D98];
  }
  return a3 != 0;
}

- (CNTextAlertDescription)init
{
  return [(CNPropertyDescription *)self initWithKey:@"textAlert" readSelector:sel_textAlert writeSelector:sel_setTextAlert_];
}

- (BOOL)isEqualForContact:(id)a3 other:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 textAlert];
  if (!v8)
  {
    v4 = [v7 textAlert];
    if (!v4)
    {
      char v11 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  v9 = [v6 textAlert];
  v10 = [v7 textAlert];
  char v11 = [v9 isEqual:v10];

  if (!v8) {
    goto LABEL_6;
  }
LABEL_7:

  return v11;
}

- (void)encodeUsingCoder:(id)a3 contact:(id)a4
{
}

- (void)decodeUsingCoder:(id)a3 contact:(id)a4
{
  v5 = a4;
  id v6 = a3;
  id v9 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"_textAlert"];

  uint64_t v7 = [v9 copy];
  v8 = (void *)v5[64];
  v5[64] = v7;
}

- (BOOL)applyABMultivalueValueBytes:(char *)a3 length:(unint64_t)a4 identifier:(id)a5 legacyIdentifier:(int)a6 label:(id)a7 toCNMultivalueRepresentation:(id)a8
{
  id v13 = a5;
  id v14 = a7;
  id v15 = a8;
  switch(a6)
  {
    case -2:
      v16 = +[CNiOSABConversions stringFromABBytes:a3 length:a4];
      [v15 setSound:v16];
      break;
    case -5:
      v16 = +[CNiOSABConversions stringFromABBytes:a3 length:a4];
      objc_msgSend(v15, "setIgnoreMute:", objc_msgSend(v16, "isEqualToString:", @"YES"));
      break;
    case -102:
      v16 = +[CNiOSABConversions stringFromABBytes:a3 length:a4];
      [v15 setVibration:v16];
      break;
    default:
      BOOL v17 = 0;
      goto LABEL_9;
  }

  BOOL v17 = 1;
LABEL_9:

  return v17;
}

- (BOOL)setABValue:(void *)a3 onABPerson:(void *)a4 error:(__CFError *)a5
{
  return 1;
}

- (void)ABValueForABPerson:(void *)a3
{
  v4 = (const void *)MEMORY[0x192FD2B00](a3, 4294967294);
  if (v4) {
    CFStringRef v5 = (const __CFString *)CFAutorelease(v4);
  }
  else {
    CFStringRef v5 = 0;
  }
  id v6 = (const void *)MEMORY[0x192FD2B00](a3, 4294967194);
  if (v6) {
    CFStringRef v7 = (const __CFString *)CFAutorelease(v6);
  }
  else {
    CFStringRef v7 = 0;
  }
  v8 = (const void *)MEMORY[0x192FD2B00](a3, 4294967291);
  if (v8) {
    CFStringRef v9 = (const __CFString *)CFAutorelease(v8);
  }
  else {
    CFStringRef v9 = 0;
  }
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 2, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (v5 && CFStringGetLength(v5) >= 1) {
    CFDictionarySetValue(Mutable, @"tone", v5);
  }
  if (v7 && CFStringGetLength(v7) >= 1) {
    CFDictionarySetValue(Mutable, @"vibration", v7);
  }
  if (v9 && CFStringGetLength(v9) >= 1) {
    CFDictionarySetValue(Mutable, @"ignoreMute", v9);
  }
  if (!Mutable) {
    return 0;
  }

  return (void *)CFAutorelease(Mutable);
}

@end