@interface CNContact(CKAdditions)
- (id)identifierForKey:()CKAdditions withDestination:;
@end

@implementation CNContact(CKAdditions)

- (id)identifierForKey:()CKAdditions withDestination:
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [v6 isEqualToString:*MEMORY[0x1E4F1ADC8]];
  v9 = 0;
  if (v7 && (v8 & 1) == 0)
  {
    v9 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:v7];
  }
  v10 = [a1 valueForKey:v6];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __59__CNContact_CKAdditions__identifierForKey_withDestination___block_invoke;
  v19[3] = &unk_1E5623BD8;
  id v11 = v6;
  id v20 = v11;
  id v21 = v7;
  id v22 = v9;
  id v12 = v9;
  id v13 = v7;
  uint64_t v14 = [v10 indexOfObjectPassingTest:v19];

  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = 0;
  }
  else
  {
    v16 = [a1 valueForKey:v11];
    v17 = [v16 objectAtIndex:v14];
    v15 = [v17 identifier];
  }

  return v15;
}

@end