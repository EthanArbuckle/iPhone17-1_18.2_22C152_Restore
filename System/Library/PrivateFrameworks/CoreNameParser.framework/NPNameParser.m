@interface NPNameParser
- (BOOL)isPrefix:(id)a3;
- (BOOL)isSuffix:(id)a3;
- (NPHMMClassifier)classifier;
- (NPNameParser)init;
- (_CFBurstTrie)sharedNameFrequencyTrieRef;
- (id)normalizeFullname:(id)a3;
- (id)normalizedAffix:(id)a3;
- (id)parseChineseName:(id)a3;
- (id)parseChineseName:(id)a3 normalize:(BOOL)a4;
- (id)parseFullnameWithDefaultHMMClassifier:(id)a3;
- (id)parseFullnameWithDefaultHMMClassifier:(id)a3 normalize:(BOOL)a4 score:(double *)a5;
- (id)parseJapaneseName:(id)a3;
- (id)parseJapaneseName:(id)a3 normalize:(BOOL)a4;
- (id)parseKoreanName:(id)a3;
- (id)parseKoreanName:(id)a3 normalize:(BOOL)a4;
- (id)parseLatinName:(id)a3 score:(double *)a4;
- (id)personNameCompomentsFromPrefix:(id)a3 suffix:(id)a4 givenNames:(id)a5 middleNames:(id)a6 familyNames:(id)a7;
- (id)personNameComponentsFromString:(id)a3;
- (unint64_t)frequencyOfLatinFamilyName:(id)a3;
- (unint64_t)frequencyOfLatinGivenName:(id)a3;
- (unint64_t)genderMajorityForGivenName:(id)a3;
- (unint64_t)namingTraditionForName:(id)a3;
- (void)dealloc;
- (void)setClassifier:(id)a3;
@end

@implementation NPNameParser

- (NPNameParser)init
{
  v12.receiver = self;
  v12.super_class = (Class)NPNameParser;
  v2 = [(NPNameParser *)&v12 init];
  v3 = v2;
  if (v2)
  {
    v2->_confidenceThreshold = 1.0;
    uint64_t v4 = objc_opt_new();
    nameComponentsData = v3->_nameComponentsData;
    v3->_nameComponentsData = (NPNameComponentsData *)v4;

    v6 = [NPHMMClassifier alloc];
    v7 = v3->_nameComponentsData;
    v10[0] = xmmword_1E3BC2570;
    v10[1] = unk_1E3BC2580;
    v10[2] = xmmword_1E3BC2590;
    uint64_t v11 = 0x3FF0000000000000;
    v8 = [(NPHMMClassifier *)v6 initWithHMMProbabilities:v10 nameComponentsDate:v7];
    [(NPNameParser *)v3 setClassifier:v8];

    pthread_mutex_lock(&_NPNameParserLock);
    ++_NPNameParserInstanceCount;
    pthread_mutex_unlock(&_NPNameParserLock);
  }
  return v3;
}

- (void)dealloc
{
  pthread_mutex_lock(&_NPNameParserLock);
  if (--_NPNameParserInstanceCount) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = _NPNameParserJapaneseSurnameTrie == 0;
  }
  if (!v3)
  {
    CFBurstTrieRelease();
    _NPNameParserJapaneseSurnameTrie = 0;
  }
  pthread_mutex_unlock(&_NPNameParserLock);
  v4.receiver = self;
  v4.super_class = (Class)NPNameParser;
  [(NPNameParser *)&v4 dealloc];
}

