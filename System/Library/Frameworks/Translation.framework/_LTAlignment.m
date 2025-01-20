@interface _LTAlignment
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldTranslate;
- (NSDictionary)sourceAttributes;
- (NSString)identifier;
- (NSString)text;
- (_LTAlignment)initWithCoder:(id)a3;
- (_NSRange)sourceRange;
- (_NSRange)targetRange;
- (id)jsonRepresentation;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setShouldTranslate:(BOOL)a3;
- (void)setSourceAttributes:(id)a3;
- (void)setSourceRange:(_NSRange)a3;
- (void)setTargetRange:(_NSRange)a3;
- (void)setText:(id)a3;
@end

@implementation _LTAlignment

- (id)jsonRepresentation
{
  v19[3] = *MEMORY[0x263EF8340];
  v18[0] = @"identifier";
  uint64_t v3 = [(_LTAlignment *)self identifier];
  v4 = (void *)v3;
  v5 = @"<no value>";
  if (v3) {
    v5 = (__CFString *)v3;
  }
  v19[0] = v5;
  v18[1] = @"text";
  uint64_t v6 = [(_LTAlignment *)self text];
  v7 = (void *)v6;
  v8 = &stru_26FAADE68;
  if (v6) {
    v8 = (__CFString *)v6;
  }
  v19[1] = v8;
  v18[2] = @"targetRange";
  v16[0] = @"start";
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_LTAlignment targetRange](self, "targetRange"));
  v16[1] = @"length";
  v17[0] = v9;
  v10 = NSNumber;
  [(_LTAlignment *)self targetRange];
  v12 = [v10 numberWithUnsignedInteger:v11];
  v17[1] = v12;
  v13 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
  v19[2] = v13;
  v14 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", self->_sourceRange.location, self->_sourceRange.length);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v7 forKey:@"sourceRange"];
  uint64_t v6 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", self->_targetRange.location, self->_targetRange.length);
  [v5 encodeObject:v6 forKey:@"targetRange"];
  [v5 encodeObject:self->_text forKey:@"text"];
  [v5 encodeBool:self->_shouldTranslate forKey:@"shouldTranslate"];
}

- (_LTAlignment)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_LTAlignment;
  id v5 = [(_LTAlignment *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceRange"];
    v5->_sourceRange.location = [v8 rangeValue];
    v5->_sourceRange.length = v9;
    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"targetRange"];
    v5->_targetRange.location = [v10 rangeValue];
    v5->_targetRange.length = v11;
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"text"];
    text = v5->_text;
    v5->_text = (NSString *)v12;

    v5->_shouldTranslate = [v4 decodeBoolForKey:@"shouldTranslate"];
    v14 = v5;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_LTAlignment *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      identifier = self->_identifier;
      id v7 = [(_LTAlignment *)v5 identifier];
      if ([(NSString *)identifier isEqualToString:v7])
      {
        text = self->_text;
        NSUInteger v9 = [(_LTAlignment *)v5 text];
        if ([(NSString *)text isEqualToString:v9])
        {
          BOOL v11 = 0;
          if (self->_sourceRange.location == [(_LTAlignment *)v5 sourceRange]
            && self->_sourceRange.length == v10)
          {
            BOOL v11 = 0;
            if (self->_targetRange.location == [(_LTAlignment *)v5 targetRange]
              && self->_targetRange.length == v12)
            {
              BOOL shouldTranslate = self->_shouldTranslate;
              BOOL v11 = shouldTranslate == [(_LTAlignment *)v5 shouldTranslate];
            }
          }
        }
        else
        {
          BOOL v11 = 0;
        }
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
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

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (BOOL)shouldTranslate
{
  return self->_shouldTranslate;
}

- (void)setShouldTranslate:(BOOL)a3
{
  self->_BOOL shouldTranslate = a3;
}

- (NSDictionary)sourceAttributes
{
  return self->_sourceAttributes;
}

- (void)setSourceAttributes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceAttributes, 0);
  objc_storeStrong((id *)&self->_text, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end