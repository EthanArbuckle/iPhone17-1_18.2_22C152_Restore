@interface _NSAttributedStringGrammarInflection
+ (BOOL)_canSelectUserInflectionWithPreferredLanguages:(id)a3;
+ (BOOL)_isSimulatingLockedDevice;
+ (BOOL)_isSimulatingThirdPartyProcess;
+ (BOOL)_thirdPartyApplicationsCanAccessUserInflection;
+ (BOOL)canSelectCustomInflection;
+ (BOOL)canSelectUserInflection;
+ (BOOL)supportsSecureCoding;
+ (NSArray)presetInflections;
+ (NSString)_protectedPreferencesDomain;
+ (NSString)_thirdPartyPreferencesDomain;
+ (_NSAttributedStringGrammarInflection)_currentGlobalUserInflection;
+ (_NSAttributedStringGrammarInflection)_currentGlobalUserInflectionIfAvailable;
+ (_NSAttributedStringGrammarInflection)userInflection;
+ (void)_addGlobalUserInflectionObserver:(id)a3 options:(unint64_t)a4 context:(void *)a5;
+ (void)_removeGlobalUserInflectionObserver:(id)a3 context:(void *)a4;
+ (void)_setThirdPartyApplicationsCanAccessUserInflection:(BOOL)a3;
+ (void)_usePreferencesDomainForFirstParty:(id)a3 thirdParty:(id)a4 simulateLockedDevice:(BOOL)a5 simulateThirdPartyProcess:(BOOL)a6 withinBlock:(id)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)isIdentity;
- (NSData)externalRepresentation;
- (NSDictionary)externalRepresentationDictionary;
- (NSMorphologyCustomPronoun)englishCustomPronoun;
- (NSString)localizedShortDescription;
- (_NSAttributedStringGrammarInflection)init;
- (_NSAttributedStringGrammarInflection)initWithCoder:(id)a3;
- (_NSAttributedStringGrammarInflection)initWithExternalRepresentation:(id)a3 error:(id *)a4;
- (_NSAttributedStringGrammarInflection)initWithExternalRepresentationDictionary:(id)a3 error:(id *)a4;
- (_NSAttributedStringGrammarInflection)initWithInflectionRule:(id)a3;
- (_NSAttributedStringGrammarInflection)initWithMorphology:(id)a3;
- (id)_initWithGender:(int64_t)a3;
- (id)_initWithMarkdownDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)context;
- (int64_t)determinationType;
- (int64_t)gender;
- (int64_t)grammaticalCase;
- (int64_t)number;
- (int64_t)person;
- (unint64_t)hash;
- (void)_setAsGlobalUserInflection;
- (void)_useInsteadOfUserInflectionInBlock:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setContext:(int64_t)a3;
- (void)setDeterminationType:(int64_t)a3;
- (void)setEnglishCustomPronoun:(id)a3;
- (void)setGender:(int64_t)a3;
- (void)setGrammaticalCase:(int64_t)a3;
- (void)setNumber:(int64_t)a3;
- (void)setPerson:(int64_t)a3;
@end

@implementation _NSAttributedStringGrammarInflection

- (_NSAttributedStringGrammarInflection)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)_NSAttributedStringGrammarInflection;
  return [(_NSAttributedStringGrammarInflection *)&v3 init];
}

