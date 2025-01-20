@interface VOTElementGesturedTextInputAttributes
- (BOOL)acceptsContractedBraille;
- (BOOL)acceptsRawInput;
- (BOOL)canDeleteCharacter;
- (BOOL)isActiveResponder;
- (BOOL)shouldEchoCharacter;
- (BOOL)shouldPlayKeyboardSecureClickSound;
- (NSString)language;
- (VOTElementGesturedTextInputAttributes)initWithAttributes:(id)a3;
- (id)_descriptionForBool:(BOOL)a3;
- (id)_descriptionForCharacterSets:(unint64_t)a3;
- (id)description;
- (unint64_t)allowedCharacterSets;
- (unint64_t)preferredCharacterSet;
- (void)setAcceptsContractedBraille:(BOOL)a3;
- (void)setAcceptsRawInput:(BOOL)a3;
- (void)setAllowedCharacterSets:(unint64_t)a3;
- (void)setCanDeleteCharacter:(BOOL)a3;
- (void)setIsActiveResponder:(BOOL)a3;
- (void)setLanguage:(id)a3;
- (void)setPreferredCharacterSet:(unint64_t)a3;
- (void)setShouldEchoCharacter:(BOOL)a3;
- (void)setShouldPlayKeyboardSecureClickSound:(BOOL)a3;
@end

@implementation VOTElementGesturedTextInputAttributes

- (VOTElementGesturedTextInputAttributes)initWithAttributes:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)VOTElementGesturedTextInputAttributes;
  v5 = [(VOTElementGesturedTextInputAttributes *)&v30 init];
  if (v5)
  {
    v6 = [v4 objectForKey:AXVoiceOverHandwritingAttributePreferredCharacterSet];
    v7 = v6;
    if (v6) {
      uint64_t v8 = (uint64_t)[v6 unsignedIntegerValue];
    }
    else {
      uint64_t v8 = 1;
    }
    [(VOTElementGesturedTextInputAttributes *)v5 setPreferredCharacterSet:v8];
    v9 = [v4 objectForKey:AXVoiceOverHandwritingAttributeAllowedCharacterSets];
    v10 = v9;
    if (v9) {
      uint64_t v11 = (uint64_t)[v9 unsignedIntegerValue];
    }
    else {
      uint64_t v11 = 15;
    }
    [(VOTElementGesturedTextInputAttributes *)v5 setAllowedCharacterSets:v11];
    v12 = [v4 objectForKey:AXVoiceOverHandwritingAttributeCanDeleteCharacter];
    v13 = v12;
    if (v12) {
      uint64_t v14 = (uint64_t)[v12 BOOLValue];
    }
    else {
      uint64_t v14 = 1;
    }
    [(VOTElementGesturedTextInputAttributes *)v5 setCanDeleteCharacter:v14];
    v15 = [v4 objectForKey:AXVoiceOverHandwritingAttributeShouldEchoCharacter];
    v16 = v15;
    if (v15) {
      uint64_t v17 = (uint64_t)[v15 BOOLValue];
    }
    else {
      uint64_t v17 = 1;
    }
    [(VOTElementGesturedTextInputAttributes *)v5 setShouldEchoCharacter:v17];
    v18 = [v4 objectForKey:AXVoiceOverHandwritingAttributeShouldPlayKeyboardSecureClickSound];
    v19 = v18;
    if (v18) {
      id v20 = [v18 BOOLValue];
    }
    else {
      id v20 = 0;
    }
    [(VOTElementGesturedTextInputAttributes *)v5 setShouldPlayKeyboardSecureClickSound:v20];
    v21 = [v4 objectForKey:AXVoiceOverHandwritingAttributeAcceptsRawInput];
    v22 = v21;
    if (v21) {
      id v23 = [v21 BOOLValue];
    }
    else {
      id v23 = 0;
    }
    [(VOTElementGesturedTextInputAttributes *)v5 setAcceptsRawInput:v23];
    v24 = [v4 objectForKey:AXVoiceOverHandwritingAttributeAcceptsContractedBraille];
    v25 = v24;
    if (v24) {
      id v26 = [v24 BOOLValue];
    }
    else {
      id v26 = 0;
    }
    [(VOTElementGesturedTextInputAttributes *)v5 setAcceptsContractedBraille:v26];
    v27 = [v4 objectForKeyedSubscript:AXVoiceOverHandwritingAttributeLanguage];
    [(VOTElementGesturedTextInputAttributes *)v5 setLanguage:v27];

    v28 = [v4 objectForKeyedSubscript:@"AXIsActiveResponder"];
    -[VOTElementGesturedTextInputAttributes setIsActiveResponder:](v5, "setIsActiveResponder:", [v28 BOOLValue]);
  }
  return v5;
}

