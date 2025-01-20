@interface NSCompoundPredicate
@end

@implementation NSCompoundPredicate

uint64_t __69__NSCompoundPredicate_EmailFoundationAdditions__ef_matchesEverything__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ef_matchesEverything");
}

uint64_t __66__NSCompoundPredicate_EmailFoundationAdditions__ef_matchesNothing__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ef_matchesNothing");
}

void __71__NSCompoundPredicate_EmailFoundationAdditions__ef_simplifiedPredicate__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v16 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v16 compoundPredicateType] == *(void *)(a1 + 48))
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      v5 = objc_msgSend(*(id *)(a1 + 32), "ef_prefix:", a3);
      uint64_t v6 = [v5 mutableCopy];
      uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
      v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;
    }
    v9 = [v16 subpredicates];
    objc_msgSend(v9, "ef_mapSelector:", sel_ef_simplifiedPredicate);
    id v10 = (id)objc_claimAutoreleasedReturnValue();

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObjectsFromArray:v10];
  }
  else
  {
    objc_msgSend(v16, "ef_simplifiedPredicate");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10 != v16 && !*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      v11 = objc_msgSend(*(id *)(a1 + 32), "ef_prefix:", a3);
      uint64_t v12 = [v11 mutableCopy];
      uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
      v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;
    }
    v15 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v15) {
      [v15 addObject:v10];
    }
  }
}

void __71__NSCompoundPredicate_EmailFoundationAdditions__ef_simplifiedPredicate__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v15 = a2;
  if (objc_msgSend(v15, "ef_matchesEverything"))
  {
    if (*(void *)(a1 + 56) != 1)
    {
      uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28F60], "ef_matchEverythingPredicate");
LABEL_7:
      uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
      v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      *a4 = 1;
      goto LABEL_12;
    }
LABEL_8:
    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      id v10 = objc_msgSend(*(id *)(a1 + 32), "ef_prefix:", a3);
      uint64_t v11 = [v10 mutableCopy];
      uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;
    }
    goto LABEL_12;
  }
  if (objc_msgSend(v15, "ef_matchesNothing"))
  {
    if (*(void *)(a1 + 56) == 1)
    {
      uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28F60], "ef_matchNothingPredicate");
      goto LABEL_7;
    }
    goto LABEL_8;
  }
  v14 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v14) {
    [v14 addObject:v15];
  }
LABEL_12:
}

void __69__NSCompoundPredicate_EmailFoundationAdditions__ef_publicDescription__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void **)(a1 + 32);
  id v8 = v5;
  uint64_t v7 = objc_msgSend(v5, "_ef_parenthesizedPublicDescription");
  [v6 appendString:v7];

  if (*(void *)(a1 + 48) - 1 != a3)
  {
    [*(id *)(a1 + 32) appendString:@" "];
    [*(id *)(a1 + 32) appendString:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) appendString:@" "];
  }
}

uint64_t __68__NSCompoundPredicate_EmailFoundationAdditions__ef_containsKeyPath___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ef_containsKeyPath:", *(void *)(a1 + 32));
}

uint64_t __73__NSCompoundPredicate_EmailFoundationAdditions__ef_containsSubpredicate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ef_containsSubpredicate:", *(void *)(a1 + 32));
}

@end