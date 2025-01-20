@interface _LTTranslationGenderAlternative
+ (BOOL)supportsSecureCoding;
+ (id)genderAlternativeFromDictionary:(id)a3 withGroup:(id)a4;
+ (id)genderAlternativesFromDictionary:(id)a3;
- (NSNumber)group;
- (NSString)defaultGender;
- (_LTTranslationGenderAlternative)initWithCoder:(id)a3;
- (_NSRange)sourceRange;
- (_NSRange)targetRange;
- (void)encodeWithCoder:(id)a3;
- (void)setDefaultGender:(id)a3;
- (void)setGroup:(id)a3;
- (void)setSourceRange:(_NSRange)a3;
- (void)setTargetRange:(_NSRange)a3;
@end

@implementation _LTTranslationGenderAlternative

+ (id)genderAlternativesFromDictionary:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"group"];
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  id v6 = v5;

  v7 = [v3 objectForKeyedSubscript:@"spans"];

  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v8 = v7;
    }
    else {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }
  id v9 = v8;

  v10 = (void *)MEMORY[0x263EFFA68];
  if (v6 && v9)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __68___LTTranslationGenderAlternative_genderAlternativesFromDictionary___block_invoke;
    v12[3] = &unk_2651DC550;
    id v13 = v6;
    v10 = [v9 _ltCompactMap:v12];
  }

  return v10;
}

+ (id)genderAlternativeFromDictionary:(id)a3 withGroup:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [v6 objectForKeyedSubscript:@"start"];
  v8 = [v6 objectForKeyedSubscript:@"end"];
  id v9 = [v6 objectForKeyedSubscript:@"projection"];

  v10 = [v9 objectForKeyedSubscript:@"start"];
  v11 = [v9 objectForKeyedSubscript:@"end"];
  v12 = [v9 objectForKeyedSubscript:@"default_gender"];
  id v13 = 0;
  if (v7 && v8 && v10 && v11)
  {
    id v13 = objc_alloc_init(_LTTranslationGenderAlternative);
    [(_LTTranslationGenderAlternative *)v13 setGroup:v5];
    -[_LTTranslationGenderAlternative setSourceRange:](v13, "setSourceRange:", (int)[v7 intValue], (int)(objc_msgSend(v8, "intValue") - objc_msgSend(v7, "intValue") + 1));
    -[_LTTranslationGenderAlternative setTargetRange:](v13, "setTargetRange:", (int)[v10 intValue], (int)(objc_msgSend(v11, "intValue") - objc_msgSend(v10, "intValue") + 1));
    [(_LTTranslationGenderAlternative *)v13 setDefaultGender:v12];
  }

  return v13;
}

- (_LTTranslationGenderAlternative)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_LTTranslationGenderAlternative;
  id v5 = [(_LTTranslationGenderAlternative *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"group"];
    group = v5->_group;
    v5->_group = (NSNumber *)v6;

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceRange"];
    v5->_sourceRange.location = [v8 rangeValue];
    v5->_sourceRange.length = v9;
    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"targetRange"];
    v5->_targetRange.location = [v10 rangeValue];
    v5->_targetRange.length = v11;
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"defaultGender"];
    defaultGender = v5->_defaultGender;
    v5->_defaultGender = (NSString *)v12;

    v14 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  group = self->_group;
  id v5 = a3;
  [v5 encodeObject:group forKey:@"group"];
  objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", self->_sourceRange.location, self->_sourceRange.length);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v7 forKey:@"sourceRange"];
  uint64_t v6 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", self->_targetRange.location, self->_targetRange.length);
  [v5 encodeObject:v6 forKey:@"targetRange"];
  [v5 encodeObject:self->_defaultGender forKey:@"defaultGender"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
}

- (_NSRange)sourceRange
{
  NSUInteger length = self->_sourceRange.length;
  NSUInteger location = self->_sourceRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setSourceRange:(_NSRange)a3
{
  self->_sourceRange = a3;
}

- (_NSRange)targetRange
{
  NSUInteger length = self->_targetRange.length;
  NSUInteger location = self->_targetRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setTargetRange:(_NSRange)a3
{
  self->_targetRange = a3;
}

- (NSString)defaultGender
{
  return self->_defaultGender;
}

- (void)setDefaultGender:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultGender, 0);

  objc_storeStrong((id *)&self->_group, 0);
}

@end