- (id)_descriptionForCharacterSets:(unint64_t)a3
{
  id v4 = +[NSMutableString string];
  v5 = v4;
  if (a3 == 15)
  {
    [v4 appendString:@"all"];
    goto LABEL_8;
  }
  if (a3)
  {
    [v4 appendStringWithComma:@"lowercase"];
    if ((a3 & 2) == 0)
    {
LABEL_5:
      if ((a3 & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  else if ((a3 & 2) == 0)
  {
    goto LABEL_5;
  }
  [v5 appendStringWithComma:@"uppercase"];
  if ((a3 & 4) == 0)
  {
LABEL_6:
    if ((a3 & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_13:
  [v5 appendStringWithComma:@"numbers"];
  if ((a3 & 8) != 0) {
LABEL_7:
  }
    [v5 appendStringWithComma:@"punctuation"];
LABEL_8:

  return v5;
}

- (id)_descriptionForBool:(BOOL)a3
{
  if (a3) {
    return @"YES";
  }
  else {
    return @"NO";
  }
}

- (id)description
{
  v14.receiver = self;
  v14.super_class = (Class)VOTElementGesturedTextInputAttributes;
  v3 = [(VOTElementGesturedTextInputAttributes *)&v14 description];
  id v4 = [(VOTElementGesturedTextInputAttributes *)self _descriptionForCharacterSets:[(VOTElementGesturedTextInputAttributes *)self preferredCharacterSet]];
  v5 = [(VOTElementGesturedTextInputAttributes *)self _descriptionForCharacterSets:[(VOTElementGesturedTextInputAttributes *)self allowedCharacterSets]];
  v6 = [(VOTElementGesturedTextInputAttributes *)self _descriptionForBool:[(VOTElementGesturedTextInputAttributes *)self canDeleteCharacter]];
  v7 = [(VOTElementGesturedTextInputAttributes *)self _descriptionForBool:[(VOTElementGesturedTextInputAttributes *)self shouldEchoCharacter]];
  uint64_t v8 = [(VOTElementGesturedTextInputAttributes *)self _descriptionForBool:[(VOTElementGesturedTextInputAttributes *)self shouldPlayKeyboardSecureClickSound]];
  v9 = [(VOTElementGesturedTextInputAttributes *)self _descriptionForBool:[(VOTElementGesturedTextInputAttributes *)self acceptsRawInput]];
  v10 = [(VOTElementGesturedTextInputAttributes *)self _descriptionForBool:[(VOTElementGesturedTextInputAttributes *)self acceptsContractedBraille]];
  uint64_t v11 = [(VOTElementGesturedTextInputAttributes *)self language];
  v12 = [v3 stringByAppendingFormat:@"- preferred character set %@, allowed character sets %@, can delete character %@, should echo character %@, should play secure click %@, accepts raw input %@, accepts contracted braille %@, language %@", v4, v5, v6, v7, v8, v9, v10, v11];

  return v12;
}

- (unint64_t)preferredCharacterSet
{
  return self->_preferredCharacterSet;
}

- (void)setPreferredCharacterSet:(unint64_t)a3
{
  self->_preferredCharacterSet = a3;
}

- (unint64_t)allowedCharacterSets
{
  return self->_allowedCharacterSets;
}

- (void)setAllowedCharacterSets:(unint64_t)a3
{
  self->_allowedCharacterSets = a3;
}

- (BOOL)canDeleteCharacter
{
  return self->_canDeleteCharacter;
}

- (void)setCanDeleteCharacter:(BOOL)a3
{
  self->_canDeleteCharacter = a3;
}

- (BOOL)shouldEchoCharacter
{
  return self->_shouldEchoCharacter;
}

- (void)setShouldEchoCharacter:(BOOL)a3
{
  self->_shouldEchoCharacter = a3;
}

- (BOOL)acceptsRawInput
{
  return self->_acceptsRawInput;
}

- (void)setAcceptsRawInput:(BOOL)a3
{
  self->_acceptsRawInput = a3;
}

- (BOOL)shouldPlayKeyboardSecureClickSound
{
  return self->_shouldPlayKeyboardSecureClickSound;
}

- (void)setShouldPlayKeyboardSecureClickSound:(BOOL)a3
{
  self->_shouldPlayKeyboardSecureClickSound = a3;
}

- (BOOL)acceptsContractedBraille
{
  return self->_acceptsContractedBraille;
}

- (void)setAcceptsContractedBraille:(BOOL)a3
{
  self->_acceptsContractedBraille = a3;
}

- (BOOL)isActiveResponder
{
  return self->_isActiveResponder;
}

- (void)setIsActiveResponder:(BOOL)a3
{
  self->_isActiveResponder = a3;
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end