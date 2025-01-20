@interface NSPersonNameComponentsFormatter
+ (BOOL)__contents:(id)a3 exclusivelyInCharacterSet:(USet *)a4;
+ (BOOL)__shortStyle:(int64_t)a3 isRestrictedForLocalization:(id)a4;
+ (BOOL)__shortStyle:(int64_t)a3 isRestrictedForScript:(unint64_t)a4;
+ (BOOL)__shortStyleRestrictionExistsForComponents:(id)a3 shortStyle:(int64_t)a4;
+ (BOOL)__shouldCacheFallbackToGivenNameInitialForAbbreviatedNameFormatFamilyNameOnly;
+ (BOOL)__shouldFallbackToGivenNameInitialForAbbreviatedNameFormatFamilyNameOnly;
+ (BOOL)__style:(int64_t)a3 isRestrictedForLocalization:(id)a4;
+ (BOOL)__style:(int64_t)a3 isRestrictedForScript:(unint64_t)a4;
+ (BOOL)_currentLocaleIsCJK;
+ (BOOL)_isCJKScript:(id)a3;
+ (BOOL)_isMixedScript:(id)a3;
+ (BOOL)_shortNameIsEnabled;
+ (BOOL)_shouldPreferNicknames;
+ (BOOL)isKatakana:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (NSString)_preferredLocalizationForCurrentLocale;
+ (NSString)localizedStringFromPersonNameComponents:(NSPersonNameComponents *)components style:(NSPersonNameComponentsFormatterStyle)nameFormatStyle options:(NSPersonNameComponentsFormatterOptions)nameOptions;
+ (SEL)__initialsCreatorForScript:(unint64_t)a3;
+ (USet)__getCharacterSetWithPattern:(id)a3;
+ (id)__characterSetWithPattern:(id)a3;
+ (id)__currentLocale;
+ (id)__familyNameFirstOrdering;
+ (id)__givenNameFirstOrdering;
+ (id)__initialsForString:(id)a3;
+ (id)__longestComponentFromComponents:(id)a3;
+ (id)__naiveDelimiterForCombinedNameString:(id)a3;
+ (id)__preferredLanguages;
+ (id)__scriptIdentifierFromIndex:(unint64_t)a3;
+ (id)__stringByStrippingNonInitialPunctuationFromString:(id)a3;
+ (id)__stringValueForShortStyle:(int64_t)a3;
+ (id)__stringValueForStyle:(int64_t)a3;
+ (id)__supportedNameDefaultsFromLocalization:(id)a3;
+ (id)__supportedScriptDefaultsFromScriptName:(id)a3;
+ (id)__thaiConsonantSet;
+ (id)_cjkLanguagesSet;
+ (id)_cjkLocaleIdentifiers;
+ (id)_fallbackDescriptorForStyle:(int64_t)a3 options:(unint64_t)a4;
+ (id)_formatterWithStyle:(int64_t)a3 options:(unint64_t)a4;
+ (id)_localizedDelimiterForComponents:(id)a3 options:(unint64_t)a4;
+ (id)_localizedShortNameForComponents:(id)a3 withStyle:(int64_t)a4 options:(unint64_t)a5;
+ (id)_preferredLocalizationFromLocale:(id)a3;
+ (id)_relevantKeyPathsForStyle:(int64_t)a3 options:(unint64_t)a4;
+ (id)_styleFormatterForStyle:(int64_t)a3 masterFormatter:(id)a4;
+ (id)arabicInitialsCreator;
+ (id)thaiInitialsCreator;
+ (id)tibetanInitialsCreator;
+ (id)westernInitialsCreator;
+ (int64_t)__abbreviatedNameFormatForPersonNameComponents:(id)a3;
+ (int64_t)__abbreviatedNameFormatForString:(id)a3;
+ (int64_t)__nameOrderForLocalization:(id)a3 usingNativeOrdering:(BOOL)a4;
+ (int64_t)__shortNameFormatForLocalization:(id)a3;
+ (int64_t)_defaultDisplayNameOrder;
+ (int64_t)_defaultShortNameFormat;
+ (int64_t)_nameOrderWithOverridesForComponents:(id)a3 options:(unint64_t)a4;
+ (unint64_t)__inferredScriptIndexForComponents:(id)a3;
+ (unint64_t)__inferredScriptIndexForComponents:(id)a3 ignoreUndeterminedComponents:(BOOL)a4;
+ (unint64_t)__inferredScriptIndexFromString:(id)a3;
+ (void)__registerDefaults;
+ (void)forEachExistingComponentWithComponents:(id)a3 performBlock:(id)a4;
- (BOOL)__localizedRestrictionExistsForComponents:(id)a3 ignoreUndeterminedComponents:(BOOL)a4;
- (BOOL)__localizedRestrictionExistsForShortStyle:(int64_t)a3;
- (BOOL)__localizedRestrictionExistsForStyle:(int64_t)a3;
- (BOOL)_forceFamilyNameFirst;
- (BOOL)_forceGivenNameFirst;
- (BOOL)_ignoresFallbacks;
- (BOOL)getObjectValue:(id *)obj forString:(NSString *)string errorDescription:(NSString *)error;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToFormatter:(id)a3;
- (BOOL)isPhonetic;
- (NSAttributedString)annotatedStringFromPersonNameComponents:(NSPersonNameComponents *)components;
- (NSLocale)_locale;
- (NSLocale)locale;
- (NSPersonNameComponents)personNameComponentsFromString:(NSString *)string;
- (NSPersonNameComponentsFormatter)init;
- (NSPersonNameComponentsFormatter)initWithCoder:(id)a3;
- (NSPersonNameComponentsFormatter)initWithData:(id)a3;
- (NSPersonNameComponentsFormatterStyle)style;
- (NSString)_preferredLocalizationForExplicitlySetLocale;
- (NSString)stringFromPersonNameComponents:(NSPersonNameComponents *)components;
- (id)copyWithZone:(_NSZone *)a3;
- (id)stringForObjectValue:(id)a3;
- (int64_t)__computedNameOrderForComponents:(id)a3;
- (int64_t)__computedShortNameFormat;
- (int64_t)__localizedNameOrderUsingNativeOrdering:(BOOL)a3;
- (int64_t)__localizedShortNameFormat;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)receiveObservedValue:(id)a3;
- (void)setLocale:(NSLocale *)locale;
- (void)setPhonetic:(BOOL)phonetic;
- (void)setStyle:(NSPersonNameComponentsFormatterStyle)style;
- (void)set_forceFamilyNameFirst:(BOOL)a3;
- (void)set_forceGivenNameFirst:(BOOL)a3;
- (void)set_ignoresFallbacks:(BOOL)a3;
- (void)set_locale:(id)a3;
@end

@implementation NSPersonNameComponentsFormatter

- (BOOL)__localizedRestrictionExistsForComponents:(id)a3 ignoreUndeterminedComponents:(BOOL)a4
{
  unint64_t v5 = +[NSPersonNameComponentsFormatter __inferredScriptIndexForComponents:a3 ignoreUndeterminedComponents:a4];
  NSPersonNameComponentsFormatterStyle v6 = [(NSPersonNameComponentsFormatter *)self style];

  return +[NSPersonNameComponentsFormatter __style:v6 isRestrictedForScript:v5];
}

- (NSPersonNameComponentsFormatterStyle)style
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  NSPersonNameComponentsFormatterStyle v4 = [self->_private style];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)isPhonetic
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = [v2->_private phonetic];
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

