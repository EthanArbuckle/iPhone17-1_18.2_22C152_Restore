@interface BRLTScriptString
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToScriptString:(id)a3;
- (BRLTScriptString)init;
- (BRLTScriptString)initWithString:(id)a3 selection:(_NSRange)a4;
- (BRLTScriptString)initWithString:(id)a3 selection:(_NSRange)a4 focus:(_NSRange)a5 token:(unint64_t)a6;
- (BRLTTextFormattingRanges)textFormattingRanges;
- (NSMutableArray)tokenRanges;
- (NSString)string;
- (_NSRange)_backwardEditingAtomForCursorLocation:(unint64_t)a3 isBreak:(BOOL *)a4;
- (_NSRange)_backwardEditingAtomForSelection:(_NSRange)a3 isBreak:(BOOL *)a4;
- (_NSRange)backwardEditingAtom;
- (_NSRange)deleteMergeAtom;
- (_NSRange)focus;
- (_NSRange)forwardEditingAtom;
- (_NSRange)forwardEditingAtomForCursorLocation:(unint64_t)a3;
- (_NSRange)selection;
- (_NSRange)suggestionRange;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)addString:(id)a3 selection:(_NSRange)a4 focus:(_NSRange)a5 token:(unint64_t)a6;
- (void)setSuggestionRange:(_NSRange)a3;
- (void)setTextFormattingRanges:(id)a3;
- (void)setTokenRanges:(id)a3;
@end

@implementation BRLTScriptString

- (BRLTScriptString)init
{
  return -[BRLTScriptString initWithString:selection:](self, "initWithString:selection:", &stru_26CCBD108, 0x7FFFFFFFFFFFFFFFLL, 0);
}

- (BRLTScriptString)initWithString:(id)a3 selection:(_NSRange)a4
{
  return -[BRLTScriptString initWithString:selection:focus:token:](self, "initWithString:selection:focus:token:", a3, a4.location, a4.length, 0x7FFFFFFFFFFFFFFFLL, 0, 0);
}

- (BRLTScriptString)initWithString:(id)a3 selection:(_NSRange)a4 focus:(_NSRange)a5 token:(unint64_t)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  NSUInteger v9 = a4.length;
  NSUInteger v10 = a4.location;
  id v12 = a3;
  v22.receiver = self;
  v22.super_class = (Class)BRLTScriptString;
  v13 = [(BRLTScriptString *)&v22 init];
  uint64_t v14 = [v12 copy];
  string = v13->_string;
  v13->_string = (NSString *)v14;

  uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v16 = v10;
    if (v10 > [v12 length]) {
      uint64_t v16 = [v12 length];
    }
    if (v16 + v9 > [v12 length]) {
      NSUInteger v9 = [v12 length] - v16;
    }
  }
  v13->_selection.NSUInteger location = v16;
  v13->_selection.NSUInteger length = v9;
  v13->_focus.NSUInteger location = location;
  v13->_focus.NSUInteger length = length;
  v13->_suggestionRange = (_NSRange)xmmword_21C58CB40;
  v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  tokenRanges = v13->_tokenRanges;
  v13->_tokenRanges = v17;

  v19 = v13->_tokenRanges;
  v20 = -[BRLTTokenRange initWithRange:token:]([BRLTTokenRange alloc], "initWithRange:token:", 0, [(NSString *)v13->_string length], a6);
  [(NSMutableArray *)v19 addObject:v20];

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = -[BRLTScriptString initWithString:selection:]([BRLTScriptString alloc], "initWithString:selection:", &stru_26CCBD108, 0x7FFFFFFFFFFFFFFFLL, 0);
  uint64_t v5 = [(NSString *)self->_string copy];
  string = v4->_string;
  v4->_string = (NSString *)v5;

  v4->_selection = self->_selection;
  v4->_focus = self->_focus;
  v4->_suggestionRange = self->_suggestionRange;
  uint64_t v7 = [(NSMutableArray *)self->_tokenRanges mutableCopy];
  tokenRanges = v4->_tokenRanges;
  v4->_tokenRanges = (NSMutableArray *)v7;

  uint64_t v9 = [(BRLTTextFormattingRanges *)self->_textFormattingRanges copy];
  textFormattingRanges = v4->_textFormattingRanges;
  v4->_textFormattingRanges = (BRLTTextFormattingRanges *)v9;

  return v4;
}

