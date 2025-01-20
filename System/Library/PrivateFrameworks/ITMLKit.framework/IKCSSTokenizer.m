@interface IKCSSTokenizer
+ (BOOL)isDigit:(unsigned __int16)a3;
+ (BOOL)isHexDigit:(unsigned __int16)a3;
+ (BOOL)isLetter:(unsigned __int16)a3;
+ (BOOL)isLowercaseLetter:(unsigned __int16)a3;
+ (BOOL)isNameCodePoint:(unsigned __int16)a3;
+ (BOOL)isNameStartCodePoint:(unsigned __int16)a3;
+ (BOOL)isNewline:(unsigned __int16)a3;
+ (BOOL)isNonASCIICodePoint:(unsigned __int16)a3;
+ (BOOL)isNonPrintable:(unsigned __int16)a3;
+ (BOOL)isUppercaseLetter:(unsigned __int16)a3;
+ (BOOL)isWhitespace:(unsigned __int16)a3;
- (BOOL)isEOF:(unint64_t)a3;
- (BOOL)isValidEscape:(unint64_t)a3;
- (BOOL)wouldStartIdentifier:(unint64_t)a3;
- (BOOL)wouldStartNumber:(unint64_t)a3;
- (IKCSSToken)currentToken;
- (IKCSSTokenizer)initWithText:(id)a3;
- (id)_consumeAsterisk:(unint64_t)a3 consumed:(unint64_t *)a4;
- (id)_consumeAt:(unint64_t)a3 consumed:(unint64_t *)a4;
- (id)_consumeBackslash:(unint64_t)a3 consumed:(unint64_t *)a4;
- (id)_consumeCaret:(unint64_t)a3 consumed:(unint64_t *)a4;
- (id)_consumeComment:(unint64_t)a3 consumed:(unint64_t *)a4;
- (id)_consumeDollar:(unint64_t)a3 consumed:(unint64_t *)a4;
- (id)_consumeDot:(unint64_t)a3 consumed:(unint64_t *)a4;
- (id)_consumeHash:(unint64_t)a3 consumed:(unint64_t *)a4;
- (id)_consumeIdentLike:(unint64_t)a3 consumed:(unint64_t *)a4;
- (id)_consumeLessThan:(unint64_t)a3 consumed:(unint64_t *)a4;
- (id)_consumeMinus:(unint64_t)a3 consumed:(unint64_t *)a4;
- (id)_consumeName:(unint64_t)a3 consumed:(unint64_t *)a4;
- (id)_consumeNameStart:(unint64_t)a3 consumed:(unint64_t *)a4;
- (id)_consumeNumber:(unint64_t)a3 consumed:(unint64_t *)a4;
- (id)_consumeNumeric:(unint64_t)a3 consumed:(unint64_t *)a4;
- (id)_consumePipe:(unint64_t)a3 consumed:(unint64_t *)a4;
- (id)_consumePlus:(unint64_t)a3 consumed:(unint64_t *)a4;
- (id)_consumeSlash:(unint64_t)a3 consumed:(unint64_t *)a4;
- (id)_consumeString:(unint64_t)a3 consumed:(unint64_t *)a4 toEndChar:(unsigned __int16)a5;
- (id)_consumeTilde:(unint64_t)a3 consumed:(unint64_t *)a4;
- (id)_consumeToken:(unint64_t)a3 consumed:(unint64_t *)a4;
- (id)_consumeUnicodeRange:(unint64_t)a3 consumed:(unint64_t *)a4;
- (id)_consumeUrl:(unint64_t)a3 consumed:(unint64_t *)a4;
- (id)_consumeWhitespace:(unint64_t)a3 consumed:(unint64_t *)a4;
- (id)getNextToken;
- (unsigned)_consumeEscapedCodePoint:(unint64_t)a3 consumed:(unint64_t *)a4;
- (unsigned)_getChar:(unint64_t)a3;
- (void)_consumeBadUrlRemnants:(unint64_t)a3 consumed:(unint64_t *)a4;
- (void)dealloc;
- (void)reconsumeToken:(id)a3;
@end

@implementation IKCSSTokenizer

- (IKCSSTokenizer)initWithText:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IKCSSTokenizer;
  v5 = [(IKCSSTokenizer *)&v11 init];
  v6 = v5;
  if (v5)
  {
    v5->currentOffset = 0;
    uint64_t v7 = [v4 length];
    v6->textBytesCharCount = v7;
    v8 = (unsigned __int16 *)malloc_type_malloc(2 * v7, 0x252EF28uLL);
    v6->textBytes = v8;
    objc_msgSend(v4, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v8, 2 * v6->textBytesCharCount, 0, 10, 0, 0, objc_msgSend(v4, "length"), 0);
    reconsumeToken = v6->reconsumeToken;
    v6->reconsumeToken = 0;
  }
  return v6;
}

- (void)dealloc
{
  textBytes = self->textBytes;
  if (textBytes) {
    free(textBytes);
  }
  v4.receiver = self;
  v4.super_class = (Class)IKCSSTokenizer;
  [(IKCSSTokenizer *)&v4 dealloc];
}

- (id)getNextToken
{
  v3 = (void *)MEMORY[0x1E4E655C0](self, a2);
  reconsumeToken = self->reconsumeToken;
  if (reconsumeToken)
  {
    v5 = reconsumeToken;
    v6 = self->reconsumeToken;
    self->reconsumeToken = 0;
  }
  else
  {
    uint64_t v8 = 0;
    v5 = [(IKCSSTokenizer *)self _consumeToken:self->currentOffset consumed:&v8];
    self->currentOffset += v8;
  }
  objc_storeStrong((id *)&self->_currentToken, v5);
  return v5;
}

- (void)reconsumeToken:(id)a3
{
}

