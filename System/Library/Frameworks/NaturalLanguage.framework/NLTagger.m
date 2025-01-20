@interface NLTagger
+ (NSArray)availableTagSchemesForUnit:(NLTokenUnit)unit language:(NLLanguage)language;
+ (id)availableTagSchemesForLanguage:(id)a3;
+ (id)dominantScriptForString:(id)a3;
+ (void)registerForAssetNotifications;
+ (void)requestAssetsForLanguage:(NLLanguage)language tagScheme:(NLTagScheme)tagScheme completionHandler:(void *)completionHandler;
- (NLLanguage)dominantLanguage;
- (NLTag)tagAtIndex:(NSUInteger)characterIndex unit:(NLTokenUnit)unit scheme:(NLTagScheme)scheme tokenRange:(NSRangePointer)tokenRange;
- (NLTagger)initWithTagSchemes:(NSArray *)tagSchemes;
- (NSArray)gazetteersForTagScheme:(NLTagScheme)tagScheme;
- (NSArray)modelsForTagScheme:(NLTagScheme)tagScheme;
- (NSArray)tagSchemes;
- (NSArray)tagsInRange:(NSRange)range unit:(NLTokenUnit)unit scheme:(NLTagScheme)scheme options:(NLTaggerOptions)options tokenRanges:(NSArray *)tokenRanges;
- (NSDictionary)tagHypothesesAtIndex:(NSUInteger)characterIndex unit:(NLTokenUnit)unit scheme:(NLTagScheme)scheme maximumCount:(NSUInteger)maximumCount tokenRange:(NSRangePointer)tokenRange;
- (NSRange)tokenRangeAtIndex:(NSUInteger)characterIndex unit:(NLTokenUnit)unit;
- (NSRange)tokenRangeForRange:(NSRange)range unit:(NLTokenUnit)unit;
- (NSString)string;
- (_NSRange)sentenceRangeForRange:(_NSRange)a3;
- (id)_customGazetteerAtIndex:(unint64_t)a3 unit:(int64_t)a4 gazetteerDictionary:(id)a5;
- (id)_customHypothesesAtIndex:(unint64_t)a3 fromHypothesisDictionary:(id)a4;
- (id)_customHypothesesAtIndex:(unint64_t)a3 unit:(int64_t)a4 scheme:(id)a5 maximumCount:(unint64_t)a6 options:(unint64_t)a7 modelDictionary:(id)a8 gazetteerDictionary:(id)a9;
- (id)_customHypothesisDictionaryForSentence:(id)a3 options:(unint64_t)a4 model:(id)a5 gazetteer:(id)a6 maximumCount:(unint64_t)a7;
- (id)_customModelAtIndex:(unint64_t)a3 unit:(int64_t)a4 modelDictionary:(id)a5;
- (id)_customTagAtIndex:(unint64_t)a3 fromTagDictionary:(id)a4;
- (id)_customTagAtIndex:(unint64_t)a3 unit:(int64_t)a4 scheme:(id)a5 options:(unint64_t)a6 modelDictionary:(id)a7 gazetteerDictionary:(id)a8;
- (id)_customTagDictionaryForSentence:(id)a3 options:(unint64_t)a4 model:(id)a5 gazetteer:(id)a6;
- (id)_tagSchemeForScheme:(id)a3;
- (id)description;
- (id)dominantScript;
- (void)dealloc;
- (void)enumerateTagsInRange:(NSRange)range unit:(NLTokenUnit)unit scheme:(NLTagScheme)scheme options:(NLTaggerOptions)options usingBlock:(void *)block;
- (void)setGazetteers:(NSArray *)gazetteers forTagScheme:(NLTagScheme)tagScheme;
- (void)setLanguage:(NLLanguage)language range:(NSRange)range;
- (void)setModels:(NSArray *)models forTagScheme:(NLTagScheme)tagScheme;
- (void)setOrthography:(NSOrthography *)orthography range:(NSRange)range;
- (void)setString:(NSString *)string;
- (void)stringEditedInRange:(_NSRange)a3 changeInLength:(int64_t)a4;
@end

@implementation NLTagger

- (NLTagger)initWithTagSchemes:(NSArray *)tagSchemes
{
  v4 = tagSchemes;
  v5 = [MEMORY[0x1E4F1CA48] arrayWithArray:v4];
  v6 = [MEMORY[0x1E4F1CA60] dictionary];
  if (([v5 containsObject:@"Language"] & 1) == 0) {
    [v5 addObject:@"Language"];
  }
  if (([v5 containsObject:@"Script"] & 1) == 0) {
    [v5 addObject:@"Script"];
  }
  v7 = (void *)NLTaggerCreate();
  +[NLTagger registerForAssetNotifications];
  if (v7)
  {
    v11.receiver = self;
    v11.super_class = (Class)NLTagger;
    self = [(NLTagger *)&v11 init];
    if (self)
    {
      v8 = (NSArray *)[(NSArray *)v4 copy];
      schemes = self->_schemes;
      self->_schemes = v8;

      self->_tagger = v7;
    }
  }

  return self;
}

uint64_t __41__NLTagger_registerForAssetNotifications__block_invoke()
{
  int out_token = 0;
  v0 = (const char *)[@"com.apple.MobileAsset.LinguisticData.new-asset-installed" UTF8String];
  return notify_register_dispatch(v0, &out_token, MEMORY[0x1E4F14428], &__block_literal_global_7);
}

- (void)setString:(NSString *)string
{
  objc_storeStrong((id *)&self->_string, string);
  v4 = string;
  NLTaggerSetString();
}

- (NLLanguage)dominantLanguage
{
  if ([(NSString *)self->_string length])
  {
    v2 = (void *)NLTaggerCopyTagAtIndex();
    v3 = tagForNLTag(v2);
  }
  else
  {
    v3 = 0;
  }

  return (NLLanguage)v3;
}

+ (void)registerForAssetNotifications
{
  if (registerForAssetNotifications_onceToken != -1) {
    dispatch_once(&registerForAssetNotifications_onceToken, &__block_literal_global_1);
  }
}

