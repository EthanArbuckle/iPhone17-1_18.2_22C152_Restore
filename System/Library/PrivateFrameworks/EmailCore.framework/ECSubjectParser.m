@interface ECSubjectParser
+ (BOOL)subjectHasForwardPrefix:(id)a3;
+ (BOOL)subjectHasReplyPrefix:(id)a3;
+ (id)subjectWithoutPrefixForSubject:(id)a3;
+ (id)subjectWithoutPrefixForSubject:(id)a3 prefix:(id *)a4;
+ (id)subjectWithoutPrefixIncludingListMarkersForSubject:(id)a3 prefix:(id *)a4;
+ (unint64_t)_fastPrefixLengthForSubject:(id)a3 includingPrefix:(int64_t)a4;
+ (unint64_t)_lastPrefixDelimiterLocationForSubject:(id)a3;
+ (unint64_t)_prefixLengthForSubject:(id)a3 forPrefix:(int64_t)a4;
+ (unint64_t)prefixLengthForSubject:(id)a3;
+ (unint64_t)prefixLengthForSubject:(id)a3 includingPrefix:(int64_t)a4;
@end

@implementation ECSubjectParser

+ (id)subjectWithoutPrefixForSubject:(id)a3 prefix:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [a1 prefixLengthForSubject:v6];
  if (a4)
  {
    *a4 = [v6 substringToIndex:v7];
  }
  v8 = [v6 substringFromIndex:v7];

  return v8;
}

+ (unint64_t)prefixLengthForSubject:(id)a3 includingPrefix:(int64_t)a4
{
  id v6 = a3;
  if ((unint64_t)[v6 length] < 2
    || (uint64_t v7 = [a1 _lastPrefixDelimiterLocationForSubject:v6], v7 == 0x7FFFFFFFFFFFFFFFLL))
  {
    unint64_t v8 = 0;
  }
  else
  {
    unint64_t v8 = [a1 _fastPrefixLengthForSubject:v6 includingPrefix:a4];
    if (v8 < v7 + 1) {
      unint64_t v8 = [a1 _prefixLengthForSubject:v6 forPrefix:a4];
    }
  }

  return v8;
}

+ (unint64_t)prefixLengthForSubject:(id)a3
{
  return [a1 prefixLengthForSubject:a3 includingPrefix:2];
}

+ (unint64_t)_lastPrefixDelimiterLocationForSubject:(id)a3
{
  id v3 = a3;
  v4 = objc_msgSend(MEMORY[0x1E4F28B88], "ec_prefixDelimiterCharacterSet");
  unint64_t v5 = [v3 rangeOfCharacterFromSet:v4 options:4];

  return v5;
}

+ (BOOL)subjectHasReplyPrefix:(id)a3
{
  return [a1 prefixLengthForSubject:a3 includingPrefix:0] != 0;
}

+ (BOOL)subjectHasForwardPrefix:(id)a3
{
  return [a1 prefixLengthForSubject:a3 includingPrefix:1] != 0;
}

+ (id)subjectWithoutPrefixIncludingListMarkersForSubject:(id)a3 prefix:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28FD8], "ec_regularExpressionForList");
  unint64_t v8 = [a1 prefixLengthForSubject:v6 includingPrefix:2];
  if (v8)
  {
    v9 = [v6 substringToIndex:v8];
  }
  else
  {
    v9 = 0;
  }
  unint64_t v10 = [v6 length];
  if (v10 <= v8)
  {
    v17 = &stru_1F1A635E8;
    goto LABEL_15;
  }
  if (objc_msgSend(v7, "rangeOfFirstMatchInString:options:range:", v6, 0, v8, v10 - v8) == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_14;
  }
  uint64_t v12 = v11;
  if (!v11) {
    goto LABEL_14;
  }
  v13 = [v6 substringFromIndex:v11 + v8];
  uint64_t v14 = [a1 prefixLengthForSubject:v13 includingPrefix:2];
  if (!v14)
  {

LABEL_14:
    v17 = [v6 substringFromIndex:v8];
    goto LABEL_15;
  }
  v15 = [v13 substringToIndex:v14];
  if (v9)
  {
    uint64_t v16 = [v9 stringByAppendingString:v15];

    v9 = (void *)v16;
  }
  else
  {
    v9 = [v13 substringToIndex:v14];
  }
  v18 = [v13 substringFromIndex:v14];
  v19 = objc_msgSend(v6, "substringWithRange:", v8, v12);
  v17 = [v19 stringByAppendingString:v18];

  if (!v17) {
    goto LABEL_14;
  }