- (_NSAttributedStringGrammarInflection)initWithCoder:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  uint64_t v4 = -[_NSAttributedStringGrammarInflection initWithExternalRepresentation:error:](self, "initWithExternalRepresentation:error:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"externalRepresentation"], v6);
  if (!v4) {
    [a3 failWithError:v6[0]];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = [(_NSAttributedStringGrammarInflection *)self externalRepresentation];

  [a3 encodeObject:v4 forKey:@"externalRepresentation"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)_NSAttributedStringGrammarInflection;
  [(_NSAttributedStringGrammarInflection *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_alloc_init(_NSAttributedStringGrammarInflection);
  v4->_grammaticalCase = [(_NSAttributedStringGrammarInflection *)self grammaticalCase];
  v4->_gender = [(_NSAttributedStringGrammarInflection *)self gender];
  v4->_number = [(_NSAttributedStringGrammarInflection *)self number];
  v4->_person = [(_NSAttributedStringGrammarInflection *)self person];
  v4->_context = [(_NSAttributedStringGrammarInflection *)self context];
  v4->_determinationType = [(_NSAttributedStringGrammarInflection *)self determinationType];
  v4->_englishCustomPronoun = (NSMorphologyCustomPronoun *)[(NSMorphologyCustomPronoun *)[(_NSAttributedStringGrammarInflection *)self englishCustomPronoun] copy];
  return v4;
}

- (unint64_t)hash
{
  uint64_t v3 = [(id)objc_opt_class() hash];
  int64_t v4 = [(_NSAttributedStringGrammarInflection *)self context];
  int64_t v5 = v4 ^ [(_NSAttributedStringGrammarInflection *)self gender] ^ v3;
  int64_t v6 = [(_NSAttributedStringGrammarInflection *)self grammaticalCase];
  int64_t v7 = v6 ^ [(_NSAttributedStringGrammarInflection *)self number];
  int64_t v8 = v5 ^ v7 ^ [(_NSAttributedStringGrammarInflection *)self person];
  unint64_t v9 = v8 ^ [(_NSAttributedStringGrammarInflection *)self determinationType];
  if ([(_NSAttributedStringGrammarInflection *)self englishCustomPronoun]) {
    v9 ^= [(NSMorphologyCustomPronoun *)[(_NSAttributedStringGrammarInflection *)self englishCustomPronoun] hash];
  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  int64_t v5 = [(_NSAttributedStringGrammarInflection *)self context];
  if (v5 != [a3 context]) {
    return 0;
  }
  int64_t v6 = [(_NSAttributedStringGrammarInflection *)self gender];
  if (v6 != [a3 gender]) {
    return 0;
  }
  int64_t v7 = [(_NSAttributedStringGrammarInflection *)self grammaticalCase];
  if (v7 != [a3 grammaticalCase]) {
    return 0;
  }
  int64_t v8 = [(_NSAttributedStringGrammarInflection *)self number];
  if (v8 != [a3 number]) {
    return 0;
  }
  int64_t v9 = [(_NSAttributedStringGrammarInflection *)self person];
  if (v9 != [a3 person]) {
    return 0;
  }
  int64_t v10 = [(_NSAttributedStringGrammarInflection *)self determinationType];
  if (v10 != [a3 determinationType]) {
    return 0;
  }
  v11 = [(_NSAttributedStringGrammarInflection *)self englishCustomPronoun];
  if (v11 == (NSMorphologyCustomPronoun *)[a3 englishCustomPronoun]) {
    return 1;
  }
  v12 = [(_NSAttributedStringGrammarInflection *)self englishCustomPronoun];
  uint64_t v13 = [a3 englishCustomPronoun];

  return [(NSMorphologyCustomPronoun *)v12 isEqual:v13];
}

- (BOOL)isIdentity
{
  return ![(_NSAttributedStringGrammarInflection *)self context]
      && ![(_NSAttributedStringGrammarInflection *)self gender]
      && ![(_NSAttributedStringGrammarInflection *)self grammaticalCase]
      && ![(_NSAttributedStringGrammarInflection *)self number]
      && ![(_NSAttributedStringGrammarInflection *)self person]
      && ![(_NSAttributedStringGrammarInflection *)self determinationType]
      && [(_NSAttributedStringGrammarInflection *)self englishCustomPronoun] == 0;
}

- (NSMorphologyCustomPronoun)englishCustomPronoun
{
  v2 = (void *)[(NSMorphologyCustomPronoun *)self->_englishCustomPronoun copy];

  return (NSMorphologyCustomPronoun *)v2;
}

- (_NSAttributedStringGrammarInflection)initWithMorphology:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)_NSAttributedStringGrammarInflection;
  int64_t v4 = [(_NSAttributedStringGrammarInflection *)&v14 init];
  if (v4)
  {
    unint64_t v5 = [a3 grammaticalGender];
    if (v5 <= 3) {
      [(_NSAttributedStringGrammarInflection *)v4 setGender:qword_182371C50[v5]];
    }
    unint64_t v6 = [a3 number];
    if (v6 <= 6) {
      [(_NSAttributedStringGrammarInflection *)v4 setNumber:qword_182371C70[v6]];
    }
    unint64_t v7 = [a3 grammaticalCase] - 1;
    if (v7 > 0xC) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = qword_182371CA8[v7];
    }
    [(_NSAttributedStringGrammarInflection *)v4 setGrammaticalCase:v8];
    uint64_t v9 = [a3 definiteness];
    uint64_t v10 = 3;
    if (v9 != 1) {
      uint64_t v10 = 0;
    }
    if (v9 == 2) {
      uint64_t v11 = 2;
    }
    else {
      uint64_t v11 = v10;
    }
    [(_NSAttributedStringGrammarInflection *)v4 setDeterminationType:v11];
    v12 = objc_msgSend((id)objc_msgSend(a3, "_customPronouns"), "allValues");
    if ([v12 count] == 1) {
      v4->_englishCustomPronoun = (NSMorphologyCustomPronoun *)objc_msgSend((id)objc_msgSend(v12, "objectAtIndexedSubscript:", 0), "copy");
    }
  }
  return v4;
}

- (_NSAttributedStringGrammarInflection)initWithInflectionRule:(id)a3
{
  if (+[NSInflectionRule automaticRule] == a3)
  {
    return [(_NSAttributedStringGrammarInflection *)self init];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      __assert_rtn("-[_NSAttributedStringGrammarInflection initWithInflectionRule:]", "NSAttributedString_Grammar.m", 450, "[inflectionRule isKindOfClass:NSInflectionRuleExplicit.class]");
    }
    uint64_t v5 = [a3 morphology];
    return [(_NSAttributedStringGrammarInflection *)self initWithMorphology:v5];
  }
}

