@interface EMFEmojiToken
+ (BOOL)supportsSecureCoding;
+ (id)emojiTokenWithCEMEmojiToken:(__EmojiTokenWrapper *)a3;
+ (id)emojiTokenWithLongCharacter:(unsigned int)a3 localeData:(id)a4;
+ (id)emojiTokenWithString:(id)a3 localeData:(id)a4;
+ (id)emojiTokensForCEMEmojiTokens:(__CFArray *)a3;
- (BOOL)_shouldHighlightEmoji;
- (BOOL)isCommon;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualIgnoringModifiers:(id)a3;
- (BOOL)isNewEmoji;
- (BOOL)isValid;
- (BOOL)supportsPresentationStyle:(int)a3;
- (BOOL)supportsSkinToneVariants;
- (EMFEmojiLocaleData)localeData;
- (EMFEmojiToken)initWithCEMEmojiToken:(__EmojiTokenWrapper *)a3;
- (EMFEmojiToken)initWithCoder:(id)a3;
- (EMFEmojiToken)initWithString:(id)a3 localeIdentifier:(id)a4;
- (NSArray)_skinToneVariantStrings;
- (NSArray)skinToneChooserVariants;
- (NSArray)skinToneSpecifiers;
- (NSArray)skinToneVariants;
- (NSString)_baseString;
- (NSString)localeIdentifier;
- (NSString)longFormEncodedStringVariantForMultiPersonGrouping;
- (NSString)shortFormEncodedStringVariantForMultiPersonGrouping;
- (NSString)string;
- (__EmojiTokenWrapper)emojiTokenRef;
- (id)copyWithPresentationStyle:(int)a3;
- (id)copyWithSkinToneVariant:(int)a3;
- (id)copyWithSkinToneVariantSpecifier:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyWithoutModifiers;
- (id)description;
- (id)nameForType:(int)a3;
- (id)relatedEmojiTokens:(unint64_t)a3;
- (int)gender;
- (int)presentationStyle;
- (int)skinTone;
- (unint64_t)hash;
- (unsigned)_emojiIndex;
- (void)_createEmojiTokenRefIfNecessary;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setLocaleIdentifier:(id)a3;
- (void)setString:(id)a3;
@end

@implementation EMFEmojiToken

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)emojiTokenWithCEMEmojiToken:(__EmojiTokenWrapper *)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithCEMEmojiToken:a3];
  return v3;
}

+ (id)emojiTokensForCEMEmojiTokens:(__CFArray *)a3
{
  if (a3)
  {
    CFIndex Count = CFArrayGetCount(a3);
    v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:Count];
    if (Count)
    {
      for (CFIndex i = 0; i != Count; ++i)
      {
        v7 = +[EMFEmojiToken emojiTokenWithCEMEmojiToken:CFArrayGetValueAtIndex(a3, i)];
        [v5 addObject:v7];
      }
    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)emojiTokenWithString:(id)a3 localeData:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)a1);
  v9 = [v6 localeIdentifier];

  v10 = (void *)[v8 initWithString:v7 localeIdentifier:v9];
  return v10;
}

+ (id)emojiTokenWithLongCharacter:(unsigned int)a3 localeData:(id)a4
{
  id v5 = a4;
  [v5 emojiLocaleDataRef];
  id v6 = (const void *)CEMEmojiTokenCreateWithLongCharacter();
  id v7 = [a1 emojiTokenWithCEMEmojiToken:v6];
  if (v6) {
    CFRelease(v6);
  }
  id v8 = [v5 localeIdentifier];
  [v7 setLocaleIdentifier:v8];

  return v7;
}