+ (BOOL)__style:(int64_t)a3 isRestrictedForLocalization:(id)a4
{
  NSPersonNameComponentsFormatterStyle v6 = objc_msgSend((id)objc_msgSend(a1, "__supportedNameDefaultsFromLocalization:", a4), "objectForKeyedSubscript:", @"styleRestrictions");
  uint64_t v7 = objc_msgSend(a1, "__stringValueForStyle:", a3);
  return v6 && [v6 objectForKeyedSubscript:v7] != 0;
}

+ (BOOL)__style:(int64_t)a3 isRestrictedForScript:(unint64_t)a4
{
  NSPersonNameComponentsFormatterStyle v6 = objc_msgSend((id)objc_msgSend(a1, "__supportedScriptDefaultsFromScriptName:", objc_msgSend(a1, "__scriptIdentifierFromIndex:", a4)), "objectForKeyedSubscript:", @"styleRestrictions");
  uint64_t v7 = objc_msgSend(a1, "__stringValueForStyle:", a3);
  return v6 && [v6 objectForKeyedSubscript:v7] != 0;
}

+ (id)__stringValueForStyle:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return 0;
  }
  else {
    return off_1E51FE908[a3];
  }
}

+ (id)__supportedScriptDefaultsFromScriptName:(id)a3
{
  if (!a3) {
    return 0;
  }
  NSPersonNameComponentsFormatterStyle v4 = (void *)[&unk_1ECABA410 objectForKeyedSubscript:@"scriptInfo"];

  return (id)[v4 objectForKeyedSubscript:a3];
}

+ (id)__scriptIdentifierFromIndex:(unint64_t)a3
{
  return +[NSOrthography _scriptNameForScriptIndex:a3];
}

+ (id)__supportedNameDefaultsFromLocalization:(id)a3
{
  NSPersonNameComponentsFormatterStyle v4 = (void *)[&unk_1ECAB9AB0 objectForKeyedSubscript:@"localeInfo"];

  return (id)[v4 objectForKeyedSubscript:a3];
}

- (BOOL)__localizedRestrictionExistsForStyle:(int64_t)a3
{
  NSPersonNameComponentsFormatterStyle v4 = [(NSPersonNameComponentsFormatter *)self _preferredLocalizationForExplicitlySetLocale];
  if (!v4) {
    NSPersonNameComponentsFormatterStyle v4 = +[NSPersonNameComponentsFormatter _preferredLocalizationForCurrentLocale];
  }

  return +[NSPersonNameComponentsFormatter __style:a3 isRestrictedForLocalization:v4];
}

- (int64_t)__computedNameOrderForComponents:(id)a3
{
  int v5 = [a3 _isEmpty];
  if (a3 && !v5)
  {
    if (!+[NSPersonNameComponentsFormatter _isCJKScript:a3])
    {
      if ([(NSPersonNameComponentsFormatter *)self _preferredLocalizationForExplicitlySetLocale])
      {
        int64_t result = +[NSPersonNameComponentsFormatter __nameOrderForLocalization:[(NSPersonNameComponentsFormatter *)self _preferredLocalizationForExplicitlySetLocale] usingNativeOrdering:1];
        if (result) {
          goto LABEL_8;
        }
      }
      if (![(NSPersonNameComponentsFormatter *)self _forceFamilyNameFirst])
      {
        if ([(NSPersonNameComponentsFormatter *)self _forceGivenNameFirst])
        {
          int64_t result = 1;
        }
        else
        {
          int64_t result = +[NSPersonNameComponentsFormatter _defaultDisplayNameOrder];
          if (!result) {
            int64_t result = [(NSPersonNameComponentsFormatter *)self __localizedNameOrderUsingNativeOrdering:0];
          }
        }
        goto LABEL_8;
      }
    }
    int64_t result = 2;
LABEL_8:
    if ((unint64_t)result <= 1) {
      return 1;
    }
    return result;
  }

  return [(NSPersonNameComponentsFormatter *)self __localizedNameOrderUsingNativeOrdering:1];
}

- (NSString)_preferredLocalizationForExplicitlySetLocale
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  NSPersonNameComponentsFormatterStyle v4 = (void *)[(NSString *)self->__preferredLocalizationForExplicitlySetLocale copy];
  os_unfair_lock_unlock(p_lock);

  return (NSString *)v4;
}

+ (BOOL)_isCJKScript:(id)a3
{
  NSPersonNameComponentsFormatterStyle v4 = (void *)[a3 _scriptDeterminingStringRepresentationWithPhoneticDesired:0];
  uint64_t v5 = [v4 length];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(a1, "__inferredScriptIndexFromString:", v4);
    id v7 = +[NSPersonNameComponentsFormatter _cjkLanguagesSet];
    v8 = +[NSNumber numberWithUnsignedInteger:v6];
    LOBYTE(v5) = [v7 containsObject:v8];
  }
  return v5;
}

+ (id)_cjkLanguagesSet
{
  if (qword_1EB1ED0D0 != -1) {
    dispatch_once(&qword_1EB1ED0D0, &__block_literal_global_367_0);
  }
  return (id)qword_1EB1ED0C8;
}

- (BOOL)_forceGivenNameFirst
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = [v2->_private forceGivenNameFirst];
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)_forceFamilyNameFirst
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = [v2->_private forceFamilyNameFirst];
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

+ (NSString)_preferredLocalizationForCurrentLocale
{
  if (qword_1EB1ED068 != -1) {
    dispatch_once(&qword_1EB1ED068, &__block_literal_global_327);
  }
  return (NSString *)qword_1EB1ED060;
}

+ (unint64_t)__inferredScriptIndexForComponents:(id)a3 ignoreUndeterminedComponents:(BOOL)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = +[NSPersonNameComponents _allComponents];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v19 count:16];
  if (!v8) {
    return 0;
  }
  uint64_t v9 = v8;
  unint64_t v10 = 0;
  uint64_t v11 = *(void *)v21;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v21 != v11) {
        objc_enumerationMutation(v7);
      }
      v13 = objc_msgSend(a1, "__stringByStrippingNonInitialPunctuationFromString:", objc_msgSend(a3, "valueForKeyPath:", *(void *)(*((void *)&v20 + 1) + 8 * i)));
      if (v13)
      {
        v14 = v13;
        if ([v13 length])
        {
          uint64_t v15 = objc_msgSend(a1, "__inferredScriptIndexFromString:", v14);
          BOOL v16 = v15 == 1 && a4;
          if (v15 && !v16)
          {
            if (v10 == v15 || v10 == 0) {
              unint64_t v10 = v15;
            }
            else {
              unint64_t v10 = 1;
            }
          }
        }
      }
    }
    uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v19 count:16];
  }
  while (v9);
  return v10;
}

+ (id)__stringByStrippingNonInitialPunctuationFromString:(id)a3
{
  if (qword_1EB1ED0C0 != -1) {
    dispatch_once(&qword_1EB1ED0C0, &__block_literal_global_362);
  }
  if (![a3 length]) {
    return a3;
  }
  if (![a3 rangeOfCharacterFromSet:qword_1EB1ED0B8] && v4 != 0) {
    return a3;
  }
  uint64_t v6 = (void *)[a3 componentsSeparatedByCharactersInSet:qword_1EB1ED0B8];

  return (id)[v6 componentsJoinedByString:&stru_1ECA5C228];
}

