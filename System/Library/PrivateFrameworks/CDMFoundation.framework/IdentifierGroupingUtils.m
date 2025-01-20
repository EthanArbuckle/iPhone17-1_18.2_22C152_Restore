@interface IdentifierGroupingUtils
+ (id)createIdentifier:(unsigned int)a3 interpretationGroupIndex:(unsigned int)a4 nodeIndex:(unsigned int)a5 spanIdentifier:(id)a6;
+ (id)getInterpretationGroupMax:(id)a3;
+ (id)getInterpretationGroups:(id)a3;
+ (id)getTokenIndexIdentifier:(unsigned int)a3 interpretationGroup:(unsigned int)a4 nodeIndex:(unsigned int)a5 span:(id)a6 spanIdentifier:(id)a7;
+ (id)limitAlignments:(id)a3 alignmentSpanDict:(id)a4;
+ (void)createIdentifierGroups:(id)a3 alignmentSpanDict:(id)a4 identifiers:(id)a5 nodeIndex:(unsigned int)a6 interpretationGroupCurrentMax:(id)a7 tagSpans:(id)a8;
+ (void)createNonOverlapping:(id)a3 interpretationGroup:(id)a4 start:(unint64_t)a5 interpretationGroups:(id)a6;
+ (void)sortAlignmentDict:(id)a3 orderedIndexes:(id)a4 alignmentSpanDict:(id)a5;
@end

@implementation IdentifierGroupingUtils

+ (id)getInterpretationGroups:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([v4 count])
  {
    unint64_t v6 = 0;
    do
    {
      id v7 = objc_alloc(MEMORY[0x263EFF980]);
      v8 = [v4 objectAtIndexedSubscript:v6];
      v9 = objc_msgSend(v7, "initWithObjects:", v8, 0);

      [a1 createNonOverlapping:v4 interpretationGroup:v9 start:++v6 interpretationGroups:v5];
    }
    while (v6 < [v4 count]);
  }

  return v5;
}

+ (void)createNonOverlapping:(id)a3 interpretationGroup:(id)a4 start:(unint64_t)a5 interpretationGroups:(id)a6
{
  id v17 = a3;
  id v10 = a4;
  id v11 = a6;
  if ((unint64_t)[v11 count] <= 0x1F)
  {
    if ([v17 count] <= a5) {
      goto LABEL_12;
    }
    if ([v17 count] <= a5) {
      goto LABEL_11;
    }
    char v12 = 0;
    do
    {
      v13 = [v17 objectAtIndexedSubscript:a5];
      v14 = [v10 lastObject];
      char v15 = [v13 overlaps:v14];

      if ((v15 & 1) == 0)
      {
        v16 = (void *)[v10 mutableCopy];
        [v16 addObject:v13];
        if (([MEMORY[0x263F71DB8] subset:v16 of:v11] & 1) == 0)
        {
          [a1 createNonOverlapping:v17 interpretationGroup:v16 start:a5 + 1 interpretationGroups:v11];
          char v12 = 1;
        }
      }
      ++a5;
    }
    while (a5 < [v17 count]);
    if ((v12 & 1) == 0)
    {
LABEL_11:
      if ((unint64_t)[v11 count] <= 0x1F)
      {
LABEL_12:
        if (([MEMORY[0x263F71DB8] subset:v10 of:v11] & 1) == 0) {
          [v11 addObject:v10];
        }
      }
    }
  }
}

