@interface CBEditableTableCell
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (CBEditableTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (int64_t)characterLimit;
- (void)setCharacterLimit:(int64_t)a3;
@end

@implementation CBEditableTableCell

- (CBEditableTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)CBEditableTableCell;
  result = [(CBEditableTableCell *)&v6 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  if (result) {
    result->_characterLimit = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  NSUInteger v11 = length + location;
  v12 = [v9 text];
  id v13 = [v12 length];

  if (v11 <= (unint64_t)v13)
  {
    v15 = [v9 text];
    v16 = (char *)[v15 length];
    v17 = &v16[(void)[v10 length] - length];

    BOOL v14 = (uint64_t)v17 <= [(CBEditableTableCell *)self characterLimit];
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (int64_t)characterLimit
{
  return self->_characterLimit;
}

- (void)setCharacterLimit:(int64_t)a3
{
  self->_characterLimit = a3;
}

@end