- (unint64_t)namingTraditionForName:(id)a3
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1E4F28B88];
  id v4 = a3;
  v5 = [v3 whitespaceAndNewlineCharacterSet];
  v6 = [v4 stringByTrimmingCharactersInSet:v5];

  if (![v6 length])
  {
    unint64_t v30 = 5;
    goto LABEL_74;
  }
  CFStringRef v7 = v6;
  v8 = (__CFString *)v7;
  v46 = (__CFString *)v7;
  v47 = v6;
  if (!v7)
  {
    char v45 = 0;
    uint64_t v49 = 0;
    uint64_t v50 = 0;
LABEL_42:
    uint64_t v48 = 0;
    goto LABEL_43;
  }
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  *(_OWORD *)buffer = 0u;
  long long v56 = 0u;
  CFIndex Length = CFStringGetLength(v7);
  CFStringRef theString = v8;
  uint64_t v66 = 0;
  CFIndex v67 = Length;
  CharactersPtr = CFStringGetCharactersPtr(v8);
  CStringPtr = 0;
  v64 = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr(v8, 0x600u);
  }
  int64_t v68 = 0;
  int64_t v69 = 0;
  v65 = CStringPtr;
  if (Length < 1)
  {

    char v45 = 0;
    uint64_t v49 = 0;
    uint64_t v50 = 0;
    v8 = 0;
    goto LABEL_42;
  }
  uint64_t v12 = 0;
  int64_t v13 = 0;
  uint64_t v49 = 0;
  uint64_t v50 = 0;
  v8 = 0;
  uint64_t v48 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 64;
  do
  {
    if ((unint64_t)v13 >= 4) {
      uint64_t v16 = 4;
    }
    else {
      uint64_t v16 = v13;
    }
    CFIndex v17 = v67;
    if (v67 <= v13)
    {
      UniChar v18 = 0;
    }
    else if (v64)
    {
      UniChar v18 = v64[v13 + v66];
    }
    else if (v65)
    {
      UniChar v18 = v65[v66 + v13];
    }
    else
    {
      int64_t v23 = v68;
      if (v69 <= v13 || v68 > v13)
      {
        uint64_t v25 = -v16;
        uint64_t v26 = v16 + v12;
        uint64_t v27 = v15 - v16;
        int64_t v28 = v13 + v25;
        CFIndex v29 = v28 + 64;
        if (v28 + 64 >= v67) {
          CFIndex v29 = v67;
        }
        int64_t v68 = v28;
        int64_t v69 = v29;
        if (v67 >= v27) {
          CFIndex v17 = v27;
        }
        v72.length = v17 + v26;
        v72.location = v28 + v66;
        CFStringGetCharacters(theString, v72, buffer);
        int64_t v23 = v68;
      }
      UniChar v18 = buffer[v13 - v23];
    }
    if (_NPChineseCharSet_onceToken != -1) {
      dispatch_once(&_NPChineseCharSet_onceToken, &__block_literal_global_0);
    }
    unsigned int v19 = [(id)_NPChineseCharSet_result characterIsMember:v18];
    if (_NPHangulCharSet_onceToken != -1) {
      dispatch_once(&_NPHangulCharSet_onceToken, &__block_literal_global_105);
    }
    unsigned int v20 = [(id)_NPHangulCharSet_result characterIsMember:v18];
    if (_NPJapaneseCharSet_onceToken != -1) {
      dispatch_once(&_NPJapaneseCharSet_onceToken, &__block_literal_global_107);
    }
    unsigned int v21 = [(id)_NPJapaneseCharSet_result characterIsMember:v18];
    if (_NPLatinCharSet_onceToken != -1) {
      dispatch_once(&_NPLatinCharSet_onceToken, &__block_literal_global_109);
    }
    v49 += v20;
    v50 += v19;
    v8 = (__CFString *)((char *)v8 + v21);
    v14 += [(id)_NPLatinCharSet_result characterIsMember:v18];
    v22 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    v48 += [v22 characterIsMember:v18];

    ++v13;
    --v12;
    ++v15;
  }
  while (Length != v13);

  v6 = v47;
  if (v14)
  {
    if (!(__CFString *)((char *)v8 + v49 + v50))
    {
      unint64_t v30 = 3;
      goto LABEL_74;
    }
    char v45 = 1;
  }
  else
  {
    char v45 = 0;
  }
LABEL_43:
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  v31 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  uint64_t v32 = [v31 countByEnumeratingWithState:&v51 objects:v70 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    char v34 = 0;
    int v35 = 0;
    uint64_t v36 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v52 != v36) {
          objc_enumerationMutation(v31);
        }
        v38 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        if ([v38 hasPrefix:@"zh"]) {
          char v34 = 1;
        }
        else {
          v35 |= [v38 hasPrefix:@"ja"];
        }
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v51 objects:v70 count:16];
    }
    while (v33);
  }
  else
  {
    char v34 = 0;
    int v35 = 0;
  }

  v39 = [MEMORY[0x1E4F1CA20] currentLocale];
  v40 = [v39 regionCode];

  if (([v40 isEqualToString:@"CN"] & 1) != 0
    || ([v40 isEqualToString:@"HK"] & 1) != 0)
  {
    v6 = v47;
  }
  else
  {
    v6 = v47;
    if (([v40 isEqualToString:@"MO"] & 1) == 0
      && ([v40 isEqualToString:@"TW"] & 1) == 0)
    {
      v35 |= [v40 isEqualToString:@"JP"];
      if ((v34 & 1) == 0)
      {
        int v41 = 1;
        goto LABEL_59;
      }
    }
  }
  int v41 = v35;
  int v35 = 0;
