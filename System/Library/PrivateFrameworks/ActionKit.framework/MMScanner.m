@interface MMScanner
+ (id)scannerWithString:(id)a3;
+ (id)scannerWithString:(id)a3 lineRanges:(id)a4;
- (BOOL)atBeginningOfLine;
- (BOOL)atEndOfLine;
- (BOOL)atEndOfString;
- (BOOL)matchString:(id)a3;
- (MMScanner)initWithString:(id)a3;
- (MMScanner)initWithString:(id)a3 lineRanges:(id)a4;
- (NSArray)lineRanges;
- (NSMutableArray)transactions;
- (NSString)string;
- (_NSRange)currentLineRange;
- (_NSRange)currentRange;
- (id)_lineRangesForString:(id)a3;
- (id)nextWord;
- (id)nextWordWithCharactersFromSet:(id)a3;
- (id)previousWord;
- (id)previousWordWithCharactersFromSet:(id)a3;
- (unint64_t)_locationOfCharacter:(unsigned __int16)a3 inRange:(_NSRange)a4;
- (unint64_t)rangeIndex;
- (unint64_t)skipCharactersFromSet:(id)a3;
- (unint64_t)skipCharactersFromSet:(id)a3 max:(unint64_t)a4;
- (unint64_t)skipEmptyLines;
- (unint64_t)skipIndentationUpTo:(unint64_t)a3;
- (unint64_t)skipNestedBracketsWithDelimiter:(unsigned __int16)a3;
- (unint64_t)skipToEndOfLine;
- (unint64_t)skipToLastCharacterOfLine;
- (unint64_t)skipWhitespace;
- (unint64_t)skipWhitespaceAndNewlines;
- (unint64_t)startLocation;
- (unsigned)nextCharacter;
- (unsigned)previousCharacter;
- (void)advance;
- (void)advanceToNextLine;
- (void)beginTransaction;
- (void)commitTransaction:(BOOL)a3;
- (void)setCurrentRange:(_NSRange)a3;
- (void)setLocation:(unint64_t)a3;
- (void)setRangeIndex:(unint64_t)a3;
- (void)setStartLocation:(unint64_t)a3;
@end

@implementation MMScanner

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactions, 0);
  objc_storeStrong((id *)&self->_lineRanges, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

- (NSMutableArray)transactions
{
  return self->_transactions;
}

- (void)setRangeIndex:(unint64_t)a3
{
  self->_rangeIndex = a3;
}

- (unint64_t)rangeIndex
{
  return self->_rangeIndex;
}

- (void)setCurrentRange:(_NSRange)a3
{
  self->_currentRange = a3;
}

- (_NSRange)currentRange
{
  NSUInteger length = self->_currentRange.length;
  NSUInteger location = self->_currentRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setStartLocation:(unint64_t)a3
{
  self->_startLocation = a3;
}

- (unint64_t)startLocation
{
  return self->_startLocation;
}

- (NSArray)lineRanges
{
  return self->_lineRanges;
}

- (NSString)string
{
  return self->_string;
}

- (_NSRange)currentLineRange
{
  v3 = [(MMScanner *)self lineRanges];
  v4 = objc_msgSend(v3, "objectAtIndexedSubscript:", -[MMScanner rangeIndex](self, "rangeIndex"));
  uint64_t v5 = [v4 rangeValue];
  NSUInteger v7 = v6;

  NSUInteger v8 = v5;
  NSUInteger v9 = v7;
  result.NSUInteger length = v9;
  result.NSUInteger location = v8;
  return result;
}

- (unint64_t)_locationOfCharacter:(unsigned __int16)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  unsigned __int16 v12 = a3;
  NSUInteger v7 = [NSString stringWithCharacters:&v12 length:1];
  NSUInteger v8 = [MEMORY[0x263F08708] characterSetWithCharactersInString:v7];
  NSUInteger v9 = [(MMScanner *)self string];
  unint64_t v10 = objc_msgSend(v9, "rangeOfCharacterFromSet:options:range:", v8, 0, location, length);

  return v10;
}

- (id)_lineRangesForString:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x263EFF980] array];
  if ([v3 length])
  {
    unint64_t v5 = 0;
    unint64_t v6 = 0;
    do
    {
      int v7 = [v3 characterAtIndex:v5];
      int v8 = v7;
      if (v7 == 10 || v7 == 13)
      {
        NSUInteger v9 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v6, v5 - v6);
        [v4 addObject:v9];

        if (v8 == 13
          && v5 + 1 < [v3 length]
          && [v3 characterAtIndex:v5 + 1] == 10)
        {
          ++v5;
        }
        unint64_t v6 = ++v5;
      }
      else
      {
        ++v5;
      }
    }
    while (v5 < [v3 length]);
  }
  else
  {
    unint64_t v6 = 0;
  }
  if (v6 < [v3 length])
  {
    uint64_t v10 = [v3 length];
    v11 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v6, v10 - v6);
    [v4 addObject:v11];
  }
  return v4;
}

