@interface WebTextIterator(DDExtensions)
+ (id)dd_iteratorForDocument:()DDExtensions;
- (id)dd_collectDDRangesForQuery:()DDExtensions forResults:;
- (id)dd_doUrlificationForQuery:()DDExtensions forResults:referenceDate:document:DOMWasModified:relevantResults:URLificationBlock:;
- (uint64_t)dd_newQueryStopRange:()DDExtensions;
@end

@implementation WebTextIterator(DDExtensions)

- (uint64_t)dd_newQueryStopRange:()DDExtensions
{
  CFCharacterSetRef Predefined = CFCharacterSetGetPredefined(kCFCharacterSetWhitespaceAndNewline);
  CFCharacterSetRef v5 = CFCharacterSetGetPredefined(kCFCharacterSetNewline);
  uint64_t v25 = DDScanQueryCreate();
  if (([a1 atEnd] & 1) == 0)
  {
    CFAllocatorRef alloc = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    uint64_t v6 = -1;
    do
    {
      uint64_t v7 = v6++;
      uint64_t v8 = [a1 currentTextLength];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v24 = v7;
        uint64_t v26 = v6;
        uint64_t v10 = [a1 currentTextPointer];
        uint64_t v11 = 0;
        char v12 = 0;
        int v13 = 0;
        int v14 = 0;
        do
        {
          if (!CFCharacterSetIsCharacterMember(Predefined, *(_WORD *)(v10 + 2 * v11)))
          {
            CFStringRef v20 = CFStringCreateWithCharacters(alloc, (const UniChar *)[a1 currentTextPointer], objc_msgSend(a1, "currentTextLength"));
            uint64_t v6 = v26;
            DDScanQueryAddTextFragment();
            CFRelease(v20);
            goto LABEL_25;
          }
          int IsCharacterMember = CFCharacterSetIsCharacterMember(v5, *(_WORD *)(v10 + 2 * v11));
          int v16 = *(unsigned __int16 *)(v10 + 2 * v11);
          int v17 = (v16 == 9) | v14;
          if (IsCharacterMember)
          {
            int v17 = v14;
            char v12 = 1;
          }
          if (v16 == 160) {
            int v14 = (v13 > 1) | v17;
          }
          else {
            int v14 = v17;
          }
          if (v16 == 160) {
            ++v13;
          }
          else {
            int v13 = 0;
          }
          ++v11;
        }
        while (v9 != v11);
        if (v12)
        {
          DDScanQueryAddLineBreak();
          uint64_t v18 = v24;
          uint64_t v6 = v26;
          if (!a3) {
            goto LABEL_25;
          }
          uint64_t v19 = 4999;
        }
        else
        {
          DDScanQueryAddSeparator();
          uint64_t v18 = v24;
          uint64_t v6 = v26;
          if (!a3) {
            goto LABEL_25;
          }
          uint64_t v19 = 9999;
        }
        if (v18 > v19) {
          goto LABEL_27;
        }
      }
      else
      {
        DDScanQueryAddSeparator();
        if (a3 && v7 > 999)
        {
LABEL_27:
          *a3 = [a1 currentRange];
          return v25;
        }
      }
LABEL_25:
      [a1 advance];
    }
    while (([a1 atEnd] & 1) == 0);
  }
  return v25;
}