- (void)addString:(id)a3 selection:(_NSRange)a4 focus:(_NSRange)a5 token:(unint64_t)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  NSUInteger v9 = a4.length;
  NSUInteger v10 = a4.location;
  id v16 = a3;
  tokenRanges = self->_tokenRanges;
  v13 = -[BRLTTokenRange initWithRange:token:]([BRLTTokenRange alloc], "initWithRange:token:", -[NSString length](self->_string, "length"), [v16 length], a6);
  [(NSMutableArray *)tokenRanges addObject:v13];

  if (location != 0x7FFFFFFFFFFFFFFFLL && length)
  {
    self->_focus.NSUInteger location = [(NSString *)self->_string length] + location;
    self->_focus.NSUInteger length = length;
  }
  uint64_t v14 = [(NSString *)self->_string stringByAppendingString:v16];
  string = self->_string;
  self->_string = v14;

  -[BRLTScriptString _addSelectionRange:](self, "_addSelectionRange:", v10, v9);
}

- (BOOL)isEqualToScriptString:(id)a3
{
  v4 = a3;
  uint64_t v5 = v4;
  if (!v4)
  {
LABEL_18:
    LOBYTE(v13) = 1;
    goto LABEL_19;
  }
  if (self->_selection.location == v4[4]
    && self->_selection.length == v4[5]
    && self->_suggestionRange.location == v4[8]
    && self->_suggestionRange.length == v4[9])
  {
    v8 = [v4 string];
    int v9 = [v8 isEqualToString:self->_string];

    if (v9)
    {
      NSUInteger v10 = [v5 textFormattingRanges];
      v11 = v10;
      if (v10 == self->_textFormattingRanges)
      {
      }
      else
      {
        id v12 = [v5 textFormattingRanges];
        int v13 = [v12 isEqual:self->_textFormattingRanges];

        if (!v13) {
          goto LABEL_19;
        }
      }
      goto LABEL_18;
    }
  }
  LOBYTE(v13) = 0;
LABEL_19:

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (BRLTScriptString *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(BRLTScriptString *)self isEqualToScriptString:v4];
  }

  return v5;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BRLTScriptString;
  v4 = [(BRLTScriptString *)&v8 description];
  BOOL v5 = [(NSString *)self->_string description];
  v6 = [v3 stringWithFormat:@"%@: string<%@>, range<%ld, %ld>", v4, v5, self->_selection.location, self->_selection.length];

  return v6;
}

- (_NSRange)_backwardEditingAtomForSelection:(_NSRange)a3 isBreak:(BOOL *)a4
{
  v6.NSUInteger location = [(BRLTScriptString *)self _backwardEditingAtomForCursorLocation:a3.location isBreak:a4];
  v6.NSUInteger length = v5;
  NSUInteger location = self->_selection.location;
  NSUInteger v8 = 0x7FFFFFFFFFFFFFFFLL;
  if (v6.location == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (location != 0x7FFFFFFFFFFFFFFFLL)
    {
      NSUInteger length = self->_selection.length;
      if (length | location) {
        NSUInteger v8 = self->_selection.location;
      }
      else {
        NSUInteger v8 = 0x7FFFFFFFFFFFFFFFLL;
      }
      if (length | location) {
        v6.NSUInteger length = self->_selection.length;
      }
    }
  }
  else
  {
    NSUInteger v8 = v6.location;
    if (location != 0x7FFFFFFFFFFFFFFFLL)
    {
      NSRange v10 = NSUnionRange(self->_selection, v6);
      NSUInteger v8 = v10.location;
      v6.NSUInteger length = v10.length;
    }
  }
  NSUInteger v11 = v6.length;
  result.NSUInteger length = v11;
  result.NSUInteger location = v8;
  return result;
}

- (_NSRange)_backwardEditingAtomForCursorLocation:(unint64_t)a3 isBreak:(BOOL *)a4
{
  unint64_t v5 = a3;
  if (a4) {
    *a4 = 0;
  }
  NSUInteger v7 = 0;
  if (a3)
  {
    NSUInteger v8 = 0;
    if (a3 != 0x7FFFFFFFFFFFFFFFLL)
    {
      int v9 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
      NSUInteger v10 = [(NSString *)self->_string length];
      NSUInteger v11 = [(NSString *)self->_string substringFromIndex:v5];
      uint64_t v12 = [v11 rangeOfCharacterFromSet:v9];
      int v13 = [(NSString *)self->_string substringToIndex:v5];
      uint64_t v14 = [v13 rangeOfCharacterFromSet:v9 options:4];
      if (v14 == 0x7FFFFFFFFFFFFFFFLL)
      {
        NSUInteger v7 = 0;
      }
      else
      {
        NSUInteger v7 = v14 + v15;
        if (v14 + v15 == [v13 length])
        {
          NSUInteger v7 = v5 - 1;
          if (a4) {
            *a4 = 1;
          }
          goto LABEL_14;
        }
      }
      if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
        unint64_t v5 = v10;
      }
      else {
        v5 += v12;
      }
LABEL_14:
      NSUInteger v8 = v5 - v7;
    }
  }
  else
  {
    NSUInteger v8 = 0;
  }
  NSUInteger v16 = v7;
  NSUInteger v17 = v8;
  result.NSUInteger length = v17;
  result.NSUInteger location = v16;
  return result;
}