- (id)description
{
  uint64_t v3 = +[NSString stringWithFormat:@"<%@ %p { ", objc_opt_class(), self];
  if ([(_NSAttributedStringGrammarInflection *)self context]) {
    -[NSMutableString appendFormat:](v3, "appendFormat:", @" context = %d;",
  }
      [(_NSAttributedStringGrammarInflection *)self context]);
  if ([(_NSAttributedStringGrammarInflection *)self gender]) {
    -[NSMutableString appendFormat:](v3, "appendFormat:", @" gender = %d;",
  }
      [(_NSAttributedStringGrammarInflection *)self gender]);
  if ([(_NSAttributedStringGrammarInflection *)self grammaticalCase]) {
    -[NSMutableString appendFormat:](v3, "appendFormat:", @" grammaticalCase = %d;",
  }
      [(_NSAttributedStringGrammarInflection *)self grammaticalCase]);
  if ([(_NSAttributedStringGrammarInflection *)self number]) {
    -[NSMutableString appendFormat:](v3, "appendFormat:", @" number = %d;",
  }
      [(_NSAttributedStringGrammarInflection *)self number]);
  if ([(_NSAttributedStringGrammarInflection *)self person]) {
    -[NSMutableString appendFormat:](v3, "appendFormat:", @" person = %d;",
  }
      [(_NSAttributedStringGrammarInflection *)self person]);
  if ([(_NSAttributedStringGrammarInflection *)self englishCustomPronoun]) {
    -[NSMutableString appendFormat:](v3, "appendFormat:", @" English pronoun = %@;",
  }
      [(_NSAttributedStringGrammarInflection *)self englishCustomPronoun]);
  [(NSMutableString *)v3 appendString:@"}>"];
  int64_t v4 = (void *)[(NSMutableString *)v3 copy];

  return v4;
}

- (int64_t)context
{
  return self->_context;
}

- (void)setContext:(int64_t)a3
{
  self->_context = a3;
}

- (int64_t)gender
{
  return self->_gender;
}

- (void)setGender:(int64_t)a3
{
  self->_gender = a3;
}

- (int64_t)grammaticalCase
{
  return self->_grammaticalCase;
}

- (void)setGrammaticalCase:(int64_t)a3
{
  self->_grammaticalCase = a3;
}

- (int64_t)determinationType
{
  return self->_determinationType;
}

- (void)setDeterminationType:(int64_t)a3
{
  self->_determinationType = a3;
}

- (int64_t)number
{
  return self->_number;
}

- (void)setNumber:(int64_t)a3
{
  self->_number = a3;
}

- (int64_t)person
{
  return self->_person;
}

- (void)setPerson:(int64_t)a3
{
  self->_person = a3;
}

- (void)setEnglishCustomPronoun:(id)a3
{
}

- (id)_initWithMarkdownDictionary:(id)a3
{
  return [(_NSAttributedStringGrammarInflection *)self initWithExternalRepresentationDictionary:a3 error:0];
}