LABEL_15:
  if (a4) {
    *a4 = v9;
  }

  return v17;
}

+ (unint64_t)_prefixLengthForSubject:(id)a3 forPrefix:(int64_t)a4
{
  id v7 = a3;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __53__ECSubjectParser__prefixLengthForSubject_forPrefix___block_invoke;
  v17 = &__block_descriptor_48_e5_v8__0l;
  SEL v18 = a2;
  id v19 = a1;
  if (_prefixLengthForSubject_forPrefix__predicate != -1) {
    dispatch_once(&_prefixLengthForSubject_forPrefix__predicate, &v14);
  }
  unint64_t v8 = (id *)&_prefixLengthForSubject_forPrefix__replyRegex;
  v9 = &_prefixLengthForSubject_forPrefix__forwardRegex;
  if (a4 != 1) {
    v9 = &_prefixLengthForSubject_forPrefix__prefixRegex;
  }
  if (a4) {
    unint64_t v8 = (id *)v9;
  }
  id v10 = *v8;
  if (objc_msgSend(v10, "rangeOfFirstMatchInString:options:range:", v7, 0, 0, objc_msgSend(v7, "length", v14, v15, v16, v17, v18, v19)) == 0x7FFFFFFFFFFFFFFFLL)unint64_t v12 = 0; {
  else
  }
    unint64_t v12 = v11;

  return v12;
}

void __53__ECSubjectParser__prefixLengthForSubject_forPrefix___block_invoke(uint64_t a1)
{
  v2 = +[ECEmailCoreFramework bundle];
  id v3 = [v2 URLForResource:@"SubjectPrefixes" withExtension:@"plist"];

  id v20 = 0;
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfURL:v3 error:&v20];
  id v5 = v20;
  id v6 = [NSString stringWithFormat:@"Unable to load prefix file with error %@", v5];
  if (!v4)
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"ECSubjectParser.m" lineNumber:188 description:v6];
  }
  id v7 = objc_alloc(MEMORY[0x1E4F1CA80]);
  unint64_t v8 = [v4 objectForKeyedSubscript:@"Reply"];
  v9 = (void *)[v7 initWithArray:v8];

  uint64_t v10 = copyRegexForPrefixStrings(v9);
  unint64_t v11 = (void *)_prefixLengthForSubject_forPrefix__replyRegex;
  _prefixLengthForSubject_forPrefix__replyRegex = v10;

  id v12 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v13 = [v4 objectForKeyedSubscript:@"Forward"];
  uint64_t v14 = (void *)[v12 initWithArray:v13];

  uint64_t v15 = copyRegexForPrefixStrings(v14);
  uint64_t v16 = (void *)_prefixLengthForSubject_forPrefix__forwardRegex;
  _prefixLengthForSubject_forPrefix__forwardRegex = v15;

  [v9 unionSet:v14];
  uint64_t v17 = copyRegexForPrefixStrings(v9);
  SEL v18 = (void *)_prefixLengthForSubject_forPrefix__prefixRegex;
  _prefixLengthForSubject_forPrefix__prefixRegex = v17;
}

