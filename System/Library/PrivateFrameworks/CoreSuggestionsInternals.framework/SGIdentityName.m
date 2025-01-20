@interface SGIdentityName
+ (id)nameWithString:(id)a3;
+ (id)patterns;
- (NSString)firstname;
- (NSString)fullName;
- (NSString)middlename;
- (NSString)prefix;
- (NSString)suffix;
- (NSString)surname;
- (SGIdentityName)initWithChineseName:(id)a3;
- (SGIdentityName)initWithJapaneseName:(id)a3;
- (SGIdentityName)initWithKoreanName:(id)a3;
- (SGIdentityName)initWithSpanishName:(id)a3;
- (SGIdentityName)initWithString:(id)a3;
- (SGIdentityName)initWithVietnameseName:(id)a3;
- (SGIdentityName)initWithWesternName:(id)a3;
- (id)segmentWesternNameWithNameParts:(id)a3 andPrefix:(id)a4;
- (id)toSGNameWithOrigin:(id)a3 recordId:(id)a4 extractionInfo:(id)a5;
@end

@implementation SGIdentityName

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suffix, 0);
  objc_storeStrong((id *)&self->_prefix, 0);
  objc_storeStrong((id *)&self->_middlename, 0);
  objc_storeStrong((id *)&self->_surname, 0);
  objc_storeStrong((id *)&self->_firstname, 0);
  objc_storeStrong((id *)&self->_privFullName, 0);
}

- (NSString)suffix
{
  return self->_suffix;
}

- (NSString)prefix
{
  return self->_prefix;
}

- (NSString)middlename
{
  return self->_middlename;
}

- (NSString)surname
{
  return self->_surname;
}

- (NSString)firstname
{
  return self->_firstname;
}

- (id)toSGNameWithOrigin:(id)a3 recordId:(id)a4 extractionInfo:(id)a5
{
  v8 = (objc_class *)MEMORY[0x1E4F5DAC0];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 alloc];
  v13 = [(SGIdentityName *)self firstname];
  v14 = [(SGIdentityName *)self middlename];
  v15 = [(SGIdentityName *)self surname];
  v16 = [(SGIdentityName *)self fullName];
  v17 = [(SGIdentityName *)self prefix];
  v18 = [(SGIdentityName *)self suffix];
  v19 = (void *)[v12 initWithFirstName:v13 middleName:v14 lastName:v15 fullName:v16 prefix:v17 suffix:v18 recordId:v10 origin:v11 extractionInfo:v9];

  return v19;
}

- (SGIdentityName)initWithWesternName:(id)a3
{
  id v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)SGIdentityName;
  v5 = [(SGIdentityName *)&v45 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x1CB79B230]();
    uint64_t v7 = +[SGNames cleanName:v4];

    v43 = (void *)v7;
    v8 = +[SGNames stripAndReturnHonorifics:v7];
    id v9 = [v8 objectAtIndexedSubscript:0];
    id v10 = [v8 objectAtIndexedSubscript:2];
    if ([v9 length]) {
      objc_storeStrong((id *)&v5->_prefix, v9);
    }
    if ([v10 length]) {
      objc_storeStrong((id *)&v5->_suffix, v10);
    }
    id v11 = [v8 objectAtIndexedSubscript:1];
    id v12 = +[SGNames handleLastNameFirstOrder:v11];

    v13 = tokenizeNameAfterWhitespaceNormalization(v12);
    v14 = sgFilter();

    v15 = [(SGIdentityName *)v5 segmentWesternNameWithNameParts:v14 andPrefix:v5->_prefix];
    uint64_t v16 = [v15 objectForKeyedSubscript:@"firstname"];
    firstname = v5->_firstname;
    v5->_firstname = (NSString *)v16;

    uint64_t v18 = [v15 objectForKeyedSubscript:@"middlename"];
    middlename = v5->_middlename;
    v5->_middlename = (NSString *)v18;

    uint64_t v20 = [v15 objectForKeyedSubscript:@"surname"];
    surname = v5->_surname;
    v5->_surname = (NSString *)v20;

    context = (void *)v6;
    if ([(NSString *)v5->_firstname length] && (unint64_t)letterLength(v5->_firstname) >= 3) {
      int v22 = _PASIsAllUppercase();
    }
    else {
      int v22 = 0;
    }
    if ([(NSString *)v5->_middlename length] && (unint64_t)letterLength(v5->_middlename) >= 3) {
      int v23 = _PASIsAllUppercase();
    }
    else {
      int v23 = 0;
    }
    if ([(NSString *)v5->_surname length] && (unint64_t)letterLength(v5->_surname) >= 3)
    {
      int v24 = _PASIsAllUppercase();
      if (!v22)
      {
LABEL_20:
        if (v23)
        {
          uint64_t v29 = [(NSString *)v5->_middlename capitalizedString];
          v30 = v5->_middlename;
          v5->_middlename = (NSString *)v29;

          if (v24) {
            goto LABEL_22;
          }
        }
        else if (v24)
        {
LABEL_22:
          uint64_t v27 = [(NSString *)v5->_surname capitalizedString];
          v28 = v5->_surname;
          v5->_surname = (NSString *)v27;
          goto LABEL_30;
        }
        if (!v22 || ![(NSString *)v5->_surname length]) {
          goto LABEL_31;
        }
        v42 = v5->_firstname;
        if ([(NSString *)v5->_middlename length])
        {
          v31 = v5->_middlename;
          v32 = v5->_surname;
          v33 = v32;
        }
        else
        {
          v33 = 0;
          v32 = v5->_surname;
          v31 = v32;
        }
        v34 = v32;
        v35 = v5->_firstname;
        v5->_firstname = v31;
        v41 = v31;

        v36 = v5->_middlename;
        v5->_middlename = v33;
        v37 = v33;

        v38 = v5->_surname;
        v5->_surname = v42;
        v28 = v42;

LABEL_30:
LABEL_31:
        v39 = v5;

        id v4 = v43;
        goto LABEL_32;
      }
    }
    else
    {
      int v24 = 0;
      if (!v22) {
        goto LABEL_20;
      }
    }
    uint64_t v25 = [(NSString *)v5->_firstname capitalizedString];
    v26 = v5->_firstname;
    v5->_firstname = (NSString *)v25;

    goto LABEL_20;
  }
LABEL_32:

  return v5;
}