- (_NSAttributedStringGrammarInflection)initWithExternalRepresentation:(id)a3 error:(id *)a4
{
  id v6 = +[NSJSONSerialization JSONObjectWithData:a3 options:0 error:a4];
  if (!v6)
  {
LABEL_8:

    return 0;
  }
  id v7 = v6;
  if ((_NSIsNSDictionary() & 1) == 0)
  {
    if (a4) {
      *a4 = +[NSError errorWithDomain:@"NSCocoaErrorDomain" code:3840 userInfo:0];
    }
    goto LABEL_8;
  }

  return [(_NSAttributedStringGrammarInflection *)self initWithExternalRepresentationDictionary:v7 error:a4];
}

- (_NSAttributedStringGrammarInflection)initWithExternalRepresentationDictionary:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v32.receiver = self;
  v32.super_class = (Class)_NSAttributedStringGrammarInflection;
  id v6 = [(_NSAttributedStringGrammarInflection *)&v32 init];
  if (!v6) {
    return v6;
  }
  id v7 = (void *)[a3 objectForKeyedSubscript:@"context"];
  if (v7 && (uint64_t v8 = v7, ([v7 isEqual:@"none"] & 1) == 0))
  {
    if (([v8 isEqual:@"technicalTerm"] & 1) == 0) {
      goto LABEL_80;
    }
    uint64_t v9 = 1;
  }
  else
  {
    uint64_t v9 = 0;
  }
  [(_NSAttributedStringGrammarInflection *)v6 setContext:v9];
  uint64_t v10 = (void *)[a3 objectForKeyedSubscript:@"grammaticalGender"];
  if (v10 && (uint64_t v11 = v10, ([v10 isEqual:@"none"] & 1) == 0))
  {
    if ([v11 isEqual:@"masculine"])
    {
      uint64_t v12 = 1;
    }
    else if ([v11 isEqual:@"feminine"])
    {
      uint64_t v12 = 2;
    }
    else if ([v11 isEqual:@"neuter"])
    {
      uint64_t v12 = 3;
    }
    else
    {
      if (([v11 isEqual:@"common"] & 1) == 0) {
        goto LABEL_80;
      }
      uint64_t v12 = 4;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  [(_NSAttributedStringGrammarInflection *)v6 setGender:v12];
  uint64_t v13 = (void *)[a3 objectForKeyedSubscript:@"grammaticalCase"];
  if (v13 && (objc_super v14 = v13, ([v13 isEqual:@"none"] & 1) == 0))
  {
    if ([v14 isEqual:@"accusative"])
    {
      uint64_t v15 = 1;
    }
    else if ([v14 isEqual:@"dative"])
    {
      uint64_t v15 = 2;
    }
    else if ([v14 isEqual:@"genitive"])
    {
      uint64_t v15 = 3;
    }
    else if ([v14 isEqual:@"locative"])
    {
      uint64_t v15 = 4;
    }
    else if ([v14 isEqual:@"nominative"])
    {
      uint64_t v15 = 5;
    }
    else if ([v14 isEqual:@"partitive"])
    {
      uint64_t v15 = 6;
    }
    else if ([v14 isEqual:@"instrumental"])
    {
      uint64_t v15 = 7;
    }
    else if ([v14 isEqual:@"prepositional"])
    {
      uint64_t v15 = 8;
    }
    else if ([v14 isEqual:@"object"])
    {
      uint64_t v15 = 9;
    }
    else if ([v14 isEqual:@"directObject"])
    {
      uint64_t v15 = 10;
    }
    else
    {
      if (([v14 isEqual:@"indirectObject"] & 1) == 0) {
        goto LABEL_80;
      }
      uint64_t v15 = 11;
    }
  }
  else
  {
    uint64_t v15 = 0;
  }
  [(_NSAttributedStringGrammarInflection *)v6 setGrammaticalCase:v15];
  v16 = (void *)[a3 objectForKeyedSubscript:@"number"];
  if (v16 && (v17 = v16, ([v16 isEqual:@"none"] & 1) == 0))
  {
    if ([v17 isEqual:@"one"])
    {
      uint64_t v18 = 1;
    }
    else if ([v17 isEqual:@"two"])
    {
      uint64_t v18 = 2;
    }
    else if ([v17 isEqual:@"few"])
    {
      uint64_t v18 = 3;
    }
    else if ([v17 isEqual:@"many"])
    {
      uint64_t v18 = 4;
    }
    else if ([v17 isEqual:@"zero"])
    {
      uint64_t v18 = 5;
    }
    else
    {
      if (([v17 isEqual:@"other"] & 1) == 0) {
        goto LABEL_80;
      }
      uint64_t v18 = 6;
    }
  }
  else
  {
    uint64_t v18 = 0;
  }
  [(_NSAttributedStringGrammarInflection *)v6 setNumber:v18];
  v19 = (void *)[a3 objectForKeyedSubscript:@"person"];
  if (!v19 || (v20 = v19, ([v19 isEqual:@"none"] & 1) != 0))
  {
    uint64_t v21 = 0;
LABEL_17:
    [(_NSAttributedStringGrammarInflection *)v6 setPerson:v21];
    v22 = (void *)[a3 objectForKeyedSubscript:@"customPronouns"];
    if (_NSIsNSDictionary() && [v22 count])
    {
      uint64_t v23 = [v22 objectForKeyedSubscript:@"en"];
      if (!v23) {
        goto LABEL_80;
      }
      v24 = (void *)v23;
      if (!_NSIsNSDictionary()) {
        goto LABEL_80;
      }
      uint64_t v25 = [v24 objectForKeyedSubscript:@"subjectForm"];
      uint64_t v26 = [v24 objectForKeyedSubscript:@"objectForm"];
      uint64_t v27 = [v24 objectForKeyedSubscript:@"possessiveForm"];
      uint64_t v28 = [v24 objectForKeyedSubscript:@"possessiveAdjectiveForm"];
      uint64_t v29 = [v24 objectForKeyedSubscript:@"reflexiveForm"];
      if (!_NSIsNSString()) {
        goto LABEL_80;
      }
      if (!_NSIsNSString()) {
        goto LABEL_80;
      }
      if (!_NSIsNSString()) {
        goto LABEL_80;
      }
      if (!_NSIsNSString()) {
        goto LABEL_80;
      }
      if (!_NSIsNSString()) {
        goto LABEL_80;
      }
      v30 = objc_alloc_init(NSMorphologyCustomPronoun);
      [(NSMorphologyCustomPronoun *)v30 setSubjectForm:v25];
      [(NSMorphologyCustomPronoun *)v30 setObjectForm:v26];
      [(NSMorphologyCustomPronoun *)v30 setPossessiveForm:v27];
      [(NSMorphologyCustomPronoun *)v30 setPossessiveAdjectiveForm:v28];
      [(NSMorphologyCustomPronoun *)v30 setReflexiveForm:v29];
      if (!v30) {
        goto LABEL_80;
      }
    }
    else
    {
      v30 = 0;
    }
    v6->_englishCustomPronoun = v30;
    return v6;
  }
  if ([v20 isEqual:@"first"])
  {
    uint64_t v21 = 1;
    goto LABEL_17;
  }
  if ([v20 isEqual:@"second"])
  {
    uint64_t v21 = 2;
    goto LABEL_17;
  }
  if ([v20 isEqual:@"third"])
  {
    uint64_t v21 = 3;
    goto LABEL_17;
  }
LABEL_80:
  if (a4) {
    *a4 = +[NSError errorWithDomain:@"NSCocoaErrorDomain" code:3840 userInfo:0];
  }

  return 0;
}

- (NSDictionary)externalRepresentationDictionary
{
  v19[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([(_NSAttributedStringGrammarInflection *)self context] == 1) {
    int64_t v4 = @"technicalTerm";
  }
  else {
    int64_t v4 = 0;
  }
  [(NSDictionary *)v3 setObject:v4 forKeyedSubscript:@"context"];
  int64_t v5 = [(_NSAttributedStringGrammarInflection *)self gender];
  id v6 = 0;
  if ((unint64_t)(v5 - 1) <= 3) {
    id v6 = off_1E51FB278[v5 - 1];
  }
  [(NSDictionary *)v3 setObject:v6 forKeyedSubscript:@"grammaticalGender"];
  unint64_t v7 = [(_NSAttributedStringGrammarInflection *)self grammaticalCase] - 1;
  if (v7 > 0xA) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = off_1E51FB298[v7];
  }
  [(NSDictionary *)v3 setObject:v8 forKeyedSubscript:@"grammaticalCase"];
  unint64_t v9 = [(_NSAttributedStringGrammarInflection *)self number] - 1;
  if (v9 > 5) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = off_1E51FB2F0[v9];
  }
  [(NSDictionary *)v3 setObject:v10 forKeyedSubscript:@"number"];
  unint64_t v11 = [(_NSAttributedStringGrammarInflection *)self person] - 1;
  if (v11 > 2) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = off_1E51FB320[v11];
  }
  [(NSDictionary *)v3 setObject:v12 forKeyedSubscript:@"person"];
  uint64_t v13 = [(_NSAttributedStringGrammarInflection *)self englishCustomPronoun];
  if ([(NSMorphologyCustomPronoun *)v13 subjectForm])
  {
    if ([(NSMorphologyCustomPronoun *)v13 objectForm])
    {
      if ([(NSMorphologyCustomPronoun *)v13 possessiveForm])
      {
        if ([(NSMorphologyCustomPronoun *)v13 possessiveAdjectiveForm])
        {
          if ([(NSMorphologyCustomPronoun *)v13 reflexiveForm])
          {
            uint64_t v18 = @"en";
            v16[0] = @"subjectForm";
            v17[0] = [(NSMorphologyCustomPronoun *)v13 subjectForm];
            v16[1] = @"objectForm";
            v17[1] = [(NSMorphologyCustomPronoun *)v13 objectForm];
            v16[2] = @"possessiveForm";
            v17[2] = [(NSMorphologyCustomPronoun *)v13 possessiveForm];
            v16[3] = @"possessiveAdjectiveForm";
            v17[3] = [(NSMorphologyCustomPronoun *)v13 possessiveAdjectiveForm];
            v16[4] = @"reflexiveForm";
            v17[4] = [(NSMorphologyCustomPronoun *)v13 reflexiveForm];
            v19[0] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:5];
            uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
            if (v14) {
              [(NSDictionary *)v3 setObject:v14 forKeyedSubscript:@"customPronouns"];
            }
          }
        }
      }
    }
  }
  return v3;
}