+ (void)createIdentifierGroups:(id)a3 alignmentSpanDict:(id)a4 identifiers:(id)a5 nodeIndex:(unsigned int)a6 interpretationGroupCurrentMax:(id)a7 tagSpans:(id)a8
{
  uint64_t v134 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v76 = a4;
  id v96 = a5;
  id v68 = a7;
  id v13 = a8;
  v14 = v12;
  id v74 = v13;
  if (v12 && [v12 count])
  {
    id v70 = v12;
    char v15 = [v12 sortedArrayUsingSelector:sel_compareStartAndSize_];
    if ((unint64_t)[v15 count] < 0xD)
    {
      v19 = v15;
    }
    else
    {
      v16 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v131 = "+[IdentifierGroupingUtils createIdentifierGroups:alignmentSpanDict:identifiers:nodeIndex:interpretationGr"
               "oupCurrentMax:tagSpans:]";
        __int16 v132 = 1024;
        *(_DWORD *)v133 = 12;
        *(_WORD *)&v133[4] = 2112;
        *(void *)&v133[6] = v15;
        _os_log_impl(&dword_2263A0000, v16, OS_LOG_TYPE_INFO, "%s Limiting the number span alignments to %d when creating interpretation groups. Given %@", buf, 0x1Cu);
      }

      uint64_t v17 = [a1 limitAlignments:v15 alignmentSpanDict:v76];

      v18 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v131 = "+[IdentifierGroupingUtils createIdentifierGroups:alignmentSpanDict:identifiers:nodeIndex:interpretationGr"
               "oupCurrentMax:tagSpans:]";
        __int16 v132 = 2112;
        *(void *)v133 = v17;
        _os_log_impl(&dword_2263A0000, v18, OS_LOG_TYPE_INFO, "%s Interpretation group span alignments after limiting: %@", buf, 0x16u);
      }

      v19 = (void *)v17;
    }
    v20 = [a1 getInterpretationGroups:v19];
    if (v68) {
      unsigned int v97 = [v68 unsignedIntValue] + 1;
    }
    else {
      unsigned int v97 = 0;
    }
    long long v122 = 0u;
    long long v123 = 0u;
    long long v120 = 0u;
    long long v121 = 0u;
    obuint64_t j = v20;
    v14 = v12;
    uint64_t v72 = [obj countByEnumeratingWithState:&v120 objects:v129 count:16];
    if (v72)
    {
      uint64_t v71 = *(void *)v121;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v121 != v71)
          {
            uint64_t v22 = v21;
            objc_enumerationMutation(obj);
            uint64_t v21 = v22;
          }
          uint64_t v73 = v21;
          v23 = *(void **)(*((void *)&v120 + 1) + 8 * v21);
          long long v116 = 0u;
          long long v117 = 0u;
          long long v118 = 0u;
          long long v119 = 0u;
          id v24 = v23;
          uint64_t v78 = [v24 countByEnumeratingWithState:&v116 objects:v128 count:16];
          if (v78)
          {
            char v82 = 0;
            uint64_t v25 = 0;
            uint64_t v77 = *(void *)v117;
            id v75 = v24;
            while (1)
            {
              for (uint64_t i = 0; i != v78; ++i)
              {
                if (*(void *)v117 != v77) {
                  objc_enumerationMutation(v24);
                }
                v27 = *(void **)(*((void *)&v116 + 1) + 8 * i);
                v28 = [MEMORY[0x263F08D40] valueWithNonretainedObject:v27];
                v29 = [v76 objectForKeyedSubscript:v28];

                v30 = [v29 usoGraph];
                if (!v30) {
                  goto LABEL_81;
                }
                v79 = v30;
                uint64_t v80 = i;
                long long v114 = 0u;
                long long v115 = 0u;
                long long v112 = 0u;
                long long v113 = 0u;
                v31 = [v30 identifiers];
                uint64_t v32 = [v31 countByEnumeratingWithState:&v112 objects:v127 count:16];
                if (!v32)
                {

                  unsigned int v35 = 0;
                  char v44 = 0;
                  goto LABEL_47;
                }
                uint64_t v33 = v32;
                id v92 = v31;
                char v34 = 0;
                char v94 = 0;
                char v90 = 0;
                unsigned int v35 = 0;
                uint64_t v36 = *(void *)v113;
                do
                {
                  for (uint64_t j = 0; j != v33; ++j)
                  {
                    if (*(void *)v113 != v36) {
                      objc_enumerationMutation(v92);
                    }
                    v38 = *(void **)(*((void *)&v112 + 1) + 8 * j);
                    int v39 = [v38 nodeIndex];
                    if (v39 == [v27 nodeIndex])
                    {
                      if (v34) {
                        goto LABEL_35;
                      }
                      if ([v29 hasInput])
                      {
                        v40 = [a1 getTokenIndexIdentifier:v25 interpretationGroup:v97 nodeIndex:a6 span:v29 spanIdentifier:v38];
                        if (v40) {
                          [v96 addObject:v40];
                        }

LABEL_35:
                        char v34 = 1;
                      }
                      else
                      {
                        char v34 = 0;
                      }
                      v41 = [a1 createIdentifier:v25 interpretationGroupIndex:v97 nodeIndex:a6 spanIdentifier:v38];
                      unsigned int v42 = [v38 groupIndex];
                      if (v35 <= v42) {
                        unsigned int v35 = v42;
                      }
                      [v96 addObject:v41];
                      v94 |= [v38 sourceComponent] == 1;

                      char v90 = 1;
                      char v82 = 1;
                      continue;
                    }
                  }
                  uint64_t v33 = [v92 countByEnumeratingWithState:&v112 objects:v127 count:16];
                }
                while (v33);

                if (v90) {
                  unsigned int v43 = v35 + 1;
                }
                else {
                  unsigned int v43 = 0;
                }
                uint64_t v25 = v43 + v25;
                id v24 = v75;
                char v44 = v94;
LABEL_47:
                if ((v82 & 1) != 0 && (v44 & 1) == 0)
                {
                  long long v110 = 0u;
                  long long v111 = 0u;
                  long long v108 = 0u;
                  long long v109 = 0u;
                  id v45 = v74;
                  uint64_t v83 = [v45 countByEnumeratingWithState:&v108 objects:v126 count:16];
                  if (v83)
                  {
                    char v46 = 0;
                    uint64_t v81 = *(void *)v109;
                    v86 = v27;
                    v87 = v29;
                    id v85 = v45;
                    do
                    {
                      uint64_t v47 = 0;
                      do
                      {
                        if (*(void *)v109 != v81)
                        {
                          uint64_t v48 = v47;
                          objc_enumerationMutation(v45);
                          uint64_t v47 = v48;
                        }
                        uint64_t v84 = v47;
                        v49 = *(void **)(*((void *)&v108 + 1) + 8 * v47);
                        long long v104 = 0u;
                        long long v105 = 0u;
                        long long v106 = 0u;
                        long long v107 = 0u;
                        v89 = v49;
                        v50 = [v49 usoGraph];
                        v51 = [v50 alignments];

                        id v93 = v51;
                        uint64_t v52 = [v51 countByEnumeratingWithState:&v104 objects:v125 count:16];
                        if (v52)
                        {
                          uint64_t v53 = v52;
                          uint64_t v54 = *(void *)v105;
                          uint64_t v88 = *(void *)v105;
                          do
                          {
                            uint64_t v55 = 0;
                            uint64_t v91 = v53;
                            do
                            {
                              if (*(void *)v105 != v54) {
                                objc_enumerationMutation(v93);
                              }
                              v56 = *(void **)(*((void *)&v104 + 1) + 8 * v55);
                              if ([v56 equalIndexes:v27])
                              {
                                uint64_t v95 = v55;
                                long long v102 = 0u;
                                long long v103 = 0u;
                                long long v100 = 0u;
                                long long v101 = 0u;
                                v57 = [v89 usoGraph];
                                v58 = [v57 identifiers];

                                uint64_t v59 = [v58 countByEnumeratingWithState:&v100 objects:v124 count:16];
                                if (v59)
                                {
                                  uint64_t v60 = v59;
                                  uint64_t v61 = *(void *)v101;
                                  do
                                  {
                                    for (uint64_t k = 0; k != v60; ++k)
                                    {
                                      if (*(void *)v101 != v61) {
                                        objc_enumerationMutation(v58);
                                      }
                                      v63 = *(void **)(*((void *)&v100 + 1) + 8 * k);
                                      int v64 = [v63 nodeIndex];
                                      if (v64 == [v56 nodeIndex])
                                      {
                                        v65 = [a1 createIdentifier:v25 interpretationGroupIndex:v97 nodeIndex:a6 spanIdentifier:v63];
                                        unsigned int v66 = [v63 groupIndex];
                                        if (v35 <= v66) {
                                          unsigned int v35 = v66;
                                        }
                                        [v96 addObject:v65];

                                        char v46 = 1;
                                      }
                                    }
                                    uint64_t v60 = [v58 countByEnumeratingWithState:&v100 objects:v124 count:16];
                                  }
                                  while (v60);
                                }

                                v27 = v86;
                                v29 = v87;
                                id v45 = v85;
                                uint64_t v54 = v88;
                                uint64_t v53 = v91;
                                uint64_t v55 = v95;
                              }
                              ++v55;
                            }
                            while (v55 != v53);
                            uint64_t v53 = [v93 countByEnumeratingWithState:&v104 objects:v125 count:16];
                          }
                          while (v53);
                        }

                        uint64_t v47 = v84 + 1;
                      }
                      while (v84 + 1 != v83);
                      uint64_t v83 = [v45 countByEnumeratingWithState:&v108 objects:v126 count:16];
                    }
                    while (v83);

                    if (v46) {
                      uint64_t v25 = v25 + v35 + 1;
                    }
                    id v24 = v75;
                  }
                  else
                  {
                  }
                }
                v30 = v79;
                uint64_t i = v80;
LABEL_81:
              }
              uint64_t v78 = [v24 countByEnumeratingWithState:&v116 objects:v128 count:16];
              if (!v78)
              {

                v97 += v82 & 1;
                v14 = v70;
                goto LABEL_85;
              }
            }
          }