- (id)_consumeToken:(unint64_t)a3 consumed:(unint64_t *)a4
{
  uint64_t v14 = 0;
  if (-[IKCSSTokenizer isEOF:](self, "isEOF:"))
  {
    uint64_t v7 = [[IKCSSToken alloc] initWithType:2];
    uint64_t v8 = 0;
    --a3;
    goto LABEL_35;
  }
  uint64_t v9 = [(IKCSSTokenizer *)self _getChar:a3];
  if (+[IKCSSTokenizer isWhitespace:v9])
  {
    uint64_t v10 = [(IKCSSTokenizer *)self _consumeWhitespace:a3 + 1 consumed:&v14];
    goto LABEL_33;
  }
  if ((int)v9 <= 90)
  {
    switch((int)v9)
    {
      case '""':
      case '\'':
        uint64_t v10 = [(IKCSSTokenizer *)self _consumeString:a3 + 1 consumed:&v14 toEndChar:v9];
        goto LABEL_33;
      case '#':
        uint64_t v10 = [(IKCSSTokenizer *)self _consumeHash:a3 + 1 consumed:&v14];
        goto LABEL_33;
      case '$':
        uint64_t v10 = [(IKCSSTokenizer *)self _consumeDollar:a3 + 1 consumed:&v14];
        goto LABEL_33;
      case '(':
        objc_super v11 = [IKCSSToken alloc];
        uint64_t v12 = 8;
        goto LABEL_32;
      case ')':
        objc_super v11 = [IKCSSToken alloc];
        uint64_t v12 = 9;
        goto LABEL_32;
      case '*':
        uint64_t v10 = [(IKCSSTokenizer *)self _consumeAsterisk:a3 + 1 consumed:&v14];
        goto LABEL_33;
      case '+':
        uint64_t v10 = [(IKCSSTokenizer *)self _consumePlus:a3 + 1 consumed:&v14];
        goto LABEL_33;
      case ',':
        objc_super v11 = [IKCSSToken alloc];
        uint64_t v12 = 14;
        goto LABEL_32;
      case '-':
        uint64_t v10 = [(IKCSSTokenizer *)self _consumeMinus:a3 + 1 consumed:&v14];
        goto LABEL_33;
      case '.':
        uint64_t v10 = [(IKCSSTokenizer *)self _consumeDot:a3 + 1 consumed:&v14];
        goto LABEL_33;
      case '/':
        if ([(IKCSSTokenizer *)self _getChar:a3 + 1] == 42)
        {
          uint64_t v7 = [(IKCSSTokenizer *)self _consumeComment:a3 consumed:&v14];
          uint64_t v8 = 0;
          goto LABEL_35;
        }
        uint64_t v10 = [(IKCSSTokenizer *)self _consumeSlash:a3 + 1 consumed:&v14];
        break;
      case ':':
        objc_super v11 = [IKCSSToken alloc];
        uint64_t v12 = 21;
        goto LABEL_32;
      case ';':
        objc_super v11 = [IKCSSToken alloc];
        uint64_t v12 = 22;
        goto LABEL_32;
      case '<':
        uint64_t v10 = [(IKCSSTokenizer *)self _consumeLessThan:a3 + 1 consumed:&v14];
        goto LABEL_33;
      case '@':
        uint64_t v10 = [(IKCSSTokenizer *)self _consumeAt:a3 + 1 consumed:&v14];
        goto LABEL_33;
      default:
        goto LABEL_38;
    }
    goto LABEL_33;
  }
  switch((int)v9)
  {
    case '[':
      objc_super v11 = [IKCSSToken alloc];
      uint64_t v12 = 23;
      goto LABEL_32;
    case '\\':
      uint64_t v10 = [(IKCSSTokenizer *)self _consumeBackslash:a3 + 1 consumed:&v14];
      goto LABEL_33;
    case ']':
      objc_super v11 = [IKCSSToken alloc];
      uint64_t v12 = 24;
      goto LABEL_32;
    case '^':
      uint64_t v10 = [(IKCSSTokenizer *)self _consumeCaret:a3 + 1 consumed:&v14];
      goto LABEL_33;
    default:
      if (v9 == 123)
      {
        objc_super v11 = [IKCSSToken alloc];
        uint64_t v12 = 25;
        goto LABEL_32;
      }
      if (v9 == 125)
      {
        objc_super v11 = [IKCSSToken alloc];
        uint64_t v12 = 26;
LABEL_32:
        uint64_t v10 = [(IKCSSToken *)v11 initWithType:v12];
        goto LABEL_33;
      }
LABEL_38:
      if (+[IKCSSTokenizer isDigit:v9])
      {
        uint64_t v7 = [(IKCSSTokenizer *)self _consumeNumeric:a3 consumed:&v14];
        --v14;
        goto LABEL_34;
      }
      if (+[IKCSSTokenizer isNameStartCodePoint:v9])
      {
        uint64_t v10 = [(IKCSSTokenizer *)self _consumeNameStart:a3 + 1 consumed:&v14];
      }
      else if (v9 == 126)
      {
        uint64_t v10 = [(IKCSSTokenizer *)self _consumeTilde:a3 + 1 consumed:&v14];
      }
      else
      {
        if (v9 != 124)
        {
          uint64_t v7 = [[IKCSSToken alloc] initWithType:5];
          [(IKCSSToken *)v7 setCharValue:v9];
          goto LABEL_34;
        }
        uint64_t v10 = [(IKCSSTokenizer *)self _consumePipe:a3 + 1 consumed:&v14];
      }
LABEL_33:
      uint64_t v7 = (IKCSSToken *)v10;
LABEL_34:
      uint64_t v8 = 1;
LABEL_35:
      *a4 = v14 + v8;
      [(IKCSSToken *)v7 setRange:a3];
      return v7;
  }
}