uint64_t __38__SGIdentityName_initWithWesternName___block_invoke(uint64_t a1, void *a2)
{
  v2 = a2;
  uint64_t v3 = self;

  if (v3)
  {
    memset(v20, 0, sizeof(v20));
    CFIndex Length = CFStringGetLength(v2);
    CFStringRef theString = v2;
    uint64_t v24 = 0;
    CFIndex v25 = Length;
    CharactersPtr = CFStringGetCharactersPtr(v2);
    CStringPtr = 0;
    int v22 = CharactersPtr;
    if (!CharactersPtr) {
      CStringPtr = CFStringGetCStringPtr(v2, 0x600u);
    }
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    int v23 = CStringPtr;
    if (Length < 1)
    {
LABEL_26:
      uint64_t v3 = 0;
    }
    else
    {
      uint64_t v7 = 0;
      uint64_t v8 = 0;
      uint64_t v9 = 0;
      uint64_t v10 = 64;
      while (1)
      {
        uint64_t v11 = (unint64_t)v9 >= 4 ? 4 : v9;
        CFIndex v12 = v25;
        if (v25 <= v9) {
          break;
        }
        if (v22)
        {
          UniChar v13 = v22[v9 + v24];
        }
        else if (v23)
        {
          UniChar v13 = v23[v24 + v9];
        }
        else
        {
          if (v27 <= v9 || v8 > v9)
          {
            uint64_t v15 = v11 + v7;
            uint64_t v16 = v10 - v11;
            uint64_t v17 = v9 - v11;
            CFIndex v18 = v17 + 64;
            if (v17 + 64 >= v25) {
              CFIndex v18 = v25;
            }
            uint64_t v26 = v17;
            uint64_t v27 = v18;
            if (v25 >= v16) {
              CFIndex v12 = v16;
            }
            v28.length = v12 + v15;
            v28.location = v17 + v24;
            CFStringGetCharacters(theString, v28, (UniChar *)v20);
            uint64_t v8 = v26;
          }
          UniChar v13 = *((_WORD *)v20 + v9 - v8);
        }
        if (v13 != 46) {
          break;
        }
        ++v9;
        --v7;
        ++v10;
        if (Length == v9) {
          goto LABEL_26;
        }
      }
      uint64_t v3 = 1;
    }
  }

  return v3;
}

- (id)segmentWesternNameWithNameParts:(id)a3 andPrefix:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = +[SGIdentityName patterns];
  uint64_t v8 = [v7 regex2ForKey:@"SurnamePrefix"];

  uint64_t v9 = [v5 count];
  uint64_t v10 = objc_opt_new();
  if ([v5 count] == 1)
  {
    uint64_t v11 = [v6 length];
    CFIndex v12 = [v5 objectAtIndexedSubscript:0];
    if (!v11)
    {
      UniChar v13 = @"firstname";
LABEL_24:
      [v10 setObject:v12 forKeyedSubscript:v13];

      goto LABEL_25;
    }
LABEL_23:
    UniChar v13 = @"surname";
    goto LABEL_24;
  }
  if ([v5 count] == 2)
  {
    v14 = (void *)MEMORY[0x1CB79B230]();
    uint64_t v15 = [v5 objectAtIndexedSubscript:0];
    uint64_t v16 = [v15 lowercaseString];

    uint64_t v17 = [v8 existsInString:v16];
    if (v17)
    {
      CFIndex v18 = (void *)v17;
      uint64_t v19 = [v6 length];

      if (v19)
      {
        id v20 = [NSString alloc];
        v21 = [v5 objectAtIndexedSubscript:0];
        int v22 = [v5 objectAtIndexedSubscript:1];
        int v23 = (void *)[v20 initWithFormat:@"%@ %@", v21, v22];
        [v10 setObject:v23 forKeyedSubscript:@"surname"];

        goto LABEL_25;
      }
    }
    else
    {
    }
    v40 = [v5 objectAtIndexedSubscript:0];
    v41 = [v5 objectAtIndexedSubscript:1];
    BOOL v42 = +[SGNames shouldInvertOrderOfFirst:v40 last:v41];

    if (v42)
    {
      v43 = [v5 objectAtIndexedSubscript:1];
      [v10 setObject:v43 forKeyedSubscript:@"firstname"];

      v44 = v5;
      uint64_t v45 = 0;
    }
    else
    {
      v46 = [v5 objectAtIndexedSubscript:0];
      [v10 setObject:v46 forKeyedSubscript:@"firstname"];

      v44 = v5;
      uint64_t v45 = 1;
    }
    CFIndex v12 = [v44 objectAtIndexedSubscript:v45];
    goto LABEL_23;
  }
  if ((unint64_t)[v5 count] < 3) {
    goto LABEL_25;
  }
  id v96 = v6;
  unint64_t v24 = v9 - 1;
  uint64_t v95 = MEMORY[0x1CB79B230]();
  v98 = v10;
  if (v9 != 1)
  {
    unint64_t v25 = 1;
    BOOL v26 = 1;
    do
    {
      int v27 = v25 - 1;
      CFRange v28 = (void *)MEMORY[0x1CB79B230]();
      uint64_t v29 = [v5 objectAtIndexedSubscript:v25 - 1];
      v30 = [v29 lowercaseString];

      v31 = [v8 existsInString:v30];

      if (!v31)
      {
        int v32 = v25 - 1;
        uint64_t v10 = v98;
        if (v27) {
          goto LABEL_14;
        }
        goto LABEL_29;
      }
      BOOL v26 = v24 > v25++;
    }
    while (v9 != v25);
    uint64_t v10 = v98;
    int v32 = v9 - 1;
    if (v9 != 1)
    {
LABEL_14:
      v33 = (void *)MEMORY[0x1CB79B230]();
      unint64_t v34 = (v32 + 1);
      v35 = objc_msgSend(v5, "subarrayWithRange:", 0, v34);
      v36 = objc_msgSend(v35, "_pas_componentsJoinedByString:", @" ");
      [v10 setObject:v36 forKeyedSubscript:@"surname"];

      if (v26)
      {
        v37 = [v5 objectAtIndexedSubscript:(v32 + 1)];
        [v10 setObject:v37 forKeyedSubscript:@"firstname"];
      }
      if (v24 > v34)
      {
        v38 = objc_msgSend(v5, "subarrayWithRange:", (v32 + 2), v24 - v34);
        v39 = objc_msgSend(v38, "_pas_componentsJoinedByString:", @" ");
        [v10 setObject:v39 forKeyedSubscript:@"middlename"];
      }
      goto LABEL_78;
    }
  }