- (EMFEmojiToken)initWithCEMEmojiToken:(__EmojiTokenWrapper *)a3
{
  if (a3)
  {
    v13.receiver = self;
    v13.super_class = (Class)EMFEmojiToken;
    v4 = [(EMFEmojiToken *)&v13 init];
    if (v4)
    {
      v4->_emojiTokenRef = (__EmojiTokenWrapper *)CFRetain(a3);
      uint64_t v5 = [(id)CEMEmojiTokenGetString() copy];
      string = v4->_string;
      v4->_string = (NSString *)v5;

      id v7 = [(EMFEmojiToken *)v4 localeData];
      id v8 = v7;
      if (v7)
      {
        v9 = [v7 localeIdentifier];
        uint64_t v10 = [v9 copy];
        localeIdentifier = v4->_localeIdentifier;
        v4->_localeIdentifier = (NSString *)v10;
      }
    }
  }
  else
  {

    return 0;
  }
  return v4;
}

- (EMFEmojiToken)initWithString:(id)a3 localeIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    v15.receiver = self;
    v15.super_class = (Class)EMFEmojiToken;
    id v8 = [(EMFEmojiToken *)&v15 init];
    if (v8)
    {
      if (+[EMFStringUtilities _genderEmojiBaseStringNeedVariantSelector:v6])
      {
        uint64_t v9 = [v6 stringByAppendingString:@"️"];

        id v6 = (id)v9;
      }
      v8->_emojiTokenRef = 0;
      uint64_t v10 = [v6 copy];
      string = v8->_string;
      v8->_string = (NSString *)v10;

      uint64_t v12 = [v7 copy];
      localeIdentifier = v8->_localeIdentifier;
      v8->_localeIdentifier = (NSString *)v12;
    }
  }
  else
  {

    id v8 = 0;
  }

  return v8;
}

- (void)dealloc
{
  emojiTokenRef = self->_emojiTokenRef;
  if (emojiTokenRef) {
    CFRelease(emojiTokenRef);
  }
  self->_emojiTokenRef = 0;
  localeIdentifier = self->_localeIdentifier;
  self->_localeIdentifier = 0;

  string = self->_string;
  self->_string = 0;

  v6.receiver = self;
  v6.super_class = (Class)EMFEmojiToken;
  [(EMFEmojiToken *)&v6 dealloc];
}

- (id)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"<%@: %p", objc_opt_class(), self];
  v4 = [(EMFEmojiToken *)self string];
  [v3 appendFormat:@"; string = \"%@\"", v4];

  if (self->_localeIdentifier) {
    [v3 appendFormat:@"; locale = \"%@\"", self->_localeIdentifier];
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  emojiTokenRef = self->_emojiTokenRef;
  uint64_t v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  if (emojiTokenRef)
  {
    objc_super v6 = (void *)[v5 initWithCEMEmojiToken:self->_emojiTokenRef];
    uint64_t v7 = [(NSString *)self->_localeIdentifier copy];
    id v8 = (void *)v6[3];
    v6[3] = v7;

    return v6;
  }
  else
  {
    localeIdentifier = self->_localeIdentifier;
    string = self->_string;
    return (id)[v5 initWithString:string localeIdentifier:localeIdentifier];
  }
}

- (EMFEmojiToken)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"emojiString"];
  objc_super v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localeIdentifier"];

  uint64_t v7 = [(EMFEmojiToken *)self initWithString:v5 localeIdentifier:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(EMFEmojiToken *)self string];
  if (v4) {
    [v6 encodeObject:v4 forKey:@"emojiString"];
  }
  localeIdentifier = self->_localeIdentifier;
  if (localeIdentifier) {
    [v6 encodeObject:localeIdentifier forKey:@"localeIdentifier"];
  }
}

- (unint64_t)hash
{
  v2 = [(EMFEmojiToken *)self string];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)string
{
  string = self->_string;
  if (string)
  {
    unint64_t v3 = (void *)[(NSString *)string copy];
  }
  else
  {
    unint64_t v3 = CEMEmojiTokenGetString();
  }
  return (NSString *)v3;
}

- (NSString)_baseString
{
  v2 = [(EMFEmojiToken *)self string];
  unint64_t v3 = +[EMFStringUtilities _baseStringForEmojiString:v2];

  return (NSString *)v3;
}