- (void)setLocation:(unint64_t)a3
{
  unint64_t v5 = [(MMScanner *)self currentLineRange];
  if (a3 < v5 || a3 - v5 >= v6)
  {
    uint64_t v11 = 0;
    unsigned __int16 v12 = &v11;
    uint64_t v13 = 0x2020000000;
    uint64_t v14 = 0;
    int v7 = [(MMScanner *)self lineRanges];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __25__MMScanner_setLocation___block_invoke;
    v10[3] = &unk_264E59C70;
    v10[4] = &v11;
    v10[5] = a3;
    [v7 enumerateObjectsUsingBlock:v10];

    [(MMScanner *)self setRangeIndex:v12[3]];
    _Block_object_dispose(&v11, 8);
  }
  uint64_t v8 = [(MMScanner *)self currentLineRange];
  -[MMScanner setCurrentRange:](self, "setCurrentRange:", a3, v9 - a3 + v8);
}

unint64_t __25__MMScanner_setLocation___block_invoke(uint64_t a1, void *a2, uint64_t a3, char *a4)
{
  unint64_t result = [a2 rangeValue];
  unint64_t v9 = *(void *)(a1 + 40);
  BOOL v10 = v9 == result + v8;
  BOOL v12 = v9 >= result;
  unint64_t v11 = v9 - result;
  BOOL v12 = !v12 || v11 >= v8;
  char v13 = !v12 || v10;
  *a4 = v13;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
  return result;
}

- (unint64_t)skipWhitespaceAndNewlines
{
  id v3 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  unint64_t v4 = 0;
  if (![(MMScanner *)self atEndOfString])
  {
    do
    {
      if ([(MMScanner *)self atEndOfLine])
      {
        [(MMScanner *)self advanceToNextLine];
        ++v4;
      }
      else
      {
        unint64_t v5 = [(MMScanner *)self skipCharactersFromSet:v3];
        v4 += v5;
        if (!v5) {
          break;
        }
      }
    }
    while (![(MMScanner *)self atEndOfString]);
  }

  return v4;
}

- (unint64_t)skipWhitespace
{
  id v3 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  unint64_t v4 = [(MMScanner *)self skipCharactersFromSet:v3];

  return v4;
}

- (unint64_t)skipToLastCharacterOfLine
{
  [(MMScanner *)self currentRange];
  unint64_t v4 = v3 - 1;
  uint64_t v5 = [(MMScanner *)self currentRange];
  [(MMScanner *)self setLocation:v6 + v5 - 1];
  return v4;
}

- (unint64_t)skipToEndOfLine
{
  [(MMScanner *)self currentRange];
  unint64_t v4 = v3;
  uint64_t v5 = [(MMScanner *)self currentRange];
  [(MMScanner *)self setLocation:v5 + v6];
  return v4;
}

