@interface BRLTBrailleBuffer
- (BRLTBrailleBuffer)init;
- (BRLTBrailleBuffer)initWithBrailleString:(id)a3;
- (BRLTBrailleString)brailleString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)cursor;
- (void)deleteBrailleChar;
- (void)insertBrailleChar:(id)a3;
- (void)insertBrailleChar:(id)a3 modifiers:(id)a4 inputMode:(unint64_t)a5;
- (void)setCursor:(unint64_t)a3;
@end

@implementation BRLTBrailleBuffer

- (BRLTBrailleBuffer)init
{
  return [(BRLTBrailleBuffer *)self initWithBrailleString:0];
}

- (BRLTBrailleBuffer)initWithBrailleString:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRLTBrailleBuffer;
  v5 = [(BRLTBrailleBuffer *)&v9 init];
  if (v4) {
    v6 = (BRLTBrailleString *)[v4 copy];
  }
  else {
    v6 = objc_alloc_init(BRLTBrailleString);
  }
  brailleString = v5->_brailleString;
  v5->_brailleString = v6;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithBrailleString:", self->_brailleString);
  *((void *)result + 2) = self->_cursor;
  return result;
}

- (void)insertBrailleChar:(id)a3
{
}

- (void)insertBrailleChar:(id)a3 modifiers:(id)a4 inputMode:(unint64_t)a5
{
  id v17 = a3;
  brailleString = self->_brailleString;
  id v9 = a4;
  v10 = [(BRLTBrailleString *)brailleString brailleChars];
  v11 = (void *)[v10 mutableCopy];

  v12 = [NSNumber numberWithUnsignedInt:8];
  int v13 = [v9 containsObject:v12];

  if (!v13) {
    goto LABEL_4;
  }
  if (a5 == 2)
  {
    [v17 setDot7:1];
LABEL_4:
    [v11 insertObject:v17 atIndex:self->_cursor];
    goto LABEL_6;
  }
  v14 = [[BRLTBrailleChar alloc] initWithUnicode:@"⠠"];
  [v11 insertObject:v17 atIndex:self->_cursor];
  [v11 insertObject:v14 atIndex:self->_cursor++];

LABEL_6:
  v15 = [[BRLTBrailleString alloc] initWithBrailleChars:v11];
  v16 = self->_brailleString;
  self->_brailleString = v15;

  ++self->_cursor;
}

- (void)deleteBrailleChar
{
  v3 = [(BRLTBrailleString *)self->_brailleString brailleChars];
  id v7 = (id)[v3 mutableCopy];

  if ([v7 count])
  {
    unint64_t cursor = self->_cursor;
    if (cursor)
    {
      [v7 removeObjectAtIndex:cursor - 1];
      v5 = [[BRLTBrailleString alloc] initWithBrailleChars:v7];
      brailleString = self->_brailleString;
      self->_brailleString = v5;

      --self->_cursor;
    }
  }
}

- (BRLTBrailleString)brailleString
{
  v2 = (void *)[(BRLTBrailleString *)self->_brailleString copy];
  return (BRLTBrailleString *)v2;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BRLTBrailleBuffer;
  id v4 = [(BRLTBrailleBuffer *)&v8 description];
  v5 = [(BRLTBrailleString *)self->_brailleString description];
  v6 = [v3 stringWithFormat:@"%@: string<%@>, cursor<%ld>", v4, v5, self->_cursor];

  return v6;
}

- (unint64_t)cursor
{
  return self->_cursor;
}

- (void)setCursor:(unint64_t)a3
{
  self->_unint64_t cursor = a3;
}

- (void).cxx_destruct
{
}

@end