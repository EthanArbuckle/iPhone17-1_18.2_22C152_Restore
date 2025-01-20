@interface NSCompoundPredicate(EmailFoundationAdditions)
- (id)ef_publicDescription;
- (id)ef_simplifiedPredicate;
- (uint64_t)ef_containsKeyPath:()EmailFoundationAdditions;
- (uint64_t)ef_containsSubpredicate:()EmailFoundationAdditions;
- (uint64_t)ef_matchesEverything;
- (uint64_t)ef_matchesNothing;
@end

@implementation NSCompoundPredicate(EmailFoundationAdditions)

- (id)ef_simplifiedPredicate
{
  id v2 = (id)[a1 compoundPredicateType];
  v3 = [a1 subpredicates];
  id v4 = v3;
  if (v2)
  {
    if ([v3 count] == 1)
    {
      id v5 = [v4 firstObject];
      uint64_t v6 = objc_msgSend(v5, "ef_simplifiedPredicate");
LABEL_17:
      id v2 = (id)v6;
LABEL_18:

      goto LABEL_35;
    }
    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x3032000000;
    v44 = __Block_byref_object_copy__3;
    v45 = __Block_byref_object_dispose__3;
    id v46 = 0;
    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__3;
    v39 = __Block_byref_object_dispose__3;
    id v40 = 0;
    id v7 = v4;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __71__NSCompoundPredicate_EmailFoundationAdditions__ef_simplifiedPredicate__block_invoke;
    v30[3] = &unk_1E6122880;
    v33 = &v35;
    id v34 = v2;
    v32 = &v41;
    id v8 = v7;
    id v31 = v8;
    [v8 enumerateObjectsUsingBlock:v30];
    v9 = (void *)v42[5];
    if (v9)
    {
      id v10 = v9;
LABEL_9:
      id v2 = v10;
LABEL_10:
      int v11 = 1;
      id v4 = v8;
      goto LABEL_33;
    }
    v12 = (void *)v36[5];
    id v13 = v8;
    if (v12)
    {
      uint64_t v14 = [v12 count];
      if (!v14)
      {
        if (v2 == (id)1) {
          objc_msgSend(MEMORY[0x1E4F28F60], "ef_matchEverythingPredicate");
        }
        else {
          objc_msgSend(MEMORY[0x1E4F28F60], "ef_matchNothingPredicate");
        }
        id v10 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
      if (v14 == 1)
      {
        v15 = [(id)v36[5] firstObject];
        objc_msgSend(v15, "ef_simplifiedPredicate");
        id v2 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_10;
      }
      id v13 = (id)v36[5];

      v21 = (void *)v36[5];
      v36[5] = 0;
    }
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __71__NSCompoundPredicate_EmailFoundationAdditions__ef_simplifiedPredicate__block_invoke_2;
    v26[3] = &unk_1E61228A8;
    v28 = &v35;
    id v29 = v2;
    id v4 = v13;
    id v27 = v4;
    [v4 enumerateObjectsUsingBlock:v26];
    v22 = (void *)v36[5];
    if (v22)
    {
      id v2 = v22;

      id v4 = v2;
    }
    if (v4 == v8)
    {
      int v11 = 0;
    }
    else
    {
      id v23 = objc_alloc(MEMORY[0x1E4F28BA0]);
      uint64_t v24 = [a1 compoundPredicateType];
      id v2 = (id)[v23 initWithType:v24 subpredicates:v36[5]];
      int v11 = 1;
    }

LABEL_33:
    _Block_object_dispose(&v35, 8);

    _Block_object_dispose(&v41, 8);
    if (v11) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
  if ([v3 count] == 1)
  {
    id v5 = [v4 firstObject];
    if (objc_msgSend(v5, "ef_matchesEverything"))
    {
      uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28F60], "ef_matchNothingPredicate");
      goto LABEL_17;
    }
    if (objc_msgSend(v5, "ef_matchesNothing"))
    {
      uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28F60], "ef_matchEverythingPredicate");
      goto LABEL_17;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v16 = v5;
      if (![v16 compoundPredicateType])
      {
        v17 = [v16 subpredicates];
        uint64_t v18 = [v17 count];

        if (v18 == 1)
        {
          v19 = [v16 subpredicates];
          v20 = [v19 firstObject];
          objc_msgSend(v20, "ef_simplifiedPredicate");
          id v2 = (id)objc_claimAutoreleasedReturnValue();

LABEL_41:
          goto LABEL_18;
        }
      }
    }
    objc_msgSend(v5, "ef_simplifiedPredicate");
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    if (v5 != v16)
    {
      id v2 = [MEMORY[0x1E4F28BA0] notPredicateWithSubpredicate:v16];
      goto LABEL_41;
    }
  }
