@interface LSExtensionPointRecord(_EX_LSExtensionPointRecord_)
- (id)_EX_initWithIdentifier:()_EX_LSExtensionPointRecord_ platform:parentAppRecord:error:;
- (id)_EX_parentAppRecord;
@end

@implementation LSExtensionPointRecord(_EX_LSExtensionPointRecord_)

- (id)_EX_parentAppRecord
{
  if (objc_opt_respondsToSelector())
  {
    v2 = [a1 parentAppRecord];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)_EX_initWithIdentifier:()_EX_LSExtensionPointRecord_ platform:parentAppRecord:error:
{
  id v10 = a5;
  id v11 = a3;
  char v12 = objc_opt_respondsToSelector();
  id v13 = a1;
  if (v12) {
    uint64_t v14 = [v13 initWithIdentifier:v11 platform:a4 parentAppRecord:v10 error:a6];
  }
  else {
    uint64_t v14 = [v13 initWithIdentifier:v11 platform:a4 error:a6];
  }
  v15 = (void *)v14;

  return v15;
}

@end