+ (unint64_t)__inferredScriptIndexFromString:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend((id)objc_msgSend(a1, "__stringByStrippingNonInitialPunctuationFromString:", a3), "stringByReplacingOccurrencesOfString:withString:", @" ", &stru_1ECA5C228);
  unint64_t v4 = [v3 length];
  MEMORY[0x1F4188790](v4);
  id v7 = (char *)v11 - v6;
  if (v8 > 0x100) {
    id v7 = (char *)malloc_type_malloc(2 * v5, 0x1000040BDFB0063uLL);
  }
  else {
    bzero((char *)v11 - v6, 2 * v5);
  }
  objc_msgSend(v3, "getCharacters:range:", v7, 0, objc_msgSend(v3, "length"));
  unint64_t v9 = NSOrthographyScriptIndexForCharacters((uint64_t)v7, [v3 length], 0);
  if (v4 >= 0x101) {
    free(v7);
  }
  return v9;
}

+ (BOOL)_shouldPreferNicknames
{
  objc_msgSend(a1, "__registerDefaults");
  if (_overriddenSettings
    && (v2 = (void *)[(id)_overriddenSettings objectForKeyedSubscript:@"NSPersonNameDefaultShouldPreferNicknamesPreference"]) != 0)
  {
    return [v2 BOOLValue];
  }
  else
  {
    unint64_t v4 = (void *)[MEMORY[0x1E4F1CB18] standardUserDefaults];
    return [v4 BOOLForKey:@"NSPersonNameDefaultShouldPreferNicknamesPreference"];
  }
}

+ (int64_t)_defaultDisplayNameOrder
{
  objc_msgSend(a1, "__registerDefaults");
  if (_overriddenSettings
    && (v2 = (void *)[(id)_overriddenSettings objectForKeyedSubscript:@"NSPersonNameDefaultDisplayNameOrder"]) != 0)
  {
    return [v2 integerValue];
  }
  else
  {
    unint64_t v4 = (void *)[MEMORY[0x1E4F1CB18] standardUserDefaults];
    return [v4 integerForKey:@"NSPersonNameDefaultDisplayNameOrder"];
  }
}

+ (void)__registerDefaults
{
  v2[5] = *MEMORY[0x1E4F143B8];
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __53__NSPersonNameComponentsFormatter___registerDefaults__block_invoke;
  v2[3] = &unk_1E51F71D0;
  v2[4] = a1;
  if (__registerDefaults_onceToken != -1) {
    dispatch_once(&__registerDefaults_onceToken, v2);
  }
}

+ (id)__givenNameFirstOrdering
{
  if (qword_1EB1ED090 != -1) {
    dispatch_once(&qword_1EB1ED090, &__block_literal_global_346_0);
  }
  return (id)qword_1EB1ED088;
}

- (NSString)stringFromPersonNameComponents:(NSPersonNameComponents *)components
{
  if (!components) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"NSPersonNameComponentsFormatter.m", 1749, @"Invalid parameter not satisfying: %@", @"components != nil" object file lineNumber description];
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"NSPersonNameComponentsFormatter.m", 1750, @"Invalid parameter not satisfying: %@", @"[components isKindOfClass:STATIC_CLASS_REF(NSPersonNameComponents)]" object file lineNumber description];
  }
  int64_t result = (NSString *)objc_msgSend(+[NSPersonNameComponentsFormatter _styleFormatterForStyle:masterFormatter:](NSPersonNameComponentsFormatter, "_styleFormatterForStyle:masterFormatter:", -[NSPersonNameComponentsFormatter style](self, "style"), self), "stringFromComponents:attributesByRange:", components, 0);
  if (!result)
  {
    if (qword_1EB1ED0E8 != -1) {
      dispatch_once(&qword_1EB1ED0E8, &__block_literal_global_1459);
    }
    if (byte_1EB1ED049) {
      return (NSString *)&stru_1ECA5C228;
    }
    else {
      return 0;
    }
  }
  return result;
}

+ (id)_styleFormatterForStyle:(int64_t)a3 masterFormatter:(id)a4
{
  unint64_t v4 = off_1E51F4780;
  switch(a3)
  {
    case 0:
    case 2:
      goto LABEL_7;
    case 1:
      unint64_t v4 = off_1E51F4788;
      goto LABEL_7;
    case 3:
      unint64_t v4 = off_1E51F4778;
      goto LABEL_7;
    case 4:
      unint64_t v4 = off_1E51F4748;
      goto LABEL_7;
    default:
      if (a3 != 31) {
        return 0;
      }
      unint64_t v4 = off_1E51F4750;
LABEL_7:
      uint64_t v5 = (void *)[objc_alloc(*v4) initWithMasterFormatter:a4];
      return v5;
  }
}

- (BOOL)_ignoresFallbacks
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = [v2->_private ignoresFallbacks];
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithData:", self->_private);
  uint64_t v7 = [self->_private locale];
  if (v7) {
    v6[2] = objc_msgSend(+[NSPersonNameComponentsFormatter _preferredLocalizationFromLocale:](NSPersonNameComponentsFormatter, "_preferredLocalizationFromLocale:", v7), "copy");
  }
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (NSPersonNameComponentsFormatter)initWithData:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)NSPersonNameComponentsFormatter;
  unint64_t v4 = [(NSPersonNameComponentsFormatter *)&v6 init];
  if (v4)
  {
    v4->_private = (id)[a3 copy];
    v4->_lock._os_unfair_lock_opaque = 0;
  }
  return v4;
}

- (int64_t)__computedShortNameFormat
{
  int64_t result = +[NSPersonNameComponentsFormatter _defaultShortNameFormat];
  if (!result)
  {
    return [(NSPersonNameComponentsFormatter *)self __localizedShortNameFormat];
  }
  return result;
}

+ (int64_t)_defaultShortNameFormat
{
  objc_msgSend(a1, "__registerDefaults");
  if (_overriddenSettings
    && (v2 = (void *)[(id)_overriddenSettings objectForKeyedSubscript:@"NSPersonNameDefaultShortNameFormat"]) != 0)
  {
    return [v2 integerValue];
  }
  else
  {
    unint64_t v4 = (void *)[MEMORY[0x1E4F1CB18] standardUserDefaults];
    return [v4 integerForKey:@"NSPersonNameDefaultShortNameFormat"];
  }
}

+ (BOOL)_isMixedScript:(id)a3
{
  return objc_msgSend(a1, "__inferredScriptIndexForComponents:", a3) == 1;
}

+ (BOOL)__shortStyleRestrictionExistsForComponents:(id)a3 shortStyle:(int64_t)a4
{
  unint64_t v5 = +[NSPersonNameComponentsFormatter __inferredScriptIndexForComponents:a3];

  return +[NSPersonNameComponentsFormatter __shortStyle:a4 isRestrictedForScript:v5];
}

+ (unint64_t)__inferredScriptIndexForComponents:(id)a3
{
  return objc_msgSend(a1, "__inferredScriptIndexForComponents:ignoreUndeterminedComponents:", a3, 0);
}

+ (BOOL)__shortStyle:(int64_t)a3 isRestrictedForScript:(unint64_t)a4
{
  objc_super v6 = objc_msgSend((id)objc_msgSend(a1, "__supportedScriptDefaultsFromScriptName:", objc_msgSend(a1, "__scriptIdentifierFromIndex:", a4)), "objectForKeyedSubscript:", @"shortStyleRestrictions");
  uint64_t v7 = objc_msgSend(a1, "__stringValueForShortStyle:", a3);
  if (v7) {
    LOBYTE(v7) = [v6 objectForKeyedSubscript:v7] != 0;
  }
  return v7;
}