- (void)_createEmojiTokenRefIfNecessary
{
  if (!self->_emojiTokenRef && self->_string && !self->_didFailCEM)
  {
    if (self->_localeIdentifier)
    {
      unint64_t v3 = (const void *)CEMCreateEmojiLocaleData();
      emojiTokenRef = (__EmojiTokenWrapper *)CEMEmojiTokenCreateWithString();
      self->_emojiTokenRef = emojiTokenRef;
      if (v3)
      {
        CFRelease(v3);
        emojiTokenRef = self->_emojiTokenRef;
      }
      if (!emojiTokenRef) {
        goto LABEL_11;
      }
    }
    else
    {
      uint64_t v5 = (__EmojiTokenWrapper *)CEMEmojiTokenCreateWithString();
      self->_emojiTokenRef = v5;
      if (!v5) {
LABEL_11:
      }
        self->_didFailCEM = 1;
    }
  }
}

- (__EmojiTokenWrapper)emojiTokenRef
{
  return self->_emojiTokenRef;
}

- (EMFEmojiLocaleData)localeData
{
  if (self->_emojiTokenRef)
  {
    v2 = +[EMFEmojiLocaleData emojiLocaleDataWithCEMEmojiLocaleData:CEMEmojiTokenGetLocaleData()];
  }
  else if (self->_localeIdentifier)
  {
    v2 = +[EMFEmojiLocaleData emojiLocaleDataWithLocaleIdentifier:](EMFEmojiLocaleData, "emojiLocaleDataWithLocaleIdentifier:");
  }
  else
  {
    v2 = 0;
  }
  return (EMFEmojiLocaleData *)v2;
}

- (BOOL)supportsSkinToneVariants
{
  return +[EMFStringUtilities _hasSkinToneVariantsForString:self->_string];
}

- (int)skinTone
{
  v2 = self;
  if ([(EMFEmojiToken *)v2 emojiTokenRef])
  {
    emojiTokenRef = v2->_emojiTokenRef;
    return MEMORY[0x1F4113C50](emojiTokenRef);
  }
  else
  {
    string = v2->_string;
    return +[EMFStringUtilities _skinToneForString:string];
  }
}

- (NSArray)skinToneSpecifiers
{
  return (NSArray *)+[EMFStringUtilities _skinToneSpecifiersForString:self->_string];
}

- (NSArray)skinToneChooserVariants
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if ([(EMFEmojiToken *)self supportsSkinToneVariants])
  {
    unint64_t v3 = [(EMFEmojiToken *)self string];
    id v4 = +[EMFStringUtilities _skinToneChooserVariantsForString:v3];

    id v18 = [MEMORY[0x1E4F1CA48] array];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    obuint64_t j = v4;
    uint64_t v19 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v19)
    {
      uint64_t v17 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(obj);
          }
          id v6 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
          long long v20 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          id v8 = v6;
          uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
          if (v9)
          {
            uint64_t v10 = v9;
            uint64_t v11 = *(void *)v21;
            do
            {
              for (uint64_t j = 0; j != v10; ++j)
              {
                if (*(void *)v21 != v11) {
                  objc_enumerationMutation(v8);
                }
                objc_super v13 = +[EMFEmojiToken emojiTokenWithString:*(void *)(*((void *)&v20 + 1) + 8 * j) localeData:0];
                v14 = [(EMFEmojiToken *)self localeIdentifier];
                [v13 setLocaleIdentifier:v14];

                [v7 addObject:v13];
              }
              uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
            }
            while (v10);
          }

          [v18 addObject:v7];
        }
        uint64_t v19 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v19);
    }
  }
  else
  {
    id v18 = (id)MEMORY[0x1E4F1CBF0];
  }
  return (NSArray *)v18;
}