- (BOOL)isEOF:(unint64_t)a3
{
  return self->textBytesCharCount <= a3;
}

- (unsigned)_getChar:(unint64_t)a3
{
  if (self->textBytesCharCount <= a3) {
    return 0;
  }
  else {
    return self->textBytes[a3];
  }
}

+ (BOOL)isWhitespace:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  objc_super v4 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  LOBYTE(v3) = [v4 characterIsMember:v3];

  return v3;
}

+ (BOOL)isNewline:(unsigned __int16)a3
{
  return a3 == 10 || (a3 & 0xFFFE) == 12;
}

+ (BOOL)isDigit:(unsigned __int16)a3
{
  return (a3 - 48) < 0xA;
}

+ (BOOL)isNonASCIICodePoint:(unsigned __int16)a3
{
  return a3 > 0x7Fu;
}

+ (BOOL)isUppercaseLetter:(unsigned __int16)a3
{
  return (a3 - 65) < 0x1A;
}

+ (BOOL)isLowercaseLetter:(unsigned __int16)a3
{
  return (a3 - 97) < 0x1A;
}

+ (BOOL)isLetter:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  if (+[IKCSSTokenizer isUppercaseLetter:](IKCSSTokenizer, "isUppercaseLetter:")) {
    return 1;
  }
  return +[IKCSSTokenizer isLowercaseLetter:v3];
}

+ (BOOL)isNameStartCodePoint:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  if (+[IKCSSTokenizer isLetter:](IKCSSTokenizer, "isLetter:")) {
    return 1;
  }
  BOOL result = +[IKCSSTokenizer isNonASCIICodePoint:v3];
  if (v3 == 95) {
    return 1;
  }
  return result;
}

+ (BOOL)isNameCodePoint:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  if (+[IKCSSTokenizer isNameStartCodePoint:](IKCSSTokenizer, "isNameStartCodePoint:")) {
    return 1;
  }
  BOOL result = +[IKCSSTokenizer isDigit:v3];
  if (v3 == 45) {
    return 1;
  }
  return result;
}

+ (BOOL)isHexDigit:(unsigned __int16)a3
{
  int v3 = a3;
  BOOL v4 = +[IKCSSTokenizer isDigit:](IKCSSTokenizer, "isDigit:");
  BOOL v5 = (v3 - 97) < 6;
  if (v4) {
    BOOL v5 = 1;
  }
  return (v3 - 65) < 6 || v5;
}

- (BOOL)isValidEscape:(unint64_t)a3
{
  unint64_t v5 = a3 + 1;
  if ([(IKCSSTokenizer *)self isEOF:a3 + 1] || [(IKCSSTokenizer *)self _getChar:a3] != 93) {
    return 0;
  }
  else {
    return !+[IKCSSTokenizer isNewline:[(IKCSSTokenizer *)self _getChar:v5]];
  }
}

+ (BOOL)isNonPrintable:(unsigned __int16)a3
{
  return a3 < 9u || a3 == 11 || (a3 - 14) < 0x12 || a3 == 127;
}

- (BOOL)wouldStartIdentifier:(unint64_t)a3
{
  uint64_t v5 = -[IKCSSTokenizer _getChar:](self, "_getChar:");
  if (v5 != 45)
  {
    int v8 = v5;
    return +[IKCSSTokenizer isNameStartCodePoint:v5]
        || v8 == 92 && [(IKCSSTokenizer *)self isValidEscape:a3];
  }
  unint64_t v6 = a3 + 1;
  if (+[IKCSSTokenizer isNameStartCodePoint:[(IKCSSTokenizer *)self _getChar:v6]])
  {
    return 1;
  }
  return [(IKCSSTokenizer *)self isValidEscape:v6];
}

- (BOOL)wouldStartNumber:(unint64_t)a3
{
  uint64_t v5 = -[IKCSSTokenizer _getChar:](self, "_getChar:");
  if (v5 == 43)
  {
LABEL_4:
    uint64_t v7 = [(IKCSSTokenizer *)self _getChar:a3 + 1];
    return +[IKCSSTokenizer isDigit:v7]
        || v7 == 46
        && +[IKCSSTokenizer isDigit:[(IKCSSTokenizer *)self _getChar:a3 + 2]];
  }
  uint64_t v6 = v5;
  if (v5 == 46)
  {
    uint64_t v6 = [(IKCSSTokenizer *)self _getChar:a3 + 1];
  }
  else if (v5 == 45)
  {
    goto LABEL_4;
  }
  return +[IKCSSTokenizer isDigit:v6];
}

- (unsigned)_consumeEscapedCodePoint:(unint64_t)a3 consumed:(unint64_t *)a4
{
  uint64_t v7 = -[IKCSSTokenizer _getChar:](self, "_getChar:");
  if (+[IKCSSTokenizer isHexDigit:v7])
  {
    int v8 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:&stru_1F3E09950];
    uint64_t v9 = 0;
    unint64_t v10 = 6;
    while (1)
    {
      uint64_t v11 = [(IKCSSTokenizer *)self _getChar:a3 + v9];
      if (!+[IKCSSTokenizer isHexDigit:v11]) {
        break;
      }
      objc_msgSend(v8, "appendFormat:", @"%C", v11);
      if (++v9 == 6) {
        goto LABEL_8;
      }
    }
    unint64_t v10 = v9 + +[IKCSSTokenizer isWhitespace:v11];
LABEL_8:
    int v14 = 0;
    uint64_t v12 = [MEMORY[0x1E4F28FE8] scannerWithString:v8];
    [v12 scanHexInt:&v14];
    LOWORD(v7) = v14;
  }
  else
  {
    unint64_t v10 = 1;
  }
  *a4 = v10;
  return v7;
}