+ (id)__stringValueForShortStyle:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return 0;
  }
  else {
    return off_1E51FE930[a3];
  }
}

uint64_t __57__NSPersonNameComponentsFormatter_westernInitialsCreator__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = [a2 rangeOfComposedCharacterSequenceAtIndex:0];

  return objc_msgSend(a2, "substringWithRange:", v4, v3);
}

NSCharacterSet *__86__NSPersonNameComponentsFormatter___stringByStrippingNonInitialPunctuationFromString___block_invoke()
{
  int64_t result = [+[NSCharacterSet letterCharacterSet] invertedSet];
  qword_1EB1ED0B8 = (uint64_t)result;
  return result;
}

+ (id)_preferredLocalizationFromLocale:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend((id)objc_msgSend(&unk_1ECAB9150, "objectForKeyedSubscript:", @"localeInfo"), "allKeys");
  v6[0] = [a3 localeIdentifier];
  return -[NSArray objectAtIndexedSubscript:](+[NSBundle preferredLocalizationsFromArray:forPreferences:](NSBundle, "preferredLocalizationsFromArray:forPreferences:", v4, [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1]), "objectAtIndexedSubscript:", 0);
}

id __73__NSPersonNameComponentsFormatter__preferredLocalizationForCurrentLocale__block_invoke()
{
  id result = +[NSPersonNameComponentsFormatter _preferredLocalizationFromLocale:](NSPersonNameComponentsFormatter, "_preferredLocalizationFromLocale:", [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale]);
  qword_1EB1ED060 = (uint64_t)result;
  return result;
}

uint64_t __53__NSPersonNameComponentsFormatter___registerDefaults__block_invoke(uint64_t a1)
{
  v8[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_preferredLocalizationFromLocale:", objc_msgSend(*(id *)(a1 + 32), "__currentLocale"));
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "__style:isRestrictedForLocalization:", 1, v2) ^ 1;
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "__shortNameFormatForLocalization:", v2);
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "__nameOrderForLocalization:usingNativeOrdering:", v2, 0);
  v8[0] = MEMORY[0x1E4F1CC38];
  v7[0] = @"NSPersonNameDefaultShouldPreferNicknamesPreference";
  v7[1] = @"NSPersonNameDefaultShortNameEnabled";
  v8[1] = +[NSNumber numberWithBool:v3];
  v7[2] = @"NSPersonNameDefaultShortNameFormat";
  v8[2] = +[NSNumber numberWithInteger:v4];
  v7[3] = @"NSPersonNameDefaultDisplayNameOrder";
  v8[3] = +[NSNumber numberWithInteger:v5];
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:4];
  return _CFXPreferencesRegisterDefaultValues();
}

+ (id)__currentLocale
{
  if (qword_1EB1ED058 != -1) {
    dispatch_once(&qword_1EB1ED058, &__block_literal_global_85);
  }
  return (id)qword_1EB1ED050;
}

+ (int64_t)__abbreviatedNameFormatForPersonNameComponents:(id)a3
{
  int64_t v5 = objc_msgSend(a1, "__abbreviatedNameFormatForString:", objc_msgSend(a3, "givenName"));
  int64_t v6 = objc_msgSend(a1, "__abbreviatedNameFormatForString:", objc_msgSend(a3, "familyName"));
  if (v6 != v5)
  {
    if (v5 == 6 || v6 == 2 || v6 == 4)
    {
      return v6;
    }
    else if (v6 != 6 && (v5 & 0xFFFFFFFFFFFFFFFDLL) != 1)
    {
      if (v6 == 3)
      {
        return 4;
      }
      else if (v6 == 5)
      {
        if (((v5 - 2) & 0xFFFFFFFFFFFFFFFDLL) != 0) {
          return 2;
        }
        else {
          return 6;
        }
      }
      else
      {
        return 2;
      }
    }
  }
  return v5;
}

+ (int64_t)__abbreviatedNameFormatForString:(id)a3
{
  if (![a3 length]) {
    return 6;
  }
  int64_t result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "__supportedScriptDefaultsFromScriptName:", objc_msgSend(a1, "__scriptIdentifierFromIndex:", objc_msgSend(a1, "__inferredScriptIndexFromString:", a3))), "objectForKeyedSubscript:", @"abbreviatedNameStyle"), "integerValue");
  if (!result) {
    return 5;
  }
  return result;
}

id __50__NSPersonNameComponentsFormatter___currentLocale__block_invoke()
{
  id result = (id)[MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  qword_1EB1ED050 = (uint64_t)result;
  return result;
}

+ (int64_t)__shortNameFormatForLocalization:(id)a3
{
  uint64_t v3 = objc_msgSend((id)objc_msgSend(a1, "__supportedNameDefaultsFromLocalization:", a3), "objectForKeyedSubscript:", @"shortNameStyle");

  return [v3 integerValue];
}

+ (int64_t)__nameOrderForLocalization:(id)a3 usingNativeOrdering:(BOOL)a4
{
  int64_t v5 = objc_msgSend(a1, "__supportedNameDefaultsFromLocalization:", a3);
  int64_t v6 = v5;
  if (a4 || (uint64_t v7 = (void *)[v5 objectForKeyedSubscript:@"nameOrderForNonNativeScripts"]) == 0) {
    uint64_t v7 = (void *)[v6 objectForKeyedSubscript:@"nameOrder"];
  }

  return [v7 integerValue];
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];

  preferredLocalizationForExplicitlySetLocale = self->__preferredLocalizationForExplicitlySetLocale;
  if (preferredLocalizationForExplicitlySetLocale)
  {

    self->__preferredLocalizationForExplicitlySetLocale = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)NSPersonNameComponentsFormatter;
  [(NSPersonNameComponentsFormatter *)&v4 dealloc];
}

- (void)setStyle:(NSPersonNameComponentsFormatterStyle)style
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [self->_private setStyle:style];

  os_unfair_lock_unlock(p_lock);
}

- (NSPersonNameComponentsFormatter)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)NSPersonNameComponentsFormatter;
  uint64_t v2 = [(NSPersonNameComponentsFormatter *)&v4 init];
  if (v2)
  {
    v2->_private = objc_alloc_init(_NSPersonNameComponentsFormatterData);
    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void)set_ignoresFallbacks:(BOOL)a3
{
  BOOL v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [self->_private setIgnoresFallbacks:v3];

  os_unfair_lock_unlock(p_lock);
}

+ (id)__initialsForString:(id)a3
{
  BOOL v3 = *(uint64_t (**)(void))(objc_msgSend(a1, "performSelector:", +[NSPersonNameComponentsFormatter __initialsCreatorForScript:](NSPersonNameComponentsFormatter, "__initialsCreatorForScript:", +[NSPersonNameComponentsFormatter __inferredScriptIndexFromString:](NSPersonNameComponentsFormatter, "__inferredScriptIndexFromString:")))+ 16);

  return (id)v3();
}

+ (id)westernInitialsCreator
{
  return &__block_literal_global_395;
}

+ (SEL)__initialsCreatorForScript:(unint64_t)a3
{
  BOOL v3 = (NSString *)objc_msgSend((id)objc_msgSend(a1, "__supportedScriptDefaultsFromScriptName:", objc_msgSend(a1, "__scriptIdentifierFromIndex:", a3)), "objectForKeyedSubscript:", @"initialsCreator");
  if (!v3) {
    return sel_westernInitialsCreator;
  }

  return NSSelectorFromString(v3);
}