LABEL_85:
          uint64_t v21 = v73 + 1;
        }
        while (v73 + 1 != v72);
        uint64_t v72 = [obj countByEnumeratingWithState:&v120 objects:v129 count:16];
      }
      while (v72);
    }
  }
}

+ (void)sortAlignmentDict:(id)a3 orderedIndexes:(id)a4 alignmentSpanDict:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v8);
        }
        v14 = [v7 objectForKeyedSubscript:*(void *)(*((void *)&v18 + 1) + 8 * v13)];
        char v15 = v14;
        if (v14 && (unint64_t)[v14 count] >= 2)
        {
          v16[0] = MEMORY[0x263EF8330];
          v16[1] = 3221225472;
          v16[2] = __78__IdentifierGroupingUtils_sortAlignmentDict_orderedIndexes_alignmentSpanDict___block_invoke;
          v16[3] = &unk_2647A4428;
          id v17 = v9;
          [v15 sortUsingComparator:v16];
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }
}

uint64_t __78__IdentifierGroupingUtils_sortAlignmentDict_orderedIndexes_alignmentSpanDict___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  unint64_t v6 = (void *)MEMORY[0x263F08D40];
  id v7 = a3;
  id v8 = [v6 valueWithNonretainedObject:a2];
  id v9 = [v5 objectForKeyedSubscript:v8];

  uint64_t v10 = *(void **)(a1 + 32);
  uint64_t v11 = [MEMORY[0x263F08D40] valueWithNonretainedObject:v7];

  uint64_t v12 = [v10 objectForKeyedSubscript:v11];

  if (v9)
  {
    int v13 = !+[CDMServiceGraphUtil spanHasMatcherName:3 matchingSpan:v9];
    if (v12)
    {
LABEL_3:
      BOOL v14 = +[CDMServiceGraphUtil spanHasMatcherName:3 matchingSpan:v12];
      goto LABEL_6;
    }
  }
  else
  {
    int v13 = 1;
    if (v12) {
      goto LABEL_3;
    }
  }
  BOOL v14 = 0;
