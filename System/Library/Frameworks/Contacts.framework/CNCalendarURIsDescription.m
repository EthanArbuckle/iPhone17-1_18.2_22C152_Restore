@interface CNCalendarURIsDescription
- (BOOL)isEqualForContact:(id)a3 other:(id)a4;
- (BOOL)setABValue:(void *)a3 onABPerson:(void *)a4 error:(__CFError *)a5;
- (CNCalendarURIsDescription)init;
- (id)CNValueForContact:(id)a3;
- (id)CNValueFromABValue:(void *)a3;
- (void)ABValueForABPerson:(void *)a3;
- (void)ABValueFromCNValue:(id)a3;
- (void)decodeUsingCoder:(id)a3 contact:(id)a4;
- (void)encodeUsingCoder:(id)a3 contact:(id)a4;
- (void)setCNValue:(id)a3 onContact:(id)a4;
@end

@implementation CNCalendarURIsDescription

- (void)setCNValue:(id)a3 onContact:(id)a4
{
}

- (id)CNValueForContact:(id)a3
{
  return (id)[a3 calendarURIs];
}

- (CNCalendarURIsDescription)init
{
  return [(CNPropertyDescription *)self initWithKey:@"calendarURIs" readSelector:sel_calendarURIs writeSelector:sel_setCalendarURIs_];
}

- (BOOL)isEqualForContact:(id)a3 other:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 calendarURIs];
  if (!v8)
  {
    v4 = [v7 calendarURIs];
    if (!v4)
    {
      char v11 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  v9 = [v6 calendarURIs];
  v10 = [v7 calendarURIs];
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

  v9 = objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, @"_calendarURIs", v12, v13);
  uint64_t v10 = [v9 copy];
  char v11 = (void *)v6[56];
  v6[56] = v10;
}

- (void)ABValueFromCNValue:(id)a3
{
  return 0;
}

- (id)CNValueFromABValue:(void *)a3
{
  return 0;
}

- (BOOL)setABValue:(void *)a3 onABPerson:(void *)a4 error:(__CFError *)a5
{
  return 1;
}

- (void)ABValueForABPerson:(void *)a3
{
  return 0;
}

@end