+ (BOOL)_shortNameIsEnabled
{
  objc_msgSend(a1, "__registerDefaults");
  if (_overriddenSettings
    && (uint64_t v2 = (void *)[(id)_overriddenSettings objectForKeyedSubscript:@"NSPersonNameDefaultShortNameEnabled"]) != 0)
  {
    return [v2 BOOLValue];
  }
  else
  {
    objc_super v4 = (void *)[MEMORY[0x1E4F1CB18] standardUserDefaults];
    return [v4 BOOLForKey:@"NSPersonNameDefaultShortNameEnabled"];
  }
}

uint64_t __51__NSPersonNameComponentsFormatter__cjkLanguagesSet__block_invoke()
{
  uint64_t result = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", &off_1ECAB6098, &off_1ECAB60B0, &off_1ECAB60C8, &off_1ECAB60E0, 0);
  qword_1EB1ED0C8 = result;
  return result;
}

id __59__NSPersonNameComponentsFormatter___givenNameFirstOrdering__block_invoke()
{
  v1[5] = *MEMORY[0x1E4F143B8];
  v1[0] = @"namePrefix";
  v1[1] = @"givenName";
  v1[2] = @"middleName";
  v1[3] = @"familyName";
  v1[4] = @"nameSuffix";
  id result = (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v1 count:5];
  qword_1EB1ED088 = (uint64_t)result;
  return result;
}

- (void)receiveObservedValue:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"NSObservationFormatterSupport.m", 81, @"Invalid parameter not satisfying: %@", @"!value || [value isKindOfClass:STATIC_CLASS_REF(NSPersonNameComponents)]" object file lineNumber description];
    }
    v6.receiver = self;
    v6.super_class = (Class)NSPersonNameComponentsFormatter;
    [(NSPersonNameComponentsFormatter *)&v6 receiveObservedValue:[(NSPersonNameComponentsFormatter *)self stringFromPersonNameComponents:a3]];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)NSPersonNameComponentsFormatter;
    [(NSPersonNameComponentsFormatter *)&v7 receiveObservedValue:0];
  }
}

- (void)set_forceFamilyNameFirst:(BOOL)a3
{
  BOOL v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [self->_private setForceFamilyNameFirst:v3];

  os_unfair_lock_unlock(p_lock);
}

- (void)set_forceGivenNameFirst:(BOOL)a3
{
  BOOL v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [self->_private setForceGivenNameFirst:v3];

  os_unfair_lock_unlock(p_lock);
}

- (NSLocale)_locale
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_super v4 = (NSLocale *)[self->_private locale];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)set_locale:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [self->_private setLocale:a3];
  if (a3) {
    self->__preferredLocalizationForExplicitlySetLocale = (NSString *)objc_msgSend(+[NSPersonNameComponentsFormatter _preferredLocalizationFromLocale:](NSPersonNameComponentsFormatter, "_preferredLocalizationFromLocale:", a3), "copy");
  }

  os_unfair_lock_unlock(p_lock);
}

- (NSLocale)locale
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_super v4 = (void *)[self->_private locale];
  os_unfair_lock_unlock(p_lock);
  if (!v4) {
    objc_super v4 = (void *)[MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  }
  id v5 = v4;

  return (NSLocale *)v5;
}

- (void)setLocale:(NSLocale *)locale
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [self->_private setLocale:locale];
  if (locale) {
    self->__preferredLocalizationForExplicitlySetLocale = (NSString *)objc_msgSend(+[NSPersonNameComponentsFormatter _preferredLocalizationFromLocale:](NSPersonNameComponentsFormatter, "_preferredLocalizationFromLocale:", locale), "copy");
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)setPhonetic:(BOOL)phonetic
{
  BOOL v3 = phonetic;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [self->_private setPhonetic:v3];

  os_unfair_lock_unlock(p_lock);
}

+ (id)__preferredLanguages
{
  return (id)[MEMORY[0x1E4F1CA20] preferredLanguages];
}

+ (BOOL)__shouldCacheFallbackToGivenNameInitialForAbbreviatedNameFormatFamilyNameOnly
{
  return 1;
}

+ (BOOL)__shouldFallbackToGivenNameInitialForAbbreviatedNameFormatFamilyNameOnly
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  objc_super v4 = __107__NSPersonNameComponentsFormatter___shouldFallbackToGivenNameInitialForAbbreviatedNameFormatFamilyNameOnly__block_invoke;
  id v5 = &unk_1E51F71D0;
  id v6 = a1;
  if (objc_msgSend(a1, "__shouldCacheFallbackToGivenNameInitialForAbbreviatedNameFormatFamilyNameOnly", MEMORY[0x1E4F143A8], 3221225472))
  {
    if (qword_1EB1ED070 != -1) {
      dispatch_once(&qword_1EB1ED070, &v3);
    }
  }
  else
  {
    v4((uint64_t)&v3);
  }
  return _MergedGlobals_7_2;
}

uint64_t __107__NSPersonNameComponentsFormatter___shouldFallbackToGivenNameInitialForAbbreviatedNameFormatFamilyNameOnly__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  _MergedGlobals_7_2 = 0;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v1 = objc_msgSend(*(id *)(a1 + 32), "__preferredLanguages");
  uint64_t result = [v1 countByEnumeratingWithState:&v9 objects:v8 count:16];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)v10;
    uint64_t v5 = *MEMORY[0x1E4F1C438];
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v10 != v4) {
        objc_enumerationMutation(v1);
      }
      uint64_t v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA20], "componentsFromLocaleIdentifier:", *(void *)(*((void *)&v9 + 1) + 8 * v6)), "objectForKey:", v5);
      uint64_t result = [v7 isEqualToString:@"ja"];
      if (result) {
        break;
      }
      uint64_t result = [v7 isEqualToString:@"zh"];
      if (result)
      {
        _MergedGlobals_7_2 = 1;
        return result;
      }
      if (v3 == ++v6)
      {
        uint64_t result = [v1 countByEnumeratingWithState:&v9 objects:v8 count:16];
        uint64_t v3 = result;
        if (result) {
          goto LABEL_3;
        }
        return result;
      }
    }
  }
  return result;
}

+ (id)_formatterWithStyle:(int64_t)a3 options:(unint64_t)a4
{
  id v6 = objc_alloc_init((Class)a1);
  [v6 setStyle:a3];
  [v6 setPhonetic:(a4 >> 1) & 1];
  objc_msgSend(v6, "set_forceFamilyNameFirst:", (a4 >> 30) & 1);
  objc_msgSend(v6, "set_forceGivenNameFirst:", (a4 >> 31) & 1);
  return v6;
}

+ (NSString)localizedStringFromPersonNameComponents:(NSPersonNameComponents *)components style:(NSPersonNameComponentsFormatterStyle)nameFormatStyle options:(NSPersonNameComponentsFormatterOptions)nameOptions
{
  if (!components) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, a1, @"NSPersonNameComponentsFormatter.m", 1712, @"Invalid parameter not satisfying: %@", @"components != nil" object file lineNumber description];
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, a1, @"NSPersonNameComponentsFormatter.m", 1713, @"Invalid parameter not satisfying: %@", @"[components isKindOfClass:STATIC_CLASS_REF(NSPersonNameComponents)]" object file lineNumber description];
  }
  long long v10 = (void *)[a1 _formatterWithStyle:nameFormatStyle options:nameOptions];

  return (NSString *)[v10 stringFromPersonNameComponents:components];
}

+ (id)__familyNameFirstOrdering
{
  if (qword_1EB1ED080 != -1) {
    dispatch_once(&qword_1EB1ED080, &__block_literal_global_344_0);
  }
  return (id)qword_1EB1ED078;
}