- (unint64_t)skipNestedBracketsWithDelimiter:(unsigned __int16)a3
{
  char v4 = a3 - 40;
  if ((a3 - 40) <= 0x35)
  {
    if (((1 << v4) & 3) != 0)
    {
      uint64_t v5 = @"()";
      goto LABEL_12;
    }
    if (((1 << v4) & 0x500000) != 0)
    {
      uint64_t v5 = @"<>";
      goto LABEL_12;
    }
    if (((1 << v4) & 0x28000000000000) != 0)
    {
      uint64_t v5 = @"[]";
      goto LABEL_12;
    }
  }
  if (a3 == 123 || a3 == 125)
  {
    uint64_t v5 = @"{}";
  }
  else
  {
    objc_msgSend(MEMORY[0x263EFF940], "raise:format:", @"Invalid delimiter character", @"Character '%C' is not a valid delimiter", a3);
    uint64_t v5 = 0;
  }
LABEL_12:
  int v6 = [(__CFString *)v5 characterAtIndex:0];
  int v7 = [(__CFString *)v5 characterAtIndex:1];
  unint64_t v8 = 0;
  if ([(MMScanner *)self nextCharacter] == v6)
  {
    [(MMScanner *)self beginTransaction];
    unint64_t v9 = [(MMScanner *)self location];
    [(MMScanner *)self advance];
    BOOL v10 = [NSString stringWithFormat:@"%@\\"", v5];
    unint64_t v11 = [MEMORY[0x263F08708] characterSetWithCharactersInString:v10];
    BOOL v12 = [v11 invertedSet];

    uint64_t v13 = 1;
    while (![(MMScanner *)self atEndOfLine])
    {
      [(MMScanner *)self skipCharactersFromSet:v12];
      int v14 = [(MMScanner *)self nextCharacter];
      [(MMScanner *)self advance];
      if (v14 == v6)
      {
        ++v13;
      }
      else if (v14 == v7)
      {
        --v13;
      }
      else if (v14 == 92)
      {
        [(MMScanner *)self advance];
      }
      if (!v13)
      {
        [(MMScanner *)self commitTransaction:1];
        unint64_t v8 = [(MMScanner *)self location] - v9;
        goto LABEL_24;
      }
    }
    [(MMScanner *)self commitTransaction:0];
    unint64_t v8 = 0;
LABEL_24:
  }
  return v8;
}

- (unint64_t)skipIndentationUpTo:(unint64_t)a3
{
  [(MMScanner *)self beginTransaction];
  unint64_t v5 = 0;
  if (![(MMScanner *)self atEndOfLine] && a3)
  {
    unint64_t v5 = 0;
    do
    {
      int v6 = [(MMScanner *)self nextCharacter];
      if (v6 == 9)
      {
        unint64_t v5 = (v5 & 0xFFFFFFFFFFFFFFFCLL) + 4;
      }
      else
      {
        if (v6 != 32) {
          break;
        }
        ++v5;
      }
      [(MMScanner *)self advance];
    }
    while (![(MMScanner *)self atEndOfLine] && v5 < a3);
  }
  [(MMScanner *)self commitTransaction:v5 <= a3];
  return v5;
}

- (unint64_t)skipEmptyLines
{
  unint64_t v3 = 0;
  if (![(MMScanner *)self atEndOfString])
  {
    while (1)
    {
      [(MMScanner *)self beginTransaction];
      [(MMScanner *)self skipWhitespace];
      if (![(MMScanner *)self atEndOfLine]) {
        break;
      }
      [(MMScanner *)self commitTransaction:1];
      [(MMScanner *)self advanceToNextLine];
      ++v3;
      if ([(MMScanner *)self atEndOfString]) {
        return v3;
      }
    }
    [(MMScanner *)self commitTransaction:0];
  }
  return v3;
}

- (unint64_t)skipCharactersFromSet:(id)a3 max:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v7 = 0;
  if (a4)
  {
    while (objc_msgSend(v6, "characterIsMember:", -[MMScanner nextCharacter](self, "nextCharacter")))
    {
      [(MMScanner *)self advance];
      if (a4 == ++v7)
      {
        unint64_t v7 = a4;
        break;
      }
    }
  }

  return v7;
}

- (unint64_t)skipCharactersFromSet:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MMScanner *)self currentRange];
  uint64_t v7 = v6;
  unint64_t v8 = [(MMScanner *)self string];
  unint64_t v9 = [v4 invertedSet];

  uint64_t v10 = objc_msgSend(v8, "rangeOfCharacterFromSet:options:range:", v9, 0, v5, v7);
  unint64_t v11 = [(MMScanner *)self location];
  uint64_t v12 = [(MMScanner *)self currentRange];
  if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v14 = v12 + v13;
  }
  else {
    uint64_t v14 = v10;
  }
  if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v15 = 0;
  }
  else {
    uint64_t v15 = v13 - v10 + v12;
  }
  -[MMScanner setCurrentRange:](self, "setCurrentRange:", v14, v15);
  return [(MMScanner *)self location] - v11;
}

