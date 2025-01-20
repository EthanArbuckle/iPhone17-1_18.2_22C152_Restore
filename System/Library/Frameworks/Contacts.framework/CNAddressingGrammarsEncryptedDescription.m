@interface CNAddressingGrammarsEncryptedDescription
- (BOOL)abPropertyID:(int *)a3;
- (BOOL)isEqualForContact:(id)a3 other:(id)a4;
- (BOOL)isNonnull;
- (CNAddressingGrammarsEncryptedDescription)init;
- (Class)labeledValueClass;
- (id)CNValueForContact:(id)a3;
- (id)equivalentLabelSets;
- (id)standardLabels;
- (id)stringForIndexingForContact:(id)a3;
- (void)decodeUsingCoder:(id)a3 contact:(id)a4;
- (void)encodeUsingCoder:(id)a3 contact:(id)a4;
- (void)setCNValue:(id)a3 onContact:(id)a4;
@end

@implementation CNAddressingGrammarsEncryptedDescription

- (void)setCNValue:(id)a3 onContact:(id)a4
{
}

- (id)CNValueForContact:(id)a3
{
  return (id)[a3 addressingGrammarsEncrypted];
}

- (BOOL)abPropertyID:(int *)a3
{
  if (a3) {
    *a3 = *MEMORY[0x1E4F49A10];
  }
  return a3 != 0;
}

- (CNAddressingGrammarsEncryptedDescription)init
{
  return [(CNPropertyDescription *)self initWithKey:@"addressingGrammarsEncrypted" readSelector:sel_addressingGrammarsEncrypted writeSelector:sel_setAddressingGrammarsEncrypted_];
}

- (BOOL)isEqualForContact:(id)a3 other:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 addressingGrammarsEncrypted];
  if (!v8)
  {
    v4 = [v7 addressingGrammarsEncrypted];
    if (!v4)
    {
      char v11 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  v9 = [v6 addressingGrammarsEncrypted];
  v10 = [v7 addressingGrammarsEncrypted];
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

  v9 = objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, @"_addressingGrammarsEncrypted", v12, v13);
  uint64_t v10 = [v9 copy];
  char v11 = (void *)v6[19];
  v6[19] = v10;
}

- (BOOL)isNonnull
{
  return 1;
}

- (id)equivalentLabelSets
{
  if (equivalentLabelSets_cn_once_token_0 != -1) {
    dispatch_once(&equivalentLabelSets_cn_once_token_0, &__block_literal_global_24);
  }
  v2 = (void *)equivalentLabelSets_cn_once_object_0;

  return v2;
}

void __63__CNAddressingGrammarsEncryptedDescription_equivalentLabelSets__block_invoke()
{
  v0 = (void *)equivalentLabelSets_cn_once_object_0;
  equivalentLabelSets_cn_once_object_0 = MEMORY[0x1E4F1CBF0];
}

- (id)standardLabels
{
  if (standardLabels_cn_once_token_1 != -1) {
    dispatch_once(&standardLabels_cn_once_token_1, &__block_literal_global_305);
  }
  v2 = (void *)standardLabels_cn_once_object_1;

  return v2;
}

void __58__CNAddressingGrammarsEncryptedDescription_standardLabels__block_invoke()
{
  v0 = (void *)standardLabels_cn_once_object_1;
  standardLabels_cn_once_object_1 = MEMORY[0x1E4F1CBF0];
}

- (id)stringForIndexingForContact:(id)a3
{
  return 0;
}

- (Class)labeledValueClass
{
  return (Class)objc_opt_class();
}

@end