LABEL_29:
  v48 = [v5 objectAtIndexedSubscript:0];
  [v10 setObject:v48 forKeyedSubscript:@"firstname"];

  v49 = [v5 objectAtIndexedSubscript:0];
  if ((isCapitalized(v49) & 1) == 0)
  {

    goto LABEL_69;
  }
  v50 = [v5 objectAtIndexedSubscript:v9 - 1];
  int v51 = isCapitalized(v50);

  if (!v51) {
    goto LABEL_69;
  }
  context = (void *)MEMORY[0x1CB79B230]();
  if (v24 < 2)
  {
LABEL_67:
    v73 = objc_msgSend(v5, "subarrayWithRange:", 1, objc_msgSend(v5, "count") - 1);
    v74 = objc_msgSend(v73, "_pas_componentsJoinedByString:", @" ");
    [v10 setObject:v74 forKeyedSubscript:@"surname"];

    v75 = context;
    goto LABEL_79;
  }
  uint64_t v52 = 1;
  while (1)
  {
    id v53 = [v5 objectAtIndexedSubscript:v52];
    CFCharacterSetRef theSet = CFCharacterSetGetPredefined(kCFCharacterSetUppercaseLetter);
    CFCharacterSetRef Predefined = CFCharacterSetGetPredefined(kCFCharacterSetLowercaseLetter);
    v54 = (__CFString *)v53;
    v55 = self;

    if (!v55) {
      goto LABEL_82;
    }
    long long v106 = 0u;
    long long v107 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    *(_OWORD *)buffer = 0u;
    long long v101 = 0u;
    CFIndex Length = CFStringGetLength(v54);
    CFStringRef theString = v54;
    uint64_t v111 = 0;
    CFIndex v112 = Length;
    CharactersPtr = CFStringGetCharactersPtr(v54);
    CStringPtr = 0;
    v109 = CharactersPtr;
    if (!CharactersPtr) {
      CStringPtr = CFStringGetCStringPtr(v54, 0x600u);
    }
    v110 = CStringPtr;
    int64_t v113 = 0;
    int64_t v114 = 0;
    uint64_t v93 = v52;
    v94 = v54;
    if (Length >= 1) {
      break;
    }
    char v61 = 0;
LABEL_65:

    uint64_t v10 = v98;
    if ((v61 & 1) == 0) {
      goto LABEL_83;
    }
    uint64_t v52 = v93 + 1;
    if (v93 + 1 == v24) {
      goto LABEL_67;
    }
  }
  uint64_t v59 = 0;
  int64_t v60 = 0;
  char v61 = 0;
  uint64_t v62 = 64;
  while (1)
  {
    if ((unint64_t)v60 >= 4) {
      uint64_t v63 = 4;
    }
    else {
      uint64_t v63 = v60;
    }
    CFIndex v64 = v112;
    if (v112 <= v60)
    {
      UniChar v65 = 0;
    }
    else if (v109)
    {
      UniChar v65 = v109[v60 + v111];
    }
    else if (v110)
    {
      UniChar v65 = v110[v111 + v60];
    }
    else
    {
      int64_t v67 = v113;
      if (v114 <= v60 || v113 > v60)
      {
        uint64_t v69 = v63 + v59;
        uint64_t v70 = v62 - v63;
        int64_t v71 = v60 - v63;
        CFIndex v72 = v71 + 64;
        if (v71 + 64 >= v112) {
          CFIndex v72 = v112;
        }
        int64_t v113 = v71;
        int64_t v114 = v72;
        if (v112 >= v70) {
          CFIndex v64 = v70;
        }
        v116.length = v64 + v69;
        v116.location = v71 + v111;
        CFStringGetCharacters(theString, v116, buffer);
        int64_t v67 = v113;
      }
      UniChar v65 = buffer[v60 - v67];
    }
    int IsCharacterMember = CFCharacterSetIsCharacterMember(theSet, v65);
    if (!IsCharacterMember && (v61 & 1) == 0)
    {
      if (CFCharacterSetIsCharacterMember(Predefined, v65)) {
        char v61 = 1;
      }
      goto LABEL_50;
    }
    if (IsCharacterMember) {
      break;
    }
LABEL_50:
    ++v60;
    --v59;
    ++v62;
    if (Length == v60) {
      goto LABEL_65;
    }
  }
  v54 = v94;
LABEL_82:

LABEL_83:
LABEL_69:
  if (v24 < 2)
  {
LABEL_73:
    v82 = [v5 objectAtIndexedSubscript:v9 - 1];
    uint64_t v10 = v98;
    [v98 setObject:v82 forKeyedSubscript:@"surname"];

    v83 = objc_msgSend(v5, "subarrayWithRange:", 1, objc_msgSend(v5, "count") - 2);
    v84 = objc_msgSend(v83, "_pas_componentsJoinedByString:", @" ");
    [v98 setObject:v84 forKeyedSubscript:@"middlename"];

    v85 = [v98 objectForKeyedSubscript:@"middlename"];
    LODWORD(v84) = [v85 isEqualToString:&stru_1F24EEF20];

    v86 = (void *)v95;
    id v6 = v96;
    if (v84) {
      [v98 removeObjectForKey:@"middlename"];
    }
  }
  else
  {
    uint64_t v76 = 2;
    while (1)
    {
      uint64_t v77 = v76 - 1;
      v33 = (void *)MEMORY[0x1CB79B230]();
      v78 = (void *)MEMORY[0x1CB79B230]();
      v79 = [v5 objectAtIndexedSubscript:v76 - 1];
      v80 = [v79 lowercaseString];

      v81 = [v8 existsInString:v80];

      if (v81) {
        break;
      }
      if (v9 == ++v76) {
        goto LABEL_73;
      }
    }
    v87 = objc_msgSend(v5, "subarrayWithRange:", v76 - 1, objc_msgSend(v5, "count") - v77);
    v88 = objc_msgSend(v87, "_pas_componentsJoinedByString:", @" ");
    uint64_t v10 = v98;
    [v98 setObject:v88 forKeyedSubscript:@"surname"];

    if ((v77 & 0xFFFFFFFE) != 0)
    {
      v89 = objc_msgSend(v5, "subarrayWithRange:", 1, (v77 - 1));
      v90 = objc_msgSend(v89, "_pas_componentsJoinedByString:", @" ");
      [v98 setObject:v90 forKeyedSubscript:@"middlename"];

      v91 = [v98 objectForKeyedSubscript:@"middlename"];
      LODWORD(v90) = [v91 isEqualToString:&stru_1F24EEF20];

      if (v90) {
        [v98 removeObjectForKey:@"middlename"];
      }
    }
LABEL_78:
    v75 = v33;
LABEL_79:
    v86 = (void *)v95;
    id v6 = v96;
  }
LABEL_25:

  return v10;
}