- (NSData)externalRepresentation
{
  v2 = [(_NSAttributedStringGrammarInflection *)self externalRepresentationDictionary];

  return +[NSJSONSerialization dataWithJSONObject:v2 options:2 error:0];
}

+ (_NSAttributedStringGrammarInflection)userInflection
{
  v2 = [[_NSAttributedStringGrammarInflection alloc] initWithMorphology:+[NSMorphology _userMorphologyWithOverrides]()];

  return v2;
}

+ (_NSAttributedStringGrammarInflection)_currentGlobalUserInflectionIfAvailable
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  getpid();
  uint64_t v4 = [@"com.apple.morphology.internal" UTF8String];
  if (sandbox_check())
  {
    if (_NSInflectionLog_onceToken != -1) {
      dispatch_once(&_NSInflectionLog_onceToken, &__block_literal_global_13);
    }
    v2 = _NSInflectionLog_log;
    if (os_log_type_enabled((os_log_t)_NSInflectionLog_log, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v6 = objc_msgSend(@"com.apple.morphology.internal", "UTF8String", v4);
      _os_log_debug_impl(&dword_181795000, v2, OS_LOG_TYPE_DEBUG, "Could not read values in %s: accessing these preferences requires user-preference-read or file-read-data sandbox access", buf, 0xCu);
    }
    return 0;
  }
  else
  {
    return +[_NSAttributedStringGrammarInflection _currentGlobalUserInflection];
  }
}

