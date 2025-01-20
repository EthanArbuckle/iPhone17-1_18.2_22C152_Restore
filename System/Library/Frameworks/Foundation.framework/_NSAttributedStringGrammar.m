@interface _NSAttributedStringGrammar
+ (_NSAttributedStringGrammar)identityGrammar;
- (BOOL)isEqual:(id)a3;
- (_NSAttributedStringGrammar)init;
- (_NSAttributedStringGrammar)initWithMorphology:(id)a3;
- (id)_initWithMarkdownDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)aspect;
- (int64_t)deictic;
- (int64_t)determinationType;
- (int64_t)gender;
- (int64_t)grammaticalCase;
- (int64_t)mood;
- (int64_t)number;
- (int64_t)person;
- (int64_t)position;
- (int64_t)tense;
- (int64_t)verbForm;
- (unint64_t)hash;
- (void)setAspect:(int64_t)a3;
- (void)setDeictic:(int64_t)a3;
- (void)setDeterminationType:(int64_t)a3;
- (void)setGender:(int64_t)a3;
- (void)setGrammaticalCase:(int64_t)a3;
- (void)setMood:(int64_t)a3;
- (void)setNumber:(int64_t)a3;
- (void)setPerson:(int64_t)a3;
- (void)setPosition:(int64_t)a3;
- (void)setTense:(int64_t)a3;
- (void)setVerbForm:(int64_t)a3;
@end

@implementation _NSAttributedStringGrammar

- (_NSAttributedStringGrammar)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)_NSAttributedStringGrammar;
  return [(_NSAttributedStringGrammar *)&v3 init];
}

+ (_NSAttributedStringGrammar)identityGrammar
{
  id v2 = objc_alloc_init((Class)a1);

  return (_NSAttributedStringGrammar *)v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_alloc_init(_NSAttributedStringGrammar);
  v4->_aspect = [(_NSAttributedStringGrammar *)self aspect];
  v4->_deictic = [(_NSAttributedStringGrammar *)self deictic];
  v4->_determinationType = [(_NSAttributedStringGrammar *)self determinationType];
  v4->_gender = [(_NSAttributedStringGrammar *)self gender];
  v4->_grammaticalCase = [(_NSAttributedStringGrammar *)self grammaticalCase];
  v4->_mood = [(_NSAttributedStringGrammar *)self mood];
  v4->_number = [(_NSAttributedStringGrammar *)self number];
  v4->_person = [(_NSAttributedStringGrammar *)self person];
  v4->_position = [(_NSAttributedStringGrammar *)self position];
  v4->_tense = [(_NSAttributedStringGrammar *)self tense];
  v4->_verbForm = [(_NSAttributedStringGrammar *)self verbForm];
  return v4;
}

- (unint64_t)hash
{
  uint64_t v3 = [(id)objc_opt_class() hash];
  int64_t v4 = [(_NSAttributedStringGrammar *)self aspect];
  int64_t v5 = v4 ^ [(_NSAttributedStringGrammar *)self deictic] ^ v3;
  int64_t v6 = [(_NSAttributedStringGrammar *)self determinationType];
  int64_t v7 = v6 ^ [(_NSAttributedStringGrammar *)self gender];
  int64_t v8 = v5 ^ v7 ^ [(_NSAttributedStringGrammar *)self grammaticalCase];
  int64_t v9 = [(_NSAttributedStringGrammar *)self mood];
  int64_t v10 = v9 ^ [(_NSAttributedStringGrammar *)self number];
  int64_t v11 = v10 ^ [(_NSAttributedStringGrammar *)self person];
  int64_t v12 = v8 ^ v11 ^ [(_NSAttributedStringGrammar *)self position];
  int64_t v13 = [(_NSAttributedStringGrammar *)self tense];
  return v12 ^ v13 ^ [(_NSAttributedStringGrammar *)self verbForm];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  int64_t v5 = [(_NSAttributedStringGrammar *)self aspect];
  if (v5 != [a3 aspect]) {
    return 0;
  }
  int64_t v6 = [(_NSAttributedStringGrammar *)self deictic];
  if (v6 != [a3 deictic]) {
    return 0;
  }
  int64_t v7 = [(_NSAttributedStringGrammar *)self determinationType];
  if (v7 != [a3 determinationType]) {
    return 0;
  }
  int64_t v8 = [(_NSAttributedStringGrammar *)self gender];
  if (v8 != [a3 gender]) {
    return 0;
  }
  int64_t v9 = [(_NSAttributedStringGrammar *)self grammaticalCase];
  if (v9 != [a3 grammaticalCase]) {
    return 0;
  }
  int64_t v10 = [(_NSAttributedStringGrammar *)self mood];
  if (v10 != [a3 mood]) {
    return 0;
  }
  int64_t v11 = [(_NSAttributedStringGrammar *)self number];
  if (v11 != [a3 number]) {
    return 0;
  }
  int64_t v12 = [(_NSAttributedStringGrammar *)self person];
  if (v12 != [a3 person]) {
    return 0;
  }
  int64_t v13 = [(_NSAttributedStringGrammar *)self position];
  if (v13 != [a3 position]) {
    return 0;
  }
  int64_t v14 = [(_NSAttributedStringGrammar *)self tense];
  if (v14 != [a3 tense]) {
    return 0;
  }
  int64_t v15 = [(_NSAttributedStringGrammar *)self verbForm];
  return v15 == [a3 verbForm];
}

