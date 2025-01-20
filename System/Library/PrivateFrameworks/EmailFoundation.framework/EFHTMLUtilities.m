@interface EFHTMLUtilities
+ (id)_cssSnippetFromDictionary:(id)a3;
+ (id)htmlSnippetWithTag:(id)a3 includeTrailingTag:(BOOL)a4 attributes:(id)a5;
@end

@implementation EFHTMLUtilities

+ (id)_cssSnippetFromDictionary:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28E78] string];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__EFHTMLUtilities__cssSnippetFromDictionary___block_invoke;
  v9[3] = &unk_1E6122220;
  SEL v11 = a2;
  id v12 = a1;
  id v7 = v6;
  id v10 = v7;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];

  return v7;
}

void __45__EFHTMLUtilities__cssSnippetFromDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 48) file:@"EFHTMLUtilities.m" lineNumber:17 description:@"values must be string types"];
  }
  [*(id *)(a1 + 32) appendFormat:@"%@: %@;", v7, v5];
}

+ (id)htmlSnippetWithTag:(id)a3 includeTrailingTag:(BOOL)a4 attributes:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = a5;
  SEL v11 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", v9];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __68__EFHTMLUtilities_htmlSnippetWithTag_includeTrailingTag_attributes___block_invoke;
  v17 = &unk_1E6122248;
  id v12 = v11;
  id v18 = v12;
  id v19 = a1;
  SEL v20 = a2;
  [v10 enumerateKeysAndObjectsUsingBlock:&v14];
  if (v6) {
    [v12 appendFormat:@"></%@", v9, v14, v15, v16, v17];
  }
  [v12 appendString:@">"];

  return v12;
}

void __68__EFHTMLUtilities_htmlSnippetWithTag_includeTrailingTag_attributes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v6 = *(void **)(a1 + 32);
    id v7 = objc_msgSend(v5, "ef_stringByEscapingForXML");
    [v6 appendFormat:@" %@=\"%@\"", v10, v7];
LABEL_3:

    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = *(void **)(a1 + 32);
      id v7 = [*(id *)(a1 + 40) _cssSnippetFromDictionary:v5];
      [v8 appendFormat:@" %@=\"%@\"", v10, v7];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = *(void **)(a1 + 32);
        id v7 = [v5 absoluteString];
        [v9 appendFormat:@" %@=\"%@\"", v10, v7];
      }
      else
      {
        id v7 = [MEMORY[0x1E4F28B00] currentHandler];
        [v7 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 40), @"EFHTMLUtilities.m", 35, @"unexpected value in attributes dictionary at key %@: %@", v10, v5 object file lineNumber description];
      }
    }
    goto LABEL_3;
  }
  [*(id *)(a1 + 32) appendFormat:@" %@=\"%@\"", v10, v5];
LABEL_6:
}

@end