- (id)_consumeName:(unint64_t)a3 consumed:(unint64_t *)a4
{
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:&stru_1F3E09950];
  unint64_t v8 = 0;
  if (![(IKCSSTokenizer *)self isEOF:a3])
  {
    unint64_t v9 = a3;
    do
    {
      uint64_t v10 = [(IKCSSTokenizer *)self _getChar:v9];
      if (+[IKCSSTokenizer isNameCodePoint:v10])
      {
        objc_msgSend(v7, "appendFormat:", @"%C", v10);
      }
      else
      {
        if (![(IKCSSTokenizer *)self isValidEscape:v9]) {
          break;
        }
        uint64_t v12 = 0;
        objc_msgSend(v7, "appendFormat:", @"%C", -[IKCSSTokenizer _consumeEscapedCodePoint:consumed:](self, "_consumeEscapedCodePoint:consumed:", a3 + 1, &v12));
        v8 += v12;
      }
      unint64_t v9 = ++v8 + a3;
    }
    while (![(IKCSSTokenizer *)self isEOF:v8 + a3]);
  }
  *a4 = v8;
  return v7;
}

- (id)_consumeHash:(unint64_t)a3 consumed:(unint64_t *)a4
{
  unint64_t v14 = 0;
  if (+[IKCSSTokenizer isNameCodePoint:](IKCSSTokenizer, "isNameCodePoint:", -[IKCSSTokenizer _getChar:](self, "_getChar:"))|| [(IKCSSTokenizer *)self isValidEscape:a3])
  {
    uint64_t v7 = [[IKCSSToken alloc] initWithType:6];
    if ([(IKCSSTokenizer *)self wouldStartIdentifier:a3])
    {
      unint64_t v8 = (void *)MEMORY[0x1E4F1CA60];
      unint64_t v9 = [(IKCSSToken *)v7 properties];
      uint64_t v10 = [v8 dictionaryWithDictionary:v9];

      [v10 setObject:@"id" forKey:@"typeFlag"];
      [(IKCSSToken *)v7 setProperties:v10];
    }
    uint64_t v11 = [(IKCSSTokenizer *)self _consumeName:a3 consumed:&v14];
    [(IKCSSToken *)v7 setStringValue:v11];

    unint64_t v12 = v14;
  }
  else
  {
    uint64_t v7 = [[IKCSSToken alloc] initWithType:5];
    [(IKCSSToken *)v7 setCharValue:35];
    unint64_t v12 = 0;
  }
  *a4 = v12;
  return v7;
}

- (id)_consumeDollar:(unint64_t)a3 consumed:(unint64_t *)a4
{
  int v5 = [(IKCSSTokenizer *)self _getChar:a3];
  uint64_t v6 = [IKCSSToken alloc];
  if (v5 == 61)
  {
    uint64_t v7 = [(IKCSSToken *)v6 initWithType:7];
    unint64_t v8 = 1;
  }
  else
  {
    uint64_t v7 = [(IKCSSToken *)v6 initWithType:5];
    [(IKCSSToken *)v7 setCharValue:36];
    unint64_t v8 = 0;
  }
  *a4 = v8;
  return v7;
}

- (id)_consumeAsterisk:(unint64_t)a3 consumed:(unint64_t *)a4
{
  int v5 = [(IKCSSTokenizer *)self _getChar:a3];
  uint64_t v6 = [IKCSSToken alloc];
  if (v5 == 61)
  {
    uint64_t v7 = [(IKCSSToken *)v6 initWithType:10];
    unint64_t v8 = 1;
  }
  else
  {
    uint64_t v7 = [(IKCSSToken *)v6 initWithType:5];
    [(IKCSSToken *)v7 setCharValue:42];
    unint64_t v8 = 0;
  }
  *a4 = v8;
  return v7;
}

- (id)_consumeCaret:(unint64_t)a3 consumed:(unint64_t *)a4
{
  int v5 = [(IKCSSTokenizer *)self _getChar:a3];
  uint64_t v6 = [IKCSSToken alloc];
  if (v5 == 61)
  {
    uint64_t v7 = [(IKCSSToken *)v6 initWithType:27];
    unint64_t v8 = 1;
  }
  else
  {
    uint64_t v7 = [(IKCSSToken *)v6 initWithType:5];
    [(IKCSSToken *)v7 setCharValue:94];
    unint64_t v8 = 0;
  }
  *a4 = v8;
  return v7;
}

- (id)_consumePipe:(unint64_t)a3 consumed:(unint64_t *)a4
{
  int v5 = [(IKCSSTokenizer *)self _getChar:a3];
  if (v5 == 124)
  {
    uint64_t v6 = [IKCSSToken alloc];
    uint64_t v7 = 31;
    goto LABEL_5;
  }
  if (v5 == 61)
  {
    uint64_t v6 = [IKCSSToken alloc];
    uint64_t v7 = 30;
LABEL_5:
    unint64_t v8 = [(IKCSSToken *)v6 initWithType:v7];
    unint64_t v9 = 1;
    goto LABEL_7;
  }
  unint64_t v8 = [[IKCSSToken alloc] initWithType:5];
  [(IKCSSToken *)v8 setCharValue:124];
  unint64_t v9 = 0;
LABEL_7:
  *a4 = v9;
  return v8;
}

- (id)_consumeTilde:(unint64_t)a3 consumed:(unint64_t *)a4
{
  int v5 = [(IKCSSTokenizer *)self _getChar:a3];
  uint64_t v6 = [IKCSSToken alloc];
  if (v5 == 61)
  {
    uint64_t v7 = [(IKCSSToken *)v6 initWithType:28];
    unint64_t v8 = 1;
  }
  else
  {
    uint64_t v7 = [(IKCSSToken *)v6 initWithType:5];
    [(IKCSSToken *)v7 setCharValue:126];
    unint64_t v8 = 0;
  }
  *a4 = v8;
  return v7;
}