LABEL_6:
  if (v13 | v14) {
    uint64_t v15 = v13 & v14;
  }
  else {
    uint64_t v15 = -1;
  }

  return v15;
}

+ (id)limitAlignments:(id)a3 alignmentSpanDict:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v30 = a4;
  unint64_t v6 = [MEMORY[0x263EFF9A0] dictionary];
  v31 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  obuint64_t j = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v38 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        uint64_t v12 = (void *)MEMORY[0x263EFF8C0];
        int v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v11, "getStartIndex"));
        BOOL v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v11, "getEndIndex"));
        uint64_t v15 = objc_msgSend(v12, "arrayWithObjects:", v13, v14, 0);

        id v16 = [v6 objectForKeyedSubscript:v15];
        if (!v16)
        {
          id v16 = objc_alloc_init(MEMORY[0x263EFF980]);
          [v6 setObject:v16 forKeyedSubscript:v15];
          [v31 addObject:v15];
        }
        [v16 addObject:v11];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v8);
  }

  [a1 sortAlignmentDict:v6 orderedIndexes:v31 alignmentSpanDict:v30];
  id v17 = objc_alloc_init(MEMORY[0x263EFF980]);
  while ((unint64_t)[v17 count] <= 0xB)
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v18 = v31;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (!v19)
    {

      break;
    }
    uint64_t v20 = v19;
    char v21 = 0;
    uint64_t v22 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v34 != v22) {
          objc_enumerationMutation(v18);
        }
        id v24 = [v6 objectForKeyedSubscript:*(void *)(*((void *)&v33 + 1) + 8 * j)];
        uint64_t v25 = v24;
        if (v24 && [v24 count])
        {
          v26 = [v25 objectAtIndex:0];
          [v17 addObject:v26];

          [v25 removeObjectAtIndex:0];
          char v21 = 1;
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v20);

    if ((v21 & 1) == 0) {
      break;
    }
  }
  v27 = [v17 sortedArrayUsingSelector:sel_compareStartAndSize_];

  return v27;
}