- (id)dd_collectDDRangesForQuery:()DDExtensions forResults:
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  context = (void *)MEMORY[0x1A6236B60]();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v5;
  uint64_t v33 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v33)
  {
    uint64_t v6 = 0;
    uint64_t v31 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v36 != v31) {
          objc_enumerationMutation(obj);
        }
        int QueryRangeForURLification = DDResultGetQueryRangeForURLification();
        int v9 = v8;
        uint64_t v10 = (uint64_t)QueryRangeForURLification >> 16;
        uint64_t FragmentMetaData = DDScanQueryGetFragmentMetaData();
        uint64_t v12 = FragmentMetaData;
        if (v6 < FragmentMetaData)
        {
          uint64_t v13 = FragmentMetaData - v6;
          do
          {
            [a1 advance];
            --v13;
          }
          while (v13);
          uint64_t v6 = v12;
        }
        int v14 = [a1 currentRange];
        v15 = +[DDRange rangeWithDOMRange:v14];

        int v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v15, 0);
        int v17 = [v15 node];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (v10 < (uint64_t)v9 >> 16)
        {
          uint64_t v19 = (uint64_t)v9 >> 16;
          do
          {
            ++v10;
            uint64_t v20 = DDScanQueryGetFragmentMetaData();
            uint64_t v21 = v20;
            if (v6 < v20)
            {
              uint64_t v22 = v20 - v6;
              do
              {
                [a1 advance];
                --v22;
              }
              while (v22);
              uint64_t v6 = v21;
            }
            v23 = [a1 currentRange];
            uint64_t v24 = +[DDRange rangeWithDOMRange:v23];
            [v16 addObject:v24];

            if (isKindOfClass)
            {
              uint64_t v25 = [v15 node];
              objc_opt_class();
              char isKindOfClass = objc_opt_isKindOfClass();
            }
            else
            {
              char isKindOfClass = 0;
            }
          }
          while (v10 != v19);
        }
        if (isKindOfClass)
        {
          [v32 addObject:v16];
        }
        else
        {
          uint64_t v26 = [MEMORY[0x1E4F1CA98] null];
          [v32 addObject:v26];
        }
      }
      uint64_t v33 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v33);
  }

  id v27 = v32;

  return v27;
}