- (_NSAttributedStringGrammar)initWithMorphology:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)_NSAttributedStringGrammar;
  int64_t v4 = [(_NSAttributedStringGrammar *)&v14 init];
  if (v4)
  {
    unint64_t v5 = [a3 grammaticalGender];
    if (v5 <= 3) {
      [(_NSAttributedStringGrammar *)v4 setGender:qword_182371C50[v5]];
    }
    unint64_t v6 = [a3 number];
    if (v6 <= 6) {
      [(_NSAttributedStringGrammar *)v4 setNumber:qword_182371C70[v6]];
    }
    unint64_t v7 = [a3 partOfSpeech];
    if (v7 <= 0xE) {
      [(_NSAttributedStringGrammar *)v4 setPosition:v7];
    }
    unint64_t v8 = [a3 grammaticalCase] - 1;
    if (v8 > 0xC) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = qword_182371CA8[v8];
    }
    [(_NSAttributedStringGrammar *)v4 setGrammaticalCase:v9];
    uint64_t v10 = [a3 definiteness];
    uint64_t v11 = 3;
    if (v10 != 1) {
      uint64_t v11 = 0;
    }
    if (v10 == 2) {
      uint64_t v12 = 2;
    }
    else {
      uint64_t v12 = v11;
    }
    [(_NSAttributedStringGrammar *)v4 setDeterminationType:v12];
  }
  return v4;
}

- (int64_t)aspect
{
  return self->_aspect;
}

- (void)setAspect:(int64_t)a3
{
  self->_aspect = a3;
}

- (int64_t)deictic
{
  return self->_deictic;
}

- (void)setDeictic:(int64_t)a3
{
  self->_deictic = a3;
}

- (int64_t)determinationType
{
  return self->_determinationType;
}