LABEL_59:
  uint64_t v42 = [(__CFString *)v46 length];
  char v43 = v45;
  if (!(__CFString *)((char *)v8 + v50 + v49)) {
    char v43 = 0;
  }
  if (v43)
  {
    unint64_t v30 = 4;
  }
  else if ((__CFString *)((char *)v8 + v50) == (__CFString *)(v42 - v48))
  {
    if ((v8 != 0) | v41 & v35 & 1) {
      unint64_t v30 = 1;
    }
    else {
      unint64_t v30 = ((v41 | v35) & 1) != 0 && v48 != 0;
    }
  }
  else if (v50 + v49 == v42 - v48)
  {
    unint64_t v30 = 2;
  }
  else
  {
    unint64_t v30 = 5;
  }

LABEL_74:
  return v30;
}

- (id)personNameComponentsFromString:(id)a3
{
  id v4 = [(NPNameParser *)self normalizeFullname:a3];
  switch([(NPNameParser *)self namingTraditionForName:v4])
  {
    case 0uLL:
      uint64_t v5 = [(NPNameParser *)self parseChineseName:v4 normalize:0];
      goto LABEL_7;
    case 1uLL:
      uint64_t v5 = [(NPNameParser *)self parseJapaneseName:v4 normalize:0];
      goto LABEL_7;
    case 2uLL:
      uint64_t v5 = [(NPNameParser *)self parseKoreanName:v4 normalize:0];
      goto LABEL_7;
    case 3uLL:
      uint64_t v5 = [(NPNameParser *)self parseFullnameWithDefaultHMMClassifier:v4 normalize:0 score:0];
LABEL_7:
      v6 = (void *)v5;
      break;
    default:
      v6 = 0;
      break;
  }

  return v6;
}

- (id)parseLatinName:(id)a3 score:(double *)a4
{
  return [(NPNameParser *)self parseFullnameWithDefaultHMMClassifier:a3 normalize:1 score:a4];
}

- (id)parseFullnameWithDefaultHMMClassifier:(id)a3
{
  return [(NPNameParser *)self parseFullnameWithDefaultHMMClassifier:a3 normalize:1 score:0];
}