- (BOOL)matchString:(id)a3
{
  id v4 = a3;
  [(MMScanner *)self currentRange];
  if (v5 >= [v4 length])
  {
    unint64_t v7 = [(MMScanner *)self location];
    if (![v4 length])
    {
LABEL_7:
      -[MMScanner setLocation:](self, "setLocation:", -[MMScanner location](self, "location") + [v4 length]);
      BOOL v6 = 1;
      goto LABEL_8;
    }
    uint64_t v8 = 0;
    while (1)
    {
      int v9 = [v4 characterAtIndex:v8];
      uint64_t v10 = [(MMScanner *)self string];
      int v11 = [v10 characterAtIndex:v7 + v8];

      if (v9 != v11) {
        break;
      }
      if (++v8 >= (unint64_t)[v4 length]) {
        goto LABEL_7;
      }
    }
  }
  BOOL v6 = 0;
LABEL_8:

  return v6;
}

- (void)advanceToNextLine
{
  unint64_t v3 = [(MMScanner *)self rangeIndex];
  id v4 = [(MMScanner *)self lineRanges];
  uint64_t v5 = [v4 count] - 1;

  if (v3 == v5)
  {
    uint64_t v6 = [(MMScanner *)self currentLineRange];
    [(MMScanner *)self setLocation:v6 + v7];
  }
  else
  {
    [(MMScanner *)self setRangeIndex:[(MMScanner *)self rangeIndex] + 1];
    uint64_t v9 = [(MMScanner *)self currentLineRange];
    -[MMScanner setCurrentRange:](self, "setCurrentRange:", v9, v8);
  }
}

- (void)advance
{
  if (![(MMScanner *)self atEndOfLine])
  {
    unint64_t v3 = [(MMScanner *)self location] + 1;
    [(MMScanner *)self setLocation:v3];
  }
}

- (id)nextWordWithCharactersFromSet:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MMScanner *)self string];
  uint64_t v6 = [v4 invertedSet];

  uint64_t v7 = [(MMScanner *)self currentRange];
  uint64_t v9 = objc_msgSend(v5, "rangeOfCharacterFromSet:options:range:", v6, 0, v7, v8);

  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v10 = [(MMScanner *)self string];
    uint64_t v11 = [(MMScanner *)self currentRange];
    uint64_t v12 = v10;
    uint64_t v14 = v13;
  }
  else
  {
    uint64_t v15 = [(MMScanner *)self currentRange];
    uint64_t v16 = v9 - v15;
    uint64_t v12 = [(MMScanner *)self string];
    uint64_t v10 = v12;
    uint64_t v11 = v15;
    uint64_t v14 = v16;
  }
  v17 = objc_msgSend(v12, "substringWithRange:", v11, v14);

  return v17;
}

- (id)previousWordWithCharactersFromSet:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(MMScanner *)self currentLineRange];
  unint64_t v6 = [(MMScanner *)self startLocation];
  if (v5 <= v6) {
    unint64_t v5 = v6;
  }
  uint64_t v7 = [(MMScanner *)self currentRange];
  uint64_t v8 = v7 - v5;
  uint64_t v9 = [(MMScanner *)self string];
  uint64_t v10 = [v4 invertedSet];

  uint64_t v11 = objc_msgSend(v9, "rangeOfCharacterFromSet:options:range:", v10, 4, v5, v7 - v5);
  uint64_t v13 = v12;

  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v5 = v11 + v13;
    uint64_t v8 = v7 - (v11 + v13);
  }
  uint64_t v14 = [(MMScanner *)self string];
  uint64_t v15 = objc_msgSend(v14, "substringWithRange:", v5, v8);

  return v15;
}

- (id)nextWord
{
  unint64_t v3 = [MEMORY[0x263F08708] alphanumericCharacterSet];
  id v4 = [(MMScanner *)self nextWordWithCharactersFromSet:v3];

  return v4;
}

- (id)previousWord
{
  unint64_t v3 = [MEMORY[0x263F08708] alphanumericCharacterSet];
  id v4 = [(MMScanner *)self previousWordWithCharactersFromSet:v3];

  return v4;
}

