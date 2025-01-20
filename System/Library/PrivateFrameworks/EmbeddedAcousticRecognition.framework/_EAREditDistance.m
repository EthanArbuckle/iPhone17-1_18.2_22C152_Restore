@interface _EAREditDistance
- (_EAREditDistance)editDistanceWithRefText:(id)a3 hypText:(id)a4 caseInsensitive:(BOOL)a5 removeWordSense:(BOOL)a6;
- (_EAREditDistance)editDistanceWithRefTokens:(id)a3 hypTokens:(id)a4 caseInsensitive:(BOOL)a5 removeWordSense:(BOOL)a6;
- (void)editAlignmentWithRefText:(id)a3 hypText:(id)a4 placeholderSymbol:(id)a5 caseInsensitive:(BOOL)a6 removeWordSense:(BOOL)a7 completion:(id)a8;
- (void)editAlignmentWithRefTokens:(id)a3 hypTokens:(id)a4 placeholderSymbol:(id)a5 caseInsensitive:(BOOL)a6 removeWordSense:(BOOL)a7 completion:(id)a8;
@end

@implementation _EAREditDistance

- (_EAREditDistance)editDistanceWithRefTokens:(id)a3 hypTokens:(id)a4 caseInsensitive:(BOOL)a5 removeWordSense:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v9 = a3;
  id v10 = a4;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v74 = 0;
  v12 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"\\\\\\S*$" options:0 error:&v74];
  if (!v74)
  {
    BOOL v72 = v6;
    BOOL v73 = v7;
    id v67 = v12;
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ([v9 count] != -1)
    {
      unint64_t v15 = 0;
      do
      {
        v16 = objc_alloc_init(_EARAlignmentState);
        [(_EARAlignmentState *)v16 setNumberOfInsertions:0];
        [(_EARAlignmentState *)v16 setNumberOfSubstitutions:0];
        [(_EARAlignmentState *)v16 setNumberOfDeletions:v15];
        [(_EARAlignmentState *)v16 setTotalCost:v15];
        [v13 addObject:v16];
        v17 = objc_alloc_init(_EARAlignmentState);
        [v14 addObject:v17];

        ++v15;
      }
      while (v15 < [v9 count] + 1);
    }
    if (objc_msgSend(v10, "count", v11))
    {
      unint64_t v66 = 1;
      v70 = v9;
      id v71 = v10;
      v68 = v13;
      v69 = v14;
      do
      {
        v18 = [v13 objectAtIndexedSubscript:0];
        v19 = (void *)[v18 copy];
        [v14 setObject:v19 atIndexedSubscript:0];

        v20 = [v14 objectAtIndexedSubscript:0];
        [v20 incrementInsertions];

        v21 = [v14 objectAtIndexedSubscript:0];
        [v21 incrementCost];

        if ([v9 count])
        {
          unint64_t v22 = 1;
          do
          {
            v23 = [v13 objectAtIndexedSubscript:v22];
            uint64_t v24 = [v23 totalCost];

            v25 = [v14 objectAtIndexedSubscript:v22 - 1];
            v26 = v13;
            uint64_t v27 = [v25 totalCost];

            v28 = [v26 objectAtIndexedSubscript:v22 - 1];
            uint64_t v29 = [v28 totalCost];

            v30 = [v10 objectAtIndexedSubscript:v66 - 1];
            v31 = [v9 objectAtIndexedSubscript:v22 - 1];
            if (v73)
            {
              uint64_t v32 = [v30 lowercaseString];

              uint64_t v33 = [v31 lowercaseString];

              v30 = (void *)v32;
              v31 = (void *)v33;
            }
            if (v72)
            {
              uint64_t v34 = objc_msgSend(v67, "stringByReplacingMatchesInString:options:range:withTemplate:", v30, 0, 0, objc_msgSend(v30, "length"), &stru_1F0A64AB0);

              uint64_t v35 = objc_msgSend(v67, "stringByReplacingMatchesInString:options:range:withTemplate:", v31, 0, 0, objc_msgSend(v31, "length"), &stru_1F0A64AB0);

              v30 = (void *)v34;
              v31 = (void *)v35;
            }
            id v9 = v70;
            uint64_t v36 = v29 + ([v30 isEqualToString:v31] ^ 1);
            if (v36 > v24 || v36 > v27)
            {
              if (v27 >= v24)
              {
                id v13 = v68;
                v44 = [v68 objectAtIndexedSubscript:v22];
                v45 = (void *)[v44 copy];
                id v14 = v69;
                [v69 setObject:v45 atIndexedSubscript:v22];

                v46 = [v69 objectAtIndexedSubscript:v22];
                [v46 setTotalCost:v24 + 1];

                v40 = [v69 objectAtIndexedSubscript:v22];
                [v40 incrementInsertions];
              }
              else
              {
                id v14 = v69;
                v41 = [v69 objectAtIndexedSubscript:v22 - 1];
                v42 = (void *)[v41 copy];
                [v69 setObject:v42 atIndexedSubscript:v22];

                v43 = [v69 objectAtIndexedSubscript:v22];
                [v43 setTotalCost:v27 + 1];

                v40 = [v69 objectAtIndexedSubscript:v22];
                [v40 incrementDeletions];
                id v13 = v68;
              }
            }
            else
            {
              id v13 = v68;
              v37 = [v68 objectAtIndexedSubscript:v22 - 1];
              v38 = (void *)[v37 copy];
              id v14 = v69;
              [v69 setObject:v38 atIndexedSubscript:v22];

              if (([v30 isEqualToString:v31] & 1) == 0)
              {
                v39 = [v69 objectAtIndexedSubscript:v22];
                [v39 incrementSubstitutions];
              }
              v40 = [v69 objectAtIndexedSubscript:v22];
              [v40 setTotalCost:v36];
            }

            ++v22;
            id v10 = v71;
          }
          while (v22 <= [v70 count]);
        }
        if ([v13 count])
        {
          unint64_t v47 = 0;
          do
          {
            v48 = [v14 objectAtIndexedSubscript:v47];
            v49 = (void *)[v48 copy];
            [v13 setObject:v49 atIndexedSubscript:v47];

            ++v47;
          }
          while (v47 < [v13 count]);
        }
        ++v66;
      }
      while (v66 <= [v10 count]);
    }
    if ([v13 count])
    {
      uint64_t v50 = [v13 count] - 1;
      v51 = NSNumber;
      v52 = [v13 objectAtIndexedSubscript:v50];
      v53 = objc_msgSend(v51, "numberWithInteger:", objc_msgSend(v52, "numberOfInsertions"));
      id v11 = v65;
      [v65 setObject:v53 forKeyedSubscript:@"Insertions"];

      v54 = NSNumber;
      v55 = [v13 objectAtIndexedSubscript:v50];
      v56 = objc_msgSend(v54, "numberWithInteger:", objc_msgSend(v55, "numberOfDeletions"));
      [v65 setObject:v56 forKeyedSubscript:@"Deletions"];

      v57 = NSNumber;
      v58 = [v13 objectAtIndexedSubscript:v50];
      v59 = objc_msgSend(v57, "numberWithInteger:", objc_msgSend(v58, "numberOfSubstitutions"));
      [v65 setObject:v59 forKeyedSubscript:@"Substitutions"];

      v60 = NSNumber;
      v61 = [v13 objectAtIndexedSubscript:v50];
      v62 = objc_msgSend(v60, "numberWithInteger:", objc_msgSend(v61, "totalCost"));
      [v65 setObject:v62 forKeyedSubscript:@"EditDistance"];
    }
    else
    {
      id v11 = v65;
      [v65 setObject:&unk_1F0A74058 forKeyedSubscript:@"Insertions"];
      [v65 setObject:&unk_1F0A74058 forKeyedSubscript:@"Deletions"];
      [v65 setObject:&unk_1F0A74058 forKeyedSubscript:@"Substitutions"];
      [v65 setObject:&unk_1F0A74058 forKeyedSubscript:@"EditDistance"];
    }
    v63 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
    [v11 setObject:v63 forKeyedSubscript:@"ReferenceSize"];

    v12 = v67;
  }

  return (_EAREditDistance *)v11;
}