+ (_NSAttributedStringGrammarInflection)_currentGlobalUserInflection
{
  v2 = (void *)CFPreferencesCopyValue(@"AppleUserMorphology", @"com.apple.morphology.internal", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  if (_NSIsNSDictionary()) {
    uint64_t v3 = (_NSAttributedStringGrammarInflection *)[[_NSAttributedStringGrammarInflection alloc] _initWithMarkdownDictionary:v2];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

+ (void)_addGlobalUserInflectionObserver:(id)a3 options:(unint64_t)a4 context:(void *)a5
{
  uint64_t v8 = (void *)[MEMORY[0x1E4F1CB18] standardUserDefaults];

  [v8 addObserver:a3 forKeyPath:@"AppleUserMorphology" options:a4 context:a5];
}

+ (void)_removeGlobalUserInflectionObserver:(id)a3 context:(void *)a4
{
  uint64_t v6 = (void *)[MEMORY[0x1E4F1CB18] standardUserDefaults];

  [v6 removeObserver:a3 forKeyPath:@"AppleUserMorphology" context:a4];
}

- (void)_setAsGlobalUserInflection
{
  id v2 = [(_NSAttributedStringGrammarInflection *)self _markupDictionary];
  CFStringRef v3 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
  CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
  _CFPreferencesSetFileProtectionClass();
  _CFPreferencesSetFileProtectionClass();
  if (qword_1EB1EDA38) {
    CFStringRef v5 = (const __CFString *)qword_1EB1EDA38;
  }
  else {
    CFStringRef v5 = @"com.apple.morphology.internal";
  }
  CFPreferencesSetValue(@"AppleUserMorphology", v2, v5, v3, v4);
  if (qword_1EB1EDA38) {
    CFStringRef v6 = (const __CFString *)qword_1EB1EDA38;
  }
  else {
    CFStringRef v6 = @"com.apple.morphology.internal";
  }
  CFPropertyListRef v7 = CFPreferencesCopyValue(@"AppleUserMorphologyAllowThirdPartyAccess", v6, v3, v4);
  if (v7)
  {
    uint64_t v8 = v7;
    if (CFEqual(v7, (CFTypeRef)*MEMORY[0x1E4F1CFD0]))
    {
      if (qword_1EB1EDA40) {
        CFStringRef v9 = (const __CFString *)qword_1EB1EDA40;
      }
      else {
        CFStringRef v9 = @"com.apple.morphology";
      }
      CFPreferencesSetValue(@"AppleUserMorphology", v2, v9, v3, v4);
    }
    CFRelease(v8);
  }

  +[NSMorphology _clearCachedUserMorphology];
}

+ (BOOL)_thirdPartyApplicationsCanAccessUserInflection
{
  if (qword_1EB1EDA38) {
    CFStringRef v2 = (const __CFString *)qword_1EB1EDA38;
  }
  else {
    CFStringRef v2 = @"com.apple.morphology.internal";
  }
  CFStringRef v3 = (void *)CFPreferencesCopyValue(@"AppleUserMorphologyAllowThirdPartyAccess", v2, (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  char v4 = [v3 isEqual:MEMORY[0x1E4F1CC38]];

  return v4;
}

+ (void)_setThirdPartyApplicationsCanAccessUserInflection:(BOOL)a3
{
  BOOL v3 = a3;
  CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
  CFStringRef v5 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
  _CFPreferencesSetFileProtectionClass();
  _CFPreferencesSetFileProtectionClass();
  CFStringRef v6 = +[NSNumber numberWithBool:v3];
  if (qword_1EB1EDA38) {
    CFStringRef v7 = (const __CFString *)qword_1EB1EDA38;
  }
  else {
    CFStringRef v7 = @"com.apple.morphology.internal";
  }
  CFPreferencesSetValue(@"AppleUserMorphologyAllowThirdPartyAccess", v6, v7, v4, v5);
  if (v3)
  {
    if (qword_1EB1EDA38) {
      CFStringRef v8 = (const __CFString *)qword_1EB1EDA38;
    }
    else {
      CFStringRef v8 = @"com.apple.morphology.internal";
    }
    CFPropertyListRef v9 = CFPreferencesCopyValue(@"AppleUserMorphology", v8, v4, v5);
    if (v9)
    {
      uint64_t v10 = v9;
      if (qword_1EB1EDA40) {
        CFStringRef v11 = (const __CFString *)qword_1EB1EDA40;
      }
      else {
        CFStringRef v11 = @"com.apple.morphology";
      }
      CFPreferencesSetValue(@"AppleUserMorphology", v9, v11, v4, v5);
      CFRelease(v10);
    }
  }
  else
  {
    if (qword_1EB1EDA40) {
      CFStringRef v12 = (const __CFString *)qword_1EB1EDA40;
    }
    else {
      CFStringRef v12 = @"com.apple.morphology";
    }
    CFPreferencesSetValue(@"AppleUserMorphology", 0, v12, v4, v5);
  }
}

- (void)_useInsteadOfUserInflectionInBlock:(id)a3
{
  CFStringRef v4 = [[NSMorphology alloc] initWithInflection:self];
  -[NSMorphology _overrideUserInflectionInBlock:](v4, (uint64_t)a3);
}

+ (void)_usePreferencesDomainForFirstParty:(id)a3 thirdParty:(id)a4 simulateLockedDevice:(BOOL)a5 simulateThirdPartyProcess:(BOOL)a6 withinBlock:(id)a7
{
  uint64_t v8 = qword_1EB1EDA38;
  uint64_t v9 = qword_1EB1EDA40;
  __int16 v10 = _MergedGlobals_139;
  qword_1EB1EDA38 = (uint64_t)a3;
  qword_1EB1EDA40 = (uint64_t)a4;
  LOBYTE(_MergedGlobals_139) = a5;
  HIBYTE(_MergedGlobals_139) = a6;
  +[NSMorphology _clearCachedUserMorphology];
  (*((void (**)(id))a7 + 2))(a7);
  qword_1EB1EDA38 = v8;
  qword_1EB1EDA40 = v9;
  _MergedGlobals_139 = v10;

  +[NSMorphology _clearCachedUserMorphology];
}

+ (NSString)_protectedPreferencesDomain
{
  if (qword_1EB1EDA38) {
    return (NSString *)qword_1EB1EDA38;
  }
  else {
    return (NSString *)@"com.apple.morphology.internal";
  }
}

+ (NSString)_thirdPartyPreferencesDomain
{
  if (qword_1EB1EDA40) {
    return (NSString *)qword_1EB1EDA40;
  }
  else {
    return (NSString *)@"com.apple.morphology";
  }
}

+ (BOOL)_isSimulatingLockedDevice
{
  return _MergedGlobals_139;
}

+ (BOOL)_isSimulatingThirdPartyProcess
{
  return HIBYTE(_MergedGlobals_139);
}

- (id)_initWithGender:(int64_t)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)_NSAttributedStringGrammarInflection;
  CFStringRef v4 = [(_NSAttributedStringGrammarInflection *)&v7 init];
  CFStringRef v5 = v4;
  if (v4) {
    [(_NSAttributedStringGrammarInflection *)v4 setGender:a3];
  }
  return v5;
}

+ (NSArray)presetInflections
{
  if (qword_1EB1EDA50 != -1) {
    dispatch_once(&qword_1EB1EDA50, &__block_literal_global_64);
  }
  return (NSArray *)qword_1EB1EDA48;
}

+ (BOOL)canSelectCustomInflection
{
  return 0;
}

- (NSString)localizedShortDescription
{
  BOOL v3 = [(_NSAttributedStringGrammarInflection *)self englishCustomPronoun];
  uint64_t v4 = [(NSMorphologyCustomPronoun *)v3 subjectForm];
  uint64_t v5 = [(NSMorphologyCustomPronoun *)v3 objectForm];
  if (v4 && v5) {
    return +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", [(id)_NSFoundationBundle() localizedStringForKey:@"[CUSTOM PRONOUN] %@/%@" value:&stru_1ECA5C228 table:@"Morphology"], v4, v5);
  }
  int64_t v7 = [(_NSAttributedStringGrammarInflection *)self gender];
  switch(v7)
  {
    case 1:
      uint64_t v8 = (void *)_NSFoundationBundle();
      uint64_t v9 = @"Masculine";
      break;
    case 3:
      uint64_t v8 = (void *)_NSFoundationBundle();
      uint64_t v9 = @"Neutral";
      break;
    case 2:
      uint64_t v8 = (void *)_NSFoundationBundle();
      uint64_t v9 = @"Feminine";
      break;
    default:
      uint64_t v8 = (void *)_NSFoundationBundle();
      uint64_t v9 = @"Not Specified";
      break;
  }

  return (NSString *)[v8 localizedStringForKey:v9 value:&stru_1ECA5C228 table:@"Morphology"];
}

+ (BOOL)_canSelectUserInflectionWithPreferredLanguages:(id)a3
{
  if ((unint64_t)objc_msgSend((id)objc_msgSend(a3, "firstObject"), "length") < 2
    || !objc_msgSend(&unk_1ECAB8228, "containsObject:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "firstObject"), "substringToIndex:", 2), "lowercaseString")))
  {
    return 0;
  }
  uint64_t v4 = (void *)[a3 firstObject];

  return _NSRequiresMorphunInflectionForLanguageIdentifier(v4);
}

+ (BOOL)canSelectUserInflection
{
  uint64_t v3 = [MEMORY[0x1E4F1CA20] preferredLanguages];

  return [a1 _canSelectUserInflectionWithPreferredLanguages:v3];
}

@end