- (SGIdentityName)initWithSpanishName:(id)a3
{
  id v4 = a3;
  v64.receiver = self;
  v64.super_class = (Class)SGIdentityName;
  id v5 = [(SGIdentityName *)&v64 init];
  if (!v5)
  {
    uint64_t v8 = v4;
    goto LABEL_39;
  }
  id v6 = +[SGIdentityName patterns];
  uint64_t v7 = [v6 regex2ForKey:@"CommonSpanishSurnamePrefix"];

  uint64_t v8 = +[SGNames cleanName:v4];

  uint64_t v9 = +[SGNames stripAndReturnHonorifics:v8];
  uint64_t v10 = [v9 objectAtIndexedSubscript:0];
  uint64_t v11 = [v9 objectAtIndexedSubscript:2];
  if ([v10 length]) {
    objc_storeStrong((id *)&v5->_prefix, v10);
  }
  if ([v11 length]) {
    objc_storeStrong((id *)&v5->_suffix, v11);
  }
  CFIndex v12 = [v9 objectAtIndexedSubscript:1];
  UniChar v13 = +[SGNames handleLastNameFirstOrder:v12];
  v14 = tokenizeNameAfterWhitespaceNormalization(v13);

  uint64_t v15 = +[SGIdentityName patterns];
  uint64_t v16 = [v15 regex2ForKey:@"CompositeSpanishFirstname"];
  uint64_t v17 = [v16 matchesString:v8];

  if ((unint64_t)[v14 count] > 2 || v17 || objc_msgSend(v10, "length"))
  {
    if ((unint64_t)[v14 count] > 2 || v17)
    {
      if (!v17)
      {
        uint64_t v37 = [v14 count];
        CFIndex v18 = (void *)MEMORY[0x1CB79B230]();
        if (v37 == 4)
        {
          v38 = [v14 objectAtIndexedSubscript:1];
          v39 = [v7 matchesString:v38];

          if (v39) {
            uint64_t v40 = 1;
          }
          else {
            uint64_t v40 = 2;
          }
          v41 = objc_msgSend(v14, "subarrayWithRange:", 0, v40);
          uint64_t v42 = objc_msgSend(v41, "_pas_componentsJoinedByString:", @" ");
          firstname = v5->_firstname;
          v5->_firstname = (NSString *)v42;

          middlename = v5->_middlename;
          v5->_middlename = 0;

          uint64_t v45 = [v14 count] - v40;
          v46 = v14;
          uint64_t v47 = v40;
        }
        else
        {
          uint64_t v48 = [v14 objectAtIndexedSubscript:0];
          v49 = v5->_firstname;
          v5->_firstname = (NSString *)v48;

          v50 = v5->_middlename;
          v5->_middlename = 0;

          uint64_t v45 = [v14 count] - 1;
          v46 = v14;
          uint64_t v47 = 1;
        }
        int v51 = objc_msgSend(v46, "subarrayWithRange:", v47, v45);
        uint64_t v52 = objc_msgSend(v51, "_pas_componentsJoinedByString:", @" ");
        surname = v5->_surname;
        v5->_surname = (NSString *)v52;

        goto LABEL_25;
      }
      CFIndex v18 = (void *)MEMORY[0x1CB79B230]();
      int v23 = objc_msgSend(v14, "subarrayWithRange:", 0, 2);
      uint64_t v24 = objc_msgSend(v23, "_pas_componentsJoinedByString:", @" ");
      unint64_t v25 = v5->_firstname;
      v5->_firstname = (NSString *)v24;

      BOOL v26 = v5->_middlename;
      v5->_middlename = 0;

      int v27 = objc_msgSend(v14, "subarrayWithRange:", 2, objc_msgSend(v14, "count") - 2);
      uint64_t v28 = objc_msgSend(v27, "_pas_componentsJoinedByString:", @" ");
      uint64_t v29 = v5->_surname;
      v5->_surname = (NSString *)v28;

      if (![(NSString *)v5->_surname isEqualToString:&stru_1F24EEF20])
      {
LABEL_25:
        goto LABEL_26;
      }
      int v22 = v5->_surname;
      v5->_surname = 0;
    }
    else
    {
      CFIndex v18 = (void *)MEMORY[0x1CB79B230]();
      uint64_t v19 = v5->_middlename;
      v5->_middlename = 0;

      id v20 = v5->_firstname;
      v5->_firstname = 0;

      uint64_t v21 = objc_msgSend(v14, "_pas_componentsJoinedByString:", @" ");
      int v22 = v5->_surname;
      v5->_surname = (NSString *)v21;
    }

    goto LABEL_25;
  }
  v30 = [(SGIdentityName *)v5 segmentWesternNameWithNameParts:v14 andPrefix:v5->_prefix];
  uint64_t v31 = [v30 objectForKeyedSubscript:@"firstname"];
  int v32 = v5->_firstname;
  v5->_firstname = (NSString *)v31;

  uint64_t v33 = [v30 objectForKeyedSubscript:@"middlename"];
  unint64_t v34 = v5->_middlename;
  v5->_middlename = (NSString *)v33;

  uint64_t v35 = [v30 objectForKeyedSubscript:@"surname"];
  v36 = v5->_surname;
  v5->_surname = (NSString *)v35;

LABEL_26:
  if ([(NSString *)v5->_firstname length] && (unint64_t)letterLength(v5->_firstname) >= 3) {
    int v54 = _PASIsAllUppercase();
  }
  else {
    int v54 = 0;
  }
  if ([(NSString *)v5->_surname length] && (unint64_t)letterLength(v5->_surname) >= 3)
  {
    int v55 = _PASIsAllUppercase();
    if (!v54) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
  int v55 = 0;
  if (v54)
  {
LABEL_35:
    v56 = (void *)MEMORY[0x1CB79B230]();
    uint64_t v57 = [(NSString *)v5->_firstname capitalizedString];
    v58 = v5->_firstname;
    v5->_firstname = (NSString *)v57;
  }
LABEL_36:
  if (v55)
  {
    uint64_t v59 = (void *)MEMORY[0x1CB79B230]();
    uint64_t v60 = [(NSString *)v5->_surname capitalizedString];
    char v61 = v5->_surname;
    v5->_surname = (NSString *)v60;
  }
  uint64_t v62 = v5;

LABEL_39:
  return v5;
}

- (SGIdentityName)initWithVietnameseName:(id)a3
{
  v47[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)SGIdentityName;
  id v5 = [(SGIdentityName *)&v46 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1CB79B230]();
    uint64_t v7 = [v4 componentsSeparatedByString:@","];
    if ([v7 count] == 2)
    {
      uint64_t v8 = (void *)MEMORY[0x1CB79B230]();
      uint64_t v9 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
      uint64_t v10 = [v7 objectAtIndexedSubscript:0];
      uint64_t v11 = [v10 stringByTrimmingCharactersInSet:v9];

      CFIndex v12 = [v7 objectAtIndexedSubscript:1];
      UniChar v13 = [v12 stringByTrimmingCharactersInSet:v9];

      v47[0] = v13;
      v47[1] = v11;
      v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:2];
      uint64_t v15 = objc_msgSend(v14, "_pas_componentsJoinedByString:", @" ");

      id v4 = (id)v15;
    }
    uint64_t v16 = +[SGNames cleanName:v4];
    uint64_t v17 = +[SGNames stripAndReturnHonorifics:v16];

    CFIndex v18 = [v17 objectAtIndexedSubscript:0];
    uint64_t v19 = [v17 objectAtIndexedSubscript:2];
    if ([v18 length]) {
      objc_storeStrong((id *)&v5->_prefix, v18);
    }
    if ([v19 length]) {
      objc_storeStrong((id *)&v5->_suffix, v19);
    }
    id v20 = [v17 objectAtIndexedSubscript:1];
    uint64_t v21 = +[SGNames handleLastNameFirstOrder:v20];
    int v22 = tokenizeNameAfterWhitespaceNormalization(v21);

    if ([v22 count] == 1)
    {
      int v23 = v22;
      uint64_t v24 = 0;
    }
    else
    {
      if ([v22 count] != 2)
      {
        if ((unint64_t)[v22 count] >= 3)
        {
          v38 = (void *)MEMORY[0x1CB79B230]();
          uint64_t v39 = [v22 objectAtIndexedSubscript:0];
          surname = v5->_surname;
          v5->_surname = (NSString *)v39;

          uint64_t v41 = [v22 objectAtIndexedSubscript:1];
          middlename = v5->_middlename;
          v5->_middlename = (NSString *)v41;

          v43 = objc_msgSend(v22, "subarrayWithRange:", 2, objc_msgSend(v22, "count") - 2);
          uint64_t v44 = objc_msgSend(v43, "_pas_componentsJoinedByString:", @" ");
          firstname = v5->_firstname;
          v5->_firstname = (NSString *)v44;
        }
        goto LABEL_13;
      }
      uint64_t v25 = [v22 objectAtIndexedSubscript:0];
      BOOL v26 = v5->_surname;
      v5->_surname = (NSString *)v25;

      int v23 = v22;
      uint64_t v24 = 1;
    }
    uint64_t v27 = [v23 objectAtIndexedSubscript:v24];
    uint64_t v28 = v5->_firstname;
    v5->_firstname = (NSString *)v27;

LABEL_13:
    uint64_t v29 = (void *)MEMORY[0x1CB79B230]();
    uint64_t v30 = [(NSString *)v5->_firstname capitalizedString];
    uint64_t v31 = v5->_firstname;
    v5->_firstname = (NSString *)v30;

    uint64_t v32 = [(NSString *)v5->_middlename capitalizedString];
    uint64_t v33 = v5->_middlename;
    v5->_middlename = (NSString *)v32;

    uint64_t v34 = [(NSString *)v5->_surname capitalizedString];
    uint64_t v35 = v5->_surname;
    v5->_surname = (NSString *)v34;

    v36 = v5;
  }
  return v5;
}

