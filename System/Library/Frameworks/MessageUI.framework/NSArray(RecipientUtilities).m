@interface NSArray(RecipientUtilities)
- (id)mf_commaSeparatedRecipientListWithWidth:()RecipientUtilities forFont:;
- (id)mf_commaSeparatedRecipientListWithWidth:()RecipientUtilities forFont:usingBlock:;
- (uint64_t)mf_indexOfRecipientWithEmailAddress:()RecipientUtilities;
@end

@implementation NSArray(RecipientUtilities)

- (id)mf_commaSeparatedRecipientListWithWidth:()RecipientUtilities forFont:
{
  v3 = objc_msgSend(a1, "mf_commaSeparatedRecipientListWithWidth:forFont:usingBlock:", a3, &__block_literal_global_30);

  return v3;
}

- (id)mf_commaSeparatedRecipientListWithWidth:()RecipientUtilities forFont:usingBlock:
{
  id v8 = a4;
  id v9 = a5;
  v10 = NSString;
  uint64_t v11 = [a1 count];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __90__NSArray_RecipientUtilities__mf_commaSeparatedRecipientListWithWidth_forFont_usingBlock___block_invoke;
  v19[3] = &unk_1E5F7D0E0;
  id v12 = v9;
  v19[4] = a1;
  id v20 = v12;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __90__NSArray_RecipientUtilities__mf_commaSeparatedRecipientListWithWidth_forFont_usingBlock___block_invoke_2;
  v16[3] = &unk_1E5F79C80;
  id v13 = v8;
  id v17 = v13;
  double v18 = a2;
  v14 = objc_msgSend(v10, "mf_commaSeparatedRecipientListWithRecipientCount:prefixForRecipientAtIndex:stringForRecipientAtIndex:lengthValidationBlock:", v11, 0, v19, v16);

  return v14;
}

- (uint64_t)mf_indexOfRecipientWithEmailAddress:()RecipientUtilities
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__NSArray_RecipientUtilities__mf_indexOfRecipientWithEmailAddress___block_invoke;
  v8[3] = &unk_1E5F7D108;
  id v9 = v4;
  v10 = &v11;
  id v5 = v4;
  [a1 enumerateObjectsUsingBlock:v8];
  uint64_t v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

@end