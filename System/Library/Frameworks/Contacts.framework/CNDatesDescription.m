@interface CNDatesDescription
- (BOOL)abPropertyID:(int *)a3;
- (BOOL)canUnifyValue:(id)a3 withValue:(id)a4;
- (BOOL)isEqualForContact:(id)a3 other:(id)a4;
- (BOOL)isNonnull;
- (BOOL)isValidMultiValueValue:(id)a3 error:(id *)a4;
- (BOOL)isValue:(id)a3 preferredToUnifiedValue:(id)a4;
- (CNDatesDescription)init;
- (Class)labeledValueClass;
- (id)CNLabeledValueValueFromABMultiValueValue:(void *)a3;
- (id)CNLabeledValueValueFromABMultiValueValueBytes:(char *)a3 length:(unint64_t)a4;
- (id)CNValueForContact:(id)a3;
- (id)fromPlistTransform;
- (id)standardLabels;
- (void)ABMultiValueValueFromCNLabeledValueValue:(id)a3;
- (void)decodeUsingCoder:(id)a3 contact:(id)a4;
- (void)encodeUsingCoder:(id)a3 contact:(id)a4;
- (void)setCNValue:(id)a3 onContact:(id)a4;
@end

@implementation CNDatesDescription

- (void)setCNValue:(id)a3 onContact:(id)a4
{
}

- (id)CNValueForContact:(id)a3
{
  return (id)[a3 dates];
}

- (BOOL)abPropertyID:(int *)a3
{
  if (a3) {
    *a3 = *MEMORY[0x1E4F49A80];
  }
  return a3 != 0;
}

- (CNDatesDescription)init
{
  return [(CNPropertyDescription *)self initWithKey:@"dates" readSelector:sel_dates writeSelector:sel_setDates_];
}

- (BOOL)isEqualForContact:(id)a3 other:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 dates];
  if (!v8)
  {
    v4 = [v7 dates];
    if (!v4)
    {
      char v11 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  v9 = [v6 dates];
  v10 = [v7 dates];
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
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  id v7 = [MEMORY[0x1E4F1CAD0] setWithObjects:&v12 count:3];
  for (uint64_t i = 16; i != -8; i -= 8)

  v9 = objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, @"_dates", v12, v13);
  uint64_t v10 = [v9 copy];
  char v11 = (void *)v6[51];
  v6[51] = v10;
}

- (BOOL)isNonnull
{
  return 1;
}

- (BOOL)canUnifyValue:(id)a3 withValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 day];
  uint64_t v9 = [v7 day];
  uint64_t v22 = [v6 month];
  uint64_t v10 = [v7 month];
  char v11 = [v6 calendar];
  if (!v11)
  {
    v4 = [v7 calendar];
    if (!v4)
    {
      char v14 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  uint64_t v12 = [v6 calendar];
  uint64_t v13 = [v7 calendar];
  char v14 = [v12 isEqual:v13];

  if (!v11) {
    goto LABEL_6;
  }
LABEL_7:

  uint64_t v15 = [v6 year];
  uint64_t v16 = [v7 year];
  uint64_t v17 = [v6 year];
  uint64_t v18 = [v7 year];
  char v19 = 0;
  if (v8 == v9 && v22 == v10)
  {
    char v20 = (v15 == 0x7FFFFFFFFFFFFFFFLL) ^ (v16 == 0x7FFFFFFFFFFFFFFFLL);
    if (v17 == v18) {
      char v20 = 1;
    }
    char v19 = v14 & v20;
  }

  return v19;
}

- (BOOL)isValue:(id)a3 preferredToUnifiedValue:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [a3 year];
  uint64_t v7 = [v5 year];

  return v6 != 0x7FFFFFFFFFFFFFFFLL && v7 == 0x7FFFFFFFFFFFFFFFLL;
}

- (id)standardLabels
{
  if (standardLabels_cn_once_token_6 != -1) {
    dispatch_once(&standardLabels_cn_once_token_6, &__block_literal_global_674);
  }
  v2 = (void *)standardLabels_cn_once_object_6;

  return v2;
}

uint64_t __36__CNDatesDescription_standardLabels__block_invoke()
{
  standardLabels_cn_once_object_6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"_$!<Anniversary>!$_", @"_$!<Other>!$_", 0);

  return MEMORY[0x1F41817F8]();
}

- (Class)labeledValueClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isValidMultiValueValue:(id)a3 error:(id *)a4
{
  return +[CN areValidGregorianDayComponents:a3 error:a4];
}

- (id)fromPlistTransform
{
  return +[CN dateComponentsFromDictionaryTransform];
}

- (id)CNLabeledValueValueFromABMultiValueValueBytes:(char *)a3 length:(unint64_t)a4
{
  if (a4 == 8)
  {
    id v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:*(double *)a3];
    uint64_t v6 = [(CNDatesDescription *)self CNLabeledValueValueFromABMultiValueValue:v5];
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Date parameter was unexpectedly large during contact buffer decode."];
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)CNLabeledValueValueFromABMultiValueValue:(void *)a3
{
  return (id)[MEMORY[0x1E4F5A390] dayComponentsFromDate:a3];
}

- (void)ABMultiValueValueFromCNLabeledValueValue:(id)a3
{
  v3 = [MEMORY[0x1E4F5A390] dateFromDayComponents:a3];
  v4 = v3;
  if (v3 && (CFTypeRef v5 = CFRetain(v3)) != 0) {
    CFTypeRef v6 = CFAutorelease(v5);
  }
  else {
    CFTypeRef v6 = 0;
  }

  return (void *)v6;
}

@end