- (_NSRange)deleteMergeAtom
{
  NSUInteger location = self->_selection.location;
  if (location >= 2
    && ((NSUInteger v4 = self->_selection.length, [(BRLTScriptString *)self backwardEditingAtom], v5 > 1)
     || ([(BRLTScriptString *)self forwardEditingAtom], v6))
    && (char v14 = 0,
        uint64_t v7 = -[BRLTScriptString _backwardEditingAtomForSelection:isBreak:](self, "_backwardEditingAtomForSelection:isBreak:", location - 1, v4, &v14), !v14))
  {
    NSUInteger v11 = v7;
    NSUInteger v12 = v8;
    v15.NSUInteger location = [(BRLTScriptString *)self forwardEditingAtom];
    v17.NSUInteger location = v11;
    v17.NSUInteger length = v12;
    NSRange v13 = NSUnionRange(v15, v17);
    NSUInteger length = v13.length;
    uint64_t v9 = v13.location;
  }
  else
  {
    uint64_t v9 = [(BRLTScriptString *)self backwardEditingAtom];
  }
  result.NSUInteger length = length;
  result.NSUInteger location = v9;
  return result;
}

- (_NSRange)backwardEditingAtom
{
  NSUInteger v2 = -[BRLTScriptString _backwardEditingAtomForSelection:isBreak:](self, "_backwardEditingAtomForSelection:isBreak:", self->_selection.location, self->_selection.length, 0);
  result.NSUInteger length = v3;
  result.NSUInteger location = v2;
  return result;
}

- (_NSRange)forwardEditingAtom
{
  selection.NSUInteger location = [(BRLTScriptString *)self forwardEditingAtomForCursorLocation:self->_selection.location];
  selection.NSUInteger length = v4.length;
  v4.NSUInteger location = self->_selection.location;
  if (selection.location == 0x7FFFFFFFFFFFFFFFLL)
  {
    selection.NSUInteger location = 0x7FFFFFFFFFFFFFFFLL;
    if (v4.location != 0x7FFFFFFFFFFFFFFFLL) {
      NSRange selection = self->_selection;
    }
  }
  else if (v4.location != 0x7FFFFFFFFFFFFFFFLL)
  {
    v4.NSUInteger length = self->_selection.length;
    NSRange selection = NSUnionRange(v4, selection);
  }
  NSUInteger location = selection.location;
  NSUInteger length = selection.length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (_NSRange)forwardEditingAtomForCursorLocation:(unint64_t)a3
{
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v4 = a3;
    uint64_t v6 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    NSUInteger v7 = [(NSString *)self->_string length];
    NSUInteger v8 = [(NSString *)self->_string substringFromIndex:v4];
    uint64_t v9 = [v8 rangeOfCharacterFromSet:v6];
    NSUInteger v10 = [(NSString *)self->_string substringToIndex:v4];
    uint64_t v11 = [v10 rangeOfCharacterFromSet:v6 options:4];
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v9) {
        BOOL v13 = 0;
      }
      else {
        BOOL v13 = v11 + v12 == v4;
      }
      if (v13)
      {
        NSUInteger v7 = v4;
LABEL_12:
        NSUInteger v3 = v7 - v4;

        goto LABEL_13;
      }
      NSUInteger v7 = v9 + v4;
    }
    if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v4 = 0;
    }
    else {
      unint64_t v4 = v11 + v12;
    }
    goto LABEL_12;
  }
  NSUInteger v3 = 0;
  unint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_13:
  NSUInteger v14 = v4;
  NSUInteger v15 = v3;
  result.NSUInteger length = v15;
  result.NSUInteger location = v14;
  return result;
}

- (NSString)string
{
  return self->_string;
}

- (_NSRange)selection
{
  NSUInteger length = self->_selection.length;
  NSUInteger location = self->_selection.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (_NSRange)focus
{
  NSUInteger length = self->_focus.length;
  NSUInteger location = self->_focus.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (BRLTTextFormattingRanges)textFormattingRanges
{
  return self->_textFormattingRanges;
}

- (void)setTextFormattingRanges:(id)a3
{
}

- (_NSRange)suggestionRange
{
  NSUInteger length = self->_suggestionRange.length;
  NSUInteger location = self->_suggestionRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setSuggestionRange:(_NSRange)a3
{
  self->_suggestionRange = a3;
}

- (NSMutableArray)tokenRanges
{
  return self->_tokenRanges;
}

- (void)setTokenRanges:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenRanges, 0);
  objc_storeStrong((id *)&self->_textFormattingRanges, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end