- (void)setDeterminationType:(int64_t)a3
{
  self->_determinationType = a3;
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

- (int64_t)mood
{
  return self->_mood;
}

- (void)setMood:(int64_t)a3
{
  self->_mood = a3;
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

- (int64_t)position
{
  return self->_position;
}

- (void)setPosition:(int64_t)a3
{
  self->_position = a3;
}

- (int64_t)tense
{
  return self->_tense;
}

- (void)setTense:(int64_t)a3
{
  self->_tense = a3;
}

- (int64_t)verbForm
{
  return self->_verbForm;
}

- (void)setVerbForm:(int64_t)a3
{
  self->_verbForm = a3;
}

- (id)_initWithMarkdownDictionary:(id)a3
{
  int64_t v4 = [(_NSAttributedStringGrammar *)self init];
  if (v4)
  {
    unint64_t v5 = (void *)[a3 objectForKeyedSubscript:@"aspect"];
    if (v5 && (unint64_t v6 = v5, ([v5 isEqual:@"none"] & 1) == 0))
    {
      if ([v6 isEqual:@"perfect"])
      {
        uint64_t v7 = 1;
      }
      else
      {
        if (([v6 isEqual:@"imperfect"] & 1) == 0) {
          goto LABEL_152;
        }
        uint64_t v7 = 2;
      }
    }
    else
    {
      uint64_t v7 = 0;
    }
    [(_NSAttributedStringGrammar *)v4 setAspect:v7];
    unint64_t v8 = (void *)[a3 objectForKeyedSubscript:@"deictic"];
    if (v8 && (uint64_t v9 = v8, ([v8 isEqual:@"none"] & 1) == 0))
    {
      if ([v9 isEqual:@"distal"])
      {
        uint64_t v10 = 1;
      }
      else
      {
        if (([v9 isEqual:@"proximal"] & 1) == 0) {
          goto LABEL_152;
        }
        uint64_t v10 = 2;
      }
    }
    else
    {
      uint64_t v10 = 0;
    }
    [(_NSAttributedStringGrammar *)v4 setDeictic:v10];
    uint64_t v11 = (void *)[a3 objectForKeyedSubscript:@"determinationType"];
    if (v11 && (uint64_t v12 = v11, ([v11 isEqual:@"none"] & 1) == 0))
    {
      if ([v12 isEqual:@"demonstrative"])
      {
        uint64_t v13 = 1;
      }
      else if ([v12 isEqual:@"definite"])
      {
        uint64_t v13 = 2;
      }
      else
      {
        if (([v12 isEqual:@"indefinite"] & 1) == 0) {
          goto LABEL_152;
        }
        uint64_t v13 = 3;
      }
    }
    else
    {
      uint64_t v13 = 0;
    }
    [(_NSAttributedStringGrammar *)v4 setDeterminationType:v13];
    objc_super v14 = (void *)[a3 objectForKeyedSubscript:@"grammaticalGender"];
    if (v14 && (uint64_t v15 = v14, ([v14 isEqual:@"none"] & 1) == 0))
    {
      if ([v15 isEqual:@"masculine"])
      {
        uint64_t v16 = 1;
      }
      else if ([v15 isEqual:@"feminine"])
      {
        uint64_t v16 = 2;
      }
      else if ([v15 isEqual:@"neuter"])
      {
        uint64_t v16 = 3;
      }
      else
      {
        if (([v15 isEqual:@"common"] & 1) == 0) {
          goto LABEL_152;
        }
        uint64_t v16 = 4;
      }
    }
    else
    {
      uint64_t v16 = 0;
    }
    [(_NSAttributedStringGrammar *)v4 setGender:v16];
    v17 = (void *)[a3 objectForKeyedSubscript:@"grammaticalCase"];
    if (v17 && (v18 = v17, ([v17 isEqual:@"none"] & 1) == 0))
    {
      if ([v18 isEqual:@"accusative"])
      {
        uint64_t v19 = 1;
      }
      else if ([v18 isEqual:@"dative"])
      {
        uint64_t v19 = 2;
      }
      else if ([v18 isEqual:@"genitive"])
      {
        uint64_t v19 = 3;
      }
      else if ([v18 isEqual:@"locative"])
      {
        uint64_t v19 = 4;
      }
      else if ([v18 isEqual:@"nominative"])
      {
        uint64_t v19 = 5;
      }
      else if ([v18 isEqual:@"partitive"])
      {
        uint64_t v19 = 6;
      }
      else if ([v18 isEqual:@"instrumental"])
      {
        uint64_t v19 = 7;
      }
      else if ([v18 isEqual:@"prepositional"])
      {
        uint64_t v19 = 8;
      }
      else if ([v18 isEqual:@"object"])
      {
        uint64_t v19 = 9;
      }
      else if ([v18 isEqual:@"directObject"])
      {
        uint64_t v19 = 10;
      }
      else
      {
        if (([v18 isEqual:@"indirectObject"] & 1) == 0) {
          goto LABEL_152;
        }
        uint64_t v19 = 11;
      }
    }
    else
    {
      uint64_t v19 = 0;
    }
    [(_NSAttributedStringGrammar *)v4 setGrammaticalCase:v19];
    v20 = (void *)[a3 objectForKeyedSubscript:@"mood"];
    if (v20 && (v21 = v20, ([v20 isEqual:@"none"] & 1) == 0))
    {
      if ([v21 isEqual:@"conditional"])
      {
        uint64_t v22 = 1;
      }
      else if ([v21 isEqual:@"subjunctive"])
      {
        uint64_t v22 = 2;
      }
      else if ([v21 isEqual:@"imperative"])
      {
        uint64_t v22 = 3;
      }
      else
      {
        if (([v21 isEqual:@"indicative"] & 1) == 0) {
          goto LABEL_152;
        }
        uint64_t v22 = 4;
      }
    }
    else
    {
      uint64_t v22 = 0;
    }
    [(_NSAttributedStringGrammar *)v4 setMood:v22];
    v23 = (void *)[a3 objectForKeyedSubscript:@"number"];
    if (v23 && (v24 = v23, ([v23 isEqual:@"none"] & 1) == 0))
    {
      if ([v24 isEqual:@"one"])
      {
        uint64_t v25 = 1;
      }
      else if ([v24 isEqual:@"two"])
      {
        uint64_t v25 = 2;
      }
      else if ([v24 isEqual:@"few"])
      {
        uint64_t v25 = 3;
      }
      else if ([v24 isEqual:@"many"])
      {
        uint64_t v25 = 4;
      }
      else if ([v24 isEqual:@"zero"])
      {
        uint64_t v25 = 5;
      }
      else
      {
        if (([v24 isEqual:@"other"] & 1) == 0) {
          goto LABEL_152;
        }
        uint64_t v25 = 6;
      }
    }
    else
    {
      uint64_t v25 = 0;
    }
    [(_NSAttributedStringGrammar *)v4 setNumber:v25];
    v26 = (void *)[a3 objectForKeyedSubscript:@"person"];
    if (v26 && (v27 = v26, ([v26 isEqual:@"none"] & 1) == 0))
    {
      if ([v27 isEqual:@"first"])
      {
        uint64_t v28 = 1;
      }
      else if ([v27 isEqual:@"second"])
      {
        uint64_t v28 = 2;
      }
      else
      {
        if (([v27 isEqual:@"third"] & 1) == 0) {
          goto LABEL_152;
        }
        uint64_t v28 = 3;
      }
    }
    else
    {
      uint64_t v28 = 0;
    }
    [(_NSAttributedStringGrammar *)v4 setPerson:v28];
    v29 = (void *)[a3 objectForKeyedSubscript:@"partOfSpeech"];
    if (v29 && (v30 = v29, ([v29 isEqual:@"none"] & 1) == 0))
    {
      if ([v30 isEqual:@"determiner"])
      {
        uint64_t v31 = 1;
      }
      else if ([v30 isEqual:@"pronoun"])
      {
        uint64_t v31 = 2;
      }
      else if ([v30 isEqual:@"letter"])
      {
        uint64_t v31 = 3;
      }
      else if ([v30 isEqual:@"adverb"])
      {
        uint64_t v31 = 4;
      }
      else if ([v30 isEqual:@"particle"])
      {
        uint64_t v31 = 5;
      }
      else if ([v30 isEqual:@"adjective"])
      {
        uint64_t v31 = 6;
      }
      else if ([v30 isEqual:@"adposition"])
      {
        uint64_t v31 = 7;
      }
      else if ([v30 isEqual:@"verb"])
      {
        uint64_t v31 = 8;
      }
      else if ([v30 isEqual:@"noun"])
      {
        uint64_t v31 = 9;
      }
      else if ([v30 isEqual:@"conjunction"])
      {
        uint64_t v31 = 10;
      }
      else if ([v30 isEqual:@"numeral"])
      {
        uint64_t v31 = 11;
      }
      else if ([v30 isEqual:@"interjection"])
      {
        uint64_t v31 = 12;
      }
      else if ([v30 isEqual:@"preposition"])
      {
        uint64_t v31 = 13;
      }
      else
      {
        if (([v30 isEqual:@"abbreviation"] & 1) == 0) {
          goto LABEL_152;
        }
        uint64_t v31 = 14;
      }
    }
    else
    {
      uint64_t v31 = 0;
    }
    [(_NSAttributedStringGrammar *)v4 setPosition:v31];
    v32 = (void *)[a3 objectForKeyedSubscript:@"tense"];
    if (v32 && (v33 = v32, ([v32 isEqual:@"none"] & 1) == 0))
    {
      if ([v33 isEqual:@"past"])
      {
        uint64_t v34 = 1;
      }
      else if ([v33 isEqual:@"present"])
      {
        uint64_t v34 = 2;
      }
      else
      {
        if (([v33 isEqual:@"future"] & 1) == 0) {
          goto LABEL_152;
        }
        uint64_t v34 = 3;
      }
    }
    else
    {
      uint64_t v34 = 0;
    }
    [(_NSAttributedStringGrammar *)v4 setTense:v34];
    v35 = (void *)[a3 objectForKeyedSubscript:@"verbForm"];
    if (!v35)
    {
      v38 = v4;
      uint64_t v37 = 0;
LABEL_119:
      [(_NSAttributedStringGrammar *)v38 setVerbForm:v37];
      return v4;
    }
    v36 = v35;
    if ([v35 isEqual:@"none"])
    {
      uint64_t v37 = 0;
LABEL_118:
      v38 = v4;
      goto LABEL_119;
    }
    if ([v36 isEqual:@"gerund"])
    {
      uint64_t v37 = 1;
      goto LABEL_118;
    }
    if ([v36 isEqual:@"participative"])
    {
      uint64_t v37 = 2;
      goto LABEL_118;
    }
    if ([v36 isEqual:@"infinitive"])
    {
      uint64_t v37 = 3;
      goto LABEL_118;
    }
    if ([v36 isEqual:@"participle"])
    {
      uint64_t v37 = 4;
      goto LABEL_118;
    }
    if ([v36 isEqual:@"supine"])
    {
      uint64_t v37 = 5;
      goto LABEL_118;
    }
LABEL_152:

    return 0;
  }
  return v4;
}

@end