- (id)parseFullnameWithDefaultHMMClassifier:(id)a3 normalize:(BOOL)a4 score:(double *)a5
{
  BOOL v6 = a4;
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (v6)
  {
    uint64_t v9 = [(NPNameParser *)self normalizeFullname:v8];

    id v8 = (id)v9;
  }
  v10 = _NPTokenizeName(v8);
  uint64_t v11 = (void *)[v10 mutableCopy];

  int64_t v69 = a5;
  if ((unint64_t)[v11 count] < 2)
  {
    uint64_t v71 = 0;
    CFRange v72 = 0;
    goto LABEL_13;
  }
  uint64_t v12 = [v11 firstObject];
  BOOL v13 = [(NPNameParser *)self isPrefix:v12];

  if (v13)
  {
    CFRange v72 = [v11 firstObject];
    [v11 removeObjectAtIndex:0];
  }
  else
  {
    CFRange v72 = 0;
  }
  uint64_t v14 = [v11 lastObject];
  if ([(NPNameParser *)self isSuffix:v14])
  {
    unint64_t v15 = [v11 count];

    if (v15 >= 2)
    {
      uint64_t v71 = [v11 lastObject];
      [v11 removeLastObject];
      goto LABEL_13;
    }
  }
  else
  {
  }
  uint64_t v71 = 0;
LABEL_13:
  int64_t v68 = self;
  uint64_t v16 = [(NPNameParser *)self classifier];
  CFIndex v17 = [v16 hiddenStatesFromObservationSequence:v11];

  v73 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"self == %ld || self == %ld", 0, 1);
  unint64_t v18 = [v11 count];
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id v19 = v17;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v78 objects:v82 count:16];
  obuint64_t j = v19;
  id v70 = v8;
  if (v20)
  {
    uint64_t v21 = v20;
    CFIndex v67 = v11;
    id v22 = 0;
    int64_t v23 = 0;
    uint64_t v24 = *(void *)v79;
    double v25 = -1.79769313e308;
    while (1)
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v79 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = *(void **)(*((void *)&v78 + 1) + 8 * i);
        int64_t v28 = (void *)MEMORY[0x1E4E70970]();
        if ([v27 isFavorite])
        {
          id v29 = v27;

          id v22 = v29;
        }
        unint64_t v30 = [v27 oovIndices];
        unint64_t v31 = [v30 count];

        if (v31 < v18) {
          goto LABEL_21;
        }
        if (v31 == v18)
        {
          [v27 score];
          if (v34 > v25)
          {
            unint64_t v31 = v18;
LABEL_21:
            [v27 score];
            double v25 = v32;
            id v33 = v27;

            unint64_t v18 = v31;
            int64_t v23 = v33;
            goto LABEL_27;
          }
          [v27 score];
          if (v35 == v25)
          {
            uint64_t v36 = [v23 sequence];
            v75 = v23;
            v37 = [v36 filteredArrayUsingPredicate:v73];
            unint64_t v74 = [v37 count];

            v38 = [v27 sequence];
            v39 = [v38 filteredArrayUsingPredicate:v73];
            unint64_t v40 = [v39 count];

            unint64_t v31 = v18;
            BOOL v41 = v40 > v74;
            int64_t v23 = v75;
            if (v41) {
              goto LABEL_21;
            }
          }
        }
LABEL_27:
      }
      id v19 = obj;
      uint64_t v21 = [obj countByEnumeratingWithState:&v78 objects:v82 count:16];
      if (!v21)
      {

        if (v22)
        {
          [v22 score];
          double v43 = v42;
          [v23 score];
          id v8 = v70;
          uint64_t v11 = v67;
          if (v43 > v44)
          {
            id v22 = v22;
            goto LABEL_33;
          }
        }
        else
        {
          id v8 = v70;
          uint64_t v11 = v67;
        }
        goto LABEL_35;
      }
    }
  }
  id v22 = 0;
  int64_t v23 = v19;
LABEL_33:

  int64_t v23 = v22;
LABEL_35:
  unint64_t v45 = [v11 count];
  v46 = [v23 oovIndices];
  unint64_t v47 = [v46 count];

  if (v45 == 4 && v47 > 2 || v45 >= 5 && (float)((float)v45 * 0.5) <= (float)v47)
  {
    v64 = 0;
  }
  else
  {
    id v76 = v22;
    uint64_t v48 = objc_opt_new();
    uint64_t v49 = objc_opt_new();
    uint64_t v50 = objc_opt_new();
    long long v51 = [v23 observation];
    uint64_t v52 = [v51 count];

    if (v52)
    {
      for (uint64_t j = 0; v52 != j; ++j)
      {
        long long v54 = v23;
        v55 = [v23 sequence];
        long long v56 = [v55 objectAtIndexedSubscript:j];
        uint64_t v57 = [v56 unsignedIntegerValue];

        int64_t v23 = v54;
        if (v57 == 2)
        {
          long long v61 = [v54 observation];
          long long v62 = [v61 objectAtIndexedSubscript:j];
          v63 = v49;
        }
        else
        {
          if (v57 != 1)
          {
            if (!v57)
            {
              long long v58 = (void *)MEMORY[0x1E4E70970]();
              long long v59 = [v54 observation];
              long long v60 = [v59 objectAtIndexedSubscript:j];
              [v48 addObject:v60];

              int64_t v23 = v54;
            }
            continue;
          }
          long long v61 = [v54 observation];
          long long v62 = [v61 objectAtIndexedSubscript:j];
          v63 = v50;
        }
        [v63 addObject:v62];
      }
    }
    v64 = [(NPNameParser *)v68 personNameCompomentsFromPrefix:v72 suffix:v71 givenNames:v48 middleNames:v50 familyNames:v49];
    id v8 = v70;
    if (v69)
    {
      [v23 score];
      *(void *)int64_t v69 = v65;
    }

    id v22 = v76;
    id v19 = obj;
  }

  return v64;
}