- (id)dd_doUrlificationForQuery:()DDExtensions forResults:referenceDate:document:DOMWasModified:relevantResults:URLificationBlock:
{
  uint64_t v176 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v132 = a5;
  id v140 = a6;
  v134 = a9;
  id v127 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v169 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v171 = 0u;
  long long v172 = 0u;
  long long v173 = 0u;
  long long v174 = 0u;
  id obj = v11;
  uint64_t v13 = [obj countByEnumeratingWithState:&v171 objects:v175 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = 0;
    uint64_t v16 = *(void *)v172;
    CFStringRef v17 = (const __CFString *)*MEMORY[0x1E4F5F0A0];
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v172 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v171 + 1) + 8 * i);
        uint64_t v20 = [MEMORY[0x1E4F28D58] indexPathWithIndex:v15];
        CFStringRef Type = (const __CFString *)DDResultGetType();
        if (CFStringCompare(Type, v17, 0))
        {
          [v169 addObject:v19];
          [v12 addObject:v20];
        }
        else
        {
          SubResults = (void *)DDResultGetSubResults();
          [v169 addObjectsFromArray:SubResults];
          if ([SubResults count])
          {
            unint64_t v23 = 0;
            do
            {
              uint64_t v24 = [v20 indexPathByAddingIndex:v23];
              [v12 addObject:v24];

              ++v23;
            }
            while (v23 < [SubResults count]);
          }
        }
        ++v15;
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v171 objects:v175 count:16];
    }
    while (v14);
  }

  uint64_t v25 = v169;
  uint64_t v26 = objc_msgSend(a1, "dd_collectDDRangesForQuery:forResults:", a3, v169);
  if (!v26)
  {
    id v119 = 0;
    v120 = v127;
    goto LABEL_132;
  }
  uint64_t v27 = [v169 count];
  if ([v26 count] != v27)
  {
    DDLog();
    CFTimeZoneRef v28 = CFTimeZoneCopyDefault();
    goto LABEL_127;
  }
  CFTimeZoneRef v28 = CFTimeZoneCopyDefault();
  if (!v27)
  {
LABEL_127:
    CFRelease(v28);
    v29 = 0;
    BOOL v30 = 0;
    v116 = 0;
    v118 = 0;
    goto LABEL_128;
  }
  v29 = 0;
  uint64_t v160 = 0;
  BOOL v30 = 0;
  BOOL v156 = 0;
  uint64_t v31 = 0;
  v157 = 0;
  uint64_t v32 = 0;
  CFTimeZoneRef cf = v28;
  uint64_t v163 = 0;
  uint64_t v164 = 4294901760;
  uint64_t v124 = v27;
  v125 = v26;
  do
  {
    uint64_t v33 = objc_msgSend(v25, "objectAtIndex:", v32, v122, MatchedString);
    uint64_t v149 = v32;
    v34 = [v26 objectAtIndex:v32];
    long long v35 = [MEMORY[0x1E4F1CA98] null];
    v167 = v34;
    LODWORD(v34) = [v34 isEqual:v35];

    if (v34)
    {
      if ((dd_doUrlificationForQuery_forResults_referenceDate_document_DOMWasModified_relevantResults_URLificationBlock__didLog & 1) == 0)
      {
        uint64_t v122 = v33;
        DDLog();
        dd_doUrlificationForQuery_forResults_referenceDate_document_DOMWasModified_relevantResults_URLificationBlock__didLog = 1;
      }
    }
    else
    {
      uint64_t QueryRangeForURLification = DDResultGetQueryRangeForURLification();
      uint64_t v38 = QueryRangeForURLification;
      uint64_t v39 = (uint64_t)(int)v164 >> 16;
      uint64_t v40 = (uint64_t)(int)QueryRangeForURLification >> 16;
      if ((int)v39 >= (int)v40 && ((int)v39 > (int)v40 || SHIDWORD(v164) >= SHIDWORD(QueryRangeForURLification)))
      {
        uint64_t v122 = v33;
        uint64_t MatchedString = DDResultGetMatchedString();
        DDLog();
      }
      else
      {
        v158 = v31;
        uint64_t v147 = (uint64_t)(int)QueryRangeForURLification >> 16;
        uint64_t v131 = v37;
        v41 = [v12 objectAtIndex:v149];
        uint64_t v42 = objc_msgSend(v41, "dd_stringValue");

        v138 = (void *)v42;
        v137 = v134[2](v134, v33, v42, v132, cf);
        if (v137)
        {
          v43 = [v167 objectAtIndex:0];
          v44 = [v167 lastObject];
          v136 = v43;
          v45 = [v43 node];
          v135 = v44;
          uint64_t v46 = [v44 node];
          uint64_t v47 = MEMORY[0x1A6236B60]();
          unsigned __int8 v170 = 0;
          v145 = (void *)v46;
          char v48 = objc_msgSend(v45, "dd_searchForLinkRemovingExistingDDLinksWithEndNode:didModifyDOM:", v46, &v170);
          BOOL v130 = (v170 | (v30 || (v48 & 1) == 0)) != 0;
          v146 = v45;
          context = (void *)v47;
          if ((v48 & 1) != 0 || (uint64_t v49 = v147, v147 > (uint64_t)(int)v131 >> 16))
          {
            uint64_t v31 = v158;
          }
          else
          {
            uint64_t v50 = (uint64_t)(int)v131 >> 16;
            uint64_t v133 = v38 >> 32;
            char v154 = 1;
            uint64_t v51 = v147;
            uint64_t v31 = v158;
            uint64_t v150 = v50;
            do
            {
              v152 = [v167 objectAtIndex:v51 - v49];
              v52 = [v152 node];
              if (v51 <= v50) {
                uint64_t v53 = v50;
              }
              else {
                uint64_t v53 = v51;
              }
              while (v53 != v51)
              {
                uint64_t v54 = v51 + 1;
                v55 = [v167 objectAtIndex:1 - v147 + v51];
                v56 = [v55 node];

                uint64_t v51 = v54;
                if (v56 != v52)
                {
                  uint64_t v53 = v54 - 1;
                  break;
                }
              }
              id v57 = v157;
              if (v157 == v52)
              {
                v165 = 0;
              }
              else
              {
                if (v156 && v157 != 0)
                {
                  v58 = [v31 substringFromIndex:v163];
                  [v157 setData:v58];
                }
                id v59 = v52;

                [v59 data];
                v165 = uint64_t v163 = 0;
                uint64_t v31 = 0;
                BOOL v156 = 0;
                id v57 = v59;
              }
              v162 = [v52 parentNode];
              v60 = v31;
              if (v52 == v146) {
                uint64_t v61 = [v136 startOffset] + v133;
              }
              else {
                uint64_t v61 = 0;
              }
              v62 = v29;
              v157 = v57;
              if (v52 == v145)
              {
                uint64_t v64 = [v135 startOffset] + (v131 >> 32);
                uint64_t v66 = v160;
                uint64_t v65 = v160;
                v63 = v165;
              }
              else
              {
                v63 = v165;
                if (v165)
                {
                  uint64_t v64 = [v165 length];
                  uint64_t v65 = 0;
                }
                else
                {
                  uint64_t v67 = [v60 length];
                  uint64_t v65 = 0;
                  uint64_t v64 = v67 - v163;
                }
                uint64_t v66 = v160;
              }
              if (v52 == v146 && v62 == v52) {
                uint64_t v69 = v66;
              }
              else {
                uint64_t v69 = 0;
              }
              uint64_t v148 = v64;
              uint64_t v141 = v64 - v65;
              if (v62 == v52) {
                uint64_t v70 = v64 - v65;
              }
              else {
                uint64_t v70 = v64;
              }
              uint64_t v160 = v66;
              uint64_t v161 = v70;
              if (!dd_doUrlificationForQuery_forResults_referenceDate_document_DOMWasModified_relevantResults_URLificationBlock__nonWhitespaceCharset)
              {
                v71 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
                uint64_t v72 = [v71 invertedSet];
                v73 = (void *)dd_doUrlificationForQuery_forResults_referenceDate_document_DOMWasModified_relevantResults_URLificationBlock__nonWhitespaceCharset;
                dd_doUrlificationForQuery_forResults_referenceDate_document_DOMWasModified_relevantResults_URLificationBlock__nonWhitespaceCharset = v72;

                v63 = v165;
              }
              v159 = v60;
              uint64_t v74 = v61 - v69;
              int v75 = *(_DWORD *)(*(void *)(a3 + 16) + 48 * v53 + 40);
              v153 = v62;
              if (v63)
              {
                id v76 = v63;
                uint64_t v77 = v74;
              }
              else
              {
                id v76 = v159;
                uint64_t v77 = v74 + v163;
              }
              int v78 = v75 & 0x18000000;
              uint64_t v79 = objc_msgSend(v76, "rangeOfCharacterFromSet:options:range:", dd_doUrlificationForQuery_forResults_referenceDate_document_DOMWasModified_relevantResults_URLificationBlock__nonWhitespaceCharset, 0, v77, v161 - v74);
              v151 = v76;
              if (v80)
              {
                if (v154) {
                  uint64_t v81 = v79 - v77;
                }
                else {
                  uint64_t v81 = 0;
                }
                uint64_t v82 = v161 - v74 - v81;
                BOOL v83 = v53 != v150 && v78 == 0;
                char v84 = !v83;
                char v144 = v84;
                if (!v83)
                {
                  if (v154) {
                    uint64_t v85 = v79;
                  }
                  else {
                    uint64_t v85 = v77;
                  }
                  uint64_t v86 = objc_msgSend(v76, "rangeOfCharacterFromSet:options:range:", dd_doUrlificationForQuery_forResults_referenceDate_document_DOMWasModified_relevantResults_URLificationBlock__nonWhitespaceCharset, 4, v85, v82);
                  uint64_t v82 = v87 - v85 + v86;
                }
                v88 = v165;
                uint64_t v89 = v81 + v74;
                v90 = v159;
                uint64_t v91 = v82;
                if (v81 + v74)
                {
                  if (v165) {
                    [v165 substringToIndex:v89];
                  }
                  else {
                  v94 = objc_msgSend(v159, "substringWithRange:", v163, v89);
                  }
                  v95 = [v140 createTextNode:v94];
                  id v96 = (id)[v162 insertBefore:v95 refChild:v52];

                  v88 = v165;
                  uint64_t v82 = v91;
                }
                if (v88)
                {
                  v97 = v88;
                  uint64_t v98 = v89;
                }
                else
                {
                  uint64_t v98 = v89 + v163;
                  v97 = v159;
                }
                v143 = objc_msgSend(v97, "substringWithRange:", v98, v82);
                v155 = [v140 createTextNode:v143];
                v99 = [v140 createElement:@"a"];
                if (objc_opt_respondsToSelector())
                {
                  if (objc_opt_respondsToSelector()) {
                    [v99 setDir:@"ltr"];
                  }
                  [v99 setHref:v137];
                  if (!v163)
                  {
                    v100 = v88 ? v88 : v159;
                    if (v91 == [v100 length])
                    {
                      v101 = [v157 parentElement];
                      v102 = [v101 getAttributeNode:@"color"];

                      if (v102)
                      {
                        v103 = [v102 style];
                        v104 = [v103 cssText];
                        [v99 setAttribute:@"style" value:v104];
                      }
                      v88 = v165;
                    }
                  }
                }
                id v105 = (id)[v99 appendChild:v155];
                id v106 = (id)[v162 insertBefore:v99 refChild:v52];
                [v99 setAttribute:@"x-apple-data-detectors" value:@"true"];
                unsigned int v107 = DDResultGetCategory() - 1;
                if (v107 > 4) {
                  v108 = 0;
                }
                else {
                  v108 = off_1E5A859D8[v107];
                }
                [v99 setAttribute:@"x-apple-data-detectors-type" value:v108];
                [v99 setAttribute:@"x-apple-data-detectors-result" value:v138];
                if (v88) {
                  uint64_t v109 = [v88 length];
                }
                else {
                  uint64_t v109 = [v159 length] - v163;
                }
                BOOL v142 = v161 < v109;
                if (v161 < v109)
                {
                  if (v156)
                  {
                    v163 += v161;
                  }
                  else if (v159 == v88)
                  {
                    uint64_t v163 = v161;
                    v90 = v88;
                  }
                  else
                  {
                    uint64_t v112 = [v88 copy];

                    uint64_t v163 = v161;
                    v90 = (void *)v112;
                  }
                }
                else
                {
                  v110 = [v52 data];
                  uint64_t v111 = [v110 length];

                  if (v111) {
                    [v52 setData:&stru_1EF5023D8];
                  }

                  v157 = 0;
                  uint64_t v163 = 0;
                  v90 = 0;
                  v88 = v165;
                }
                v113 = v90;
                if (v153 == v52)
                {
                  id v114 = v153;
                  uint64_t v115 = v141 + v160;
                  v93 = v152;
                }
                else
                {
                  id v114 = v52;

                  v93 = v152;
                  uint64_t v115 = v148;
                }

                char v154 = v144;
                BOOL v156 = v142;
                uint64_t v160 = v115;
                v29 = v114;
                uint64_t v31 = v113;
              }
              else
              {
                BOOL v92 = v78 != 0;
                v29 = v153;
                v154 |= v92;
                uint64_t v31 = v159;
                v93 = v152;
                v88 = v165;
              }

              uint64_t v51 = v53 + 1;
              uint64_t v50 = (uint64_t)(int)v131 >> 16;
              uint64_t v49 = v147;
            }
            while (v53 < v150);
          }

          uint64_t v164 = v131;
          uint64_t v25 = v169;
          uint64_t v27 = v124;
          uint64_t v26 = v125;
          BOOL v30 = v130;
        }
        else
        {
          uint64_t v31 = v158;
        }
      }
    }

    uint64_t v32 = v149 + 1;
  }
  while (v149 + 1 != v27);
  CFRelease(cf);
  if (!v156)
  {
    v116 = v31;
    v120 = v127;
    v118 = v157;
    goto LABEL_129;
  }
  v116 = v31;
  v117 = [v31 substringFromIndex:v163];
  v118 = v157;
  [v157 setData:v117];

LABEL_128:
  v120 = v127;
LABEL_129:

  if (a7) {
    *a7 = v30;
  }
  id v119 = v120;

LABEL_132:
  return v119;
}

+ (id)dd_iteratorForDocument:()DDExtensions
{
  id v3 = a3;
  uint64_t v4 = [v3 body];
  id v5 = (void *)v4;
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  if (v3 && v4)
  {
    uint64_t v6 = [v3 createRange];
    [v6 selectNode:v5];
    if (v6 && ([v6 collapsed] & 1) == 0) {
      uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F46738]) initWithRange:v6];
    }
    else {
      uint64_t v7 = 0;
    }
  }

  return v7;
}

@end