- (id)_consumeLessThan:(unint64_t)a3 consumed:(unint64_t *)a4
{
  unint64_t v7 = a3 + 2;
  if ([(IKCSSTokenizer *)self isEOF:a3 + 2])
  {
    unint64_t v8 = [IKCSSToken alloc];
  }
  else
  {
    int v9 = [(IKCSSTokenizer *)self _getChar:a3];
    int v10 = [(IKCSSTokenizer *)self _getChar:a3 + 1];
    int v11 = [(IKCSSTokenizer *)self _getChar:v7];
    unint64_t v8 = [IKCSSToken alloc];
    if (v9 == 33 && v10 == 45 && v11 == 45)
    {
      unint64_t v12 = [(IKCSSToken *)v8 initWithType:16];
      unint64_t v13 = 3;
      goto LABEL_8;
    }
  }
  unint64_t v12 = [(IKCSSToken *)v8 initWithType:5];
  [(IKCSSToken *)v12 setCharValue:60];
  unint64_t v13 = 0;
LABEL_8:
  *a4 = v13;
  return v12;
}

- (id)_consumeAt:(unint64_t)a3 consumed:(unint64_t *)a4
{
  if (-[IKCSSTokenizer wouldStartIdentifier:](self, "wouldStartIdentifier:"))
  {
    unint64_t v11 = 0;
    unint64_t v7 = [(IKCSSTokenizer *)self _consumeName:a3 consumed:&v11];
    unint64_t v8 = v11;
    int v9 = [[IKCSSToken alloc] initWithType:29];
    [(IKCSSToken *)v9 setStringValue:v7];
  }
  else
  {
    int v9 = [[IKCSSToken alloc] initWithType:5];
    [(IKCSSToken *)v9 setCharValue:64];
    unint64_t v8 = 0;
  }
  *a4 = v8;
  return v9;
}

- (id)_consumeBackslash:(unint64_t)a3 consumed:(unint64_t *)a4
{
  if (-[IKCSSTokenizer isValidEscape:](self, "isValidEscape:"))
  {
    uint64_t v10 = 0;
    unint64_t v7 = [(IKCSSTokenizer *)self _consumeIdentLike:a3 - 1 consumed:&v10];
    unint64_t v8 = v10 - 1;
  }
  else
  {
    unint64_t v7 = [[IKCSSToken alloc] initWithType:5];
    [(IKCSSToken *)v7 setCharValue:92];
    unint64_t v8 = 0;
  }
  *a4 = v8;
  return v7;
}

- (id)_consumeUnicodeRange:(unint64_t)a3 consumed:(unint64_t *)a4
{
  *a4 = 0;
  return 0;
}

- (id)_consumeNameStart:(unint64_t)a3 consumed:(unint64_t *)a4
{
  uint64_t v7 = 0;
  int v5 = [(IKCSSTokenizer *)self _consumeIdentLike:a3 - 1 consumed:&v7];
  *a4 = v7 - 1;
  return v5;
}

- (id)_consumePlus:(unint64_t)a3 consumed:(unint64_t *)a4
{
  if (-[IKCSSTokenizer wouldStartNumber:](self, "wouldStartNumber:"))
  {
    uint64_t v10 = 0;
    uint64_t v7 = [(IKCSSTokenizer *)self _consumeNumeric:a3 - 1 consumed:&v10];
    unint64_t v8 = v10 - 1;
  }
  else
  {
    uint64_t v7 = [[IKCSSToken alloc] initWithType:5];
    [(IKCSSToken *)v7 setCharValue:43];
    unint64_t v8 = 0;
  }
  *a4 = v8;
  return v7;
}

- (id)_consumeMinus:(unint64_t)a3 consumed:(unint64_t *)a4
{
  if (-[IKCSSTokenizer wouldStartNumber:](self, "wouldStartNumber:"))
  {
    uint64_t v11 = 0;
    uint64_t v7 = [(IKCSSTokenizer *)self _consumeNumeric:a3 - 1 consumed:&v11];
  }
  else
  {
    if (![(IKCSSTokenizer *)self wouldStartIdentifier:a3])
    {
      if ([(IKCSSTokenizer *)self _getChar:a3] == 45
        && [(IKCSSTokenizer *)self _getChar:a3 + 1] == 62)
      {
        unint64_t v8 = [[IKCSSToken alloc] initWithType:15];
        unint64_t v9 = 2;
      }
      else
      {
        unint64_t v8 = [[IKCSSToken alloc] initWithType:5];
        [(IKCSSToken *)v8 setCharValue:45];
        unint64_t v9 = 0;
      }
      goto LABEL_6;
    }
    uint64_t v11 = 0;
    uint64_t v7 = [(IKCSSTokenizer *)self _consumeIdentLike:a3 - 1 consumed:&v11];
  }
  unint64_t v8 = (IKCSSToken *)v7;
  unint64_t v9 = v11 - 1;
LABEL_6:
  *a4 = v9;
  return v8;
}

- (id)_consumeIdentLike:(unint64_t)a3 consumed:(unint64_t *)a4
{
  unint64_t v15 = 0;
  uint64_t v7 = [(IKCSSTokenizer *)self _consumeName:a3 consumed:&v15];
  uint64_t v8 = [v7 caseInsensitiveCompare:@"url"];
  int v9 = [(IKCSSTokenizer *)self _getChar:v15 + a3];
  if (v8)
  {
    if (v9 == 40)
    {
      ++v15;
      uint64_t v10 = [IKCSSToken alloc];
      uint64_t v11 = 17;
    }
    else
    {
      uint64_t v10 = [IKCSSToken alloc];
      uint64_t v11 = 18;
    }
    unint64_t v12 = [(IKCSSToken *)v10 initWithType:v11];
    [(IKCSSToken *)v12 setStringValue:v7];
  }
  else if (v9 == 40)
  {
    uint64_t v14 = 0;
    unint64_t v12 = [(IKCSSTokenizer *)self _consumeUrl:++v15 + a3 consumed:&v14];
    v15 += v14;
  }
  else
  {
    unint64_t v12 = 0;
  }
  *a4 = v15;

  return v12;
}