- (id)personNameCompomentsFromPrefix:(id)a3 suffix:(id)a4 givenNames:(id)a5 middleNames:(id)a6 familyNames:(id)a7
{
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  id v14 = a4;
  id v15 = a3;
  uint64_t v16 = objc_opt_new();
  [v16 setNamePrefix:v15];

  [v16 setNameSuffix:v14];
  if ([v11 count])
  {
    CFIndex v17 = [v11 componentsJoinedByString:@" "];
    unint64_t v18 = [v17 stringByReplacingOccurrencesOfString:@"|" withString:@" "];
    [v16 setGivenName:v18];
  }
  else
  {
    [v16 setGivenName:0];
  }
  if ([v12 count])
  {
    id v19 = [v12 componentsJoinedByString:@" "];
    uint64_t v20 = [v19 stringByReplacingOccurrencesOfString:@"|" withString:@" "];
    [v16 setMiddleName:v20];
  }
  else
  {
    [v16 setMiddleName:0];
  }
  if ([v13 count])
  {
    uint64_t v21 = [v13 componentsJoinedByString:@" "];
    id v22 = [v21 stringByReplacingOccurrencesOfString:@"|" withString:@" "];
    [v16 setFamilyName:v22];
  }
  else
  {
    [v16 setFamilyName:0];
  }

  return v16;
}

- (id)parseChineseName:(id)a3
{
  return [(NPNameParser *)self parseChineseName:a3 normalize:1];
}

- (id)parseChineseName:(id)a3 normalize:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    uint64_t v7 = [(NPNameParser *)self normalizeFullname:v6];

    id v6 = (id)v7;
  }
  id v8 = _NPTokenizeName(v6);
  uint64_t v9 = objc_opt_new();
  if ([v8 count] == 2)
  {
    v10 = [v8 lastObject];
    [v9 setGivenName:v10];

    id v11 = [v8 firstObject];
    [v9 setFamilyName:v11];
    goto LABEL_21;
  }
  id v12 = (void *)MEMORY[0x1E4F28FD8];
  id v13 = [(NPNameComponentsData *)self->_nameComponentsData objectValueForEntry:3];
  id v11 = [v12 regularExpressionWithPattern:v13 options:0 error:0];

  switch([v6 length])
  {
    case 2:
      nameComponentsData = self->_nameComponentsData;
      id v15 = [v6 substringToIndex:1];
      LODWORD(nameComponentsData) = [(NPNameComponentsData *)nameComponentsData collectionForEntry:2 contains:v15];

      if (!nameComponentsData) {
        goto LABEL_8;
      }
      uint64_t v16 = [v6 substringToIndex:1];
      [v9 setFamilyName:v16];

      CFIndex v17 = [v6 substringFromIndex:1];
      unint64_t v18 = v9;
      id v19 = v17;
      goto LABEL_17;
    case 3:
      uint64_t v20 = [v6 substringToIndex:2];
      uint64_t v21 = [v20 stringByApplyingTransform:@"Traditional-Simplified" reverse:0];

      if (objc_msgSend(v11, "numberOfMatchesInString:options:range:", v21, 0, 0, objc_msgSend(v21, "length")))
      {
        id v22 = [v6 substringToIndex:2];
        [v9 setFamilyName:v22];

        int64_t v23 = v6;
        uint64_t v24 = 2;
LABEL_15:
        unint64_t v31 = [v23 substringFromIndex:v24];
        [v9 setGivenName:v31];

        goto LABEL_20;
      }
      int64_t v28 = self->_nameComponentsData;
      id v29 = [v21 substringToIndex:1];
      LODWORD(v28) = [(NPNameComponentsData *)v28 collectionForEntry:2 contains:v29];

      if (v28)
      {
        unint64_t v30 = [v6 substringToIndex:1];
        [v9 setFamilyName:v30];

        int64_t v23 = v6;
        uint64_t v24 = 1;
        goto LABEL_15;
      }
      [v9 setGivenName:v6];
LABEL_20:

LABEL_21:
      return v9;
    case 4:
      double v25 = [v6 substringToIndex:2];
      CFIndex v17 = [v25 stringByApplyingTransform:@"Traditional-Simplified" reverse:0];

      if (objc_msgSend(v11, "numberOfMatchesInString:options:range:", v17, 0, 0, objc_msgSend(v17, "length")))
      {
        uint64_t v26 = [v6 substringToIndex:2];
        [v9 setFamilyName:v26];

        uint64_t v27 = [v6 substringFromIndex:2];
        [v9 setGivenName:v27];
      }
      else
      {
        unint64_t v18 = v9;
        id v19 = v6;
LABEL_17:
        [v18 setGivenName:v19];
      }

      goto LABEL_21;
    default:
LABEL_8:
      [v9 setGivenName:v6];
      goto LABEL_21;
  }
}