+ (id)getTokenIndexIdentifier:(unsigned int)a3 interpretationGroup:(unsigned int)a4 nodeIndex:(unsigned int)a5 span:(id)a6 spanIdentifier:(id)a7
{
  uint64_t v8 = *(void *)&a5;
  uint64_t v9 = *(void *)&a4;
  uint64_t v10 = *(void *)&a3;
  v30[3] = *MEMORY[0x263EF8340];
  id v12 = a6;
  int v13 = [a1 createIdentifier:v10 interpretationGroupIndex:v9 nodeIndex:v8 spanIdentifier:a7];
  v29[0] = @"endTokenIndex";
  BOOL v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "endTokenIndex"));
  v30[0] = v14;
  v29[1] = @"startTokenIndex";
  uint64_t v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "startTokenIndex"));
  v30[1] = v15;
  v29[2] = @"value";
  id v16 = [v12 input];

  v30[2] = v16;
  id v17 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:3];

  id v24 = 0;
  id v18 = [MEMORY[0x263F08900] dataWithJSONObject:v17 options:2 error:&v24];
  id v19 = v24;
  if (v18)
  {
    uint64_t v20 = (void *)[[NSString alloc] initWithData:v18 encoding:4];
    [v13 setValue:v20];

    char v21 = objc_alloc_init(MEMORY[0x263F71C88]);
    [v21 setValue:*MEMORY[0x263F73898]];
    [v13 setNamespaceA:v21];
    [v13 setBackingAppBundleId:*MEMORY[0x263F737F8]];
    [v13 setProbability:0];
    id v22 = v13;
  }
  else
  {
    char v21 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "+[IdentifierGroupingUtils getTokenIndexIdentifier:interpretationGroup:nodeIndex:span:spanIdentifier:]";
      __int16 v27 = 2112;
      id v28 = v19;
      _os_log_impl(&dword_2263A0000, v21, OS_LOG_TYPE_INFO, "%s Unable to parse MatchingSpan token index JSON: %@", buf, 0x16u);
    }
    id v22 = 0;
  }

  return v22;
}

+ (id)createIdentifier:(unsigned int)a3 interpretationGroupIndex:(unsigned int)a4 nodeIndex:(unsigned int)a5 spanIdentifier:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  uint64_t v7 = *(void *)&a4;
  id v9 = a6;
  uint64_t v10 = objc_opt_new();
  [v9 copyTo:v10];
  [v10 setNodeIndex:v6];
  [v10 setInterpretationGroup:v7];
  LODWORD(v6) = [v9 groupIndex];

  [v10 setGroupIndex:v6 + a3];
  return v10;
}

+ (id)getInterpretationGroupMax:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = objc_msgSend(v3, "identifiers", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v10 hasInterpretationGroup])
        {
          if (!v7
            || (unsigned int v11 = [v10 interpretationGroup], v11 > objc_msgSend(v7, "unsignedIntValue")))
          {
            uint64_t v12 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInt:", objc_msgSend(v10, "interpretationGroup"));

            uint64_t v7 = (void *)v12;
          }
        }
        else
        {
          [v10 setInterpretationGroup:0];
          if (!v7) {
            uint64_t v7 = (void *)[objc_alloc(NSNumber) initWithUnsignedInt:0];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

@end