+ (NSArray)availableTagSchemesForUnit:(NLTokenUnit)unit language:(NLLanguage)language
{
  CFLocaleRef v4 = CFLocaleCreate(0, (CFLocaleIdentifier)language);
  v5 = (void *)MEMORY[0x1E4F1CBF0];
  if (v4)
  {
    CFLocaleRef v6 = v4;
    uint64_t v7 = NLTaggerCopyAvailableTagSchemes();
    CFRelease(v6);
    if (v7) {
      v5 = (void *)v7;
    }
  }

  return (NSArray *)v5;
}

+ (id)availableTagSchemesForLanguage:(id)a3
{
  CFLocaleRef v4 = (void *)MEMORY[0x1E4F1CA80];
  id v5 = a3;
  CFLocaleRef v6 = [v4 set];
  uint64_t v7 = [a1 availableTagSchemesForUnit:0 language:v5];
  [v6 addObjectsFromArray:v7];

  v8 = [a1 availableTagSchemesForUnit:1 language:v5];
  [v6 addObjectsFromArray:v8];

  v9 = [a1 availableTagSchemesForUnit:2 language:v5];
  [v6 addObjectsFromArray:v9];

  v10 = [a1 availableTagSchemesForUnit:3 language:v5];

  [v6 addObjectsFromArray:v10];
  objc_super v11 = [v6 allObjects];

  return v11;
}

void __41__NLTagger_registerForAssetNotifications__block_invoke_2()
{
  +[NLTaggerAssetRequest checkAssetRequests];
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"NLAssetsHaveChanged" object:0];
}

- (void)dealloc
{
  tagger = self->_tagger;
  if (tagger) {
    CFRelease(tagger);
  }
  v4.receiver = self;
  v4.super_class = (Class)NLTagger;
  [(NLTagger *)&v4 dealloc];
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v7.receiver = self;
  v7.super_class = (Class)NLTagger;
  objc_super v4 = [(NLTagger *)&v7 description];
  id v5 = [v3 stringWithFormat:@"%@\n", v4];

  [v5 appendFormat:@"    tag schemes %@\n", self->_schemes];
  objc_msgSend(v5, "appendFormat:", @"    string %p has %lu characters\n", self->_string, -[NSString length](self->_string, "length"));

  return v5;
}

- (NSArray)tagSchemes
{
  return self->_schemes;
}