- (id)parseJapaneseName:(id)a3
{
  return [(NPNameParser *)self parseJapaneseName:a3 normalize:1];
}

- (id)parseJapaneseName:(id)a3 normalize:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    uint64_t v7 = [(NPNameParser *)self normalizeFullname:v6];

    id v6 = (id)v7;
  }
  id v8 = _NPTokenizeName(v6);
  uint64_t v9 = objc_opt_new();
  if ([v8 count] == 2)
  {
    v10 = [v8 lastObject];
    [v9 setGivenName:v10];

    id v11 = [v8 firstObject];
    [v9 setFamilyName:v11];

    goto LABEL_37;
  }
  if ((unint64_t)[v8 count] >= 3)
  {
    [v9 setFamilyName:v6];
    goto LABEL_37;
  }
  if (!_NPNameParserJapaneseSurnameTrie)
  {
    id v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v13 = [v12 pathForResource:@"ja_surname" ofType:@"trie"];

    _NPNameParserJapaneseSurnameTrie = CFBurstTrieCreateFromFile();
  }
  id v14 = objc_opt_new();
  id v15 = (void *)[objc_alloc(MEMORY[0x1E4F28F28]) initWithDominantScript:@"Jpan" languageMap:&unk_1F3F3FA98];
  uint64_t v59 = 0;
  long long v60 = &v59;
  uint64_t v61 = 0x2020000000;
  char v62 = 0;
  uint64_t v16 = [v6 length];
  uint64_t v17 = *MEMORY[0x1E4F28510];
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __44__NPNameParser_parseJapaneseName_normalize___block_invoke;
  v56[3] = &unk_1E6E1CAF8;
  id v18 = v14;
  id v57 = v18;
  long long v58 = &v59;
  objc_msgSend(v6, "enumerateLinguisticTagsInRange:scheme:options:orthography:usingBlock:", 0, v16, v17, 6, v15, v56);
  if (!*((unsigned char *)v60 + 24) && [v18 count])
  {
    if ([v18 count] == 1)
    {
      id v19 = [v18 objectAtIndexedSubscript:0];
      uint64_t v20 = [v19 rangeValue];
      id v22 = objc_msgSend(v6, "substringWithRange:", v20, v21);
      [v9 setFamilyName:v22];
LABEL_34:

      goto LABEL_35;
    }
    uint64_t v23 = [v18 count];
    if ((unint64_t)(v23 - 1) >= 5) {
      unint64_t v24 = 5;
    }
    else {
      unint64_t v24 = v23 - 1;
    }
    while (1)
    {
      double v25 = [v18 objectAtIndexedSubscript:v24];
      NSUInteger v26 = [v25 rangeValue];
      NSUInteger v28 = v27;

      id v29 = [v18 objectAtIndexedSubscript:0];
      v64.location = [v29 rangeValue];
      v67.location = v26;
      v67.NSUInteger length = v28;
      NSRange v30 = NSUnionRange(v64, v67);
      NSUInteger length = v30.length;

      if (CFBurstTrieContains()) {
        break;
      }
      if ((uint64_t)v24-- <= 0) {
        goto LABEL_26;
      }
    }
    if (v30.location == 0x7FFFFFFFFFFFFFFFLL || v30.length != 1)
    {
      if (v30.location != 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_31;
      }
    }
    else if ((unint64_t)[v18 count] <= 2)
    {
      NSUInteger length = 1;
LABEL_31:
      unint64_t v47 = objc_msgSend(v6, "substringWithRange:", v30.location, length);
      [v9 setFamilyName:v47];

      if (v24 >= [v18 count] - 1) {
        goto LABEL_36;
      }
      id v19 = [v18 objectAtIndexedSubscript:v24 + 1];
      NSUInteger v48 = [v19 rangeValue];
      NSUInteger v50 = v49;
      id v22 = [v18 lastObject];
      v69.location = [v22 rangeValue];
      v69.NSUInteger length = v51;
      v66.location = v48;
      v66.NSUInteger length = v50;
      NSRange v52 = NSUnionRange(v66, v69);
      v46 = objc_msgSend(v6, "substringWithRange:", v52.location, v52.length);
      [v9 setGivenName:v46];
      goto LABEL_33;
    }
LABEL_26:
    if ([v18 count] != 2)
    {
      id v19 = [v18 objectAtIndexedSubscript:0];
      NSUInteger v41 = [v19 rangeValue];
      NSUInteger v43 = v42;
      id v22 = [v18 lastObject];
      v68.location = [v22 rangeValue];
      v68.NSUInteger length = v44;
      v65.location = v41;
      v65.NSUInteger length = v43;
      NSRange v45 = NSUnionRange(v65, v68);
      v46 = objc_msgSend(v6, "substringWithRange:", v45.location, v45.length);
      [v9 setFamilyName:v46];
LABEL_33:

      goto LABEL_34;
    }
    id v33 = [v18 objectAtIndexedSubscript:0];
    uint64_t v34 = [v33 rangeValue];
    uint64_t v36 = v35;

    v37 = [v18 objectAtIndexedSubscript:1];
    uint64_t v38 = [v37 rangeValue];
    uint64_t v55 = v39;
    uint64_t v40 = v38;

    if (v36 == 3)
    {
      if (v34 + 3 != v40)
      {
        uint64_t v36 = 3;
LABEL_45:
        long long v54 = objc_msgSend(v6, "substringWithRange:", v34, v36);
        [v9 setFamilyName:v54];

        id v19 = objc_msgSend(v6, "substringWithRange:", v40, v55);
        [v9 setGivenName:v19];
LABEL_35:

        goto LABEL_36;
      }
    }
    else if (v36 != 2 || v55 != 1 || v34 + 2 != v40)
    {
      goto LABEL_45;
    }
    if (CFBurstTrieContains())
    {
      --v40;
      ++v55;
      --v36;
    }
    goto LABEL_45;
  }
  [v9 setFamilyName:v6];