- (void)_consumeBadUrlRemnants:(unint64_t)a3 consumed:(unint64_t *)a4
{
  unint64_t v7 = 0;
  if (!-[IKCSSTokenizer isEOF:](self, "isEOF:"))
  {
    unint64_t v8 = a3;
    do
    {
      ++v7;
      if ([(IKCSSTokenizer *)self _getChar:v8] == 41) {
        break;
      }
      unint64_t v8 = v7 + a3;
      if ([(IKCSSTokenizer *)self isValidEscape:v7 + a3])
      {
        uint64_t v9 = 0;
        [(IKCSSTokenizer *)self _consumeEscapedCodePoint:v7 + a3 consumed:&v9];
        v7 += v9;
        unint64_t v8 = v7 + a3;
      }
    }
    while (![(IKCSSTokenizer *)self isEOF:v8]);
  }
  *a4 = v7;
}

- (id)_consumeUrl:(unint64_t)a3 consumed:(unint64_t *)a4
{
  unint64_t v7 = [[IKCSSToken alloc] initWithType:19];
  unint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:&stru_1F3E09950];
  unint64_t v24 = 0;
  id v9 = [(IKCSSTokenizer *)self _consumeWhitespace:a3 consumed:&v24];
  BOOL v10 = [(IKCSSTokenizer *)self isEOF:v24 + a3];
  unint64_t v11 = v24;
  if (!v10)
  {
    uint64_t v12 = [(IKCSSTokenizer *)self _getChar:v24 + a3];
    if (v12 == 34 || v12 == 39)
    {
      uint64_t v23 = 0;
      unint64_t v13 = [(IKCSSTokenizer *)self _consumeString:++v24 + a3 consumed:&v23 toEndChar:v12];
      v24 += v23;
      if ([v13 type] == 4)
      {
        uint64_t v23 = 0;
        [(IKCSSTokenizer *)self _consumeBadUrlRemnants:v24 + a3 consumed:&v23];
        uint64_t v14 = v23;
      }
      else
      {
        v19 = [v13 stringValue];
        [v8 setString:v19];

        uint64_t v22 = 0;
        id v20 = [(IKCSSTokenizer *)self _consumeWhitespace:a3 consumed:&v22];
        v24 += v22;
        if ([(IKCSSTokenizer *)self _getChar:v24 + a3] == 41)
        {
          ++v24;
LABEL_28:

          goto LABEL_29;
        }
        uint64_t v22 = 0;
        [(IKCSSTokenizer *)self _consumeBadUrlRemnants:v24 + a3 consumed:&v22];
        uint64_t v14 = v22;
      }
      v24 += v14;
      [(IKCSSToken *)v7 setType:20];
      goto LABEL_28;
    }
    if ([(IKCSSTokenizer *)self isEOF:v24 + a3])
    {
LABEL_29:
      [(IKCSSToken *)v7 setStringValue:v8];
      unint64_t v11 = v24;
      goto LABEL_30;
    }
    while (1)
    {
      uint64_t v15 = [(IKCSSTokenizer *)self _getChar:v24 + a3];
      ++v24;
      if (v15 == 41) {
        goto LABEL_29;
      }
      uint64_t v16 = v15;
      if (+[IKCSSTokenizer isWhitespace:v15])
      {
        uint64_t v23 = 0;
        id v17 = [(IKCSSTokenizer *)self _consumeWhitespace:a3 consumed:&v23];
        v24 += v23;
        if ([(IKCSSTokenizer *)self isEOF:v24 + a3]) {
          goto LABEL_29;
        }
        if ([(IKCSSTokenizer *)self _getChar:v24 + a3] == 41)
        {
          ++v24;
          goto LABEL_29;
        }
      }
      else
      {
        BOOL v18 = v16 > 0x28 || ((1 << v16) & 0x18400000000) == 0;
        if (v18 && !+[IKCSSTokenizer isNonPrintable:v16])
        {
          if (v16 != 92)
          {
            objc_msgSend(v8, "appendFormat:", @"%C", v16);
            goto LABEL_17;
          }
          if ([(IKCSSTokenizer *)self isValidEscape:v24 + a3])
          {
            uint64_t v23 = 0;
            objc_msgSend(v8, "appendFormat:", @"%C", -[IKCSSTokenizer _consumeEscapedCodePoint:consumed:](self, "_consumeEscapedCodePoint:consumed:", v24 + a3, &v23));
            v24 += v23;
            goto LABEL_17;
          }
        }
      }
      uint64_t v23 = 0;
      [(IKCSSTokenizer *)self _consumeBadUrlRemnants:v24 + a3 consumed:&v23];
      v24 += v23;
      [(IKCSSToken *)v7 setType:20];
LABEL_17:
      if ([(IKCSSTokenizer *)self isEOF:v24 + a3]) {
        goto LABEL_29;
      }
    }
  }
LABEL_30:
  *a4 = v11;

  return v7;
}

- (id)_consumeDot:(unint64_t)a3 consumed:(unint64_t *)a4
{
  uint64_t v10 = 0;
  if (-[IKCSSTokenizer wouldStartNumber:](self, "wouldStartNumber:"))
  {
    unint64_t v7 = [(IKCSSTokenizer *)self _consumeNumeric:a3 - 1 consumed:&v10];
    unint64_t v8 = --v10;
  }
  else
  {
    unint64_t v7 = [[IKCSSToken alloc] initWithType:5];
    [(IKCSSToken *)v7 setCharValue:46];
    unint64_t v8 = 0;
  }
  *a4 = v8;
  return v7;
}