- (id)_tagSchemeForScheme:(id)a3
{
  objc_super v4 = (__CFString *)a3;
  if ([(NSArray *)self->_schemes containsObject:v4])
  {
    id v5 = @"TokenType";
    if (([@"TokenType" isEqualToString:v4] & 1) == 0)
    {
      id v5 = @"LexicalClass";
      if (([@"LexicalClass" isEqualToString:v4] & 1) == 0)
      {
        id v5 = @"NameType";
        if (([@"NameType" isEqualToString:v4] & 1) == 0)
        {
          id v5 = @"NameTypeOrLexicalClass";
          if (([@"NameTypeOrLexicalClass" isEqualToString:v4] & 1) == 0)
          {
            id v5 = @"Lemma";
            if (([@"Lemma" isEqualToString:v4] & 1) == 0)
            {
              id v5 = @"Language";
              if (([@"Language" isEqualToString:v4] & 1) == 0)
              {
                id v5 = @"Script";
                if (([@"Script" isEqualToString:v4] & 1) == 0)
                {
                  id v5 = @"Sentiment";
                  if (([@"Sentiment" isEqualToString:v4] & 1) == 0)
                  {
                    id v5 = @"PossibleClasses";
                    if (([@"PossibleClasses" isEqualToString:v4] & 1) == 0)
                    {
                      id v5 = @"InternalClass";
                      if (![@"InternalClass" isEqualToString:v4]) {
                        id v5 = v4;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    CFLocaleRef v6 = v5;
  }
  else
  {
    CFLocaleRef v6 = 0;
  }

  return v6;
}

- (NSString)string
{
  return self->_string;
}

- (_NSRange)sentenceRangeForRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v5 = [(NLTagger *)self string];
  unint64_t v6 = [v5 length];

  if (location + length <= v6)
  {
    if (v6)
    {
      NLTaggerGetTokenAtIndex();
      if (length) {
        NLTaggerGetTokenAtIndex();
      }
    }
  }
  NSUInteger v7 = 0;
  NSUInteger v8 = 0;
  result.NSUInteger length = v8;
  result.NSUInteger location = v7;
  return result;
}

- (id)_customModelAtIndex:(unint64_t)a3 unit:(int64_t)a4 modelDictionary:(id)a5
{
  id v5 = a5;
  unint64_t v6 = (__CFString *)NLTaggerCopyTagAtIndex();
  if (!v6) {
    unint64_t v6 = @"und";
  }
  NSUInteger v7 = [v5 objectForKey:v6];
  if (!v7)
  {
    NSUInteger v7 = [v5 objectForKey:@"und"];
  }

  return v7;
}

- (id)_customGazetteerAtIndex:(unint64_t)a3 unit:(int64_t)a4 gazetteerDictionary:(id)a5
{
  id v6 = a5;
  if (a4)
  {
    NSUInteger v7 = 0;
    NSUInteger v8 = 0;
  }
  else
  {
    NSUInteger v8 = (__CFString *)NLTaggerCopyTagAtIndex();
    if (!v8) {
      NSUInteger v8 = @"und";
    }
    uint64_t v9 = [v6 objectForKey:v8];
    if (!v9)
    {
      uint64_t v9 = [v6 objectForKey:@"und"];
    }
    NSUInteger v7 = (void *)v9;
  }

  return v7;
}

- (id)_customTagDictionaryForSentence:(id)a3 options:(unint64_t)a4 model:(id)a5 gazetteer:(id)a6
{
  char v50 = a4;
  v55[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v53 = a6;
  v10 = [MEMORY[0x1E4F1CA48] array];
  objc_super v11 = [MEMORY[0x1E4F1CA48] array];
  [MEMORY[0x1E4F1CA48] array];
  v49 = v52 = v8;
  generateTokenSequence(v8, 0, v10, v11, v49);
  uint64_t v12 = [v10 count];
  if (v12)
  {
    unint64_t v13 = v12;
    v14 = (void *)MEMORY[0x1E4F1CA48];
    v15 = [v9 predictedLabelsForTokens:v10];
    v16 = [v14 arrayWithArray:v15];

    v17 = [MEMORY[0x1E4F1CA48] array];
    if ([v16 count] < v13)
    {
      unint64_t v18 = [v16 count];
      unint64_t v19 = v13 - v18;
      if (v13 > v18)
      {
        do
        {
          [v16 addObject:&stru_1EFB303D0];
          --v19;
        }
        while (v19);
      }
    }
    v51 = v16;
    v47 = v10;
    id v48 = v9;
    uint64_t v20 = 0;
    if (v13 <= 1) {
      uint64_t v21 = 1;
    }
    else {
      uint64_t v21 = v13;
    }
    unint64_t v22 = 0x1E4F29000uLL;
    do
    {
      v23 = *(void **)(v22 + 568);
      v24 = [v11 objectAtIndex:v20];
      uint64_t v25 = [v24 unsignedIntegerValue];
      v26 = [v49 objectAtIndex:v20];
      v27 = objc_msgSend(v23, "valueWithRange:", v25, objc_msgSend(v26, "unsignedIntegerValue"));
      [v17 addObject:v27];

      unint64_t v22 = 0x1E4F29000;
      ++v20;
    }
    while (v21 != v20);
    v45 = v11;
    if (!v53) {
      goto LABEL_24;
    }
    uint64_t v28 = 0;
    while (1)
    {
      uint64_t v29 = 4;
      uint64_t v30 = 3;
      while (v28 + v30 >= v13)
      {
LABEL_16:
        --v30;
        --v29;
        if (v30 == -1) {
          goto LABEL_23;
        }
      }
      v31 = [v17 objectAtIndex:v28];
      NSUInteger v32 = [v31 rangeValue];
      NSUInteger v34 = v33;
      v35 = [v17 objectAtIndex:v28 + v30];
      v58.NSUInteger location = [v35 rangeValue];
      v58.NSUInteger length = v36;
      v57.NSUInteger location = v32;
      v57.NSUInteger length = v34;
      NSRange v37 = NSUnionRange(v57, v58);

      v38 = objc_msgSend(v52, "substringWithRange:", v37.location, v37.length);
      uint64_t v39 = [v53 labelForString:v38];
      if (!v39) {
        break;
      }
      v40 = (void *)v39;
      uint64_t v41 = v28;
      if ((v50 & 0x10) != 0)
      {
        objc_msgSend(v17, "removeObjectsInRange:", v28, v30 + 1);
        objc_msgSend(v51, "removeObjectsInRange:", v28, v30 + 1);
        v42 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v37.location, v37.length);
        [v17 insertObject:v42 atIndex:v28];

        [v51 insertObject:v40 atIndex:v28];
        v13 -= v30;
      }
      else
      {
        do
        {
          objc_msgSend(v51, "replaceObjectAtIndex:withObject:", v41++, v40, v45);
          --v29;
        }
        while (v29);
      }

LABEL_23:
      if (++v28 >= v13)
      {
LABEL_24:
        v54[0] = @"labels";
        v54[1] = @"ranges";
        v55[0] = v51;
        v55[1] = v17;
        v43 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v55, v54, 2, v45);

        v10 = v47;
        id v9 = v48;
        objc_super v11 = v46;
        goto LABEL_26;
      }
    }

    goto LABEL_16;
  }
  v43 = (void *)MEMORY[0x1E4F1CC08];
LABEL_26:

  return v43;
}

- (id)_customTagAtIndex:(unint64_t)a3 fromTagDictionary:(id)a4
{
  id v5 = a4;
  id v6 = [v5 objectForKey:@"labels"];
  NSUInteger v7 = [v5 objectForKey:@"ranges"];
  uint64_t v8 = [v6 count];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    while (1)
    {
      objc_super v11 = [v7 objectAtIndex:v10];
      unint64_t v12 = [v11 rangeValue];
      unint64_t v14 = v13;

      if (a3 >= v12 && a3 - v12 < v14) {
        break;
      }
      if (v9 == ++v10) {
        goto LABEL_6;
      }
    }
    v15 = [v6 objectAtIndex:v10];
  }
  else
  {
LABEL_6:
    v15 = 0;
  }

  return v15;
}

- (id)_customTagAtIndex:(unint64_t)a3 unit:(int64_t)a4 scheme:(id)a5 options:(unint64_t)a6 modelDictionary:(id)a7 gazetteerDictionary:(id)a8
{
  id v13 = a8;
  unint64_t v14 = [(NLTagger *)self _customModelAtIndex:a3 unit:a4 modelDictionary:a7];
  if (!v14)
  {
    v27 = 0;
    goto LABEL_41;
  }
  v15 = [NSNumber numberWithUnsignedLongLong:v14];
  v16 = [(NLTagger *)self string];
  v17 = v16;
  switch(a4)
  {
    case 0:
      id v42 = v13;
      uint64_t v18 = -[NLTagger sentenceRangeForRange:](self, "sentenceRangeForRange:", a3, 0);
      unint64_t v20 = v19;
      uint64_t v41 = v18;
      uint64_t v21 = objc_msgSend(v17, "substringWithRange:");
      unint64_t v22 = [(NSMutableDictionary *)self->_sequenceCaches objectForKey:v15];
      uint64_t v23 = [v22 objectForKey:v21];
      if (v23) {
        BOOL v24 = 1;
      }
      else {
        BOOL v24 = v20 == 0;
      }
      if (v24)
      {
        uint64_t v25 = (void *)v23;
        uint64_t v26 = v41;
      }
      else
      {
        uint64_t v36 = [(NLTagger *)self _customGazetteerAtIndex:a3 unit:0 gazetteerDictionary:v13];
        unint64_t v37 = a6;
        v38 = (void *)v36;
        uint64_t v39 = [(NLTagger *)self _customTagDictionaryForSentence:v21 options:v37 model:v14 gazetteer:v36];
        uint64_t v25 = (void *)v39;
        if (v39 && v20 <= 0x400)
        {
          if ((unint64_t)[v22 count] >= 0x40) {
            [v22 removeAllObjects];
          }
          uint64_t v26 = v41;
          if (!v22)
          {
            unint64_t v22 = [MEMORY[0x1E4F1CA60] dictionary];
            [(NSMutableDictionary *)self->_sequenceCaches setObject:v22 forKey:v15];
          }
          [v22 setObject:v25 forKey:v21];
        }
        else
        {
          uint64_t v26 = v41;
        }
      }
      v27 = [(NLTagger *)self _customTagAtIndex:a3 - v26 fromTagDictionary:v25];

      id v13 = v42;
      goto LABEL_40;
    case 1:
      id v28 = v13;
      uint64_t v30 = -[NLTagger sentenceRangeForRange:](self, "sentenceRangeForRange:", a3, 0);
      goto LABEL_13;
    case 2:
      id v28 = v13;
      uint64_t v30 = objc_msgSend(v16, "paragraphRangeForRange:", a3, 0);
LABEL_13:
      unint64_t v29 = v31;
      objc_msgSend(v17, "substringWithRange:", v30, v31);
      id v32 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    case 3:
      id v28 = v13;
      unint64_t v29 = [v16 length];
      id v32 = v17;
LABEL_15:
      uint64_t v21 = v32;
      break;
    default:
      id v28 = v13;
      unint64_t v29 = 0;
      uint64_t v21 = 0;
      break;
  }
  unint64_t v22 = [(NSMutableDictionary *)self->_classifierCaches objectForKey:v15];
  uint64_t v33 = [v22 objectForKey:v21];
  if (v33) {
    BOOL v34 = 1;
  }
  else {
    BOOL v34 = v29 == 0;
  }
  if (v34)
  {
    v27 = (void *)v33;
  }
  else
  {
    uint64_t v35 = [v14 predictedLabelForString:v21];
    v27 = (void *)v35;
    if (v35 && v29 <= 0x400)
    {
      id v13 = v28;
      if ((unint64_t)[v22 count] >= 0x40) {
        [v22 removeAllObjects];
      }
      if (!v22)
      {
        unint64_t v22 = [MEMORY[0x1E4F1CA60] dictionary];
        [(NSMutableDictionary *)self->_classifierCaches setObject:v22 forKey:v15];
      }
      [v22 setObject:v27 forKey:v21];
      goto LABEL_40;
    }
  }
  id v13 = v28;
LABEL_40:

LABEL_41:

  return v27;
}

- (id)_customHypothesisDictionaryForSentence:(id)a3 options:(unint64_t)a4 model:(id)a5 gazetteer:(id)a6 maximumCount:(unint64_t)a7
{
  char v55 = a4;
  v66[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v62 = a6;
  unint64_t v12 = [MEMORY[0x1E4F1CA48] array];
  id v13 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v14 = [MEMORY[0x1E4F1CA48] array];
  v61 = v10;
  generateTokenSequence(v10, 0, v12, v13, v14);
  uint64_t v15 = [v12 count];
  if (v15)
  {
    unint64_t v16 = v15;
    v17 = (void *)MEMORY[0x1E4F1CA48];
    id v53 = v12;
    id v54 = v11;
    uint64_t v18 = [v11 predictedLabelHypothesesForTokens:v12 maximumCount:a7];
    unint64_t v19 = [v17 arrayWithArray:v18];

    unint64_t v20 = v19;
    v60 = [MEMORY[0x1E4F1CA48] array];
    if ([v19 count] < v16)
    {
      unint64_t v21 = [v19 count];
      unint64_t v22 = v16 - v21;
      if (v16 > v21)
      {
        uint64_t v23 = MEMORY[0x1E4F1CC08];
        do
        {
          [v20 addObject:v23];
          --v22;
        }
        while (v22);
      }
    }
    v56 = v20;
    uint64_t v24 = 0;
    unint64_t v25 = v16;
    if (v16 <= 1) {
      uint64_t v26 = 1;
    }
    else {
      uint64_t v26 = v16;
    }
    unint64_t v27 = 0x1E4F29000uLL;
    do
    {
      id v28 = *(void **)(v27 + 568);
      unint64_t v29 = [v13 objectAtIndex:v24];
      uint64_t v30 = [v29 unsignedIntegerValue];
      unint64_t v31 = [v14 objectAtIndex:v24];
      id v32 = objc_msgSend(v28, "valueWithRange:", v30, objc_msgSend(v31, "unsignedIntegerValue"));
      [v60 addObject:v32];

      unint64_t v27 = 0x1E4F29000;
      ++v24;
    }
    while (v26 != v24);
    uint64_t v33 = v60;
    if (!v62 || !a7) {
      goto LABEL_26;
    }
    uint64_t v34 = 0;
    NSRange v57 = v14;
    NSRange v58 = v13;
    while (1)
    {
      uint64_t v35 = 4;
      uint64_t v36 = 3;
      while (v34 + v36 >= v25)
      {
LABEL_18:
        --v36;
        --v35;
        if (v36 == -1) {
          goto LABEL_25;
        }
      }
      unint64_t v37 = [v33 objectAtIndex:v34];
      NSUInteger v38 = [v37 rangeValue];
      NSUInteger v40 = v39;
      uint64_t v41 = [v33 objectAtIndex:v34 + v36];
      v69.NSUInteger location = [v41 rangeValue];
      v69.NSUInteger length = v42;
      v68.NSUInteger location = v38;
      v68.NSUInteger length = v40;
      NSRange v43 = NSUnionRange(v68, v69);

      v44 = objc_msgSend(v61, "substringWithRange:", v43.location, v43.length);
      uint64_t v45 = [v62 labelForString:v44];
      if (!v45) {
        break;
      }
      v46 = (void *)v45;
      uint64_t v65 = v45;
      v47 = [NSNumber numberWithDouble:1.0];
      v66[0] = v47;
      uint64_t v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v66 forKeys:&v65 count:1];

      uint64_t v48 = v34;
      if ((v55 & 0x10) != 0)
      {
        objc_msgSend(v60, "removeObjectsInRange:", v34, v36 + 1);
        objc_msgSend(v56, "removeObjectsInRange:", v34, v36 + 1);
        uint64_t v33 = v60;
        char v50 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v43.location, v43.length);
        [v60 insertObject:v50 atIndex:v34];

        v49 = (void *)v59;
        [v56 insertObject:v59 atIndex:v34];
        v25 -= v36;
      }
      else
      {
        do
        {
          [v56 replaceObjectAtIndex:v48++ withObject:v59];
          --v35;
        }
        while (v35);
        v49 = (void *)v59;
        uint64_t v33 = v60;
      }

LABEL_25:
      unint64_t v14 = v57;
      id v13 = v58;
      if (++v34 >= v25)
      {
LABEL_26:
        v63[0] = @"hypotheses";
        v63[1] = @"ranges";
        v64[0] = v56;
        v64[1] = v33;
        v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:v63 count:2];

        unint64_t v12 = v53;
        id v11 = v54;
        goto LABEL_28;
      }
    }

    uint64_t v33 = v60;
    goto LABEL_18;
  }
  v51 = (void *)MEMORY[0x1E4F1CC08];
LABEL_28:

  return v51;
}

- (id)_customHypothesesAtIndex:(unint64_t)a3 fromHypothesisDictionary:(id)a4
{
  id v5 = a4;
  id v6 = [v5 objectForKey:@"hypotheses"];
  NSUInteger v7 = [v5 objectForKey:@"ranges"];
  uint64_t v8 = [v6 count];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    id v11 = (void *)MEMORY[0x1E4F1CC08];
    while (1)
    {
      unint64_t v12 = [v7 objectAtIndex:v10];
      unint64_t v13 = [v12 rangeValue];
      unint64_t v15 = v14;

      if (a3 >= v13 && a3 - v13 < v15) {
        break;
      }
      if (v9 == ++v10) {
        goto LABEL_9;
      }
    }
    id v11 = [v6 objectAtIndex:v10];
  }
  else
  {
    id v11 = (void *)MEMORY[0x1E4F1CC08];
  }
LABEL_9:

  return v11;
}

- (id)_customHypothesesAtIndex:(unint64_t)a3 unit:(int64_t)a4 scheme:(id)a5 maximumCount:(unint64_t)a6 options:(unint64_t)a7 modelDictionary:(id)a8 gazetteerDictionary:(id)a9
{
  id v15 = a9;
  unint64_t v16 = [(NLTagger *)self _customModelAtIndex:a3 unit:a4 modelDictionary:a8];
  if (v16)
  {
    v17 = [(NLTagger *)self string];
    uint64_t v18 = v17;
    switch(a4)
    {
      case 0:
        uint64_t v19 = -[NLTagger sentenceRangeForRange:](self, "sentenceRangeForRange:", a3, 0);
        unint64_t v21 = objc_msgSend(v18, "substringWithRange:", v19, v20);
        unint64_t v22 = [(NLTagger *)self _customGazetteerAtIndex:a3 unit:0 gazetteerDictionary:v15];
        uint64_t v23 = [(NLTagger *)self _customHypothesisDictionaryForSentence:v21 options:a7 model:v16 gazetteer:v22 maximumCount:a6];
        uint64_t v24 = [(NLTagger *)self _customHypothesesAtIndex:a3 - v19 fromHypothesisDictionary:v23];

        goto LABEL_12;
      case 1:
        uint64_t v25 = -[NLTagger sentenceRangeForRange:](self, "sentenceRangeForRange:", a3, 0);
        goto LABEL_8;
      case 2:
        uint64_t v25 = objc_msgSend(v17, "paragraphRangeForRange:", a3, 0);
LABEL_8:
        objc_msgSend(v18, "substringWithRange:", v25, v26);
        id v27 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      case 3:
        [v17 length];
        id v27 = v18;
LABEL_10:
        unint64_t v21 = v27;
        break;
      default:
        unint64_t v21 = 0;
        break;
    }
    uint64_t v24 = [v16 predictedLabelHypothesesForString:v21 maximumCount:a6];
LABEL_12:
  }
  else
  {
    uint64_t v24 = 0;
  }

  return v24;
}

- (void)enumerateTagsInRange:(NSRange)range unit:(NLTokenUnit)unit scheme:(NLTagScheme)scheme options:(NLTaggerOptions)options usingBlock:(void *)block
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  unint64_t v12 = scheme;
  unint64_t v13 = block;
  NSUInteger v14 = [(NSString *)self->_string length];
  if (location + length <= v14)
  {
    NSUInteger v16 = v14;
    id v15 = [(NLTagger *)self _tagSchemeForScheme:v12];

    if (v15)
    {
      v17 = [(NSMutableDictionary *)self->_customModelDictionaries objectForKey:v15];
      uint64_t v18 = [(NSMutableDictionary *)self->_customGazetteerDictionaries objectForKey:v15];
      if (unit == NLTokenUnitDocument)
      {
        uint64_t v19 = [(NLTagger *)self tagAtIndex:0 unit:3 scheme:v15 tokenRange:0];
        char v24 = 0;
        v13[2](v13, v19, 0, v16, &v24);
      }
      else
      {
        id v22 = v15;
        uint64_t v23 = v13;
        id v20 = v18;
        id v21 = v17;
        NLTaggerEnumerateTokens();

        uint64_t v19 = v17;
      }
    }
  }
  else
  {
    id v15 = v12;
  }
}

void __64__NLTagger_enumerateTagsInRange_unit_scheme_options_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  objc_super v4 = (void *)MEMORY[0x1AD0BB930]();
  uint64_t v5 = *(void *)(a1 + 32);
  if (!v5
    || ([*(id *)(a1 + 40) _customTagAtIndex:*a2 unit:*(void *)(a1 + 72) scheme:*(void *)(a1 + 48) options:*(void *)(a1 + 80) modelDictionary:v5 gazetteerDictionary:*(void *)(a1 + 56)], (id v6 = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    NSUInteger v7 = (void *)NLTaggerCopyTagForCurrentToken();
    tagForNLTag(v7);
    id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (*(__CFString **)(a1 + 48) == @"Sentiment")
  {
    uint64_t v8 = v6;
    [(__CFString *)v8 doubleValue];
    if (v9 <= 1.0)
    {
      if (v9 >= -1.0)
      {
        id v6 = v8;
        if (v9 != 0.0)
        {
LABEL_12:

          goto LABEL_13;
        }
        uint64_t v10 = _NLTagZero;
      }
      else
      {
        uint64_t v10 = _NLTagNegativeOne;
      }
    }
    else
    {
      uint64_t v10 = _NLTagPositiveOne;
    }
    id v6 = *v10;

    goto LABEL_12;
  }
LABEL_13:
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (NLTag)tagAtIndex:(NSUInteger)characterIndex unit:(NLTokenUnit)unit scheme:(NLTagScheme)scheme tokenRange:(NSRangePointer)tokenRange
{
  uint64_t v10 = scheme;
  NSUInteger v11 = [(NSString *)self->_string length];
  if (v11 <= characterIndex)
  {
    id v18 = 0;
    unint64_t v13 = v10;
  }
  else
  {
    NSUInteger v12 = v11;
    unint64_t v13 = [(NLTagger *)self _tagSchemeForScheme:v10];

    if (v13)
    {
      NSUInteger v14 = [(NSMutableDictionary *)self->_customModelDictionaries objectForKey:v13];
      id v15 = [(NSMutableDictionary *)self->_customGazetteerDictionaries objectForKey:v13];
      if (!v14
        || ([(NLTagger *)self _customTagAtIndex:characterIndex unit:unit scheme:v13 options:0 modelDictionary:v14 gazetteerDictionary:v15], (NSUInteger v16 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        v17 = (void *)NLTaggerCopyTagAtIndex();
        NSUInteger v16 = tagForNLTag(v17);
      }
      if (tokenRange)
      {
        if (unit == NLTokenUnitDocument)
        {
          tokenRange->NSUInteger location = 0;
          tokenRange->NSUInteger length = v12;
        }
        else
        {
          NLTaggerGetTokenAtIndex();
          *tokenRange = 0uLL;
        }
      }
      id v18 = v16;
    }
    else
    {
      id v18 = 0;
    }
  }

  return (NLTag)v18;
}

- (NSArray)tagsInRange:(NSRange)range unit:(NLTokenUnit)unit scheme:(NLTagScheme)scheme options:(NLTaggerOptions)options tokenRanges:(NSArray *)tokenRanges
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  unint64_t v13 = scheme;
  NSUInteger v14 = [MEMORY[0x1E4F1CA48] array];
  if (tokenRanges)
  {
    id v15 = [MEMORY[0x1E4F1CA48] array];
  }
  else
  {
    id v15 = 0;
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __56__NLTagger_tagsInRange_unit_scheme_options_tokenRanges___block_invoke;
  v21[3] = &unk_1E5C53C70;
  id v16 = v14;
  id v22 = v16;
  id v17 = v15;
  id v23 = v17;
  -[NLTagger enumerateTagsInRange:unit:scheme:options:usingBlock:](self, "enumerateTagsInRange:unit:scheme:options:usingBlock:", location, length, unit, v13, options, v21);
  if (tokenRanges) {
    *tokenRanges = (NSArray *)v17;
  }
  id v18 = v23;
  uint64_t v19 = (NSArray *)v16;

  return v19;
}

void __56__NLTagger_tagsInRange_unit_scheme_options_tokenRanges___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  NSUInteger v7 = a2;
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = &stru_1EFB303D0;
  }
  NSUInteger v11 = v8;
  objc_msgSend(*(id *)(a1 + 32), "addObject:");
  double v9 = *(void **)(a1 + 40);
  if (v9)
  {
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", a3, a4);
    [v9 addObject:v10];
  }
}

- (NSDictionary)tagHypothesesAtIndex:(NSUInteger)characterIndex unit:(NLTokenUnit)unit scheme:(NLTagScheme)scheme maximumCount:(NSUInteger)maximumCount tokenRange:(NSRangePointer)tokenRange
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  string = self->_string;
  unint64_t v13 = scheme;
  NSUInteger v14 = [(NSString *)string length];
  if (v14 <= characterIndex)
  {
    id v33 = (id)MEMORY[0x1E4F1CC08];
    id v16 = v13;
  }
  else
  {
    NSUInteger v15 = v14;
    id v16 = [(NLTagger *)self _tagSchemeForScheme:v13];

    if (!v16)
    {
      id v33 = (id)MEMORY[0x1E4F1CC08];
      goto LABEL_30;
    }
    id v17 = [(NSMutableDictionary *)self->_customModelDictionaries objectForKey:v16];
    uint64_t v18 = [(NSMutableDictionary *)self->_customGazetteerDictionaries objectForKey:v16];
    uint64_t v19 = (void *)v18;
    if (!v17
      || ([(NLTagger *)self _customHypothesesAtIndex:characterIndex unit:unit scheme:v16 maximumCount:maximumCount options:0 modelDictionary:v17 gazetteerDictionary:v18], (id v20 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      id v20 = [MEMORY[0x1E4F1CA60] dictionary];
      NSUInteger v40 = v19;
      uint64_t v41 = (void *)NLTaggerCopyHypothesesAtIndex();
      if (v41)
      {
        NSUInteger v35 = maximumCount;
        NSUInteger v36 = v15;
        unint64_t v37 = v17;
        NLTokenUnit v38 = unit;
        NSUInteger v39 = tokenRange;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v21 = v41;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v42 objects:v46 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v43;
          do
          {
            for (uint64_t i = 0; i != v23; ++i)
            {
              if (*(void *)v43 != v24) {
                objc_enumerationMutation(v21);
              }
              uint64_t v26 = *(void **)(*((void *)&v42 + 1) + 8 * i);
              id v27 = [v21 objectForKey:v26];
              [v27 doubleValue];
              if (v28 > 0.0)
              {
                unint64_t v29 = tagForNLTag(v26);
                [v20 setObject:v27 forKey:v29];
              }
            }
            uint64_t v23 = [v21 countByEnumeratingWithState:&v42 objects:v46 count:16];
          }
          while (v23);
        }

        unit = v38;
        tokenRange = v39;
        NSUInteger v15 = v36;
        id v17 = v37;
        uint64_t v19 = v40;
        maximumCount = v35;
      }
      uint64_t v30 = [v20 count];
      if (maximumCount && !v30)
      {
        unint64_t v31 = [(NLTagger *)self tagAtIndex:characterIndex unit:unit scheme:v16 tokenRange:tokenRange];
        if (v31)
        {
          id v32 = [NSNumber numberWithDouble:1.0];
          [v20 setObject:v32 forKey:v31];

          uint64_t v19 = v40;
        }
      }
    }
    if (tokenRange)
    {
      if (unit == NLTokenUnitDocument)
      {
        tokenRange->NSUInteger location = 0;
        tokenRange->NSUInteger length = v15;
      }
      else
      {
        NLTaggerGetTokenAtIndex();
        *tokenRange = 0uLL;
      }
    }
    id v33 = v20;
  }
LABEL_30:

  return (NSDictionary *)v33;
}

- (NSRange)tokenRangeAtIndex:(NSUInteger)characterIndex unit:(NLTokenUnit)unit
{
  if ([(NSString *)self->_string length] <= characterIndex)
  {
    NSUInteger v5 = 0;
    NSUInteger v4 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    NLTaggerGetTokenAtIndex();
    NSUInteger v4 = 0;
    NSUInteger v5 = 0;
  }
  result.NSUInteger length = v5;
  result.NSUInteger location = v4;
  return result;
}

- (NSRange)tokenRangeForRange:(NSRange)range unit:(NLTokenUnit)unit
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  NSUInteger v6 = [(NSString *)self->_string length];
  if (v6 <= location)
  {
    uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    if (location + length <= v6) {
      NSUInteger v7 = length;
    }
    else {
      NSUInteger v7 = v6 - location;
    }
    NLTaggerGetTokenAtIndex();
    uint64_t v8 = 0;
    if (v7) {
      NLTaggerGetTokenAtIndex();
    }
  }
  NSUInteger v9 = v8;
  NSUInteger v10 = 0;
  result.NSUInteger length = v10;
  result.NSUInteger location = v9;
  return result;
}

- (id)dominantScript
{
  v3 = @"Zyyy";
  if ([(NSString *)self->_string length])
  {
    NSUInteger v4 = (void *)NLTaggerCopyTagAtIndex();
    uint64_t v5 = tagForNLTag(v4);

    v3 = (__CFString *)v5;
  }

  return v3;
}

+ (id)dominantScriptForString:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  NSUInteger v4 = [NLTagger alloc];
  v9[0] = @"Script";
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  NSUInteger v6 = [(NLTagger *)v4 initWithTagSchemes:v5];

  [(NLTagger *)v6 setString:v3];
  NSUInteger v7 = [(NLTagger *)v6 dominantScript];
  [(NLTagger *)v6 setString:0];

  return v7;
}

- (void)setLanguage:(NLLanguage)language range:(NSRange)range
{
  CFStringRef v4 = language;
  NSUInteger v6 = (__CFString *)v4;
  if (v4)
  {
    CFLocaleRef v5 = CFLocaleCreate(0, v4);
    NLTaggerSetLocaleForRange();
    if (v5) {
      CFRelease(v5);
    }
  }
  else
  {
    NLTaggerSetLocaleForRange();
  }
}

- (void)setOrthography:(NSOrthography *)orthography range:(NSRange)range
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  NSUInteger v7 = orthography;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000;
  NSUInteger v36 = __Block_byref_object_copy__1;
  unint64_t v37 = __Block_byref_object_dispose__1;
  id v38 = 0;
  uint64_t v28 = 0;
  unint64_t v29 = &v28;
  uint64_t v30 = 0x3010000000;
  unint64_t v31 = "";
  long long v32 = xmmword_1A646D6C0;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__1;
  uint64_t v26 = __Block_byref_object_dispose__1;
  id v27 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __33__NLTagger_setOrthography_range___block_invoke;
  v16[3] = &unk_1E5C53C98;
  uint64_t v19 = &v33;
  id v20 = &v28;
  id v21 = &v22;
  uint64_t v8 = v7;
  id v17 = v8;
  uint64_t v18 = self;
  [(NLTagger *)self enumerateTagsInRange:location, length, 0, @"Script", 14, v16 unit scheme options usingBlock];
  NSUInteger v9 = v34;
  uint64_t v10 = v34[5];
  if (v10)
  {
    uint64_t v11 = v29[5];
    if (v11)
    {
      uint64_t v12 = v29[4];
      if (location + length > v12 + v11)
      {
        v29[5] = location + length - v12;
        uint64_t v10 = v9[5];
      }
      uint64_t v13 = [(NSOrthography *)v8 dominantLanguageForScript:v10];
      NSUInteger v14 = (void *)v23[5];
      v23[5] = v13;

      uint64_t v15 = v23[5];
      if (v15) {
        -[NLTagger setLanguage:range:](self, "setLanguage:range:", v15, v29[4], v29[5]);
      }
    }
  }

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v33, 8);
}

void __33__NLTagger_setOrthography_range___block_invoke(uint64_t a1, void *a2, unint64_t a3, uint64_t a4)
{
  id v8 = a2;
  if (v8)
  {
    id v19 = v8;
    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      if ((objc_msgSend(v8, "isEqual:") & 1) == 0)
      {
        uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
        uint64_t v10 = *(void *)(v9 + 40);
        if (v10)
        {
          uint64_t v11 = *(void *)(v9 + 32);
          if (a3 > v11 + v10) {
            *(void *)(v9 + 40) = a3 - v11;
          }
          uint64_t v12 = [*(id *)(a1 + 32) dominantLanguageForScript:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
          uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8);
          NSUInteger v14 = *(void **)(v13 + 40);
          *(void *)(v13 + 40) = v12;

          uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
          if (v15) {
            objc_msgSend(*(id *)(a1 + 40), "setLanguage:range:", v15, *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 32), *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
          }
          *(_OWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 32) = xmmword_1A646D6C0;
        }
      }
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v17 = *(void *)(v16 + 40);
    if (v17)
    {
      uint64_t v18 = *(void *)(v16 + 32);
      id v8 = v19;
      if (a3 + a4 <= v18 + v17) {
        goto LABEL_15;
      }
      a4 = a3 + a4 - v18;
    }
    else
    {
      *(void *)(v16 + 32) = a3;
      id v8 = v19;
    }
    *(void *)(v16 + 40) = a4;
  }
LABEL_15:
}

- (void)stringEditedInRange:(_NSRange)a3 changeInLength:(int64_t)a4
{
  id v5 = [(NLTagger *)self string];
  [(NLTagger *)self setString:v5];
}

- (void)setModels:(NSArray *)models forTagScheme:(NLTagScheme)tagScheme
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  NSUInteger v6 = models;
  uint64_t v24 = tagScheme;
  NSUInteger v7 = [MEMORY[0x1E4F1CA60] dictionary];
  if (!self->_customModels)
  {
    id v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    customModels = self->_customModels;
    self->_customModels = v8;
  }
  if (!self->_customModelDictionaries)
  {
    uint64_t v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    customModelDictionaries = self->_customModelDictionaries;
    self->_customModelDictionaries = v10;
  }
  if (!self->_classifierCaches)
  {
    uint64_t v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    classifierCaches = self->_classifierCaches;
    self->_classifierCaches = v12;
  }
  if (!self->_sequenceCaches)
  {
    NSUInteger v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    sequenceCaches = self->_sequenceCaches;
    self->_sequenceCaches = v14;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v16 = v6;
  uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v22 = [v21 configuration];
        uint64_t v23 = [v22 language];

        if (!v23) {
          uint64_t v23 = @"und";
        }
        [v7 setObject:v21 forKey:v23];
      }
      uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v18);
  }

  [(NSMutableDictionary *)self->_customModels setObject:v16 forKey:v24];
  [(NSMutableDictionary *)self->_customModelDictionaries setObject:v7 forKey:v24];
  [(NSMutableDictionary *)self->_classifierCaches removeAllObjects];
  [(NSMutableDictionary *)self->_sequenceCaches removeAllObjects];
}