- (NSArray)skinToneVariants
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([(EMFEmojiToken *)self supportsSkinToneVariants])
  {
    unint64_t v3 = [(EMFEmojiToken *)self string];
    id v4 = +[EMFStringUtilities _skinToneVariantsForString:v3];

    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = +[EMFEmojiToken emojiTokenWithString:localeData:](EMFEmojiToken, "emojiTokenWithString:localeData:", *(void *)(*((void *)&v14 + 1) + 8 * i), 0, (void)v14);
          uint64_t v12 = [(EMFEmojiToken *)self localeIdentifier];
          [v11 setLocaleIdentifier:v12];

          [v5 addObject:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return (NSArray *)v5;
}

- (NSArray)_skinToneVariantStrings
{
  if ([(EMFEmojiToken *)self supportsSkinToneVariants])
  {
    unint64_t v3 = [(EMFEmojiToken *)self string];
    id v4 = +[EMFStringUtilities _skinToneVariantsForString:v3];
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return (NSArray *)v4;
}

- (id)copyWithSkinToneVariant:(int)a3
{
  uint64_t v5 = [(EMFEmojiToken *)self string];
  id v6 = +[EMFStringUtilities _skinToneVariantsForString:v5];

  if (![v6 count] || (unint64_t)objc_msgSend(v6, "count") > 0x18) {
    goto LABEL_8;
  }
  if a3 <= 6 && ((0x7Bu >> a3))
  {
    uint64_t v7 = [v6 objectAtIndex:qword_1B8CA70B0[a3]];
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v8 = +[EMFEmojiToken emojiTokenWithString:v7 localeData:0];
  uint64_t v9 = [(EMFEmojiToken *)self localeIdentifier];
  [v8 setLocaleIdentifier:v9];

  if (!v8) {
LABEL_8:
  }
    uint64_t v8 = (void *)[(EMFEmojiToken *)self copy];

  return v8;
}

- (id)copyWithSkinToneVariantSpecifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4) {
    [v4 count];
  }
  if ([v5 count] == 1)
  {
    id v6 = [v5 objectAtIndex:0];
    uint64_t v7 = +[EMFStringUtilities _skinToneModifierFromSpecifierType:v6];

    id v8 = [(EMFEmojiToken *)self copyWithSkinToneVariant:v7];
    if (!v8) {
LABEL_8:
    }
      id v8 = (id)[(EMFEmojiToken *)self copy];
  }
  else
  {
    if ([v5 count] != 2) {
      goto LABEL_8;
    }
    uint64_t v9 = [(EMFEmojiToken *)self string];
    uint64_t v10 = +[EMFStringUtilities _multiPersonStringForString:v9 skinToneVariantSpecifier:v5];

    id v8 = +[EMFEmojiToken emojiTokenWithString:v10 localeData:0];
    uint64_t v11 = [(EMFEmojiToken *)self localeIdentifier];
    [v8 setLocaleIdentifier:v11];

    if (!v8) {
      goto LABEL_8;
    }
  }

  return v8;
}

- (NSString)longFormEncodedStringVariantForMultiPersonGrouping
{
  v2 = [(EMFEmojiToken *)self string];
  unint64_t v3 = +[EMFStringUtilities _normalizeMultiPersonGroupToLongFormEncoding:v2];

  return (NSString *)v3;
}

- (NSString)shortFormEncodedStringVariantForMultiPersonGrouping
{
  v2 = [(EMFEmojiToken *)self string];
  unint64_t v3 = +[EMFStringUtilities _normalizeMultiPersonGroupToShortFormEncoding:v2];

  return (NSString *)v3;
}

- (int)gender
{
  [(EMFEmojiToken *)self emojiTokenRef];
  return CEMEmojiTokenGetGender();
}

- (unsigned)_emojiIndex
{
  [(EMFEmojiToken *)self _createEmojiTokenRefIfNecessary];
  emojiTokenRef = self->_emojiTokenRef;
  if (emojiTokenRef)
  {
    LOWORD(emojiTokenRef) = MEMORY[0x1F4113C38]();
  }
  return (unsigned __int16)emojiTokenRef;
}

- (BOOL)isNewEmoji
{
  return 0;
}

- (BOOL)_shouldHighlightEmoji
{
  int v3 = MGGetBoolAnswer();
  if (v3)
  {
    LOBYTE(v3) = [(EMFEmojiToken *)self isNewEmoji];
  }
  return v3;
}

- (int)presentationStyle
{
  v2 = [(EMFEmojiToken *)self emojiTokenRef];
  return MEMORY[0x1F4113C48](v2);
}

- (BOOL)supportsPresentationStyle:(int)a3
{
  return CEMEmojiTokenSupportsPresentationStyle() != 0;
}

- (id)copyWithPresentationStyle:(int)a3
{
  [(EMFEmojiToken *)self emojiTokenRef];
  PresentationVariant = (const void *)CEMEmojiTokenCreatePresentationVariant();
  id v4 = [(id)objc_opt_class() emojiTokenWithCEMEmojiToken:PresentationVariant];
  if (PresentationVariant) {
    CFRelease(PresentationVariant);
  }
  return v4;
}

- (id)copyWithoutModifiers
{
  v2 = self;
  if ([(EMFEmojiToken *)v2 emojiTokenRef])
  {
    CopyRemovingModifiers = (const void *)CEMEmojiTokenCreateCopyRemovingModifiers();
    id v4 = [(id)objc_opt_class() emojiTokenWithCEMEmojiToken:CopyRemovingModifiers];
    if (CopyRemovingModifiers) {
      CFRelease(CopyRemovingModifiers);
    }
  }
  else
  {
    uint64_t v5 = [(EMFEmojiToken *)v2 _baseString];
    id v4 = +[EMFEmojiToken emojiTokenWithString:v5 localeData:0];

    id v6 = [(EMFEmojiToken *)v2 localeIdentifier];
    [v4 setLocaleIdentifier:v6];
  }
  return v4;
}

- (BOOL)isEqualIgnoringModifiers:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(EMFEmojiToken *)self _baseString];
  id v6 = [v4 _baseString];

  if (v5 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = [v5 isEqualToString:v6];
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(EMFEmojiToken *)self string];
    uint64_t v7 = [v5 string];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      id v8 = (void *)v7;
      uint64_t v9 = [(EMFEmojiToken *)self string];
      uint64_t v10 = [v5 string];
      int v11 = [v9 isEqualToString:v10];

      if (!v11)
      {
        char v12 = 0;
LABEL_11:

        goto LABEL_12;
      }
    }
    objc_super v13 = [(EMFEmojiToken *)self localeIdentifier];
    long long v14 = [v5 localeIdentifier];
    if (v13 == v14)
    {
      char v12 = 1;
    }
    else
    {
      long long v15 = [(EMFEmojiToken *)self localeIdentifier];
      long long v16 = [v5 localeIdentifier];
      char v12 = [v15 isEqualToString:v16];
    }
    goto LABEL_11;
  }
  char v12 = 0;
LABEL_12:

  return v12;
}

- (BOOL)isCommon
{
  return CEMEmojiTokenIsCommon() != 0;
}

- (id)relatedEmojiTokens:(unint64_t)a3
{
  [(EMFEmojiToken *)self emojiTokenRef];
  int v3 = (const void *)CEMEmojiTokenCopyRelatedEmoji();
  id v4 = [(id)objc_opt_class() emojiTokensForCEMEmojiTokens:v3];
  if (v3) {
    CFRelease(v3);
  }
  return v4;
}

- (id)nameForType:(int)a3
{
  [(EMFEmojiToken *)self emojiTokenRef];
  int v3 = (void *)CEMEmojiTokenCopyName();
  return v3;
}

- (BOOL)isValid
{
  v2 = [(EMFEmojiToken *)self string];
  BOOL v3 = CEMStringIsSingleEmoji() != 0;

  return v3;
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (void)setLocaleIdentifier:(id)a3
{
}

- (void)setString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
}

@end