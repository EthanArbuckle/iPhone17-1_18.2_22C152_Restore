@interface CNNonGregorianBirthdayDescription
- (BOOL)abPropertyID:(int *)a3;
- (BOOL)canUnifyValue:(id)a3 withValue:(id)a4;
- (BOOL)isEqualForContact:(id)a3 other:(id)a4;
- (BOOL)isValidValue:(id)a3 error:(id *)a4;
- (BOOL)isValue:(id)a3 preferredToUnifiedValue:(id)a4;
- (CNNonGregorianBirthdayDescription)init;
- (Class)valueClass;
- (id)CNValueForContact:(id)a3;
- (id)CNValueFromABBytes:(char *)a3 length:(unint64_t)a4;
- (id)CNValueFromABValue:(void *)a3;
- (id)fromPlistTransform;
- (void)ABValueFromCNValue:(id)a3;
- (void)decodeUsingCoder:(id)a3 contact:(id)a4;
- (void)encodeUsingCoder:(id)a3 contact:(id)a4;
- (void)setCNValue:(id)a3 onContact:(id)a4;
@end

@implementation CNNonGregorianBirthdayDescription

- (id)CNValueForContact:(id)a3
{
  return (id)[a3 nonGregorianBirthday];
}

- (void)setCNValue:(id)a3 onContact:(id)a4
{
}

- (BOOL)abPropertyID:(int *)a3
{
  if (a3) {
    *a3 = *MEMORY[0x1E4F49A40];
  }
  return a3 != 0;
}

- (CNNonGregorianBirthdayDescription)init
{
  return [(CNPropertyDescription *)self initWithKey:@"nonGregorianBirthday" readSelector:sel_nonGregorianBirthday writeSelector:sel_setNonGregorianBirthday_];
}

- (id)CNValueFromABBytes:(char *)a3 length:(unint64_t)a4
{
  v4 = (void *)[[NSString alloc] initWithBytes:a3 length:a4 encoding:4];
  if (!v4)
  {
    id v5 = 0;
LABEL_21:
    id v5 = v5;
    v33 = v5;
    goto LABEL_24;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  v6 = [v4 componentsSeparatedByString:@","];
  v7 = [v6 objectAtIndexedSubscript:0];
  uint64_t v8 = [v7 length];

  if (v8)
  {
    v9 = [v6 objectAtIndexedSubscript:0];
    uint64_t v10 = [v9 length];

    if (!v10)
    {
LABEL_10:
      v16 = [v6 objectAtIndexedSubscript:1];
      uint64_t v17 = [v16 length];

      if (v17)
      {
        v18 = [v6 objectAtIndexedSubscript:1];
        objc_msgSend(v5, "setLeapMonth:", objc_msgSend(v18, "BOOLValue"));
      }
      v19 = [v6 objectAtIndexedSubscript:2];
      uint64_t v20 = [v19 length];

      if (v20)
      {
        v21 = [v6 objectAtIndexedSubscript:2];
        objc_msgSend(v5, "setEra:", objc_msgSend(v21, "integerValue"));
      }
      v22 = [v6 objectAtIndexedSubscript:3];
      uint64_t v23 = [v22 length];

      if (v23)
      {
        v24 = [v6 objectAtIndexedSubscript:3];
        objc_msgSend(v5, "setYear:", objc_msgSend(v24, "integerValue"));
      }
      v25 = [v6 objectAtIndexedSubscript:4];
      uint64_t v26 = [v25 length];

      if (v26)
      {
        v27 = [v6 objectAtIndexedSubscript:4];
        objc_msgSend(v5, "setMonth:", objc_msgSend(v27, "integerValue"));
      }
      v28 = [v6 objectAtIndexedSubscript:5];
      uint64_t v29 = [v28 length];

      if (v29)
      {
        v30 = [v6 objectAtIndexedSubscript:5];
        objc_msgSend(v5, "setDay:", objc_msgSend(v30, "integerValue"));
      }
      v31 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
      v32 = [v5 calendar];
      [v32 setTimeZone:v31];

      goto LABEL_21;
    }
    v11 = [v6 objectAtIndexedSubscript:0];
    uint64_t v12 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:v11];
    if (v12)
    {
      v13 = (void *)v12;
LABEL_9:
      [v5 setCalendar:v13];

      goto LABEL_10;
    }
    v14 = [v11 lowercaseString];

    uint64_t v15 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:v14];
    if (v15)
    {
      v13 = (void *)v15;
      v11 = v14;
      goto LABEL_9;
    }
  }
  v33 = 0;
LABEL_24:

  return v33;
}

- (BOOL)isEqualForContact:(id)a3 other:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 nonGregorianBirthday];
  if (!v8)
  {
    v4 = [v7 nonGregorianBirthday];
    if (!v4)
    {
      char v11 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  v9 = [v6 nonGregorianBirthday];
  uint64_t v10 = [v7 nonGregorianBirthday];
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
  id v5 = a4;
  id v6 = a3;
  id v9 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"_nonGregorianBirthday"];

  uint64_t v7 = [v9 copy];
  uint64_t v8 = (void *)v5[28];
  v5[28] = v7;
}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (BOOL)canUnifyValue:(id)a3 withValue:(id)a4
{
  return +[CNDateComponentsEquivalence canUnifyComponents:a3 withComponents:a4];
}