- (id)_consumeSlash:(unint64_t)a3 consumed:(unint64_t *)a4
{
  if (-[IKCSSTokenizer _getChar:](self, "_getChar:") == 42)
  {
    if ([(IKCSSTokenizer *)self isEOF:a3 + 1])
    {
      unint64_t v7 = 1;
LABEL_12:
      unint64_t v8 = [[IKCSSToken alloc] initWithType:2];
    }
    else
    {
      uint64_t v9 = 0;
      while (1)
      {
        if ([(IKCSSTokenizer *)self isEOF:a3 + v9 + 2])
        {
          unint64_t v7 = v9 + 2;
          goto LABEL_12;
        }
        int v10 = [(IKCSSTokenizer *)self _getChar:a3 + v9 + 1];
        int v11 = [(IKCSSTokenizer *)self _getChar:a3 + v9 + 2];
        if (v10 == 42 && v11 == 47) {
          break;
        }
        [(IKCSSTokenizer *)self _getChar:a3 + v9 + 1];
        if ([(IKCSSTokenizer *)self isEOF:a3 + v9++ + 2])
        {
          unint64_t v7 = v9 + 1;
          goto LABEL_12;
        }
      }
      uint64_t v14 = 0;
      unint64_t v8 = [(IKCSSTokenizer *)self _consumeToken:a3 + v9 + 3 consumed:&v14];
      unint64_t v7 = v14 + v9 + 3;
    }
  }
  else
  {
    unint64_t v8 = [[IKCSSToken alloc] initWithType:5];
    [(IKCSSToken *)v8 setCharValue:47];
    unint64_t v7 = 0;
  }
  *a4 = v7;
  return v8;
}

- (id)_consumeNumber:(unint64_t)a3 consumed:(unint64_t *)a4
{
  v30[3] = *MEMORY[0x1E4F143B8];
  unint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:&stru_1F3E09950];
  unsigned int v8 = [(IKCSSTokenizer *)self _getChar:a3];
  v29 = a4;
  if (v8 == 45 || v8 == 43)
  {
    objc_msgSend(v7, "appendFormat:", @"%C", v8);
    uint64_t v9 = 1;
  }
  else
  {
    uint64_t v9 = 0;
  }
  unint64_t v10 = v9 + a3;
  uint64_t v11 = [(IKCSSTokenizer *)self _getChar:v9 + a3];
  if (+[IKCSSTokenizer isDigit:v11])
  {
    do
    {
      objc_msgSend(v7, "appendFormat:", @"%C", (unsigned __int16)v11);
      uint64_t v11 = [(IKCSSTokenizer *)self _getChar:++v9 + a3];
    }
    while (+[IKCSSTokenizer isDigit:v11]);
    unint64_t v10 = a3 + v9;
  }
  int v12 = [(IKCSSTokenizer *)self _getChar:v10];
  uint64_t v13 = [(IKCSSTokenizer *)self _getChar:v10 + 1];
  if (v12 == 46 && (unsigned int v14 = v13, +[IKCSSTokenizer isDigit:v13]))
  {
    v9 += 2;
    objc_msgSend(v7, "appendFormat:", @"%C%C", 46, v14);
    unint64_t v10 = v9 + a3;
    uint64_t v15 = [(IKCSSTokenizer *)self _getChar:v9 + a3];
    if (+[IKCSSTokenizer isDigit:v15])
    {
      do
      {
        objc_msgSend(v7, "appendFormat:", @"%C", (unsigned __int16)v15);
        uint64_t v15 = [(IKCSSTokenizer *)self _getChar:++v9 + a3];
      }
      while (+[IKCSSTokenizer isDigit:v15]);
      unint64_t v10 = a3 + v9;
    }
    uint64_t v16 = @"number";
  }
  else
  {
    uint64_t v16 = @"integer";
  }
  uint64_t v17 = [(IKCSSTokenizer *)self _getChar:v10];
  unint64_t v18 = v10 + 1;
  unsigned int v19 = [(IKCSSTokenizer *)self _getChar:v10 + 1];
  unsigned int v20 = [(IKCSSTokenizer *)self _getChar:v10 + 2];
  if ((v17 & 0xFFFFFFDF) == 0x45)
  {
    unsigned int v21 = v20;
    BOOL v22 = v19 == 43 || v19 == 45;
    uint64_t v23 = v22 ? v18 + 1 : v18;
    if (+[IKCSSTokenizer isDigit:[(IKCSSTokenizer *)self _getChar:v23]])
    {
      objc_msgSend(v7, "appendFormat:", @"%C%C", v17, v19);
      if (v19 == 45 || v19 == 43)
      {
        objc_msgSend(v7, "appendFormat:", @"%C", v21);
        v9 += 3;
      }
      else
      {
        v9 += 2;
      }
      uint64_t v24 = [(IKCSSTokenizer *)self _getChar:v9 + a3];
      if (+[IKCSSTokenizer isDigit:v24])
      {
        uint64_t v16 = @"number";
        do
        {
          uint64_t v25 = v9;
          objc_msgSend(v7, "appendFormat:", @"%C", (unsigned __int16)v24);
          ++v9;
          uint64_t v24 = [(IKCSSTokenizer *)self _getChar:a3 + 1 + v25];
        }
        while (+[IKCSSTokenizer isDigit:v24]);
      }
      else
      {
        uint64_t v16 = @"number";
      }
    }
  }
  unint64_t *v29 = v9;
  [v7 doubleValue];
  v30[0] = v7;
  v26 = objc_msgSend(NSNumber, "numberWithDouble:");
  v30[1] = v26;
  v30[2] = v16;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:3];

  return v27;
}