- (NSArray)modelsForTagScheme:(NLTagScheme)tagScheme
{
  id v3 = [(NSMutableDictionary *)self->_customModels objectForKey:tagScheme];
  if (!v3)
  {
    id v3 = [MEMORY[0x1E4F1C978] array];
  }

  return (NSArray *)v3;
}

- (void)setGazetteers:(NSArray *)gazetteers forTagScheme:(NLTagScheme)tagScheme
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  NSUInteger v6 = gazetteers;
  id v20 = tagScheme;
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
  id v8 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v9 = v6;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        NSUInteger v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v15 = [v14 language];
        if (!v15) {
          uint64_t v15 = @"und";
        }
        [v8 setObject:v14 forKey:v15];
        [v14 _addImplementationToArray:Mutable];
      }
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }

  if (!self->_customGazetteers)
  {
    uint64_t v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    customGazetteers = self->_customGazetteers;
    self->_customGazetteers = v16;
  }
  if (!self->_customGazetteerDictionaries)
  {
    uint64_t v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    customGazetteerDictionaries = self->_customGazetteerDictionaries;
    self->_customGazetteerDictionaries = v18;
  }
  [(NSMutableDictionary *)self->_customGazetteers setObject:v9 forKey:v20];
  [(NSMutableDictionary *)self->_customGazetteerDictionaries setObject:v8 forKey:v20];
  NLTaggerSetGazetteers();
  CFRelease(Mutable);
}

