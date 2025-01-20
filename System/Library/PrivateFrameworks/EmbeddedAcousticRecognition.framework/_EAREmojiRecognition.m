@interface _EAREmojiRecognition
+ (void)initialize;
- (BOOL)isEmojiDisambiguationUsed;
- (BOOL)isEmojiPersonalizationUsed;
- (BOOL)isEmojiRecognitionCapable;
- (BOOL)isLocaleRTL;
- (BOOL)isValidEmoji:(id)a3;
- (_EAREmojiRecognition)initWithLanguage:(id)a3;
- (id)baseStringForEmojiString:(id)a3;
- (id)formatEmojiStrings:(id)a3;
- (id)formatEmojiStrings:(id)a3 isLogging:(BOOL)a4;
- (id)searchEmojiAlternativesForSpokenEmoji:(id)a3 count:(int64_t)a4 emojiCharacter:(id)a5;
- (void)dealloc;
- (void)didUseEmoji:(id)a3 replacementContext:(id)a4;
- (void)recognizeEmojisInInputString:(id)a3 enumerateUsingBlock:(id)a4;
- (void)resetEmojiMetrics;
- (void)resetEmojiPreferences;
@end

@implementation _EAREmojiRecognition

+ (void)initialize
{
  v3 = (EARLogger *)objc_opt_class();
  if (v3 == a1)
  {
    EARLogger::initializeLogging(v3);
  }
}

- (_EAREmojiRecognition)initWithLanguage:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_EAREmojiRecognition;
  v5 = [(_EAREmojiRecognition *)&v15 init];
  if (!v5) {
    goto LABEL_10;
  }
  if (v4
    && ([v4 stringByReplacingOccurrencesOfString:@"_" withString:@"-"],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        v4,
        v6))
  {
    uint64_t v7 = [MEMORY[0x1E4F61070] emojiLocaleDataWithLocaleIdentifier:v6];
    char v8 = 0;
    localeData = v5->_localeData;
    v5->_localeData = (EMFEmojiLocaleData *)v7;
    id v4 = (id)v6;
  }
  else
  {
    id v4 = 0;
    localeData = v5->_localeData;
    v5->_localeData = 0;
    char v8 = 1;
  }

  v5->_isLocaleRTL = [MEMORY[0x1E4F1CA20] characterDirectionForLanguage:v4] == 2;
  uint64_t v10 = (v8 & 1) != 0 ? 0 : CEMCreateEmojiLocaleData();
  v5->_cemlocaleRef = (__EmojiLocaleDataWrapper *)v10;
  *(_WORD *)&v5->_isEmojiPersonalizationUsed = 0;
  uint64_t v11 = [objc_alloc(MEMORY[0x1E4F61088]) _initWithoutConnection];
  preferences = v5->_preferences;
  v5->_preferences = (EMFEmojiPreferencesClient *)v11;

  [(EMFEmojiPreferencesClient *)v5->_preferences readEmojiDefaults];
  if (![(_EAREmojiRecognition *)v5 isEmojiRecognitionCapable]) {
    v13 = 0;
  }
  else {
LABEL_10:
  }
    v13 = v5;

  return v13;
}