- (id)_consumeNumeric:(unint64_t)a3 consumed:(unint64_t *)a4
{
  unint64_t v21 = 0;
  unint64_t v7 = [(IKCSSTokenizer *)self _consumeNumber:a3 consumed:&v21];
  unsigned int v8 = [[IKCSSToken alloc] initWithType:11];
  uint64_t v9 = (void *)MEMORY[0x1E4F1CA60];
  unint64_t v10 = [(IKCSSToken *)v8 properties];
  uint64_t v11 = [v9 dictionaryWithDictionary:v10];

  int v12 = [v7 objectAtIndex:0];
  [v11 setObject:v12 forKey:@"repr"];

  uint64_t v13 = [v7 objectAtIndex:1];
  [v11 setObject:v13 forKey:@"value"];

  unsigned int v14 = [v7 objectAtIndex:2];
  [v11 setObject:v14 forKey:@"typeFlag"];

  uint64_t v15 = [v7 objectAtIndex:1];
  [v15 doubleValue];
  -[IKCSSToken setDoubleValue:](v8, "setDoubleValue:");

  if ([(IKCSSTokenizer *)self wouldStartIdentifier:v21 + a3])
  {
    uint64_t v20 = 0;
    uint64_t v16 = [(IKCSSTokenizer *)self _consumeName:v21 + a3 consumed:&v20];
    v21 += v20;
    [v11 setObject:v16 forKey:@"unit"];
  }
  else
  {
    if ([(IKCSSTokenizer *)self _getChar:v21 + a3] == 37)
    {
      ++v21;
      uint64_t v17 = v8;
      uint64_t v18 = 12;
    }
    else
    {
      uint64_t v17 = v8;
      uint64_t v18 = 13;
    }
    [(IKCSSToken *)v17 setType:v18];
  }
  [(IKCSSToken *)v8 setProperties:v11];
  *a4 = v21;

  return v8;
}

- (id)_consumeWhitespace:(unint64_t)a3 consumed:(unint64_t *)a4
{
  unint64_t v7 = [[IKCSSToken alloc] initWithType:1];
  unint64_t v8 = 0;
  do
  {
    unint64_t v9 = v8;
    unint64_t v10 = a3 + v8;
    if ([(IKCSSTokenizer *)self isEOF:a3 + v8]) {
      break;
    }
    uint64_t v11 = [(IKCSSTokenizer *)self _getChar:v10];
    int v12 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    LOBYTE(v11) = [v12 characterIsMember:v11];

    unint64_t v8 = v9 + 1;
  }
  while ((v11 & 1) != 0);
  *a4 = v9;
  return v7;
}

- (id)_consumeString:(unint64_t)a3 consumed:(unint64_t *)a4 toEndChar:(unsigned __int16)a5
{
  int v5 = a5;
  unint64_t v8 = [[IKCSSToken alloc] initWithType:3];
  unint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:&stru_1F3E09950];
  if ([(IKCSSTokenizer *)self isEOF:a3])
  {
    unint64_t v10 = 0;
  }
  else
  {
    unint64_t v12 = 0;
    unint64_t v13 = a3;
    do
    {
      uint64_t v14 = [(IKCSSTokenizer *)self _getChar:v13];
      unint64_t v10 = v12 + 1;
      if (v14 == v5) {
        break;
      }
      uint64_t v15 = v14;
      if (+[IKCSSTokenizer isNewline:v14])
      {
        [(IKCSSToken *)v8 setType:4];
        unint64_t v10 = v12;
        goto LABEL_4;
      }
      if (v15 == 92)
      {
        if (![(IKCSSTokenizer *)self isEOF:v10 + a3])
        {
          if (+[IKCSSTokenizer isNewline:[(IKCSSTokenizer *)self _getChar:v10 + a3]])
          {
            unint64_t v10 = v12 + 2;
          }
          else
          {
            uint64_t v18 = 0;
            unsigned int v16 = [(IKCSSTokenizer *)self _consumeEscapedCodePoint:v10 + a3 consumed:&v18];
            v10 += v18;
            objc_msgSend(v9, "appendFormat:", @"%C", v16);
          }
        }
      }
      else
      {
        objc_msgSend(v9, "appendFormat:", @"%C", v15);
      }
      unint64_t v13 = v10 + a3;
      unint64_t v12 = v10;
    }
    while (![(IKCSSTokenizer *)self isEOF:v10 + a3]);
  }
  [(IKCSSToken *)v8 setStringValue:v9];
LABEL_4:
  *a4 = v10;

  return v8;
}

- (id)_consumeComment:(unint64_t)a3 consumed:(unint64_t *)a4
{
  unint64_t v7 = [[IKCSSToken alloc] initWithType:32];
  unint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:&stru_1F3E09950];
  uint64_t v9 = 0;
  if (![(IKCSSTokenizer *)self isEOF:a3])
  {
    while (1)
    {
      unsigned int v10 = [(IKCSSTokenizer *)self _getChar:a3 + v9];
      int v11 = [(IKCSSTokenizer *)self _getChar:a3 + v9 + 1];
      if (v10 == 42 && v11 == 47) {
        break;
      }
      objc_msgSend(v8, "appendFormat:", @"%C", v10);
      if ([(IKCSSTokenizer *)self isEOF:a3 + v9++ + 1]) {
        goto LABEL_7;
      }
    }
    v9 += 2;
    [v8 appendString:@"*/"];
  }
LABEL_7:
  [(IKCSSToken *)v7 setStringValue:v8];
  *a4 = v9;

  return v7;
}

- (IKCSSToken)currentToken
{
  return self->_currentToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentToken, 0);
  objc_storeStrong((id *)&self->reconsumeToken, 0);
}

@end