id __60__NSPersonNameComponentsFormatter___familyNameFirstOrdering__block_invoke()
{
  v1[5] = *MEMORY[0x1E4F143B8];
  v1[0] = @"namePrefix";
  v1[1] = @"familyName";
  v1[2] = @"givenName";
  v1[3] = @"middleName";
  v1[4] = @"nameSuffix";
  id result = (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v1 count:5];
  qword_1EB1ED078 = (uint64_t)result;
  return result;
}

- (id)stringForObjectValue:(id)a3
{
  if (!a3 || (objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }

  return [(NSPersonNameComponentsFormatter *)self stringFromPersonNameComponents:a3];
}

- (NSAttributedString)annotatedStringFromPersonNameComponents:(NSPersonNameComponents *)components
{
  if (!components) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"NSPersonNameComponentsFormatter.m", 1763, @"Invalid parameter not satisfying: %@", @"components != nil" object file lineNumber description];
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"NSPersonNameComponentsFormatter.m", 1764, @"Invalid parameter not satisfying: %@", @"[components isKindOfClass:STATIC_CLASS_REF(NSPersonNameComponents)]" object file lineNumber description];
  }
  id result = (NSAttributedString *)objc_msgSend(+[NSPersonNameComponentsFormatter _styleFormatterForStyle:masterFormatter:](NSPersonNameComponentsFormatter, "_styleFormatterForStyle:masterFormatter:", -[NSPersonNameComponentsFormatter style](self, "style"), self), "annotatedStringFromPersonNameComponents:", components);
  if (!result)
  {
    if (qword_1EB1ED0E8 != -1) {
      dispatch_once(&qword_1EB1ED0E8, &__block_literal_global_1459);
    }
    if (byte_1EB1ED049)
    {
      uint64_t v7 = [[NSAttributedString alloc] initWithString:&stru_1ECA5C228];
      return v7;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

+ (void)forEachExistingComponentWithComponents:(id)a3 performBlock:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = +[NSPersonNameComponents _allComponents];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          long long v12 = (void *)[a3 valueForKeyPath:v11];
          if ([v12 length]) {
            (*((void (**)(id, uint64_t, void *))a4 + 2))(a4, v11, v12);
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v16 count:16];
      }
      while (v8);
    }
  }
  else
  {
    uint64_t v15 = +[NSAssertionHandler currentHandler];
    [(NSAssertionHandler *)v15 handleFailureInMethod:a2 object:a1 file:@"NSPersonNameComponentsFormatter.m" lineNumber:1808 description:@"block to perform should not be nil"];
  }
}

+ (BOOL)isKatakana:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  uint64_t v8 = __46__NSPersonNameComponentsFormatter_isKatakana___block_invoke;
  uint64_t v9 = &unk_1E51F71D0;
  id v10 = a1;
  if (qword_1EB1ED0A0 != -1) {
    dispatch_once(&qword_1EB1ED0A0, &v6);
  }
  return objc_msgSend(a1, "__contents:exclusivelyInCharacterSet:", a3, qword_1EB1ED098, v6, v7, v8, v9, v10, v11);
}

uint64_t __46__NSPersonNameComponentsFormatter_isKatakana___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "__getCharacterSetWithPattern:", @"[:scx=Kana:]");
  qword_1EB1ED098 = result;
  return result;
}

+ (id)__thaiConsonantSet
{
  v3[5] = *MEMORY[0x1E4F143B8];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__NSPersonNameComponentsFormatter___thaiConsonantSet__block_invoke;
  v3[3] = &unk_1E51F71D0;
  v3[4] = a1;
  if (qword_1EB1ED0B0 != -1) {
    dispatch_once(&qword_1EB1ED0B0, v3);
  }
  return (id)qword_1EB1ED0A8;
}

id __53__NSPersonNameComponentsFormatter___thaiConsonantSet__block_invoke(uint64_t a1)
{
  id result = (id)objc_msgSend(*(id *)(a1 + 32), "__characterSetWithPattern:", @"[กขฃคฅฆงจฉชซฌญฎฏฐฑฒณดตถทธนบปผฝพฟภมยรลวศษสหฬอฮ]");
  qword_1EB1ED0A8 = (uint64_t)result;
  return result;
}

+ (id)__characterSetWithPattern:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3052000000;
  long long v17 = __Block_byref_object_copy__33;
  long long v18 = __Block_byref_object_dispose__33;
  uint64_t v19 = 0;
  uint64_t v11 = __61__NSPersonNameComponentsFormatter___characterSetWithPattern___block_invoke;
  long long v12 = &unk_1E51FE850;
  uint64_t v13 = &v14;
  CFIndex v4 = objc_msgSend(a3, "length", MEMORY[0x1E4F143A8], 3221225472);
  CharactersPtr = CFStringGetCharactersPtr((CFStringRef)a3);
  if (CharactersPtr)
  {
    ((void (*)(uint64_t *, const UniChar *, CFIndex))v11)(&v10, CharactersPtr, v4);
  }
  else
  {
    unint64_t v6 = 2 * v4;
    if ((unint64_t)(2 * v4) < 0x101)
    {
      if (v4)
      {
        MEMORY[0x1F4188790](0);
        uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
        bzero(v7, 2 * v4);
      }
      else
      {
        uint64_t v7 = 0;
      }
    }
    else
    {
      uint64_t v7 = (char *)malloc_type_malloc(2 * v4, 0x1000040BDFB0063uLL);
    }
    v21.location = 0;
    v21.length = v4;
    CFStringGetCharacters((CFStringRef)a3, v21, (UniChar *)v7);
    ((void (*)(uint64_t *, char *, CFIndex))v11)(&v10, v7, v4);
    if (v6 >= 0x101) {
      free(v7);
    }
  }
  id v8 = (id)v15[5];
  _Block_object_dispose(&v14, 8);
  return v8;
}

uint64_t __61__NSPersonNameComponentsFormatter___characterSetWithPattern___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = _CFCreateCharacterSetFromUSet();
  return uset_close();
}

+ (USet)__getCharacterSetWithPattern:(id)a3
{
  CFStringRef v3 = (const __CFString *)a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  if (a3)
  {
    uint64_t v10 = __64__NSPersonNameComponentsFormatter___getCharacterSetWithPattern___block_invoke;
    uint64_t v11 = &unk_1E51FE850;
    long long v12 = &v13;
    CFIndex v4 = objc_msgSend(a3, "length", MEMORY[0x1E4F143A8], 3221225472);
    CharactersPtr = CFStringGetCharactersPtr(v3);
    if (CharactersPtr)
    {
      ((void (*)(uint64_t *, const UniChar *, CFIndex))v10)(&v9, CharactersPtr, v4);
    }
    else
    {
      unint64_t v6 = 2 * v4;
      if ((unint64_t)(2 * v4) < 0x101)
      {
        if (v4)
        {
          MEMORY[0x1F4188790](0);
          uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
          bzero(v7, 2 * v4);
        }
        else
        {
          uint64_t v7 = 0;
        }
      }
      else
      {
        uint64_t v7 = (char *)malloc_type_malloc(2 * v4, 0x1000040BDFB0063uLL);
      }
      v18.location = 0;
      v18.length = v4;
      CFStringGetCharacters(v3, v18, (UniChar *)v7);
      ((void (*)(uint64_t *, char *, CFIndex))v10)(&v9, v7, v4);
      if (v6 >= 0x101) {
        free(v7);
      }
    }
    CFStringRef v3 = (const __CFString *)v14[3];
  }
  _Block_object_dispose(&v13, 8);
  return (USet *)v3;
}