- (void)dealloc
{
  cemlocaleRef = self->_cemlocaleRef;
  if (cemlocaleRef) {
    CFRelease(cemlocaleRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)_EAREmojiRecognition;
  [(_EAREmojiRecognition *)&v4 dealloc];
}

- (id)formatEmojiStrings:(id)a3
{
  v3 = [(_EAREmojiRecognition *)self formatEmojiStrings:a3 isLogging:0];
  return v3;
}

- (id)formatEmojiStrings:(id)a3 isLogging:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (+[_EARFeatureFlags isEmojiV2Enabled]) {
    goto LABEL_18;
  }
  if (v6) {
    objc_msgSend(v6, "ear_toString");
  }
  else {
    memset(&v20, 0, sizeof(v20));
  }
  std::string::basic_string[abi:ne180100]<0>(v18, "spokenemoji|");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  quasar::replaceFirst((uint64_t)&v20, (uint64_t *)v18, (uint64_t)__p);
  if (v17 < 0) {
    operator delete(__p[0]);
  }
  if (v19 < 0) {
    operator delete(v18[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "|");
  char v8 = (EARLogger *)quasar::splitAndTrimNoEmpty(&v20, (char *)__p, v18);
  if (v17 < 0) {
    operator delete(__p[0]);
  }
  if (v18[0] == v18[1])
  {
    v9 = EARLogger::QuasarOSLogger(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[_EAREmojiRecognition formatEmojiStrings:isLogging:](v9);
    }

    BOOL v10 = 0;
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v7 = objc_msgSend(NSString, "ear_stringWithStringView:");

    BOOL v10 = [(_EAREmojiRecognition *)self isValidEmoji:v7];
  }
  __p[0] = v18;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
  if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v20.__r_.__value_.__l.__data_);
    if (v10) {
      goto LABEL_18;
    }
LABEL_31:
    v14 = 0;
    goto LABEL_32;
  }
  if (!v10) {
    goto LABEL_31;
  }
LABEL_18:
  uint64_t v11 = [MEMORY[0x1E4F610A8] emojiTokenWithString:v7 localeData:self->_localeData];
  v12 = v11;
  if (v11)
  {
    if ([v11 supportsSkinToneVariants] && !a4)
    {
      uint64_t v13 = [(EMFEmojiPreferencesClient *)self->_preferences lastUsedVariantEmojiForEmoji:v12];

      if ([(EMFEmojiPreferencesClient *)self->_preferences hasLastUsedVariantForEmoji:v13]&& !self->_isEmojiPersonalizationUsed)
      {
        self->_isEmojiPersonalizationUsed = 1;
      }
      v12 = v13;
    }
    v14 = [v12 string];
  }
  else
  {
    v12 = EARLogger::QuasarOSLogger(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[_EAREmojiRecognition formatEmojiStrings:isLogging:](v12);
    }
    v14 = 0;
  }

LABEL_32:
  return v14;
}

- (void)didUseEmoji:(id)a3 replacementContext:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if ([(_EAREmojiRecognition *)self isValidEmoji:v8])
  {
    uint64_t v7 = [MEMORY[0x1E4F610A8] emojiTokenWithString:v8 localeData:self->_localeData];
    [(EMFEmojiPreferencesClient *)self->_preferences didUseEmoji:v7];
    [(EMFEmojiPreferencesClient *)self->_preferences _disconnect];
    [(EMFEmojiPreferencesClient *)self->_preferences didUseEmojiInDictation:v7 replacementContext:v6];
  }
}

- (void)resetEmojiPreferences
{
  preferences = self->_preferences;
  self->_preferences = 0;

  objc_super v4 = (EMFEmojiPreferencesClient *)[objc_alloc(MEMORY[0x1E4F61088]) _initWithoutConnection];
  v5 = self->_preferences;
  self->_preferences = v4;

  id v6 = self->_preferences;
  [(EMFEmojiPreferencesClient *)v6 readEmojiDefaults];
}

- (void)resetEmojiMetrics
{
  *(_WORD *)&self->_isEmojiPersonalizationUsed = 0;
}

- (id)baseStringForEmojiString:(id)a3
{
  id v4 = a3;
  if (([v4 _isSingleEmoji] & 1) != 0 && -[_EAREmojiRecognition isValidEmoji:](self, "isValidEmoji:", v4))
  {
    v5 = [MEMORY[0x1E4F610A8] emojiTokenWithString:v4 localeData:self->_localeData];
    id v6 = (void *)[v5 copyWithoutModifiers];
    id v7 = [v6 string];
  }
  else
  {
    id v7 = v4;
  }

  return v7;
}

- (BOOL)isEmojiRecognitionCapable
{
  if (self->_preferences)
  {
    v2 = [MEMORY[0x1E4F610A8] emojiTokenWithString:@"👍" localeData:self->_localeData];
    v3 = v2;
    if (v2)
    {
      id v4 = [v2 string];
      if ([v4 length])
      {
        v5 = [v3 string];
        char v6 = [v5 isEqualToString:@"👍"];
      }
      else
      {
        char v6 = 0;
      }
    }
    else
    {
      char v6 = 0;
    }
  }
  else
  {
    if (quasar::gLogLevel >= 4)
    {
      memset(v8, 0, sizeof(v8));
      kaldi::KaldiWarnMessage::KaldiWarnMessage((kaldi::KaldiWarnMessage *)v8);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)"Emoji Prefrences is nil", 23);
      quasar::QuasarInfoMessage::~QuasarInfoMessage((quasar::QuasarInfoMessage *)v8);
    }
    return 0;
  }
  return v6;
}

- (BOOL)isValidEmoji:(id)a3
{
  v3 = (const void *)CEMEmojiTokenCreateWithString();
  id v4 = v3;
  if (v3) {
    CFRelease(v3);
  }
  return v4 != 0;
}