+ (unint64_t)_fastPrefixLengthForSubject:(id)a3 includingPrefix:(int64_t)a4
{
  id v5 = (__CFString *)a3;
  unint64_t v6 = [(__CFString *)v5 length];
  unint64_t v82 = v6 - 2;
  if (v6 >= 2)
  {
    long long v92 = 0u;
    long long v90 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    *(_OWORD *)buffer = 0u;
    theString[0] = v5;
    uint64_t v94 = 0;
    long long v93 = v6;
    v80 = v5;
    theString[1] = (CFStringRef)CFStringGetCharactersPtr(v5);
    if (theString[1]) {
      CStringPtr = 0;
    }
    else {
      CStringPtr = CFStringGetCStringPtr(v5, 0x600u);
    }
    *((void *)&v93 + 1) = 0;
    uint64_t v94 = 0;
    *(void *)&long long v92 = CStringPtr;
    if (v82)
    {
      uint64_t v9 = 0;
      uint64_t v10 = 0;
      unint64_t v79 = a4 & 0xFFFFFFFFFFFFFFFDLL;
      unint64_t v81 = a4 - 1;
      while (1)
      {
        if (v10 < -2) {
          goto LABEL_84;
        }
        uint64_t v11 = v10 + 2;
        uint64_t v12 = v93;
        if ((uint64_t)v93 <= v10 + 2) {
          goto LABEL_84;
        }
        if (theString[1])
        {
          UniChar v13 = *((_WORD *)&theString[1]->isa + *((void *)&v92 + 1) + v11);
        }
        else if ((void)v92)
        {
          UniChar v13 = *(char *)(v92 + *((void *)&v92 + 1) + v11);
        }
        else
        {
          if (v94 <= v11 || v9 > v11)
          {
            uint64_t v14 = v10 - 2;
            if ((unint64_t)v10 < 2) {
              uint64_t v14 = 0;
            }
            if (v14 + 64 < (uint64_t)v93) {
              uint64_t v12 = v14 + 64;
            }
            *((void *)&v93 + 1) = v14;
            uint64_t v94 = v12;
            v95.location = *((void *)&v92 + 1) + v14;
            v95.length = v12 - v14;
            CFStringGetCharacters(theString[0], v95, buffer);
            uint64_t v9 = *((void *)&v93 + 1);
          }
          UniChar v13 = buffer[v11 - v9];
        }
        if (v13 == 58)
        {
          if (v79) {
            goto LABEL_135;
          }
          BOOL v15 = 0;
          uint64_t v16 = 0;
          uint64_t v17 = -v10;
          uint64_t v18 = v10 + 64;
          unint64_t v19 = v10;
          do
          {
            if (v19 >= 4) {
              uint64_t v20 = 4;
            }
            else {
              uint64_t v20 = v19;
            }
            uint64_t v21 = v10 + v16;
            if (v10 + v16 < 0 || (uint64_t v22 = v93, (uint64_t)v93 <= v21))
            {
              UniChar v23 = 0;
            }
            else if (theString[1])
            {
              UniChar v23 = *((_WORD *)&theString[1]->isa + v10 + v16 + *((void *)&v92 + 1));
            }
            else if ((void)v92)
            {
              UniChar v23 = *(char *)(v92 + *((void *)&v92 + 1) + v10 + v16);
            }
            else
            {
              if (v94 <= v21 || v9 > v21)
              {
                uint64_t v24 = v20 + v17;
                uint64_t v25 = v18 - v20;
                uint64_t v26 = -v20;
                uint64_t v27 = 64 - v20;
                uint64_t v28 = v16 + v10 - v20;
                uint64_t v29 = v10 + v16 + v27;
                if (v29 >= (uint64_t)v93) {
                  uint64_t v29 = v93;
                }
                *((void *)&v93 + 1) = v28;
                uint64_t v94 = v29;
                if ((uint64_t)v93 >= v25) {
                  uint64_t v22 = v25;
                }
                v96.length = v22 + v24;
                v96.location = v10 + v16 + v26 + *((void *)&v92 + 1);
                CFStringGetCharacters(theString[0], v96, buffer);
                uint64_t v9 = *((void *)&v93 + 1);
              }
              UniChar v23 = buffer[v10 - v9 + v16];
            }
            if (((_fastPrefixLengthForSubject_includingPrefix__rePrefix[v16] ^ v23) & 0xFFDF) != 0) {
              break;
            }
            BOOL v15 = v16 != 0;
            ++v19;
            --v17;
            ++v18;
            ++v16;
          }
          while (v16 != 2);
          if (!v15)
          {
LABEL_135:
            if (v81 > 1) {
              goto LABEL_137;
            }
            BOOL v63 = 0;
            uint64_t v64 = 0;
            uint64_t v65 = -v10;
            uint64_t v66 = v10 + 64;
            unint64_t v67 = v10;
            do
            {
              if (v67 >= 4) {
                uint64_t v68 = 4;
              }
              else {
                uint64_t v68 = v67;
              }
              uint64_t v69 = v10 + v64;
              if (v10 + v64 < 0 || (uint64_t v70 = v93, (uint64_t)v93 <= v69))
              {
                UniChar v71 = 0;
              }
              else if (theString[1])
              {
                UniChar v71 = *((_WORD *)&theString[1]->isa + v10 + v64 + *((void *)&v92 + 1));
              }
              else if ((void)v92)
              {
                UniChar v71 = *(char *)(v92 + *((void *)&v92 + 1) + v10 + v64);
              }
              else
              {
                if (v94 <= v69 || v9 > v69)
                {
                  uint64_t v72 = v68 + v65;
                  uint64_t v73 = v66 - v68;
                  uint64_t v74 = -v68;
                  uint64_t v75 = 64 - v68;
                  uint64_t v76 = v64 + v10 - v68;
                  uint64_t v77 = v10 + v64 + v75;
                  if (v77 >= (uint64_t)v93) {
                    uint64_t v77 = v93;
                  }
                  *((void *)&v93 + 1) = v76;
                  uint64_t v94 = v77;
                  if ((uint64_t)v93 >= v73) {
                    uint64_t v70 = v73;
                  }
                  v99.length = v70 + v72;
                  v99.location = v10 + v64 + v74 + *((void *)&v92 + 1);
                  CFStringGetCharacters(theString[0], v99, buffer);
                  uint64_t v9 = *((void *)&v93 + 1);
                }
                UniChar v71 = buffer[v10 - v9 + v64];
              }
              if (((_fastPrefixLengthForSubject_includingPrefix__fwPrefix[v64] ^ v71) & 0xFFDF) != 0) {
                break;
              }
              BOOL v63 = v64 != 0;
              ++v67;
              --v65;
              ++v66;
              ++v64;
            }
            while (v64 != 2);
            if (!v63) {
              goto LABEL_137;
            }
          }
          uint64_t v49 = 3;
        }
        else
        {
LABEL_84:
          if (v81 > 1) {
            goto LABEL_137;
          }
          if (v10 < -3) {
            goto LABEL_137;
          }
          uint64_t v30 = v10 + 3;
          uint64_t v31 = v93;
          if ((uint64_t)v93 <= v10 + 3) {
            goto LABEL_137;
          }
          if (theString[1])
          {
            UniChar v32 = *((_WORD *)&theString[1]->isa + *((void *)&v92 + 1) + v30);
          }
          else if ((void)v92)
          {
            UniChar v32 = *(char *)(v92 + *((void *)&v92 + 1) + v30);
          }
          else
          {
            if (v94 <= v30 || v9 > v30)
            {
              uint64_t v33 = v10 - 1;
              if (!v10) {
                uint64_t v33 = 0;
              }
              if (v33 + 64 < (uint64_t)v93) {
                uint64_t v31 = v33 + 64;
              }
              *((void *)&v93 + 1) = v33;
              uint64_t v94 = v31;
              v97.location = *((void *)&v92 + 1) + v33;
              v97.length = v31 - v33;
              CFStringGetCharacters(theString[0], v97, buffer);
              uint64_t v9 = *((void *)&v93 + 1);
            }
            UniChar v32 = buffer[v30 - v9];
          }
          if (v32 != 58) {
            goto LABEL_137;
          }
          BOOL v34 = 0;
          unint64_t v35 = 0;
          uint64_t v36 = -v10;
          uint64_t v37 = v10 + 64;
          unint64_t v38 = v10;
          do
          {
            if (v38 >= 4) {
              uint64_t v39 = 4;
            }
            else {
              uint64_t v39 = v38;
            }
            uint64_t v40 = v10 + v35;
            if ((uint64_t)(v10 + v35) < 0 || (uint64_t v41 = v93, (uint64_t)v93 <= v40))
            {
              UniChar v42 = 0;
            }
            else if (theString[1])
            {
              UniChar v42 = *((_WORD *)&theString[1]->isa + v10 + v35 + *((void *)&v92 + 1));
            }
            else if ((void)v92)
            {
              UniChar v42 = *(char *)(v92 + *((void *)&v92 + 1) + v10 + v35);
            }
            else
            {
              if (v94 <= v40 || v9 > v40)
              {
                uint64_t v43 = v39 + v36;
                uint64_t v44 = v37 - v39;
                uint64_t v45 = -v39;
                uint64_t v46 = 64 - v39;
                unint64_t v47 = v35 + v10 - v39;
                uint64_t v48 = v10 + v35 + v46;
                if (v48 >= (uint64_t)v93) {
                  uint64_t v48 = v93;
                }
                *((void *)&v93 + 1) = v47;
                uint64_t v94 = v48;
                if ((uint64_t)v93 >= v44) {
                  uint64_t v41 = v44;
                }
                v98.length = v41 + v43;
                v98.location = v10 + v35 + v45 + *((void *)&v92 + 1);
                CFStringGetCharacters(theString[0], v98, buffer);
                uint64_t v9 = *((void *)&v93 + 1);
              }
              UniChar v42 = buffer[v10 - v9 + v35];
            }
            if ((((unsigned __int16)_fastPrefixLengthForSubject_includingPrefix__fwdPrefix[v35] ^ v42) & 0xFFDF) != 0) {
              break;
            }
            BOOL v34 = v35 > 1;
            ++v38;
            --v36;
            ++v37;
            ++v35;
          }
          while (v35 != 3);
          if (!v34)
          {
LABEL_137:
            int64_t v7 = v10;
            goto LABEL_139;
          }
          uint64_t v49 = 4;
        }
        int64_t v7 = v49 + v10;
        if (v49 + v10 >= 0)
        {
          uint64_t v50 = v93;
          if ((uint64_t)v93 > v7)
          {
            int64_t v51 = -v7;
            uint64_t v52 = v49 + v10 + 64;
            do
            {
              if ((unint64_t)v7 >= 4) {
                uint64_t v53 = 4;
              }
              else {
                uint64_t v53 = v7;
              }
              if (theString[1])
              {
                UniChar v54 = *((_WORD *)&theString[1]->isa + v7 + *((void *)&v92 + 1));
              }
              else if ((void)v92)
              {
                UniChar v54 = *(char *)(v92 + *((void *)&v92 + 1) + v7);
              }
              else
              {
                if (v94 <= v7 || v9 > v7)
                {
                  uint64_t v56 = -v53;
                  uint64_t v57 = v53 + v51;
                  uint64_t v58 = v52 - v53;
                  int64_t v59 = v7 + v56;
                  uint64_t v60 = v59 + 64;
                  if (v59 + 64 >= v50) {
                    uint64_t v60 = v50;
                  }
                  *((void *)&v93 + 1) = v59;
                  uint64_t v94 = v60;
                  v61.location = v59 + *((void *)&v92 + 1);
                  if (v50 >= v58) {
                    uint64_t v62 = v58;
                  }
                  else {
                    uint64_t v62 = v50;
                  }
                  v61.length = v62 + v57;
                  CFStringGetCharacters(theString[0], v61, buffer);
                  uint64_t v9 = *((void *)&v93 + 1);
                }
                UniChar v54 = buffer[v7 - v9];
              }
              if (v54 != 32) {
                break;
              }
              ++v7;
              uint64_t v50 = v93;
              --v51;
              ++v52;
            }
            while ((uint64_t)v93 > v7);
          }
        }
        uint64_t v10 = v7;
        if (v7 >= v82) {
          goto LABEL_139;
        }
      }
    }
    int64_t v7 = 0;
LABEL_139:
    id v5 = v80;
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

+ (id)subjectWithoutPrefixForSubject:(id)a3
{
  id v3 = [a1 subjectWithoutPrefixForSubject:a3 prefix:0];
  return v3;
}

@end