- (NSArray)gazetteersForTagScheme:(NLTagScheme)tagScheme
{
  id v3 = [(NSMutableDictionary *)self->_customGazetteers objectForKey:tagScheme];
  if (!v3)
  {
    id v3 = [MEMORY[0x1E4F1C978] array];
  }

  return (NSArray *)v3;
}

+ (void)requestAssetsForLanguage:(NLLanguage)language tagScheme:(NLTagScheme)tagScheme completionHandler:(void *)completionHandler
{
  NSUInteger v7 = language;
  id v8 = completionHandler;
  uint64_t v9 = tagScheme;
  uint64_t v10 = [[NLTaggerAssetRequest alloc] initWithLanguage:v7 tagScheme:v9 completionHandler:v8];

  +[NLTagger registerForAssetNotifications];
  if (v10)
  {
    if ([(NLTaggerAssetRequest *)v10 isFulfilled])
    {
      (*((void (**)(void *, void, void))v8 + 2))(v8, 0, 0);
    }
    else
    {
      if (_loadTextInput_onceToken != -1) {
        dispatch_once(&_loadTextInput_onceToken, &__block_literal_global_161);
      }
      id v11 = objc_alloc_init((Class)_TILinguisticAssetDownloadClient);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __65__NLTagger_requestAssetsForLanguage_tagScheme_completionHandler___block_invoke;
      v12[3] = &unk_1E5C53CC0;
      uint64_t v13 = v10;
      id v14 = v8;
      [v11 requestLinguisticAssetsForLanguage:v7 completion:v12];
    }
  }
}