- (id)searchEmojiAlternativesForSpokenEmoji:(id)a3 count:(int64_t)a4 emojiCharacter:(id)a5
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v37 = a3;
  id v38 = a5;
  id v41 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v8 = [(EMFEmojiLocaleData *)self->_localeData localeIdentifier];
  uint64_t v9 = [&unk_1F0A74158 objectForKey:v8];

  if (!v9)
  {
    uint64_t v9 = [&unk_1F0A74158 objectForKey:@"en-US"];
  }
  v36 = (void *)v9;
  BOOL v10 = [v37 stringByReplacingOccurrencesOfString:v9 withString:&stru_1F0A64AB0];
  uint64_t v11 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  v39 = [v10 stringByTrimmingCharactersInSet:v11];

  v42 = [(_EAREmojiRecognition *)self baseStringForEmojiString:v38];
  v40 = [(EMFEmojiLocaleData *)self->_localeData emojiTokensForText:v39 phoneticReading:0 options:17 searchType:2 includePrefixMatches:1];
  if (v40 && [v40 count])
  {
    v12 = [MEMORY[0x1E4F1CA48] array];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v13 = v40;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v51 objects:v57 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v52 != v15) {
            objc_enumerationMutation(v13);
          }
          id v17 = *(id *)(*((void *)&v51 + 1) + 8 * i);
          v18 = [v17 string];
          BOOL v19 = [(_EAREmojiRecognition *)self isValidEmoji:v18];

          if (v19)
          {
            std::string v20 = [v17 string];
            [v12 addObject:v20];
          }
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v51 objects:v57 count:16];
      }
      while (v14);
    }

    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    v21 = self->_frequentEmojis;
    uint64_t v22 = [(NSArray *)v21 countByEnumeratingWithState:&v47 objects:v56 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v48;
      while (2)
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v48 != v23) {
            objc_enumerationMutation(v21);
          }
          if (!a4)
          {
            id v33 = v41;

            goto LABEL_41;
          }
          v25 = *(void **)(*((void *)&v47 + 1) + 8 * j);
          if (([v25 isEqualToString:v42] & 1) == 0
            && [v12 containsObject:v25])
          {
            [v41 addObject:v25];
            --a4;
          }
        }
        uint64_t v22 = [(NSArray *)v21 countByEnumeratingWithState:&v47 objects:v56 count:16];
        if (v22) {
          continue;
        }
        break;
      }
    }

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v26 = v12;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v43 objects:v55 count:16];
    if (v27)
    {
      uint64_t v28 = *(void *)v44;
      while (2)
      {
        for (uint64_t k = 0; k != v27; ++k)
        {
          if (*(void *)v44 != v28) {
            objc_enumerationMutation(v26);
          }
          id v30 = *(id *)(*((void *)&v43 + 1) + 8 * k);
          v31 = v30;
          if (!a4)
          {

            goto LABEL_40;
          }
          if (([v30 isEqualToString:v42] & 1) == 0
            && ([v41 containsObject:v31] & 1) == 0)
          {
            [v41 addObject:v31];
            --a4;
          }
        }
        uint64_t v27 = [v26 countByEnumeratingWithState:&v43 objects:v55 count:16];
        if (v27) {
          continue;
        }
        break;
      }
    }
LABEL_40:

    id v34 = v41;
LABEL_41:
  }
  else
  {
    id v32 = v41;
  }

  return v41;
}

- (void)recognizeEmojisInInputString:(id)a3 enumerateUsingBlock:(id)a4
{
  id v6 = a4;
  localeData = self->_localeData;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73___EAREmojiRecognition_recognizeEmojisInInputString_enumerateUsingBlock___block_invoke;
  v9[3] = &unk_1E5FFFC80;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [(EMFEmojiLocaleData *)localeData enumerateAnchoredReplacementCandidatesForContext:a3 withOptions:0 usingBlock:v9];
}

- (BOOL)isEmojiPersonalizationUsed
{
  return self->_isEmojiPersonalizationUsed;
}

- (BOOL)isEmojiDisambiguationUsed
{
  return self->_isEmojiDisambiguationUsed;
}

- (BOOL)isLocaleRTL
{
  return self->_isLocaleRTL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frequentEmojis, 0);
  objc_storeStrong((id *)&self->_localeData, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
}

- (void)formatEmojiStrings:(os_log_t)log isLogging:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B1A86000, log, OS_LOG_TYPE_FAULT, "Cannot create EMFEmojiToken; Unable to connect to Emoji Foundation framework",
    v1,
    2u);
}

- (void)formatEmojiStrings:(os_log_t)log isLogging:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B1A86000, log, OS_LOG_TYPE_FAULT, "Cannot find emoji recognition candidate from emoji hammer", v1, 2u);
}

@end