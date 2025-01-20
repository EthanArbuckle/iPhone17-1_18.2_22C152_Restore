@interface NSAttributedString(AXPropertyListCoersion)
- (id)_axRecursivelyPropertyListCoercedRepresentationWithError:()AXPropertyListCoersion;
- (uint64_t)_axRecursivelyReconstitutedRepresentationFromPropertyListWithError:()AXPropertyListCoersion;
@end

@implementation NSAttributedString(AXPropertyListCoersion)

- (id)_axRecursivelyPropertyListCoercedRepresentationWithError:()AXPropertyListCoersion
{
  v22[3] = *MEMORY[0x1E4F143B8];
  v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__3;
  v19 = __Block_byref_object_dispose__3;
  id v20 = 0;
  uint64_t v6 = [a1 length];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __103__NSAttributedString_AXPropertyListCoersion___axRecursivelyPropertyListCoercedRepresentationWithError___block_invoke;
  v12[3] = &unk_1E6220F10;
  v14 = &v15;
  id v7 = v5;
  id v13 = v7;
  objc_msgSend(a1, "enumerateAttributesInRange:options:usingBlock:", 0, v6, 0, v12);
  v8 = (void *)v16[5];
  if (v8)
  {
    v9 = 0;
    if (a3) {
      *a3 = v8;
    }
  }
  else
  {
    v21[0] = @"String";
    v10 = [a1 string];
    v22[0] = v10;
    v22[1] = v7;
    v21[1] = @"Attrl";
    v21[2] = @"SmugType";
    v22[2] = AXSerializeSmuggledTypeAttributedString;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
  }
  _Block_object_dispose(&v15, 8);

  return v9;
}

- (uint64_t)_axRecursivelyReconstitutedRepresentationFromPropertyListWithError:()AXPropertyListCoersion
{
  if (a3)
  {
    *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"AXSerialize3ErrorDomain" code:1 userInfo:0];
  }
  return 0;
}

@end