- (BOOL)isValue:(id)a3 preferredToUnifiedValue:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [a3 year];
  uint64_t v7 = [v5 year];

  return v6 != 0x7FFFFFFFFFFFFFFFLL && v7 == 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)isValidValue:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CNNonGregorianBirthdayDescription;
  unsigned int v7 = [(CNPropertyDescription *)&v13 isValidValue:v6 error:a4];
  BOOL v8 = v7;
  if (v6 && v7)
  {
    id v12 = 0;
    BOOL v8 = +[CN areValidNonGregorianDayComponents:v6 error:&v12];
    id v9 = v12;
    if (a4 && !v8)
    {
      uint64_t v10 = [(CNPropertyDescription *)self key];
      *a4 = +[CNErrorFactory errorByPrependingKeyPath:v10 toKeyPathsInError:v9];
    }
  }

  return v8;
}

- (id)fromPlistTransform
{
  return +[CN dateComponentsFromDictionaryTransform];
}

- (void)ABValueFromCNValue:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    id v5 = [v3 calendar];
    id v6 = [v5 calendarIdentifier];

    if (v6)
    {
      unsigned int v7 = (const void *)*MEMORY[0x1E4F49A18];
      BOOL v8 = [v3 calendar];
      id v9 = [v8 calendarIdentifier];
      CFDictionarySetValue(Mutable, v7, v9);
    }
    int v10 = [v3 isLeapMonth];
    char v11 = (const void **)MEMORY[0x1E4F1CFD0];
    if (!v10) {
      char v11 = (const void **)MEMORY[0x1E4F1CFC8];
    }
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F49A30], *v11);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __63__CNNonGregorianBirthdayDescription_iOSAB__ABValueFromCNValue___block_invoke;
    aBlock[3] = &__block_descriptor_40_e24_v24__0q8____CFString__16l;
    aBlock[4] = Mutable;
    id v12 = (void (**)(void *, uint64_t, void))_Block_copy(aBlock);
    uint64_t v13 = [v3 era];
    v12[2](v12, v13, *MEMORY[0x1E4F49A28]);
    uint64_t v14 = [v3 year];
    v12[2](v12, v14, *MEMORY[0x1E4F49A48]);
    uint64_t v15 = [v3 month];
    v12[2](v12, v15, *MEMORY[0x1E4F49A38]);
    uint64_t v16 = [v3 day];
    v12[2](v12, v16, *MEMORY[0x1E4F49A20]);

    if (Mutable) {
      Mutable = (__CFDictionary *)CFAutorelease(Mutable);
    }
  }
  else
  {
    Mutable = 0;
  }

  return Mutable;
}

void __63__CNNonGregorianBirthdayDescription_iOSAB__ABValueFromCNValue___block_invoke(uint64_t a1, uint64_t a2, const void *a3)
{
  if (a2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = *(__CFDictionary **)(a1 + 32);
    id v6 = [NSNumber numberWithInteger:a2];
    CFDictionarySetValue(v5, a3, v6);
  }
}

- (id)CNValueFromABValue:(void *)a3
{
  if (!a3)
  {
    id v9 = 0;
    goto LABEL_9;
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  id v5 = CFDictionaryGetValue((CFDictionaryRef)a3, (const void *)*MEMORY[0x1E4F49A18]);
  uint64_t v6 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:v5];
  if (v6)
  {
    unsigned int v7 = (void *)v6;
    BOOL v8 = v5;
  }
  else
  {
    BOOL v8 = [v5 lowercaseString];

    uint64_t v10 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:v8];
    if (!v10)
    {
      id v9 = 0;
      goto LABEL_8;
    }
    unsigned int v7 = (void *)v10;
  }
  char v11 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [v7 setTimeZone:v11];

  [v4 setCalendar:v7];
  objc_msgSend(v4, "setLeapMonth:", CFDictionaryGetValue((CFDictionaryRef)a3, (const void *)*MEMORY[0x1E4F49A30]) == (const void *)*MEMORY[0x1E4F1CFD0]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__CNNonGregorianBirthdayDescription_iOSAB__CNValueFromABValue___block_invoke;
  aBlock[3] = &__block_descriptor_40_e21_q16__0____CFString__8l;
  aBlock[4] = a3;
  id v12 = (uint64_t (**)(void *, void))_Block_copy(aBlock);
  objc_msgSend(v4, "setEra:", v12[2](v12, *MEMORY[0x1E4F49A28]));
  objc_msgSend(v4, "setYear:", v12[2](v12, *MEMORY[0x1E4F49A48]));
  objc_msgSend(v4, "setMonth:", v12[2](v12, *MEMORY[0x1E4F49A38]));
  objc_msgSend(v4, "setDay:", v12[2](v12, *MEMORY[0x1E4F49A20]));
  id v9 = v4;

LABEL_8:
LABEL_9:

  return v9;
}

uint64_t __63__CNNonGregorianBirthdayDescription_iOSAB__CNValueFromABValue___block_invoke(uint64_t a1, const void *a2)
{
  Value = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 32), a2);
  if (!Value) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }

  return [Value integerValue];
}

@end