- (SGIdentityName)initWithChineseName:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)SGIdentityName;
  id v5 = [(SGIdentityName *)&v38 init];
  if (v5)
  {
    id v6 = +[SGNames cjkSpacersToWhiteSpace:v4];

    _PASCollapseWhitespaceAndStrip();
    id v4 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v7 = tokenizeNameAfterWhitespaceNormalization(v4);
    if ([v7 count] == 2 || (unint64_t)objc_msgSend(v7, "count") >= 3)
    {
      uint64_t v8 = [v7 objectAtIndexedSubscript:1];
      firstname = v5->_firstname;
      v5->_firstname = (NSString *)v8;

      uint64_t v10 = [v7 objectAtIndexedSubscript:0];
      surname = v5->_surname;
      v5->_surname = (NSString *)v10;
    }
    else if ([v7 count])
    {
      if (initWithChineseName__onceToken != -1) {
        dispatch_once(&initWithChineseName__onceToken, &__block_literal_global_81_30180);
      }
      v14 = (void *)MEMORY[0x1CB79B230]();
      switch([v4 length])
      {
        case 2:
          uint64_t v15 = (void *)initWithChineseName__oneCharChineseSurnames;
          uint64_t v16 = [v4 substringToIndex:1];
          LODWORD(v15) = fixedWidthStringSetContains(v15, 1, v16);

          if (!v15) {
            goto LABEL_16;
          }
          uint64_t v17 = [v4 substringToIndex:1];
          CFIndex v18 = v5->_surname;
          v5->_surname = (NSString *)v17;

          uint64_t v19 = [v4 substringFromIndex:1];
          goto LABEL_17;
        case 3:
          uint64_t v21 = [v4 substringToIndex:2];
          int v22 = (void *)initWithChineseName__twoCharChineseSurnames;
          int v23 = _PASSimpleICUTransform();
          LODWORD(v22) = fixedWidthStringSetContains(v22, 2, v23);

          if (v22) {
            goto LABEL_22;
          }
          uint64_t v24 = (void *)initWithChineseName__oneCharChineseSurnames;
          uint64_t v25 = [v4 substringToIndex:1];
          BOOL v26 = _PASSimpleICUTransform();
          LODWORD(v24) = fixedWidthStringSetContains(v24, 1, v26);

          if (!v24) {
            goto LABEL_24;
          }
          uint64_t v27 = [v4 substringToIndex:1];
          uint64_t v28 = v5->_surname;
          v5->_surname = (NSString *)v27;

          uint64_t v29 = v4;
          uint64_t v30 = 1;
          goto LABEL_23;
        case 4:
          uint64_t v21 = [v4 substringToIndex:2];
          uint64_t v31 = (void *)initWithChineseName__twoCharChineseSurnames;
          uint64_t v32 = _PASSimpleICUTransform();
          LODWORD(v31) = fixedWidthStringSetContains(v31, 2, v32);

          if (v31)
          {
LABEL_22:
            uint64_t v33 = [v4 substringToIndex:2];
            uint64_t v34 = v5->_surname;
            v5->_surname = (NSString *)v33;

            uint64_t v29 = v4;
            uint64_t v30 = 2;
LABEL_23:
            uint64_t v35 = [v29 substringFromIndex:v30];
            v36 = v5->_firstname;
            v5->_firstname = (NSString *)v35;
          }
          else
          {
LABEL_24:
            objc_storeStrong((id *)&v5->_firstname, v4);
          }
LABEL_25:

          break;
        default:
LABEL_16:
          uint64_t v19 = (NSString *)v4;
LABEL_17:
          uint64_t v21 = v5->_firstname;
          v5->_firstname = v19;
          goto LABEL_25;
      }
    }
    else
    {
      id v20 = sgLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v37 = 0;
        _os_log_impl(&dword_1CA650000, v20, OS_LOG_TYPE_DEFAULT, "Tried to parse a jp/zh name with no tokens? This shouldn't happen.", v37, 2u);
      }
    }
    CFIndex v12 = v5;
  }
  return v5;
}

void __38__SGIdentityName_initWithChineseName___block_invoke()
{
  id v4 = +[SGIdentityName patterns];
  uint64_t v0 = [v4 rawValueOrDataForKey:@"SingleCharChineseSurname"];
  v1 = (void *)initWithChineseName__oneCharChineseSurnames;
  initWithChineseName__oneCharChineseSurnames = v0;

  uint64_t v2 = [v4 rawValueOrDataForKey:@"MultiCharChineseSurname"];
  uint64_t v3 = (void *)initWithChineseName__twoCharChineseSurnames;
  initWithChineseName__twoCharChineseSurnames = v2;
}