LABEL_36:

  _Block_object_dispose(&v59, 8);
LABEL_37:

  return v9;
}

void __44__NPNameParser_parseJapaneseName_normalize___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  if ([a2 isEqualToString:@"ja"])
  {
    id v11 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", a3, a4);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    [v11 addObject:v12];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a7 = 1;
  }
}

- (id)parseKoreanName:(id)a3
{
  return [(NPNameParser *)self parseKoreanName:a3 normalize:1];
}

- (id)parseKoreanName:(id)a3 normalize:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v4)
  {
    uint64_t v7 = [(NPNameParser *)self normalizeFullname:v6];

    id v6 = (id)v7;
  }
  id v8 = _NPTokenizeName(v6);
  uint64_t v9 = objc_opt_new();
  v10 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  if ((unint64_t)[v8 count] >= 2)
  {
    NSUInteger v41 = v10;
    NSUInteger v42 = v8;
    id v43 = v6;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v51 objects:v56 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v52;
      uint64_t v44 = *(void *)v52;
      NSRange v45 = self;
      do
      {
        uint64_t v15 = 0;
        uint64_t v46 = v13;
        do
        {
          if (*(void *)v52 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v51 + 1) + 8 * v15);
          uint64_t v17 = (void *)MEMORY[0x1E4E70970]();
          if ([(NPNameComponentsData *)self->_nameComponentsData collectionForEntry:4 contains:v16])
          {
            [v9 setGivenName:v16];
            [v9 setFamilyName:v16];
            long long v49 = 0u;
            long long v50 = 0u;
            long long v47 = 0u;
            long long v48 = 0u;
            id v18 = v11;
            id v19 = v11;
            uint64_t v20 = [v19 countByEnumeratingWithState:&v47 objects:v55 count:16];
            if (v20)
            {
              uint64_t v21 = v20;
              uint64_t v22 = *(void *)v48;
              do
              {
                for (uint64_t i = 0; i != v21; ++i)
                {
                  if (*(void *)v48 != v22) {
                    objc_enumerationMutation(v19);
                  }
                  uint64_t v24 = *(void *)(*((void *)&v47 + 1) + 8 * i);
                  if ((objc_msgSend(v16, "isEqualToString:", v24, v41, v42, v43) & 1) == 0) {
                    [v9 setGivenName:v24];
                  }
                }
                uint64_t v21 = [v19 countByEnumeratingWithState:&v47 objects:v55 count:16];
              }
              while (v21);
            }

            uint64_t v14 = v44;
            self = v45;
            id v11 = v18;
            uint64_t v13 = v46;
          }
          ++v15;
        }
        while (v15 != v13);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v51 objects:v56 count:16];
      }
      while (v13);
    }

    double v25 = [v9 familyName];
    uint64_t v26 = [v25 length];

    id v8 = v42;
    id v6 = v43;
    v10 = v41;
    if (!v26)
    {
      NSUInteger v27 = [v11 objectAtIndexedSubscript:0];
      [v9 setFamilyName:v27];

      NSUInteger v28 = objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v11, "count") - 1);
      [v9 setGivenName:v28];
    }
  }
  if ((unint64_t)objc_msgSend(v6, "length", v41, v42, v43) < 2
    || ([v9 givenName], id v29 = objc_claimAutoreleasedReturnValue(), v29, v29))
  {
    NSRange v30 = 0;
  }
  else
  {
    NSRange v30 = [v6 substringToIndex:2];
    if ([(NPNameComponentsData *)self->_nameComponentsData collectionForEntry:4 contains:v30])
    {
      [v9 setFamilyName:v30];
      if ([v6 length] == 2)
      {
        [v9 setGivenName:0];
      }
      else
      {
        uint64_t v40 = [v6 substringFromIndex:2];
        [v9 setGivenName:v40];
      }
    }
  }
  if ([v6 length]
    && ([v9 givenName], unint64_t v31 = objc_claimAutoreleasedReturnValue(), v31, !v31))
  {
    double v32 = [v6 substringToIndex:1];

    if ([(NPNameComponentsData *)self->_nameComponentsData collectionForEntry:4 contains:v32])
    {
      [v9 setFamilyName:v32];
      if ([v6 length] == 1)
      {
        [v9 setGivenName:0];
      }
      else
      {
        uint64_t v39 = [v6 substringFromIndex:1];
        [v9 setGivenName:v39];
      }
    }
  }
  else
  {
    double v32 = v30;
  }
  id v33 = [v9 givenName];

  if (!v33) {
    [v9 setGivenName:v6];
  }
  uint64_t v34 = [v9 givenName];
  uint64_t v35 = [v34 stringByTrimmingCharactersInSet:v10];
  [v9 setGivenName:v35];

  uint64_t v36 = [v9 familyName];
  v37 = [v36 stringByTrimmingCharactersInSet:v10];
  [v9 setFamilyName:v37];

  return v9;
}

