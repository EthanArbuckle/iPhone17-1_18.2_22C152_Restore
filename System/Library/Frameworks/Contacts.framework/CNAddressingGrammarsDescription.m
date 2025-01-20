@interface CNAddressingGrammarsDescription
- (BOOL)applyCNValue:(id)a3 toArray:(id)a4 identifier:(id)a5 legacyIdentifier:(int)a6 label:(id)a7;
- (BOOL)canUnifyValue:(id)a3 withValue:(id)a4;
- (BOOL)isEqualForContact:(id)a3 other:(id)a4;
- (BOOL)isNonnull;
- (CNAddressingGrammarsDescription)init;
- (Class)labeledValueClass;
- (id)CNLabeledValueValueFromABMultiValueValue:(void *)a3;
- (id)CNLabeledValueValueFromABMultiValueValueBytes:(char *)a3 length:(unint64_t)a4;
- (id)CNValueForContact:(id)a3;
- (id)fromPlistTransform;
- (id)plistTransform;
- (void)ABMultiValueValueFromCNLabeledValueValue:(id)a3;
- (void)decodeUsingCoder:(id)a3 contact:(id)a4;
- (void)encodeUsingCoder:(id)a3 contact:(id)a4;
- (void)setCNValue:(id)a3 onContact:(id)a4;
@end

@implementation CNAddressingGrammarsDescription

- (void)setCNValue:(id)a3 onContact:(id)a4
{
}

- (id)CNValueForContact:(id)a3
{
  return (id)[a3 addressingGrammars];
}

- (CNAddressingGrammarsDescription)init
{
  return [(CNPropertyDescription *)self initWithKey:@"addressingGrammars" readSelector:sel_addressingGrammars writeSelector:sel_setAddressingGrammars_];
}

- (BOOL)isEqualForContact:(id)a3 other:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 addressingGrammars];
  if (!v8)
  {
    v4 = [v7 addressingGrammars];
    if (!v4)
    {
      char v11 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  v9 = [v6 addressingGrammars];
  v10 = [v7 addressingGrammars];
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

  v9 = objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, @"_addressingGrammars", v12, v13);
  uint64_t v10 = [v9 copy];
  char v11 = (void *)v6[18];
  v6[18] = v10;
}

- (BOOL)isNonnull
{
  return 1;
}

- (BOOL)canUnifyValue:(id)a3 withValue:(id)a4
{
  return [a3 isEqual:a4];
}

- (Class)labeledValueClass
{
  return (Class)objc_opt_class();
}

- (id)plistTransform
{
  return +[CN addressingGrammarToStringTransform];
}

- (id)fromPlistTransform
{
  return +[CN addressingGrammarFromStringTransform];
}

- (id)CNLabeledValueValueFromABMultiValueValueBytes:(char *)a3 length:(unint64_t)a4
{
  if (a3)
  {
    v4 = (void *)[[NSString alloc] initWithBytes:a3 length:a4 encoding:4];
    id v5 = [MEMORY[0x1E4F5A3C8] decryptAddressingGrammarString:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)applyCNValue:(id)a3 toArray:(id)a4 identifier:(id)a5 legacyIdentifier:(int)a6 label:(id)a7
{
  if (!a3) {
    return 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)CNAddressingGrammarsDescription;
  return [(CNMultiValuePropertyDescription *)&v8 applyCNValue:a3 toArray:a4 identifier:a5 legacyIdentifier:*(void *)&a6 label:a7];
}

- (id)CNLabeledValueValueFromABMultiValueValue:(void *)a3
{
  if (a3)
  {
    CFTypeID v5 = CFGetTypeID(a3);
    if (v5 == CFStringGetTypeID())
    {
      id v6 = [MEMORY[0x1E4F5A3C8] decryptAddressingGrammarString:a3];
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (void)ABMultiValueValueFromCNLabeledValueValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    CFTypeID v5 = v4;
  }
  else {
    CFTypeID v5 = 0;
  }
  id v6 = v5;

  id v7 = [MEMORY[0x1E4F5A3C8] encryptAddressingGrammarAsString:v6];

  return v7;
}

@end