uint64_t __64__NSPersonNameComponentsFormatter___getCharacterSetWithPattern___block_invoke(uint64_t a1)
{
  uint64_t result = uset_openPattern();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

+ (BOOL)__contents:(id)a3 exclusivelyInCharacterSet:(USet *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!a3 || ![a3 length]) {
    return 1;
  }
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  uint64_t v14 = __72__NSPersonNameComponentsFormatter___contents_exclusivelyInCharacterSet___block_invoke;
  uint64_t v15 = &unk_1E51FE878;
  uint64_t v16 = &v18;
  uint64_t v17 = a4;
  CFIndex v6 = [a3 length];
  CharactersPtr = CFStringGetCharactersPtr((CFStringRef)a3);
  if (CharactersPtr)
  {
    ((void (*)(void *, const UniChar *, CFIndex))v14)(v13, CharactersPtr, v6);
  }
  else
  {
    unint64_t v9 = 2 * v6;
    if ((unint64_t)(2 * v6) < 0x101)
    {
      if (v6)
      {
        MEMORY[0x1F4188790](0);
        uint64_t v10 = (char *)&v13[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
        bzero(v10, 2 * v6);
      }
      else
      {
        uint64_t v10 = 0;
      }
    }
    else
    {
      uint64_t v10 = (char *)malloc_type_malloc(2 * v6, 0x1000040BDFB0063uLL);
    }
    v23.location = 0;
    v23.length = v6;
    CFStringGetCharacters((CFStringRef)a3, v23, (UniChar *)v10);
    ((void (*)(void *, char *, CFIndex))v14)(v13, v10, v6);
    if (v9 >= 0x101) {
      free(v10);
    }
  }
  BOOL v8 = *((unsigned char *)v19 + 24) != 0;
  _Block_object_dispose(&v18, 8);
  return v8;
}

uint64_t __72__NSPersonNameComponentsFormatter___contents_exclusivelyInCharacterSet___block_invoke(uint64_t a1)
{
  uint64_t result = uset_containsAllCodePoints();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result != 0;
  return result;
}

+ (id)__longestComponentFromComponents:(id)a3
{
  v12[4] = *MEMORY[0x1E4F143B8];
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v12[3] = 0;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  unint64_t v9 = __Block_byref_object_copy__33;
  uint64_t v10 = __Block_byref_object_dispose__33;
  uint64_t v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__NSPersonNameComponentsFormatter___longestComponentFromComponents___block_invoke;
  v5[3] = &unk_1E51FE8A0;
  v5[4] = v12;
  v5[5] = &v6;
  [a1 forEachExistingComponentWithComponents:a3 performBlock:v5];
  CFStringRef v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(v12, 8);
  return v3;
}

unint64_t __68__NSPersonNameComponentsFormatter___longestComponentFromComponents___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t result = [a3 length];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  if (result > *(void *)(v6 + 24))
  {
    *(void *)(v6 + 24) = result;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = a3;
  }
  return result;
}

+ (id)__naiveDelimiterForCombinedNameString:(id)a3
{
  if ((unint64_t)(objc_msgSend(a1, "__inferredScriptIndexFromString:") - 2) > 3) {
    return @" ";
  }
  if ([a1 isKatakana:a3]) {
    return @"・";
  }
  return &stru_1ECA5C228;
}

+ (id)_cjkLocaleIdentifiers
{
  if (qword_1EB1ED0E0 != -1) {
    dispatch_once(&qword_1EB1ED0E0, &__block_literal_global_376);
  }
  return (id)qword_1EB1ED0D8;
}

uint64_t __56__NSPersonNameComponentsFormatter__cjkLocaleIdentifiers__block_invoke()
{
  uint64_t result = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"ja", @"zh", @"ko", 0);
  qword_1EB1ED0D8 = result;
  return result;
}

+ (BOOL)_currentLocaleIsCJK
{
  id v3 = +[NSPersonNameComponentsFormatter __currentLocale];
  uint64_t v4 = [v3 objectForKey:*MEMORY[0x1E4F1C438]];
  uint64_t v5 = (void *)[a1 _cjkLocaleIdentifiers];

  return [v5 containsObject:v4];
}

- (BOOL)__localizedRestrictionExistsForShortStyle:(int64_t)a3
{
  uint64_t v4 = [(NSPersonNameComponentsFormatter *)self _preferredLocalizationForExplicitlySetLocale];
  if (!v4) {
    uint64_t v4 = +[NSPersonNameComponentsFormatter _preferredLocalizationForCurrentLocale];
  }

  return +[NSPersonNameComponentsFormatter __shortStyle:a3 isRestrictedForLocalization:v4];
}

- (int64_t)__localizedNameOrderUsingNativeOrdering:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = [(NSPersonNameComponentsFormatter *)self _preferredLocalizationForExplicitlySetLocale];
  if (!v4) {
    uint64_t v4 = +[NSPersonNameComponentsFormatter _preferredLocalizationForCurrentLocale];
  }

  return +[NSPersonNameComponentsFormatter __nameOrderForLocalization:v4 usingNativeOrdering:v3];
}

- (int64_t)__localizedShortNameFormat
{
  uint64_t v2 = [(NSPersonNameComponentsFormatter *)self _preferredLocalizationForExplicitlySetLocale];
  if (!v2) {
    uint64_t v2 = +[NSPersonNameComponentsFormatter _preferredLocalizationForCurrentLocale];
  }

  return +[NSPersonNameComponentsFormatter __shortNameFormatForLocalization:v2];
}

+ (int64_t)_nameOrderWithOverridesForComponents:(id)a3 options:(unint64_t)a4
{
  uint64_t v5 = (void *)[a1 _formatterWithStyle:0 options:a4];

  return [v5 _nameOrderWithOverridesForComponents:a3];
}

+ (id)_localizedDelimiterForComponents:(id)a3 options:(unint64_t)a4
{
  uint64_t v5 = [a3 _scriptDeterminingStringRepresentationWithPhoneticDesired:(a4 >> 1) & 1];

  return (id)objc_msgSend(a1, "__naiveDelimiterForCombinedNameString:", v5);
}

+ (id)_relevantKeyPathsForStyle:(int64_t)a3 options:(unint64_t)a4
{
  id v4 = +[NSPersonNameComponentsFormatter _styleFormatterForStyle:masterFormatter:](NSPersonNameComponentsFormatter, "_styleFormatterForStyle:masterFormatter:", a3, [a1 _formatterWithStyle:a3 options:a4]);

  return (id)[v4 orderedKeysOfInterest];
}

+ (id)_fallbackDescriptorForStyle:(int64_t)a3 options:(unint64_t)a4
{
  id v4 = +[NSPersonNameComponentsFormatter _styleFormatterForStyle:masterFormatter:](NSPersonNameComponentsFormatter, "_styleFormatterForStyle:masterFormatter:", a3, [a1 _formatterWithStyle:a3 options:a4]);

  return (id)[v4 fallbackDescriptor];
}

- (NSPersonNameComponents)personNameComponentsFromString:(NSString *)string
{
  v4[1] = *MEMORY[0x1E4F143B8];
  if (!string) {
    return 0;
  }
  v4[0] = 0;
  if ([(NSPersonNameComponentsFormatter *)self getObjectValue:v4 forString:string errorDescription:0])
  {
    return (NSPersonNameComponents *)v4[0];
  }
  else
  {
    return 0;
  }
}