LABEL_34:
  id v2 = a1;
LABEL_35:

  return v2;
}

- (uint64_t)ef_matchesEverything
{
  v1 = a1;
  id v2 = [a1 subpredicates];
  uint64_t v3 = [v1 compoundPredicateType];
  if (v3)
  {
    if (v3 == 1)
    {
      LOBYTE(v1) = [v2 count] == 0;
    }
    else if (v3 == 2)
    {
      LOBYTE(v1) = objc_msgSend(v2, "ef_any:", &__block_literal_global_19);
    }
  }
  else if ([v2 count] == 1)
  {
    id v4 = [v2 firstObject];
    LOBYTE(v1) = objc_msgSend(v4, "ef_matchesNothing");
  }
  else
  {
    LOBYTE(v1) = 0;
  }

  return v1 & 1;
}

- (uint64_t)ef_matchesNothing
{
  v1 = a1;
  id v2 = [a1 subpredicates];
  uint64_t v3 = [v1 compoundPredicateType];
  if (v3)
  {
    if (v3 == 1)
    {
      LOBYTE(v1) = objc_msgSend(v2, "ef_any:", &__block_literal_global_143);
    }
    else if (v3 == 2)
    {
      LOBYTE(v1) = [v2 count] == 0;
    }
  }
  else if ([v2 count] == 1)
  {
    id v4 = [v2 firstObject];
    LOBYTE(v1) = objc_msgSend(v4, "ef_matchesEverything");
  }
  else
  {
    LOBYTE(v1) = 0;
  }

  return v1 & 1;
}

- (id)ef_publicDescription
{
  unint64_t v2 = [a1 compoundPredicateType];
  if (v2 > 2) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = off_1E61228F0[v2];
  }
  id v4 = [a1 subpredicates];
  uint64_t v5 = [v4 count];
  uint64_t v6 = [a1 compoundPredicateType];
  if (v5)
  {
    if (v5 != 1)
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F28E78]);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __69__NSCompoundPredicate_EmailFoundationAdditions__ef_publicDescription__block_invoke;
      v17[3] = &unk_1E6122838;
      id v10 = v9;
      v19 = v3;
      uint64_t v20 = v5;
      id v18 = v10;
      [v4 enumerateObjectsUsingBlock:v17];
      int v11 = v19;
      id v12 = v10;

      goto LABEL_15;
    }
    if (!v6)
    {
      id v14 = [NSString alloc];
      id v7 = [v4 firstObject];
      v15 = objc_msgSend(v7, "_ef_parenthesizedPublicDescription");
      id v12 = (id)[v14 initWithFormat:@"%@ %@", v3, v15];

      goto LABEL_14;
    }
    id v7 = [v4 firstObject];
    uint64_t v8 = objc_msgSend(v7, "ef_publicDescription");
  }
  else if (v6 == 1)
  {
    id v7 = objc_msgSend(MEMORY[0x1E4F28F60], "ef_matchEverythingPredicate");
    uint64_t v8 = objc_msgSend(v7, "ef_publicDescription");
  }
  else
  {
    if (!v6)
    {
      id v16 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Can't have a NOT predicate with no subpredicate." userInfo:0];
      objc_exception_throw(v16);
    }
    id v7 = objc_msgSend(MEMORY[0x1E4F28F60], "ef_matchNothingPredicate");
    uint64_t v8 = objc_msgSend(v7, "ef_publicDescription");
  }
  id v12 = (id)v8;
LABEL_14:

LABEL_15:
  return v12;
}

- (uint64_t)ef_containsKeyPath:()EmailFoundationAdditions
{
  id v4 = a3;
  uint64_t v5 = [a1 subpredicates];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__NSCompoundPredicate_EmailFoundationAdditions__ef_containsKeyPath___block_invoke;
  v9[3] = &unk_1E61228D0;
  id v6 = v4;
  id v10 = v6;
  uint64_t v7 = objc_msgSend(v5, "ef_any:", v9);

  return v7;
}

- (uint64_t)ef_containsSubpredicate:()EmailFoundationAdditions
{
  id v4 = a3;
  uint64_t v5 = [a1 subpredicates];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__NSCompoundPredicate_EmailFoundationAdditions__ef_containsSubpredicate___block_invoke;
  v9[3] = &unk_1E61228D0;
  id v6 = v4;
  id v10 = v6;
  uint64_t v7 = objc_msgSend(v5, "ef_any:", v9);

  return v7;
}

@end