- (SGIdentityName)initWithJapaneseName:(id)a3
{
  id v5 = a3;
  v84.receiver = self;
  v84.super_class = (Class)SGIdentityName;
  id v6 = [(SGIdentityName *)&v84 init];
  if (v6)
  {
    uint64_t v7 = +[SGNames cjkSpacersToWhiteSpace:v5];

    _PASCollapseWhitespaceAndStrip();
    id v5 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v8 = tokenizeNameAfterWhitespaceNormalization(v5);
    if ([v8 count] == 2)
    {
      uint64_t v9 = (void *)MEMORY[0x1CB79B230]();
      uint64_t v10 = [v8 objectAtIndexedSubscript:1];
      firstname = v6->_firstname;
      v6->_firstname = (NSString *)v10;

      uint64_t v12 = [v8 objectAtIndexedSubscript:0];
      surname = v6->_surname;
      v6->_surname = (NSString *)v12;

      uint64_t v14 = [(NSString *)v6->_surname stringByAppendingString:v6->_firstname];
      privFullName = v6->_privFullName;
      v6->_privFullName = (NSString *)v14;

      uint64_t v16 = v6;
LABEL_50:

      goto LABEL_51;
    }
    if ((unint64_t)[v8 count] >= 3)
    {
      objc_storeStrong((id *)&v6->_surname, v5);
LABEL_14:
      int v23 = v6;
      goto LABEL_50;
    }
    if (![v8 count])
    {
      int v22 = sgLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA650000, v22, OS_LOG_TYPE_DEFAULT, "Tried to parse a Japanese name with no tokens? This shouldn't happen.", buf, 2u);
      }

      goto LABEL_14;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__SGIdentityName_initWithJapaneseName___block_invoke;
    block[3] = &unk_1E65BF9C0;
    SEL v83 = a2;
    uint64_t v17 = v6;
    v82 = v17;
    if (initWithJapaneseName__onceToken != -1) {
      dispatch_once(&initWithJapaneseName__onceToken, block);
    }
    pthread_mutex_lock(&initWithJapaneseName__updateLock);
    CFIndex v18 = objc_opt_new();
    v73 = (void *)[objc_alloc(MEMORY[0x1E4F28F28]) initWithDominantScript:@"Jpan" languageMap:&unk_1F2537750];
    *(void *)buf = 0;
    v78 = buf;
    uint64_t v79 = 0x2020000000;
    char v80 = 0;
    uint64_t v19 = [v5 length];
    uint64_t v20 = *MEMORY[0x1E4F28510];
    v74[0] = MEMORY[0x1E4F143A8];
    v74[1] = 3221225472;
    v74[2] = __39__SGIdentityName_initWithJapaneseName___block_invoke_3;
    v74[3] = &unk_1E65BB768;
    id v21 = v18;
    id v75 = v21;
    uint64_t v76 = buf;
    objc_msgSend(v5, "enumerateLinguisticTagsInRange:scheme:options:orthography:usingBlock:", 0, v19, v20, 6, v73, v74);
    if (v78[24] || ![v21 count])
    {
      objc_storeStrong((id *)&v17->_surname, v5);
LABEL_46:
      if ([(NSString *)v17->_surname length] && [(NSString *)v17->_firstname length])
      {
        v66 = (void *)MEMORY[0x1CB79B230]();
        uint64_t v67 = [(NSString *)v17->_surname stringByAppendingString:v17->_firstname];
        v68 = v17->_privFullName;
        v17->_privFullName = (NSString *)v67;
      }
      pthread_mutex_unlock(&initWithJapaneseName__updateLock);
      uint64_t v69 = v17;

      _Block_object_dispose(buf, 8);
      goto LABEL_50;
    }
    if ([v21 count] == 1)
    {
      context = (void *)MEMORY[0x1CB79B230]();
      uint64_t v24 = [v21 objectAtIndexedSubscript:0];
      uint64_t v25 = [v24 rangeValue];
      uint64_t v27 = objc_msgSend(v5, "substringWithRange:", v25, v26);
      uint64_t v28 = v17->_surname;
      v17->_surname = (NSString *)v27;

      goto LABEL_44;
    }
    uint64_t v29 = [v21 count];
    if ((unint64_t)(v29 - 1) >= 5) {
      unint64_t v30 = 5;
    }
    else {
      unint64_t v30 = v29 - 1;
    }
    while (1)
    {
      uint64_t v31 = [v21 objectAtIndexedSubscript:v30];
      NSUInteger v32 = [v31 rangeValue];
      NSUInteger v34 = v33;

      uint64_t v35 = [v21 objectAtIndexedSubscript:0];
      v85.location = [v35 rangeValue];
      v88.location = v32;
      v88.NSUInteger length = v34;
      NSRange v36 = NSUnionRange(v85, v88);
      NSUInteger length = v36.length;

      if (objc_msgSend((id)initWithJapaneseName__trie, "payloadForString:range:", v5, v36.location, v36.length))break; {
      if ((uint64_t)v30-- <= 0)
      }
        goto LABEL_30;
    }
    if (v36.location == 0x7FFFFFFFFFFFFFFFLL || v36.length != 1)
    {
      if (v36.location != 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_35;
      }
    }
    else if ((unint64_t)[v21 count] <= 2)
    {
      NSUInteger length = 1;
LABEL_35:
      context = (void *)MEMORY[0x1CB79B230]();
      uint64_t v55 = objc_msgSend(v5, "substringWithRange:", v36.location, length);
      v56 = v17->_surname;
      v17->_surname = (NSString *)v55;

      if (v30 >= [v21 count] - 1) {
        goto LABEL_45;
      }
      uint64_t v24 = [v21 objectAtIndexedSubscript:v30 + 1];
      NSUInteger v57 = [v24 rangeValue];
      NSUInteger v59 = v58;
      v50 = [v21 lastObject];
      v90.location = [v50 rangeValue];
      v90.NSUInteger length = v60;
      v87.location = v57;
      v87.NSUInteger length = v59;
      NSRange v61 = NSUnionRange(v87, v90);
      uint64_t v62 = objc_msgSend(v5, "substringWithRange:", v61.location, v61.length);
      int v54 = v17->_firstname;
      v17->_firstname = (NSString *)v62;
      goto LABEL_37;
    }
LABEL_30:
    context = (void *)MEMORY[0x1CB79B230]();
    if ([v21 count] != 2)
    {
      uint64_t v24 = [v21 objectAtIndexedSubscript:0];
      NSUInteger v47 = [v24 rangeValue];
      NSUInteger v49 = v48;
      v50 = [v21 lastObject];
      v89.location = [v50 rangeValue];
      v89.NSUInteger length = v51;
      v86.location = v47;
      v86.NSUInteger length = v49;
      NSRange v52 = NSUnionRange(v86, v89);
      uint64_t v53 = objc_msgSend(v5, "substringWithRange:", v52.location, v52.length);
      int v54 = v17->_surname;
      v17->_surname = (NSString *)v53;
LABEL_37:

      goto LABEL_44;
    }
    uint64_t v39 = [v21 objectAtIndexedSubscript:0];
    uint64_t v40 = [v39 rangeValue];
    uint64_t v42 = v41;

    v43 = [v21 objectAtIndexedSubscript:1];
    uint64_t v44 = [v43 rangeValue];
    uint64_t v71 = v45;
    uint64_t v46 = v44;

    if (v42 == 3)
    {
      if (v40 + 3 != v46)
      {
        uint64_t v42 = 3;
LABEL_43:
        uint64_t v63 = objc_msgSend(v5, "substringWithRange:", v40, v42);
        objc_super v64 = v17->_surname;
        v17->_surname = (NSString *)v63;

        uint64_t v65 = objc_msgSend(v5, "substringWithRange:", v46, v71);
        uint64_t v24 = v17->_firstname;
        v17->_firstname = (NSString *)v65;
LABEL_44:

LABEL_45:
        goto LABEL_46;
      }
    }
    else if (v42 != 2 || v71 != 1 || v40 + 2 != v46)
    {
      goto LABEL_43;
    }
    if (objc_msgSend((id)initWithJapaneseName__trie, "payloadForString:range:", v5, v40, v42 - 1))
    {
      --v46;
      ++v71;
      --v42;
    }
    goto LABEL_43;
  }
LABEL_51:

  return v6;
}

