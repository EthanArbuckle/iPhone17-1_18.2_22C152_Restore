@interface CNNoteDescription
- (BOOL)abPropertyID:(int *)a3;
- (BOOL)isEqualForContact:(id)a3 other:(id)a4;
- (BOOL)isNonnull;
- (CNNoteDescription)init;
- (id)CNValueForContact:(id)a3;
- (id)nilValue;
- (void)decodeUsingCoder:(id)a3 contact:(id)a4;
- (void)encodeUsingCoder:(id)a3 contact:(id)a4;
- (void)setCNValue:(id)a3 onContact:(id)a4;
@end

@implementation CNNoteDescription

- (void)setCNValue:(id)a3 onContact:(id)a4
{
}

- (id)CNValueForContact:(id)a3
{
  return (id)[a3 note];
}

- (BOOL)abPropertyID:(int *)a3
{
  if (a3) {
    *a3 = *MEMORY[0x1E4F49C50];
  }
  return a3 != 0;
}

- (CNNoteDescription)init
{
  return [(CNPropertyDescription *)self initWithKey:@"note" readSelector:sel_note writeSelector:sel_setNote_];
}

- (BOOL)isEqualForContact:(id)a3 other:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 note];
  if (!v8)
  {
    v4 = [v7 note];
    if (!v4)
    {
      char v11 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  v9 = [v6 note];
  v10 = [v7 note];
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
  id v9 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"_note"];

  uint64_t v7 = [v9 copy];
  v8 = (void *)v5[31];
  v5[31] = v7;
}

- (BOOL)isNonnull
{
  return 1;
}

- (id)nilValue
{
  return &stru_1EE052B80;
}

@end