@interface CNSectionForSortingByFamilyNameDescription
- (BOOL)abPropertyID:(int *)a3;
- (BOOL)isEqualForContact:(id)a3 other:(id)a4;
- (BOOL)isEqualIgnoringIdentifiersForContact:(id)a3 other:(id)a4;
- (CNSectionForSortingByFamilyNameDescription)init;
- (id)CNValueForContact:(id)a3;
- (void)decodeUsingCoder:(id)a3 contact:(id)a4;
- (void)encodeUsingCoder:(id)a3 contact:(id)a4;
- (void)setCNValue:(id)a3 onContact:(id)a4;
@end

@implementation CNSectionForSortingByFamilyNameDescription

- (void)setCNValue:(id)a3 onContact:(id)a4
{
}

- (id)CNValueForContact:(id)a3
{
  return (id)[a3 sectionForSortingByFamilyName];
}

- (BOOL)abPropertyID:(int *)a3
{
  if (a3) {
    *a3 = *MEMORY[0x1E4F49C00];
  }
  return a3 != 0;
}

- (CNSectionForSortingByFamilyNameDescription)init
{
  return [(CNPropertyDescription *)self initWithKey:@"sectionForSortingByFamilyName" readSelector:sel_sectionForSortingByFamilyName writeSelector:sel_setSectionForSortingByFamilyName_];
}

- (BOOL)isEqualForContact:(id)a3 other:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 sectionForSortingByFamilyName];
  if (!v8)
  {
    v4 = [v7 sectionForSortingByFamilyName];
    if (!v4)
    {
      char v11 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  v9 = [v6 sectionForSortingByFamilyName];
  v10 = [v7 sectionForSortingByFamilyName];
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
  id v9 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"_sectionForSortingByFamilyName"];

  uint64_t v7 = [v9 copy];
  v8 = (void *)v5[23];
  v5[23] = v7;
}

- (BOOL)isEqualIgnoringIdentifiersForContact:(id)a3 other:(id)a4
{
  return 1;
}

@end