void __65__NLTagger_requestAssetsForLanguage_tagScheme_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([*(id *)(a1 + 32) isFulfilled])
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (v5) {
      NSLog(&cfstr_DownloadReques.isa, v5);
    }
    switch(a2)
    {
      case -2:
        uint64_t v9 = *(void **)(a1 + 32);
        uint64_t v10 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v13 = *MEMORY[0x1E4F28568];
        v14[0] = @"Asset download service is unavailable";
        id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
        uint64_t v12 = [v10 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:7 userInfo:v11];
        [v9 completeWithResult:2 error:v12];

        break;
      case -1:
        NSUInteger v6 = *(void **)(a1 + 32);
        uint64_t v7 = 2;
        id v8 = v5;
        goto LABEL_9;
      case 0:
      case 2:
        NSUInteger v6 = *(void **)(a1 + 32);
        uint64_t v7 = 1;
        id v8 = 0;
LABEL_9:
        [v6 completeWithResult:v7 error:v8];
        break;
      case 1:
        [*(id *)(a1 + 32) waitForFulfillment];
        break;
      default:
        break;
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customGazetteerDictionaries, 0);
  objc_storeStrong((id *)&self->_customGazetteers, 0);
  objc_storeStrong((id *)&self->_sequenceCaches, 0);
  objc_storeStrong((id *)&self->_classifierCaches, 0);
  objc_storeStrong((id *)&self->_customModelDictionaries, 0);
  objc_storeStrong((id *)&self->_customModels, 0);
  objc_storeStrong((id *)&self->_string, 0);

  objc_storeStrong((id *)&self->_schemes, 0);
}

@end