- (unsigned)nextCharacter
{
  if ([(MMScanner *)self atEndOfLine]) {
    return 10;
  }
  id v4 = [(MMScanner *)self string];
  unsigned __int16 v5 = objc_msgSend(v4, "characterAtIndex:", -[MMScanner location](self, "location"));

  return v5;
}

- (unsigned)previousCharacter
{
  if ([(MMScanner *)self atBeginningOfLine]) {
    return 0;
  }
  id v4 = [(MMScanner *)self string];
  unsigned __int16 v5 = objc_msgSend(v4, "characterAtIndex:", -[MMScanner location](self, "location") - 1);

  return v5;
}

- (BOOL)atEndOfString
{
  if (![(MMScanner *)self atEndOfLine]) {
    return 0;
  }
  unint64_t v3 = [(MMScanner *)self rangeIndex];
  id v4 = [(MMScanner *)self lineRanges];
  BOOL v5 = v3 == [v4 count] - 1;

  return v5;
}

- (BOOL)atEndOfLine
{
  unint64_t v3 = [(MMScanner *)self location];
  uint64_t v4 = [(MMScanner *)self currentLineRange];
  return v3 == v4 + v5;
}

- (BOOL)atBeginningOfLine
{
  unint64_t v3 = [(MMScanner *)self location];
  return v3 == [(MMScanner *)self currentLineRange];
}

- (void)commitTransaction:(BOOL)a3
{
  uint64_t v5 = [(MMScanner *)self transactions];
  uint64_t v6 = [v5 count];

  if (!v6) {
    [MEMORY[0x263EFF940] raise:@"Transaction underflow" format:@"Could not commit transaction because the stack is empty"];
  }
  uint64_t v7 = [(MMScanner *)self transactions];
  id v12 = [v7 lastObject];

  uint64_t v8 = [(MMScanner *)self transactions];
  [v8 removeLastObject];

  uint64_t v9 = [v12 objectForKey:@"startLocation"];
  -[MMScanner setStartLocation:](self, "setStartLocation:", [v9 unsignedIntegerValue]);

  if (!a3)
  {
    uint64_t v10 = [v12 objectForKey:@"rangeIndex"];
    -[MMScanner setRangeIndex:](self, "setRangeIndex:", [v10 unsignedIntegerValue]);

    uint64_t v11 = [v12 objectForKey:@"location"];
    -[MMScanner setLocation:](self, "setLocation:", [v11 unsignedIntegerValue]);
  }
}

- (void)beginTransaction
{
  v9[3] = *MEMORY[0x263EF8340];
  v8[0] = @"rangeIndex";
  unint64_t v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MMScanner rangeIndex](self, "rangeIndex"));
  v9[0] = v3;
  v8[1] = @"location";
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MMScanner location](self, "location"));
  v9[1] = v4;
  v8[2] = @"startLocation";
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MMScanner startLocation](self, "startLocation"));
  v9[2] = v5;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3];

  uint64_t v7 = [(MMScanner *)self transactions];
  [v7 addObject:v6];

  [(MMScanner *)self setStartLocation:[(MMScanner *)self location]];
}

- (MMScanner)initWithString:(id)a3 lineRanges:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (![v9 count])
  {
    v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"MMScanner.m", 83, @"Invalid parameter not satisfying: %@", @"theLineRanges.count > 0" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)MMScanner;
  uint64_t v10 = [(MMScanner *)&v18 init];
  uint64_t v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_string, a3);
    objc_storeStrong((id *)&v11->_lineRanges, a4);
    v11->_rangeIndex = 0;
    uint64_t v12 = objc_opt_new();
    transactions = v11->_transactions;
    v11->_transactions = (NSMutableArray *)v12;

    [(MMScanner *)v11 setStartLocation:0];
    uint64_t v14 = [(MMScanner *)v11 currentLineRange];
    -[MMScanner setCurrentRange:](v11, "setCurrentRange:", v14, v15);
  }

  return v11;
}

- (MMScanner)initWithString:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MMScanner *)self _lineRangesForString:v4];
  uint64_t v6 = [(MMScanner *)self initWithString:v4 lineRanges:v5];

  return v6;
}

+ (id)scannerWithString:(id)a3 lineRanges:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithString:v6 lineRanges:v5];

  return v7;
}

+ (id)scannerWithString:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithString:v3];

  return v4;
}

@end