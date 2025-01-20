@interface ABVCardActivityAlertScanner
+ (BOOL)characterIsStringValueCharacter:(unsigned __int16)a3;
+ (id)scanAlertValueFromString:(id)a3;
+ (id)scannerWithString:(id)a3;
- (ABVCardActivityAlertScanner)initWithString:(id)a3;
- (BOOL)atEnd;
- (BOOL)scanPastCharacter:(unsigned __int16)a3;
- (BOOL)scanPastItemDelimiter;
- (BOOL)scanPastKeyValueSeparator;
- (id)scanAlertValue;
- (id)scanKeyValuePair;
- (id)scanQuotedStringValue;
- (id)scanStringValue;
- (id)scanUnquotedStringValue;
- (unint64_t)position;
- (unsigned)nextCharacter;
- (unsigned)nextUnescapedCharacter;
- (unsigned)scanCharacter;
- (unsigned)scanCharacterWithEscaping:(BOOL)a3;
- (void)dealloc;
- (void)scanPastWhitespace;
@end

@implementation ABVCardActivityAlertScanner

+ (id)scanAlertValueFromString:(id)a3
{
  v3 = (void *)[a1 scannerWithString:a3];
  return (id)[v3 scanAlertValue];
}

+ (id)scannerWithString:(id)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithString:a3];
  return v3;
}

- (ABVCardActivityAlertScanner)initWithString:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ABVCardActivityAlertScanner;
  v4 = [(ABVCardActivityAlertScanner *)&v6 init];
  if (v4)
  {
    v4->_string = (NSString *)[a3 copy];
    v4->_position = 0;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ABVCardActivityAlertScanner;
  [(ABVCardActivityAlertScanner *)&v3 dealloc];
}

- (id)scanAlertValue
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  do
    objc_msgSend(v3, "addEntriesFromDictionary:", -[ABVCardActivityAlertScanner scanKeyValuePair](self, "scanKeyValuePair"));
  while ([(ABVCardActivityAlertScanner *)self scanPastItemDelimiter]);
  return v3;
}

- (id)scanKeyValuePair
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(ABVCardActivityAlertScanner *)self scanStringValue];
  [(ABVCardActivityAlertScanner *)self scanPastKeyValueSeparator];
  id v4 = [(ABVCardActivityAlertScanner *)self scanStringValue];
  if (!v3) {
    return 0;
  }
  v5 = v4;
  char v6 = [v3 isEqualToString:&stru_1EF03E278];
  id result = 0;
  if ((v6 & 1) == 0 && v5)
  {
    if ([v5 isEqualToString:&stru_1EF03E278]) {
      return 0;
    }
    id v8 = v3;
    v9[0] = v5;
    return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  }
  return result;
}

- (id)scanStringValue
{
  if ([(ABVCardActivityAlertScanner *)self atEnd]) {
    return 0;
  }
  if ([(ABVCardActivityAlertScanner *)self nextUnescapedCharacter] == 34)
  {
    return [(ABVCardActivityAlertScanner *)self scanQuotedStringValue];
  }
  else
  {
    return [(ABVCardActivityAlertScanner *)self scanUnquotedStringValue];
  }
}

- (id)scanUnquotedStringValue
{
  id v3 = (void *)[MEMORY[0x1E4F28E78] string];
  if (![(ABVCardActivityAlertScanner *)self atEnd])
  {
    do
    {
      if (!objc_msgSend((id)objc_opt_class(), "characterIsStringValueCharacter:", -[ABVCardActivityAlertScanner nextCharacter](self, "nextCharacter")))break; {
      objc_msgSend(v3, "appendFormat:", @"%c", -[ABVCardActivityAlertScanner scanCharacter](self, "scanCharacter"));
      }
    }
    while (![(ABVCardActivityAlertScanner *)self atEnd]);
  }
  if (!v3 || [v3 isEqualToString:&stru_1EF03E278]) {
    return 0;
  }
  return v3;
}

- (id)scanQuotedStringValue
{
  [(ABVCardActivityAlertScanner *)self scanCharacter];
  id v3 = (void *)[MEMORY[0x1E4F28E78] string];
  if (![(ABVCardActivityAlertScanner *)self atEnd])
  {
    do
    {
      if ([(ABVCardActivityAlertScanner *)self nextUnescapedCharacter] == 34) {
        break;
      }
      objc_msgSend(v3, "appendFormat:", @"%c", -[ABVCardActivityAlertScanner scanCharacter](self, "scanCharacter"));
    }
    while (![(ABVCardActivityAlertScanner *)self atEnd]);
  }
  [(ABVCardActivityAlertScanner *)self scanCharacter];
  return v3;
}

+ (BOOL)characterIsStringValueCharacter:(unsigned __int16)a3
{
  int v3 = a3;
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B88], "whitespaceCharacterSet"), "characterIsMember:", a3)) {
    return 0;
  }
  return v3 != 61 && v3 != 44;
}

- (BOOL)scanPastKeyValueSeparator
{
  return [(ABVCardActivityAlertScanner *)self scanPastCharacter:61];
}

- (BOOL)scanPastItemDelimiter
{
  return [(ABVCardActivityAlertScanner *)self scanPastCharacter:44];
}

- (unsigned)scanCharacter
{
  return [(ABVCardActivityAlertScanner *)self scanCharacterWithEscaping:1];
}

- (unsigned)scanCharacterWithEscaping:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(ABVCardActivityAlertScanner *)self atEnd])
  {
    LOWORD(v5) = 0;
  }
  else
  {
    string = self->_string;
    ++self->_position;
    int v5 = -[NSString characterAtIndex:](string, "characterAtIndex:");
    if (v5 == 92 && v3)
    {
      LOWORD(v5) = [(ABVCardActivityAlertScanner *)self scanCharacterWithEscaping:0];
    }
  }
  return v5;
}

- (BOOL)scanPastCharacter:(unsigned __int16)a3
{
  int v3 = a3;
  [(ABVCardActivityAlertScanner *)self scanPastWhitespace];
  unint64_t position = self->_position;
  int v6 = [(ABVCardActivityAlertScanner *)self scanCharacter];
  if (v6 == v3) {
    [(ABVCardActivityAlertScanner *)self scanPastWhitespace];
  }
  else {
    self->_unint64_t position = position;
  }
  return v6 == v3;
}

- (void)scanPastWhitespace
{
  int v3 = [(ABVCardActivityAlertScanner *)self nextCharacter];
  if (v3)
  {
    unsigned __int16 v4 = v3;
    do
    {
      if (!objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B88], "whitespaceCharacterSet"), "characterIsMember:", v4))break; {
      [(ABVCardActivityAlertScanner *)self scanCharacter];
      }
      int v5 = [(ABVCardActivityAlertScanner *)self nextCharacter];
      unsigned __int16 v4 = v5;
    }
    while (v5);
  }
}

- (unsigned)nextCharacter
{
  unint64_t position = self->_position;
  unsigned __int16 result = [(ABVCardActivityAlertScanner *)self scanCharacter];
  self->_unint64_t position = position;
  return result;
}

- (unsigned)nextUnescapedCharacter
{
  unint64_t position = self->_position;
  unsigned __int16 result = [(ABVCardActivityAlertScanner *)self scanCharacterWithEscaping:0];
  self->_unint64_t position = position;
  return result;
}

- (unint64_t)position
{
  return self->_position;
}

- (BOOL)atEnd
{
  unint64_t position = self->_position;
  return position >= [(NSString *)self->_string length];
}

@end