- (_EAREditDistance)editDistanceWithRefText:(id)a3 hypText:(id)a4 caseInsensitive:(BOOL)a5 removeWordSense:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = objc_alloc_init(_EARNLTokenizer);
  [(_EARNLTokenizer *)v12 setToLowerCase:0];
  [(_EARNLTokenizer *)v12 setReplacePunctuation:0];
  id v13 = [(_EARNLTokenizer *)v12 tokenize:v11];

  id v14 = [(_EARNLTokenizer *)v12 tokenize:v10];

  unint64_t v15 = [(_EAREditDistance *)self editDistanceWithRefTokens:v13 hypTokens:v14 caseInsensitive:v7 removeWordSense:v6];

  return (_EAREditDistance *)v15;
}

- (void)editAlignmentWithRefTokens:(id)a3 hypTokens:(id)a4 placeholderSymbol:(id)a5 caseInsensitive:(BOOL)a6 removeWordSense:(BOOL)a7 completion:(id)a8
{
  BOOL v87 = a6;
  BOOL v88 = a7;
  v91[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a8;
  id v90 = v11;
  uint64_t v15 = [v11 count];
  id v89 = v12;
  uint64_t v16 = [v12 count];
  if (!v15 || (unint64_t v17 = v16) == 0)
  {
LABEL_11:
    (*((void (**)(id, void *, void, void))v14 + 2))(v14, &unk_1F0A74070, 0, 0);
    goto LABEL_12;
  }
  for (uint64_t i = 0; i != v15; ++i)
  {
    id v19 = [v90 objectAtIndexedSubscript:i];

    if (v19 == v13) {
      goto LABEL_11;
    }
  }
  uint64_t v20 = 0;
  do
  {
    id v21 = [v89 objectAtIndexedSubscript:v20];

    if (v21 == v13) {
      goto LABEL_11;
    }
    ++v20;
  }
  while (v17 != v20);
  unint64_t v82 = v15;
  id v77 = v14;
  v91[0] = 0;
  uint64_t v22 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"\\\\\\S*$" options:0 error:v91];
  uint64_t v24 = (void *)v22;
  if (v91[0])
  {
    (*((void (**)(id, void *, void, void))v77 + 2))(v77, &unk_1F0A74070, 0, 0);
    goto LABEL_61;
  }
  v75[1] = v75;
  id v76 = v13;
  MEMORY[0x1F4188790](v22, v23);
  v26 = (char *)v75 - v25;
  uint64_t v27 = 0;
  unint64_t v83 = v28;
  uint64_t v29 = 1;
  if (v28 > 1) {
    uint64_t v29 = v17 + 1;
  }
  do
  {
    *(void *)&v26[8 * v27] = v27;
    ++v27;
  }
  while (v29 != v27);
  v84 = v26;
  v30 = v26 + 8;
  uint64_t v81 = 8 * v17 + 8;
  uint64_t v31 = 1;
  do
  {
    uint64_t v32 = v31 - 1;
    uint64_t v33 = *(void *)&v84[8 * (v31 - 1) * v83] + 1;
    uint64_t v85 = v31;
    v86 = v30;
    *(void *)&v84[8 * v31 * v83] = v33;
    unint64_t v34 = 1;
    do
    {
      uint64_t v35 = [v89 objectAtIndexedSubscript:v34 - 1];
      uint64_t v36 = [v90 objectAtIndexedSubscript:v32];
      if (v87)
      {
        uint64_t v37 = [v35 lowercaseString];

        uint64_t v38 = [v36 lowercaseString];

        uint64_t v36 = (void *)v38;
        uint64_t v35 = (void *)v37;
      }
      if (v88)
      {
        uint64_t v39 = objc_msgSend(v24, "stringByReplacingMatchesInString:options:range:withTemplate:", v35, 0, 0, objc_msgSend(v35, "length"), &stru_1F0A64AB0);

        uint64_t v40 = objc_msgSend(v24, "stringByReplacingMatchesInString:options:range:withTemplate:", v36, 0, 0, objc_msgSend(v36, "length"), &stru_1F0A64AB0);

        uint64_t v36 = (void *)v40;
        uint64_t v35 = (void *)v39;
      }
      uint64_t v41 = *((void *)v30 - 1);
      uint64_t v42 = v41 + ([v35 isEqualToString:v36] ^ 1);
      uint64_t v43 = *(void *)v30 + 1;
      uint64_t v44 = *(void *)&v30[8 * v17];
      if (v43 >= v44 + 1) {
        uint64_t v43 = v44 + 1;
      }
      if (v42 >= v43) {
        uint64_t v42 = v43;
      }
      *(void *)&v30[8 * v17 + 8] = v42;

      ++v34;
      v30 += 8;
    }
    while (v34 <= v17);
    uint64_t v31 = v85 + 1;
    v30 = &v86[v81];
  }
  while (v85 + 1 <= v82);
  id v45 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v86 = (char *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t v46 = v82;
  unint64_t v47 = v17;
  id v13 = v76;
  id v78 = v45;
  do
  {
    if (v46)
    {
      if (!v47)
      {
        unint64_t v58 = 0;
        --v46;
        goto LABEL_55;
      }
      unint64_t v48 = v47 - 1;
      v49 = [v89 objectAtIndexedSubscript:v47 - 1];
      uint64_t v81 = v46 - 1;
      uint64_t v50 = objc_msgSend(v90, "objectAtIndexedSubscript:");
      uint64_t v85 = v46;
      if (v87)
      {
        uint64_t v51 = [v49 lowercaseString];

        uint64_t v52 = [v50 lowercaseString];

        v49 = (void *)v51;
        uint64_t v50 = (void *)v52;
      }
      if (v88)
      {
        uint64_t v53 = objc_msgSend(v24, "stringByReplacingMatchesInString:options:range:withTemplate:", v49, 0, 0, objc_msgSend(v49, "length"), &stru_1F0A64AB0);

        uint64_t v54 = objc_msgSend(v24, "stringByReplacingMatchesInString:options:range:withTemplate:", v50, 0, 0, objc_msgSend(v50, "length"), &stru_1F0A64AB0);

        v55 = (void *)v53;
        v56 = (void *)v54;
      }
      else
      {
        v56 = v50;
        v55 = v49;
      }
      unint64_t v59 = v83;
      uint64_t v60 = v81;
      v61 = &v84[8 * v81 * v83];
      uint64_t v79 = *(void *)&v61[8 * v48];
      id v80 = v55;
      int v62 = [v55 isEqualToString:v56];
      uint64_t v63 = *(void *)&v61[8 * v47];
      unint64_t v57 = v85;
      uint64_t v64 = *(void *)&v84[8 * v85 * v59 + 8 * v48];
      uint64_t v65 = v63 + 1;
      if (v63 + 1 >= v64 + 1) {
        uint64_t v65 = v64 + 1;
      }
      BOOL v66 = v63 <= v64;
      if (v63 <= v64) {
        unint64_t v67 = v47;
      }
      else {
        unint64_t v67 = v47 - 1;
      }
      uint64_t v68 = v79 + (v62 ^ 1u);
      if (v66 || v68 <= v65) {
        unint64_t v46 = v60;
      }
      else {
        unint64_t v46 = v85;
      }
      if (v68 <= v65) {
        unint64_t v58 = v47 - 1;
      }
      else {
        unint64_t v58 = v67;
      }

      id v45 = v78;
    }
    else
    {
      unint64_t v57 = 0;
      unint64_t v58 = v47 - 1;
    }
    if (v46 == v57)
    {
      id v70 = v13;
      unint64_t v46 = v57;
      goto LABEL_56;
    }
LABEL_55:
    id v70 = [v90 objectAtIndexedSubscript:v46];
LABEL_56:
    if (v58 == v47)
    {
      id v71 = v13;
    }
    else
    {
      id v71 = [v89 objectAtIndexedSubscript:v58];
    }
    BOOL v72 = v71;
    [v45 addObject:v70];
    [v86 addObject:v72];

    unint64_t v47 = v58;
  }
  while (v46 | v58);
  ReverseArray(v45);
  BOOL v73 = v86;
  ReverseArray(v86);
  uint64_t v74 = [NSNumber numberWithInteger:*(void *)&v84[8 * v83 * v82 + 8 * v17]];
  (*((void (**)(id, void *, id, char *))v77 + 2))(v77, v74, v45, v73);

LABEL_61:
  id v14 = v77;
LABEL_12:
}

- (void)editAlignmentWithRefText:(id)a3 hypText:(id)a4 placeholderSymbol:(id)a5 caseInsensitive:(BOOL)a6 removeWordSense:(BOOL)a7 completion:(id)a8
{
  BOOL v8 = a7;
  BOOL v9 = a6;
  id v14 = a8;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  uint64_t v20 = objc_alloc_init(_EARNLTokenizer);
  [(_EARNLTokenizer *)v20 setToLowerCase:0];
  [(_EARNLTokenizer *)v20 setReplacePunctuation:0];
  v18 = [(_EARNLTokenizer *)v20 tokenize:v17];

  id v19 = [(_EARNLTokenizer *)v20 tokenize:v16];

  [(_EAREditDistance *)self editAlignmentWithRefTokens:v18 hypTokens:v19 placeholderSymbol:v15 caseInsensitive:v9 removeWordSense:v8 completion:v14];
}

@end