void __39__SGIdentityName_initWithJapaneseName___block_invoke(uint64_t a1)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__SGIdentityName_initWithJapaneseName___block_invoke_2;
  v7[3] = &unk_1E65BB740;
  long long v6 = *(_OWORD *)(a1 + 32);
  id v1 = (id)v6;
  long long v8 = v6;
  uint64_t v2 = (void (**)(void, void))MEMORY[0x1CB79B4C0](v7);
  uint64_t v3 = +[SGAsset asset];
  id v4 = (id)[v3 registerUpdateHandler:v2];

  id v5 = +[SGAsset asset];
  ((void (**)(void, void *))v2)[2](v2, v5);
}

void __39__SGIdentityName_initWithJapaneseName___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  id v14 = a2;
  if ([v14 isEqualToString:@"ja"])
  {
    uint64_t v11 = (void *)MEMORY[0x1CB79B230]();
    uint64_t v12 = *(void **)(a1 + 32);
    UniChar v13 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", a3, a4);
    [v12 addObject:v13];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a7 = 1;
  }
}

void __39__SGIdentityName_initWithJapaneseName___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  pthread_mutex_lock(&initWithJapaneseName__updateLock);
  id v9 = [v3 filesystemPathForAssetDataRelativePath:@"ja_surname.trie"];

  if (!v9)
  {
    long long v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"SGIdentityName.m" lineNumber:311 description:@"failed to get asset path for ja_surname.trie"];
  }
  uint64_t v4 = [objc_alloc(MEMORY[0x1E4F93AC8]) initWithPath:v9];
  id v5 = (void *)initWithJapaneseName__trie;
  initWithJapaneseName__trie = v4;

  if (!initWithJapaneseName__trie)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v8 = [NSString stringWithUTF8String:"-[SGIdentityName initWithJapaneseName:]_block_invoke_2"];
    [v7 handleFailureInFunction:v8 file:@"SGIdentityName.m" lineNumber:313 description:@"Could not load ja_surname trie"];
  }
  pthread_mutex_unlock(&initWithJapaneseName__updateLock);
}

- (SGIdentityName)initWithKoreanName:(id)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v65.receiver = self;
  v65.super_class = (Class)SGIdentityName;
  long long v6 = [(SGIdentityName *)&v65 init];
  if (v6)
  {
    uint64_t v7 = +[SGNames cjkSpacersToWhiteSpace:v5];

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__SGIdentityName_initWithKoreanName___block_invoke;
    block[3] = &unk_1E65BF9C0;
    long long v8 = v6;
    uint64_t v63 = v8;
    SEL v64 = a2;
    if (initWithKoreanName__once != -1) {
      dispatch_once(&initWithKoreanName__once, block);
    }
    id v9 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    uint64_t v10 = (void *)MEMORY[0x1CB79B230]();
    uint64_t v11 = [v7 componentsSeparatedByCharactersInSet:v9];
    if ((unint64_t)[v11 count] >= 2)
    {
      NSUInteger v48 = v9;
      NSUInteger v49 = v7;
      v50 = v6;
      NSUInteger v51 = v8;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      NSUInteger v47 = v11;
      id v12 = v11;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v58 objects:v67 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v59;
        uint64_t v16 = v8 + 2;
        location = v8 + 3;
        p_cb = &OBJC_PROTOCOL___HVConsumer.cb;
        do
        {
          uint64_t v18 = 0;
          uint64_t v53 = v14;
          do
          {
            if (*(void *)v59 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v19 = *(void **)(*((void *)&v58 + 1) + 8 * v18);
            if ([*((id *)p_cb + 501) containsObject:v19])
            {
              objc_storeStrong(v16, v19);
              objc_storeStrong(location, v19);
              long long v56 = 0u;
              long long v57 = 0u;
              long long v54 = 0u;
              long long v55 = 0u;
              id v20 = v12;
              id v21 = v12;
              uint64_t v22 = [v21 countByEnumeratingWithState:&v54 objects:v66 count:16];
              if (v22)
              {
                uint64_t v23 = v22;
                uint64_t v24 = *(void *)v55;
                do
                {
                  for (uint64_t i = 0; i != v23; ++i)
                  {
                    if (*(void *)v55 != v24) {
                      objc_enumerationMutation(v21);
                    }
                    uint64_t v26 = *(void **)(*((void *)&v54 + 1) + 8 * i);
                    if (([v19 isEqualToString:v26] & 1) == 0) {
                      objc_storeStrong(v16, v26);
                    }
                  }
                  uint64_t v23 = [v21 countByEnumeratingWithState:&v54 objects:v66 count:16];
                }
                while (v23);
              }

              id v12 = v20;
              uint64_t v14 = v53;
              p_cb = (_DWORD *)(&OBJC_PROTOCOL___HVConsumer + 64);
            }
            ++v18;
          }
          while (v18 != v14);
          uint64_t v14 = [v12 countByEnumeratingWithState:&v58 objects:v67 count:16];
        }
        while (v14);
      }

      long long v8 = v51;
      if (![v51[3] length])
      {
        uint64_t v27 = [v12 objectAtIndexedSubscript:0];
        id v28 = v51[3];
        v51[3] = (id)v27;

        uint64_t v29 = objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v12, "count") - 1);
        id v30 = v51[2];
        v51[2] = (id)v29;
      }
      uint64_t v31 = 0;
      uint64_t v7 = v49;
      long long v6 = v50;
      uint64_t v11 = v47;
      id v9 = v48;
      goto LABEL_43;
    }
    if ((unint64_t)[v7 length] < 2)
    {
      uint64_t v35 = 0;
    }
    else
    {
      NSUInteger v32 = (void *)MEMORY[0x1CB79B230]();
      uint64_t v31 = [v7 substringToIndex:2];
      if ([(id)initWithKoreanName__koreanSurnames containsObject:v31])
      {
        objc_storeStrong(v8 + 3, v31);
        if ([v7 length] != 2)
        {
          NSUInteger v33 = v7;
          uint64_t v34 = 2;
LABEL_41:
          uint64_t v37 = [v33 substringFromIndex:v34];
          id v36 = v8[2];
          v8[2] = (id)v37;
          goto LABEL_42;
        }
        goto LABEL_36;
      }
      uint64_t v35 = v31;
    }
    if ([v7 length])
    {
      NSUInteger v32 = (void *)MEMORY[0x1CB79B230]();
      uint64_t v31 = [v7 substringToIndex:1];

      if ([(id)initWithKoreanName__koreanSurnames containsObject:v31])
      {
        objc_storeStrong(v8 + 3, v31);
        if ([v7 length] != 1)
        {
          NSUInteger v33 = v7;
          uint64_t v34 = 1;
          goto LABEL_41;
        }
LABEL_36:
        id v36 = v8[2];
        v8[2] = 0;
LABEL_42:

        goto LABEL_43;
      }
    }
    else
    {
      uint64_t v31 = v35;
    }
    objc_storeStrong(v8 + 2, v7);