- (id)normalizeFullname:(id)a3
{
  BOOL v3 = _NPStripQuotationMarks(a3);
  BOOL v4 = _NPRemoveEmojis(v3);

  uint64_t v5 = _NPRemoveParenthesisBracketsAndInside(v4);

  id v6 = _NPRemoveAppSignature(v5);

  uint64_t v7 = _NPCollapseWhitespaceAndStrip(v6);

  return v7;
}

- (BOOL)isPrefix:(id)a3
{
  BOOL v3 = self;
  BOOL v4 = [(NPNameParser *)self normalizedAffix:a3];
  LOBYTE(v3) = [(NPNameComponentsData *)v3->_nameComponentsData collectionForEntry:0 contains:v4];

  return (char)v3;
}

- (BOOL)isSuffix:(id)a3
{
  BOOL v3 = self;
  BOOL v4 = [(NPNameParser *)self normalizedAffix:a3];
  LOBYTE(v3) = [(NPNameComponentsData *)v3->_nameComponentsData collectionForEntry:1 contains:v4];

  return (char)v3;
}

- (id)normalizedAffix:(id)a3
{
  return (id)[a3 stringByReplacingOccurrencesOfString:@"." withString:&stru_1F3F3F078];
}

- (_CFBurstTrie)sharedNameFrequencyTrieRef
{
  return [(NPHMMClassifier *)self->_classifier nameFrequencyTrieRef];
}

- (unint64_t)frequencyOfLatinFamilyName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NPNameParser *)self classifier];
  unint64_t v6 = [v5 frequencyForName:v4 type:2];

  return v6;
}

- (unint64_t)frequencyOfLatinGivenName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NPNameParser *)self classifier];
  unint64_t v6 = [v5 frequencyForName:v4 type:0];

  return v6;
}

- (unint64_t)genderMajorityForGivenName:(id)a3
{
  id v4 = [(NPNameParser *)self normalizeFullname:a3];
  uint64_t v5 = [v4 lowercaseString];

  unint64_t v6 = [(NPNameParser *)self classifier];
  unint64_t v7 = [v6 genderMajorityForGivenName:v5];

  return v7;
}

- (NPHMMClassifier)classifier
{
  return (NPHMMClassifier *)objc_getProperty(self, a2, 24, 1);
}

- (void)setClassifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classifier, 0);
  objc_storeStrong((id *)&self->_nameComponentsData, 0);
}

@end