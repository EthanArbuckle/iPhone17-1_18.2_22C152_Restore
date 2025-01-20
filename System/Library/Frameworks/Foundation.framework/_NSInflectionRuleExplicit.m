@interface _NSInflectionRuleExplicit
- (BOOL)isAutomatic;
- (BOOL)isEqual:(id)a3;
- (NSMorphology)morphology;
- (_NSInflectionRuleExplicit)initWithAttributesDictionary:(id)a3;
- (_NSInflectionRuleExplicit)initWithMorphology:(id)a3 agreeWithArgument:(int64_t)a4 agreeWithConcept:(int64_t)a5 referentConcept:(int64_t)a6;
- (id)description;
- (int64_t)agreeWithArgument;
- (int64_t)agreeWithConcept;
- (int64_t)referentConcept;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation _NSInflectionRuleExplicit

- (_NSInflectionRuleExplicit)initWithAttributesDictionary:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [a3 objectForKeyedSubscript:@"NSInflectionAgreementArgument"];
  if (_NSIsNSNumber()) {
    uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"NSInflectionAgreementArgument"), "integerValue");
  }
  else {
    uint64_t v5 = 0;
  }
  [a3 objectForKeyedSubscript:@"NSInflectionAgreementConcept"];
  if (_NSIsNSNumber()) {
    uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"NSInflectionAgreementConcept"), "integerValue");
  }
  else {
    uint64_t v6 = 0;
  }
  [a3 objectForKeyedSubscript:@"NSInflectionReferentConcept"];
  if (_NSIsNSNumber()) {
    uint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"NSInflectionReferentConcept"), "integerValue");
  }
  else {
    uint64_t v7 = 0;
  }
  v8 = (void *)[a3 objectForKeyedSubscript:@"NSInflect"];
  if (!v8)
  {
LABEL_13:
    if (v5) {
      goto LABEL_20;
    }
    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = (void *)[v8 morphology];
    goto LABEL_13;
  }
  v8 = 0;
  if (v5) {
    goto LABEL_20;
  }
LABEL_16:
  if (!v6 && !v7 && !v8)
  {

    return 0;
  }
LABEL_20:
  v11.receiver = self;
  v11.super_class = (Class)_NSInflectionRuleExplicit;
  v9 = [(NSInflectionRule *)&v11 _init];
  if (v9)
  {
    v9->_morphology = (NSMorphology *)[v8 copy];
    v9->_agreeWithConcept = v6;
    v9->_agreeWithArgument = v5;
    v9->_referentConcept = v7;
  }
  return v9;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)_NSInflectionRuleExplicit;
  [(_NSInflectionRuleExplicit *)&v3 dealloc];
}

- (_NSInflectionRuleExplicit)initWithMorphology:(id)a3 agreeWithArgument:(int64_t)a4 agreeWithConcept:(int64_t)a5 referentConcept:(int64_t)a6
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a3 || a5 | a4 | a6)
  {
    v12.receiver = self;
    v12.super_class = (Class)_NSInflectionRuleExplicit;
    v10 = [(NSInflectionRule *)&v12 _init];
    if (v10)
    {
      v10->_morphology = (NSMorphology *)[a3 copy];
      v10->_agreeWithConcept = a5;
      v10->_agreeWithArgument = a4;
      v10->_referentConcept = a6;
    }
  }
  else
  {

    return 0;
  }
  return v10;
}

- (id)description
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
  if ([(_NSInflectionRuleExplicit *)self morphology]) {
    [v3 addObject:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"morphology = %@", -[_NSInflectionRuleExplicit morphology](self, "morphology"))];
  }
  if ([(_NSInflectionRuleExplicit *)self agreeWithConcept]) {
    [v3 addObject:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"agreeWithConcept = %ld", -[_NSInflectionRuleExplicit agreeWithConcept](self, "agreeWithConcept"))];
  }
  if ([(_NSInflectionRuleExplicit *)self agreeWithArgument]) {
    [v3 addObject:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"agreeWithArgument = %ld", -[_NSInflectionRuleExplicit agreeWithArgument](self, "agreeWithArgument"))];
  }
  if ([(_NSInflectionRuleExplicit *)self referentConcept]) {
    [v3 addObject:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"referentConcept = %ld", -[_NSInflectionRuleExplicit referentConcept](self, "referentConcept"))];
  }
  if ([v3 count])
  {
    v9.receiver = self;
    v9.super_class = (Class)_NSInflectionRuleExplicit;
    uint64_t v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ { %@ }", -[_NSInflectionRuleExplicit description](&v9, sel_description), [v3 componentsJoinedByString:@", "]);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)_NSInflectionRuleExplicit;
    uint64_t v4 = +[NSString stringWithFormat:@"%@ (automatic inflection rule)", [(_NSInflectionRuleExplicit *)&v8 description], v7];
  }
  uint64_t v5 = v4;

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = [(id)objc_opt_class() hash];
  unint64_t v4 = [(NSMorphology *)[(_NSInflectionRuleExplicit *)self morphology] hash] ^ v3;
  int64_t v5 = [(_NSInflectionRuleExplicit *)self referentConcept];
  int64_t v6 = v5 ^ [(_NSInflectionRuleExplicit *)self agreeWithConcept];
  return v4 ^ v6 ^ [(_NSInflectionRuleExplicit *)self agreeWithArgument];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_7;
  }
  if (![(_NSInflectionRuleExplicit *)self morphology]
    || (BOOL v5 = -[NSMorphology isEqual:](-[_NSInflectionRuleExplicit morphology](self, "morphology"), "isEqual:", [a3 morphology])))
  {
    int64_t v6 = [(_NSInflectionRuleExplicit *)self referentConcept];
    if (v6 == [a3 referentConcept])
    {
      int64_t v7 = [(_NSInflectionRuleExplicit *)self agreeWithConcept];
      if (v7 == [a3 agreeWithConcept])
      {
        int64_t v8 = [(_NSInflectionRuleExplicit *)self agreeWithArgument];
        LOBYTE(v5) = v8 == [a3 agreeWithArgument];
        return v5;
      }
    }
LABEL_7:
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)isAutomatic
{
  return ![(_NSInflectionRuleExplicit *)self morphology]
      && ![(_NSInflectionRuleExplicit *)self agreeWithConcept]
      && [(_NSInflectionRuleExplicit *)self agreeWithArgument] == 0;
}

- (NSMorphology)morphology
{
  return (NSMorphology *)objc_getProperty(self, a2, 8, 1);
}

- (int64_t)agreeWithConcept
{
  return self->_agreeWithConcept;
}

- (int64_t)agreeWithArgument
{
  return self->_agreeWithArgument;
}

- (int64_t)referentConcept
{
  return self->_referentConcept;
}

@end