- (BOOL)getObjectValue:(id *)obj forString:(NSString *)string errorDescription:(NSString *)error
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v10 = (void *)*((void *)self->_private + 4);
  if (!v10)
  {
    NPNameParserClass = (objc_class *)getNPNameParserClass();
    if (!NPNameParserClass) {
      goto LABEL_8;
    }
    *((void *)self->_private + 4) = objc_alloc_init(NPNameParserClass);
    uint64_t v10 = (void *)*((void *)self->_private + 4);
  }
  os_unfair_lock_unlock(p_lock);
  long long v12 = (void *)[v10 personNameComponentsFromString:string];
  if (!v12)
  {
LABEL_8:
    if (!error) {
      return 0;
    }
    uint64_t v14 = (NSString *)[(id)_NSFoundationBundle() localizedStringForKey:@"Person's name could not be detected" value:&stru_1ECA5C228 table:@"Formatter"];
    BOOL result = 0;
    *error = v14;
    return result;
  }
  if (obj) {
    *obj = v12;
  }
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSPersonNameComponentsFormatter)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    uint64_t v8 = +[NSString stringWithFormat:@"%@ cannot be decoded by non-keyed archivers", objc_opt_class()];

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v8 userInfo:0]);
  }
  uint64_t v5 = -[NSPersonNameComponentsFormatter initWithData:](self, "initWithData:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NS.nameComponentsFormatterPrivate"]);
  uint64_t v6 = [v5->_private locale];
  if (v6) {
    v5->__preferredLocalizationForExplicitlySetLocale = (NSString *)objc_msgSend(+[NSPersonNameComponentsFormatter _preferredLocalizationFromLocale:](NSPersonNameComponentsFormatter, "_preferredLocalizationFromLocale:", v6), "copy");
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSPersonNameComponents cannot be encoded by non-keyed archivers" userInfo:0]);
  }
  os_unfair_lock_lock(&self->_lock);
  [a3 encodeObject:self->_private forKey:@"NS.nameComponentsFormatterPrivate"];

  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)isEqual:(id)a3
{
  return self == a3 || -[NSPersonNameComponentsFormatter isEqualToFormatter:](self, "isEqualToFormatter:");
}

- (BOOL)isEqualToFormatter:(id)a3
{
  if (!a3 || (objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  os_unfair_lock_lock(&self->_lock);
  BOOL v5 = -[_NSPersonNameComponentsFormatterData isEqualToFormatterData:](self->_private, *((void **)a3 + 1));
  os_unfair_lock_unlock(&self->_lock);
  return v5;
}

+ (id)_localizedShortNameForComponents:(id)a3 withStyle:(int64_t)a4 options:(unint64_t)a5
{
  if (!a3) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:a1 file:@"NSPersonNameComponentsFormatter.m" lineNumber:2298 description:@"Components should not be nil"];
  }
  unint64_t v9 = -[_NSPersonNameComponentsStyleFormatterShort initWithMasterFormatter:]([_NSPersonNameComponentsStyleFormatterShort alloc], "initWithMasterFormatter:", [a1 _formatterWithStyle:1 options:a5]);
  [(_NSPersonNameComponentsStyleFormatterShort *)v9 setShortNameFormat:a4];
  [(_NSPersonNameComponentsStyleFormatterShort *)v9 setForceShortNameEnabled:1];

  return [(_NSPersonNameComponentsStyleFormatter *)v9 stringFromComponents:a3 attributesByRange:0];
}

+ (id)thaiInitialsCreator
{
  return &__block_literal_global_397;
}

uint64_t __54__NSPersonNameComponentsFormatter_thaiInitialsCreator__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(a2, "rangeOfCharacterFromSet:", +[NSPersonNameComponentsFormatter __thaiConsonantSet](NSPersonNameComponentsFormatter, "__thaiConsonantSet"));
  if (v3 == 0x7FFFFFFFFFFFFFFFLL) {
    return (uint64_t)a2;
  }

  return objc_msgSend(a2, "substringWithRange:", v3, v4);
}

+ (id)tibetanInitialsCreator
{
  return &__block_literal_global_399;
}

uint64_t __57__NSPersonNameComponentsFormatter_tibetanInitialsCreator__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  uint64_t v3 = [a2 length];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __57__NSPersonNameComponentsFormatter_tibetanInitialsCreator__block_invoke_2;
  v6[3] = &unk_1E51FE8C8;
  v6[4] = a2;
  v6[5] = &v11;
  v6[6] = &v7;
  objc_msgSend(a2, "enumerateSubstringsInRange:options:usingBlock:", 0, v3, 514, v6);
  if ((unint64_t)v12[3] <= 2) {
    uint64_t v4 = [a2 substringToIndex:v8[3]];
  }
  else {
    uint64_t v4 = 0;
  }
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
  return v4;
}

uint64_t __57__NSPersonNameComponentsFormatter_tibetanInitialsCreator__block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  uint64_t v9 = result;
  if (a4 == 1
    && ((BOOL result = objc_msgSend(*(id *)(result + 32), "characterAtIndex:"), result == 3853)
     || result == 3851))
  {
    *a7 = 1;
  }
  else if (++*(void *)(*(void *)(*(void *)(v9 + 40) + 8) + 24) < 3uLL)
  {
    *(void *)(*(void *)(*(void *)(v9 + 48) + 8) + 24) += a4;
  }
  else
  {
    *a7 = 1;
  }
  return result;
}

+ (id)arabicInitialsCreator
{
  return &__block_literal_global_401;
}

uint64_t __56__NSPersonNameComponentsFormatter_arabicInitialsCreator__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3052000000;
  uint64_t v16 = __Block_byref_object_copy__33;
  uint64_t v17 = __Block_byref_object_dispose__33;
  uint64_t v18 = 0;
  uint64_t v3 = [a2 length];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __56__NSPersonNameComponentsFormatter_arabicInitialsCreator__block_invoke_2;
  v12[3] = &unk_1E51FAEF8;
  v12[4] = &v13;
  objc_msgSend(a2, "enumerateSubstringsInRange:options:usingBlock:", 0, v3, 2, v12);
  id v4 = (id)v14[5];
  uint64_t v5 = [(id)v14[5] length];
  uint64_t v6 = v14;
  if (v5)
  {
    int v7 = [(id)v14[5] isEqualToString:@"ه"];
    uint64_t v6 = v14;
    if (v7)
    {
      uint64_t v8 = @"ه‍";
LABEL_6:
      v6[5] = (uint64_t)v8;
      goto LABEL_7;
    }
    int v9 = [(id)v14[5] isEqualToString:@"ہ"];
    uint64_t v6 = v14;
    if (v9)
    {
      uint64_t v8 = @"ھ";
      goto LABEL_6;
    }
  }
LABEL_7:
  uint64_t v10 = v6[5];
  _Block_object_dispose(&v13, 8);
  return v10;
}

uint64_t __56__NSPersonNameComponentsFormatter_arabicInitialsCreator__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  uint64_t result = [a2 copy];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  *a7 = 1;
  return result;
}

+ (BOOL)__shortStyle:(int64_t)a3 isRestrictedForLocalization:(id)a4
{
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a1, "__supportedNameDefaultsFromLocalization:", a4), "objectForKeyedSubscript:", @"shortStyleRestrictions");
  uint64_t v7 = objc_msgSend(a1, "__stringValueForShortStyle:", a3);
  return v6 && [v6 objectForKeyedSubscript:v7] != 0;
}

@end