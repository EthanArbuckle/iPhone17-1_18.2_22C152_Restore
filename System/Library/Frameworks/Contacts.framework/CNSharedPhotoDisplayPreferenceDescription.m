@interface CNSharedPhotoDisplayPreferenceDescription
- (BOOL)abPropertyID:(int *)a3;
- (BOOL)isEqualForContact:(id)a3 other:(id)a4;
- (BOOL)isValidValue:(id)a3 error:(id *)a4;
- (BOOL)setCNValue:(id)a3 onABPerson:(void *)a4 withDependentPropertiesContext:(id)a5 error:(id *)a6;
- (CNSharedPhotoDisplayPreferenceDescription)init;
- (Class)valueClass;
- (id)CNValueForContact:(id)a3;
- (id)CNValueFromABBytes:(char *)a3 length:(unint64_t)a4;
- (id)CNValueFromABValue:(void *)a3;
- (id)nilValue;
- (id)sharedPhotoDisplayPreferenceFromFlags:(id)a3;
- (int64_t)flagsWithFlags:(id)a3 displayPreference:(id)a4;
- (void)decodeUsingCoder:(id)a3 contact:(id)a4;
- (void)encodeUsingCoder:(id)a3 contact:(id)a4;
- (void)setCNValue:(id)a3 onContact:(id)a4;
@end

@implementation CNSharedPhotoDisplayPreferenceDescription

- (BOOL)abPropertyID:(int *)a3
{
  if (a3) {
    *a3 = *MEMORY[0x1E4F49A98];
  }
  return a3 != 0;
}

- (id)CNValueForContact:(id)a3
{
  v3 = NSNumber;
  uint64_t v4 = [a3 sharedPhotoDisplayPreference];

  return (id)[v3 numberWithInteger:v4];
}

- (void)setCNValue:(id)a3 onContact:(id)a4
{
  id v5 = a4;
  objc_msgSend(v5, "setSharedPhotoDisplayPreference:", objc_msgSend(a3, "integerValue"));
}

- (CNSharedPhotoDisplayPreferenceDescription)init
{
  return [(CNPropertyDescription *)self initWithKey:@"sharedPhotoDisplayPreference" readSelector:sel_sharedPhotoDisplayPreference writeSelector:sel_setSharedPhotoDisplayPreference_];
}

- (BOOL)isEqualForContact:(id)a3 other:(id)a4
{
  return *((void *)a3 + 46) == *((void *)a4 + 46);
}

- (void)encodeUsingCoder:(id)a3 contact:(id)a4
{
}

- (void)decodeUsingCoder:(id)a3 contact:(id)a4
{
  id v5 = a4;
  v5[46] = [a3 decodeIntegerForKey:@"_sharedPhotoDisplayPreference"];

  MEMORY[0x1F41817F8]();
}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (id)nilValue
{
  return &unk_1EE089260;
}

- (BOOL)isValidValue:(id)a3 error:(id *)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CNSharedPhotoDisplayPreferenceDescription;
  if (![(CNPropertyDescription *)&v13 isValidValue:v6 error:a4])
  {
LABEL_6:
    BOOL v8 = 0;
    goto LABEL_7;
  }
  int64x2_t v7 = vdupq_n_s64([v6 integerValue]);
  BOOL v8 = 1;
  if ((vmaxv_u16((uint16x4_t)vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(v7, (int64x2_t)xmmword_190B903B0), (int32x4_t)vceqq_s64(v7, (int64x2_t)xmmword_190B903C0)))) & 1) == 0&& v6)
  {
    if (a4)
    {
      v15 = @"CNKeyPaths";
      v9 = [(CNPropertyDescription *)self key];
      v14 = v9;
      v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
      v16[0] = v10;
      v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
      *a4 = +[CNErrorFactory errorWithCode:302 userInfo:v11];
    }
    goto LABEL_6;
  }
LABEL_7:

  return v8;
}

- (id)CNValueFromABBytes:(char *)a3 length:(unint64_t)a4
{
  id v5 = +[CNiOSABConversions numberFromIntegerABBytes:a3 length:a4];

  return [(CNSharedPhotoDisplayPreferenceDescription *)self CNValueFromABValue:v5];
}

- (BOOL)setCNValue:(id)a3 onABPerson:(void *)a4 withDependentPropertiesContext:(id)a5 error:(id *)a6
{
  ABPropertyID v9 = *MEMORY[0x1E4F49A98];
  id v10 = a3;
  CFNumberRef v11 = (const __CFNumber *)ABRecordCopyValue(a4, v9);
  uint64_t valuePtr = 0;
  CFNumberGetValue(v11, kCFNumberNSIntegerType, &valuePtr);
  v12 = [NSNumber numberWithInteger:valuePtr];
  int64_t v13 = [(CNSharedPhotoDisplayPreferenceDescription *)self flagsWithFlags:v12 displayPreference:v10];

  int64_t v19 = v13;
  CFNumberRef v14 = CFNumberCreate(0, kCFNumberNSIntegerType, &v19);
  if (v11) {
    CFAutorelease(v11);
  }
  CFTypeRef cf = 0;
  BOOL v15 = [(CNPropertyDescription *)self setABValue:v14 onABPerson:a4 error:&cf];
  BOOL v16 = v15;
  if (a6)
  {
    if (!v15)
    {
      *a6 = +[CNErrorFactory errorForiOSABError:cf];
      if (cf) {
        CFRelease(cf);
      }
    }
  }
  if (v14) {
    CFAutorelease(v14);
  }
  return v16;
}

- (id)CNValueFromABValue:(void *)a3
{
  if (a3 && (CFTypeID v5 = CFGetTypeID(a3), v5 == CFNumberGetTypeID()))
  {
    uint64_t valuePtr = 0;
    CFNumberGetValue((CFNumberRef)a3, kCFNumberNSIntegerType, &valuePtr);
    id v6 = [NSNumber numberWithInteger:valuePtr];
    int64x2_t v7 = [(CNSharedPhotoDisplayPreferenceDescription *)self sharedPhotoDisplayPreferenceFromFlags:v6];
  }
  else
  {
    int64x2_t v7 = 0;
  }

  return v7;
}

- (id)sharedPhotoDisplayPreferenceFromFlags:(id)a3
{
  uint64_t v3 = [a3 integerValue] >> 6;
  uint64_t v4 = NSNumber;

  return (id)[v4 numberWithInteger:v3];
}

- (int64_t)flagsWithFlags:(id)a3 displayPreference:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [a4 integerValue];
  uint64_t v7 = [v5 integerValue];

  if ((unint64_t)(v6 - 1) >= 3) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = ((v6 - 1) << 6) + 64;
  }
  return v8 | v7 & 0xFFFFFFFFFFFFFF3FLL;
}

@end