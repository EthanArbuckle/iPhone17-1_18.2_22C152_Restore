@interface AXCharacterSoundMap
- (AXCharacterSoundMap)init;
- (NSMutableDictionary)phDictionaries;
- (id)_linguisticStringForCharacter:(id)a3 language:(id)a4 linguisticType:(int64_t)a5 andVoiceIdentifier:(id)a6;
- (id)phonemeStringForCharacter:(id)a3 forLanguage:(id)a4 andVoiceIdentifier:(id)a5;
- (id)phoneticStringForCharacter:(id)a3 forLanguage:(id)a4 andVoiceIdentifier:(id)a5;
- (void)setPhDictionaries:(id)a3;
@end

@implementation AXCharacterSoundMap

- (AXCharacterSoundMap)init
{
  v7.receiver = self;
  v7.super_class = (Class)AXCharacterSoundMap;
  v2 = [(AXCharacterSoundMap *)&v7 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    phDictionaries = v2->_phDictionaries;
    v2->_phDictionaries = v3;

    v5 = v2;
  }

  return v2;
}

- (id)phonemeStringForCharacter:(id)a3 forLanguage:(id)a4 andVoiceIdentifier:(id)a5
{
  return [(AXCharacterSoundMap *)self _linguisticStringForCharacter:a3 language:a4 linguisticType:1 andVoiceIdentifier:a5];
}

- (id)phoneticStringForCharacter:(id)a3 forLanguage:(id)a4 andVoiceIdentifier:(id)a5
{
  return [(AXCharacterSoundMap *)self _linguisticStringForCharacter:a3 language:a4 linguisticType:0 andVoiceIdentifier:a5];
}

- (id)_linguisticStringForCharacter:(id)a3 language:(id)a4 linguisticType:(int64_t)a5 andVoiceIdentifier:(id)a6
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = AXLanguageConvertToCanonicalForm(v11);
  v70 = v11;
  AXLanguageCanonicalFormToGeneralLanguage(v11);
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v14 isEqualToString:@"no"])
  {

    v14 = @"nb";
  }
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  int64_t v67 = a5;
  if (a5)
  {
    if (a5 != 1)
    {
      uint64_t v18 = 0;
      uint64_t v19 = 0;
      v16 = 0;
      goto LABEL_9;
    }
    v16 = @"AXPhonemes/";
    v17 = @"%@@phonemes";
  }
  else
  {
    v16 = @"AXPhonetics/";
    v17 = @"%@@phonetics";
  }
  uint64_t v18 = objc_msgSend(NSString, "stringWithFormat:", v17, v13);
  uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", v17, v14);
LABEL_9:
  uint64_t v20 = [(NSMutableDictionary *)self->_phDictionaries objectForKey:v18];
  v71 = v14;
  v68 = (void *)v18;
  v69 = v13;
  v65 = self;
  v66 = (void *)v19;
  if (v20
    || ([(NSMutableDictionary *)self->_phDictionaries objectForKey:v19],
        (uint64_t v20 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v21 = (void *)v20;
  }
  else
  {
    v38 = NSString;
    v39 = [v13 componentsSeparatedByString:@"-"];
    v40 = [v39 firstObject];
    v41 = [v13 componentsSeparatedByString:@"-"];
    v42 = [v41 lastObject];
    v43 = [v42 uppercaseString];
    uint64_t v44 = [v38 stringWithFormat:@"%@_%@", v40, v43];

    v45 = (void *)v44;
    v46 = (void *)AXSAccessibilityUtilitiesPath();
    v47 = [NSString stringWithFormat:@"%@.plist", v45];
    v48 = [(__CFString *)v16 stringByAppendingString:v47];
    v49 = [v46 stringByAppendingPathComponent:v48];

    uint64_t v50 = [MEMORY[0x1E4F1CA60] dictionaryWithContentsOfFile:v49];
    if (v50)
    {
      v21 = (void *)v50;
    }
    else
    {
      v64 = v45;
      v51 = (void *)AXSAccessibilityUtilitiesPath();
      v52 = [NSString stringWithFormat:@"%@.plist", v71];
      v53 = [(__CFString *)v16 stringByAppendingString:v52];
      v54 = [v51 stringByAppendingPathComponent:v53];

      uint64_t v55 = [MEMORY[0x1E4F1CA60] dictionaryWithContentsOfFile:v54];
      if (!v55)
      {
        v56 = [(__CFString *)v71 uppercaseString];
        uint64_t v57 = [(__CFString *)v71 stringByAppendingFormat:@"_%@", v56];

        v58 = (void *)AXSAccessibilityUtilitiesPath();
        v59 = [NSString stringWithFormat:@"%@.plist", v57];
        v60 = [(__CFString *)v16 stringByAppendingString:v59];
        v61 = [v58 stringByAppendingPathComponent:v60];

        v21 = [MEMORY[0x1E4F1CA60] dictionaryWithContentsOfFile:v61];

        v70 = (void *)v57;
        if (!v21) {
          goto LABEL_22;
        }
        goto LABEL_12;
      }
      v21 = (void *)v55;
      v49 = v54;
    }
  }
LABEL_12:
  id v62 = v12;
  id v63 = v10;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v22 = v21;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v72 objects:v76 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v73;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v73 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void *)(*((void *)&v72 + 1) + 8 * i);
        v28 = [v22 objectForKey:v27];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v29 = [v28 stringByReplacingOccurrencesOfString:@"_ESC_" withString:@"\x1B"];

          v28 = (void *)v29;
        }
        [v15 setObject:v28 forKey:v27];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v72 objects:v76 count:16];
    }
    while (v24);
  }

  id v12 = v62;
  id v10 = v63;
LABEL_22:
  [(NSMutableDictionary *)v65->_phDictionaries setObject:v15 forKey:v68];
  v30 = [v10 lowercaseString];
  v31 = [v15 objectForKey:v30];

  if (v67)
  {
    v32 = v31;
    v33 = v69;
    v34 = v71;
    if (v31) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  objc_opt_class();
  v33 = v69;
  v34 = v71;
  if (objc_opt_isKindOfClass())
  {
    v32 = [v31 objectForKey:v12];
    if (!v32)
    {
      v32 = [v31 objectForKey:@"default"];
    }
    v37 = [v31 objectForKey:@"ipa"];
    if (v37) {
      [v32 setIPASpeechPhonemes:v37];
    }

    if (!v32) {
      goto LABEL_24;
    }
  }
  else
  {
    v32 = v31;
    if (!v31)
    {
LABEL_24:
      v35 = [v10 uppercaseString];
      v32 = [v15 objectForKey:v35];
    }
  }
LABEL_25:

  return v32;
}

- (NSMutableDictionary)phDictionaries
{
  return self->_phDictionaries;
}

- (void)setPhDictionaries:(id)a3
{
}

- (void).cxx_destruct
{
}

@end