LABEL_43:
    objc_super v38 = (void *)MEMORY[0x1CB79B230]();
    uint64_t v39 = [v8[2] stringByTrimmingCharactersInSet:v9];
    id v40 = v8[2];
    v8[2] = (id)v39;

    uint64_t v41 = [v8[4] stringByTrimmingCharactersInSet:v9];
    id v42 = v8[4];
    v8[4] = (id)v41;

    uint64_t v43 = [v8[3] stringByTrimmingCharactersInSet:v9];
    id v44 = v8[3];
    v8[3] = (id)v43;

    uint64_t v45 = v8;

    goto LABEL_44;
  }
  uint64_t v7 = v5;
LABEL_44:

  return v6;
}

void __37__SGIdentityName_initWithKoreanName___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1CB79B230]();
  id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 pathForResource:@"koreansurnames" ofType:@"txt"];

  if (!v4)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"SGIdentityName.m" lineNumber:213 description:@"Could not generate file path from koreansurnames.txt"];
  }
  id v14 = 0;
  id v5 = [NSString stringWithContentsOfFile:v4 encoding:4 error:&v14];
  id v6 = v14;
  if (!v5)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"SGIdentityName.m" lineNumber:213 description:@"Could not load list of korean surnames from koreansurnames.txt"];
  }
  uint64_t v7 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  long long v8 = [v5 componentsSeparatedByCharactersInSet:v7];

  if (!v8)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"SGIdentityName.m" lineNumber:213 description:@"Could not load components separated by new line."];
  }
  uint64_t v9 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v8];
  uint64_t v10 = (void *)initWithKoreanName__koreanSurnames;
  initWithKoreanName__koreanSurnames = v9;
}

- (SGIdentityName)initWithString:(id)a3
{
  uint64_t v4 = self;
  id v5 = (void *)MEMORY[0x1CB79B230](self, a2);
  id v6 = +[SGNames universalCleanName:a3];
  switch(SGGuessNamingTradition(v6))
  {
    case 0u:
      uint64_t v7 = [(SGIdentityName *)v4 initWithKoreanName:v6];
      goto LABEL_8;
    case 1u:
      uint64_t v7 = [(SGIdentityName *)v4 initWithChineseName:v6];
      goto LABEL_8;
    case 2u:
      uint64_t v7 = [(SGIdentityName *)v4 initWithJapaneseName:v6];
      goto LABEL_8;
    case 3u:
      uint64_t v7 = [(SGIdentityName *)v4 initWithVietnameseName:v6];
      goto LABEL_8;
    case 4u:
    case 5u:
    case 6u:
    case 8u:
      uint64_t v7 = [(SGIdentityName *)v4 initWithWesternName:v6];
      goto LABEL_8;
    case 7u:
      uint64_t v7 = [(SGIdentityName *)v4 initWithSpanishName:v6];
LABEL_8:
      uint64_t v4 = v7;
      break;
    default:
      break;
  }

  return v4;
}

- (NSString)fullName
{
  v22[5] = *MEMORY[0x1E4F143B8];
  privFullName = self->_privFullName;
  if (!privFullName)
  {
    uint64_t v4 = (void *)MEMORY[0x1CB79B230](0, a2);
    uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
    id v6 = (void *)v5;
    middlename = self->_middlename;
    prefix = self->_prefix;
    if (!prefix) {
      prefix = (NSString *)v5;
    }
    firstname = self->_firstname;
    surname = self->_surname;
    if (!firstname) {
      firstname = (NSString *)v5;
    }
    v22[0] = prefix;
    v22[1] = firstname;
    if (middlename) {
      uint64_t v11 = (uint64_t)middlename;
    }
    else {
      uint64_t v11 = v5;
    }
    if (surname) {
      uint64_t v12 = (uint64_t)surname;
    }
    else {
      uint64_t v12 = v5;
    }
    v22[2] = v11;
    v22[3] = v12;
    suffix = self->_suffix;
    if (!suffix) {
      suffix = (NSString *)v5;
    }
    v22[4] = suffix;
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:5];
    uint64_t v15 = objc_msgSend(v14, "_pas_componentsJoinedByString:", @":");

    if (fullName__pasOnceToken5 != -1) {
      dispatch_once(&fullName__pasOnceToken5, &__block_literal_global_30241);
    }
    uint64_t v16 = (void *)fullName__pasExprOnceResult;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __26__SGIdentityName_fullName__block_invoke_2;
    v20[3] = &unk_1E65BBE38;
    v20[4] = self;
    id v21 = v15;
    id v17 = v15;
    id v18 = v16;
    [v18 runWithLockAcquired:v20];

    privFullName = self->_privFullName;
  }
  return privFullName;
}

void __26__SGIdentityName_fullName__block_invoke_2(uint64_t a1, void *a2)
{
  id v17 = a2;
  uint64_t v3 = [v17 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = v3;

  id v6 = v17;
  if (!*(void *)(*(void *)(a1 + 32) + 8))
  {
    uint64_t v7 = objc_opt_new();
    [v7 setNamePrefix:*(void *)(*(void *)(a1 + 32) + 40)];
    [v7 setGivenName:*(void *)(*(void *)(a1 + 32) + 16)];
    [v7 setMiddleName:*(void *)(*(void *)(a1 + 32) + 32)];
    [v7 setFamilyName:*(void *)(*(void *)(a1 + 32) + 24)];
    [v7 setNameSuffix:*(void *)(*(void *)(a1 + 32) + 48)];
    long long v8 = [MEMORY[0x1E4F28F38] localizedStringFromPersonNameComponents:v7 style:3 options:0];
    uint64_t v9 = [v8 copy];
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void **)(v10 + 8);
    *(void *)(v10 + 8) = v9;

    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v15 = *(__CFString **)(v12 + 8);
    uint64_t v13 = (id *)(v12 + 8);
    id v14 = v15;
    if (v15) {
      uint64_t v16 = v14;
    }
    else {
      uint64_t v16 = &stru_1F24EEF20;
    }
    objc_storeStrong(v13, v16);
    if ((unint64_t)[*(id *)(*(void *)(a1 + 32) + 8) length] <= 0x400)
    {
      if ((unint64_t)[v17 count] >= 0x32) {
        [v17 removeAllObjects];
      }
      [v17 setObject:*(void *)(*(void *)(a1 + 32) + 8) forKeyedSubscript:*(void *)(a1 + 40)];
    }

    id v6 = v17;
  }
}

void __26__SGIdentityName_fullName__block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x1CB79B230]();
  id v1 = objc_alloc(MEMORY[0x1E4F93B70]);
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:50];
  uint64_t v3 = [v1 initWithGuardedData:v2];
  uint64_t v4 = (void *)fullName__pasExprOnceResult;
  fullName__pasExprOnceResult = v3;
}

+ (id)nameWithString:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [[SGIdentityName alloc] initWithString:v3];

  return v4;
}

+ (id)patterns
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__SGIdentityName_patterns__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (patterns__pasOnceToken3 != -1) {
    dispatch_once(&patterns__pasOnceToken3, block);
  }
  uint64_t v2 = (void *)patterns__pasExprOnceResult;
  return v2;
}

void __26__SGIdentityName_patterns__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v3 = +[SGPatterns patternsForClass:*(void *)(a1 + 32)];
  uint64_t v4 = (void *)patterns__pasExprOnceResult;
  patterns__pasExprOnceResult = v3;
}

@end