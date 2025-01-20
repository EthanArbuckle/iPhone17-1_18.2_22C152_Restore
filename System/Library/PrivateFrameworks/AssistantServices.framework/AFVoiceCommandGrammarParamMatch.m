@interface AFVoiceCommandGrammarParamMatch
+ (BOOL)supportsSecureCoding;
- (AFVoiceCommandGrammarParamMatch)initWithCoder:(id)a3;
- (AFVoiceCommandGrammarParamMatch)initWithText:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)text;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFVoiceCommandGrammarParamMatch

- (void).cxx_destruct
{
}

- (NSString)text
{
  return self->_text;
}

- (void)encodeWithCoder:(id)a3
{
}

- (AFVoiceCommandGrammarParamMatch)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFVoiceCommandGrammarParamMatch::text"];

  v6 = [(AFVoiceCommandGrammarParamMatch *)self initWithText:v5];
  return v6;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  [v3 appendFormat:@"text = %@", self->_text];
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFVoiceCommandGrammarParamMatch *)a3;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(AFVoiceCommandGrammarParamMatch *)v4 text];
      text = self->_text;
      BOOL v7 = text == v5 || [(NSString *)text isEqual:v5];
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (AFVoiceCommandGrammarParamMatch)initWithText:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFVoiceCommandGrammarParamMatch;
  v5 = [(AFVoiceCommandGrammarParamMatch *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    text = v5->_text;
    v5->_text = (NSString *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end